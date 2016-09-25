package jemu.test;

public class ModelSimForce extends AbstractModelSimSignal {
	ModelSimForce(ModelSimStep step, int value) {
		super(step);
		setValue(value);
	}
}
