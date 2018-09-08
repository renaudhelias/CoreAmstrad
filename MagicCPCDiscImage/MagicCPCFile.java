package jemu.system.cpc;

public class MagicCPCFile {

	private String name;
	private String path;
	private byte[] data;

	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	public void setPath(String path) {
		this.path=path;
	}
	public String getPath() {
		return path;
	}
	public void setData(byte[] data) {
		this.data=data;
	}
	public byte[] getData() {
		return data;
	}
}
