package jemu.core.device.floppy;

import jemu.core.*;
import jemu.core.device.*;

/**
 * NEC uPD765AC-2 Floppy Controller Emulation.
 *
 * @author Richard Wilson
 */
public class UPD765A extends Device {
  
  /**
   * For efficiency, the cycles can be 1, 2, 4 or 8 per cycle call, allowing an 8MHz
   * clock frequency to be emulated with only one call to cycle() at 1MHz, or as
   * used in the CPC, 4MHz with clocksPerCycle = 4, called at 1MHz.
   */
  
  // The following values are from the documentation for 8MHz operation
  protected static final int READ_TIME_FM  = 24 * 8;
  protected static final int READ_TIME_MFM = 12 * 8;
  protected static final int POLL_TIME     = 1024 * 8;
  
  protected static final int POLL         = 0;
  protected static final int SEEK         = 1;
  protected static final int READ_ID      = 2;
  protected static final int MATCH_SECTOR = 3;
  protected static final int READ         = 4;
  protected static final int WRITE        = 5;
    
  protected static final int[] CMD_PARAMS = {
    0, 0, 8, 2, 1, 8, 8, 1, 0, 8, 1, 0, 8, 5, 0, 2,
    0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8, 0, 0
  };
  
  // Valid commands during a seek???
  protected static final int[] CMD_PARAMS_SEEK = {
    0, 0, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
  };

  // Main Status Register bits
  protected static final int D0_BUSY      = 0x01;   // Drive 0 in Seek Mode
  protected static final int D1_BUSY      = 0x02;
  protected static final int D2_BUSY      = 0x04;
  protected static final int D3_BUSY      = 0x08;
  protected static final int COMMAND_BUSY = 0x10;   // Command Busy
  protected static final int EXEC_MODE    = 0x20;   // Execution Phase in non-DMA mode
  protected static final int DATA_IN_OUT  = 0x40;   // Data Input/Output
  protected static final int REQ_MASTER   = 0x80;   // Request for Master
  
  protected static final int SEEK_MASK    = 0x0f;
  
  protected static final int ST0_NORMAL       = 0x00;
  protected static final int ST0_ABNORMAL     = 0x40;
  protected static final int ST0_INVALID      = 0x80;
  protected static final int ST0_READY_CHANGE = 0xc0;
  protected static final int ST0_NOT_READY    = 0x08;
  protected static final int ST0_HEAD_ADDR    = 0x04;
  protected static final int ST0_EQUIP_CHECK  = 0x10;
  protected static final int ST0_SEEK_END     = 0x20;
  
  protected static final int ST1_MISSING_ADDR = 0x01;
  protected static final int ST1_NOT_WRITABLE = 0x02;
  protected static final int ST1_NO_DATA      = 0x04;
  protected static final int ST1_OVERRUN      = 0x10;
  protected static final int ST1_DATA_ERROR   = 0x20;
  protected static final int ST1_END_CYL      = 0x80;
  
  protected static final int ST2_MISSING_ADDR = 0x01;
  protected static final int ST2_BAD_CYLINDER = 0x02;
  protected static final int ST2_SCAN_NOT_SAT = 0x04;
  protected static final int ST2_SCAN_EQU_HIT = 0x08;
  protected static final int ST2_WRONG_CYL    = 0x10;
  protected static final int ST2_DATA_ERROR   = 0x20;
  protected static final int ST2_CONTROL_MARK = 0x40;  // Deleted data address mark
  
  protected static final int ST3_HEAD_ADDR    = 0x04;
  protected static final int ST3_TWO_SIDE     = 0x08;
  protected static final int ST3_TRACK_0      = 0x10;
  protected static final int ST3_READY        = 0x20;
  protected static final int ST3_WRITE_PROT   = 0x40;
  protected static final int ST3_FAULT        = 0x80;
  
  protected int command;                // Current command
  protected int action;                 // Current action
  protected int[] params = new int[8];  // Command parameters
  protected int pcount = 0;
  protected int pindex = 0;
  protected int[] result = new int[7];  // Command Result
  protected int rindex = 0;
  protected int rcount = 0;
  protected Drive drive;
  protected int c, h, r, n;    // Sector ID
  protected int offset;        // Offset in sector
  protected int size;          // Size of sector
  protected byte[] buffer;     // Sector Buffer
  protected int count;         // Total cycle count
  protected int next;          // Cycle count for next event
  protected int status;        // Main Status Register
  protected int st1;           // Status Register 1
  protected int st2;           // Status Register 2
  protected int st3;           // Status Register 3
  protected int data;          // Current data byte
  
  protected int cycleRate;     // Number of cycles per cycle() call, should be 1, 2, 4 or 8
  protected int countPoll, countStep, countFM, countMFM;  
 
  protected Drive[] drives  = new Drive[4];
  protected int[] pcn       = new int[4];
  protected int[] ncn       = new int[4];
  protected int[] dir       = new int[4];
  protected int[] max       = new int[4];
  protected int[] st0       = new int[4];  // Separate Status register 0 for each drive
  protected boolean[] ready = new boolean[4];
  
  protected Device interruptDevice;
  protected int interruptMask;
  
  /**
   * Creates a new instance of UPD765A
   * 
   * @param clocksPerCycle clocks per cycle (1,2,4,8)
   */
  public UPD765A(int clocksPerCycle) {
    super("NEC uPD765AC-2 Floppy Controller");
    switch(clocksPerCycle) {
      case 1:
      case 2:
      case 4:
      case 8: cycleRate = clocksPerCycle; break;
      default: throw new RuntimeException("ClocksPerCycle should be 1, 2, 4 or 8");
    }
    countPoll = POLL_TIME / cycleRate;
    countFM   = READ_TIME_FM / cycleRate;
    countMFM  = READ_TIME_MFM / cycleRate;
    reset();
  }

  public void setInterruptDevice(Device device, int mask) {
    interruptDevice = device;
    interruptMask = mask;
  }

  /**
   * Set or reset a drive.
   * 
   * @param index drive index
   * @param drive the drive or <code>null</code> to reset
   */
  public void setDrive(int index, Drive drive) {
    drives[index] = drive;
  }

  /**
   * Return indexed drive.
   * 
   * @param index drive index
   * @return drive or <code>null</code> when not set
   */
  public Drive getDrive(int index) {
    return drives[index];
  }

  @Override
  public final int readPort(int port) {   // Port 0 is main status, 1 is data
    if ((port & 0x01) == 0) {
      //System.out.println("FDC Status Read: " + Util.hex((byte)status));
      return status;
    }
    else {
      if ((status & (EXEC_MODE | REQ_MASTER)) == REQ_MASTER && rcount > 0) {
        data = result[rindex++];
        if (--rcount == 0)
          status &= ~(COMMAND_BUSY | DATA_IN_OUT);
        System.out.println(" Res " + Util.hex((byte)data));
      }
      else if (action == READ && (status & REQ_MASTER) != 0) {
        status &= ~REQ_MASTER;
        //System.out.println("FDC Data read: " + Util.hex((byte)data));
        System.out.print(" " + Util.hex((byte)data));
      }
      return data;
    }
  }

  @Override
  public final void writePort(int port, int value) {  // Port 0 is main status, 1 is data
    if ((port & 0x01) != 0) {
      data = value;
      //System.out.println("FDC write: " + Util.hex((short)port) + "," + Util.hex((byte)value));
      if ((status & (REQ_MASTER | DATA_IN_OUT)) == REQ_MASTER) {
        if ((status & EXEC_MODE) != 0) {
          status &= ~REQ_MASTER;
          System.out.print(" " + Util.hex((byte)data));
        } else if ((status & COMMAND_BUSY) == 0) {
          // Can start a command
          command = value;
          System.out.println("\nFDC Command: " + Util.hex((byte)command));
          value &= 0x1f;
          status |= COMMAND_BUSY;
          pindex = 0;
          if ((pcount = (status & SEEK_MASK) == 0 ? CMD_PARAMS[value] : CMD_PARAMS_SEEK[value]) == 0) {
            // Invalid command or Sense Interrupt status
            status |= DATA_IN_OUT;
            result[rindex = 0] = ST0_INVALID;
            rcount = 1;
            if (value == 0x08) {  // Sense Interrupt Status
              for (int drive = 0; drive < 4; drive++)
                if (st0[drive] != ST0_INVALID) {
                  result[0] = st0[drive];
                  st0[drive] = ST0_INVALID;
                  result[1] = pcn[drive];
                  status &= ~(1 << drive);
                  rcount = 2;
                  //System.out.println("Sense Interrupt: " + Util.hex((byte)result[0]) + "," +  Util.hex((byte)result[1]));
                  break;
                }
            }
          }
        }
        else {
          params[pindex++] = value;
    	  System.out.println(" Par " + Util.hex((byte)value));
          if (--pcount == 0) {
            switch(command & 0x1f) {
              case 0x02:                      break; // TODO: Read Track
              case 0x03: specify();           break; // Specify
              case 0x04: senseDrive();        break;
              case 0x05: writeSector();       break;
              case 0x06: readSector();        break;
              case 0x07: seek(0, 77);         break;
              case 0x0a: readID();            break;
              case 0x0f: seek(params[1], -1); break;
              default: throw new RuntimeException("Invalid command: " + Util.hex((byte)command));
            }
          }
        }
      }
    }
  }

  @Override
  public final void reset() {
    pindex = pcount = count = 0;
    status = REQ_MASTER;
    countStep = 16 * 8000 / cycleRate;
    action = POLL;
    next = countPoll;
  }
  
  protected final void specify() {
    countStep = (16 - (params[0] >> 4)) * 8000 / cycleRate;
    status &= ~(COMMAND_BUSY | DATA_IN_OUT);
  }
  
  protected final void senseDrive() {
    int select = params[0] & 0x07;
    int drv = select & 0x03;
    drive = drives[drv];
    if (drive != null) {
      if (ready[drv])               select |= ST3_READY;
      if (drive.getCylinder() == 0) select |= ST3_TRACK_0;
      if (drive.getSides() == 2)    select |= ST3_TWO_SIDE;
      if (drive.isWriteProtected()) select |= ST3_WRITE_PROT;
    }
    result[rindex = 0] = select;
    rcount = 1;
    status |= DATA_IN_OUT;
  }
  
  protected final void seek(int cyl, int steps) {
    int drive = params[0] & 0x03;
    max[drive] = steps;
    ncn[drive] = cyl;
    status &= ~COMMAND_BUSY;
    if (pcn[drive] == cyl)
      seekEnd(drive,ST0_NORMAL);
    else {
      status |= (1 << drive);
      if (pcn[drive] < cyl)
        dir[drive] = 1;
      else if (pcn[drive] > cyl)
        dir[drive] = -1;
      if (action != SEEK) {
        action = SEEK;
        next = count + countStep;   // TODO: Real FDC might use counters for each drive
      }
    }
  }

  protected final void seekStep() {
    for (int drive = 0; drive < 4; drive++)
      if (pcn[drive] != ncn[drive]) {
        int step = dir[drive];
        pcn[drive] += step;
        if (drives[drive] != null)
          if (drives[drive].step(step)) pcn[drive] = 0;
        if (pcn[drive] == ncn[drive])
          seekEnd(drive, ST0_NORMAL);
        else if (--max[drive] == 0) { // Recal 77 steps complete
          ncn[drive] = pcn[drive];
          seekEnd(drive, ST0_ABNORMAL | ST0_EQUIP_CHECK);
        }
        else
          next = count + countStep;
      }
  }

  protected final void seekEnd(int drive, int status0) {
    st0[drive] = status0 | ST0_SEEK_END | drive;
    dir[drive] = 0;
    // Set interrupt. If no drives still seeking
    if ((dir[0] | dir[1] | dir[2] | dir[3]) == 0) {
      action = POLL;
      next = count + countPoll;
    }
  }

  protected final void poll() {
    for (int drive = 0; drive < 4; drive++) {
      boolean rdy = drives[drive] != null && drives[drive].isReady();
      if (rdy != ready[drive]) {
        ready[drive] = rdy;
        st0[drive] = ST0_READY_CHANGE | (rdy ? 0 : ST0_NOT_READY) | drive;
      }
    }
  }

  protected final boolean setupResult() {
    int select = params[0] & 0x07;
    drive = drives[select & 0x03];
    result[rindex = 0] = select | ST0_ABNORMAL;
    result[1] = ST1_NO_DATA | ST1_MISSING_ADDR;
    rcount = 2;
    if (drive != null && drive.isReady()) {
      drive.setHead(select >> 2);
      drive.setActive(true);
      return true;
    }
    else {
      result[0] |= ST0_NOT_READY;
      status |= DATA_IN_OUT;
      return false;
    }
  }
  
  protected final void readID() {
    if (setupResult()) {
      action = READ_ID;
      status ^= REQ_MASTER | DATA_IN_OUT;
      next = count + (1200 / cycleRate);  // TODO: Accurate timing!
    }
  }
  
  protected final void getNextID() {
    int[] id = drive.getNextSectorID();
    if (id != null) {
      result[0] &= ~ST0_ABNORMAL;
      result[1] = result[2] = 0;
      result[3] = id[0];
      result[4] = id[1];
      result[5] = id[2];
      result[6] = id[3];
      rcount = 7;
    }
    else
      drive.setActive(false);
    status |= REQ_MASTER;
    action = POLL;
    next = count + countPoll;
  }
  
  protected final void readSector() {
    if (setupResult())
      getNextSector(READ);
  }
  
  protected final void readTrack() {
    if (setupResult()) {
      drive.resetSector();
      getNextSector(READ);
    }
  }
  
  protected final void getNextSector(int direction) {
    buffer = drive.getSector(params[1], params[2], params[3], params[4]);
    //System.out.println("Got sector " + Util.hex((byte)params[3]) + " " + (buffer != null) + " " +
    //  (buffer == null ? "" : Integer.toString(buffer.length)));
    if (buffer != null) {
      offset = 0;
      action = direction;  // TODO: Accurate matching/timing
      if (direction == READ)
        status = (status & ~REQ_MASTER) | DATA_IN_OUT | EXEC_MODE;
      else
        status = (status & ~DATA_IN_OUT) | REQ_MASTER | EXEC_MODE;  // ??? Is RQM high immediately?
      next = count + (800 / cycleRate);
      data = -1;
    }
    else {
      status |= DATA_IN_OUT;
      action = POLL;
      next = count + countPoll;
      drive.setActive(false);
    }
  }
  
  protected final void endBuffer(int direction) {
    if (params[3] == params[5]) {
      status &= ~EXEC_MODE;
      status |= REQ_MASTER | DATA_IN_OUT;
      result[0] &= ~ST0_ABNORMAL;
      result[1] = result[2] = 0;
      result[3] = params[1];
      result[4] = params[2];
      result[5] = 0x01;
      result[6] = params[4];
      rcount = 7;
      action = POLL;
      next = count + countPoll;
      drive.setActive(false);
    }
    else {
      params[3] = (params[3] + 1) & 0xff;
      getNextSector(direction);
    }
  }
  
  protected final void readSectorByte() {
    if (offset == buffer.length)
      endBuffer(READ);
    else {
      drive.notifyReadSectorByte((offset == 0),params[1], params[2], params[3], params[4]);
      data = buffer[offset++];
      //System.out.print("(" + Util.hex((byte)data) + ")");
      next = count + countMFM;
      status |= REQ_MASTER;
    }
  }
  
  protected final void writeSectorByte() {
    if (data == -1) ; // TODO: Overrun error, no data supplied yet
    buffer[offset++] = (byte)data;
    
    
    drive.notifyWriteSectorByte((byte)data,params[1], params[2], params[3], params[4]);
    
    data = -1;
    if (offset == buffer.length)
      endBuffer(WRITE);
    else {
      next = count + countMFM;
      status |= REQ_MASTER;
    }
  }
  
  protected final void writeSector() {
    if (setupResult())
      getNextSector(WRITE);
  }
  
  @Override
  public final void cycle() {
    if (++count == next) {
      //System.out.println("FDC Count ended");
      switch(action) {
        case SEEK:    seekStep();        break;
        case POLL:    poll();            break;
        case READ_ID: getNextID();       break;
        case READ:    readSectorByte();  break;
        case WRITE:   writeSectorByte(); break;
        //default:   setResult(action < 0 ? -action : 0,IRQ); break; // Ok
      }
    }
  }
  
}
