package jemu.system.cpc;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jemu.core.device.floppy.*;

/**
 * Provides a CPC Magic DSK Image, connected to a folder.
 * 
 * Patches :
 * CPC.java : fdc.getDrive(1).setDisc(Drive.BOTH_HEADS,new MagicCPCDiscImage());
 * UPD765A.java : writeSectorByte() : drive.notifyWriteSectorByte((byte)data, params[1], params[2], params[3], params[4]);
 * UPD765A.java : readSectorByte()  : drive.notifyReadSectorByte(params[1], params[2], params[3], params[4]);
 * 
 * 
 * Test sequences :
 * 
 * |b
 * cat
 * 10 print"t
 * save"t.bas
 * cat
 * => 1Ko
 * run"t.bas
 */
public class MagicCPCDiscImage extends DiscImage {
	
	// FIXME : I think it is about 2 by here. (see teaForTwo patch)
	private final static int MACGYVER=1;
	
	String path="D:\\Users\\frup64427\\Desktop\\mecasharkV0\\jemu-code-52\\JEMU\\magic";
//	String path = "C:\\workspaceLWJGL\\JEMU_CPC\\magic";

	int[][][][] ids;
	byte[][][][] sectors;
	int lastCylinder = 79;
	int headMask = 1;

	

	/** Creates a new instance of CPCDiscImage */
	public MagicCPCDiscImage() {
		super("MagicCPCDiscImage");
		createSectorStructure();
		listDir();
	}

	public static final int SECTS = 9; // = data[offs + 0x15] & 0xff;
	public static final int CYLS = 40; // x28
	public static final int HEADS = 1;

	private void createSectorStructure() {
		ids = new int[2][80][0][];
		sectors = new byte[2][80][][];
		for (int cyl = 0; cyl < CYLS; cyl++) {
			for (int head = 0; head < HEADS; head++) {

				ids[head][cyl] = new int[SECTS][4];
				sectors[head][cyl] = new byte[SECTS][];
				for (int sect = 0; sect < SECTS; sect++) {
					int[] sectId = ids[head][cyl][sect];
					sectId[0] = cyl; // C
					sectId[1] = 0; // H
					sectId[2] = 0xC1 + sect; // R
					sectId[3] = 0x02; // N
					int size = sectorSize(sectId[3]);
					byte[] sectData = sectors[head][cyl][sect] = new byte[size];
					for (int i = 0; i < size; i++)
						sectData[i] = (byte) 0xe5;
				}
			}
		}
	}
	private void resetSectorContent() {
		byte empty[] = new byte[512];
		for (int j = 0; j < 512; j++) {
			empty[j] = (byte) 0xE5;
		}
		System.arraycopy(empty, 0, sectors[0][0][0], 0, 512);
		System.arraycopy(empty, 0, sectors[0][0][1], 0, 512);
		System.arraycopy(empty, 0, sectors[0][0][2], 0, 512);
		System.arraycopy(empty, 0, sectors[0][0][3], 0, 512);
	}

	HashMap<String, File> dirContent = new HashMap<String, File>();
	List<String> dirContentKeys = new ArrayList<String>();

	private void listDir() {
		dirContent.clear();
		dirContentKeys.clear();
		int ii = 0;
		int noSect = 0;
		try {
			File folder = new File(path);
			if (folder.isDirectory()) {
				for (File sf : folder.listFiles()) {
					if (sf.isDirectory()) continue; // ignore directories
					String name = sf.getName().toUpperCase();
					if (name.contains(".")) {
						int point = name.indexOf(".");
						String filename = name.substring(0, point);
						filename = filename + "        ";
						filename = filename.substring(0, 8);
						String extension = name.substring(point + 1,
								name.length());
						extension = extension + "   ";
						extension = extension.substring(0, 3);

						name = filename + extension;
					} else {
						name = name + "        " + "   ";
						name = name.substring(0, 8 + 3);
					}
					System.out.println("#DIR : "+name);
					dirContent.put(name, sf);
					dirContentKeys.add(name);

				}

			}
			resetSectorContent();
			byte line[] = new byte[32];
			for (int j = 0; j < 32; j++) {
				line[j] = 0x00;
			}

			byte empty[] = new byte[512];
			for (int j = 0; j < 512; j++) {
				empty[j] = (byte) 0xE5;
			}

			int i = 0;
			// file content pointer (from DIRSTRUCT)
			byte writeNoSect = 0x02; // +1 do a step about 1024Ko ?
			// file content
			int writeH = 0;
			int writeC = 0;
			int writeR = 4;
			
			boolean teaForTwo=false; 

			for (String name : dirContentKeys) {
				noSect = i / 16; // 0x1800 / 0x20
				if (noSect >= 4) {
					//FIXME : throw ERROR FILE DIR STRUCT TOO BIG !
					break;
				}
				ii = i % 16;
				byte[] sectData = sectors[0][0][noSect];

					File f = dirContent.get(name);
					double l = f.length();
					System.out.println("DIR : "+name);
					try  {
						byte[] selectedFileContent = new byte[512];
						FileInputStream fis = new FileInputStream(f);
						while (fis.read(selectedFileContent) > 0) {
							System.arraycopy(selectedFileContent, 0,
									sectors[writeH][writeC][writeR], 0, 512);
							teaForTwo=!teaForTwo;
							writeR++;
							if (writeR >= SECTS) {
								writeR = 0;
								writeC++;
								if (writeC >= CYLS) {
									break;
								}
							}
							
							System.arraycopy(empty, 0, selectedFileContent, 0, 512);
						}
						if (teaForTwo) {
							teaForTwo=!teaForTwo;
							writeR++;
							if (writeR >= 9) {
								writeR = 0;
								writeC++;
								if (writeC >= CYLS) {
									break;
								}
							}
						}
						fis.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					// a file of 64Kb filled with x"20" (space chat) : 65536bytes

					int m = (int) Math.ceil(l / (MACGYVER*16.0 * 1024.0));

					for (int n = 0; n < m; n++) {

						noSect = (i + n) / 16;
						
						if (noSect >= 4) {
							//FIXME : throw ERROR FILE DIR STRUCT TOO BIG !
							break;
						}
						
						ii = (i + n) % 16;
						sectData = sectors[0][0][noSect];

						System.arraycopy(line, 0, sectData, ii * 0x20, 32);
						System.arraycopy(name.getBytes(), 0, sectData,
								ii * 0x20 + 1, 8 + 3);

						if (n == m - 1) {
							// byte count in the last sector pointed.
							int mEnd = ((int) l) % (16 * 1024);
							// 16*1024 => 0x80
							// mEnd=> ?

							byte value = (byte) (mEnd * 0x80 / (16 * 1024) + 1);
							sectData[ii * 0x20 + 1 + 8 + 3 + 3] = value;

							// 16*1024 => 16
							// mEnd => ?
							for (int k = 0; k < Math.ceil(mEnd / 512.0); k++) {
								// <16KB of different sector IDs
								sectData[ii * 0x20 + 16 + k] = writeNoSect; // 0x02;
								writeNoSect++;
							}
						} else {
							sectData[ii * 0x20 + 1 + 8 + 3 + 3] = (byte) 0x80;
							for (int k = 1 + 8 + 3 + 4; k < 32; k++) {
								// 16KB of different sector IDs
								sectData[ii * 0x20 + k] = writeNoSect;
								writeNoSect++;
							}

						}
						// "first add"
						sectData[(ii) * 0x20 + 1 + 8 + 3] = (byte) n;
					}
					i += m;
					
//					
//					// do separate packets
//					
//					writeR++;
//					if (writeR >= 9) {
//						writeR = 0;
//						writeC++;
//						if (writeC >= CYLS) {
//							break;
//						}
//					}
//					writeNoSect++;
					
					//FIXME : if (writeNoSect>SOMETHING) throw ERROR FILE CONTENT OUT OF RANGE (FILE CONTENT TOO BIG !)
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected static int sectorSize(int n) {
		return n > 5 ? 0x1800 : 0x80 << n;
	}

	protected int getSectorIndex(int[][] ids, int c, int h, int r, int n) {
		for (int i = 0; i < ids.length; i++) {
			int[] id = ids[i];
			if (id[0] == c && id[1] == h && id[2] == r && id[3] == n)
				return i;
		}
		return -1;
	}

	public byte[] readSector(int cylinder, int head, int c, int h, int r, int n) {
		head &= headMask;
		byte[] result = null;
		if (cylinder <= lastCylinder) {
			int index = getSectorIndex(ids[head][cylinder], c, h, r, n);
			if (index != -1)
				result = sectors[head][cylinder][index];
		}
		return result;
	}

	public int[] getSectorID(int cylinder, int head, int index) {
		return ids[head & headMask][cylinder][index];
	}

	public int getSectorCount(int cylinder, int head) {
		return cylinder > lastCylinder ? 0
				: ids[head & headMask][cylinder].length;
	}

	boolean isData = false;
	boolean isDrop = false;
	List<String> scanNames = new ArrayList<String>();
	List<Byte> buffer = new ArrayList<Byte>();
	int cursorWrite = 0;

	@Override
	public void notifyWriteSector(byte data, int cylinder, int head, int c,
			int h, int r, int n) {
		head &= headMask;
		byte[] result = null;
		if (cylinder <= lastCylinder) {
			int index = getSectorIndex(ids[head][cylinder], c, h, r, n);
			if (index != -1) {
				result = sectors[head][cylinder][index];

				if (head == 0 && cylinder == 0 && index < 4) {
					if (isData) {
						cursorWrite = 0;
						scanNames.clear();
						isData = false;
					}
					if (cursorWrite == 512 - 1) {
						for (int i = 0; i < result.length / 32; i++) {
							byte[] filename = new byte[8 + 3];
							System.arraycopy(result, i * 0x20 + 1, filename, 0,
									8 + 3);
							if (result[i * 0x20] != -27
									&& filename[8 + 3 - 1] != -27) {
								if (filename[8 + 3 - 1] == '$') {
									// save"toto.bas" does create a toto.$$$ temporary file.
									cursorWrite++;
									if (cursorWrite == 512) {
										cursorWrite = 0;
									}
									return;
								}
								String s = "";
								for (int j = 0; j < 8 + 3; j++) {
									s += (char) filename[j];
								}
								if (!scanNames.contains(s)) scanNames.add(s);
								if (!dirContentKeys.contains(s)) {
									dirContentKeys.add(s);
									// save"toto.txt"
									System.out.println("DROPPING file " + s);
									int size = result[i * 0x20 + 1 + 8 + 3 + 3] * 0x80;
									// TODO : check storing files with larger filesize
									// TEST : save"image",b,&c000,&4000
									//Brain : int size = (result[i * 0x20 + 1 + 8 + 3 + 3] * 0x80)&0x0FFFF;
									//Brain : if (size < 0) size = 0-size;
									System.out.println("Size :"
											+ result[i * 0x20 + 1 + 8 + 3 + 3]
											+ " = " + size + " bytes");
									System.out.println("Content size :"
											+ buffer.size());
									File f = new File(path + "\\" + s);
									try {
										if (f.createNewFile()) {
											byte[] buff = new byte[size];
											for (int b = 0; b < Math.min(
													buff.length, buffer.size()); b++) {
												buff[b] = buffer.get(b);
											}
											FileOutputStream fos = new FileOutputStream(
													f, true);
											fos.write(buff);
											fos.flush();
											fos.close();
										}
										dirContent.put(s,f);
									} catch (Exception e) {
										e.printStackTrace();
									}
									isDrop = true;
									scanNames.clear();
								}
							}
	
						}
						
					}
				} else {
					// writing on data area
					if (!isData) {
						cursorWrite = 0;
						buffer.clear();
						isData = true;
					}
					buffer.add(data);
				}
			}

		}
		cursorWrite++;
		if (cursorWrite == 512) {
			cursorWrite = 0;
		}
	}

	@Override
	public void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r,
			int n) {
		head &= headMask;
		if (cylinder <= lastCylinder) {
			int index = getSectorIndex(ids[head][cylinder], c, h, r, n);
			if (index != -1) {
				if (beginOfSector && index <4) {
					if (isDrop) {
						listDir();
						isDrop=false;
					}
				}
			}
		}
		
	}

}
