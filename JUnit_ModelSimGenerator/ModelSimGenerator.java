package jemu.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Séparer le jeu de test du résultat ? C'est le nom des fils ça : entrée, sortie.
 * @author sti
 *
 */
public class ModelSimGenerator implements ModelSimStep {
	Map<String,ModelSimSignal> modelSimSignals = new HashMap<String,ModelSimSignal>();
	List<String> modelSimSignalNames = new ArrayList<String>();
	private int step = 0;
	private int period;
	
	public ModelSimGenerator(int period) {
		this.period=period;
	}
	public ModelSimSignal buildSignal(String name) {
		ModelSimSignal signal = new ModelSimNoForce(this);
		modelSimSignals.put(name, signal);
		modelSimSignalNames.add(name);
		return signal;
	}
	public ModelSimSignal buildClock(String name, int period) {
		ModelSimSignal signal = new ModelSimClock(this, period);
		modelSimSignals.put(name, signal);
		modelSimSignalNames.add(name);
		return signal;
	}
	public ModelSimSignal buildForce(String name, int value) {
		ModelSimSignal signal = new ModelSimForce(this, value);
		modelSimSignals.put(name, signal);
		modelSimSignalNames.add(name);
		return signal;
	}
	public ModelSimSignal buildNoForce(String name) {
		ModelSimSignal signal = new ModelSimNoForce(this);
		modelSimSignals.put(name, signal);
		modelSimSignalNames.add(name);
		return signal;
	}
	public ModelSimSignal getSignal(String name) {
		return modelSimSignals.get(name);
	}
	
	@Override
	public void step() {
		step +=period;
	}

	@Override
	public final int getCurrentStep() {
		return step;
	}

	public void generate() {
		
		beginVHDL();
		
		// synthèse des step vs signal change.
		int endStep = step;
		step = 0;
		while (step<endStep) {
			int jump = step;
			for (ModelSimSignal signal : modelSimSignals.values()) {
				int nextStep = signal.getNextStep();
				if (nextStep>step) {
					if (jump == step || nextStep<jump) {
						jump=nextStep;
					}
				}
			}
			for (String name : modelSimSignals.keySet()) {
				if (modelSimSignals.get(name).getValue()==-1) {
					System.out.println(""+name+"<='X';");
				} else {
					System.out.println(""+name+"<='"+modelSimSignals.get(name).getValue()+"';");
				}
			}
			if (jump==step) {
				jump = endStep;
			}
			
			System.out.println("--step from "+step+" to "+jump+"\nwait for "+(jump-step)+" ns;");
			step=jump;
		}
		
		endVHDL();
	}
	private void beginVHDL() {
		System.out.println("LIBRARY ieee;");
		System.out.println("USE ieee.std_logic_1164.ALL;");
		System.out.println("ENTITY testbench IS");
		System.out.println("END testbench;");
 
		System.out.println("LIBRARY ieee;");
		System.out.println("USE ieee.std_logic_1164.ALL;");
		System.out.println("ENTITY testbench_mock IS");
		System.out.println("Port (");
		for (int i=0;i<modelSimSignalNames.size()-2;i++) {
			System.out.println(modelSimSignalNames.get(i)+":IN std_logic;");  
		}
		if (modelSimSignalNames.size()>0) {
			System.out.println(modelSimSignalNames.get(modelSimSignalNames.size()-1)+":IN std_logic");
		}
		System.out.println(");");
		System.out.println("END testbench_mock;");
		System.out.println("ARCHITECTURE behavior OF testbench_mock IS");
		System.out.println("BEGIN");
		System.out.print("mpock_proc: process(");
		for (int i=0;i<modelSimSignalNames.size()-2;i++) {
			System.out.print(modelSimSignalNames.get(i)+",");  
		}
		if (modelSimSignalNames.size()>0) {
			System.out.print(modelSimSignalNames.get(modelSimSignalNames.size()-1));
		} 
		System.out.println(")");
		System.out.println("begin");
		System.out.println("end process;");
		System.out.println("END;");

		System.out.println("ARCHITECTURE behavior OF testbench IS");
		for (String name : modelSimSignalNames) {
			System.out.println("signal "+name+":std_logic:='X';");
		}

		System.out.println("COMPONENT testbench_mock");
		System.out.println("PORT(");
		for (int i=0;i<modelSimSignalNames.size()-2;i++) {
			System.out.println(modelSimSignalNames.get(i)+" : IN  std_logic;");  
 		}
 		if (modelSimSignalNames.size()>0) {
 			System.out.println(modelSimSignalNames.get(modelSimSignalNames.size()-1)+" : IN  std_logic");
 		} 
 		System.out.println(");");
		System.out.println("END COMPONENT;");

		System.out.println("BEGIN");

		System.out.println("tbm: testbench_mock PORT MAP (");
		for (int i=0;i<modelSimSignalNames.size()-2;i++) {
			System.out.println(modelSimSignalNames.get(i)+" => "+modelSimSignalNames.get(i)+",");  
 		}
 		if (modelSimSignalNames.size()>0) {
 			System.out.println(modelSimSignalNames.get(modelSimSignalNames.size()-1)+" => "+modelSimSignalNames.get(modelSimSignalNames.size()-1));
 		} 
 		System.out.println(");");

		System.out.println("-- Stimulus process");
		System.out.println("stim_proc: process");
		System.out.println("begin");
	}
	private void endVHDL() {
		System.out.println("wait;");
		System.out.println("end process;");
		System.out.println("END;");
	}
}
