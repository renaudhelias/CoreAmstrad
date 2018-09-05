package jemu.system.cpc;


import jemu.core.device.floppy.DiscImage;
import jemu.core.device.floppy.IDiscImage;
import jemu.core.device.floppy.UPD765A;

/**
 * CPCDiscImage Model, in a point of view of IDiscImage (IO)
 * @author Joe
 *
 */
public abstract class CPCDiscImageModel extends DiscImage implements IDiscImage {

	private static final int SIDE_MASK = 1;
    private static final int MAX_TRACK = 79;
    //private static final int[] AMSDOS_SECTOR_IDS = {0xC1, 0xC3, 0xC5, 0xC7, 0xC9, 0xC2, 0xC4, 0xC6, 0xC8};
    private static final int[] AMSDOS_SECTOR_IDS = {0xC1, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9};

    /**
     * number of sides.
     */
    protected int numberOfSides;
    /**
     * number of tracks.
     */
    protected int numberOfTracks;
    protected int statusregisterA;
    protected int statusregisterB;
    protected int[] GAP = new int[168];

    protected int oldst1, oldst2;
    /**
     * the tracks.
     */
    private CPCDiscImageTrack[][] tracks = null;

    public CPCDiscImageModel() {
    	// nothing (it's a model)
    }
    
    int getSectorIndex(int r) {
    	for (int i = 0;i<AMSDOS_SECTOR_IDS.length;i++) {
    		if (AMSDOS_SECTOR_IDS[i] == r) {
    			return i;
    		}
    	}
    	return 0;
    }

    @Override
    public void createSectorStructure() {
        this.tracks = new CPCDiscImageTrack[this.numberOfTracks][this.numberOfSides];
        final int sectorSize = UPD765A.getCommandSize(512);
        for (int track = 0; track < this.numberOfTracks; track++) {
            for (int side = 0; side < this.numberOfSides; side++) {
                this.tracks[track][side] = new CPCDiscImageTrack(track, side, 9 * 512, 9);
                for (int sector = 0; sector < 9; sector++) {
                    final byte[] data = new byte[512];
                    for (int i = 0; i < data.length; i++) {
                        data[i] = (byte) 0xe5;
                    }
                    this.tracks[track][side].setSector(new CPCDiscImageSector(track, side, AMSDOS_SECTOR_IDS[sector], sectorSize,
                            data, statusregisterA, statusregisterB), sector);
                }
            }
        }

    }
    
    @Override
    public int getNoOfTracks() {
        return numberOfTracks;
    }
    @Override
    public int getGap(int track){
        return GAP[track];
    }
    @Override
    public int getSectorCount(final int track, final int side) {
        int result = 0;
        try {
            result = track > MAX_TRACK ? 0 : this.tracks[track][side & SIDE_MASK].getSectorCount();
        } catch (Exception e) {
        }
        return result;
    }

    
    
    public boolean removeAllSectorsFromTrack(final int track, final int side) {
    	try {
    		this.tracks[track][side & SIDE_MASK].removeAllSectorsFromTrack();
    	} catch (Exception e) {
    		return false;
    	}
    	return true;
    }
    
    

    @Override
    public boolean addSectorToTrack(int track, int side, int c, int h, int r, int n, int fillerByte) {
    	try {
    		this.tracks[track][side & SIDE_MASK].addSectorToTrack(c, h, r, n, fillerByte);
    	} catch (Exception e) {
    		return false;
    	}
    	return true;
    }
    
    public CPCDiscImageTrack getTrack(final int track, final int side) {
    	return this.tracks[track][side & SIDE_MASK];
    }

    @Override
    public byte[] readSector(final int track, final int side, final int c, final int h, final int r, final int n) {
        if (track <= MAX_TRACK) {
            try {
                return this.tracks[track][side & SIDE_MASK].getSectorData(c, h, r, n);
            } // n = UPD765A size
            catch (Exception e) {
            }
        }
        return null;
    }
    
    @Override
    public int[] getSectorID(final int track, final int side, final int index) {
        return this.tracks[track][side & SIDE_MASK].getSectorIDs(index);
    }
    
    @Override
    public void writeSector(final int track,
            final int side,
            final int c,
            final int h,
            final int r,
            final int n,
            final byte[] data) {
    	this.tracks[track][side & SIDE_MASK].setSectorData(c, h, r, n,data);
    }

    
    
    @Override
    public int getST1ForSector(final int track, final int side, final int c, final int h, final int r, final int n) {
        try {
            oldst1 = this.tracks[track][side & SIDE_MASK].getST1(c, h, r, n);
        } catch (Exception e) {
        }
        return oldst1;
    }

    @Override
    public void setST1ForSector(final int track, final int side, final int c, final int h, final int r, final int n, final int st1) {
        try {
            this.tracks[track][side & SIDE_MASK].setST1(c, h, r, n, st1);
        } catch (Exception e) {
        }
    }

    @Override
    public int getST2ForSector(final int track, final int side, final int c, final int h, final int r, final int n) {
        try {
            oldst2 = this.tracks[track][side & SIDE_MASK].getST2(c, h, r, n);
        } catch (Exception e) {
        }
        return oldst2;
    }

    @Override
    public void setST2ForSector(final int track, final int side, final int c, final int h, final int r, final int n, final int st2) {
        try {
            this.tracks[track][side & SIDE_MASK].setST2(c, h, r, n, st2);
        } catch (Exception e) {
        }
    }
    
    /**
     * @return number of sides
     */
    @Override
    public int getNumberOfSides() {
    	return numberOfSides;
    }

}
