package jemu.test;

import java.util.HashMap;
import java.util.Map;

public class AbstractModelSimSignal implements ModelSimSignal {
	private ModelSimStep step;
	Map<Integer,Integer> stepValue = new HashMap<Integer, Integer>();
	AbstractModelSimSignal(ModelSimStep step) {
		this.step = step;
		stepValue.put(0,-1);
	}
	int lastValue=-1;
	public void setValue(int value) {
		if (lastValue!=value) {
			if (stepValue.containsKey(step.getCurrentStep())) {
				stepValue.put(step.getCurrentStep(), -1);
				lastValue=-1;
			} else {
				stepValue.put(step.getCurrentStep(), value);
				lastValue=value;
			}
		}
	}
	
	public int getNextStep() {
		int min=step.getCurrentStep();
		int next=min;
		for (Integer step : stepValue.keySet()) {
			if (step>min) {
				if (next==min) {
					next=step;
				} else {
					if (next>step) {
						next=step;
					}
				}
			}
		}
		return next;
	}
	
	private int getLastStep() {
		int c = 0;
		for (Integer s : stepValue.keySet()) {
			if (c<s && s <=step.getCurrentStep()) {
				c=s;
			}
		}
		return c;
	}
	
	public int getValue() {
		return stepValue.get(getLastStep());
	}
}
