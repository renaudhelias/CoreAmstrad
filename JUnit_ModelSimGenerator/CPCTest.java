package jemu.test;

import jemu.core.device.Device;
import jemu.core.device.crtc.Basic6845;
import jemu.system.cpc.CPC;
import jemu.system.cpc.GateArray;
import jemu.system.cpc.Z80;

import org.junit.Test;

public class CPCTest {
	
    protected Basic6845 crtc = (Basic6845) addDevice(new Basic6845());
    protected GateArray gateArray = (GateArray) addDevice(new GateArray());

    ModelSimGenerator modelSim = new ModelSimGenerator(2);
    
    public static ModelSimSignal SIGNAL_INTERRUPT = new ModelSimMock();
    public static ModelSimSignal SIGNAL_VSYNC = new ModelSimMock();
    public static ModelSimSignal SIGNAL_HSYNC = new ModelSimMock();
    public static ModelSimSignal SIGNAL_CLOCK;
    
    @Test
	public void test() {
    	SIGNAL_INTERRUPT=modelSim.buildSignal("INT");
    	SIGNAL_VSYNC=modelSim.buildSignal("VSYNC");
    	SIGNAL_HSYNC=modelSim.buildSignal("HSYNC");
//    	SIGNAL_CLOCK=modelSim.buildClock("CLOCK",1);
    	
		crtc.setRegisterSelectMask(0x0300, 0x0000);
        crtc.setRegisterWriteMask(0x0300, 0x0100);
        crtc.setRegisterReadMask(0x0300, 0x0300);
        crtc.setRegisterStatusMask(0x0300, 0x0200);
        crtc.setCRTCListener(gateArray);
        
        // gateArray(this) : crtc = cpc.crtc;
        gateArray.crtc= crtc;
        gateArray.z80= new Z80(0);
        gateArray.setHalfSize(false);
        gateArray.cpc= new CPC(null, "test");
        gateArray.cpc.memory.plus=false;
        
        for (int i = 0; i<20000; i++) {
        	gateArray.cycle();
        	modelSim.step();
        	SIGNAL_INTERRUPT.setValue(0);
//        	SIGNAL_HSYNC.setValue(1);
        }
        //gateArray.z80.setInterrupt(mask)
        //gateArray.crtc.listener.hSyncEnd()
        modelSim.generate();
	}

	private Device addDevice(Device device) {
		return device;
	}

}


