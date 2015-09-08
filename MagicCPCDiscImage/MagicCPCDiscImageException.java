package jemu.system.cpc;

public class MagicCPCDiscImageException extends Exception {
	public static final String FILE_STRUCTDIR_TOO_BIG = "FILE_STRUCTDIR_TOO_BIG";

	public MagicCPCDiscImageException(String message) {
		super(message);
	}
}
