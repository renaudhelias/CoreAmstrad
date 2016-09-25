package jemu.test;

/**
 * Un step devrait faire des pas de plus d'un step, pour digérer une horloge...
 */
public class ModelSimClock implements ModelSimSignal {

	private int period;
	private ModelSimStep step;

	ModelSimClock(ModelSimStep step, int period) {
		this.step = step;
		this.period = period;
	}

	@Override
	public void setValue(int value) {
	}

	@Override
	public int getNextStep() {
		return this.step.getCurrentStep()+period;
	}

	@Override
	public int getValue() {
		return this.step.getCurrentStep()%period;
	}
}
