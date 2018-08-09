/*
 * DiscImage.java
 *
 * Created on 29 July 2006, 11:50
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package jemu.core.device.floppy;

import java.io.File;

/**
 * Title: JavaCPC Description: The Java Amstrad CPC Emulator Copyright:
 * Copyright (c) 2006-2010 Company:
 *
 * @author
 * @version 6.8
 */
/**
 *
 * @author Richard
 */
public abstract class DiscImage {

    protected String name;

    public DiscImage(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public abstract void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n);

    public abstract void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n);

    public abstract int getNoOfTracks();
    
    public abstract int getGap(int track);

    public abstract void removeAllSectorsFromTrack(int cylinder, int head);

    public abstract void addSectorToTrack(int cylinder, int head, int c, int h, int r, int n, int fillerByte);

    public abstract int getST1ForSector(int cylinder, int head, int c, int h, int r, int n);

    public abstract int getST2ForSector(int cylinder, int head, int c, int h, int r, int n);

    public abstract void setST1ForSector(int cylinder, int head, int c, int h, int r, int n, int st1);

    public abstract void setST2ForSector(int cylinder, int head, int c, int h, int r, int n, int st2);

    public abstract byte[] readSector(int cylinder, int head, int c, int h, int r, int n);

    public abstract int getSectorCount(int cylinder, int head);

    public abstract int[] getSectorID(int cylinder, int head, int index);

    public abstract void writeSector(int cylinder, int head, int c, int h, int r, int n, byte[] data);

    /**
     * Save the disc image.
     */
    public abstract void saveImage(File saveFile);

    public abstract byte[] getImage();
}
