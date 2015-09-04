package jemu.core.device.floppy;

import jemu.core.device.*;

/**
 * Emulated single Disc Drive which can hold either a double-sided disc image or one per head.
 * The Drive itself can be write protected, have a ready state and a current cylinder position
 * for the heads.
 *
 * TODO: Support for full track bitmaps and accurate rotation speeds.
 *
 * @author Richard Wilson
 */
public class Drive extends Device {

  public static final int HEAD_0         = 1;
  public static final int HEAD_1         = 2;
  public static final int BOTH_HEADS     = 3;

  protected boolean       ready          = true;
  protected boolean       active         = false;
  protected boolean       writeProtected = true;
  protected int           cylinder       = 0;
  protected int           head           = 0;
  protected int           sector         = 0;
  protected int           sides          = 1;
  protected DiscImage[]   discs          = new DiscImage[2]; // Possible one for each head

  protected DriveListener activeListener = null;

  /** Creates a new instance of Drive */
  public Drive(int sides) {
    super(null);
    setSides(sides);
  }
  
  public void setSides(int sides) {
    this.sides = sides;
    name = (sides == 1 ? "Single" : "Double") + "-Sided Floppy Drive";
  }

  public void setDisc(int heads, DiscImage value) {
    if ((heads & 0x01) != 0)
      discs[0] = value;
    if ((heads & 0x02) != 0)
      discs[1] = value;
  }
  
  public DiscImage getDisc(int head) {
    return discs[head - 1];
  }

  public boolean isReady() {
    return ready;
  }

  public boolean isActive() {
    return active;
  }

  public boolean isWriteProtected() {
    return writeProtected;
  }

  public void setActiveListener(DriveListener value) {
    activeListener = value;
  }

  public void setActive(boolean value) {
    if (active != value) {
      active = value;
      if (activeListener != null)
        activeListener.driveActiveChanged(this, active);
    }
  }

  public void setCylinder(int value) {
    cylinder = value;
  }

  public int getCylinder() {
    return cylinder;
  }

  public void setHead(int value) {
    head = value & (sides - 1);
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
    if (discs[head] == null)
      return null;
    int count = discs[head].getSectorCount(cylinder, head);
    return count > 0 ? discs[head].getSectorID(cylinder, head, sector = (sector + 1) % count) : null;
  }

  public byte[] getSector(int c, int h, int r, int n) {
    return discs[head] == null ? null : discs[head].readSector(cylinder, head, c, h, r, n);
  }

  public void resetSector() {
    sector = 0;
  }
  
  public boolean step(int dir) {
    cylinder += dir;
    if (cylinder < 0) cylinder = 0;
    return cylinder == 0;
  }

public void notifyWriteSectorByte(byte data,int c, int h, int r, int n) {
	discs[head].notifyWriteSector(data, cylinder, head, c, h, r, n);
}

public void notifyReadSectorByte(boolean beginOfSector, int c, int h, int r, int n) {
	discs[head].notifyReadSector(beginOfSector, cylinder, head, c, h, r, n);
}

}
