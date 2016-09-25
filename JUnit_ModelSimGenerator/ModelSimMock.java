package jemu.test;

public class ModelSimMock implements ModelSimSignal {
	public ModelSimMock() {
	}
	
	@Override
	public void setValue(int value) {
	}

	@Override
	public int getNextStep() {
		return 0;
	}

	@Override
	public int getValue() {
		return 0;
	}
}
