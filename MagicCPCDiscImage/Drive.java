/*
 * Drive.java
 *
 * Created on 28 July 2006, 18:07
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package jemu.core.device.floppy;

import jemu.core.device.*;

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
public class Drive extends Device {

    protected boolean DEBUG = false;
    public static final int HEAD_0 = 1;
    public static final int HEAD_1 = 2;
    public static final int BOTH_HEADS = 3;
    protected boolean ready = true;
    protected boolean active = false;
    protected boolean writeProtected = true;
    protected int cylinder = 0;
    protected int head = 0;
    protected int sector = 0;
    protected int sides = 1;
    protected DiscImage[] discs = new DiscImage[2]; // Possible one for each head
    protected DriveListener activeListener = null;
    
    /**
     * forced head to use.
     */
    private int forcedHead = 0;

    /**
     * Creates a new instance of Drive
     */
    public Drive(int sides) {
        super(null);
        setSides(sides);
    }

    public void setSides(int sides) {
        this.sides = sides;
        name = (sides == 1 ? "Single" : "Double") + "-Sided Floppy Drive";
    }

    public void setDisc(int heads, DiscImage value) {
        if ((heads & 0x01) != 0) {
            discs[0] = value;
        }
        if ((heads & 0x02) != 0) {
            discs[1] = value;
        }
    }

    public DiscImage getDisc(int head) {
        return discs[head];
    }

    public int getGap(int track){
        return discs[head] == null? 0:discs[head].getGap(track);
    }
    public int getSector() {
        return sector;
    }

    public boolean isReady() {
        return ready;
    }

    public boolean isActive() {
        return active;
    }

    public boolean isWriteProtected() {
        // if (Switches.unprotect)
        writeProtected = false;
        // else
        //     writeProtected = true;
        return writeProtected;
    }

    public void setActiveListener(DriveListener value) {
        activeListener = value;
    }

    public void setActive(boolean value) {
        if (active != value) {
            active = value;
            if (activeListener != null) {
                activeListener.driveActiveChanged(this, active);
            }
        }
    }

    public void setCylinder(int value) {
        cylinder = value;
    }

    public int getCylinder() {
        return cylinder;
    }

    public void setHead(int value) {
        if (this.sides != 2) {
            this.head = 0;
            return;
        }
        this.head = (value | this.forcedHead) & 1;
    }

    /**
     * Set forced head to use.
     *
     * @param head head 0/1
     */
    public void setForcedHead(final int head) {
        this.forcedHead = head;
    }

    /**
     * Return forced head.
     *
     * @return 0/1
     */
    public int getForcedHead() {
        return this.forcedHead;
    }

    public int getHead() {
        return head;
    }

    public int getSides() {
        return sides;
    }

    public int getSectorCount() {
        return discs[head] == null ? 0 : discs[head].getSectorCount(cylinder, head);
    }

    public int[] getNextSectorID() {
        if (discs[head] == null) {
            return null;
        }
        int count = discs[head].getSectorCount(cylinder, head);
        return count > 0 ? discs[head].getSectorID(cylinder, head, sector = (sector + 1) % count) : null;
    }

    public int[] getSectorID() {
        if (discs[head] == null) {
            return null;
        }
        int count = discs[head].getSectorCount(cylinder, head);
        return count > 0 ? discs[head].getSectorID(cylinder, head, sector = (sector) % count) : null;
    }

    public int[] getReadID() {
        if (this.discs[this.head] == null) {
            return null;
        }
        final int count = this.discs[this.head].getSectorCount(this.cylinder, this.head);
        return count > 0 ? this.discs[this.head].getSectorID(this.cylinder, this.head, this.sector = (this.sector) % count) : null;
    }

    public void removeAllSectorsFromTrack() {
        if (discs[head] != null) {
            discs[head].removeAllSectorsFromTrack(cylinder, head);
        }
    }

    public void addSectorToTrack(int c, int h, int r, int n, int fillerByte) {
        if (discs[head] != null) {
            discs[head].addSectorToTrack(cylinder, head, c, h, r, n, fillerByte);
        }
    }

    public int getST1ForSector(int c, int h, int r, int n) {
        if (DEBUG) {
            System.out.println(" C:" + c + " H:" + h + " R:" + r + " N:" + n);
        }
        return discs[head] == null ? 0 : discs[head].getST1ForSector(cylinder, head, c, h, r, n);
    }

    public int getST2ForSector(int c, int h, int r, int n) {
        if (DEBUG) {
            System.out.println(" C:" + c + " H:" + h + " R:" + r + " N:" + n);
        }
        return discs[head] == null ? 0 : discs[head].getST2ForSector(cylinder, head, c, h, r, n);
    }

    public void setST1ForSector(int c, int h, int r, int n, int st1) {
        if (DEBUG) {
            System.out.println(" C:" + c + " H:" + h + " R:" + r + " N:" + n);
        }
        discs[head].setST1ForSector(cylinder, head, c, h, r, n, st1);
    }

    public void setST2ForSector(int c, int h, int r, int n, int st2) {
        if (DEBUG) {
            System.out.println(" C:" + c + " H:" + h + " R:" + r + " N:" + n);
        }
        discs[head].setST2ForSector(cylinder, head, c, h, r, n, st2);
    }

    public byte[] getSector(int c, int h, int r, int n) {
        if (DEBUG) {
            System.out.println(" C:" + c + " H:" + h + " R:" + r + " N:" + n);
        }
        return discs[head] == null ? null : discs[head].readSector(cylinder, head, c, h, r, n);
    }

    public void resetSector() {
        sector = 0;
    }

    public void writeSector(final int c, final int h, final int r, final int n, final byte[] data) {
        if (this.discs[this.head] != null) {
            this.discs[this.head].writeSector(this.cylinder, this.head, c, h, r, n, data);
        }
    }

    public int getTracks() {
        if (this.discs[this.head] != null) {
            return this.discs[this.head].getNoOfTracks();
        }
        return 0;
    }

    public boolean step(int dir) {
        cylinder += dir;
        if (cylinder < 0) {
            cylinder = 0;
        }
        return cylinder == 0;
    }

    public void notifyWriteSectorByte(byte data, int c, int h, int r, int n) {
        discs[head].notifyWriteSector(data, cylinder, head, c, h, r, n);
    }

    public void notifyReadSectorByte(boolean beginOfSector, int c, int h, int r, int n) {
        discs[head].notifyReadSector(beginOfSector, cylinder, head, c, h, r, n);
    }
}
