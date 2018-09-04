package jemu.system.cpc;

public class CPCDiscImageDesc {

	/*
	 * Used during load
	 */
	public static final String EXTENDED_EYECATCHER = "EXTENDED";
	public static final String MV_CPC_EYECATCHER = "MV - CPC";
	public static final String WIN_APE_EYECATCHER = "Win APE 32 1.0";
	
	/*
	 * Used during save
	 */
	public static final String EXTENDED_DESCRIPTION = EXTENDED_EYECATCHER + " CPC DSK File\r\nDisk-Info\r\n";
	public static final String CREATOR_DATA = "JAVACPC EXTDSK";
	public static final String TRACK_INFO = "Track-Info\r\n";

	
	private String discId;
	private String creator;
	private int sizeOfTrack;

	private boolean extended;
	
	public void setDiscId(String discId) {
		this.discId = discId;
	}
	
	public String getDiscId() {
		return discId;
	}

	public void setCreator(String creator) {
		this.creator=creator;
	}
	
	public String getCreator() {
		return creator;
	}

	public void setSizeOfTrack(int sizeOfTrack) {
		this.sizeOfTrack=sizeOfTrack;
	}

	public int getSizeOfTrack() {
		return sizeOfTrack;
	}

	public void setExtended(boolean extended) {
		this.extended=extended;
	}
	
	public boolean isExtended() {
		return extended;
	}
}
