package jemu.system.cpc;

public enum MagicCPCDiscFormat {
	FORMAT_DS_80("FORMAT DISC DS 80",80,128);
	
	String label;
	int nbTracks;
	/**
	 * To know when a file cannot be inserted into a disc.
	 */
	int blockSize;
	MagicCPCDiscFormat(String label, int nbTracks, int blockSize) {
		this.label=label;
		this.nbTracks=nbTracks;
		this.blockSize=blockSize;
	}
}
