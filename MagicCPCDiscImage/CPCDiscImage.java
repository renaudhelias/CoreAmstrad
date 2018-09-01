/*
 * CPCDiscImage.java
 *
 * Created on 11 March 2007, 12:19
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package jemu.system.cpc;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.*;
import jemu.core.samples.Samples;

import jemu.core.device.Device;
import jemu.core.device.floppy.UPD765A;
import jemu.ui.Switches;

/**
 * Title: JavaCPC Description: The Java Amstrad CPC Emulator Copyright:
 * Copyright (c) 2006-2010 Company:
 *
 * @author
 * @version 6.8
 */
/**
 * CPC disc image.
 *
 * @author Roland.Barthel
 */
public class CPCDiscImage extends CPCDiscImageModel {

    public void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n) {

    }

    public void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n) {

    }
    protected boolean DEBUG = false;
    private static String SAVED_DSK = "";
    private static final String WIN_APE_EYECATCHER = "Win APE 32 1.0";
    private static final String MV_CPC_EYECATCHER = "MV - CPC";
    private static final String EXTENDED_EYECATCHER = "EXTENDED";
    private static final String EXTENDED_DESCRIPTION = EXTENDED_EYECATCHER + " CPC DSK File\r\nDisk-Info\r\n";
    private static final String CREATOR_DATA = "JAVACPC EXTDSK";
    private static final String ENCODING = "UTF-8";
    private static final String TRACK_INFO = "Track-Info\r\n";
    private static final int BUFFER_SIZE = 8192;
    /**
     * new image or loaded?
     */
    private final boolean newImage;
    public int sectSize = 0;
    // standard disc information block (256 bytes):
    // 00-21 disc info (34 bytes)
    // 22-2F name of creator (14 bytes)
    // 30 number of tracks (1 byte)
    // 31 number of sides (1 byte)
    // 32-33 size of a track (2 bytes low/high byte)
    // 34-FF not used
    // extended disc information block (256 bytes):
    // 00-21 disc info (34 bytes)
    // 22-2F name of creator (14 bytes)
    // 30 number of tracks (1 byte)
    // 31 number of sides (1 byte)
    // 32-33 not used
    // 34-xx number of tracks*number of sides
    /**
     * disc name.
     */
	private String name;
    /**
     * disc info.
     */
    // private final String                discId;
    private final String discId;
    /**
     * name of creator.
     */
    private final String creator;
    /**
     * size of a track .
     */
    private final int sizeOfTrack;
    /**
     * extended DISK format? (Revision 5)
     */
    private final boolean extended;

    /**
     * Creates a new instance of CPCDiscImage.
     *
     * @param name file name
     * @param is image input stream
     * @return the disc image
     * @throws IOException when image creation fails
     */
    public static CPCDiscImage create(final String name, final InputStream is) throws IOException {
        return new CPCDiscImage(name, load(is));
    }


    /**
     * Create an empty AMSDOS disc image.
     *
     * @param name file name
     * @param numberOfSides number of sides 1/2
     */
    public CPCDiscImage(String name, int numberOfSides) {
        this.name=name;
        this.newImage = true;
        this.discId = EXTENDED_DESCRIPTION;
        this.creator = CREATOR_DATA;
        this.numberOfTracks = 80;
        this.numberOfSides = 1;
        this.statusregisterA = 0;
        this.statusregisterB = 0;
        this.sizeOfTrack = Math.max(1, Math.min(2, numberOfSides));
        this.extended = true;
        createSectorStructure();
    }

    /**
     * Checks a disk image for real existing number of tracks, comparing to
     * given number in dsk header If different, the disk image is being fixed.
     *
     * @param name file name
     * @param data image data
     */
    protected final void checkImage(byte[] data, String name) {
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
     * Creates a new instance of CPCDiscImage.
     *
     * @param name file name
     * @param data image data
     */
    public CPCDiscImage(String name, byte[] data) {
        this.name=name;
        jemu.core.device.floppy.UPD765A.error = false;
        this.newImage = false;
        this.discId = new String(data, 0, 0x22);
        this.creator = new String(data, 0x22, 0x0E);
        this.numberOfTracks = data[0x30] & 0xff;
        GAP = new int[numberOfTracks];
        Switches.numberOfTracks = numberOfTracks;
//        System.out.println("Numberof tracks is:" + numberOfTracks);
        this.numberOfSides = data[0x31] & 0xff;
        this.sizeOfTrack = Device.getWord(data, 0x32);
        this.extended = this.discId.toUpperCase().startsWith(EXTENDED_EYECATCHER);
        final boolean isCpcDisc = this.extended || this.discId.toUpperCase().startsWith(MV_CPC_EYECATCHER);
        final boolean winape = this.creator.equalsIgnoreCase(WIN_APE_EYECATCHER);

        // let's check the dsk image for bad track number information
        checkImage(data, name);

        createSectorStructure();
        if (isCpcDisc) {

            // track size information
            final byte[] trackSizes = new byte[256];
            if (this.extended) {
                System.arraycopy(data, 0x34, trackSizes, 0, this.numberOfTracks * this.numberOfSides);
            }

            // scan track data
            int offs = 0x100;
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {

                    // track length
                    int trackLength = this.sizeOfTrack;
                    if (this.extended) {
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
                            if (this.extended && !winape) {
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
     * Create a double sided image from two single sided images.
     *
     * @param newFileName new image file name
     * @param firstImage first image for side 0
     * @param secondImage second image for side 1
     * @throws IOException when merge fails
     */
    public CPCDiscImage(String newFileName, CPCDiscImage firstImage, CPCDiscImage secondImage) throws IOException {
        this.name = newFileName;
        this.newImage = true;
        this.discId = firstImage.discId;
        this.creator = firstImage.creator;
        this.numberOfTracks = Math.max(firstImage.numberOfTracks, secondImage.numberOfTracks);
        this.numberOfSides = 2;
        this.sizeOfTrack = firstImage.sizeOfTrack;
        this.extended = firstImage.extended;

        // check compatibility
        if (!firstImage.extended || !secondImage.extended) {
            throw new IOException("only extended images can be merged!");
        }
        if (firstImage.numberOfSides != 1 || secondImage.numberOfSides != 1) {
            throw new IOException("only single sided extended images can be merged!");
        }

        // set track data
        createSectorStructure();
        
        for (int sectTrack = 0; sectTrack < this.numberOfTracks; sectTrack++) {
    		int sectSide=0;
            for (int sector = 0; sector < 9; sector++) {
            	writeSector(sectTrack, sectSide,  sectTrack, sectSide, getSectorID(sectTrack, sectSide, sector)[2], sectSize,readSector(sectTrack, sectSide,  sectTrack, sectSide, getSectorID(sectTrack, sectSide, sector)[2], sectSize));
            }
            sectSide=1;
            for (int sector = 0; sector < 9; sector++) {
            	writeSector(sectTrack, sectSide,  sectTrack, sectSide, getSectorID(sectTrack, sectSide, sector)[2], sectSize,readSector(sectTrack, sectSide,  sectTrack, sectSide, getSectorID(sectTrack, sectSide, sector)[2], sectSize));
            }
        }
    }


    @Override
    public String getName() {
    	return name;
    }
    

    public boolean removeAllSectorsFromTrack(final int track, final int side) {
        if (!super.removeAllSectorsFromTrack(track, side)) {
            jemu.ui.Display.formaterror = 1;
            jemu.core.device.floppy.UPD765A.error = true;
            Samples.CORRUPTED.play();
            return false;
        }
        return true;
    }

    @Override
    public boolean addSectorToTrack(int track, int side, int c, int h, int r, int n, int fillerByte) {
        if (!super.addSectorToTrack(track, side, c, h, r, n, fillerByte)) {
            jemu.ui.Display.formaterror = 1;
            jemu.core.device.floppy.UPD765A.error = true;
            Samples.CORRUPTED.play();
            return false;
        }
        return true;
    }



    public void saveCheck() {
        saveImage();
    }



    /**
     * @return disc info if
     */
    public String getDiscId() {
        return this.discId;
    }

    /**
     * @return disc creator
     */
    public String getCreator() {
        return this.creator;
    }

    /**
     * @return number of tracks
     */
    public int getNumberOfTracks() {
        return this.numberOfTracks;
    }

    /**
     * @return number of sides
     */
    public int getNumberOfSides() {
        return this.numberOfSides;
    }

    /**
     * @return the track size
     */
    public int getSizeOfTrack() {
        return this.sizeOfTrack;
    }

    /**
     * @return <code>true</code> for extended disc format
     */
    public boolean isExtended() {
        return this.extended;
    }

    /**
     * Save CPC disc image as EXTENDED DSK image.
     */
    public void saveImage() {
        // create file name '_saved'
        final File discImage = new File(this.name);
        String saveFileName = discImage.getName();
        if (Switches.neverOverwrite) {
            SAVED_DSK = "_saved";
        } else {
            SAVED_DSK = "";
        }
        if (!this.newImage && SAVED_DSK.length() > 0) {
            final int dotPos = saveFileName.lastIndexOf('.');
            if (dotPos == -1) {
                if (!saveFileName.endsWith(SAVED_DSK)) {
                    saveFileName += SAVED_DSK;
                    saveFileName = checkNewSaveFile(discImage.getParent(), saveFileName, "");
                }
            } else {
                final String ext = saveFileName.substring(dotPos);
                if (!saveFileName.endsWith(SAVED_DSK + ext)) {
                    saveFileName = checkNewSaveFile(discImage.getParent(), saveFileName.substring(0, dotPos) + SAVED_DSK, ext);
                }
            }
        }
        saveImage(new File(discImage.getParent(), saveFileName));
    }

    /**
     * Save image.
     *
     * @param savedImage save file
     */
    //@Override
    public synchronized void saveImage(File savedImage) {
        if (!Switches.uncompressed) {
            saveDSZImage(savedImage);
            return;
        }
        if (System.getSecurityManager() != null) {
            try {
                System.getSecurityManager().checkWrite(savedImage.getAbsolutePath());
            } catch (final SecurityException sex) {
                // don't save
                return;
            }
        }

//        System.out.println("store dsk file to " + savedImage);
        this.name = savedImage.getAbsolutePath();
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
            bos.write(EXTENDED_DESCRIPTION.getBytes(ENCODING));
            bos.write(CREATOR_DATA.getBytes(ENCODING));
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
                    bos.write(TRACK_INFO.getBytes(ENCODING));
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

    /**
     * get image as byte[].
     *
     *
     */
    //@Override
    public synchronized byte[] getImage() {

        byte[] predata = new byte[0x100000];
        int prepos = 0;
        try {
            // disc information block     
            byte[] dat = EXTENDED_DESCRIPTION.getBytes(ENCODING);
            System.arraycopy(dat, 0, predata, prepos, dat.length);
            prepos += dat.length;
            dat = (CREATOR_DATA.getBytes(ENCODING));
            System.arraycopy(dat, 0, predata, prepos, dat.length);
            prepos += dat.length;
            predata[prepos++] = (byte) this.numberOfTracks;
            predata[prepos++] = (byte) this.numberOfSides;
            predata[prepos++] = (byte) 0;
            predata[prepos++] = (byte) 0;

            // track size table
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {
                    try {
                        final int trackLength = getTrack(track,side).getLength();
                        predata[prepos++] = (byte) ((trackLength / 256) & 0xFF);
                    } catch (Exception e) {
                    }
                }
            }
            int unused = 0x100 - 0x34 - this.numberOfTracks * this.numberOfSides;
            for (int i = 0; i < unused; i++) {
                predata[prepos++] = (byte) 0;
            }

            // track data
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {
                    final CPCDiscImageTrack td = getTrack(track,side);
                    // track information block
                    dat = (TRACK_INFO.getBytes(ENCODING));
                    System.arraycopy(dat, 0, predata, prepos, dat.length);
                    prepos += dat.length;
                    predata[prepos++] = (byte) 0;
                    predata[prepos++] = (byte) 0;
                    predata[prepos++] = (byte) 0;
                    predata[prepos++] = (byte) 0;
                    predata[prepos++] = (byte) (td.getTrack());
                    predata[prepos++] = (byte) (td.getSide());
                    predata[prepos++] = (byte) 0;
                    predata[prepos++] = (byte) 0;
                    predata[prepos++] = (byte) (td.getSector(0).getSize()); // UPD765A size
                    final int numberOfSectors = td.getSectorCount();
                    predata[prepos++] = (byte) (numberOfSectors);
                    predata[prepos++] = (byte) (0x4e); // GAP#3 length
                    predata[prepos++] = (byte) (0xe5); // filler byte

                    // sector information list
                    for (int sector = 0; sector < numberOfSectors; sector++) {
                        final CPCDiscImageSector sd = td.getSector(sector);
                        predata[prepos++] = (byte) (sd.getTrack());
                        predata[prepos++] = (byte) (sd.getSide());
                        predata[prepos++] = (byte) (sd.getId());
                        predata[prepos++] = (byte) (sd.getSize()); // UPD765A size
                        predata[prepos++] = (byte) (0); // FDC status register 1
                        predata[prepos++] = (byte) (0); // FDC status register 2
                        final int dataSize = sd.getData().length;
                        predata[prepos++] = (byte) (dataSize & 0xFF);
                        predata[prepos++] = (byte) ((dataSize / 256) & 0xFF);
                        // System.out.println("sec " + sd.getTrack() + "/" + sd.getSide() + "/" + sd.getId() + "/"
                        // + UPD765A.getCommandSize(sd.getSize()) + " size=" + sd.getData().length);
                        // System.out.println(" -> " + (dataSize & 0xFF) + " / " + ((dataSize / 256) & 0xFF));
                    }
                    unused = 0x100 - 0x18 - 8 * numberOfSectors;
                    for (int i = 0; i < unused; i++) {
                        predata[prepos++] = (byte) (0);
                    }
                    for (int sector = 0; sector < numberOfSectors; sector++) {
                        dat = (td.getSector(sector).getData());
                        dat = (td.getSector(sector).getData());
                        System.arraycopy(dat, 0, predata, prepos, dat.length);
                        prepos += dat.length;
                    }
                }
            }
            byte[] dskdata = new byte[prepos];
            System.arraycopy(predata, 0, dskdata, 0, dskdata.length);
            return dskdata;

        } catch (final Exception e) {
//            System.out.println("can't write to file " + savedImage + ": " + iox.getMessage());
        }
        return null;
    }

    public synchronized void saveDSZImage(File savedImage) {
        if (System.getSecurityManager() != null) {
            try {
                System.getSecurityManager().checkWrite(savedImage.getAbsolutePath());
            } catch (final SecurityException sex) {
                // don't save
                return;
            }
        }

//        System.out.println("store dsk file to " + savedImage);
        this.name = savedImage.getAbsolutePath();
        if (name.toLowerCase().endsWith(".zip") || name.toLowerCase().endsWith(".dsk")) {
            name = name.substring(0, name.length() - 4);
        }
        if (!name.toLowerCase().endsWith(".dsz")) {
            name = name + ".dsz";
        }
        // save data to file  File gzip_output = new File (filename  + savename);
        File gzip_output = new File(name);
        GZIPOutputStream bos;

        try {
            FileOutputStream outp = new FileOutputStream(gzip_output);
            bos
                    = new GZIPOutputStream(new BufferedOutputStream(outp));
            // disc information block
            bos.write(EXTENDED_DESCRIPTION.getBytes(ENCODING));
            bos.write(CREATOR_DATA.getBytes(ENCODING));
            bos.write(this.numberOfTracks);
            bos.write(this.numberOfSides);
            bos.write(0);
            bos.write(0);

            // track size table
            for (int track = 0; track < this.numberOfTracks; track++) {
                for (int side = 0; side < this.numberOfSides; side++) {
                    final int trackLength = getTrack(track,side).getLength();
                    bos.write((trackLength / 256) & 0xFF);
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
                    // track information block
                    bos.write(TRACK_INFO.getBytes(ENCODING));
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

        } catch (final IOException iox) {
//            System.out.println("can't write to file " + savedImage + ": " + iox.getMessage());
        }
    }

    /**
     * Check for a new save file name. Don't overwrite an existing save file!
     *
     * @param directory to save to
     * @param fileName new save file name
     * @param ext extension of save file
     * @return not existing save file name
     */
    private String checkNewSaveFile(final String directory, final String fileName, final String ext) {
        String result = fileName + ext;
        File saveFile = new File(directory, result);
        int index = 1;
        int counter = 10000;
        while (saveFile.exists()) {
            result = fileName + Integer.toString(index++) + ext;
            saveFile = new File(directory, result);
            if (--counter < 0) {
                break;
            }
        }
        return result;
    }

    static byte[] load(final InputStream is) throws IOException {
        if (is == null) {
            return new byte[0];
        } // if
        final int bufferSize = BUFFER_SIZE;
        byte[] tmpData = new byte[bufferSize];
        int offs = 0;
        int addOn = BUFFER_SIZE * 2;
        do {
            final int readLen = is.read(tmpData, offs, tmpData.length - offs);
            if (readLen == -1) {
                break;
            } // if
            offs += readLen;
            if (offs == tmpData.length) {
                final byte[] newres = new byte[tmpData.length + addOn];
                if (addOn < 1048576) {
                    addOn = addOn * 2;
                } // if
                System.arraycopy(tmpData, 0, newres, 0, tmpData.length);
                tmpData = newres;
            } // if
        } while (true);
        is.close();
        final byte[] data = new byte[offs];
        System.arraycopy(tmpData, 0, data, 0, offs);
        return data;
    }

    public void SaveDSK() {
        saveImage();
    }
}
