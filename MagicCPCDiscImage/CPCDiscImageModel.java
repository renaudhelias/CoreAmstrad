package jemu.system.cpc;


import jemu.core.device.floppy.DiscImage;
import jemu.core.device.floppy.IDiscImage;

/**
 * CPCDiscImage Model, in a point of view of IDiscImage (IO)
 * @author Joe
 *
 */
public abstract class CPCDiscImageModel extends DiscImage implements IDiscImage {

	private static final int SIDE_MASK = 1;
    private static final int MAX_TRACK = 79;

    /**
     * number of tracks.
     */
    protected int numberOfTracks;
    protected int[] GAP = new int[168];
    protected int oldst1, oldst2;
    /**
     * the tracks.
     */
    protected CPCDiscImageTrack[][] tracks = null;

    public CPCDiscImageModel() {
    	// nothing (it's a model)
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

}
