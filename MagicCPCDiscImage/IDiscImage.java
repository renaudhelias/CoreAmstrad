package jemu.core.device.floppy;

/**
 * Just IO access into the CPCDiscImageModel
 * @author Joe
 *
 */
public interface IDiscImage {

	
	//public void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n);

	//public void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n);

    public int getNoOfTracks();
    public int getGap(int track);
    public int getSectorCount(int cylinder, int head);

    public boolean removeAllSectorsFromTrack(int cylinder, int head);

    public boolean addSectorToTrack(int cylinder, int head, int c, int h, int r, int n, int fillerByte);

    public byte[] readSector(int cylinder, int head, int c, int h, int r, int n);
    public int[] getSectorID(int cylinder, int head, int index);
    public void writeSector(int cylinder, int head, int c, int h, int r, int n, byte[] data);

    public int getST1ForSector(int cylinder, int head, int c, int h, int r, int n);
    public void setST1ForSector(int cylinder, int head, int c, int h, int r, int n, int st1);

    public int getST2ForSector(int cylinder, int head, int c, int h, int r, int n);
    public void setST2ForSector(int cylinder, int head, int c, int h, int r, int n, int st2);


}
