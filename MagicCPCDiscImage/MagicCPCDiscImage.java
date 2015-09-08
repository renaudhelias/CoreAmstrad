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
 *
 * save"file",p => protected file, with '*' in cat
 * 
 */
public class MagicCPCDiscImage extends DiscImage {
	
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
					throw new MagicCPCDiscImageException(MagicCPCDiscImageException.FILE_STRUCTDIR_TOO_BIG);
				}
				ii = i % 16;
				byte[] sectData = sectors[0][0][noSect];

					File f = dirContent.get(name);
					long fileLength = f.length();
					System.out.println("DIR : "+name);
					
					// SAMPLE 180.DSK : fileSize=x49 (73), displayed : 
					// 16bits listing "sectors" : 02 03 04 05 06 07 08 09 0A 0B 00 00 00 00 00 00
					// So One full DIREntry equals 10Kb 
					// A full DIREntry has size x80 (128)
					// 16Kb=> 128
					// 1Kb   => 8 increments
					// 1025b => 8 increments
					//  128b => 1 increment
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

					long m = fileLength / (16 * 1024); // number of this file DIREntry
					long mm = fileLength % (16 * 1024); // data referenced by last DIREntry (if not a full data DIREntry)
					if (mm>0) {
						m++; // last block does include the last not full-sized packet.
					}
					for (int n = 0; n < m; n++) {

						noSect = (i + n) / 16;
						
						if (noSect >= 4) {
							throw new MagicCPCDiscImageException(MagicCPCDiscImageException.FILE_STRUCTDIR_TOO_BIG);
						}
						
						ii = (i + n) % 16;
						sectData = sectors[0][0][noSect];

						System.arraycopy(line, 0, sectData, ii * 0x20, 32);
						System.arraycopy(name.getBytes(), 0, sectData,
								ii * 0x20 + 1, 8 + 3);

						if (n == m - 1 && mm > 0) {
							// mm : byte count in the last sector pointed.
							long mmm=mm/128;
							long mmmm=mm%128;
							if (mmmm>0) {
								mmm++; // last small bytes are also on it.
							}
							sectData[ii * 0x20 + 1 + 8 + 3 + 3] = (byte) mmm;
							// mm : byte count in the last sector pointed.
							long nnn=mm/1024;
							long nnnn=mm%1024;
							if (nnnn>0) {
								nnn++; // last small bytes are also on it.
							}
							for (int k = 0; k < nnn; k++) {
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
	boolean isBank = true;
	List<String> scanNames = new ArrayList<String>();
	List<Byte> buffer = new ArrayList<Byte>();
	List<Byte> bufferAppend = new ArrayList<Byte>();
	int cursorWrite = 0;
	
	Integer cylinderBank=null;
	Integer headBank=null;
	Integer indexBank=null;
	
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
									// TEST : load"image",&c000
									// That does write DATA, but with filename at begin of data, and then re-read it...
									System.out.println("Size :"
											+ result[i * 0x20 + 1 + 8 + 3 + 3]
											+ " = " + size + " bytes");
									System.out.println("Content size :"
											+ buffer.size());
									File f = new File(path + "\\" + s);
									try {
										if (f.createNewFile()) {
											byte[] buff = new byte[512];
											FileOutputStream fos = new FileOutputStream(
													f, true);
											for (int b = 0; b < buffer.size(); b++) {
												buff[b%512] = buffer.get(b);
												if (b%512==511) {
													fos.write(buff);
												} else if (b == buffer.size()-1) {
													// TODO : supposed array,begin,size
													fos.write(buff,0,b%512+1);
												}
											}
											fos.flush();
											fos.close();
											bufferAppend.clear();
											bufferAppend.addAll(buffer);
											buffer.clear();
											dirContent.put(s,f);
										} else {
											bufferAppend.addAll(buffer);
											buffer.clear();
											
											byte[] buff = new byte[512];
											FileOutputStream fos = new FileOutputStream(
													f, true);
											for (int b = 0; b < bufferAppend.size(); b++) {
												buff[b%512] = bufferAppend.get(b);
												if (b%512==511) {
													fos.write(buff);
												} else if (b == bufferAppend.size()-1) {
													// TODO : supposed array,begin,size
													fos.write(buff,0,b%512+1);
												}
											}
											fos.flush();
											fos.close();
										}
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
						isData = true;
					}
					
					if (cylinderBank==null && cursorWrite==0) {
						cylinderBank=cylinder;
						headBank=head;
						indexBank=index;
						isBank=true;
					} else if (cursorWrite==0 && cylinderBank==cylinder && headBank==head && indexBank==index) {
						isBank=false; // stopping to Bank
					}
					
					if (isBank) {
						// Writing pure DATA, before writing complete filename in DirStruct
						buffer.add(data);
					} else {
						// FIXME : pure DATA start with a certain {cyl,head,sectID}, that is same as fileHead, that shall be a better way to detect a fileHead just before the last DIRStruct entry write
						// Writing file HEAD, before writing complete filename in DirStruct (big binary files, in more than 1 DIRStruct page)
						buffer.add(cursorWrite, data);
						if (cursorWrite == 512 - 1) {
							for (int i=0;i<512;i++) {
								buffer.remove(512);
							}
						}
						cylinderBank=null; // leaving
					}
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
				if (head == 0 && cylinder==0 && beginOfSector && index <4) {
					if (isDrop) {
						listDir();
						isDrop=false;
					}
				}
			}
		}
		
	}

}
