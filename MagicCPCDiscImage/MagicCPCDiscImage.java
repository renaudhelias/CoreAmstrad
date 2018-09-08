package jemu.system.cpc;

import JCPC.core.device.Device;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import jemu.core.device.Computer;
import jemu.core.device.floppy.UPD765A;
import jemu.core.samples.Samples;
import jemu.ui.Switches;
import jemu.ui.cpcgamescd.CPCFileSystem;

/**
 * Title: JavaCPC Description: The Java Amstrad CPC Emulator Copyright:
 * Copyright (c) 2006-2015 Company:
 *
 * @author Markus Hohmann, Renaud Helias
 * @version 2.9o
 */
/**
 * Provides a CPC Magic DSK Image, connected to a folder.
 *
 * Patches : CPC.java : fdc.getDrive(1).setDisc(Drive.BOTH_HEADS,new
 * MagicCPCDiscImage()); UPD765A.java : writeSectorByte() :
 * drive.notifyWriteSectorByte((byte)data, params[1], params[2], params[3],
 * params[4]); UPD765A.java : readSectorByte() :
 * drive.notifyReadSectorByte(params[1], params[2], params[3], params[4]);
 *
 *
 * Test sequences :
 *
 * |b cat 10 print"hello save"hello save"pic",b,&c000,&4000
 * save"big",b,&8000,&8000 run"hello |era,"hello.bas" |ren,"pic2","pic"
 *
 * save"file",p => protected file, with '*' in cat
 *
 */
public class MagicCPCDiscImage extends CPCDiscImageModel implements IMagicCPCMidnightCommander {

	private static final String ENCODING = "UTF-8";
	
    CPCFileSystem system;
    String path;
    CPCDiscImageDesc dskDesc;
    Properties propFile;
    
    /**
     * If it's magic, then generate also dsk, dsk.properties and files themself !
     */
    boolean magic;

    final int lastCylinder = 79;
    final int headMask = 1;
	private String name;

    public static final int SECTS = 9;
    public static final int CYLS = 40; // x28
    public static final int HEADS = 1;
    
    public static final byte FILETYPE_BASIC=(byte)0x00;
    public static final byte FILETYPE_PROTECTED=(byte)0x01;
    public static final byte FILETYPE_BINARY=(byte)0x02;
    public static final String PROPS_BINARY="bin";
    public static final String PROPS_BASIC="bas";
    
    public byte[] getImage() {
        return null;
    }

    public int getNoOfTracks() {
        return lastCylinder;
    }

    public class BadScanNameMomentException extends Exception {

        public BadScanNameMomentException() {
            super();
        }
    }

    public class MagicCPCDiscImageException extends Exception {

        public static final String FILE_STRUCTDIR_TOO_BIG = "FILE_STRUCTDIR_TOO_BIG";

        public MagicCPCDiscImageException(String message) {
            super(message);
        }
    }

    /**
     * Creates a new instance of CPCDiscImage
     */
    public MagicCPCDiscImage(String dir) {
        this.name="MagicCPCDiscImage";
        system = new CPCFileSystem();
        init(dir);
    }
    
    /**
     * Creates a new instance of CPCDiscImage.
     *
     * @param name file name
     * @param data image data
     */
    private void initDskData(byte[] data) {
        jemu.core.device.floppy.UPD765A.error = false;
        //this.newImage = false;
        dskDesc= new CPCDiscImageDesc();
        
        dskDesc.setDiscId(new String(data, 0, 0x22));
        dskDesc.setCreator(new String(data, 0x22, 0x0E));
        this.numberOfTracks = data[0x30] & 0xff;
        GAP = new int[numberOfTracks];
        Switches.numberOfTracks = numberOfTracks;
//        System.out.println("Numberof tracks is:" + numberOfTracks);
        this.numberOfSides = data[0x31] & 0xff;
        dskDesc.setSizeOfTrack(Device.getWord(data, 0x32));
        dskDesc.setExtended(dskDesc.getDiscId().toUpperCase().startsWith(CPCDiscImageDesc.EXTENDED_EYECATCHER));
        final boolean isCpcDisc = dskDesc.isExtended() || dskDesc.getDiscId().toUpperCase().startsWith(CPCDiscImageDesc.MV_CPC_EYECATCHER);
        final boolean winape = dskDesc.getCreator().equalsIgnoreCase(CPCDiscImageDesc.WIN_APE_EYECATCHER);

        // let's check the dsk image for bad track number information
        checkImage(data, name);

        createSectorStructure();
        if (isCpcDisc) {

        	int sectSize;
        	
            // track size information
            final byte[] trackSizes = new byte[256];
            if (dskDesc.isExtended()) {
                System.arraycopy(data, 0x34, trackSizes, 0, this.numberOfTracks * this.numberOfSides);
            }

            // scan track data
            int offs = 0x100;
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {

                    // track length
                    int trackLength = dskDesc.getSizeOfTrack();
                    if (dskDesc.isExtended()) {
                        trackLength = (trackSizes[track * this.numberOfSides + side] & 0xff) * 0x100;
//                        System.err.println(trackLength);
//                        System.exit(0);
                    }
                    if (trackLength != 0 && offs < data.length) {
                        // track information block
                        final int sot = offs;
                        final int numberOfSectors = data[offs + 0x15] & 0xff;
                        GAP[track] = data[offs + 0x16] & 0xff;

                        int sectorInformationPos = offs + 0x18;

                        // read sector data
                        offs += 0x100;
                        for (int sect = 0; sect < numberOfSectors; sect++) {

                            // sector information list
                            final int sectTrack = data[sectorInformationPos++] & 0xff; // C
                            final int sectSide = data[sectorInformationPos++] & 0xff; // H
                            final int sectId = data[sectorInformationPos++] & 0xff; // R
                            sectSize = data[sectorInformationPos++] & 0xff; // N
                            statusregisterA = data[sectorInformationPos++] & 0xff; // regA
                            statusregisterB = data[sectorInformationPos++] & 0xff; // regB
//                            sectorInformationPos += 2; // FDC status register 1/2
                            int bytes = UPD765A.getSectorSize(sectSize);
                            if (dskDesc.isExtended() && !winape) {
                                final int sz = Device.getWord(data, sectorInformationPos);
                                if (sz != 0) {
                                    bytes = sz;
                                    sectSize = UPD765A.getCommandSize(bytes);
                                }
                            }
                            sectorInformationPos += 2;
                            final byte[] sectData = new byte[bytes];
                            try {
                                System.arraycopy(data, offs, sectData, 0, bytes);
                            } catch (Exception e) {
                                System.err.println("Corrupt DSK image...");
                                Samples.CORRUPT.play();
                                jemu.core.device.floppy.UPD765A.error = true;
                                return;
                            }
                            offs += bytes;
                            writeSector(track, sectSide, sectTrack, sectSide, sectId, sectSize, sectData);
                            setST1ForSector(track, sectSide,  sectTrack, sectSide, sectId, sectSize,statusregisterA);
                            setST2ForSector(track, sectSide,  sectTrack, sectSide, sectId, sectSize,statusregisterB);
                        }
                        if (!winape) {
                            offs = sot + trackLength;
                        }
                    }
                }
            }
        }
        for (int sect = 0; sect < GAP.length; sect++) {
            if (GAP[sect] == 0) {
                GAP[sect] = 78;
            }
        }
    }
    
    /**
     * Checks a disk image for real existing number of tracks, comparing to
     * given number in dsk header If different, the disk image is being fixed.
     *
     * @param name file name
     * @param data image data
     */
    private void checkImage(byte[] data, String name) {
        try {
            byte[] info = ("Track-Info" + (char) 0x0d + (char) 0x0a + (char) 0 + (char) 0).getBytes("UTF-8");
            int hasTracks = 0;
            for (int i = 0; i < data.length - info.length; i++) {
                boolean foundTrack = false;
                for (int k = 0; k < info.length; k++) {
                    if (data[i + k] == info[k]) {
                        foundTrack = true;
                    } else {
                        foundTrack = false;
                        break;
                    }
                }
                if (foundTrack) {
                    hasTracks++;
                    i += info.length;
                }
            }
            hasTracks /= numberOfSides;
            if (numberOfTracks != hasTracks && hasTracks >= 36 && hasTracks <= 80) {
                System.out.println("Corrupt DSK image. Fixing header...");
                System.out.println("Tracks in header: " + numberOfTracks + " - " + "Real tracks found in DSK: " + hasTracks);
//                Samples.FIXTRACKS.play();
                try {
                    File a = new File(name + ".bak");
                    BufferedOutputStream bos;
                    if (!a.exists()) {
                        bos = new BufferedOutputStream(new FileOutputStream(a));
                        bos.write(data);
                        bos.close();
                    }
                    a = new File(name);
                    bos = new BufferedOutputStream(new FileOutputStream(a));
                    data[0x030] = (byte) hasTracks;
                    bos.write(data);
                    bos.close();
                } catch (Exception ex) {
                }
                numberOfTracks = hasTracks & 0xff;
                Switches.numberOfTracks = numberOfTracks;
            }
        } catch (Exception e) {
        }
    }
    
    /**
     * Save CPC disc image as EXTENDED DSK image.
     */
    public void saveImage() {
        // create file name '_saved'
        final File discImage = new File(this.path+File.separator+this.name+".dsk");
        String saveFileName = discImage.getName();
//        if (Switches.neverOverwrite) {
//            SAVED_DSK = "_saved";
//        } else {
//            SAVED_DSK = "";
//        }
//        if (!this.newImage && SAVED_DSK.length() > 0) {
//            final int dotPos = saveFileName.lastIndexOf('.');
//            if (dotPos == -1) {
//                if (!saveFileName.endsWith(SAVED_DSK)) {
//                    saveFileName += SAVED_DSK;
//                    saveFileName = checkNewSaveFile(discImage.getParent(), saveFileName, "");
//                }
//            } else {
//                final String ext = saveFileName.substring(dotPos);
//                if (!saveFileName.endsWith(SAVED_DSK + ext)) {
//                    saveFileName = checkNewSaveFile(discImage.getParent(), saveFileName.substring(0, dotPos) + SAVED_DSK, ext);
//                }
//            }
//        }
        saveImage(new File(discImage.getParent(), saveFileName));
        
        if (magic) {
        	writeProperties();
        }
    }
    
    /**
     * Save image.
     *
     * @param savedImage save file
     */
    //@Override
    public synchronized void saveImage(File savedImage) {
//        if (!Switches.uncompressed) {
//            saveDSZImage(savedImage);
//            return;
//        }
        if (System.getSecurityManager() != null) {
            try {
                System.getSecurityManager().checkWrite(savedImage.getAbsolutePath());
            } catch (final SecurityException sex) {
                // don't save
                return;
            }
        }

//        System.out.println("store dsk file to " + savedImage);
        String name = savedImage.getAbsolutePath();
        if (name.toLowerCase().endsWith(".zip")) {
            name = name + "_" + Switches.choosenname;
        }
        if (!name.toLowerCase().endsWith(".dsk")) {
            name = name + ".dsk";
        }
        // save data to file
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            // disc information block
            bos.write(CPCDiscImageDesc.EXTENDED_DESCRIPTION.getBytes(ENCODING));
            bos.write(CPCDiscImageDesc.CREATOR_DATA.getBytes(ENCODING));
            bos.write(this.numberOfTracks);
            bos.write(this.numberOfSides);
            bos.write(0);
            bos.write(0);

            // track size table
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {
                    try {
                        final int trackLength = getTrack(track,side).getLength();
                        bos.write((trackLength / 256) & 0xFF);
                    } catch (Exception e) {
                    }
                }
            }
            int unused = 0x100 - 0x34 - this.numberOfTracks * this.numberOfSides;
            for (int i = 0; i < unused; i++) {
                bos.write(0);
            }

            // track data
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {
                    final CPCDiscImageTrack td = getTrack(track,side);
                    if (td == null) {
                        Samples.CORRUPT.play();
                        return;
                    }
                    // track information block
                    bos.write(CPCDiscImageDesc.TRACK_INFO.getBytes(ENCODING));
                    bos.write(0); // track info end
                    bos.write(0); // unused
                    bos.write(0); // unused
                    bos.write(0); // unused
                    bos.write(td.getTrack());
                    bos.write(td.getSide());
                    bos.write(0); // unused
                    bos.write(0); // unused
                    bos.write(td.getSector(0).getSize()); // UPD765A size
                    final int numberOfSectors = td.getSectorCount();
                    bos.write(numberOfSectors);
                    bos.write(0x4e); // GAP#3 length
                    bos.write(0xe5); // filler byte

                    // sector information list
                    for (int sector = 0; sector < numberOfSectors; sector++) {
                        final CPCDiscImageSector sd = td.getSector(sector);
                        bos.write(sd.getTrack());
                        bos.write(sd.getSide());
                        bos.write(sd.getId());
                        bos.write(sd.getSize()); // UPD765A size
                        bos.write(sd.getST1()); // FDC status register 1
                        bos.write(sd.getST2()); // FDC status register 2
                        final int dataSize = sd.getData().length;
                        bos.write(dataSize & 0xFF);
                        bos.write((dataSize / 256) & 0xFF);
                        // System.out.println("sec " + sd.getTrack() + "/" + sd.getSide() + "/" + sd.getId() + "/"
                        // + UPD765A.getCommandSize(sd.getSize()) + " size=" + sd.getData().length);
                        // System.out.println(" -> " + (dataSize & 0xFF) + " / " + ((dataSize / 256) & 0xFF));
                    }
                    unused = 0x100 - 0x18 - 8 * numberOfSectors;
                    for (int i = 0; i < unused; i++) {
                        bos.write(0);
                    }
                    for (int sector = 0; sector < numberOfSectors; sector++) {
                        bos.write(td.getSector(sector).getData());
                    }
                }
            }
            bos.close();
            final BufferedOutputStream baos = new BufferedOutputStream(new FileOutputStream(name));
            baos.write(bos.toByteArray());
            baos.close();

        } catch (final IOException iox) {
//            System.out.println("can't write to file " + savedImage + ": " + iox.getMessage());
        }
    }
    
    @Override
    public String getName() {
    	return name;
    }

    public void init(String path) {
    	File f = new File(path);
    	
        this.numberOfTracks = 80;
        this.numberOfSides = 1;
        this.statusregisterA = 0;
        this.statusregisterB = 0;
    	
        createSectorStructure();
        if (f.isFile() && f.getName().endsWith(".dsk")) {
        	this.path=f.getParent();
        	this.name=f.getName().substring(0,f.getName().length()-".dsk".length());
        	initDskData(MagicCPCDiscImageUtils.getFile(f.getAbsolutePath()));
        	// not magic, but... has a sort of CRUD :p
        	listProperties();
        	magic=false;
        } else if (f.isFile() && f.getName().endsWith(".dsk.properties")) {
        	this.path = f.getParent();
        	this.name=f.getName().substring(0,f.getName().length()-".dsk.properties".length());
            	try {
            	Properties prop = new Properties();
				prop.load(new FileInputStream(f));
				propFile=prop;
	            listDir();
	            saveImage();
	        	magic=true;
			} catch (IOException e) {
				e.printStackTrace();
			}
        } else {
        	this.path = path;
        	this.name=f.getName();
        	listProperties();
            listDir();
            saveImage();
            magic=true;
        }
    }

    /**
     * If it's magic, then generate also dsk, dsk.properties and files themself !
     */
    private void writeProperties() {
    	File f = new File(this.path+File.separator+this.name+".dsk.properties");
    	try {
			propFile.store(new FileOutputStream(f), "writen by MagicCPCDiscImage (JavaCPC)");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
     * like dir (magic), but for properties
     */
    private void listProperties() {
    	propFile=new Properties();
    	propFile.setProperty("*.*", "");
	}

	private void resetSectorContent() {
        byte empty[] = new byte[512];
        for (int j = 0; j < 512; j++) {
            empty[j] = (byte) 0xE5;
        }
        writeSector(0, 0 , 0, 0, getSectorID(0, 0, 0)[2], 512, empty);
        writeSector(0, 0 , 0, 0, getSectorID(0, 0, 1)[2], 512, empty);
        writeSector(0, 0 , 0, 0, getSectorID(0, 0, 2)[2], 512, empty);
        writeSector(0, 0 , 0, 0, getSectorID(0, 0, 3)[2], 512, empty);
    }

    
//    public void copyAsDSK() {
//    	copyAsDSK("MAGIC_OUTPUT.DSK");
//    }
//    public void copyAsDSK(String name) {
//        system.get(path + "/" + name);
//        try {
//            File folder = new File(path);
//            if (folder.isDirectory()) {
//                for (File sf : folder.listFiles()) {
//                    if (sf.isDirectory() || sf.length() > 0x0FFFF || sf.length() < 0x00001) {
//                        continue; // ignore directories & larger files than 64k & smaller files than 1 byte
//                    }
//                    String realname = sf.getName().toUpperCase();
//                    String cpcname = realname2cpcname(realname);
//                    if (propFile != null) {
//                    	if (!propFile.containsKey(cpcname2realname(cpcname))) {
//                    		System.out.println("ignoring "+cpcname);
//                    		continue;
//                    	}
//                    }
//                    system.DIR();
//                    system.copyToDSK(path + "/", realname, path + "/" +name);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    HashMap<String, File> dirContent = new HashMap<String, File>();
    List<String> dirContentKeys = new ArrayList<String>();
    List<String> dirContentBasic = new ArrayList<String>();
    List<String> dirContentBinary = new ArrayList<String>();

    private void listDir() {
        dirContent.clear();
        dirContentKeys.clear();
        dirContentBasic.clear();
        dirContentBinary.clear();
        int ii = 0;
        int noSect = 0;
        try {
            File folder = new File(path);
            if (folder.isDirectory()) {
                for (File sf : folder.listFiles()) {
                    if (sf.isDirectory() || sf.length() > 0x1FFFF + 0x80 || sf.length() < 0x00001) {
                        continue; // ignore directories & larger files than 128k + AMSDOS header & smaller files than 1 byte
                    }
                    String realname = sf.getName().toUpperCase();
                    String cpcname = realname2cpcname(realname);
                                        
                    if (propFile != null) {
                    	boolean trouve = false;
                		if (cpcname2realname(cpcname).endsWith(".dsk") || cpcname2realname(cpcname).endsWith(".dsk.properties")) {
                			// no recursive
                    		System.out.println("ignoring recursing "+cpcname);
                    		continue;
                		}
                    	for (Object entryO : propFile.keySet()) {
                    		String entry=(String) entryO;
                    		entry=entry.toUpperCase();
                    		entry=entry.replaceAll("\\.", "\\.");
                    		entry=entry.replaceAll("\\*", ".*");
                    		if (cpcname2realname(cpcname).matches(entry)) {
                    			trouve =true;
                    			String value=propFile.getProperty((String) entryO);
                    			String[] values = value.split(",");
                    			for (int v=0;v<values.length;v++) {
                    				if (PROPS_BASIC.equals(values[v])) {
                    					dirContentBasic.add(cpcname);
                    				}
                    				if (PROPS_BINARY.equals(values[v])) {
                    					dirContentBinary.add(cpcname);
                    				}
                    			}
                    			break;
                    		}
                    	}
                    	if (!trouve) {
                    		System.out.println("ignoring "+cpcname);
                    		continue;
                    	}
                    }
                    
                    File fSuperAmstradName = new File(path + "/" + realname);
                    dirContent.put(cpcname, fSuperAmstradName);
                    dirContentKeys.add(cpcname);
                    System.out.println("adding "+cpcname);
                }

            }
            if (propFile != null) {
            	Enumeration<?> e = propFile.propertyNames();
        		while (e.hasMoreElements()) {
        			String key = (String) e.nextElement();
        			key=key.toLowerCase();
        			if (key.contains("*")) { continue; }
        			if (!dirContentKeys.contains(realname2cpcname(key))) {
	        			String value = propFile.getProperty(key);
	        			System.out.println("MagicProps - missing Key : " + key + " (cpcname="+realname2cpcname(key)+"), Value : " + value);
        			}
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

            boolean teaForTwo = false;

            for (String name : dirContentKeys) {
                noSect = i / 16; // 0x1800 / 0x20
                if (noSect >= 4) {
                    System.out.println(MagicCPCDiscImageException.FILE_STRUCTDIR_TOO_BIG);
                    break;
//                        throw new MagicCPCDiscImageException(MagicCPCDiscImageException.FILE_STRUCTDIR_TOO_BIG);
                }
                ii = i % 16;
                byte[] sectData = readSector(0,0,0,0, getSectorID(0, 0, noSect)[2], 512); //sectors[0][0][noSect];

                File f = dirContent.get(name);
                long fileLength = f.length();
                System.out.println("DIR : " + name);

                // SAMPLE 180.DSK : fileSize=x49 (73), displayed : 
                // 16bits listing "sectors" : 02 03 04 05 06 07 08 09 0A 0B 00 00 00 00 00 00
                // So One full DIREntry equals 10Kb 
                // A full DIREntry has size x80 (128)
                // 16Kb=> 128
                // 1Kb   => 8 increments
                // 1025b => 8 increments
                //  128b => 1 increment
                try {
                    byte[] selectedFileContent = new byte[512];
                    FileInputStream fis = new FileInputStream(f);
                    if (dirContentBasic.contains(name) || dirContentBinary.contains(name)) {
                        byte[] selectedFileContentBegin= new byte[128+256];
                        if (fis.read(selectedFileContentBegin) > 0) {
                        	byte[] header = buildHeader(name, dirContentBasic.contains(name) ? FILETYPE_BASIC : FILETYPE_BINARY,(int)fileLength);
                    		for (int c = 0; c <128;c++) {
                    			System.out.print(" "+String.format("%02X ", header[c]));
                    			if (c%16==15) System.out.println("");
                    		}
                             System.arraycopy(header, 0,
                              		readSector(writeC,writeH,writeC,writeH, getSectorID(writeC,writeH, writeR)[2], 512)
                                      		, 0, 128);
                             System.arraycopy(selectedFileContentBegin, 0,
                             		readSector(writeC,writeH,writeC,writeH, getSectorID(writeC,writeH, writeR)[2], 512)
                                     		, 128, 128+256);
                             System.out.println("BLOCK 1");
                             for (int c = 0; c <512;c++) {
                            	 
                     			System.out.print(" "+String.format("%02X ", readSector(writeC,writeH,writeC,writeH, getSectorID(writeC,writeH, writeR)[2], 512)[c]));
                     			if (c%16==15) System.out.println("");
                     		}
                             teaForTwo = !teaForTwo;
                             writeR++;
                             if (writeR >= SECTS) {
                                 writeR = 0;
                                 writeC++;
                                 if (writeC >= CYLS) {
                                     break;
                                 }
                             }
                        }
                    }
                    while (fis.read(selectedFileContent) > 0) {
                    	
                        System.arraycopy(selectedFileContent, 0,
                        		readSector(writeC,writeH,writeC,writeH, getSectorID(writeC,writeH, writeR)[2], 512)
                                		, 0, 512);
                    	
                        teaForTwo = !teaForTwo;
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
                        teaForTwo = !teaForTwo;
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
                    break;
                }
                // a file of 64Kb filled with x"20" (space chat) : 65536bytes

                if (dirContentBasic.contains(name) || dirContentBinary.contains(name)) {
                	fileLength+=128; // header
                }
                
                long m = fileLength / (16 * 1024); // number of this file DIREntry
                long mm = fileLength % (16 * 1024); // data referenced by last DIREntry (if not a full data DIREntry)
                if (mm > 0) {
                    m++; // last block does include the last not full-sized packet.
                }
                for (int n = 0; n < m; n++) {

                    noSect = (i + n) / 16;

                    if (noSect >= 4) {
                        System.out.println(MagicCPCDiscImageException.FILE_STRUCTDIR_TOO_BIG);
                        break;
                    }

                    ii = (i + n) % 16;
                    sectData = readSector(0,0,0,0, getSectorID(0,0, noSect)[2], 512);// sectors[0][0][noSect];

                    System.arraycopy(line, 0, sectData, ii * 0x20, 32);
                    System.arraycopy(name.getBytes(), 0, sectData,
                            ii * 0x20 + 1, 8 + 3);

                    if (n == m - 1 && mm > 0) {
                        // mm : byte count in the last sector pointed.
                        long mmm = mm / 128;
                        long mmmm = mm % 128;
                        if (mmmm > 0) {
                            mmm++; // last small bytes are also on it.
                        }
                        sectData[ii * 0x20 + 1 + 8 + 3 + 3] = (byte) mmm;
                        // mm : byte count in the last sector pointed.
                        long nnn = mm / 1024;
                        long nnnn = mm % 1024;
                        if (nnnn > 0) {
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

        scanNames = doScanAllNamesFromSectors();
    }

    private File magiccheck;
    private String[] lastMagicDir;
    private String[] actualMagicDir;
    private long[] lastMagicSizes;
    private long[] actualMagicSizes;
    /**
     * Do refresh disc content when file outside does change (from themself)
     */
    public void checkMagic() {
    	if (!magic) {
    		return;
    	}
        magiccheck = new File(path);
        if (magiccheck.isFile()) {
        	magiccheck=magiccheck.getParentFile();
        }
        if (actualMagicDir == null) {
            actualMagicDir = magiccheck.list();
            actualMagicSizes = new long[actualMagicDir.length];
            scanActualFiles();
            return;
        }
        boolean reload = false;
        lastMagicDir = magiccheck.list();
        lastMagicSizes = new long[lastMagicDir.length];
        scanLastFiles();
        if (lastMagicDir.length != actualMagicDir.length) {
            actualMagicDir = magiccheck.list();
            actualMagicSizes = new long[actualMagicDir.length];
            scanActualFiles();
            reload = true;
        }
        if (!reload) {
            for (int i = 0; i < lastMagicDir.length; i++) {
                try {
                    if (!lastMagicDir[i].equals(actualMagicDir[i])) {
                        actualMagicDir = magiccheck.list();
                        scanActualFiles();
                        reload = true;
                        break;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    actualMagicDir = magiccheck.list();
                    lastMagicDir = magiccheck.list();
                    actualMagicSizes = new long[actualMagicDir.length];
                    lastMagicSizes = new long[lastMagicDir.length];
                    scanActualFiles();
                    scanLastFiles();
                    reload = true;
                    break;
                }
            }
        }
        if (!reload) {
            for (int i = 0; i < lastMagicSizes.length; i++) {
                try {
                    if (lastMagicSizes[i] != actualMagicSizes[i]) {
                        actualMagicDir = magiccheck.list();
                        scanActualFiles();
                        reload = true;
                        break;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    actualMagicDir = magiccheck.list();
                    lastMagicDir = magiccheck.list();
                    actualMagicSizes = new long[actualMagicDir.length];
                    lastMagicSizes = new long[lastMagicDir.length];
                    scanActualFiles();
                    scanLastFiles();
                    reload = true;
                    break;
                }
            }
        }
        if (reload) {
//            if (protect) {
//                System.out.println("Re-read of disk is not possible! Internal disk access!");
//                protect = false;
//                return;
//            }
            System.out.println("Re-scanning directory in " + path);
            //loadMagicSilent(drive, path);
            init(path);
            System.out.println("And write changes also on disk+properties");
            saveImage();
        }
    }
    
    private void scanActualFiles() {
        for (int i = 0; i < actualMagicDir.length; i++) {
            File c = new File(magiccheck + "\\" + actualMagicDir[i]);
            actualMagicSizes[i] = c.length();
        }
    }

    private void scanLastFiles() {
        for (int i = 0; i < lastMagicSizes.length; i++) {
            File c = new File(magiccheck + "\\" + lastMagicDir[i]);
            lastMagicSizes[i] = c.length();
        }
    }

    
    /**
     * 
     * @param filename
     * @param fileType FILETYPE_BASIC,FILETYPE_PROTECTED,FILETYPE_BINARY
     * @return
     */
    private byte[] buildHeader(String filename, byte fileType, int fileLengh) {
    	int checksum0066=0;
    	byte[] header = new byte[128];
//    	Byte 00: User number (value from 0 to 15 or #E5 for deleted entries)
    	header[0]=(byte) 0x00;
//    	Byte 01 to 08: filename (fill unused char with spaces)
    	header[1]=(byte) filename.charAt(0);checksum0066+=(int)(header[1]&0xFF);
    	header[2]=(byte) filename.charAt(1);checksum0066+=(int)(header[2]&0xFF);
    	header[3]=(byte) filename.charAt(2);checksum0066+=(int)(header[3]&0xFF);
    	header[4]=(byte) filename.charAt(3);checksum0066+=(int)(header[4]&0xFF);
    	header[5]=(byte) filename.charAt(4);checksum0066+=(int)(header[5]&0xFF);
    	header[6]=(byte) filename.charAt(5);checksum0066+=(int)(header[6]&0xFF);
    	header[7]=(byte) filename.charAt(6);checksum0066+=(int)(header[7]&0xFF);
    	header[8]=(byte) filename.charAt(7);checksum0066+=(int)(header[8]&0xFF);
//    	Byte 09 to 11: Extension (fill unused char with spaces)
    	header[9]=(byte) filename.charAt(8);checksum0066+=(int)(header[9]&0xFF);
    	header[10]=(byte) filename.charAt(9);checksum0066+=(int)(header[10]&0xFF);
    	header[11]=(byte) filename.charAt(10);checksum0066+=(int)(header[11]&0xFF);
//    	Byte 16: first block (tape only)
    	header[16]=(byte) 0x00;
//    	Byte 17: first block (tape only)
    	header[17]=(byte) 0x00;
//    	Byte 18: file type (0:basic 1:protected 2:binary)
    	header[18]=fileType;checksum0066+=(int)(header[18]&0xFF);
		header[19]=(byte) (fileLengh%256);checksum0066+=(int)(header[19]&0xFF);
		header[20]=(byte) (fileLengh/256);checksum0066+=(int)(header[20]&0xFF);
//    	Byte 21 and 22: loading address LSB first
    	header[21]=(byte) 0x00;
		header[22]=(byte) 0x01;checksum0066+=(int)(header[22]&0xFF);
//    	Byte 23: first block (tape only?)
		header[23]=(byte) 0x00;
//    	Byte 24 and 25: file length LSB first
		header[24]=(byte) (fileLengh%256);checksum0066+=(int)(header[24]&0xFF);
		header[25]=(byte) (fileLengh/256);checksum0066+=(int)(header[25]&0xFF);
//    	Byte 26 and 27: execution address for machine code program LSB first
    	header[26]=(byte) 0x00;
		header[27]=(byte) 0x01;checksum0066+=(int)(header[27]&0xFF);
//    	Byte 64 and 66: 24 bits file length LSB first. Just a copy, not used!
		header[64]=(byte) (fileLengh%256);checksum0066+=(int)(header[64]&0xFF);
		header[65]=(byte) (fileLengh/256);checksum0066+=(int)(header[65]&0xFF);
//    	Byte 67 and 68: checksum for bytes 00-66 stored LSB first
		//To calculate the checksum just add all bytes from 00 up to and including byte 66 together.
		header[67]=(byte) (checksum0066%256);
		header[68]=(byte) (checksum0066/256);
//    	Byte 69 to 127: undefined content, free to use
		return header;
	}

	private String realname2cpcname(String realname) {
    	String cpcname = realname.toUpperCase();
    	if (cpcname.contains(".")) {
            int point = cpcname.indexOf(".");
            String filename = cpcname.substring(0, point);
            filename = filename + "        ";
            filename = filename.substring(0, 8);
            String extension = cpcname.substring(point + 1,
                    cpcname.length());
            extension = extension + "   ";
            extension = extension.substring(0, 3);

            cpcname = filename + extension;
        } else {
            cpcname = cpcname + "        " + "   ";
            cpcname = cpcname.substring(0, 8 + 3);
        }
    	return cpcname;
    }
    
    private String cpcname2realname(String cpcname) {
    	String realname=cpcname.substring(0,8)+"."+cpcname.substring(8,11);
    	realname=realname.replaceAll(" ", "");
    	return realname;
    }
    
    protected static int sectorSize(int n) {
        return n > 5 ? 0x1800 : 0x80 << n;
    }

    boolean isData = false;
    boolean isBank = true;
    List<String> scanNames = new ArrayList<String>();
    List<Byte> buffer = new ArrayList<Byte>();
    int cursorWrite = 0;

    Integer cylinderBank = null;
    Integer headBank = null;
    Integer indexBank = null;

    @Override
    public void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n) {
        head &= headMask;
        if (cylinder <= lastCylinder) {
            int index = getSectorIndex(r);//ids[head][cylinder], c, h, r, n);
            if (index != -1) {

                if (head == 0 && cylinder == 0 && index < 4) {
                    if (isData) {
                        cursorWrite = 0;
                        isData = false;
                    }
                    if (cursorWrite == 512 - 1) {
                        doScanNames(true, head, cylinder, index);
                    }
                } else {
                    // writing on data area
                    if (!isData) {
                        cursorWrite = 0;
                        isData = true;
                    }

                    if (cursorWrite == 0) {
                        if (cylinderBank == null) {
                            // START OF DATA BLOCK.
                            cylinderBank = cylinder;
                            headBank = head;
                            indexBank = index;
                            isBank = true;
                        } else if (cylinderBank == cylinder && headBank == head && indexBank == index) {
                            // second time you are writing on this block, certainly a headFile write operation.
                            isBank = false; // stopping to Bank
                        }
                    }

                    if (isBank) {
                        // Writing pure DATA, before writing complete filename in DirStruct
                        buffer.add(data);
                    } else // Writing file HEAD, before writing complete filename in DirStruct (big binary files, in more than 1 DIRStruct page)
                    {
                        if (buffer.size() > 0) {
                            buffer.add(cursorWrite, data);
                            if (cursorWrite == 512 - 1) {
                                // called just one time for a file of 32Kb, seems really good here.
                                for (int i = 0; i < 512; i++) {
                                    buffer.remove(512);
                                }
                            }
                            cylinderBank = null; // leaving fileHead (for normal txt, no pb : always isBank=true)
                        } else {
                            // what ?
                            cylinderBank = null;
                        }
                    }
                }
            }

        }
        cursorWrite++;
        if (cursorWrite == 512) {
            cursorWrite = 0;
        }
    }

    /**
     * @return list of all filenames in DIRStruct sectors, flat.
     */
    private List<String> doScanAllNamesFromSectors() {
        List<String> flatScanNames = new ArrayList<String>();
        for (int index = 0; index < 4; index++) {
            byte[] result = readSector(0,0,0,0, getSectorID(0,0, index)[2], 512);
            for (int i = 0; i < result.length / 32; i++) {
                byte[] filename = new byte[8 + 3];
                System.arraycopy(result, i * 0x20 + 1, filename, 0,
                        8 + 3);
                // toto.$$$ : temporary file.
                if (result[i * 0x20] != -27
                        && filename[8 + 3 - 1] != -27 && filename[8 + 3 - 1] != '$') {
                    String s = "";
                    for (int j = 0; j < 8 + 3; j++) {
                        s += (char) filename[j];
                    }
                    flatScanNames.add(s);
                }
            }
        }
        return flatScanNames;
    }

    /**
     * Before a read or after a write on DIRStruct sectors (index<4)
     */
    private void doScanNames(boolean isWrite, int head, int cylinder, int index) {
        List<String> newScanNames = doScanAllNamesFromSectors();
        try {
            String filename = checkNewFile(scanNames, newScanNames);
            if (filename != null) {
                String first = filename;
                String ext = filename;
                while (first.length() > 8) {
                    first = first.substring(0, first.length() - 1);
                }
                while (ext.length() > 3) {
                    ext = ext.substring(1);
                }
                first = first.replace(" ", "");
                ext = ext.replace(" ", "");
                filename = first + "." + ext;
                System.out.println("FILE ADDED (isWrite=" + isWrite + ") : " + filename);
                File f = new File(path + "/" + filename);

                try {
                    byte[] buff = new byte[512];
                    // do append file
                    FileOutputStream fos = new FileOutputStream(f, true);
                    for (int b = 0; b < buffer.size(); b++) {
                        buff[b % 512] = buffer.get(b);
                        if (b % 512 == 511) {
                            fos.write(buff);
                            CPC.protect = true;
                        } else if (b == buffer.size() - 1) {
                            fos.write(buff, 0, b % 512 + 1);
                            CPC.protect = true;
                        }
                    }
                    fos.flush();
                    fos.close();
                    buffer.clear();
                    checkFile(f);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            // new file or else nothing : that's ok to turn this page.
            scanNames = newScanNames;
            return;
        } catch (BadScanNameMomentException e) {
            // DIRStruct is not yet aligned (turning page)
            // or else a not implemented yet operation (rename/erase)
            System.out.println("Something but a new file by here");
        }

        try {
            List<String> filenames = checkRenameFile(scanNames, newScanNames);
            if (filenames != null) {
                System.out.println("Renaming file " + filenames.get(0) + " into " + filenames.get(1));
                File f = new File(path + "/" + filenames.get(0));
                File f2 = new File(path + "/" + filenames.get(1));
                f.renameTo(f2);
                CPC.protect = true;
            }
            // renamed file or else nothing : that's ok to turn this page.
            scanNames = newScanNames;
            return;
        } catch (BadScanNameMomentException e) {
            // DIRStruct is not yet aligned (turning page)
            // or else a not implemented yet operation (rename/erase)
            System.out.println("Something but a new file/a rename file by here");
        }

        try {
            String filename = checkEraseFile(scanNames, newScanNames);
            if (filename != null) {
                System.out.println("Erasing file " + filename);
                File f = new File(path + "/" + filename);
                f.delete();
                String first = filename;
                String ext = filename;
                while (first.length() > 8) {
                    first = first.substring(0, first.length() - 1);
                }
                while (ext.length() > 3) {
                    ext = ext.substring(1);
                }
                first = first.replace(" ", "");
                ext = ext.replace(" ", "");
                filename = first + "." + ext;
                f = new File(path + "/" + filename);
                if (f.exists()) {
                    f.delete();
                }
                CPC.protect = true;
            }
            // renamed file or else nothing : that's ok to turn this page.
            scanNames = newScanNames;
            return;
        } catch (BadScanNameMomentException e) {
            // DIRStruct is not yet aligned (turning page)
            // or else a not implemented yet operation (rename/erase)
            System.out.println("Something but a new file/a rename file/an erase file by here : DIRStruct is not yet aligned, do just continue.");
        }
        // DIRStruct is not yet aligned (turning page), cannot deduce operation, do just continue.
    }

    protected void checkFile(File f) {
        try {
            int k = (int)f.length();
            byte[] buffer = new byte[k];
            BufferedInputStream bin = new BufferedInputStream(new FileInputStream(f));
            bin.read(buffer);
            bin.close();
            if (Computer.CheckAMSDOS(buffer)){
                int size = Device.getWord(buffer, 24)+0x80;
                byte result[] = new byte[size];
                System.arraycopy(buffer, 0, result, 0, size);
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(f));
                bos.write(result);
                bos.close();
            } else {
                // Todo: Correct filesize for ASCII / Headerless files
            }
        } catch (Exception ex) {
        }
    }

    /**
     * Erasing a file... does disappear one filename only.
     *
     * @return null : nothing has changed
     * @return filename : a file has been erased
     * @throw BadScanNameMomentException : something else happen (page turn, or
     * erase or rename)
     */
    private String checkEraseFile(List<String> scanNames, List<String> newScanNames) throws BadScanNameMomentException {
        HashMap<String, Integer> fileEntryCounts = new HashMap<String, Integer>();
        for (String name : scanNames) {
            if (fileEntryCounts.containsKey(name)) {
                int n = fileEntryCounts.get(name) - 1;
                fileEntryCounts.put(name, n);
            } else {
                fileEntryCounts.put(name, -1);
            }
        }
        for (String name : newScanNames) {
            if (fileEntryCounts.containsKey(name)) {
                int n = fileEntryCounts.get(name) + 1;
                fileEntryCounts.put(name, n);
            } else {
                fileEntryCounts.put(name, +1);
            }
        }
        String candidate = null;
        boolean candidateHasProblem = false;
        for (String name : fileEntryCounts.keySet()) {
            if (fileEntryCounts.get(name) < 0) {
                if (!candidateHasProblem) {
                    candidate = name;
                    candidateHasProblem = true;
                } else {
                    // second problem
                    throw new BadScanNameMomentException();
                }
            } else if (fileEntryCounts.get(name) > 0) {
                // an new file or a rename happened...
                throw new BadScanNameMomentException();
            }
        }
        return candidate;
    }

    /**
     * Renaming a file... does disappear and appear one filename only on the
     * same DIRStruct entry.
     *
     * @return null : nothing has changed
     * @return filename : a file has been renamed
     * @throw BadScanNameMomentException : something else happen (page turn, or
     * erase or rename)
     */
    private List<String> checkRenameFile(List<String> scanNames, List<String> newScanNames) throws BadScanNameMomentException {
        HashMap<String, Integer> fileEntryCounts = new HashMap<String, Integer>();
        for (String name : scanNames) {
            if (fileEntryCounts.containsKey(name)) {
                int n = fileEntryCounts.get(name) - 1;
                fileEntryCounts.put(name, n);
            } else {
                fileEntryCounts.put(name, -1);
            }
        }
        for (String name : newScanNames) {
            if (fileEntryCounts.containsKey(name)) {
                int n = fileEntryCounts.get(name) + 1;
                fileEntryCounts.put(name, n);
            } else {
                fileEntryCounts.put(name, +1);
            }
        }
        String candidateFrom = null;
        String candidateTo = null;
        boolean candidateFromHasProblem = false;
        boolean candidateToHasProblem = false;
        for (String name : fileEntryCounts.keySet()) {
            if (fileEntryCounts.get(name) > 0) {
                if (!candidateToHasProblem) {
                    candidateTo = name;
                    candidateToHasProblem = true;
                } else {
                    // second problem
                    throw new BadScanNameMomentException();
                }
            } else if (fileEntryCounts.get(name) < 0) {
                if (!candidateFromHasProblem) {
                    candidateFrom = name;
                    candidateFromHasProblem = true;
                } else {
                    // second problem
                    throw new BadScanNameMomentException();
                }
            }
        }
        if (candidateFromHasProblem != candidateToHasProblem) {
            throw new BadScanNameMomentException();
        } else if (candidateFrom == null && candidateTo == null) {
            return null;
        }
        List<String> candidates = new ArrayList<String>();
        candidates.add(candidateFrom);
        candidates.add(candidateTo);
        return candidates;
    }

    /**
     * @return null : nothing has changed
     * @return filename : a new file or a new file append
     * @throw BadScanNameMomentException : something else happen (page turn, or
     * erase or rename)
     */
    private String checkNewFile(List<String> scanNames, List<String> newScanNames) throws BadScanNameMomentException {
        HashMap<String, Integer> fileEntryCounts = new HashMap<String, Integer>();
        for (String name : scanNames) {
            if (fileEntryCounts.containsKey(name)) {
                int n = fileEntryCounts.get(name) - 1;
                fileEntryCounts.put(name, n);
            } else {
                fileEntryCounts.put(name, -1);
            }
        }
        for (String name : newScanNames) {
            if (fileEntryCounts.containsKey(name)) {
                int n = fileEntryCounts.get(name) + 1;
                fileEntryCounts.put(name, n);
            } else {
                fileEntryCounts.put(name, +1);
            }
        }
        String candidate = null;
        boolean candidateHasProblem = false;
        for (String name : fileEntryCounts.keySet()) {
            if (fileEntryCounts.get(name) > 0) {
                if (!candidateHasProblem) {
                    candidate = name;
                    candidateHasProblem = true;
                } else {
                    // second problem
                    throw new BadScanNameMomentException();
                }
            } else if (fileEntryCounts.get(name) < 0) {
                // an erasure or a rename happened...
                throw new BadScanNameMomentException();
            }
        }
        return candidate;
    }

    @Override
    public void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n) {
        head &= headMask;
        if (cylinder <= lastCylinder) {
            int index = getSectorIndex(r);//ids[head][cylinder], c, h, r, n);
            if (index != -1) {
                if (head == 0 && cylinder == 0 && beginOfSector && index < 4) {
                    doScanNames(true, head, cylinder, index);
                }
            }
        }

    }

	@Override
	public List<String> crudList() {
		List<String> files = new ArrayList<String>();
		for (Object o : propFile.keySet()) {
			files.add(String.valueOf(o));
		}
		return files;
	}

	@Override
	public MagicCPCFile crudRead(String magicFileName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void crudAdd(MagicCPCFile magicFile) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void crudRemove(String magicFileName) {
		// TODO Auto-generated method stub
		
	}

}
