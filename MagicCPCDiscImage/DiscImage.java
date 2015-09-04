package jemu.core.device.floppy;

/**
 * Provides an abstract Disc Image class. With some ability to get/set sector information for
 * each cylinder and head.
 *
 * @author Richard Wilson
 */
public abstract class DiscImage {
  
  protected String name;
  
  public DiscImage(String name) {
    this.name = name;
  }
  
  public String getName() {
    return name;
  }
  
  public abstract byte[] readSector(int cylinder, int head, int c, int h, int r, int n);
  
  public abstract int getSectorCount(int cylinder, int head);
  
  public abstract int[] getSectorID(int cylinder, int head, int index);

  public abstract void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n);
  public abstract void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n);
  
}
