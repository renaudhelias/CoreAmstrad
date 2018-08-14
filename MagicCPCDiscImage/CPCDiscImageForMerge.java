/*
 * CPCDiscImageForMerge.java
 *
 * Created on 11 March 2007, 12:19
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package jemu.system.cpc;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

import jemu.core.device.Device;
import jemu.core.device.floppy.DiscImage;
import jemu.core.device.floppy.UPD765A;
/**
 * Title:        JavaCPC
 * Description:  The Java Amstrad CPC Emulator
 * Copyright:    Copyright (c) 2006-2010
 * Company:
 * @author
 * @version 6.8
 */
/**
 * CPC disc image.
 * 
 * @author Roland.Barthel
 */
public class CPCDiscImageForMerge extends DiscImage {

//  public  void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n){
//      
//  }
//  public  void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n){
//      
//  }
    public boolean addSectorToTrack(int a, int b, int c, int d, int e, int f, int g){return false;}
    public boolean removeAllSectorsFromTrack(int a, int b){return false;}

    //private static final String         SAVED_DSK            = "_saved";
    private static final String SAVED_DSK = "";
    private static final String WIN_APE_EYECATCHER = "Win APE 32 1.0";
    private static final String MV_CPC_EYECATCHER = "MV - CPC";
    private static final String EXTENDED_EYECATCHER = "EXTENDED";
    private static final String EXTENDED_DESCRIPTION = EXTENDED_EYECATCHER + " CPC DSK File\r\nDisk-Info\r\n";
    private static final String CREATOR_DATA = "JCPC DOUBLEDSK";
    private static final String ENCODING = "UTF-8";
    private static final String TRACK_INFO = "Track-Info\r\n";
    private static final int SIDE_MASK = 1;
    private static final int MAX_TRACK = 79;
    private static final int BUFFER_SIZE = 8192;
    private static final int[] AMSDOS_SECTOR_IDS = {0xC1, 0xC3, 0xC5, 0xC7, 0xC9, 0xC2, 0xC4, 0xC6, 0xC8};
    /** new image or loaded? */
    private final boolean newImage;

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
    /** disc name. */
	private String name;
    /** disc info. */
    private final String discId;
    /** name of creator. */
    private final String creator;
    /** number of tracks. */
    private final int numberOfTracks;
    /** number of sides. */
    private final int numberOfSides;
    /** size of a track . */
    private final int sizeOfTrack;
    /** extended DISK format? (Revision 5) */
    private final boolean extended;
    /** the tracks. */
    private final CPCDiscImageTrack[][] tracks;

    /**
     * Creates a new instance of CPCDiscImage.
     *
     * @param name file name
     * @param is image input stream
     * @return the disc image
     * @throws IOException when image creation fails
     */
    public static CPCDiscImageForMerge create(final String name, final InputStream is) throws IOException {
        return new CPCDiscImageForMerge(name, load(is));
    }

    public int getNoOfTracks(){
        return numberOfTracks;
    }
    /**
     * Create an empty AMSDOS disc image.
     *
     * @param name file name
     * @param numberOfSides number of sides 1/2
     */
    public CPCDiscImageForMerge(String name, int numberOfSides) {
        this.name=name;
        this.newImage = true;
        this.discId = EXTENDED_DESCRIPTION;
        this.creator = CREATOR_DATA;
        this.numberOfTracks = 40;
        this.numberOfSides = 1;
        this.sizeOfTrack = Math.max(1, Math.min(2, numberOfSides));
        this.extended = true;
        this.tracks = new CPCDiscImageTrack[this.numberOfTracks][this.numberOfSides];
        final int sectorSize = UPD765A.getCommandSize(512);
        for (int track = 0; track < this.numberOfTracks; track++) {
            for (int side = 0; side < this.numberOfSides; side++) {
                this.tracks[track][side] = new CPCDiscImageTrack(track, side, 9 * 512, 9);
                for (int sector = 0; sector < 9; sector++) {
                    final byte[] data = new byte[512];
                    for (int i = 0; i < data.length; i++) {
                        data[i] = 0;
                    }
                    this.tracks[track][side].setSector(new CPCDiscImageSector(track, side, AMSDOS_SECTOR_IDS[sector], sectorSize,
                            data,0,0), sector);
                }
            }
        }
    }

    public int getGap(int track){
        return 0;
    }
    /**
     * Creates a new instance of CPCDiscImage.
     *
     * @param name file name
     * @param data image data
     */
    public CPCDiscImageForMerge(String name, byte[] data) {
        this.name=name;
        this.newImage = false;
        this.discId = new String(data, 0, 0x22);
        this.creator = new String(data, 0x22, 0x0E);
        this.numberOfTracks = data[0x30] & 0xff;
        this.numberOfSides = data[0x31] & 0xff;
        this.sizeOfTrack = Device.getWord(data, 0x32);
        this.extended = this.discId.toUpperCase().startsWith(EXTENDED_EYECATCHER);
        final boolean isCpcDisc = this.extended || this.discId.toUpperCase().startsWith(MV_CPC_EYECATCHER);
        final boolean winape = this.creator.equalsIgnoreCase(WIN_APE_EYECATCHER);

        this.tracks = new CPCDiscImageTrack[this.numberOfTracks][this.numberOfSides];

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
                    }
                    if (trackLength != 0 && offs < data.length) {
                        // track information block
                        final int sot = offs;
                        final int numberOfSectors = data[offs + 0x15] & 0xff;
                        int sectorInformationPos = offs + 0x18;
                        this.tracks[track][side] = new CPCDiscImageTrack(track, side, trackLength, numberOfSectors);

                        // read sector data
                        offs += 0x100;
                        for (int sect = 0; sect < numberOfSectors; sect++) {

                            // sector information list
                            final int sectTrack = data[sectorInformationPos++] & 0xff; // C
                            final int sectSide = data[sectorInformationPos++] & 0xff; // H
                            final int sectId = data[sectorInformationPos++] & 0xff; // R
                            int sectSize = data[sectorInformationPos++] & 0xff; // N
                            sectorInformationPos += 2; // FDC status register 1/2
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
                            System.arraycopy(data, offs, sectData, 0, bytes);
                            offs += bytes;
                            this.tracks[track][side].setSector(new CPCDiscImageSector(sectTrack, sectSide, sectId, sectSize, sectData,0,0), sect);
                        }
                        if (!winape) {
                            offs = sot + trackLength;
                        }
                    }
                }
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
    public CPCDiscImageForMerge(String newFileName, CPCDiscImageForMerge firstImage, CPCDiscImageForMerge secondImage) throws IOException {
    	this.name=newFileName;
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
        this.tracks = new CPCDiscImageTrack[this.numberOfTracks][this.numberOfSides];
        for (int i = 0; i < firstImage.numberOfTracks; i++) {
            this.tracks[i][0] = firstImage.tracks[i][0];
        }
        for (int i = 0; i < secondImage.numberOfTracks; i++) {
            final CPCDiscImageTrack track = secondImage.tracks[i][0];
            track.setSide(1);
            this.tracks[i][1] = track;
        }

    }
    
    public String getName() {
    	return name;
    }

    //@Override
    public byte[] readSector(final int track, final int side, final int c, final int h, final int r, final int n) {
        if (track <= MAX_TRACK) {
            return this.tracks[track][side & SIDE_MASK].getSectorData(c, h, r, n); // n = UPD765A size
        }
        return null;
    }

    //@Override
    public int[] getSectorID(final int track, final int side, final int index) {
        return this.tracks[track][side & SIDE_MASK].getSectorIDs(index);
    }

    //@Override
    public int getSectorCount(final int track, final int side) {
        return track > MAX_TRACK ? 0 : this.tracks[track][side & SIDE_MASK].getSectorCount();
    }

    //@Override
    public void writeSector(final int track,
            final int side,
            final int c,
            final int h,
            final int r,
            final int n,
            final byte[] data) {
        final CPCDiscImageTrack td = this.tracks[track][side & SIDE_MASK];
        td.setSectorData(c, h, r, n, data); // n = UPD765A size
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
     * @return track data for both sides
     */
    public CPCDiscImageTrack[][] getTracks() {
        return this.tracks;
    }

    /**
     * Save CPC disc image as EXTENDED DSK image.
     */
    public void saveImage() {
        saveImage(new File(this.name));
    }

    public synchronized byte[] getImage(){
        return null;
    }
    public synchronized void saveImage(File discImage) {
        // create file name '_saved'
        String saveFileName = discImage.getName();
        if (!this.newImage) {
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
        final File savedImage = new File(discImage.getParent(), saveFileName);
        if (System.getSecurityManager() != null) {
            try {
                System.getSecurityManager().checkWrite(savedImage.getAbsolutePath());
            } catch (final SecurityException sex) {
                // don't save
                return;
            }
        }

        System.out.println("store dsk file to " + savedImage);
        JOptionPane.showMessageDialog(null, "Sucessfully saved " + savedImage);
        this.name = savedImage.getAbsolutePath();

        // save data to file
        try {
            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(savedImage));
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
                    final int trackLength = this.tracks[track][side].getLength();
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
                    final CPCDiscImageTrack td = this.tracks[track][side];
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
                        bos.write(0); // FDC status register 1
                        bos.write(0); // FDC status register 2
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
            System.out.println("can't write to file " + savedImage + ": " + iox.getMessage());
        }
    }

    //
    // Allow User to save a DSK
    //
        final JFileChooser fc = new JFileChooser();
    public synchronized void UserSave() {
        // choose destination file
        fc.setDialogTitle("Select destination dsk file...");
        int result = fc.showSaveDialog(null);
        final String newFileName = fc.getSelectedFile().getAbsolutePath();

        // create file name '_saved'
        final File discImage = new File(newFileName);
        String saveFileName = discImage.getName();
        if (!this.newImage) {
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
        final File savedImage = new File(discImage.getParent(), saveFileName);
        if (System.getSecurityManager() != null) {
            try {
                System.getSecurityManager().checkWrite(savedImage.getAbsolutePath());
            } catch (final SecurityException sex) {
                // son't save
                return;
            }
        }

        System.out.println("store dsk file to " + savedImage);
        this.name = savedImage.getAbsolutePath();

        // save data to file
        try {
            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(savedImage));
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
                    final int trackLength = this.tracks[track][side].getLength();
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
                    final CPCDiscImageTrack td = this.tracks[track][side];
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
                        bos.write(0); // FDC status register 1
                        bos.write(0); // FDC status register 2
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
            System.out.println("can't write to file " + savedImage + ": " + iox.getMessage());
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

    public void addSector(final int track, final int side, final int c, final int h, final int r, final int n) {
    }

    public void clearTrack(final int a, final int b, final byte n) {
    }

    public void addTrack(final int a, final byte n) {
    }

    public void removeSector(final int track, final int side, final int c, final int h) {
    }
    
	public int getST1ForSector(final int track, final int side, final int c, final int h, final int r, final int n)
	{
		return this.tracks[track][side & SIDE_MASK].getST1(c,h,r,n);
	}

	public int getST2ForSector(final int track, final int side, final int c, final int h, final int r, final int n)
	{
		return this.tracks[track][side & SIDE_MASK].getST2(c,h,r,n);
	}

	public void setST1ForSector(final int track, final int side, final int c, final int h, final int r, final int n, final int st1)
	{
		this.tracks[track][side & SIDE_MASK].setST1(c,h,r,n,st1);
	}

	public void setST2ForSector(final int track, final int side, final int c, final int h, final int r, final int n, final int st2)
	{
		this.tracks[track][side & SIDE_MASK].setST2(c,h,r,n,st2);
	}

}