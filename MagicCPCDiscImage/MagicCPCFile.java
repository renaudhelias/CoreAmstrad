package jemu.system.cpc;

import java.util.List;

public class MagicCPCFile {

	private String name;
	private List<Byte> data;

	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	public void setData(List<Byte> data) {
		this.data=data;
	}
	public List<Byte> getData() {
		return data;
	}
}
