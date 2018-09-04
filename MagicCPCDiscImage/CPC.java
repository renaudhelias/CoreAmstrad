package jemu.system.cpc;

import jemu.ui.paint.*;
import java.applet.Applet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.io.*;
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.filechooser.FileNameExtensionFilter;

import jemu.core.samples.Samples;
import jemu.core.*;
import jemu.core.cpu.Processor;
import jemu.core.device.Computer;
import jemu.core.device.DeviceMapping;
import jemu.ui.Switches;
import jemu.core.device.crtc.Basic6845;
import jemu.core.device.floppy.Drive;
import jemu.core.device.floppy.UPD765A;
import jemu.core.device.io.PPI8255;
import jemu.core.device.memory.Memory;
import jemu.core.device.MultiFace.MultiFace;
import jemu.core.device.realtimeclock.SFIIClock;
import jemu.core.device.tape.*;
import jemu.core.device.speech.*;
import jemu.ui.Display;
import jemu.util.diss.Disassembler;
import jemu.util.diss.DissZ80;
import jemu.ui.Autotype;
import jemu.core.device.sound.*;
import jemu.core.device.printer.*;
import jemu.settings.*;
import java.util.zip.*;
import jemu.system.cpc.plus.*;

import javax.swing.table.*;
import javazoom.jl.converter.*;
import jemu.core.device.Device;
import jemu.core.device.internalfilesystem.ImageExporter;
import jemu.core.device.internalfilesystem.InternalFileSystem;
import jemu.core.device.keyboard.VirtualKeyBoard;
import jemu.ui.*;

import net.sourceforge.lhadecompressor.*;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import static jemu.system.cpc.GateArray.setPalette;
import static jemu.ui.JEMU.desktop;
import jemu.util.ass.EditorPanel;

/**
 * Title: JavaCPC Description: The Java Amstrad CPC Emulator Copyright:
 * Copyright (c) 2006-2010 Company:
 *
 * @author
 * @version 6.8
 */
public final class CPC extends Computer implements ActionListener {

    boolean z80turbo = false;
    boolean recordvideo;
    public static boolean playvideo;
    BufferedOutputStream videostream;

    public void recordVideo() {
        if (!recordvideo) {
            try {
                videostream = new BufferedOutputStream(new FileOutputStream(new File("output.cpc")));
            } catch (Exception e) {
            }
            recordvideo = true;
            videoframe = 0;
        }
    }

    public AY_3_8910 getPSG() {
        return psg;
    }
    BufferedInputStream videoinput;
    int videosize;

    public void playFrame() {
        try {
            if (videoinput == null) {
                videoinput = new BufferedInputStream(new FileInputStream(new File("output.cpc")));
                videosize = (int) new File("output.cpc").length() / 0x04000;
                videoframe = 0;
            }
//            byte[] vdata = new byte[0x10100];
//            videoinput.read(vdata);
//            this.SNA_Play("nix", vdata);
            byte[] vdata = new byte[0x04000];
            videoinput.read(vdata);
            byte[] regs = new byte[14];
            System.arraycopy(vdata, 0x27d0, regs, 0, 14);
            psg.writePSGRegisters(regs);
            gateArray.setNewMode(vdata[0x17d0] & 0x0ff);
            for (int i = 0; i < 0x04000; i++) {
                POKE(0xc000 + i, vdata[i]);
            }
            for (int i = 0; i < 17; i++) {
                INK(i, vdata[0x17d1 + i] & 0x0ff);
            }
            if (videoframe >= videosize) {
                videoframe = 0;
                videoinput.close();
                videoinput = new BufferedInputStream(new FileInputStream(new File("output.cpc")));
            }
            recorder.feedDisplay();
            recorder.frame.setText("" + videoframe++);
        } catch (Exception e) {
            try {
                videoinput.close();
                videoinput = new BufferedInputStream(new FileInputStream(new File("output.cpc")));
            } catch (Exception er) {
                playvideo = false;
            }
        }
    }
    int videoframe;

    public void recordFrame() {
        if (videostream == null) {
            return;
        }
//        byte[] vdata = this.getSNA(64);
//        System.out.println(vdata.length);
        for (int i = 0; i < 17; i++) {
            POKE(0xd7d1 + i, (byte) GateArray.getInk(i));
        }
        for (int i = 0; i < SCR_CODE.length; i++) {
            POKE(0xc7d0 + i, (byte) SCR_CODE[i]);
        }
        POKE(0xd7d0, (byte) gateArray.getScreenMode());
        byte[] vdata = new byte[0x04000];
        for (int i = 0; i < 0x04000; i++) {
            vdata[i] = (byte) PEEK(0x0c000 + i);
        }
        System.arraycopy(psg.getPSGRegisters(), 0, vdata, 0x27d0, 14);
        recorder.feedDisplay();
        recorder.frame.setText("" + videoframe++);
        try {
            videostream.write(vdata);
        } catch (Exception e) {
            recordvideo = false;
        }
    }

    public void stopVideo() {
        if (recordvideo) {
            recordvideo = false;
            try {
                videostream.close();
            } catch (Exception e) {
                recordvideo = false;
            }
        } else {
            playvideo = false;
            if (videoinput != null) {
                try {
                    videoinput.close();
                    videoframe = 0;
                } catch (Exception e) {
                }
            }
        }
    }

    public void playVideo() {
        playvideo = true;
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == recorder.rec) {
            recordVideo();
        }
        if (e.getSource() == recorder.stop) {
            stopVideo();
        }
        if (e.getSource() == recorder.play) {
            playVideo();
        }
    }
    VideoRecorder recorder = new VideoRecorder();
    String ramdisk = "null";
    public static String language = "en";
    public static boolean disableresync = false;
    protected boolean started = false;
    // command line args
    public static String cpctype = null;
    public static String snapshot = null;
    public static String drivea = null;
    public static String driveb = null;
    public static String assemblercode = null;
    public static String crtctype = null;
    public static String bootdrive = null;
    public static String tape = null;
    public static String amsdos = null;
    public static String autotypetext = null;
    public static String usemem = null;
    protected boolean loadsnapshot = false;
    protected boolean loaddrivea = false;
    protected boolean loaddriveb = false;
    protected boolean loadtapedrive = false;
    protected boolean assemblecode = false;
    public static int formNo = 100;
    public boolean overscan;
    int phonemelength, speechlength;
    public static int speechCount = 0;
    public static int xms = 0;
    public static boolean loadalarm = false;
    public static boolean setPaintOnTop = false;
    public static boolean PaintOnTop = false;
    public static boolean resetcpc = false;
    public static int blocks[] = null;
    public static String ids[] = null;
    public static int importoverscanscr = 0;
    public static int importnormalscr = 0;
    public static boolean updatebox = false, normalupdatebox = false;
    boolean saveOCP = true;
    public static boolean restorePaint = false;
    public static boolean insertOverscanPaintDisk = false;
    public static boolean insertNormalPaintDisk = false;
    static int writePal = 0;
    static boolean reset = false;
    public static overscanPaint overscanPaintBox;
    public static normalPaint normalPaintBox;
    static JFrame overscanPaintFrame = null;
    static JFrame normalPaintFrame = null;
    public static boolean savescreen = false;
    public static boolean saveoverscanscreen = false;
    public int coscreen = 0;
    //  public static int initpaint = 0;
    public static boolean initreset = false;
    int posi;
    int phase;
    static int[] cheat = {
        0, 20, 11, 28, 7, 3, 30, 6, 24, 4, 15, 22, 31, 27, 25, 14
    };
    protected final String YM_Header = "YM";
//byte[] odd = getRom("file/CODE.BIN",297);
    static byte[] cheatc = null;
    static boolean havescreen = false;
    static byte[] screencontent = new byte[0x4000];
    static boolean restorescreen = false;
    protected int inspect = 0, boot = 0, inspectdrive = 0;
    public static boolean bootthis = false;
    public static boolean resync = false;
    protected int countFPS, checkFPS = 44;
    protected int recountFPS, errCount;
    public static boolean inspectA = false;
    public static boolean inspectB = false;
    JDialog loadFile = new JDialog();
    public String[] entries = null;
    String[][] enter = null;
    JTable fileTable = new JTable();
    public int[] users = null;
    protected int track;
    public static boolean showAudioCapture, fromCapture = false;
    public static int resetInk = 0;
    public static boolean changeBorder = false;
    int mp3count = 0;
    String mp3name = "";
    Frame mp3 = new Frame();
    JButton conv = new JButton("Reading MP3...");
    public static int bitrate = 8;
    public Converter mp3c = new Converter();
    protected long checkmem = 2147483647;
    public static boolean doOptimize = false;
    public static boolean doRecord = false;
    protected int tapestop = 0;
    public static boolean Bypass = false;
    public static boolean shouldquit = false;
    public static boolean trueaudio = false;
    //   protected boolean hidetape = false;voi
    public static boolean tape_stereo = false;
    protected boolean isCDT = false;
    public static String downloadname = "";
    public static boolean download = false;
    public static String downstring = "";
    public static int DoDownload = 0;
    public static String Oldpage = "";
    public static boolean shouldBoot = false;
    // Tape variables
    protected int turbocount = 0;
    protected int tapedistort = 0x00;
    public static int recordcount = 0;
    protected byte TapeRecbyte = 0x00;
    public static boolean savetape, tapeload = false;
    public static int tape_delay = 22;
    public static int tapestarttimer = 0;
    public static int playcount, tapeBandPosition;
    protected int doLoad;
    public static boolean inserttape, tapeloaded = false;
    public static String loadtape;
    protected int portB = 0;
    public static byte[] tapesample;
    protected boolean tapeEnabled = true;
    public static int tapesound, tapesoundb = 0;
    public static boolean playing, savecheck, stoptape, tapeRelay, tapeRec, tapeRewind, tapePlay, tapeFastForward, tapedeck = false;
    public TapeDeck TapeDrive = new TapeDeck();
    // YM Player/recorder variables
    public static boolean st_mode, zx_mode = false;
    public boolean YM_Interleaved = false;
    public static int YM_registers = 16;
    public static boolean oldYM = false;
    public int[] YM_Data = new int[1000000];
    public int[] YM_DataInterleaved = new int[1000000];
    public static int ymcount = 0;
    public static int YM_RecCount = 0;
    public static int YM_vbl = 0;
    public static boolean YM_Rec = false;
    public static boolean YM_Play = false;
    public static boolean YM_Stop = false;
    public static boolean YM_Save = false;
    public static boolean YM_Load = false;
    public static boolean atari_st_mode, spectrum_mode = false;
    public boolean shouldcount = false;
    public int begincount = 0;
    public static int vcount, YM_Minutes, YM_Seconds, msecs = 0;
    public String YMtitle = "";
    public String YMauthor = "";
    public String YMcreator = "";
    JCheckBox YMInterleaved = new JCheckBox("Interleaved");
    public static int timefire = 2;
    public int previousPortValue = 0;
    public int launchcount, blastercount, launchcode, launchcaul = 0;
    public static int savetimer, saveOnExit, saveOn = 0;
    public static boolean df0mod, df1mod, df2mod, df3mod = false;
    public boolean fired = false;
    public int firetimer;
    JCheckBox AmHeader = new JCheckBox("Write AMSDOS header");
    public boolean soverscan = false;
    JCheckBox Overscan = new JCheckBox("Save overscan screen?");
    JTextField AddressA = new JTextField();
    JTextField AddressB = new JTextField();
    JTextField SetByte = new JTextField();
    private int startimageA = 0x4000;
    private int startimageB = 0xC000;
    boolean amheader = false;
    public String MP3_HEADER_A = "ÿû";
    public String MP3_HEADER_B = "ID3";
    public String CNG_HEADER = "CNGSOFT's LZ";
    public boolean CNG = false;
    public boolean CNGBIN = false;
    protected String CSW_HEADER = "Compressed Square Wave";
    protected String WAV_HEADER = "RIFF";
    protected int[] WAV_HEADER_11KHz = {
        0x52, 0x49, 0x46, 0x46, 0xD9, 0xFC, 0xA4, 0x00, 0x57, 0x41,
        0x56, 0x45, 0x66, 0x6D, 0x74, 0x20, 0x10, 0x00, 0x00, 0x00,
        0x01, 0x00, 0x01, 0x00, 0x11, 0x2b, 0x00, 0x00, 0x11, 0x2b,
        0x00, 0x00, 0x01, 0x00, 0x08, 0x00, 0x64, 0x61, 0x74, 0x61,
        0xB5, 0xFC, 0xA4, 0x00
    };
    protected int[] WAV_HEADER_22KHz = {
        0x52, 0x49, 0x46, 0x46, 0xD9, 0xFC, 0xA4, 0x00, 0x57, 0x41,
        0x56, 0x45, 0x66, 0x6D, 0x74, 0x20, 0x10, 0x00, 0x00, 0x00,
        0x01, 0x00, 0x01, 0x00, 0x22, 0x56, 0x00, 0x00, 0x22, 0x56,
        0x00, 0x00, 0x01, 0x00, 0x08, 0x00, 0x64, 0x61, 0x74, 0x61,
        0xB5, 0xFC, 0xA4, 0x00
    };
    protected int[] WAV_HEADER_44KHz = {
        0x52, 0x49, 0x46, 0x46, 0xD9, 0xFC, 0xA4, 0x00, 0x57, 0x41,
        0x56, 0x45, 0x66, 0x6D, 0x74, 0x20, 0x10, 0x00, 0x00, 0x00,
        0x01, 0x00, 0x01, 0x00, 0x44, 0xac, 0x00, 0x00, 0x44, 0xac,
        0x00, 0x00, 0x01, 0x00, 0x08, 0x00, 0x64, 0x61, 0x74, 0x61,
        0xB5, 0xFC, 0xA4, 0x00
    };
    public int[] SCR_HEADER = {
        0x00, 0x4A, 0x41, 0x56, 0x41, 0x43, 0x50, 0x43,
        0x20, 0x53, 0x43, 0x52, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xC0, 0x00,
        0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x40, 0x00, 0x42, 0x04, 0x00, 0x00, 0x4A,
        0x41, 0x56, 0x41, 0x43, 0x50, 0x43, 0x20, 0x24,
        0x24, 0x24, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };
    public int[] PAL_HEADER = {
        0x00, 0x11, 0x16, 0x0D, 0x12, 0x16, 0x20, 0x20,
        0x20, 0x50, 0x41, 0x4C, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x02, 0xEF, 0x00, 0x09, 0x88, 0x00,
        0xEF, 0x00, 0x09, 0x88, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0xEF, 0x00, 0x00, 0x8A, 0x05, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };
    public int[] PAL_INK = {
        0x54, 0x44, 0x55, 0x5c, 0x58, 0x5d, 0x4c, 0x45,
        0x4d, 0x56, 0x46, 0x57, 0x5e, 0x40, 0x5f, 0x4e,
        0x47, 0x4f, 0x52, 0x42, 0x53, 0x5a, 0x59, 0x5b,
        0x4a, 0x43, 0x4b, 0x54, 0x54, 0x54, 0x54
    };
    public int[] SCR_CODE = { // Code to put to #C7D0
        0x3A, 0xD0, 0xD7, //      LD      A,  (#D7D0)
        0xCD, 0x1C, 0xBD, //      CALL    #BD1C
        0x21, 0xD1, 0xD7, //      LD      HL, #D7D1
        0x46, //      LD      B,  (HL)
        0x48, //      LD      C,  B
        0xCD, 0x38, 0xBC, //      CALL    #BC38
        0xAF, //      XOR     A
        0x21, 0xD1, 0xD7, //      LD      HL, #D7D1
        0x46, // BCL: LD      B,  (HL)
        0x48, //      LD      C,  B
        0xF5, //      PUSH    AF
        0xE5, //      PUSH    HL
        0xCD, 0x32, 0xBC, //      CALL    #BC32
        0xE1, //      POP     HL
        0xF1, //      POP     AF
        0x23, //      INC     HL
        0x3C, //      INC     A
        0xFE, 0x10, //      CP      #10
        0x20, 0xF1, //      JR      NZ,BCL
        //        0xC3, 0x18, 0xBB    //      JP      #BB18
        0xC9, 0x00, 0x00 //      RET
    };
    public int[] FLIP_CODE = {
        0x01, 0x0C, 0xBC, 0xED, 0x49, 0x01, 0x30, 0xBD, 0xED, 0x49, 0xCD, 0xF7, 0xE7, 0x76, 0xCD, 0x09,
        0xBB, 0xFE, 0x20, 0xCA, 0xFF, 0xE7, 0x01, 0x0C, 0xBC, 0xED, 0x49, 0x01, 0x10, 0xBD, 0xED, 0x49,
        0xCD, 0xF7, 0xE7, 0x76, 0xC3, 0xD0, 0xE7, 0x06, 0xF5, 0xED, 0x78, 0x1F, 0x30, 0xFB, 0xC9, 0xC9
    };
    static int CodeP0[] = {
        0xF3, 0x01, 0x11, 0xBC, 0x21, 0xD0, 0xDF, 0x7E,
        0xED, 0x79, 0x23, 0x0D, 0x20, 0xF9, 0x01, 0xA0,
        0x7F, 0x3A, 0xD0, 0xD7, 0xED, 0x79, 0xED, 0x49,
        0x01, 0xB8, 0x7F, 0xED, 0x49, 0x21, 0xD1, 0xD7,
        0x11, 0x00, 0x64, 0x01, 0x22, 0x00, 0xED, 0xB0,
        0xCD, 0xD0, 0xCF, 0x38, 0xFB, 0xFB, 0xC9
    };
    static int CodeP1[] = {
        0x01, 0x0E, 0xF4, 0xED, 0x49, 0x01, 0xC0, 0xF6,
        0xED, 0x49, 0xAF, 0xED, 0x79, 0x01, 0x92, 0xF7,
        0xED, 0x49, 0x01, 0x45, 0xF6, 0xED, 0x49, 0x06,
        0xF4, 0xED, 0x78, 0x01, 0x82, 0xF7, 0xED, 0x49,
        0x01, 0x00, 0xF6, 0xED, 0x49, 0x17, 0xC9
    };
    static int CodeP3[] = {
        0xFF, 0x00, 0xFF, 0x77, 0xB3, 0x51, 0xA8, 0xD4,
        0x62, 0x39, 0x9C, 0x46, 0x2B, 0x15, 0x8A, 0xCD,
        0xEE
    };
    public static boolean FDCReset = false;
    public CPCDiscImage dskImage;
    public CPCDiscImage dskImageA;
    public CPCDiscImage dskImageB;
    public CPCDiscImage dskImageC;
    public CPCDiscImage dskImageD;
    protected static GridBagConstraints gbcConstraints = null;
    static String[] Palette = new String[33];
    public static Color[] Greencols = {
        new Color(0x000000), /*
         * 0
         */
        new Color(0x0A0A0A), /*
         * 1
         */
        new Color(0x131313), /*
         * 2
         */
        new Color(0x1D1D1D), /*
         * 3
         */
        new Color(0x262626), /*
         * 4
         */
        new Color(0x303030), /*
         * 5
         */
        new Color(0x393939), /*
         * 6
         */
        new Color(0x434343), /*
         * 7
         */
        new Color(0x4C4C4C), /*
         * 8
         */
        new Color(0x575757), /*
         * 9
         */
        new Color(0x606060), /*
         * 10
         */
        new Color(0x6A6A6A), /*
         * 11
         */
        new Color(0x737373), /*
         * 12
         */
        new Color(0x7D7D7D), /*
         * 13
         */
        new Color(0x868686), /*
         * 14
         */
        new Color(0x909090), /*
         * 15
         */
        new Color(0x999999), /*
         * 16
         */
        new Color(0xA3A3A3), /*
         * 17
         */
        new Color(0xACACAC), /*
         * 18
         */
        new Color(0xB5B5B5), /*
         * 19
         */
        new Color(0xBFBFBF), /*
         * 20
         */
        new Color(0xC9C9C9), /*
         * 21
         */
        new Color(0xD2D2D2), /*
         * 22
         */
        new Color(0xDCDCDC), /*
         * 23
         */
        new Color(0xE5E5E5), /*
         * 24
         */
        new Color(0xEFEFEF), /*
         * 25
         */
        new Color(0xF8F8F8), /*
         * 26
         */
        new Color(0x7D7D7D), /*
         * 13
         */
        new Color(0x434343), /*
         * 7
         */
        new Color(0xEFEFEF), /*
         * 25
         */
        new Color(0x0A0A0A), /*
         * 1
         */
        new Color(0xB5B5B5) /*
     * 19
     */};
    public static Color[] Palcols = {
        /*
         * R G B
         */
        new Color(0x000000), /*
         * 0
         */
        new Color(0x00007D), /*
         * 1
         */
        new Color(0x0000FF), /*
         * 2
         */
        new Color(0x7D0000), /*
         * 3
         */
        new Color(0x7D007D), /*
         * 4
         */
        new Color(0x7D00FF), /*
         * 5
         */
        new Color(0xFF0000), /*
         * 6
         */
        new Color(0xFF007D), /*
         * 7
         */
        new Color(0xFF00FF), /*
         * 8
         */
        new Color(0x007D00), /*
         * 9
         */
        new Color(0x007D7D), /*
         * 10
         */
        new Color(0x007DFF), /*
         * 11
         */
        new Color(0x7D7D00), /*
         * 12
         */
        new Color(0x7D7D7D), /*
         * 13
         */
        new Color(0x7D7DFF), /*
         * 14
         */
        new Color(0xFF7D00), /*
         * 15
         */
        new Color(0xFF7D7D), /*
         * 16
         */
        new Color(0xFF7DFF), /*
         * 17
         */
        new Color(0x00FF00), /*
         * 18
         */
        new Color(0x00FF7D), /*
         * 19
         */
        new Color(0x00FFFF), /*
         * 20
         */
        new Color(0x7DFF00), /*
         * 21
         */
        new Color(0x7DFF7D), /*
         * 22
         */
        new Color(0x7DFFFF), /*
         * 23
         */
        new Color(0xFFFF00), /*
         * 24
         */
        new Color(0xFFFF7D), /*
         * 25
         */
        new Color(0xFFFFFF), /*
         * 26
         */
        new Color(0x7D7D7D), /*
         * 27
         */
        new Color(0xFF007D), /*
         * 28
         */
        new Color(0xFFFF7D), /*
         * 29
         */
        new Color(0x00007D), /*
         * 30
         */
        new Color(0x00FF7D) /*
     * 31
     */};
    public static final Color[] pale = {
        /*
         * R G B
         */
        new Color(0x000000), /*
         * 0
         */
        new Color(0x00007D), /*
         * 1
         */
        new Color(0x0000FF), /*
         * 2
         */
        new Color(0x7D0000), /*
         * 3
         */
        new Color(0x7D007D), /*
         * 4
         */
        new Color(0x7D00FF), /*
         * 5
         */
        new Color(0xFF0000), /*
         * 6
         */
        new Color(0xFF007D), /*
         * 7
         */
        new Color(0xFF00FF), /*
         * 8
         */
        new Color(0x007D00), /*
         * 9
         */
        new Color(0x007D7D), /*
         * 10
         */
        new Color(0x007DFF), /*
         * 11
         */
        new Color(0x7D7D00), /*
         * 12
         */
        new Color(0x7D7D7D), /*
         * 13
         */
        new Color(0x7D7DFF), /*
         * 14
         */
        new Color(0xFF7D00), /*
         * 15
         */
        new Color(0xFF7D7D), /*
         * 16
         */
        new Color(0xFF7DFF), /*
         * 17
         */
        new Color(0x00FF00), /*
         * 18
         */
        new Color(0x00FF7D), /*
         * 19
         */
        new Color(0x00FFFF), /*
         * 20
         */
        new Color(0x7DFF00), /*
         * 21
         */
        new Color(0x7DFF7D), /*
         * 22
         */
        new Color(0x7DFFFF), /*
         * 23
         */
        new Color(0xFFFF00), /*
         * 24
         */
        new Color(0xFFFF7D), /*
         * 25
         */
        new Color(0xFFFFFF), /*
         * 26
         */
        new Color(0x7D7D7D), /*
         * 27
         */
        new Color(0xFF007D), /*
         * 28
         */
        new Color(0xFFFF7D), /*
         * 29
         */
        new Color(0x00007D), /*
         * 30
         */
        new Color(0x00FF7D) /*
     * 31
     */};
//    public int joyreader;
    protected boolean turbo = false;
    protected int turbotimer;
    public int autotyper = 0;
    public int readkey = 0;
    int[] eventArray;
    boolean[] shifter;
    public static boolean shift;
    // Port mappings
    protected static final int PSG_PORT_A = -1;
    protected static final int PPI_PORT_B = -2;
    protected static final int PPI_PORT_C = -3;
    public static int autotype = 4;
    protected static final int CYCLES_PER_SECOND_CPC = 1000000;
    protected static final int CYCLES_PER_SECOND_ST = 2000000;
    protected static final int CYCLES_PER_SECOND_ZX = 1773400;
    protected static final int AUDIO_TEST = 0x40000000;
    protected String lowerROM = null;
    public HashMap upperROMs = new HashMap();
    public Z80 z80 = new Z80(CYCLES_PER_SECOND_CPC);
    public static CPCMemory memory = null;                                                      // new
    // CPCMemory(CPCMemory.TYPE_512K);
    public static CPCMemory memory2 = null;                                                      // new
    // CPCMemory(CPCMemory.TYPE_512K);
    protected SSA1 ssa1 = (SSA1) addDevice(new SSA1());
    protected DKTronics dktronics = (DKTronics) addDevice(new DKTronics());
    protected AmDrum amdrum = (AmDrum) addDevice(new AmDrum());
    protected InternalFileSystem internalfilesystem = (InternalFileSystem) addDevice(new InternalFileSystem());
    protected DigiBlaster digiblaster = (DigiBlaster) addDevice(new DigiBlaster());
    protected SFIIClock sfclock = (SFIIClock) addDevice(new SFIIClock());
    protected MultiFace multiface = (MultiFace) addDevice(new MultiFace());
    protected Printer printer = (Printer) addDevice(new Printer());
    protected Basic6845 crtc = (Basic6845) addDevice(new Basic6845());
    protected GateArray gateArray = (GateArray) addDevice(new GateArray(this));
    protected PAL16L8 Pal16L8 = (PAL16L8) addDevice(new PAL16L8(this));
    protected ASIC asic = (ASIC) addDevice(new ASIC(this));
    protected PPI8255 ppi = (PPI8255) addDevice(new PPI8255());
    public UPD765A fdc = (UPD765A) addDevice(new UPD765A(4));  // 4 cycles per call to cycle()
    protected AY_3_8910 psg = (AY_3_8910) addDevice(new AY_3_8910());
//    protected SampledSound sampler = (SampledSound) addDevice(new SampledSound());
    protected Disassembler disassembler = new DissZ80();
    protected int audioAdd = psg.getSoundPlayer().getClockAdder(AUDIO_TEST,
            CYCLES_PER_SECOND_CPC);
    protected int audioCount = 0;
    protected Drive[] floppies = new Drive[4];
    protected KeyboardB keyboardb = new KeyboardB();
    protected KeyboardA keyboarda = new KeyboardA();
    protected KeyboardN keyboardn = new KeyboardN();
    DeviceMapping amstradSpeech = new DeviceMapping(ssa1, 0x0411, 0x0);
    DeviceMapping dktronicsSpeech = new DeviceMapping(dktronics, 0xFFFF, 0xFBFE);
    DeviceMapping multiface2 = new DeviceMapping(multiface, 0, 0);
    boolean amsspeech = false;
    boolean dkspeech = false;
    // Conversion of CPC BDIR & BC1 values 0..3 to PSG values
    protected final int[] PSG_VALUES = new int[]{
        psg.BC2_MASK,
        psg.BC2_MASK | psg.BC1_MASK,
        psg.BC2_MASK | psg.BDIR_MASK,
        psg.BC2_MASK | psg.BDIR_MASK | psg.BC1_MASK
    };
    protected AY_3_8910_A psg1 = (AY_3_8910_A) addDevice(new AY_3_8910_A());
    protected final int[] PSG_VALUES1 = new int[]{
        psg1.BC2_MASK,
        psg1.BC2_MASK | psg1.BC1_MASK,
        psg1.BC2_MASK | psg1.BDIR_MASK,
        psg1.BC2_MASK | psg1.BDIR_MASK | psg1.BC1_MASK
    };
    protected AY_3_8910_B psg2 = (AY_3_8910_B) addDevice(new AY_3_8910_B());
    protected final int[] PSG_VALUES2 = new int[]{
        psg2.BC2_MASK,
        psg2.BC2_MASK | psg2.BC1_MASK,
        psg2.BC2_MASK | psg2.BDIR_MASK,
        psg2.BC2_MASK | psg2.BDIR_MASK | psg2.BC1_MASK
    };
    protected Z84C30 z84c30 = (Z84C30) addDevice(new Z84C30());

    protected String CPCname = "";
    protected String[] DSKImages;
    protected int[] DSKSizes;
    protected FormatPanel format;
    public static int seldrive;

    public Printer getPrinter() {
        return printer;
    }

    public void setMode(int mo) {
        gateArray.screenMode = mo;
    }

    public void setR52(int r) {
        gateArray.r52 = r;
    }

    public int getR52() {
        return gateArray.r52;
    }

    public int getHPOS() {
        return gateArray.getHPOS();
    }

    public int getVPOS() {
        return gateArray.getVPOS();
    }

    public int getBorderL() {
        return gateArray.xmin;
    }

    public int getBorderR() {
        return gateArray.xmax;
    }

    public int getBorderH() {
        return gateArray.borderHeight;
    }

    public GateArray getGateArray() {
        return gateArray;
    }

    public ASIC getAsic() {
        return asic;
    }

    public void setDrive(int drive) {
        fdc.resetDrive();
        if (floppies[drive] == null) {
            floppies[drive] = new Drive(2);
        }
        fdc.setDrive(drive, floppies[drive]);
    }

    public int getDrive() {
        return fdc.getDrive();
    }

    public void ASMDisk(String filename, int drive, String forma, int tracks) {
        int format = 9;
        forma = forma.toLowerCase();
        if (forma.contains("data")) {
            if (tracks == 80) {
                format = 11;
            }
        }
        if (forma.contains("sys")) {
            format = 13;
            if (tracks == 80) {
                format = 15;
            }
        }
        String discimage = DSKImages[format];
        int discsize = DSKSizes[format];
        dskImage = null;
        byte[] bufferdsk = getRom("file/" + discimage, discsize);
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(filename)));
            bos.write(bufferdsk);
            bos.close();
            Settings.set(Settings.DRIVE_FILE + Integer.toString(drive), filename);
            boolean flop = Switches.FloppySound;
            int drv = this.getCurrentDrive();
            this.setCurrentDrive(drive);
            this.DSK_Load(filename, bufferdsk);
            Switches.FloppySound = flop;
            this.setCurrentDrive(drv);
            jemu.ui.Desktop.checkdrives = true;
            fdc.poll();
            fdc.getInfo(drive);
        } catch (Exception e) {
        }
    }

    public void updateDrive(int drive) {
        try {
            String nam = Settings.get(Settings.DRIVE_FILE + Integer.toString(drive), "empty");
            if (nam.equals("empty")) {
                Settings.setBoolean(Settings.LOADDRIVE + Integer.toString(drive), false);
                return;
            }
            Settings.setBoolean(Settings.LOADDRIVE + Integer.toString(drive), true);
            int drv = this.getCurrentDrive();
            this.setCurrentDrive(drive);
            boolean flop = Switches.FloppySound;
            Switches.FloppySound = false;
            byte[] bufferdsk;
            File dat = new File(nam);
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(dat));
            bufferdsk = new byte[bis.available()];
            bis.read(bufferdsk);
            bis.close();
            this.DSK_Load(nam, bufferdsk);
            Switches.FloppySound = flop;
            this.setCurrentDrive(drv);
            jemu.ui.Desktop.checkdrives = true;
        } catch (Exception e) {
        }
    }

    public void setClock(int value) {
        psg1.setClock(value);
        psg2.setClock(value);
        this.reSync();
    }

    public void setStereo(boolean stereo) {
        psg1.setStereo(stereo);
        psg2.setStereo(stereo);
        this.reSync();
    }

    public void setInverted(boolean i) {
        psg1.setInverted(i);
        psg2.setInverted(i);
    }

    JFrame fram;

    public CPC(Applet applet, String name) {
        super(applet, name);
        setBasePath("cpc");
//        recorder.setVisible(true);
        recorder.rec.addActionListener(this);
        recorder.stop.addActionListener(this);
        recorder.play.addActionListener(this);
        DSKImages = new String[]{
            "parados80.dsk", "parados41.dsk", "parados40D.dsk",
            "romdosD1.dsk", "romdosD2.dsk", "romdosD10.dsk",
            "romdosD20.dsk", "romdosD40.dsk", "s-dos(romdosD80).dsk",
            "dataSS40.dsk", "dataDS40.dsk", "dataSS80.dsk", "dataDS80.dsk",
            "systemSS40.dsk", "systemDS40.dsk", "systemSS80.dsk", "systemDS80.dsk",
            "ibmSS40.dsk", "ibmDS40.dsk", "ibmSS80.dsk", "ibmDS80.dsk",
            "ultraform.dsk", "vortex704k.dsk"
        };
        DSKSizes = new int[]{
            430336, 220672, 430336,
            778496, 778496, 860416,
            860416, 860416, 860416,
            194816, 389376, 389376, 778496,
            194816, 389376, 389376, 778496,
            174336, 348416, 348416, 696576,
            220672, 778496
        };

        cheatc = getRom("file/cheat.bin", 0x4000);
        final Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
        mp3.add(conv);
        conv.setFocusable(false);
        conv.setEnabled(false);
        mp3.setUndecorated(true);
        mp3.pack();
        mp3.setAlwaysOnTop(true);
        mp3.setLocation((d.width - mp3.getSize().width) / 2, (d.height - mp3.getSize().height) / 2);
        mp3.setVisible(false);
        initCPCType(name);

        z80.setMemoryDevice(memory);
        z80.addInputDeviceMapping(new DeviceMapping(memory, 0x0101, 0x0000));  // Emulator detection
        z80.addOutputDeviceMapping(new DeviceMapping(memory, 0x2000, 0x0000)); // ROM Select
        z80.setInterruptDevice(gateArray);
//        z80.setInterruptDevice(asic);
        z80.addOutputDeviceMapping(new DeviceMapping(gateArray, 0xC000, 0x4000)); // All GA functions
        z80.addOutputDeviceMapping(new DeviceMapping(Pal16L8, 0x8000, 0x0000)); // PAL function: Ram Mapping
//        z80.addOutputDeviceMapping(new DeviceMapping(asic, 0xc000, 0x4000)); // All GA functions
//        z80.addInputDeviceMapping(new DeviceMapping(asic, 0xc000, 0x4000)); // All GA functions
        z80.setCycleDevice(this);
        crtc.setRegisterSelectMask(0x0300, 0x0000);
        crtc.setRegisterWriteMask(0x0300, 0x0100);
        crtc.setRegisterReadMask(0x0300, 0x0300);
        crtc.setRegisterStatusMask(0x0300, 0x0200);
        z80.addOutputDeviceMapping(new DeviceMapping(amdrum, 0xFF00, 0xFF00));
        z80.addInputDeviceMapping(new DeviceMapping(amdrum, 0xFF00, 0xFF00));
        z80.addOutputDeviceMapping(new DeviceMapping(digiblaster, 0x1000, 0x00));
        z80.addOutputDeviceMapping(new DeviceMapping(printer, 0x1000, 0x00));
        z80.addOutputDeviceMapping(new DeviceMapping(multiface, 0, 0));
        z80.addOutputDeviceMapping(new DeviceMapping(sfclock, 0xfd14, 0xfd14));
        z80.addOutputDeviceMapping(new DeviceMapping(sfclock, 0xfd15, 0xfd15));
        z80.addInputDeviceMapping(new DeviceMapping(sfclock, 0xfd14, 0xfd14));
        z80.addInputDeviceMapping(new DeviceMapping(sfclock, 0xfd15, 0xfd15));
        z80.addInputDeviceMapping(new DeviceMapping(sfclock, 0xfd10, 0xfd10));

        z80.addInputDeviceMapping(new DeviceMapping(internalfilesystem, 0xFFf0, 0xFFf0));
//        z80.addInputDeviceMapping(new DeviceMapping(internalfilesystem, 0xFFf4, 0xFFf4));

        z80.addOutputDeviceMapping(new DeviceMapping(internalfilesystem, 0xFFf0, 0xFFf0));
//        z80.addOutputDeviceMapping(new DeviceMapping(internalfilesystem, 0xFFf4, 0xFFf4));
        crtc.setCRTCListener(gateArray);
        z80.addOutputDeviceMapping(new DeviceMapping(crtc, 0x4000, 0x0000));
        z80.addInputDeviceMapping(new DeviceMapping(crtc, 0x4000, 0x0000));
        ppi.setPortMasks(0x0100, 0x0100, 0x0200, 0x0200);
        ppi.setReadDevice(PPI8255.PORT_B, this, PPI_PORT_B);
        ppi.setWriteDevice(PPI8255.PORT_C, this, PPI_PORT_C);
        ppi.setReadDevice(PPI8255.PORT_A, psg, 0);
        ppi.setWriteDevice(PPI8255.PORT_A, psg, 0);
        psg.setReadDevice(psg.PORT_A, this, PSG_PORT_A);
        psg.setClockSpeed(CYCLES_PER_SECOND_CPC);
        psg2.setClockSpeed(CYCLES_PER_SECOND_CPC);
        psg1.setClockSpeed(CYCLES_PER_SECOND_CPC);
        mapDualYM(Settings.getBoolean(Settings.PLAYCITY, false));
        z80.addOutputDeviceMapping(new DeviceMapping(ppi, 0x0800, 0x0000));
        z80.addInputDeviceMapping(new DeviceMapping(ppi, 0x0800, 0x0000));
        z80.addOutputDeviceMapping(new DeviceMapping(fdc, 0x0580, 0x0100));
        z80.addInputDeviceMapping(new DeviceMapping(fdc, 0x0580, 0x0100));

        z80.addOutputDeviceMapping(new DeviceMapping(this, 0x581, 0x0000));
        z80turbo = Settings.getBoolean(Settings.Z80TURBO, false);
        z80.setTimes(z80turbo);
        for (int i = 0; i < 4; i++) {
            floppies[i] = new Drive(2);
        }
    }

    DeviceMapping psg1a = new DeviceMapping(psg1, 0xFFFF, 0xf880);
    DeviceMapping psg1b = new DeviceMapping(psg1, 0xFFFF, 0xf881);
    DeviceMapping psg1c = new DeviceMapping(psg1, 0xFFFF, 0xf882);
    DeviceMapping psg1d = new DeviceMapping(psg1, 0xFFFF, 0xf883);
    DeviceMapping psg1e = new DeviceMapping(psg1, 0xFFFF, 0xf884);
    DeviceMapping psg1f = new DeviceMapping(psg1, 0xFFFF, 0xf885);
    DeviceMapping psg1al = new DeviceMapping(psg1, 0xFFFF, 0xf980);
    DeviceMapping psg1bl = new DeviceMapping(psg1, 0xFFFF, 0xf981);
    DeviceMapping psg1cl = new DeviceMapping(psg1, 0xFFFF, 0xf982);
    DeviceMapping psg1dl = new DeviceMapping(psg1, 0xFFFF, 0xf983);
    DeviceMapping psg1el = new DeviceMapping(psg1, 0xFFFF, 0xf984);
    DeviceMapping psg1fl = new DeviceMapping(psg1, 0xFFFF, 0xf985);

    DeviceMapping psg2a = new DeviceMapping(psg2, 0xFFFF, 0xf888);
    DeviceMapping psg2b = new DeviceMapping(psg2, 0xFFFF, 0xf889);
    DeviceMapping psg2c = new DeviceMapping(psg2, 0xFFFF, 0xf88a);
    DeviceMapping psg2d = new DeviceMapping(psg2, 0xFFFF, 0xf88b);
    DeviceMapping psg2e = new DeviceMapping(psg2, 0xFFFF, 0xf88c);
    DeviceMapping psg2f = new DeviceMapping(psg2, 0xFFFF, 0xf88d);
    DeviceMapping psg2al = new DeviceMapping(psg2, 0xFFFF, 0xf988);
    DeviceMapping psg2bl = new DeviceMapping(psg2, 0xFFFF, 0xf989);
    DeviceMapping psg2cl = new DeviceMapping(psg2, 0xFFFF, 0xf98a);
    DeviceMapping psg2dl = new DeviceMapping(psg2, 0xFFFF, 0xf98b);
    DeviceMapping psg2el = new DeviceMapping(psg2, 0xFFFF, 0xf98c);
    DeviceMapping psg2fl = new DeviceMapping(psg2, 0xFFFF, 0xf98d);
    DeviceMapping z84c30a = new DeviceMapping(z84c30, 0xffff, 0xF880);

    public void setZ80Turbo(boolean turbo) {
        z80turbo = turbo;
        Settings.setBoolean(Settings.Z80TURBO, z80turbo);
        z80.setTimes(z80turbo);
    }

    public boolean isZ80Turbo() {
        return z80turbo;
    }

    public void mapDualYM(boolean map) {
        if (map) {
            z80.addOutputDeviceMapping(psg1a);
            z80.addOutputDeviceMapping(psg1b);
            z80.addOutputDeviceMapping(psg1c);
            z80.addOutputDeviceMapping(psg1d);
            z80.addOutputDeviceMapping(psg1e);
            z80.addOutputDeviceMapping(psg1f);
            z80.addOutputDeviceMapping(psg1al);
            z80.addOutputDeviceMapping(psg1bl);
            z80.addOutputDeviceMapping(psg1cl);
            z80.addOutputDeviceMapping(psg1dl);
            z80.addOutputDeviceMapping(psg1el);
            z80.addOutputDeviceMapping(psg1fl);
            z80.addOutputDeviceMapping(psg2a);
            z80.addOutputDeviceMapping(psg2b);
            z80.addOutputDeviceMapping(psg2c);
            z80.addOutputDeviceMapping(psg2d);
            z80.addOutputDeviceMapping(psg2e);
            z80.addOutputDeviceMapping(psg2f);
            z80.addOutputDeviceMapping(psg2al);
            z80.addOutputDeviceMapping(psg2bl);
            z80.addOutputDeviceMapping(psg2cl);
            z80.addOutputDeviceMapping(psg2dl);
            z80.addOutputDeviceMapping(psg2el);
            z80.addOutputDeviceMapping(psg2fl);
            this.setStereo(true);
            this.setInverted(false);
            z80.addOutputDeviceMapping(z84c30a);
            psg1.getSoundPlayer1().play();
            psg2.getSoundPlayer2().play();
            System.out.println("PlayCity added...");
        } else {
//            z80.removeOutputDeviceMapping(psg1a);
//            z80.removeOutputDeviceMapping(psg1b);
//            z80.removeOutputDeviceMapping(psg1c);
//            z80.removeOutputDeviceMapping(psg1d);
//            z80.removeOutputDeviceMapping(psg1e);
//            z80.removeOutputDeviceMapping(psg1f);
//            z80.removeOutputDeviceMapping(psg1al);
//            z80.removeOutputDeviceMapping(psg1bl);
//            z80.removeOutputDeviceMapping(psg1cl);
//            z80.removeOutputDeviceMapping(psg1dl);
//            z80.removeOutputDeviceMapping(psg1el);
//            z80.removeOutputDeviceMapping(psg1fl);
//            z80.removeOutputDeviceMapping(psg2a);
//            z80.removeOutputDeviceMapping(psg2b);
//            z80.removeOutputDeviceMapping(psg2c);
//            z80.removeOutputDeviceMapping(psg2d);
//            z80.removeOutputDeviceMapping(psg2e);
//            z80.removeOutputDeviceMapping(psg2f);
//            z80.removeOutputDeviceMapping(psg2al);
//            z80.removeOutputDeviceMapping(psg2bl);
//            z80.removeOutputDeviceMapping(psg2cl);
//            z80.removeOutputDeviceMapping(psg2dl);
//            z80.removeOutputDeviceMapping(psg2el);
//            z80.removeOutputDeviceMapping(psg2fl);
//            z80.removeOutputDeviceMapping(z84c30a);
            psg1.getSoundPlayer1().stop();
            psg2.getSoundPlayer2().stop();
            System.out.println("PlayCity removed...");
        }
    }
    JFrame forma;

    public Display getCPCDisplay() {
        return display;
    }

    public void formatDisk(int drive) {
        if (format == null) {
            format = new FormatPanel();
            forma = new JFrame("Format Disk");
            forma.add(format);
            forma.pack();
            forma.setResizable(false);
            forma.setVisible(false);
        }
        format.drivesel.setSelectedIndex(drive);
        forma.setVisible(true);
    }
    public static boolean up0, up1;
    CPRLoader CPRloader = new CPRLoader();

    public void formatDisk(int drive, int format) {
        String discimage = DSKImages[format];
        int discsize = DSKSizes[format];
        dskImage = null;
        String writeAs;
        byte[] bufferdsk = getRom("file/" + discimage, discsize);
        System.out.println("Formatting image in drive DF" + drive);
        if (drive == 0) {
            if (dskImageA != null) {
                dskImage = dskImageA;
            }
        }
        if (drive == 1) {
            if (dskImageB != null) {
                dskImage = dskImageB;
            }
        }
        if (drive == 2) {
            if (dskImageC != null) {
                dskImage = dskImageC;
            }
        }
        if (drive == 3) {
            if (dskImageD != null) {
                dskImage = dskImageD;
            }
        }
        if (dskImage != null) {
            writeAs = dskImage.getName();
            int ok = JOptionPane.showConfirmDialog(new Frame(),
                    "Are you sure to format your DSK\n"
                    + "\"" + writeAs + "\"?\n"
                    + "All data will be erased!",
                    "Confirm format", JOptionPane.YES_NO_OPTION);
            if (ok == JOptionPane.YES_OPTION) {
                try {
                    final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(writeAs));
                    bos.write(bufferdsk);
                    bos.close();
                    int drv = this.getCurrentDrive();
                    this.setCurrentDrive(drive);
                    boolean flop = Switches.FloppySound;
                    Switches.FloppySound = false;
                    this.DSK_Load(writeAs, bufferdsk);
                    this.setCurrentDrive(drv);
                    Switches.FloppySound = flop;
                    Settings.set(Settings.DRIVE_FILE + Integer.toString(drive), writeAs);
                    Settings.setBoolean(Settings.LOADDRIVE + Integer.toString(drive), true);
                    jemu.ui.Desktop.checkdrives = true;
                } catch (Exception e) {
                }
            }

        } else {
            try {
                FileDialog filedia = new FileDialog((Frame) new Frame(), "Create DSK file", FileDialog.SAVE);
                if (Switches.uncompressed) {
                    filedia.setFile("*.dsk");
                } else {
                    filedia.setFile("*.dsz");
                }
                filedia.setVisible(true);
                String filename = filedia.getFile();
                if (filename != null) {
                    if (Switches.uncompressed) {
                        if (!filename.toLowerCase().endsWith(".dsk")) {
                            filename += ".dsk";
                        }
                    } else if (!filename.toLowerCase().endsWith(".dsz")) {
                        filename += ".dsz";
                    }
                    final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filename));
                    bos.write(bufferdsk);
                    bos.close();
                    int drv = this.getCurrentDrive();
                    this.setCurrentDrive(drive);
                    this.DSK_Load(filename, bufferdsk);
                    this.setCurrentDrive(drv);
                    Settings.set(Settings.DRIVE_FILE + Integer.toString(drive), filename);
                    Settings.setBoolean(Settings.LOADDRIVE + Integer.toString(drive), true);
                    jemu.ui.Desktop.checkdrives = true;
                }
            } catch (Exception e) {
            }
        }
    }

    VirtualKeyBoard key;
    JFrame keyFram;

    public JPanel VirtualKeys() {
        if (key == null) {
            key = new VirtualKeyBoard();
//            keyFram = new JFrame("Virtual Keyboard");
//            keyFram.setLayout(new BorderLayout());
//            keyFram.add(key, BorderLayout.CENTER);
//            keyFram.setResizable(true);
//            Thread v = new Thread() {
//                public void run() {
//                    try {
//                        Thread.sleep(2000);
//                    } catch (Exception e) {
//                    }
//                    keyFram.setResizable(false);
//                    keyFram.pack();
//                    keyFram.setVisible(true);
//                }
//            };
//            keyFram.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//            v.start();
        }
        return key;
    }

    public Keyboard getKeyBoard() {
        return this.keyboarda;
    }

    private void initCPCType(String name) {
//                AmstradEUBDD bdd = new AmstradEUBDD(this);
//        JFrame fram = new JFrame("Test");
//        fram.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//        fram.setLayout(new BorderLayout());
//        fram.add(bdd, BorderLayout.CENTER);
//        fram.pack();
//        fram.setVisible(true);
        checkArgs();
        // check for MAXAM assembler
        if (Switches.Maxam) {
            upperROMs.put("14", "MAXAM.ROM");
        }

        if (usemem != null) {
            if (usemem.contains("64")) {
                Switches.Memory = "TYPE_64K";
            }
            if (usemem.contains("128")) {
                Switches.Memory = "TYPE_128K";
            }
            if (usemem.contains("256") || usemem.contains("320")) {
                Switches.Memory = "TYPE_256K";
            }
            if (usemem.contains("512") || usemem.contains("576")) {
                Switches.Memory = "TYPE_512K";
            }
        }
        // Set memorytype for all models
        if (Switches.Memory.equals("TYPE_512K")) {
            memory = new CPCMemory(CPCMemory.TYPE_512K);
        } else if (Switches.Memory.equals("TYPE_256K")) {
            memory = new CPCMemory(CPCMemory.TYPE_256K);
        } else if (Switches.Memory.equals("TYPE_128K")) {
            memory = new CPCMemory(CPCMemory.TYPE_128K);
        } else if (Switches.Memory.equals("TYPE_64K")) {
            memory = new CPCMemory(CPCMemory.TYPE_64K);
        } else if (Switches.Memory.equals("TYPE_SILICON_DISC")) {
            memory = new CPCMemory(CPCMemory.TYPE_SILICON_DISC);
        } else if (Switches.Memory.equals("TYPE_128_SILICON_DISC")) {
            memory = new CPCMemory(CPCMemory.TYPE_128_SILICON_DISC);
        } else {
            memory = new CPCMemory(CPCMemory.TYPE_512K);
        }
        memory2 = new CPCMemory(CPCMemory.TYPE_128K);
        //
        System.out.println("Memory choosen: " + Switches.Memory);
        String name2 = name;
        if (cpctype != null) {
            name = cpctype;
        }
        memory.setPlus(false);
        defineRoms(name);

        name = name2;
        Switches.computersys = 1;
    }

    protected void defineRoms(String name) {
        sfclock.setRunning(false);
        System.out.println("Full Clock reset");
        lowerROM = null;
        upperROMs.clear();
        memory.setLowerROM(null);
        for (int i = 0; i < 32; i++) {
            memory.setUpperROM(i, null);
        }

        CPCname = name;
        name = name.toUpperCase();

        if ("CPC464".equals(name)) {
            lowerROM = "OS464.ROM";
            upperROMs.put("0", "BASIC1-0.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("CPC464T".equals(name)) {
            lowerROM = "OS464.ROM";
            upperROMs.put("0", "BASIC1-0.ROM");
        } else if ("CPC664".equals(name)) {
            lowerROM = "OS664.ROM";
            upperROMs.put("0", "BASIC664.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("CPC464PARA".equals(name)) {
            lowerROM = "OS464.ROM";
            upperROMs.put("0", "BASIC1-0.ROM");
            upperROMs.put("7", "PARADOS.ROM");
        } else if ("CPC6128".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("ST128".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            upperROMs.put("1", "STK1.ROM");
            upperROMs.put("2", "STK2.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("ART".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            upperROMs.put("1", "ART0.ROM");
            upperROMs.put("2", "ART1.ROM");
            upperROMs.put("3", "ART2.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("PARADOS".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            upperROMs.put("7", "PARADOS.ROM");
        } else if ("ROMPACK".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            upperROMs.put("1", "ROMPKP1.ROM");
            upperROMs.put("2", "ROMPKP2.ROM");
            upperROMs.put("7", "PARADOS.ROM");
        } else if ("ROMSYM".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            upperROMs.put("1", "sym-romA.ROM");
            upperROMs.put("2", "sym-romB.ROM");
            upperROMs.put("3", "sym-romC.ROM");
            upperROMs.put("4", "sym-romD.ROM");
            upperROMs.put("5", "ROMPKP1.ROM");
            upperROMs.put("6", "ROMPKP2.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("CPC6128FR".equals(name)) {
            lowerROM = "OSFR.ROM";
            upperROMs.put("0", "BASICFR.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("CPC6128ES".equals(name)) {
            lowerROM = "OSES.ROM";
            upperROMs.put("0", "BASICES.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("SYMBOS".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
            upperROMs.put("1", "sym-romA.ROM");
            upperROMs.put("2", "sym-romB.ROM");
            upperROMs.put("3", "sym-romC.ROM");
            upperROMs.put("4", "sym-romD.ROM");
        } else if ("FUTUREOS".equals(name)) {
            lowerROM = "OS6128.ROM";
            upperROMs.put("0", "BASIC1-1.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
            upperROMs.put("10", "FOSC-E-A.ROM");
            upperROMs.put("11", "FOSC-E-B.ROM");
            upperROMs.put("12", "FOSC-E-C.ROM");
            upperROMs.put("13", "FOSC-E-D.ROM");
        } else if ("KCCOMPACT".equals(name)) {
            lowerROM = "KCCOS.ROM";
            upperROMs.put("0", "KCCBAS.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("COMCPC".equals(name)) {
            lowerROM = "OS-C64.ROM";
            upperROMs.put("0", "BASIC-C64.ROM");
            if (amsdos == null || !amsdos.equals("no")) {
                upperROMs.put("7", "AMSDOS.ROM");
            }
        } else if ("PLUS".equals(name)) {
//            CPRloader.init();
//            memory.setPlus(true);

            String rom = RSettings.get(RSettings.LOWER_ROM, "none");
            if (!rom.equals("none")) {
                lowerROM = rom;
            }
            rom = RSettings.get(RSettings.UPPER_ROM_0, "none");
            if (!rom.equals("none")) {
                upperROMs.put("0", rom);
            }
            rom = RSettings.get(RSettings.UPPER_ROM_7, "none");
            if (!rom.equals("none")) {
                if (amsdos != null) {
                    if (amsdos.equals("yes")) {
                        upperROMs.put("7", rom);
                    } else if (!rom.toUpperCase().contains("DOS")) {
                        upperROMs.put("7", rom);
                    }
                } else {
                    upperROMs.put("7", rom);
                }
            }
            if (!Switches.disableroms) {
                rom = RSettings.get(RSettings.UPPER_ROM_1, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("1", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_2, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("2", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_3, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("3", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_4, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("4", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_5, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("5", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_6, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("6", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_8, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("8", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_9, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("9", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_A, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("10", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_B, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("11", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_C, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("12", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_D, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("13", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_E, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("14", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_F, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("15", rom);
                }
            }
        } // Manual rom settings
        else if ("CUSTOM".equals(name)) {
            String rom = RSettings.get(RSettings.LOWER_ROM, "none");
            if (!rom.equals("none")) {
                lowerROM = rom;
            }
            rom = RSettings.get(RSettings.UPPER_ROM_0, "none");
            if (!rom.equals("none")) {
                upperROMs.put("0", rom);
            }
            rom = RSettings.get(RSettings.UPPER_ROM_7, "none");
            if (!rom.equals("none")) {
                if (amsdos != null) {
                    if (amsdos.equals("yes")) {
                        upperROMs.put("7", rom);
                    } else if (!rom.toUpperCase().contains("DOS")) {
                        upperROMs.put("7", rom);
                    }
                } else {
                    upperROMs.put("7", rom);
                }
            }
            if (!Switches.disableroms) {
                rom = RSettings.get(RSettings.UPPER_ROM_1, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("1", rom);
                }
                boolean hasramdisk = rom.contains("RDOS-EXT.ROM");
                Settings.setBoolean(Settings.HASRAMDISK, hasramdisk);
                jemu.ui.Desktop.saveram.setEnabled(hasramdisk);
                jemu.ui.Desktop.loadram.setEnabled(hasramdisk);
                rom = RSettings.get(RSettings.UPPER_ROM_2, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("2", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_3, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("3", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_4, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("4", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_5, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("5", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_6, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("6", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_8, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("8", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_9, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("9", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_A, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("10", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_B, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("11", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_C, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("12", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_D, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("13", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_E, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("14", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_F, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("15", rom);
                }

                rom = RSettings.get(RSettings.UPPER_ROM_10, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("16", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_11, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("17", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_12, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("18", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_13, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("19", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_14, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("20", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_15, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("21", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_16, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("22", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_17, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("23", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_18, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("24", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_19, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("25", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_1A, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("26", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_1B, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("27", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_1C, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("28", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_1D, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("29", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_1E, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("30", rom);
                }
                rom = RSettings.get(RSettings.UPPER_ROM_1F, "none");
                if (!rom.equals("none")) {
                    upperROMs.put("31", rom);
                }
            }
        }

        if (Switches.Expansion) {
            upperROMs.put("6", "JAVACPC.ROM");
        }
        String romNum, romName;
        Set roms = upperROMs.keySet();
        Iterator romIt = roms.iterator();
        if (!memory.plus) {
            while (romIt.hasNext()) {
                romNum = (String) romIt.next();
                romName = (String) upperROMs.get(romNum);
                Byte slot = new Byte(romNum);
                int pos = slot.byteValue() & 0x01f;
                if (pos < 32) {
                    if (romName.toLowerCase().startsWith("*")) {
                        romName = romName.substring(1, (romName.length()));
                        if ((!memory.roms32 && pos < 16) || memory.roms32) {
                            memory.setUpperROM(pos, getRomFile(romName));
                            System.out.println("Rom loaded: " + romName);
//                            if (pos == 12){
//                                System.out.println(romName);
////                                System.exit(0);
//                                System.out.println(Util.dumpBytes(getRomFile(romName)));
//                                System.exit(0);
//                            }

                        }
                    } else if ((!memory.roms32 && pos < 16) || memory.roms32) {
                        memory.setUpperROM(pos, getRomFile(romPath + romName));
                    }
                }
            }
        }

    }

    int diff = 0x0170;

    @Override
    public void initialise() {
        disableresync = false;
        AddressA.setEnabled(false);
        AddressB.setEnabled(false);
        AddressA.setText("");
        AddressB.setText("C000");
        AmHeader.addItemListener(new CheckBoxListener());
        AmHeader.setSelected(true);
        YMInterleaved.addItemListener(new CheckBoxListener());
        Overscan.addItemListener(new CheckBoxListener());
        YMInterleaved.setSelected(YM_Interleaved);
        ymcount = 0;
        YM_RecCount = 0;
        YM_vbl = 0;
        YM_Rec = false;
        YM_Play = false;
        YM_Stop = false;
        YM_Save = false;
        YM_Load = false;
        atari_st_mode = false;
        spectrum_mode = false;
        shouldcount = false;
        begincount = 0;
        YM_Minutes = 0;
        YM_Seconds = 0;
        YMControl.UpdateLCD("*YM PLAYER*");
        String romNum;
        String romName;
        memory.plus = false;
        os_addr = 0x29A6;
        if (!memory.plus) {
            if (lowerROM != null) {
                if (lowerROM.toLowerCase().startsWith("*")) {
                    lowerROM = lowerROM.substring(1, (lowerROM.length()));
                    os = getRomFile(lowerROM);
                    memory.setLowerROM(os);
                } else if (jemu.ui.Desktop.localize.isSelected()) {
                    if (lowerROM.toLowerCase().equals("os6128.rom")) {
                        if (language.equals("fr")) {
                            os = getRom("file/6128fr.rom", 16384);
                            memory.setLowerROM(os);
                        } else if (language.equals("es")) {
                            os = getRom("file/6128es.rom", 16384);
                            memory.setLowerROM(os);
                        } else {
                            os = getRom("file/6128en.rom", 16384);
                            memory.setLowerROM(os);
                        }
                    } else if (lowerROM.toLowerCase().equals("os464.rom")) {
                        os_addr = 0x2836;
                        if (language.equals("fr")) {
                            os = getRom("file/464fr.rom", 16384);
                            memory.setLowerROM(os);
                        } else if (language.equals("es")) {
                            os = getRom("file/464es.rom", 16384);
                            memory.setLowerROM(os);
                        } else {
                            os = getRom("file/464en.rom", 16384);
                            memory.setLowerROM(os);
                        }
                    } else {
                        os = getRomFile(romPath + lowerROM);
                        memory.setLowerROM(os);
                    }
                } else {
                    os = getRomFile(romPath + lowerROM);
                    memory.setLowerROM(os);
                }
            }
            try {
                os_unpatch[0] = os[os_addr];
                os_unpatch[1] = os[os_addr + 1];
                if (Switches.ROM.equals("CPC464")) {
                    a464 = os[0x2a68];
                    b464 = os[0x286d];
                    c464 = os[0x286e];
                    d464 = os[0x286f];
                    e464 = os[0x2870];
                    f464 = os[0x2871];
                } else {
                    a464 = os[0x2a68 + diff];
                    b464 = os[0x286d + diff];
                    c464 = os[0x286e + diff];
                    d464 = os[0x286f + diff];
                    e464 = os[0x2870 + diff];
                    f464 = os[0x2871 + diff];
                }
            } catch (Exception e) {
            }
        }
        ramdisk = Settings.get(Settings.RAMDISK, "null");
        if (!ramdisk.equals("null")) {
            System.out.println("Opening ramdisk image " + ramdisk);
            readRamDisk(ramdisk);
        }

//        os = getRom("roms/OS6128.ROM", 0x4000);
//        os_unpatch[0] = os[os_addr];
//        os_unpatch[1] = os[os_addr + 1];
//        memory.setLowerROM(os);
        Set roms = upperROMs.keySet();
        Iterator romIt = roms.iterator();
        if (!memory.plus) {
            while (romIt.hasNext()) {
                romNum = (String) romIt.next();
                romName = (String) upperROMs.get(romNum);
                Byte slot = new Byte(romNum);
                int pos = slot.byteValue() & 0x01f;
                if (pos < 32) {
                    if (romName.toLowerCase().startsWith("*")) {
                        romName = romName.substring(1, (romName.length()));
                        if ((!memory.roms32 && pos < 16) || memory.roms32) {
                            memory.setUpperROM(pos, getRomFile(romName));
//                            if (pos == 12){
//                                System.out.println(romName);
////                                System.exit(0);
//                                System.out.println(Util.dumpBytes(getRomFile(romName)));
//                                System.exit(0);
//                            }

                        }
                    } else if ((!memory.roms32 && pos < 16) || memory.roms32) {
                        memory.setUpperROM(pos, getRomFile(romPath + romName));
                    }
                }
            }

            if (Switches.ROM.equals("CPC464") || Switches.ROM.equals("CPC664")) {
                memory.setMultiROM(getRom("file/mf86.rom", 8192));
            } else {
                memory.setMultiROM(getRom("file/mf0e.rom", 8192));
            }
            upperROMs.clear();
            gateArray.setMemory(memory.getMemory());
            super.initialise();
            psg.getSoundPlayer().play();
//            sampler.getSoundPlayer().play();
            String magic = Settings.get(Settings.MAGICCPCDISKIMAGE + 0, "empty");
            if (magic.equals("empty")) {
                magic = null;
            }
            loadMagicCPCDisk(0, magic);
            magic = Settings.get(Settings.MAGICCPCDISKIMAGE + 1, "empty");
            if (magic.equals("empty")) {
                magic = null;
            }
            loadMagicCPCDisk(1, magic);
        }
    }
    JFileChooser fileDlg;

    public void loadMagic(int drive) {
//        if (fileDlg == null) {
            fileDlg = new JFileChooser();
//        }
        fileDlg.setDialogTitle("Select Folder for Magic CPC Disk Image");
//        fileDlg.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        fileDlg.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
//        fileDlg.setFileFilter(new FileNameExtensionFilter("Properties file", "properties"));
        fileDlg.setAcceptAllFileFilterUsed(false);
        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
        	 
            public String getDescription() {
                return "Properties dsk file (*.dsk.properties)";
            }
         
            public boolean accept(File f) {
                if (f.isDirectory()) {
                    return true;
                } else {
                    return f.getName().toLowerCase().endsWith(".dsk.properties");
                }
            }
        });
        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
       	 
            public String getDescription() {
                return "beta dsk file (*.dsk)";
            }
         
            public boolean accept(File f) {
                if (f.isDirectory()) {
                    return true;
                } else {
                    return f.getName().toLowerCase().endsWith(".dsk");
                }
            }
        });
        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
          	 
            public String getDescription() {
                return "Directory";
            }
         
            public boolean accept(File f) {
                return f.isDirectory();
            }
        });
        
        
        String path = Settings.get(Settings.MAGICCPCDISKIMAGE + drive, null);
        if (path != null) {
            fileDlg.setCurrentDirectory(new File(path));
        }

        String file = fileDlg.showOpenDialog(new JFrame()) == JFileChooser.APPROVE_OPTION ? fileDlg.getSelectedFile().toString() : null;
        if (file != null) {
            Settings.set(Settings.MAGICCPCDISKIMAGE + drive, file);
            this.loadMagicCPCDisk(drive, file);
        }
    }

    String[] magics = new String[4];
    MagicCPCDiscImage[] magicimage = {
        null,
        null,
        null,
        null
    };

//    public void storeMagicAsDSK() {
//        for (int i = 0; i < 4; i++) {
//            if (magicimage[i] != null) {
//                magicimage[i].copyAsDSK();
//            }
//        }
//    }

    public void loadMagicCPCDisk(int drive, String path) {
        if (path == null) {
            return;
        }
        magics[drive] = path;
        floppies[drive].setSides(2);
        fdc.setDrive(drive, floppies[drive]);
        
        magicimage[drive] = new MagicCPCDiscImage(path);
        fdc.getDrive(drive).setDisc(Drive.BOTH_HEADS, magicimage[drive]);
        disableSave[drive] = true;
        jemu.ui.Desktop.checkdrives = true;
    }

    File magiccheck;
    String[][] lastMagicDir = new String[4][];
    String[][] actualMagicDir = new String[4][];
    long[][] lastMagicSizes = new long[4][];
    long[][] actualMagicSizes = new long[4][];

    public static boolean protect;

    protected void scanActualFiles(int drive) {
        for (int i = 0; i < actualMagicDir[drive].length; i++) {
            File c = new File(magiccheck + "\\" + actualMagicDir[drive][i]);
            actualMagicSizes[drive][i] = c.length();
        }
    }

    protected void scanLastFiles(int drive) {
        for (int i = 0; i < lastMagicSizes[drive].length; i++) {
            File c = new File(magiccheck + "\\" + lastMagicDir[drive][i]);
            lastMagicSizes[drive][i] = c.length();
        }
    }

    public void checkMagic(int drive) {
        magiccheck = new File(magics[drive]);
        if (magiccheck.isFile()) {
        	magiccheck=magiccheck.getParentFile();
        }
        if (actualMagicDir[drive] == null) {
            actualMagicDir[drive] = magiccheck.list();
            actualMagicSizes[drive] = new long[actualMagicDir[drive].length];
            scanActualFiles(drive);
            return;
        }
        boolean reload = false;
        lastMagicDir[drive] = magiccheck.list();
        lastMagicSizes[drive] = new long[lastMagicDir[drive].length];
        scanLastFiles(drive);
        if (lastMagicDir[drive].length != actualMagicDir[drive].length) {
            actualMagicDir[drive] = magiccheck.list();
            actualMagicSizes[drive] = new long[actualMagicDir[drive].length];
            scanActualFiles(drive);
            reload = true;
        }
        if (!reload) {
            for (int i = 0; i < lastMagicDir[drive].length; i++) {
                try {
                    if (!lastMagicDir[drive][i].equals(actualMagicDir[drive][i])) {
                        actualMagicDir[drive] = magiccheck.list();
                        scanActualFiles(drive);
                        reload = true;
                        break;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    actualMagicDir[drive] = magiccheck.list();
                    lastMagicDir[drive] = magiccheck.list();
                    actualMagicSizes[drive] = new long[actualMagicDir[drive].length];
                    lastMagicSizes[drive] = new long[lastMagicDir[drive].length];
                    scanActualFiles(drive);
                    scanLastFiles(drive);
                    reload = true;
                    break;
                }
            }
        }
        if (!reload) {
            for (int i = 0; i < lastMagicSizes[drive].length; i++) {
                try {
                    if (lastMagicSizes[drive][i] != actualMagicSizes[drive][i]) {
                        actualMagicDir[drive] = magiccheck.list();
                        scanActualFiles(drive);
                        reload = true;
                        break;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    actualMagicDir[drive] = magiccheck.list();
                    lastMagicDir[drive] = magiccheck.list();
                    actualMagicSizes[drive] = new long[actualMagicDir[drive].length];
                    lastMagicSizes[drive] = new long[lastMagicDir[drive].length];
                    scanActualFiles(drive);
                    scanLastFiles(drive);
                    reload = true;
                    break;
                }
            }
        }
        if (reload) {
            if (protect) {
                System.out.println("Re-read of disk is not possible! Internal disk access!");
                protect = false;
                return;
            }
            System.out.println("Re-scanning directory in " + magics[drive]);
            loadMagicSilent(drive, magics[drive]);
        }
    }

    public void loadMagicSilent(int drive, String path) {
        if (path == null) {
            return;
        }
        magicimage[drive] = new MagicCPCDiscImage(path);
        fdc.getDrive(drive).setDisc(Drive.BOTH_HEADS, magicimage[drive]);
        disableSave[drive] = true;
    }

    public void unloadMagicCPCDisk(int drive) {
        if (magicimage[drive] == null) {
            return;
        }
        Settings.set(Settings.MAGICCPCDISKIMAGE + drive, "empty");
        magics[drive] = null;
        magicimage[drive] = null;
        fdc.setDrive(drive, null);
        disableSave[drive] = false;
        jemu.ui.Desktop.checkdrives = true;
    }

    static boolean[] disableSave = new boolean[4];

    public void refreshRoms(String name) {
        if (Switches.Memory.equals("TYPE_512K")) {
            memory.setRAMType(CPCMemory.TYPE_512K);
        } else if (Switches.Memory.equals("TYPE_256K")) {
            memory.setRAMType(CPCMemory.TYPE_256K);
        } else if (Switches.Memory.equals("TYPE_128K")) {
            memory.setRAMType(CPCMemory.TYPE_128K);
        } else if (Switches.Memory.equals("TYPE_64K")) {
            memory.setRAMType(CPCMemory.TYPE_64K);
        } else if (Switches.Memory.equals("TYPE_SILICON_DISC")) {
            memory.setRAMType(CPCMemory.TYPE_SILICON_DISC);
        } else if (Switches.Memory.equals("TYPE_128_SILICON_DISC")) {
            memory.setRAMType(CPCMemory.TYPE_128_SILICON_DISC);
        } else {
            memory.setRAMType(CPCMemory.TYPE_512K);
        }
        defineRoms(name);
        memory.plus = false;
        os_addr = 0x29A6;
        if (!memory.plus) {
            if (lowerROM != null) {
                if (lowerROM.toLowerCase().startsWith("*")) {
                    lowerROM = lowerROM.substring(1, (lowerROM.length()));
                    os = getRomFile(lowerROM);
                    memory.setLowerROM(os);
                } else if (jemu.ui.Desktop.localize.isSelected()) {
                    if (lowerROM.toLowerCase().equals("os6128.rom")) {
                        if (language.equals("fr")) {
                            os = getRom("file/6128fr.rom", 16384);
                            memory.setLowerROM(os);
                        } else if (language.equals("es")) {
                            os = getRom("file/6128es.rom", 16384);
                            memory.setLowerROM(os);
                        } else {
                            os = getRom("file/6128en.rom", 16384);
                            memory.setLowerROM(os);
                        }
                    } else if (lowerROM.toLowerCase().equals("os464.rom")) {
                        os_addr = 0x2836;
                        if (language.equals("fr")) {
                            os = getRom("file/464fr.rom", 16384);
                            memory.setLowerROM(os);
                        } else if (language.equals("es")) {
                            os = getRom("file/464es.rom", 16384);
                            memory.setLowerROM(os);
                        } else {
                            os = getRom("file/464en.rom", 16384);
                            memory.setLowerROM(os);
                        }
                    } else {
                        os = getRomFile(romPath + lowerROM);
                        memory.setLowerROM(os);
                    }
                } else {
                    os = getRomFile(romPath + lowerROM);
                    memory.setLowerROM(os);
                }
            }
            try {
                os_unpatch[0] = os[os_addr];
                os_unpatch[1] = os[os_addr + 1];
                if (Switches.ROM.equals("CPC464")) {
                    a464 = os[0x2a68];
                    b464 = os[0x286d];
                    c464 = os[0x286e];
                    d464 = os[0x286f];
                    e464 = os[0x2870];
                    f464 = os[0x2871];
                } else {
                    a464 = os[0x2a68 + diff];
                    b464 = os[0x286d + diff];
                    c464 = os[0x286e + diff];
                    d464 = os[0x286f + diff];
                    e464 = os[0x2870 + diff];
                    f464 = os[0x2871 + diff];
                }
            } catch (Exception e) {
            }
        }
        ramdisk = Settings.get(Settings.RAMDISK, "null");
        if (!ramdisk.equals("null")) {
            System.out.println("Opening ramdisk image " + ramdisk);
            readRamDisk(ramdisk);
        }

        if (Switches.ROM.equals("CPC464") || Switches.ROM.equals("CPC664")) {
            memory.setMultiROM(getRom("file/mf86.rom", 8192));
        } else {
            memory.setMultiROM(getRom("file/mf0e.rom", 8192));
        }

        gateArray.setMemory(memory.getMemory());
        reset();
    }

    public void writeRamDisk(String name) {
        if (!Settings.getBoolean(Settings.HASRAMDISK, false)) {
            return;
        }
        stop();
        byte[] data = new byte[0x04000 * rdiskbanks.length];
        int bank = memory.getRAMBank();
        int pos = 0;
        for (int i = 0; i < rdiskbanks.length; i++) {
            z80.stop();
            memory.setRAMBank(rdiskbanks[i]);
            for (int t = 0; t < 0x04000; t++) {
                data[pos++] = (byte) memory.readWriteByte(0x04000 + t);
            }
        }
        memory.setRAMBank(bank);
        Settings.set(Settings.RAMDISK, name);
        ramdisk = name;
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(name)));
            bos.write(data);
            bos.close();
        } catch (Exception e) {
        }
        start();
        reSync();
    }

    public void readRamDisk(String name) {
        if (!Settings.getBoolean(Settings.HASRAMDISK, false)) {
            return;
        }
        stop();
        byte[] data = new byte[0x04000 * rdiskbanks.length];
        try {
            BufferedInputStream bos = new BufferedInputStream(new FileInputStream(new File(name)));
            bos.read(data);
            bos.close();
            int bank = memory.getRAMBank();
            int pos = 0;
            for (int i = 0; i < rdiskbanks.length; i++) {
                memory.setRAMBank(rdiskbanks[i]);
                for (int t = 0; t < 0x04000; t++) {
                    memory.writeByte(0x04000 + t, data[pos++]);
                }
            }
            memory.setRAMBank(bank);
            Settings.set(Settings.RAMDISK, name);
            ramdisk = name;
        } catch (Exception e) {
        }
        start();
        reSync();
    }

    public void removeRamDiskImage() {
        Settings.set(Settings.RAMDISK, "null");
        ramdisk = null;
    }
    public static boolean replay = false;
    public static boolean mfisconnected = Settings.getBoolean(Settings.MULTIFACE, false);

    public void connectMF(boolean connect) {
        mfisconnected = connect;
        Settings.setBoolean(Settings.MULTIFACE, connect);
    }

    public void rePlay() {
        audioAdd = psg.getSoundPlayer().getClockAdder(AUDIO_TEST,
                CYCLES_PER_SECOND_CPC);
        psg.getSoundPlayer().play();
//        sampler.getSoundPlayer().play();
        psg1.getSoundPlayer1().play();
        psg2.getSoundPlayer2().play();
        psg.resetRegisters();
        psg1.resetRegisters();
        psg2.resetRegisters();
    }
    public int plotlogo = 0;
    boolean loadedplus = false;

    public CPRLoader getLoader() {
        return CPRloader;
    }

    public void saveRamDisk() {
        if (!Settings.getBoolean(Settings.HASRAMDISK, false)) {
            return;
        }
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Store ramdisk file", FileDialog.SAVE);
        filedia.setFile("*.ramdisk");
        filedia.setVisible(true);
        String filename = filedia.getFile();
        if (filedia.getFile() != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            if (!filename.toLowerCase().endsWith(".ramdisk")) {
                filename += ".ramdisk";
            }
            this.writeRamDisk(filename);
        }
    }

    public void loadRamDisk() {
        if (!Settings.getBoolean(Settings.HASRAMDISK, false)) {
            return;
        }
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Import ramdisk file", FileDialog.LOAD);
        filedia.setFile("*.ramdisk");
        filedia.setVisible(true);
        String filename = filedia.getFile();
        if (filedia.getFile() != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            this.readRamDisk(filename);
        }
    }

    public void openCartridge() {
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Open CPC+ Cartridge file", FileDialog.LOAD);
        filedia.setFile("*.cpr");
        filedia.setVisible(true);
        String filename = filedia.getFile();
        if (filedia.getFile() != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            openCartridge(filename);
        }
    }

    public void openCartridge(String filename) {
        Settings.set(Settings.CARTRIDGE, filename);
        CPRloader.openCPR(filename);
        loadedplus = true;
        for (int i = 0; i < 32; i++) {
            byte[] rom = CPRloader.getData(i);
            memory.setPlusROM(i, rom);
        }
        upperROMs.clear();
        gateArray.setMemory(memory.getMemory());
        reset();
    }
    int monmode;

    public static boolean inksEdited = false;

    @Override
    public void reset() {
        if (key != null) {
            key.reset();
        }
        basicchecktype = 0;
        sfclock.reset();
        psg.tapeNoise = 0;
        resetRegisters();
        keytime = 0;
        tapei = tapep = 0;
        if (memory.plus && !loadedplus) {
            String cprname = Settings.get(Settings.CARTRIDGE, "CPC_PLUS.CPR");
            if (cprname.equals("empty")) {
                CPRloader.OpenCPR();
            } else {
                openCartridge(cprname);
                return;
            }
            loadedplus = true;
            for (int i = 0; i < 32; i++) {
                byte[] rom = CPRloader.getData(i);
                memory.setPlusROM(i, rom);
            }
            upperROMs.clear();
            gateArray.setMemory(memory.getMemory());
        }
        if (!inksEdited) {
            gateArray.resetCPCColours();
        }
        if (Switches.Expansion) {
            plotlogo = 1;
        }
        System.out.println("Reset!");
        memory.reset();
        disableresync = false;
        if (crtc.CRTCType == 0) {
            crtc.setRegisterStatusMask(0x0300, 0x0000);
        } else {
            crtc.setRegisterStatusMask(0x0300, 0x0200);
        }
        ssa1.reset();
        // initpaint = 0;
        doLoad = 0;
        portB = 0;
        if (!recordKeys) {
            playKeys = false;
            keyNumber = 0;
            recordKeys = false;
        }

        YMControl.displaycount1 = 0;
        YMControl.displaycount2 = 0;
        YMControl.DisplayStart = 0;
        // number = 0;
        // doLoad = 0;
        psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
        psg.resetRegisters();
        psg1.resetRegisters();
        psg2.resetRegisters();
        st_mode = false;
        zx_mode = false;
        if (YM_Play) {
            YM_Play = false;
            YM_Stop = true;
            System.out.println("Playback stopped...");
        }

        turbo = false;
        Switches.turbo = 1;
        JEMU.turbo.setState(false);
        jemu.ui.Desktop.jCheckBox8.setSelected(false);
        try {
            keyboarda.keyReleased(eventArray[readkey]);
        } catch (Exception e) {
        }
        Switches.blockKeyboard = false;
        autotyper = 0;
        Hold();
        super.reset();
        fdc.reset();
        reSync();
        z80.reset();
        gateArray.init();
        goOn();
        for (int i = 0; i < 32; i++) {
            setPalette(i, jemu.settings.Palette.getRGB(i));
        }
        jemu.ui.Desktop.updatePalette(false);
    }

    public void setInks() {
        for (int i = 0; i < 15; i++) {
            gateArray.setInk(i, Util.random(30));
        }
    }

    public void setInk(int pen, int ink) {
        gateArray.setInk(pen, ink);
    }

    public void ejectAll() {
        int f = getCurrentDrive();
        for (int i = 0; i < 4; i++) {
            setCurrentDrive(i);
            eject();
        }
        setCurrentDrive(f);
    }

    @Override
    public void eject() {
        int drive = getCurrentDrive();
        if (drive == 0) {
            checkDF0();
            dskImageA = null;
            df0mod = false;
            this.unloadMagicCPCDisk(0);
        }
        if (drive == 1) {
            checkDF1();
            dskImageB = null;
            df1mod = false;
            this.unloadMagicCPCDisk(1);
        }
        if (drive == 2) {
            checkDF2();
            dskImageC = null;
            df2mod = false;
        }
        if (drive == 3) {
            checkDF3();
            dskImageD = null;
            df3mod = false;
        }
        if (Switches.FloppySound && Switches.audioenabler == 1) {
            Samples.EJECT.play();
        }
        {
            fdc.setDrive(getCurrentDrive(), null);
            disableSave[drive] = false;
            if (getCurrentDrive() == 0) {
                Switches.loaddrivea = "Drive is empty.";
            }
            if (getCurrentDrive() == 1) {
                Switches.loaddriveb = "Drive is empty.";
            }
            if (getCurrentDrive() == 2) {
                Switches.loaddrivec = "Drive is empty.";
            }
            if (getCurrentDrive() == 3) {
                Switches.loaddrived = "Drive is empty.";
            }
        }
    }

    @Override
    public void dispose() {
        super.dispose();
        psg.resetRegisters();
        psg1.resetRegisters();
        psg2.resetRegisters();
        psg.getSoundPlayer().dispose();
//        sampler.getSoundPlayer().dispose();
        psg1.getSoundPlayer1().dispose();
        psg2.getSoundPlayer2().dispose();
    }
    int turbop, turbob;
    int black = 0, freq = 100;
    int lcount = 0;
    int keytime = 0;
    int register = 0;
    boolean cycle;
    int waitlopos = 0;
    public int slomo = 1;
    int baswaitcycle;

    int speed = 0;

    boolean floppymotorold;
    boolean bufferturbo;

    int clock;

    int movieDelay;

//    int cycleInk;
    @Override
    public void cycle() {
//        if (GateArray.screenmemory != null)
//        {
//             setInk(0, cycleInk++);
//        }
////        INK(0,cycleInk++);
//        cycleInk %= 26;
        if (playmovie && initmovie) {
            movieDelay++;
            if (movieDelay > (int) (((double) 19968 / (double) movieFPS) * 50.8)) {
                movieDelay = 0;
                playMovie();
            }
        }
        if (launchcount > 0) {
            int k = (int) (Math.random() * 31);
            setInk(16, k);
            if (plotlogo == 0) {
                plotlogo = 1;
            }
        }
        if (floppymotorold != floppymotor) {
            floppymotorold = floppymotor;
            if (floppymotor && isZ80Turbo()) {
                bufferturbo = true;
                setZ80Turbo(false);
            }
            if (!floppymotor && bufferturbo) {
                bufferturbo = false;
                setZ80Turbo(true);
            }
        }
        if (speed != z84c30.getClockSpeed()) {
            speed = z84c30.getClockSpeed();
            System.out.println("DUAL.YM clock changed to:" + speed);

            psg1.changeClockSpeed(speed * 2);
            psg2.changeClockSpeed(speed * 2);
        }
        if (playSNP || StoreSNP) {
            register = (crtc.getRegisterValue(0) + 1) * (crtc.getRegisterValue(4) + 1)
                    * (crtc.getRegisterValue(9) + 1);
            keytime++;
            gateArray.cycle();
            fdc.cycle();
            if (ssa1.doCycle) {
                ssa1.cycle();
            }
            if (dktronics.doCycle) {
                dktronics.cycle();
            }
            if ((audioCount += audioAdd / Switches.turbo) >= AUDIO_TEST) {
                if (isPlayCity) {
                    psg1.writeAudio();
                    psg2.writeAudio();
                }
                psg.writeAudio();
//                sampler.writeAudio();
                audioCount -= AUDIO_TEST;
            }
            if (keytime >= register) {
                keytime = 0;
                UpdateSNP(false);
            }
            return;
        }
        if (bas != null) {
            if (bas.auto.isSelected() && !bas.track.isSelected()) {
                baswaitcycle++;
                if (baswaitcycle > 1000) {
                    baswaitcycle = 0;
                    if (bas.processNextLine()) {
                        bas.cycle();
                    }
                }
                baswait++;
                if (baswait > 2500) {
                    baswait = 0;
                    if (bas.processNextLine()) {
                        bas.update();
                    }
                }
            }
            if (bas.track.isSelected()) {
                baswaitcycle++;
                if (baswaitcycle > 1000) {
                    baswaitcycle = 0;
                    bas.cycle();
                }
                baswait++;
                if (baswait > 2500) {
                    baswait = 0;
                    if (bas.processNextLine()) {
                        bas.update();
                        if (bas.step) {
                            bas.stopstate = true;
                        }
                    }
                }
            }
        }
        if (Switches.Expansion && z80.getPC() == 1) {
//            System.out.println("plotting logo");
            plotlogo = 1;
        }
        if (lopos != 5000) {
            plotLogo(lopos);
            lopos += 3;
            if (lopos >= Logo.logo.length) {
                lopos = 5000;
            }
        }
        if (call && z80.getIFF1() == 0 && z80.getIFF2() == 0) {
            CALL(0xfff8);
            call = false;
        }
        if (tapeRelay && Switches.turbo != 1) {
            turbob++;
            if (turbob > (Switches.turbo * 2)) {
                gateArray.cycle();
                turbob = 0;
            }
        } else //            gateArray.cycle();
        //                gateArray.cycle();
        {
            if (crtc.Scratchdemo && gateArray.getScreenMode() == 1) {
                if (cycle) {
                    gateArray.cycle();
                    gateArray.cycle();
                }
                cycle = !cycle;
            } else {
                gateArray.cycle();
            }
        }
        if (z80.getPC() < 3) {
            playmovie = false;
            this.stopTapeMotor();
            playMP3 = false;
        }
        if (reloadsnp) {
            SNP_Load(snpname, snpbyte, false);
        }

        if (snap) {
            return;
        }
        if (freq != Switches.frequency) {
            if (!started) {
                started = true;
            } else {
                black = 1;
            }
            freq = Switches.frequency;
        }
        if (black != 0) {
            black++;
            for (int i = 0; i < 17; i++) {
                setInk(i, 20);
            }
            if (black == 50000 || black == 70000) {
                softReset();
                softReset();
            }
            if (black == 200000) {
                black = 0;
            }
        }
        if (resetcpc) {
            black = 1;
            resetcpc = false;
        }
        // if (trueaudio && play && playing && doLoad >= 2000000)
        //    gateArray.setScreenMode(0);
        if (Switches.breakinsts && z80.getPC() != 0 && (PEEK(z80.getPC()) == 0xED && PEEK(z80.getPC() + 1) == 0xFF)) {
            int address = z80.getPC();
            jemu.ui.JEMU.debugthis.setSelected(true);
            Samples.BREAKI.play();
            stop();
            jemu.ui.Debugger.setDisass(address);
            jemu.ui.Debugger.setEditor(address);
        }

        if (Switches.overrideP && z80.getPC() == 0xBC7B
                && (PEEK(0xBC7A) == 0xCF || PEEK(0xBC7A) == 0xDF)) {
            if (Switches.ROM.equals("CPC6128") || Switches.ROM.equals("CPC664")) {
                POKE(0xAE2C, 0);
            } else {
                POKE(0xAE45, 0);
            }
        }

        if (shouldquit) {
            goOn();
        }

        if ((tapeRelay && (tapePlay || tapeRec))) {
            tapeCycle();
        }

        if (FDCReset) {
            fdc.resetb();
            FDCReset = false;
        }

        fdc.cycle();
        if ((audioCount += ((audioAdd / Switches.turbo) * slomo)) >= AUDIO_TEST) {
            if (isPlayCity) {
                psg1.writeAudio();
                psg2.writeAudio();
            }
            psg.writeAudio();
//            sampler.writeAudio();
            audioCount -= AUDIO_TEST;
        }
//      audioAdd = psg.getSoundPlayer().getClockAdder(AUDIO_TEST, CYCLES_PER_SECOND_CPC);
        if (ssa1.doCycle) {
            ssa1.cycle();
        }
        if (dktronics.doCycle) {
            dktronics.cycle();
        }
        if (launch != 90000) {
            runBinary(launch);
            launch = 90000;
        }

    }

    public byte[] loadInternal(String name, int start, int length, int exec, int bank) {
        byte[] data = getRom(name, length);
        int g = memory.getRAMBank();
        if (bank != 0) {
            memory.setRAMBank(bank);
        }
        for (int i = 0; i < data.length; i++) {
            memory.writeByte(start + i, data[i] & 0x0ff);
        }
        memory.setRAMBank(g);
        if (exec != 0) {
            this.runBinary(exec);
        }
        return data;
    }

    public void runDeathSword() {
        loadInternal("B1.BIN", 0x4000, 0x4000, 0, 0xc4);
        loadInternal("B2.BIN", 0x4000, 0x4000, 0, 0xc5);
        loadInternal("B3.BIN", 0x4000, 0x4000, 0, 0xc6);
        loadInternal("B4.BIN", 0x4000, 0x4000, 0, 0xc7);
        loadInternal("BARIAN.BIN", 0x1744, 0x8f57, 0x1744, 0);
    }

    @Override
    public void setDisplay(Display value) {
        super.setDisplay(value);
        gateArray.setDisplay(value);
    }

    public Color[] getPalette() {
        Color[] cols = new Color[17];
        for (int i = 0; i < 17; i++) {
            cols[i] = getCol(i);
        }
        return cols;
    }

    @Override
    public void setFrameSkip(int value) {
        super.setFrameSkip(value);
        gateArray.setRendering(value == 0);
    }

    public void checkDF0() {
//        this.storeMagicAsDSK();
        if (Switches.checksave && !disableSave[0]) {
            if (df0mod) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF0 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.YES_OPTION) {
                    AutoSave(0);
                }
            }
            df0mod = false;
        }
    }

    public void checkDF1() {
//        this.storeMagicAsDSK();
        if (Switches.checksave && !disableSave[1]) {
            if (df1mod) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF1 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.YES_OPTION) {
                    AutoSave(1);
                }
            }
            df1mod = false;
        }
    }

    public void checkDF2() {
//        this.storeMagicAsDSK();
        if (Switches.checksave && !disableSave[2]) {
            if (df2mod) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF2 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.YES_OPTION) {
                    AutoSave(2);
                }
            }
            df2mod = false;
        }
    }

    public void checkDF3() {
//        this.storeMagicAsDSK();
        if (Switches.checksave && !disableSave[3]) {
            if (df3mod) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF3 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.YES_OPTION) {
                    AutoSave(3);
                }
            }
            df3mod = false;
        }
    }

    public void checkSave() {
//        this.storeMagicAsDSK();
        if (Switches.checksave) {
            if (df0mod && !disableSave[0]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF0 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df0mod = false;
                }
            }
            if (df1mod && !disableSave[1]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF1 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df1mod = false;
                }
            }
            if (df2mod && !disableSave[2]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF2 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df2mod = false;
                }
            }
            if (df3mod && !disableSave[3]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF3 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df3mod = false;
                }
            }
        } else {
            df0mod = df1mod = df2mod = df3mod = false;
        }
        saveOn = 1;
    }

    public void checkSaveOnExit() {
//        this.storeMagicAsDSK();
        shouldquit = true;
        if (Switches.checksave) {
            if (df0mod && !disableSave[0]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF0 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df0mod = false;
                }
            }
            if (df1mod && !disableSave[1]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF1 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df1mod = false;
                }
            }
            if (df2mod && !disableSave[2]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF2 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df2mod = false;
                }
            }
            if (df3mod && !disableSave[3]) {
                int ok = JOptionPane.showConfirmDialog(new Frame(),
                        "Your DSK in drive DF3 has been modified.\n"
                        + "Do you want to save it now?",
                        "Please choose", JOptionPane.YES_NO_OPTION);
                if (ok == JOptionPane.NO_OPTION) {
                    df3mod = false;
                }
            }
        } else {
            df0mod = df1mod = df2mod = df3mod = false;
        }
        saveOnExit = 1;
    }

    public void startTapeMotor() {
        trueaudio = true;
        if (!tapeRelay) {
            z80.out(0x0F600, 0x10);
        }
    }

    public void stopTapeMotor() {
        if (tapeRelay) {
            z80.out(0x0F600, 0x00);
        }
    }

    public void TapeSound(int value) {
        value &= 0x0ff;
        if ((z80.getPC() > 0x02600 && z80.getPC() < 0x03000) && !savecheck) {
            if (tapesample == null || tapesample.length < 500) {
                TapeDrive.pressRec(true);
                if (!TapeDrive.isVisible()) {
                    TapeDrive.setVisible(true);
                    final Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
                    TapeDrive.setLocation((d.width - TapeDrive.getSize().width) / 2, (d.height - TapeDrive.getSize().height) / 2);
                    tapedeck = true;
                    this.reSync();
                }
            }
            if (tapeRec) {
                System.out.println("Tape is saving...");
            }
            if (tapePlay && !tapeRec) {
                System.out.println("Tape is loading...");
            }
            savecheck = true;
        }

        if ((value & 0x020) == 0x020) {
            psg.tapeNoise = (0xda >> 3) ^ 0x80;
//            AY_3_8910.digiblast = true;

        } else {
            psg.tapeNoise = 0;
        }
    }

    public void TapeRelayCheck(int value) {
//        if (Switches.ROM.equals("CPC464")) {
//            value &= 0x10;
//        } else {
//            value &= 0x20;
//        }
        value &= 0x10;
        previousPortValue = value;
        if ((value) == 0x10 && !tapeRelay) {
            tapeRelay = true;
            System.out.println("Tape-relay on");
            savecheck = false;
            if (Switches.FloppySound && !Bypass) {
                Samples.RELAIS.play();
                if (tapePlay) {
                    Samples.TAPEMOTOR.loop();
                }
            }
        } else if ((value & 0x10) == 0x00 && tapeRelay) {
            playing = false;
            stoptape = true;
            tapestop = 1;
        } else {
            stoptape = false;
            playing = true;
            tapestop = 0;
        }
    }

    int baud = 0;

    boolean domorse;
    boolean readmorse = false;
    int error;

    int tapetime = 2000000;

    int tapedelay = 22;
    boolean tapeturbo;

    public void tapeCycle() {
        if (tapesample == null) {
            tapeBandPosition = 0;
            return;
        }
        if (tapeturbo != isZ80Turbo()) {
            tapeturbo = isZ80Turbo();
            tape_delay = (isZ80Turbo() ? tapedelay >> 1 : tapedelay) / (frequency);
        }
        if (playMP3) {
            tapetime = 0;
        } else {
            tapetime = 2000000;
        }
        if (!TapeDrive.paused) {
            if (tapeloaded) {
                if (!tapeRec) {
                    playcount++;
                    playing = true;
                    if (doLoad < tapetime + 1) {
                        doLoad++;
                    }
                    if (doLoad >= tapetime && playcount > tape_delay) {
                        if (Switches.floppyturbo && Switches.turbo == 1) {
                            Switches.turbo = 2;
                        }
                        if (tapeBandPosition >= tapesample.length - 100) {
                            restoreScreen();
                            tapePlay = false;
                            Samples.TAPEMOTOR.stop();
                            Samples.TAPESTOP.play();
                            TapeDrive.pressStop();
                            tapeBandPosition -= 2;
                            playcount = 0;
                            return;
                        }
                        if (readmorse) {
                            baud = ((tapesample[tapeBandPosition]));
                            baud &= 0x0ff;
                            if (baud > 40) {
                                domorse = true;
                                error = 3;

                            }
                            if (error == 0) {
                                domorse = false;
                            }
                            if (error > 0) {
                                error--;
                            }
                            if (tapeRelay) {
                                if (domorse) {
                                    this.keyPressed(KeyEvent.VK_NUMPAD5);
                                } else {
                                    this.keyReleased(KeyEvent.VK_NUMPAD5);
                                }
                                this.setInk(16, domorse ? 20 : 40);
                            }
                        }
                        if (compatibility) {
                            portB = (tapesample[tapeBandPosition]);
                        } else {
                            portB = (tapesample[tapeBandPosition] & 0x80);
                        }
                        /*
                         * if (portB == 0) portB = 0x26; else portB = 0x80;
                         */
                        // avoid crackling noise when sliding 16 bit samples
                        if ((tapeBandPosition & 1) == 1 && bitrate > 8) {
                            tapeBandPosition++;
                        }
                        //

                        tapeBandPosition++;
                        if (bitrate > 8) {
                            portB = tapesample[tapeBandPosition];
                            tapeBandPosition++;
                        }
                        playcount = 0;
                        if (trueaudio) {
                            if (bitrate > 8) {
                                tapesound = portB;
                            } else {
                                tapesound = portB ^ 0x80;
                            }
                        } else {
                            tapesound = (((portB ^ 0x080) * 1) / 100) ^ 0x080;
                        }
                        if (tape_stereo) {
                            portB = tapesample[tapeBandPosition];
                            tapeBandPosition++;
                            if (bitrate > 8) {
                                portB = tapesample[tapeBandPosition];
                                tapeBandPosition++;
                            }
                            if (bitrate > 8) {
                                tapesoundb = portB;
                            } else {
                                tapesoundb = portB ^ 0x80;
                            }
                        } else {
                            tapesoundb = tapesound;
                        }

                        if (!trueaudio) {
                            tapesoundb = tapesound;
                        }
                        if (Switches.FloppySound || playmovie) {

                            if (Switches.turbo == 1) {
                                if (trueaudio) {
                                    psg.tapeNoise = ((tapesound * Switches.Blastervolume) / 100);
//                                    SampledSound.leftChannel = SampledSound.rightChannel = ((tapesound * Switches.Blastervolume) / 100);
                                }
                            } else {
                                turbocount++;
                                if (turbocount > Switches.turbo) {
                                    turbocount = 0;
                                    TapeDrive.WAVBYTE = portB;
                                    if (trueaudio) {
                                        psg.tapeNoise = ((tapesound * Switches.Blastervolume) / 100);
//                                        SampledSound.leftChannel = SampledSound.rightChannel = ((tapesound * Switches.Blastervolume) / 100);
                                    }
                                }
                            }
                        }
                        if (!trueaudio) {
                            int soundByte = (portB > 0) ? 0xda : 0x26;
                            portB = soundByte;
                            psg.tapeNoise = (((soundByte >> 2) * Switches.Blastervolume) / 100);
//                            SampledSound.leftChannel = SampledSound.rightChannel = (portB >> 3) ^ 0x80;
//                            z80.out(0xff00, (((portB) * 20) / 100));
                        }
                        if (Switches.changePolarity) {
                            portB = ~portB;
                        }
                        if (changeBorder) {
                            phase++;
                            if (phase < 10000) {
                                tapeBorder(1);
                            }
                            if (phase > 10000 && phase < 20000) {
                                tapeBorder(2);
                            }
                            if (phase > 20000 && phase < 30000) {
                                tapeBorder(3);
                            }
                            if (phase == 30000) {
                                phase = 0;
                            }
                        }
                    }
                }
            }

            if (tapeRec) {
                playcount++;
                playing = true;
                if (playcount >= tape_delay) {
                    if (Switches.floppyturbo && Switches.turbo == 1) {
                        Switches.turbo = 2;
                    }

                    tapesample[tapeBandPosition] = TapeRecbyte;
                    tapeBandPosition++;
                    if (recordcount < tapeBandPosition) {
                        recordcount = tapeBandPosition;
                    }
                    if (tapeBandPosition >= tapesample.length) {
                        tapeRec = false;
                        Samples.TAPEMOTOR.stop();
                        Samples.TAPESTOP.play();
                        TapeDrive.pressStop();
                        tapeBandPosition--;
                        playcount = 0;
                    }
                    playcount = 0;
                }
            }
        }
    }

    int oldPort;

    public void restoreScreen() {
        if (havescreen && restorescreen) {
            for (int i = 0xc000; i < 0xffff; i++) {
                POKE(i, screencontent[i - 0xc000]);
            }
            restorescreen = false;
            havescreen = false;
        }
    }
    static int CodeOv[] = {
        0x21, 0x45, 0x08, 0xCD, 0x34, 0x08, 0x3A, 0x00,
        0x08, 0xCD, 0x1C, 0xBD, 0x21, 0x01, 0x08, 0xAF,
        0x4E, 0x41, 0xF5, 0xE5, 0xCD, 0x32, 0xBC, 0xE1,
        0xF1, 0x23, 0x3C, 0xFE, 0x10, 0x20, 0xF1, 0xC9,
        0x21, 0x55, 0x08, 0x01, 0x00, 0xBC, 0x7E, 0xA7,
        0xC8, 0xED, 0x79, 0x04, 0x23, 0x7E, 0xED, 0x79,
        0x23, 0x05, 0x18, 0xF2, 0x01, 0x30, 0x02, 0x32,
        0x03, 0x89, 0x06, 0x22, 0x07, 0x23, 0x0C, 0x0D,
        0x0D, 0x00, 0x00, 0x00, 0x01, 0x28, 0x02, 0x2E,
        0x03, 0x8E, 0x06, 0x19, 0x07, 0x1E, 0x0C, 0x30,
        0x00, 0x00
//        0x21, 0x47, 0x08, 0xCD, 0x36, 0x08, 0x3A, 0x00,
//        0x08, 0xCD, 0x1C, 0xBD, 0x21, 0x01, 0x08, 0xAF,
//        0x4E, 0x41, 0xF5, 0xE5, 0xCD, 0x32, 0xBC, 0xE1,
//        0xF1, 0x23, 0x3C, 0xFE, 0x10, 0x20, 0xF1, 0xCD,
//        0x18, 0xBB, 0x21, 0x55, 0x08, 0x01, 0x00, 0xBC,
//        0x7E, 0xA7, 0xC8, 0xED, 0x79, 0x04, 0x23, 0x7E,
//        0xED, 0x79, 0x23, 0x05, 0x18, 0xF2, 0x01, 0x30,
//        0x02, 0x32, 0x06, 0x22, 0x07, 0x23, 0x0C, 0x0D,
//        0x0D, 0x00, 0x00, 0x00, 0x01, 0x28, 0x02, 0x2E,
//        0x06, 0x19, 0x07, 0x1E, 0x0C, 0x30
    };
    static int CodeOvP[] = {
        0xF3, 0x01, 0x11, 0xBC, 0x21, 0x86, 0x08, 0x04,
        0xED, 0xA3, 0x0D, 0x20, 0xFA, 0x21, 0x97, 0x08,
        0xCD, 0x75, 0x08, 0x01, 0xB8, 0x7F, 0x3A, 0x00,
        0x08, 0xED, 0x49, 0xED, 0x79, 0x21, 0x01, 0x08,
        0x11, 0x00, 0x64, 0x01, 0x20, 0x00, 0xED, 0xB0,
        0xAF, 0x01, 0x0E, 0xF4, 0xED, 0x49, 0x01, 0xC0,
        0xF6, 0xED, 0x49, 0xED, 0x79, 0x01, 0x92, 0xF7,
        0xED, 0x49, 0x01, 0x45, 0xF6, 0xED, 0x49, 0x06,
        0xF4, 0xED, 0x78, 0x01, 0x82, 0xF7, 0xED, 0x49,
        0x17, 0x38, 0xDD, 0x01, 0xA0, 0x7F, 0xED, 0x49,
        0xFB, 0x21, 0xA5, 0x08, 0x01, 0xBC, 0x00, 0x7E,
        0xA7, 0xC8, 0xED, 0x79, 0x04, 0x23, 0x7E, 0xED,
        0x79, 0x23, 0x05, 0x18, 0xF2, 0xFF, 0x00, 0xFF,
        0x77, 0xB3, 0x51, 0xA8, 0xD4, 0x62, 0x39, 0x9C,
        0x46, 0x2B, 0x15, 0x8A, 0xCD, 0xEE, 0x01, 0x30,
        0x02, 0x32, 0x06, 0x22, 0x07, 0x23, 0x0C, 0x0D,
        0x0D, 0x00, 0x00, 0x00, 0x01, 0x28, 0x02, 0x2E,
        0x06, 0x19, 0x07, 0x1E, 0x0C, 0x30
    };

    public void plotLogo(int pos) {
        try {
            PLOT(Logo.logo[pos], 199 - (Logo.logo[pos + 1] / 2), Logo.logo[pos + 2], 1, false);
        } catch (Exception e) {
        }
    }

    public static void PLOT(int x, int y, int pen, int mode, boolean overscan) {
        int scraddr = 0;
        int soffset = 0;
        if (overscan) {
            overcount = 1;
            int charX;
            int byteX;
            switch (mode) {
                case 0:
                    charX = x / (2 * 2);
                    byteX = (x & 0x03) / 2;
                    break;
                case 1:
                    charX = x / (4 * 2);
                    byteX = (x & 0x07) / 4;
                    break;
                default:
                    charX = x / (8 * 2);
                    byteX = (x & 0x0f) / 8;
                    break;
            }
            int char_offset = ((y / 8) * 48) + charX + 0x100;
            if (char_offset >= 1024) {
                soffset = 0x04000;
                char_offset &= 1023;
            }
            scraddr += ((char_offset * 2) + byteX) + (y & 7) * 0x0800;
            scraddr += soffset;
        } else {
            int scrline = (y / 8) * 80 + ((y & 0x07) * 0x0800);
            scrline += 0xc000;
            // mode 1
            int xbyteoffs = (x / 4);
            // mode 0
            if (mode == 0) {
                xbyteoffs = (x / 2);
            }
            if (mode == 2) {
                xbyteoffs = (x / 8);
            }
            scraddr = scrline + xbyteoffs;
        }
        int data = GateArray.screenmemory[(scraddr)];
        // mode 1
        int pixel = x & 0x03;
        // mode 0
        if (mode == 0) {
            pixel = x & 0x01;
        }
        if (mode == 2) {
            pixel = x & 0x07;
        }
        if (mode == 2) {
            data &= ~(1 << (7 - pixel));
            if (pen != 0) {
                data = data | (1 << (7 - pixel));
            }
        }
        if (mode == 1) {
            switch (pixel) {
                case 0: {
                    data &= ~0x088;
                    switch (pen) {
                        case 1:
                            data = data | 0x80;
                            break;
                        case 2:
                            data = data | 0x08;
                            break;
                        case 3:
                            data = data | 0x88;
                            break;
                        default:
                            break;
                    }
                }
                break;
                case 1: {
                    data &= ~0x044;
                    switch (pen) {
                        case 1:
                            data = data | 0x40;
                            break;
                        case 2:
                            data = data | 0x04;
                            break;
                        case 3:
                            data = data | 0x44;
                            break;
                        default:
                            break;
                    }
                }
                break;
                case 2: {
                    data &= ~0x022;
                    switch (pen) {
                        case 1:
                            data = data | 0x20;
                            break;
                        case 2:
                            data = data | 0x02;
                            break;
                        case 3:
                            data = data | 0x22;
                            break;
                        default:
                            break;
                    }
                }
                break;
                case 3: {
                    data &= ~0x011;
                    switch (pen) {
                        case 1:
                            data = data | 0x10;
                            break;
                        case 2:
                            data = data | 0x01;
                            break;
                        case 3:
                            data = data | 0x011;
                            break;
                        default:
                            break;
                    }
                }
                break;
            }
        }
        if (mode == 0) {
            switch (pixel) {
                case 0: {
                    data &= ~0x0aa;
                    data = data | pixelsA[pen];
                }
                break;
                case 1: {
                    data &= ~0x055;
                    data = data | pixelsB[pen];
                }
                break;
            }
        }
        GateArray.screenmemory[scraddr] = (byte) data;
    }
    protected static int[] pixelsA = {0x00,
        0x80, 0x08, 0x88, 0x20, 0xA0,
        0x28, 0xA8, 0x02, 0x82, 0x0A,
        0x8A, 0x22, 0xA2, 0x2A, 0xAA
    };
    protected static int[] pixelsB = {0x0,
        0x40, 0x04, 0x44, 0x10, 0x50,
        0x14, 0x54, 0x01, 0x41, 0x05,
        0x45, 0x11, 0x51, 0x15, 0x55
    };

    public static void PLOT(boolean linear, int x, int pen, int mode, int scraddr) {
        int data = GateArray.screenmemory[(scraddr)];
        // mode 1

        int pixel = x & 0x03;
        // mode 0

        if (mode == 0) {
            pixel = x & 0x01;

        }
        if (mode == 2) {
            pixel = x & 0x07;

        }
        if (mode == 2) {
            data &= ~(1 << (7 - pixel));

            if (pen != 0) {
                data = data | (1 << (7 - pixel));

            }
        }

        if (!linear) {
            if (mode == 1) {
                switch (pixel) {
                    case 0: {
                        data &= ~0x088;

                        if (pen == 1) {
                            data = data | 0x80;

                        } else if (pen == 2) {
                            data = data | 0x08;

                        } else if (pen == 3) {
                            data = data | 0x88;

                        }
                    }
                    break;

                    case 1: {
                        data &= ~0x044;

                        if (pen == 1) {
                            data = data | 0x40;

                        } else if (pen == 2) {
                            data = data | 0x04;

                        } else if (pen == 3) {
                            data = data | 0x44;

                        }
                    }
                    break;

                    case 2: {
                        data &= ~0x022;

                        if (pen == 1) {
                            data = data | 0x20;

                        } else if (pen == 2) {
                            data = data | 0x02;

                        } else if (pen == 3) {
                            data = data | 0x22;

                        }
                    }
                    break;

                    case 3: {
                        data &= ~0x011;

                        if (pen == 1) {
                            data = data | 0x10;

                        } else if (pen == 2) {
                            data = data | 0x01;

                        } else if (pen == 3) {
                            data = data | 0x011;

                        }
                    }
                    break;

                }
            }
            if (mode == 0) {
                switch (pixel) {
                    case 0: {
                        data &= ~0x0aa;
                        data = data | pixelsA[pen];

                    }
                    break;

                    case 1: {
                        data &= ~0x055;
                        data = data | pixelsB[pen];

                    }
                    break;

                }
            }
        } else {
            if (mode == 1) {
                switch (pixel) {
                    case 0: {
                        data &= ~0x0c0;

                        if (pen == 2) {
                            data = data | 0x80;

                        } else if (pen == 1) {
                            data = data | 0x40;

                        } else if (pen == 3) {
                            data = data | 0xc0;

                        }
                    }
                    break;

                    case 1: {
                        data &= ~0x030;

                        if (pen == 2) {
                            data = data | 0x20;

                        } else if (pen == 1) {
                            data = data | 0x10;

                        } else if (pen == 3) {
                            data = data | 0x30;

                        }
                    }
                    break;

                    case 2: {
                        data &= ~0x00c;

                        if (pen == 2) {
                            data = data | 0x08;

                        } else if (pen == 1) {
                            data = data | 0x04;

                        } else if (pen == 3) {
                            data = data | 0x0c;

                        }
                    }
                    break;

                    case 3: {
                        data &= ~0x003;

                        if (pen == 2) {
                            data = data | 0x02;

                        } else if (pen == 1) {
                            data = data | 0x01;

                        } else if (pen == 3) {
                            data = data | 0x03;

                        }
                    }
                    break;

                }
            }
            if (mode == 0) {
                switch (pixel) {
                    case 0: {
                        data &= ~0x0f0;
                        data = data | pen * 0x10;

                    }
                    break;

                    case 1: {
                        data &= ~0x00f;
                        data = data | pen;

                    }
                    break;

                }
            }
        }
        GateArray.screenmemory[scraddr] = (byte) data;
    }

    public void restorePaintDSK() {
        try {
            byte[] paintdisk = getRom("file/JavaCPC_Paint.dsk", 194816);
            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("JavaCPC_Paint.dsk"));
            bos.write(paintdisk);
            bos.close();

        } catch (IOException er) {
        }
    }

    public void tapeBorder(int phase) {
        int tape_AudioByte = this.tapesound ^= 0x80;
        if (!trueaudio) {
            int ink = tape_AudioByte == 0 ? 4 : 31;
            switch (phase) {
                case 2:
                    ink = tape_AudioByte == 0 ? 28 : 14;
                    break;
                case 3:
                    ink = tape_AudioByte == 0 ? 22 : 25;
                    break;
            }
            setInk(16, ink);
            return;
        }

        switch (phase) {
            case 1: {
                if (tape_AudioByte > 0x020 && tape_AudioByte <= 0x090) {
                    setInk(16, 4);
                }
                if (tape_AudioByte > 0x090 && tape_AudioByte <= 0x0a0) {
                    setInk(16, 21);
                }
                if (tape_AudioByte > 0x0a0 && tape_AudioByte <= 0x0b0) {
                    setInk(16, 31);
                }
                if (tape_AudioByte > 0x0b0) {
                    setInk(16, 11);
                }
                if (tape_AudioByte <= 0x020) {
                    setInk(16, 20);
                }
            }
            break;
            case 2: {
                if (tape_AudioByte > 0x020 && tape_AudioByte <= 0x090) {
                    setInk(16, 28);
                }
                if (tape_AudioByte > 0x090 && tape_AudioByte <= 0x0a0) {
                    setInk(16, 12);
                }
                if (tape_AudioByte > 0x0a0 && tape_AudioByte <= 0x0b0) {
                    setInk(16, 14);
                }
                if (tape_AudioByte > 0x0b0) {
                    setInk(16, 3);
                }
                if (tape_AudioByte <= 0x020) {
                    setInk(16, 20);
                }
            }
            break;
            case 3: {
                if (tape_AudioByte > 0x020 && tape_AudioByte <= 0x090) {
                    setInk(16, 22);
                }
                if (tape_AudioByte > 0x090 && tape_AudioByte <= 0x0a0) {
                    setInk(16, 18);
                }
                if (tape_AudioByte > 0x0a0 && tape_AudioByte <= 0x0b0) {
                    setInk(16, 25);
                }
                if (tape_AudioByte > 0x0b0) {
                    setInk(16, 27);
                }
                if (tape_AudioByte <= 0x020) {
                    setInk(16, 20);
                }
            }
        }
    }

    public void TapeCheck() {
        if (tapeloaded) {
            if (tapeRewind) {
                if (TapeDeck.isMem && TapeDeck.memCount == TapeDeck.counter) {
                    System.out.println("Tape REW stopped");
                    TapeDrive.pressStop();
                    tapePlay = false;
                    tapeRewind = false;

                }
                int speed = 200;

                if (tapeBandPosition >= 100000) {
                    speed = 30000;

                } else if (tapeBandPosition >= 50000) {
                    speed = 15000;

                } else if (tapeBandPosition >= 25000) {
                    speed = 7500;

                } else if (tapeBandPosition >= 6000) {
                    speed = 3250;

                }
                tapeBandPosition -= speed;

                if (tapeBandPosition <= 800) {
                    tapeBandPosition = 0;
                    tapePlay = false;
                    tapeRewind = false;
                    TapeDrive.pressStop();

                }
            }
            if (tapeFastForward) {
                if (TapeDeck.isMem && TapeDeck.memCount == TapeDeck.counter) {
                    System.out.println("Tape FF stopped");
                    TapeDrive.pressStop();
                    tapePlay = false;
                    tapeFastForward = false;

                }
                int speed = 200;

                if (tapeBandPosition <= (tapesample.length - 100000)) {
                    speed = 30000;

                } else if (tapeBandPosition <= (tapesample.length - 50000)) {
                    speed = 15000;

                } else if (tapeBandPosition <= (tapesample.length - 25000)) {
                    speed = 7500;

                } else if (tapeBandPosition <= (tapesample.length - 6000)) {
                    speed = 3250;

                }
                tapeBandPosition += speed;

                if (tapeBandPosition > (tapesample.length - 300)) {
                    tapeBandPosition = tapesample.length - 4;
                    TapeDrive.rebuildBlocks(tapeBandPosition + 1000000);
                    tapePlay = false;
                    tapeRewind = false;
                    TapeDrive.pressStop();

                }
            }
        }
        try {
            TapeDeck.counter = tapeBandPosition / ((2045000) / (byte) tape_delay);
        } catch (Exception e) {
        }

        if (TapeDeck.counter <= 9999) {
            TapeDeck.before = "";

        }
        if (TapeDeck.counter <= 999) {
            TapeDeck.before = "0";

        }
        if (TapeDeck.counter <= 99) {
            TapeDeck.before = "00";

        }
        if (TapeDeck.counter <= 9) {
            TapeDeck.before = "000";

        }
        TapeDeck.TapeCounter.setText(TapeDeck.before + TapeDeck.counter);
        //   TapeDeck.positionslider.setValue(number);

    }

    public void StopTape() {
        tapeRelay = false;
        playing = false;
        stoptape = false;
        doLoad = 0;
        if (Switches.floppyturbo) {
            Switches.turbo = 1;
        }
        System.out.println("Tape-relay off");
        trueaudio = false;
        psg.tapeNoise = 0;
        TapeDrive.showText(TapeDrive.filename);
        if (Switches.FloppySound && !Bypass) {
            Samples.RELAISOFF.play();
            Samples.TAPEMOTOR.stop();
        }
    }

    public static void Download(String download) {
        System.out.println("Downloading " + download + "...");
        String ending = download.substring((download.length() - 4), download.length());
        System.out.println("Downloading to buffer" + ending);
        String savename = "buffer" + ending;
        downloadname = download;
        Switches.booter = 1;
        downstring = savename;
        DoDownload = 1;

    }

    public void Download() {
        String[] arg = {downloadname, downstring};
        jemu.ui.copyURL.download(arg, true);
        //    download = true;

    }

    public static int PEEK(int address) {
        return memory.readWriteByte(address);

    }

    public void reSync() {
        psg.getSoundPlayer().resync();
//        sampler.getSoundPlayer().resync();

    }

    protected void performanceCheck() {
        recountFPS++;

        if (recountFPS > 500 && checkFPS != 44) {
            System.out.println("Good performance. Checkroutine new initialized.");
            errCount = 0;
            checkFPS = 44;

        }
        if (recountFPS > 500) {
            recountFPS = 501;

        }

        countFPS++;

        if (countFPS > 120) {
            countFPS = 0;

        }
        if (Display.mCurrFPS < checkFPS && countFPS > 100) {
            recountFPS = 0;
            checkFPS--;

            if (checkFPS < 1) {
                System.err.println("Performance is too low. Good bye...");
                System.exit(0);

            }
            if (!Display.lowperformance) {
                errCount++;

                if (errCount > 4) {
                    Display.lowperformance = true;
                    System.out.println("Turning off extra display features." + checkFPS);
                    errCount = 3;

                }
            }
            System.out.println("Running out of performance! ReSync! CheckFPS set to:" + checkFPS);
            reSync();
            countFPS = 0;

        }
    }
    int checktape;
    boolean updateled = false;
    static int overcount;
    protected int loadover, loadnormal;

    public void putFlipA() {
        normalPaintBox.putFlipA();

    }

    public void putFlipB() {
        normalPaintBox.putFlipB();

    }

    public void getFlipA() {
        normalPaintBox.getFlipA();

    }

    public void getFlipB() {
        normalPaintBox.getFlipB();

    }
    protected boolean evenimage = false;
    protected boolean storeflipA = false;
    protected boolean storeflipB = false;

    public void previewFlip() {
        if (evenimage) {
            getFlipB();

        } else {
            getFlipA();

        }
        evenimage = !evenimage;

    }
    public static boolean showflippreview = false;
    public static boolean playmovie = false;
    int stopper = 0;
    public static boolean useGun = false;
    public int checkgun = 0;
    public int guncolour = 0;
    public int gunX, gunY;
    public int releasegun = 0;

    public void lightShot(int x, int y) {
        if (checkgun != 0 && releasegun != 0) {
            return;

        }
        MouseFire1();
        guncolour = display.lightGun(x, y);
        checkgun = 1;
        gunX = x;
        gunY = y;

    }

    public void lightGun() {
        if (checkgun != 0) {
            checkgun++;

            int checkg = display.lightGun(gunX, gunY);

            if (guncolour != checkg && checkg != 0) {
                checkgun = 0;
                lightgunShot();
                releasegun = 1;

            }
            if (checkgun > 8) {
                checkgun = 0;
                MouseReleaseFire1();

            }
        }
        if (releasegun != 0) {
            releasegun++;

            if (releasegun == 3) {
                releasegun = 0;
                lightgunRelease();

            }
        }
    }
    public static int speedcontrol = 3;

    public void resetRegisters() {
        crtc.setRegister(0, 0x3f);
        crtc.setRegister(1, 0x28);
        crtc.setRegister(2, 0x2e);
        crtc.setRegister(3, 0x8e);
        crtc.setRegister(4, 0x26);
        crtc.setRegister(5, 0x00);
        crtc.setRegister(6, 0x19);
        crtc.setRegister(7, 0x1e);
        crtc.setRegister(8, 0x00);
        crtc.setRegister(9, 0x07);
        crtc.setRegister(10, 0x00);
        crtc.setRegister(11, 0x00);
    }
    int bk = 0;
    int lopos = 5000;
    boolean skip = false;
    String[] basictypetext;
    int basictypelength = -1;
    int basicchecktype = 0;
    int basictypepos = 0;
    protected int BUFFER_START = 0xac8a;
    protected int BUFFER_START_464 = 0xaca4;
    boolean rom464 = false;
    boolean jumpline;

    public void BasicAutoType(String input) {
        BasicAutoType(input, false);
    }

    public void BasicAutoType(String input, boolean linejump) {
        while (input.endsWith("\n")) {
            input = input.substring(0, input.length() - 1);
        }
        while (input.endsWith("\r")) {
            input = input.substring(0, input.length() - 1);
        }
        while (input.endsWith("\n")) {
            input = input.substring(0, input.length() - 1);
        }
        while (input.endsWith("\r")) {
            input = input.substring(0, input.length() - 1);
        }
        jumpline = linejump;
        input = input.replace("" + (char) 0x0d, "");
        basictypetext = input.split("" + (char) 10);
        basictypelength = basictypetext.length - 1;
        basictypepos = 0;
        rom464 = Switches.ROM.equals("CPC464");
    }

    public void BasicAutoType() {
        if (basictypetext == null) {
            basictypelength = -1;
            return;
        }
        if (basictypepos > basictypelength) {
            basictypepos = 0;
            basictypelength = -1;
            basictypetext = null;
            return;
        }
//        System.err.println("BAStyping:"+Util.dumpBytes(basictypetext[basictypepos].getBytes()));
        BasicPutText(basictypetext[basictypepos++]);
    }
    int tapep, tapei;
    /*
     *
     * 464 ROM 664 ROM 6128 ROM Entry Point 2836 29A6 29A6 Exit Point 2872 29E2
     * 29E2
     *
     *
     */
    int os_addr;
    byte[] os;
    byte[] os_unpatch = new byte[2];
    byte[] os_patch = {
        (byte) 0xed, (byte) 0xfc
    };

    protected void setOS() {
        if (Switches.ROM.equals("CPC464")) {
            os_addr = 0x2836;
        } else {
            os_addr = 0x29A6;
        }
    }

    public void patchOS() {
        setOS();
        if (Switches.ROM.equals("CPC464")) {
            os[0x2a68] = (byte) 0x01;
            os[0x286d] = (byte) 0x10;
            os[0x286e] = (byte) 0xfe;
            os[0x286f] = (byte) 0x3d;
            os[0x2870] = (byte) 0x20;
            os[0x2871] = (byte) 0xfa;
        } else {
            os[0x2a68 + diff] = (byte) 0x01;
            os[0x286d + diff] = (byte) 0x10;
            os[0x286e + diff] = (byte) 0xfe;
            os[0x286f + diff] = (byte) 0x3d;
            os[0x2870 + diff] = (byte) 0x20;
            os[0x2871 + diff] = (byte) 0xfa;
        }
        os[os_addr] = os_patch[0];
        os[os_addr + 1] = os_patch[1];
        memory.setLowerROM(os);
    }
    byte a464, b464, c464, d464, e464, f464;

    public void unpatchOS() {
        setOS();
        if (Switches.ROM.equals("CPC464")) {
            os[0x2a68] = a464;
            os[0x286d] = b464;
            os[0x286e] = c464;
            os[0x286f] = d464;
            os[0x2870] = e464;
            os[0x2871] = f464;
        } else {
            os[0x2a68 + diff] = a464;
            os[0x286d + diff] = b464;
            os[0x286e + diff] = c464;
            os[0x286f + diff] = d464;
            os[0x2870 + diff] = e464;
            os[0x2871 + diff] = f464;
        }
        os[os_addr] = os_unpatch[0];
        os[os_addr + 1] = os_unpatch[1];
        memory.setLowerROM(os);
    }
    byte[] TAPData;
    public static boolean loadtap = false;

    public void loadTAP(byte[] data) {
        tapesample = null;
        patchOS();
        tapei = 0;
        tapep = 0;
        TAPData = new byte[data.length];
        System.arraycopy(data, 0, TAPData, 0, data.length);
        loadtap = true;
        System.out.println(getTAPBlocks());
        tapei = 0;
        tapep = 0;
    }

    public void loadblock() {
        try {
            if (Switches.floppyturbo && Switches.turbo == 1) {
                Switches.turbo = 2;
            }
            int o = (TAPData[tapep++] & 0xff) | (TAPData[tapep++] << 8 & 0xffff);
            tapei++;
            System.out.println("Accessing TAP block:" + tapei);
            tapep++;
            for (int j = 0; j < o - 1; j++) {
                int hl = z80.getHL();
                int v = TAPData[tapep++] & 0x0ff;
                memory.writeByte(hl, v);
                z80.incHL();
            }
            int iff = 1;
            int f = 0x45;
            z80.setIM(iff);
            z80.ret();
            z80.setF(f);
            o = TAPData[tapep] & 0xff | TAPData[tapep + 1] << 8 & 0xffff;
            if (o == 0) {
                tapei = tapep = 0;
            }
        } catch (Exception e) {
            tapei = tapep = 0;
        }
// 	pt.selectedIndex= tapei;
    }

    public int getTAPBlocks() {
        tapei = 0;
        while (true) {
            try {
                int o = (TAPData[tapep++] & 0xff) | (TAPData[tapep++] << 8 & 0xffff);
                tapei++;
                tapep++;
                for (int j = 0; j < o - 1; j++) {
                    tapep++;
                }
                o = TAPData[tapep] & 0xff | TAPData[tapep + 1] << 8 & 0xffff;
                if (o == 0) {
                    tapei = tapep = 0;
                }
            } catch (Exception e) {
                break;
            }
        }
        return tapei;
// 	pt.selectedIndex= tapei;
    }

    public void BasicPutText(String input) {
        if (input.length() > 255) {
            return;
        }
        if (input.length() < 1) {
            basicchecktype = 1;
            return;
        }
        for (int i = 0; i < 255; i++) {
            memory.writeByte((rom464 ? BUFFER_START_464 : BUFFER_START) + i, 0);
        }
        for (int i = 0; i < input.length(); i++) {
            memory.writeByte((rom464 ? BUFFER_START_464 : BUFFER_START) + i, (int) input.charAt(i));
        }
        basicchecktype = 1;
    }

    int prepare = 0;
    String typetext = null;

    public void prepareAutotype(String input) {
        prepare = 1;
        typetext = input;
    }
    boolean plusui = true;
    boolean releaseall;
    public Basic bas;
    int baswait = 0;
    Thread basauto = new Thread() {
        public void run() {
            bas.update();
        }
    };

    public boolean fromautoboot = false;

    int magicscheck;

    public void vSync() {
        magicscheck++;
        if (magicscheck >= 10) {
            magicscheck = 0;
            if (magics[0] != null) {
                checkMagic(0);
            }
            if (magics[1] != null) {
                checkMagic(1);
            }
            if (magics[2] != null) {
                checkMagic(2);
            }
            if (magics[3] != null) {
                checkMagic(3);
            }
        }

        if (wasWinCPC != WinCPC) {
            wasWinCPC = WinCPC;
            Samples.SEEK.stop();
            Samples.SEEKWINCPC.stop();
            Samples.SEEKBACK.stop();
            Samples.SEEKBACKWINCPC.stop();
            Samples.TRACK.stop();
            Samples.TRACKWINCPC.stop();
            Samples.TRACKBACK.stop();
            Samples.TRACKBACKWINCPC.stop();
            Samples.MOTOR.stop();
            Samples.MOTORWINCPC.stop();
        }
        if (recordvideo) {
            this.recordFrame();
        }
        if (playvideo) {
            this.playFrame();
        }
        if (doimageexport) {
            exporter.record();
        }
//        if (plusui != memory.plus) {
        plusui = memory.plus;
        jemu.ui.Desktop.cprfile.setEnabled(plusui);
        jemu.ui.Desktop.cprload.setEnabled(plusui);
//        }
//        if (memory.plus) {
//            try {
//                memory.spritepalette();
//            } catch (Exception e) {
//            }
//        }
        if (releaseall) {
            this.getKeyboard().reset();
            releaseall = false;
        }
        if (basictypelength > -1 && basictypetext != null) {
            basicchecktype++;
            if (basicchecktype == 1) {
                if (jumpline && basictypepos <= basictypetext.length) {
                    this.getKeyboard().keyReleased(KeyEvent.VK_UP);
                }
                BasicAutoType();
            }
            if (basicchecktype == 2) {
                this.getKeyboard().keyPressed(KeyEvent.VK_ENTER);
            }
            if (((memory.readByte((rom464 ? BUFFER_START_464 : BUFFER_START)) == 0 && basicchecktype > 3) || (fromautoboot && basicchecktype == 3))) {
                basicchecktype = 0;
                fromautoboot = false;
                this.getKeyboard().keyReleased(KeyEvent.VK_ENTER);
                if (jumpline && basictypepos < basictypetext.length) {
                    this.getKeyboard().keyPressed(KeyEvent.VK_UP);
                }
            }
        }
        if (plotlogo != 0) {
            plotlogo++;
            if (plotlogo > 15) {
                plotlogo = 0;
                lopos = 0;
            }
        }
        if (replay) {
            replay = false;
            rePlay();
        }
        if (Switches.turbo != 1) {
            turbop++;
            if (turbop > Switches.turbo * 2) {
                display.updateImage(false);
                turbop = 0;
            }
        } else if (frameSkip == 0) {
            try {
                if (display.skipframes && (display.superPAL || display.filter_dosbox)) {
                    skip = !skip;
                    if (!skip) {
                        display.updateImage(true);
                    }
                } else {
                    display.updateImage(true);
                }
            } catch (Exception e) {
            }
        }
        if (bk != memory.getRAMBank()) {
            bk = memory.getRAMBank();
//            System.out.println("BANK &" + Util.hex((byte) memory.getRAMBank()));
        }
        if (snacount != 0) {
            snacount++;
            SNA_Load("paint", coden);

            if (snacount == 10) {
                snacount = 0;
                POKE(0x8fff, 0);
            }
        }
        if (snaocount != 0) {
            snaocount++;
            SNA_Load("overscanpaint", codeo);
            if (snaocount == 10) {
                snaocount = 0;
                POKE(0x8fff, 20);
            }
        }
        if (resetregisters) {
            resetregisters = false;
            resetRegisters();
        }
        if (overscanPaintBox != null && overscanPaintBox.manipframe != null) {
            if (overscanPaintBox.isDisplayable() && !overscanPaintBox.manipframe.isVisible()) {
                overscanPaintBox.manipframe.setVisible(true);
            }
            if (!overscanPaintBox.isDisplayable() && overscanPaintBox.manipframe.isVisible()) {
                overscanPaintBox.manipframe.setVisible(false);
                reset = true;
                System.out.println("Closing EffectMixer");
            }
        }
        if (normalPaintBox != null && normalPaintBox.manipframe != null) {
            if (normalPaintBox.isDisplayable() && !normalPaintBox.manipframe.isVisible()) {
                normalPaintBox.manipframe.setVisible(true);

            }
            if (!normalPaintBox.isDisplayable() && normalPaintBox.manipframe.isVisible()) {
                normalPaintBox.manipframe.setVisible(false);
                reset = true;
                System.out.println("Closing EffectMixer");
            }
        }
        if (cat) {
            CAT();
            cat = false;
        }

        if (doautotype != 0) {
            doautotype++;
            if (doautotype > 200) {
                doautotype = 0;
                AutoType(autotypetext + "\n");
            }
        }
        if (doargs != 0) {
            doargs++;
            if (doargs > 160) {
                doargs = 0;
                try {
                    doArgs();
                } catch (Exception e) {
                }
            }
        }
        if (playmovie && !initmovie) {
            stopper++;
            if (stopper == 70) {
//                BasicAutoType("MODE " + smode);
//            }
//            if (stopper == 110) {
                initmovie = true;
                stopper = 0;
            }
        }
        if (storeflipA) {
            storeflipA = false;
            putFlipA();
        }
        if (storeflipB) {
            storeflipB = false;
            putFlipB();
        }
//        if (playSNP || StoreSNP) {
//            if (frameSkip == 0) {
//                display.updateImage(true);
//            }
//            UpdateSNP();
//            syncProcessor(psg.getSoundPlayer());
//            return;
//        }
        if (getbuff) {
            getbuff = false;
            buffSNA = getSNA(512);
        }
        if (up0) {
            updateDrive(0);
            up0 = false;
        }
        if (up1) {
            updateDrive(1);
            up1 = false;
        }
        if (formNo != 100) {
            if (formNo == 200) {
                if (forma != null) {
                    forma.setVisible(false);
                }
                jemu.ui.Desktop.closeFormat = true;
                formNo = 100;
                return;
            }
            formatDisk(seldrive, formNo);
            formNo = 100;
        }
        if (overscan && overcount != 0) {
            overcount++;
            if (overscan && overcount > 10) {
                overcount = 0;
                boolean plusmode = overscanPaintBox.getPlus();
                if (!plusmode) {
                    for (int i = 0; i < CodeOv.length; i++) {
                        GateArray.screenmemory[0x811 + i] = (byte) CodeOv[i];
                    }
//            System.out.println(Util.dumpBytes(CodeOv));
//            System.exit(0);
                    for (int i = 0; i < 16; i++) {
                        GateArray.screenmemory[0x801 + i] = (byte) GateArray.getInk(i);
                    }
                    GateArray.screenmemory[0x800] = (byte) gateArray.getScreenMode();
                } else {
                    System.out.println("Defining Pluspalette");
                    for (int i = 0; i < CodeOvP.length; i++) {
                        GateArray.screenmemory[0x821 + i] = (byte) CodeOvP[i];
                    }
                    byte[] pluspal = overscanPaintBox.getPlusPalette();
                    System.arraycopy(pluspal, 0, GateArray.screenmemory, 0x801, 32);
                    int mode = gateArray.getScreenMode();
                    byte mo = (byte) 0x8c;
                    if (mode == 1) {
                        mo = (byte) 0x8d;
                    }
                    if (mode == 2) {
                        mo = (byte) 0x8e;
                    }
                    GateArray.screenmemory[0x800] = mo;
                    POKE(0x800, mo);
                }

            }
        }
        if (snap) {
            return;
        }
        Check();
        boolean ledupdate = portB < 0x80 ? true : false;

        if (!tapeRelay) {
            ledupdate = false;
        }

        if (ledupdate != updateled) {
            jemu.ui.Desktop.setLed(4, ledupdate);
        }
        updateled = ledupdate;

        if (tapeRewind || tapeFastForward || (tapePlay && tapeRelay)) {
            TapeDrive.rebuildBlocks(tapeBandPosition);

        }
        if (!amsspeech && Speech.enabled && Speech.SSA) {
            z80.addOutputDeviceMapping(amstradSpeech);
            z80.addInputDeviceMapping(amstradSpeech);
            amsspeech = true;
        }

        if (!dkspeech && Speech.enabled && !Speech.SSA) {
            z80.addOutputDeviceMapping(dktronicsSpeech);
            z80.addInputDeviceMapping(dktronicsSpeech);
            dkspeech = true;
        }

        if (xms != 0) {
            xms++;
            if (xms == 120) {
                launchXMS();
                xms = 0;
            }
        }

        if (loadalarm) {
            loadalarm = false;
            loadAlarm();
        }
        if (setPaintOnTop) {
            try {
                overscanPaintFrame.setAlwaysOnTop(PaintOnTop);
            } catch (Exception e) {
            }
            try {
                normalPaintFrame.setAlwaysOnTop(PaintOnTop);
            } catch (Exception e) {
            }
            setPaintOnTop = false;
        }
        checktape++;
        if (checktape == 10) {
            checktape = 0;
            if (TapeDrive.isVisible()) {
                TapeDrive.checkTape();
            }
        }
        if (TapeDrive.isVisible()) {
            TapeDrive.paintWheels();
        }
//   if (frameSkip == 0 && Switches.floppyturbo && Switches.turbo !=1){

        if (updatebox) {
            updatebox = false;
            updateBox();
            overscanPaintBox.loadDsk();
        }
        if (normalupdatebox) {
            normalupdatebox = false;
            NormalupdateBox();
            normalPaintBox.loadDsk();
        }
        if (restorePaint) {
            restorePaint = false;
            restorePaintDSK();
        }
        if (insertOverscanPaintDisk) {
            loadover = 1;
            insertOverscanPaintDisk = false;
            overscan = true;
            //insertPaintDSK();
        }
        if (insertNormalPaintDisk) {
            loadnormal = 1;
            overscan = false;
            insertNormalPaintDisk = false;
            //insertPaintDSK();
        }
        if (importoverscanscr == 1) {
            loadover = 1;
            overscan = true;
            importoverscanscr = 0;
        }
        if (importnormalscr == 1) {
            loadnormal = 1;
            overscan = false;
            importnormalscr = 0;

        }
        if (loadover != 0) {
            loadover++;
            if (loadover == 10) {
                loadover = 0;
                loadOverscanPaint();
            }
        }
        if (loadnormal != 0) {
            loadnormal++;
            if (loadnormal == 10) {
                loadnormal = 0;
                loadNormalPaint();
            }
        }
//        if (overscanPaintFrame != null && !Display.lowperformance) {
//            if (overscanPaintFrame.isVisible()) {
//                Display.lowperformance = true;
//
//
//            }
//        }
//        if (normalPaintFrame != null && !Display.lowperformance) {
//            if (normalPaintFrame.isVisible()) {
//                Display.lowperformance = true;
//            }
//        }
        if (writePal > 0) {
            writePal++;
            if (writePal > 10) {
                writePal = 0;
                int adr = 0x9809;
                POKE(adr, (byte) gateArray.getScreenMode());
                adr += 3;
                for (int i = 0; i < 17; i++) {
                    for (int g = 0; g < 12; g++) {
                        int numb = GateArray.getInk(i);
                        POKE(adr, (byte) PAL_INK[numb]);
                        adr++;
                    }
                }
                POKE(0x8fff, 100);
            }
        }
        if (reset) {
            reset = false;
            runBinary(0);
            gateArray.reset();
        }
        if (overscanPaintFrame != null && !overscanPaintFrame.getTitle().equals(overscanPaintBox.showname())) {
            overscanPaintFrame.setTitle(overscanPaintBox.showname());
        }

        if (normalPaintFrame != null && !normalPaintFrame.getTitle().equals(normalPaintBox.showname())) {
            normalPaintFrame.setTitle(normalPaintBox.showname());
        }

        if (PEEK(0x9000) == 0x2a && PEEK(0x9128) == 0x52 && PEEK(0x9227) == 0x41 && overscan) {
            if (overscanPaintFrame == null) {
                StartOverscanPaint();
            }
            if (overscanPaintFrame != null) {
                if (!overscanPaintFrame.isVisible()) {
                    StartOverscanPaint();
                }
            }
        }
        if (PEEK(0x9000) == 0x2a && PEEK(0x9128) == 0x52 && PEEK(0x9227) == 0x41 && !overscan) {
            if (normalPaintFrame == null) {
                StartNormalPaint();
            }
            if (normalPaintFrame != null) {
                if (!normalPaintFrame.isVisible()) {
                    StartNormalPaint();
                }
            }
        }

        if (coscreen > 0) {
            coscreen++;
            if (coscreen == 10) {
                runBinary(0xcfd0);
                coscreen = 0;
            }
        }
        if (savescreen) {
            savescreen = false;
            AddressA.setText("SCREEN");
            AddressA.setEnabled(true);
            JCheckBox OCP = new JCheckBox("Write PAL-file");
            OCP.addItemListener(OCPListener);
            OCP.setSelected(true);
            Object[] object = {"Enter Filename", AddressA, OCP};
            int selectedValue = JOptionPane.showOptionDialog(new Frame(), object, "Enter Filename:",
                    JOptionPane.OK_CANCEL_OPTION, JOptionPane.OK_CANCEL_OPTION, null, null, null);
            if (selectedValue != JOptionPane.OK_OPTION) {
                return;
            }
            AddressA.setEnabled(false);
            saveScreen(AddressA.getText().toUpperCase());
        }
        if (saveoverscanscreen) {
            saveoverscanscreen = false;
            AddressA.setText("SCREEN");
            AddressA.setEnabled(true);
            JCheckBox OCP = new JCheckBox("Write PAL-file");
            OCP.addItemListener(OCPListener);
            OCP.setSelected(true);
            Object[] object = {"Enter Filename", AddressA, OCP};
            int selectedValue = JOptionPane.showOptionDialog(new Frame(), object, "Enter Filename:",
                    JOptionPane.OK_CANCEL_OPTION, JOptionPane.OK_CANCEL_OPTION, null, null, null);
            if (selectedValue != JOptionPane.OK_OPTION) {
                return;
            }
            AddressA.setEnabled(false);
            saveOverscanScreen(AddressA.getText().toUpperCase());
        }
        if (overscanPaintFrame == null) {
            if (Switches.turbo == 1 && Switches.watch) {
                performanceCheck();
            }
        } else if (Switches.turbo == 1 && Switches.watch && !overscanPaintFrame.isVisible()) {
            performanceCheck();
        }
        if (resync) {
            reSync();
            resync = false;
        }
        if (inspect > 0) {
            inspect++;
            if (inspect == 20) {
                inspect = 0;
                diskInspector(inspectdrive);
            }
        }
        if (boot > 0) {
            boot++;
            if (boot == 20) {
                boot = 0;
                bootDisk(inspectdrive, false);
            }
        }
        if (bootthis) {
            bootthis = false;
            bootDisk(0, false);
        }
        if (inspectA) {
            inspectA = false;
            diskInspector(0);
        }
        if (inspectB) {
            inspectB = false;
            diskInspector(1);
        }
        if (resetInk > 0) {
            resetInk = 0;
            gateArray.resetInks();
        }
        if (mp3count > 0) {
            mp3count++;
            if (mp3count == 10) {
                MP3Load();
            }
        }
        if (doOptimize) {
            optimizeWAV();
            doOptimize = false;
        }
        if (DoDownload >= 1) {
            DoDownload++;
            if (DoDownload >= 100) {
                DoDownload = 0;
                Download();
            }
        }
        if (savetape) {
            savetape = false;
            tape_WAV_save();
        }
        if (tapeload) {
            tapeload = false;
            tape_load();
        }
        if (inserttape) {
            inserttape = false;
            try {
                loadFile(0, loadtape);
            } catch (Exception emil) {
                return;
            }
            tapestarttimer = 1;
        }
        if (tapestarttimer >= 1) {
            Switches.blockKeyboard = true;
            TapeDrive.buttonpressed = true;
            tapestarttimer++;
            if (tapestarttimer >= 56) {
                tapestarttimer = 0;
                // hidetape = true;
                tapePlay = true;
                TapeDrive.pressPlay();
                if (CPCname.equals("CPC464T") || (amsdos != null && amsdos.equals("no"))) {
                    AutoType("RUN\"\n\n\n");
                } else {
                    AutoType("|TAPE\nRUN\"\n\n\n");
                }
            }
        }
        if (tapeEnabled) {
            if ((tapePlay && playing && tapeRelay)
                    || tapeRewind || tapeFastForward) {
                TapeCheck();
            }
            if (!tapeRelay) {
                portB = 0;
            }
            if (stoptape && tapestop >= 1) {
                tapestop++;
                if (tapestop == 2) {
                    StopTape();
                    tapestop = 0;
                }
            }
        }
        if (saveOnExit >= 1) {
            saveOnExit++;
        }
        if (saveOnExit == 2) {
            if (df0mod) {
                AutoSave(0);
            }
            if (df1mod) {
                AutoSave(1);
            }
            if (df2mod) {
                AutoSave(2);
            }
            if (df3mod) {
                AutoSave(3);
            }
        }
        if (saveOnExit == 10) {
            if (tapeRelay) {
                if (Switches.FloppySound && !Bypass) {
                    Samples.RELAISOFF.play();
                    Samples.TAPEMOTOR.stop();
                }
                tapeRelay = false;
            }
            System.exit(0);
        }

        if (saveOn == 1) {
            if (df0mod) {
                AutoSave(0);
            }
            if (df1mod) {
                AutoSave(1);
            }
            if (df2mod) {
                AutoSave(2);
            }
            if (df3mod) {
                AutoSave(3);
            }
            saveOn = 0;
            df0mod = df1mod = df2mod = df3mod = false;
        }
        if (savetimer >= 1) {
            savetimer++;
            if (savetimer == 100) {
                savetimer = 0;
                if (df0mod) {
                    AutoSave(0);
                }
                if (df1mod) {
                    AutoSave(1);
                }
                if (df2mod) {
                    AutoSave(2);
                }
                if (df3mod) {
                    AutoSave(3);
                }
                df0mod = df1mod = df2mod = df3mod = false;
            }
        }
        if (blastercount >= 1) {
            Switches.blockKeyboard = true;
            blastercount++;

            if (blastercount == 170 || blastercount == 180) {
                keyboarda.keyPressed(KeyEvent.VK_DECIMAL);

            }
            if (blastercount == 175 || blastercount == 185) {
                keyboarda.keyReleased(KeyEvent.VK_DECIMAL);
                if (blastercount == 185) {
                    Switches.blockKeyboard = false;
                    blastercount = 0;
                }
            }
        }
        if (launchcount >= 1) {
            launchcount++;
            if (launchcount == 5) {
                softReset();

            }
            if (launchcount == 10) {
                softReset();
            }
            if (launchcount == 15) {
                softReset();
            }
            if (launchcount == 20) {
//                softReset();
                launchcount = 0;
                if (launchcode == 1) {
                    launchDigitracker();
                }
                if (launchcode == 3) {
                    launchDigitrackerMC();
                }
                if (launchcode == 4) {
                    launchDigitrackerPG();
                }
                if (launchcode == 2) {
                    launchCheat();
                }
            }
        }
        if (Switches.autofire) {
            firetimer++;
            if (firetimer >= timefire) {
                if (fired && !Switches.blockKeyboard) {
                    keyboarda.keyPressed(KeyEvent.VK_NUMPAD5);
                    fired = false;
                } else {
                    keyboarda.keyReleased(KeyEvent.VK_NUMPAD5);
                    fired = true;
                }
                firetimer = 0;
            }
        } else if (!fired) {
            try {
                keyboarda.keyReleased(KeyEvent.VK_NUMPAD5);
                fired = true;
            } catch (Exception e) {
            }

        }
        if (Switches.turbo > 1) {
            turbotimer++;
            if (turbotimer >= 100) {
                turbotimer = 0;
                Switches.turbo++;
            }
        }

        try {
            if (jemu.ui.Desktop.sync.isSelected() || disableresync) {
                syncProcessor();
            } else {
                syncProcessor(psg.getSoundPlayer());
            }
        } catch (Exception e) {
//            syncProcessor(psg.getSoundPlayer());
        }

        if (!YM_Play) {
            typeAuto();
            joyReader();
        }
        if (YM_Rec || YM_Play || YM_Stop || YM_Load || YM_Save) {
            YMCheck();
        }
        if (overscanPaintFrame != null && overscanPaintBox != null) {
            try {
                if (overscanPaintFrame.isVisible()) {
                    overscanPaintBox.cycle();
                }
            } catch (Exception e) {
            }
        }
        if (normalPaintFrame != null && normalPaintBox != null) {
            try {
                if (normalPaintFrame.isVisible()) {
                    normalPaintBox.cycle();
                }
            } catch (Exception e) {
            }
        }

        if (restorebuf) {
            restorebuf = false;
            SNA_Load("buffer", buffSNA);
        }
        if (storebuf) {
            storebuf = false;
            stoSNA();
        }
        if (snpCapture) {
            snpCapture = false;
            SNP_Capture();
        }
        if (showflippreview) {
            previewFlip();
        }
        if (Switches.lightGun) {
            lightGun();
        }
    }
    protected boolean snpCapture = false;

    protected void putDSKImage(int drive) {
        switch (drive) {
            case 1:
                if (dskImageB != null) {
                    dskImage = dskImageB;
                }
                break;
            case 2:
                if (dskImageC != null) {
                    dskImage = dskImageC;
                }
                break;
            case 3:
                if (dskImageD != null) {
                    dskImage = dskImageD;
                }
                break;
            default:
                if (dskImageA != null) {
                    dskImage = dskImageA;
                }
                break;
        }
    }

    public void SaveDSK() {
        dskImage = null;
        int drive = getCurrentDrive();
        System.out.println("Saving image from drive DF" + drive);
        putDSKImage(drive);
        if (dskImage != null) {
            floppies[drive].setSides(dskImage.getNumberOfSides());
            int heads = dskImage.getNumberOfSides() == 1 ? Drive.HEAD_0 : Drive.BOTH_HEADS;
            fdc.setDrive(drive, floppies[drive]);
            fdc.getDrive(drive).setDisc(heads, dskImage);
            dskImage.saveImage();
        } else {
            System.out.println("Failed to save... Probably drive empty?");
        }
        setCurrentDrive(0);
    }

    public void AutoSave(int drive) {
        dskImage = null;
        System.out.println("Saving image from drive DF" + drive);
        putDSKImage(drive);
        if (dskImage != null) {
            floppies[drive].setSides(dskImage.getNumberOfSides());
            int heads = dskImage.getNumberOfSides() == 1 ? Drive.HEAD_0 : Drive.BOTH_HEADS;
            fdc.setDrive(drive, floppies[drive]);
            fdc.getDrive(drive).setDisc(heads, dskImage);
            dskImage.saveImage();
        } else {
            System.out.println("Failed to save... Probably drive empty?");
        }
        setCurrentDrive(0);
    }

    public void mouseRight(boolean release) {
        if (release) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD6);
        } else {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD6);
        }
    }

    public void mouseLeft(boolean release) {
        if (release) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD4);
        } else {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD4);
        }
    }

    public void mouseUp(boolean release) {
        if (release) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD8);
        } else {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD8);
        }
    }

    public void mouseDown(boolean release) {
        if (release) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD2);
        } else {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD2);
        }
    }
    protected int mouseSensivity = 7;

    public void joyReader() {
        if (!Switches.blockKeyboard) {
            if (Switches.MouseJoy) {
                if (Switches.directxR.equals("Right")) {
                    keyboarda.keyPressed(KeyEvent.VK_NUMPAD6);
                    Switches.directxR = "none";

                }
                if (Switches.directxL.equals("Left")) {
                    keyboarda.keyPressed(KeyEvent.VK_NUMPAD4);
                    Switches.directxL = "none";

                }
                if (Switches.directyU.equals("Up")) {
                    keyboarda.keyPressed(KeyEvent.VK_NUMPAD8);
                    Switches.directyU = "none";

                }
                if (Switches.directyD.equals("Down")) {
                    keyboarda.keyPressed(KeyEvent.VK_NUMPAD2);
                    Switches.directyD = "none";

                }
                Switches.directL++;

                if (Switches.directL >= mouseSensivity) {
                    Switches.directL = mouseSensivity + 1;
                    keyboarda.keyReleased(KeyEvent.VK_NUMPAD4);

                }
                Switches.directR++;

                if (Switches.directR >= mouseSensivity) {
                    Switches.directR = mouseSensivity + 1;
                    keyboarda.keyReleased(KeyEvent.VK_NUMPAD6);

                }
                Switches.directU++;

                if (Switches.directU >= mouseSensivity) {
                    Switches.directU = mouseSensivity + 1;
                    keyboarda.keyReleased(KeyEvent.VK_NUMPAD8);

                }
                Switches.directD++;

                if (Switches.directD >= mouseSensivity) {
                    Switches.directD = mouseSensivity + 1;
                    keyboarda.keyReleased(KeyEvent.VK_NUMPAD2);

                }
            }
        }
    }
    public static boolean getfromconsole = false;

    public void typeAuto() {
        if (Switches.getfromautotype != 0) {
            Switches.getfromautotype = 0;
            AutoType(Autotype.autotext);

        }
        if (getfromconsole) {
            getfromconsole = false;
            AutoType(jemu.ui.Console.autotext);
        }
        if (autotyper != 0) {
            if (Switches.turbo == 1) {
                Switches.turbo = 4;

            }
            autotyper++;

            if (autotyper == 4) {
                try {
                    if (Switches.KeyboardSound) {
                        if (eventArray[readkey] != KeyEvent.VK_SPACE && eventArray[readkey] != KeyEvent.VK_ENTER) {
                            Samples.KEYRELEASE.play();

                        }
                        if (eventArray[readkey] == KeyEvent.VK_SPACE) {
                            Samples.SPACERELEASE.play();

                        }
                        if (eventArray[readkey] == KeyEvent.VK_ENTER) {
                            Samples.ENTERRELEASE.play();

                        }
                    }
                    // System.out.println("KeyRelease: " + readkey);
                    keyboarda.keyReleased(eventArray[readkey]);

                    if (shifter[readkey + 1]) {
                        keyboarda.keyPressed(KeyEvent.VK_SHIFT);

                    } else {
                        keyboarda.keyReleased(KeyEvent.VK_SHIFT);

                    }
                } catch (Exception e) {
                    keyboarda.keyReleased(KeyEvent.VK_SHIFT);
                    autotyper = 0;

                    if (turbo) {
                        Switches.turbo = 4;

                    } else {
                        Switches.turbo = 1;

                    }
                    Switches.blockKeyboard = false;

                }
            }

            if (autotyper == 7) {
                try {
                    if (Switches.KeyboardSound) {
                        if (eventArray[readkey] != KeyEvent.VK_SPACE && eventArray[readkey] != KeyEvent.VK_ENTER) {
                            Samples.KEYPRESS.play();

                        }
                        if (eventArray[readkey] == KeyEvent.VK_SPACE) {
                            Samples.SPACEPRESS.play();

                        }
                        if (eventArray[readkey] == KeyEvent.VK_ENTER) {
                            Samples.ENTERPRESS.play();

                        }
                    }
                    //System.out.println("KeyPress: " + readkey);
                    readkey++;
                    keyboarda.keyPressed(eventArray[readkey]);
                    autotyper = 1;

                } catch (Exception e) {
                    keyboarda.keyReleased(KeyEvent.VK_SHIFT);
                    autotyper = 0;

                    if (turbo) {
                        Switches.turbo = 4;

                    } else {
                        Switches.turbo = 1;

                    }
                    Switches.blockKeyboard = false;

                }
            }
        }
    }

    public Memory getMemory() {
        return memory;

    }

    public static Memory getMem() {
        return memory2;

    }

    public Processor getProcessor() {
        return z80;

    }

    public Dimension getDisplaySize(boolean large) {
        return gateArray.getDisplaySize(large);

    }

    @Override
    public Dimension getDisplayScale(boolean large) {
        return large ? Display.SCALE_1x2 : Display.SCALE_1;

    }

    @Override
    public void setLarge(boolean value) {
        gateArray.setHalfSize(!value);

    }

    @Override
    public Disassembler getDisassembler() {
        return disassembler;

    }

    protected Keyboard getKeyboard() {
        if (Switches.joystick == 0) {
            return keyboardb;

        } else if (Switches.notebook) {
            return keyboardn;

        } else {
            return keyboarda;

        }
    }
    public static boolean recordKeys, playKeys = false;
    protected int keyNumber, totalKeyNumber;
    protected byte keyStroke[] = new byte[11000000];

    public void recordKeys() {
        totalKeyNumber = 0;
        keyNumber = 0;
        playKeys = false;
        recordKeys = true;
    }

    public void playKeys() {
        playKeys = true;
        recordKeys = false;
        keyNumber = 0;
    }

    public void stopKeys() {
        if (recordKeys) {
            totalKeyNumber = keyNumber;
            SNK_Save();
        }
        playKeys = false;
        recordKeys = false;
        keyNumber = 0;
    }
    public static boolean printeronline = true;

    @Override
    public int readPort(int port) {
        int result;
        switch (port) {
            case PPI_PORT_C:
                result = 1;
                System.out.println("Port read..." + Util.hex(port) + " result:" + result);
                break;
            case PPI_PORT_B:
                result = ((((Switches.Printer && printeronline) ? 0x00 : 0x040) | Switches.frequency)
                        | (Switches.computername * 2) | (crtc.isVSync() ? 0x01 : 0) | (portB));
                break;
            case PSG_PORT_A: {
                if (recordKeys) {
                    keyStroke[keyNumber] = (byte) keyboarda.readSelectedRow();
                    keyNumber++;
                    if (keyNumber >= 10000000) {
                        keyNumber = 0;
                        recordKeys = false;
                        System.out.println("Recording stopped... Buffer full");
                    }
                }
                if (playKeys) {
                    result = keyStroke[keyNumber];
                    keyNumber++;
                    if (keyNumber >= totalKeyNumber) {
                        System.out.println("Playback finished");
                        keyNumber = 0;
                        playKeys = false;
                    }
                    break;
                } else if (Switches.blockKeyboard) {
                    result = keyboarda.readSelectedRow();
                    break;
                } else {
                    result = getKeyboard().readSelectedRow();
                    break;
                }
            }
            default:
                throw new RuntimeException("Unexpected Port Read: " + Util.hex((short) port));
        }
        return result;
    }
    boolean compatibility = false;

    @Override
    public void writePort(int port, int value) {
        switch (port) {

            case PPI_PORT_C:
                psg.setBDIR_BC2_BC1(PSG_VALUES[value >> 6], ppi.readOutput(PPI8255.PORT_A));
                if (Switches.blockKeyboard) {
                    keyboarda.setSelectedRow(value & 0x0f);
                } else {
                    getKeyboard().setSelectedRow(value & 0x0f);
                }
                if (tapeEnabled) {
                    TapeRecbyte = (byte) (~(value & 0x20) * 7);
                    if (TapeRecbyte == (byte) 0x19) {
                        TapeRecbyte = (byte) 0x26;
                    } else if (TapeRecbyte == (byte) 0xf9) {
                        TapeRecbyte = (byte) 0xda;
                    } else {
                        TapeRecbyte = (byte) 0x80;
                    }
                    if (compatibility) {
                        TapeRecbyte = (byte) value;
                        if (TapeRecbyte == (byte) (0x78)) {
                            TapeRecbyte = (byte) 0xda;
                        } else if (TapeRecbyte == (byte) (0x58)) {
                            TapeRecbyte = (byte) 0x26;
                        } else {
                            TapeRecbyte = (byte) 0x80;
                        }
                    }
                    if (tapeRelay && TapeRecbyte != (byte) 0x80) {
                        TapeSound(TapeRecbyte);
                    }
                    if ((((value ^ previousPortValue) & 0x010) != 0) || ((value & 0x10) == 0x10)) {
                        TapeRelayCheck(value);
                    }
                }
                break;
            default:
                if (playvideo) {
                    return;
                }
                // FDC Motor control
                if ((port & 0x0581) == 0) {
//                    if (port >= 0xfa00 && port <= 0xfaff) {
                    floppymotor = (value & 0x01) != 0;
                    jemu.ui.Desktop.fdcm.setSelected(floppymotor);
//                        System.out.println("Floppy-motor " + (floppymotor ? "on" : "off"));
                    if (!floppymotor) {
                        if (Switches.FloppySound && Switches.audioenabler == 1 && !Bypass) {
                            if (WinCPC) {
                                Samples.MOTORWINCPC.stop();
                            } else {
                                Samples.MOTOR.stop();
                            }
                        }
                    } else if (Switches.FloppySound && Switches.audioenabler == 1 && !Bypass) {
                        if (WinCPC) {
                            Samples.MOTORWINCPC.loop();
                        } else {
                            Samples.MOTOR.loop();
                        }
                    }
//                    }
                } else {
                    throw new RuntimeException("Unexpected Port Write: " + Util.hex((short) port) + " with " + Util.hex((byte) value));
                }
        }
    }
    public boolean floppymotor;

    public static boolean WinCPC = true;

    public boolean wasWinCPC = false;

    public void keyPressed(KeyEvent e) {
        if (key != null) {
            key.pressKey(e.getKeyCode());
        }
        display.keyPress(e.getKeyCode());
        if (this.basictypetext != null) {
            if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
            } else {
                return;
            }
        }
        if (e.getKeyCode() == KeyEvent.VK_HOME && mfisconnected) {
            return;

        }
        if (normalPaintBox != null && normalPaintBox.isShowing()) {
            if (e.getKeyCode() == KeyEvent.VK_1) {
                storeflipA = true;
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_2) {
                storeflipB = true;
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_4) {
                getFlipA();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_5) {
                getFlipB();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_3) {
                showflippreview = !showflippreview;
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_6) {
                normalPaintBox.deFlip();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_7) {
                normalPaintBox.makeMovie();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_8) {
                normalPaintBox.resetMovie();
                playmovie = !playmovie;
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_9) {
                normalPaintBox.resetMovie();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_0) {
                normalPaintBox.resetMovie();
                normalPaintBox.renderMovie();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_S) {
                normalPaintBox.storeMovie();
                return;
            }
            if (e.getKeyCode() == KeyEvent.VK_L) {
                normalPaintBox.restoreMovie();
                return;
            }
        }
        if (e.getKeyCode() == KeyEvent.VK_SPACE && playmovie) {
            stopMovie();
        }
        playSNP = false;
        keySample(e, false);
        if (!Switches.blockKeyboard) {
            getKeyboard().keyPressed(e.getKeyCode());
        }
    }

    public void keyPressed(int e) {
        playSNP = false;
        getKeyboard().keyPressed(e);

    }

    public void keyReleased(int e) {
        playSNP = false;
        getKeyboard().keyReleased(e);

    }

    public void doSong() {
        int adr = 0x4000;
        int t = 0;
        memory.setRAMBank(0x0c0);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        adr = 0x4000;
        memory.setRAMBank(0x0c4);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        adr = 0x4000;
        memory.setRAMBank(0x0c5);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        adr = 0x4000;
        memory.setRAMBank(0x0c6);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        adr = 0x4000;
        memory.setRAMBank(0x0c4);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        adr = 0x4000;
        memory.setRAMBank(0x0c6);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        adr = 0x4000;
        memory.setRAMBank(0x0c7);
        for (int p = 0; p < 0x4000; p++) {
            POKE(adr++, ((t >> 6 | t | t >> (t >> 16)) * 10 + ((t >> 11) & 7)));
            t++;
        }
        memory.setRAMBank(0x0c0);
    }
    ImageExporter exporter;
    boolean doimageexport = false;
    public boolean isPlayCity = true;

    public void keyReleased(KeyEvent e) {

        if (key != null) {
            key.releaseKey(e.getKeyCode());
        }
//        if (e.getKeyCode() == KeyEvent.VK_NUMPAD3) {
//            Cheat();
//        }
//        LOAD("file/XMAS09.BIN", 0x0140, 0x50ba, 0x51a7, false);
        display.keyRelease(e.getKeyCode());
        if (this.basictypetext != null) {
            if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
                basictypetext = null;
            } else {
                return;
            }
        }
        int disabled = 0xD15AB1ED;
        if (e.getKeyCode() == disabled + KeyEvent.VK_HOME) {
            if (exporter == null) {
                exporter = new ImageExporter();
            }
            doimageexport = !doimageexport;
        }
        if (e.getKeyCode() == KeyEvent.VK_NUMPAD1) {
//            stopKeys();
//            resetRegisters();
        }
        if (e.getKeyCode() == KeyEvent.VK_NUMPAD7) {
//            buffSNA = getSNA(128);
//            recordKeys();
//            resetRegisters();
        }
        if (e.getKeyCode() == KeyEvent.VK_NUMPAD9) {
//            playKeys();
//            resetRegisters();
        }
        if (e.getKeyCode() == KeyEvent.VK_HOME && memory.plus) {
            loadedplus = false;
            Settings.set(Settings.CARTRIDGE, "empty");
            reset();
            return;
        }
        if (e.getKeyCode() == KeyEvent.VK_HOME) {
//            doSong();
            if (!memory.multi && mfisconnected) {
                doMultiface();
            }
            return;

        }
        if (normalPaintBox != null && normalPaintBox.isShowing()) {
            if (e.getKeyCode() == KeyEvent.VK_1) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_2) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_3) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_4) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_5) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_6) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_7) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_8) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_9) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_S) {
                return;

            }
            if (e.getKeyCode() == KeyEvent.VK_L) {
                return;

            }
        }
        playSNP = false;
        keySample(
                e, true);

        if (!Switches.blockKeyboard) {
            getKeyboard().keyReleased(e.getKeyCode());

        }
        if (!Switches.blockKeyboard) {
            getKeyboard().keyReleased(e.getKeyCode());

        }
    }

    public static void dump() {
        try {
            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("output.bin"));
            bos.write(memory.getMemory());
            bos.close();

        } catch (Exception ef) {
        }
    }

    public void AtKey() {
        AutoType("@");

    }

    public void bootDisk() {
        int drive = fdc.getDrive();
        System.out.println("booting from drive " + drive);
        bootDisk(0, false);
        //CAT:FOR k=1 TO 8:n$=n$+chr$(peek(HIMEM-&7FF+k)):NEXT:n$=n$+".":FOR k=1 TO 3:n$=n$+chr$(peek(HIMEM-&7FF+k+8)):NEXT:RUN n$
        // AutoType("mode 1:pen 0\n|A:CAT:FOR k=1 TO 8:n$=n$+chr$(peek(HIMEM-&7FF+k)):NEXT:" +
        //         "n$=n$+\".\":FOR k=1 TO 3:n$=n$+chr$(peek(HIMEM-&7FF+k+8)):NEXT:PEN 1:RUN n$\nccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc\n|cpm\n");

    }

    public void bootDiskb() {
        bootDisk(1, false);
        // AutoType("mode 1:pen 0\n|B:CAT:FOR k=1 TO 8:n$=n$+chr$(peek(HIMEM-&7FF+k)):NEXT:" +
        //         "n$=n$+\".\":FOR k=1 TO 3:n$=n$+chr$(peek(HIMEM-&7FF+k+8)):NEXT:PEN 1:RUN n$\n");

    }

    public void bootCPM() {
        fromautoboot = true;
        BasicAutoType("|CPM");

    }

    public void typeRun() {
        AutoType("RUN\"");

    }

    public void typeCat() {
        AutoType("CAT\n");

    }

    public void AutoType() {
        AutoType(Switches.loadauto);

    }

    public void MouseFire1() {
        if (!Switches.blockKeyboard) {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD5);

        }
    }

    public void MouseFire2() {
        if (!Switches.blockKeyboard) {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD0);

        }
    }

    public void lightgunShot() {
        if (!Switches.blockKeyboard) {
            keyboarda.keyPressed(KeyEvent.VK_NUMPAD2);

        }
    }

    public void lightgunRelease() {
        if (!Switches.blockKeyboard) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD5);
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD2);

        }
    }

    public void MouseReleaseFire1() {
        if (!Switches.blockKeyboard) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD5);

        }
    }

    public void MouseReleaseFire2() {
        if (!Switches.blockKeyboard) {
            keyboarda.keyReleased(KeyEvent.VK_NUMPAD0);

        }

    }

    public void AutoType(String textinput) {
        if (textinput == null || textinput.length() < 1) {
            return;

        }
        if (Switches.turbo >= 2) {
            turbo = true;

        } else {
            turbo = false;

        }
        Switches.turbo = 4;
        Switches.blockKeyboard = true;
        readkey = 0;
        eventArray = new int[textinput.length()];
        shifter = new boolean[textinput.length()];

        for (int i = 0; i
                < textinput.length(); i++) {
            eventArray[i] = convertCharToVK(textinput.charAt(i));
            shifter[i] = shift;

        }
        keyboarda.keyReleased(KeyEvent.VK_ALT_GRAPH);
        keyboarda.keyReleased(KeyEvent.VK_CONTROL);
        keyboarda.keyReleased(KeyEvent.VK_SHIFT);

        if (shifter[0]) {
            keyboarda.keyPressed(KeyEvent.VK_SHIFT);

        }
        keyboarda.keyPressed(eventArray[0]);
        autotyper = 1;

    }

    public void keyType(String textinput) {

        Switches.blockKeyboard = true;
        readkey = 0;
        eventArray = new int[textinput.length()];
        shifter = new boolean[textinput.length()];

        for (int i = 0; i
                < textinput.length(); i++) {
            eventArray[i] = convertCharToVK(textinput.charAt(i));
            shifter[i] = shift;

        }
        keyboarda.keyReleased(KeyEvent.VK_ALT_GRAPH);
        keyboarda.keyReleased(KeyEvent.VK_CONTROL);
        keyboarda.keyReleased(KeyEvent.VK_SHIFT);

        if (shifter[0]) {
            keyboarda.keyPressed(KeyEvent.VK_SHIFT);

        }
        keyboarda.keyPressed(eventArray[0]);
        autotyper = 1;

    }
    /**
     * This should really be done using CPC key codes and overriding the
     * keepRelay returned in readPort for the PSG port read.
     */
    protected static final int[] ASC_TO_KEY = {
        KeyEvent.VK_SPACE, KeyEvent.VK_1, KeyEvent.VK_2, KeyEvent.VK_3, // SPACE !"#   FTTT
        KeyEvent.VK_4, KeyEvent.VK_5, KeyEvent.VK_6, KeyEvent.VK_7, // $%&'        TTTT
        KeyEvent.VK_8, KeyEvent.VK_9, KeyEvent.VK_SEMICOLON, KeyEvent.VK_QUOTE, // ()*+        TTTT
        KeyEvent.VK_COMMA, KeyEvent.VK_MINUS, KeyEvent.VK_PERIOD, KeyEvent.VK_SLASH, // ,-./        FFFF
        KeyEvent.VK_0, KeyEvent.VK_1, KeyEvent.VK_2, KeyEvent.VK_3, // 0123        FFFF
        KeyEvent.VK_4, KeyEvent.VK_5, KeyEvent.VK_6, KeyEvent.VK_7, // 4567        FFFF
        KeyEvent.VK_8, KeyEvent.VK_9, KeyEvent.VK_SEMICOLON, KeyEvent.VK_QUOTE, // 89:;        FFFF
        KeyEvent.VK_COMMA, KeyEvent.VK_MINUS, KeyEvent.VK_PERIOD, KeyEvent.VK_SLASH, // <=>?        TTTT
        KeyEvent.VK_OPEN_BRACKET, KeyEvent.VK_A, KeyEvent.VK_B, KeyEvent.VK_C, // @ABC        FTTT
        KeyEvent.VK_D, KeyEvent.VK_E, KeyEvent.VK_F, KeyEvent.VK_G, // DEFG        TTTT
        KeyEvent.VK_H, KeyEvent.VK_I, KeyEvent.VK_J, KeyEvent.VK_K, // HIJK        TTTT
        KeyEvent.VK_L, KeyEvent.VK_M, KeyEvent.VK_N, KeyEvent.VK_O, // LMNO        TTTT
        KeyEvent.VK_P, KeyEvent.VK_Q, KeyEvent.VK_R, KeyEvent.VK_S, // PQRS        TTTT
        KeyEvent.VK_T, KeyEvent.VK_U, KeyEvent.VK_V, KeyEvent.VK_W, // TUVW        TTTT
        KeyEvent.VK_X, KeyEvent.VK_Y, KeyEvent.VK_Z, KeyEvent.VK_ALT_GRAPH, // XYZ[        TTTF
        KeyEvent.VK_BACK_SLASH, KeyEvent.VK_CLOSE_BRACKET, KeyEvent.VK_EQUALS, KeyEvent.VK_0, // \]^_        FFFT
        KeyEvent.VK_BACK_SLASH, KeyEvent.VK_A, KeyEvent.VK_B, KeyEvent.VK_C, // `abc        TFFF
        KeyEvent.VK_D, KeyEvent.VK_E, KeyEvent.VK_F, KeyEvent.VK_G, // defg        FFFF
        KeyEvent.VK_H, KeyEvent.VK_I, KeyEvent.VK_J, KeyEvent.VK_K, // hijk        FFFF
        KeyEvent.VK_L, KeyEvent.VK_M, KeyEvent.VK_N, KeyEvent.VK_O, // lmno        FFFF
        KeyEvent.VK_P, KeyEvent.VK_Q, KeyEvent.VK_R, KeyEvent.VK_S, // pqrs        FFFF
        KeyEvent.VK_T, KeyEvent.VK_U, KeyEvent.VK_V, KeyEvent.VK_W, // tuvw        FFFF
        KeyEvent.VK_X, KeyEvent.VK_Y, KeyEvent.VK_Z, KeyEvent.VK_ALT_GRAPH, // xyz{        FFFT
        KeyEvent.VK_OPEN_BRACKET, KeyEvent.VK_CLOSE_BRACKET // |}          TT
    };
    protected static final String ASC_TO_SHIFT
            = "FTTTTTTTTTTTFFFFFFFFFFFFFFFFTTTTFTTTTTTTTTTTTTTTTTTTTTTTTTTFFFFTTFFFFFFFFFFFFFFFFFFFFFFFFFFTTT";

    public static int convertCharToVK(char in) {
        int result;

        switch (in) {
            case '\n':
                shift = false;
                result = KeyEvent.VK_ENTER;

                break;

            case '\u00A3':
                shift = true;
                result = KeyEvent.VK_EQUALS;

                break; // POUND SIGN

            default:
                if (in >= '\u0020' && in <= '\u007D') {
                    in -= 32;
                    result = ASC_TO_KEY[in];
                    shift = ASC_TO_SHIFT.charAt(in) == 'T';

                } else {
                    shift = false;
                    result = KeyEvent.CHAR_UNDEFINED;

                }
        }
        return result;

    }
    protected static final String SNA_HEADER = "MV - SNA";
    protected static final String SNP_HEADER = "MV - SNP";
    protected static final String SNK_HEADER = "MH - SNK CAPTURE";
    protected static final String SNKO_HEADER = "MV - SNK";
    protected static final String SNP_EYECATCHER = "JavaCPC " + jemu.ui.Main.version + jemu.ui.Main.subversion;
    protected static final String SNK_EYECATCHER = "JavaCPC Keyboard"
            + "   record file  ";
    protected static String SNK_FLOPPY_A = "empty";
    protected static String SNK_FLOPPY_B = "empty";
    protected static String BIN_HEADER = "JAVACPC BIN";
    protected static String BIN_EYECATCHER = "File exported by"
            + "     JavaCPC    ";
    protected static String SNA_EYECATCHER = "JavaCPC Snapshot";
    protected static final String k64 = "64k Snapshot    ";
    protected static final String k128 = "128k Snapshot   ";
    protected static final String k256 = "320k Snapshot   ";
    protected static final String k512 = "576k Snapshot   ";
    protected static final String k4096 = "4MB Snapshot    ";
    protected static final String DSK_HEADER = "MV - CPC";
    protected static final String DSK_HEADER_EXT = "EXTENDED";
    protected static final String CDT_HEADER = "ZXTAPE";
    protected static final int CRTC_FLAG_VSYNC_ACTIVE = 0x01;
    protected static final int CRTC_FLAG_HSYNC_ACTIVE = 0x02;
    protected static final int CRTC_FLAG_HDISP_ACTIVE = 0x04;
    protected static final int CRTC_FLAG_VDISP_ACTIVE = 0x08;
    protected static final int CRTC_FLAG_HTOT_REACHED = 0x10;
    protected static final int CRTC_FLAG_VTOT_REACHED = 0x20;
    protected static final int CRTC_FLAG_MAXIMUM_RASTER_COUNT_REACHED = 0x40;
    protected static final int SNAPSHOT_ID = 0x0000;
    protected static final int VERSION = 0x0010;
    protected static final int AF = 0x0011;
    protected static final int BC = 0x0013;
    protected static final int DE = 0x0015;
    protected static final int HL = 0x0017;
    protected static final int R = 0x0019;
    protected static final int I = 0x001a;
    protected static final int IFF1 = 0x001b;
    protected static final int IFF2 = 0x001c;
    protected static final int IX = 0x001d;
    protected static final int IY = 0x001f;
    protected static final int SP = 0x0021;
    protected static final int PC = 0x0023;
    protected static final int IM = 0x0025;
    protected static final int AF1 = 0x0026;
    protected static final int BC1 = 0x0028;
    protected static final int DE1 = 0x002a;
    protected static final int HL1 = 0x002c;
    protected static final int GA_PEN = 0x002e;
    protected static final int GA_INKS = 0x002f;
    protected static final int GA_ROM = 0x0040;
    protected static final int GA_RAM = 0x0041;
    protected static final int CRTC_REG = 0x0042;
    protected static final int CRTC_REGS = 0x0043;
    protected static final int UPPER_ROM = 0x0055;
    protected static final int PPI_A = 0x0056;
    protected static final int PPI_B = 0x0057;
    protected static final int PPI_C = 0x0058;
    protected static final int PPI_CONTROL = 0x0059;
    protected static final int PSG_REG = 0x005a;
    protected static final int PSG_REGS = 0x005b;
    protected static final int MEM_SIZE = 0x006b;
    protected static final int CPC_TYPE = 0x006d;
    protected static final int PLAY_CITY_A = 0x00BA;
    protected static final int PLAY_CITY_B = 0x00CE;
    protected static final int CRTC = 0x0070;

    /*
     * protected static final int VER_INT_BLOCK = 0x006d; protected static final
     * int VER_MODES = 0x006e;
     */
    protected static final int HEADER_SIZE = 0x0100;

    @Override
    public void loadFile(int type, String name) throws Exception {
        hasMP3 = false;
        mp3loaded = false;
        if (name.equals("empty") || name.length() < 1) {
            return;
        }
        restoreScreen();
        Switches.name = name;
//      if (!Switches.loaded)
        System.out.println("opening: " + name);
        byte[] data = null;
        try {
            data = getFile(name);
        } catch (NullPointerException e) {
            return;
        }
        if (data.length < 1) {
            return;
        }
        if (name.toLowerCase().endsWith(".sample")) {
            Switches.booter = 1;
            RAW_Load(data);
            jemu.ui.JEMU.isTape = true;
        } else if (name.toLowerCase().endsWith(".tap")) {
            Switches.booter = 0;
            loadTAP(data);
            jemu.ui.JEMU.isTape = true;
        } else if (name.toLowerCase().endsWith(".ani") || name.toLowerCase().endsWith(".anz")) {
            Switches.booter = 1;
            restoreMovie(name, data);
            jemu.ui.JEMU.isTape = true;
        } else if (SNA_HEADER.equals(new String(data, 0, SNA_HEADER.length()).toUpperCase())) {
            SNA_Load(name, data);
            System.out.println("Loading MV - SNA snapshot file...");
            jemu.ui.JEMU.isTape = true;
        } else if (SNK_HEADER.equals(new String(data, 0, SNK_HEADER.length()).toUpperCase())) {
            SNK_Load(name, data);
            System.out.println("Loading MH - SNK snapshot record file...");
            jemu.ui.JEMU.isTape = true;
        } else if (SNP_HEADER.equals(new String(data, 0, SNP_HEADER.length()).toUpperCase())) {
            SNP_Load(name, data, true);
            System.out.println("Loading MV - SNP snapshot record file...");
            jemu.ui.JEMU.isTape = true;
        } else if (name.toLowerCase().endsWith(".snp")) {
            SNP_Load(name, data, true);
            System.out.println("Loading MV - SNP snapshot record file...");
            jemu.ui.JEMU.isTape = true;
        } else if (SNKO_HEADER.equals(new String(data, 0, SNKO_HEADER.length()).toUpperCase())) {
            SNK_Load(name, data);
            System.out.println("Loading MV - SNP snapshot record file...");
            jemu.ui.JEMU.isTape = true;
        } else if (DSK_HEADER.equals(new String(data, 0, DSK_HEADER.length()).toUpperCase())) {
            DSK_Load(name, data);
            System.out.println("Loading MV - CPCEMU DSK file...");
        } else if (name.toLowerCase().endsWith(".dsk.png")) {
            this.LoadPNGDisk(name, data);
            System.out.println("Loading PNG Disk image file...");
        } else if (DSK_HEADER_EXT.equals(new String(data, 0, DSK_HEADER_EXT.length()).toUpperCase())) {
            DSK_Load(name, data);
            System.out.println("Loading EXTENDED CPC DSK file...");
        } else if (CDT_HEADER.equals(new String(data, 0, CDT_HEADER.length()).toUpperCase())) {
            System.out.println("Loading ZXTAPE file...");
            ids = null;
            blocks = null;
            CDT_Load(name, data);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
        } else if (WAV_HEADER.equals(new String(data, 0, WAV_HEADER.length()).toUpperCase())) {
            Switches.booter = 0;
            System.out.println("Loading WAV-tape file...");
            ids = null;
            blocks = null;
            TapeLoad(name, data);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
            TapeDrive.showText(TapeDrive.filename);
            jemu.ui.JEMU.isTape = true;
        } else if (YM_Header.equals(new String(data, 0, YM_Header.length()).toUpperCase()) || name.contains(".ym")) {
            jemu.ui.JEMU.isTape = true;
            System.out.println("Loading YM audio-file...");
            Switches.booter = 1;
            loadYM(unLHA(name), false);
            YM_Play = true;
        } else if (CSW_HEADER.equals(new String(data, 0, CSW_HEADER.length()))
                || name.toUpperCase().endsWith(".CSW")) {
            Switches.booter = 0;
            System.out.println("Loading CSW-compressed square wave tape file...");
            ids = null;
            blocks = null;
            CSWLoad(name, data);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
            TapeDrive.showText(TapeDrive.filename);
            jemu.ui.JEMU.isTape = true;
        } else if (MP3_HEADER_A.equals(new String(data, 0, MP3_HEADER_A.length()).toUpperCase())) {
            Switches.booter = 1;
            System.out.println("Loading and converting MP3 file...");
            ids = null;
            blocks = null;
            MP3Load(name);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
            TapeDrive.showText(TapeDrive.filename);
            jemu.ui.JEMU.isTape = true;
        } else if (MP3_HEADER_B.equals(new String(data, 0, MP3_HEADER_B.length()).toUpperCase())) {
            Switches.booter = 1;
            System.out.println("Loading and converting MP3 file...");
            ids = null;
            blocks = null;
            MP3Load(name);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
            TapeDrive.showText(TapeDrive.filename);
            jemu.ui.JEMU.isTape = true;
        } else if (name.toUpperCase().endsWith("MP3")) {
            Switches.booter = 1;
            System.out.println("Loading and converting MP3 file...");
            ids = null;
            blocks = null;
            MP3Load(name);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
            jemu.ui.JEMU.isTape = true;
            TapeDrive.showText(TapeDrive.filename);
        } else if (name.toUpperCase().endsWith("YM")) {
            Switches.booter = 1;
            System.out.println("Loading and converting YM file...");
            jemu.ui.JEMU.isTape = true;
            loadYM(unLHA(name), true);
            YM_Play = true;
        } else if (name.toUpperCase().endsWith("MFM")) {
            Switches.booter = 0;
            System.out.println("Loading KyroFluxDisk file...");
            loadKyroFluxDisk(name, data);
        } else if (name.toUpperCase().endsWith("WAV") || name.toUpperCase().endsWith("JTP")) {
            ids = null;
            blocks = null;
            TapeLoad(name, data);
            TapeDeck.tapeChanged = false;
            TapeDrive.buildTapeBlocks();
            TapeDrive.showText(TapeDrive.filename);
            jemu.ui.JEMU.isTape = true;
        } else if (!jemu.ui.JEMU.isTape) {
            BIN_Load(name, data);
        }
        reSync();
    }
    int sectorsize = 512;

    public void DSK2MFM() {
        byte[] data = null;
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Open DSK to convert...", FileDialog.LOAD);
        filedia.setFile("*.dsk");
        filedia.setVisible(true);
        String filename = filedia.getDirectory() + filedia.getFile();

        if (filedia.getFile() != null) {
            try {
                FileInputStream fin = new FileInputStream(filename);
                data = new byte[fin.available()];
                fin.read(data);
                fin.close();
                KryoFluxDisk.DskToI4(data, filename);
            } catch (Exception e) {
            }

        }
    }

    public void loadKyroFluxDisk(String name, byte[] data) {
        int result = 0;
        for (int i = 0; i < sectorsize; i++) {
            result += data[i] & 0x0ff;
        }
        boolean datadisk = false;
        result /= sectorsize;
        result &= 0x0ffff;
        System.out.println("MFM checksum: " + result);
        if (result == 141) {
            datadisk = false;
            System.out.println("CPM plus System");
        } else if (result == 122) {
            datadisk = false;
            System.out.println("CPM 2.2 System");
        } else if (result == 0xe5) {
            datadisk = false;
            System.out.println("System without bootblock");
        } else if ((data[0] & 0x0ff) != 0x0e5) {
            datadisk = true;
            System.out.println("DATA disk");
        } else {
            datadisk = false;
            System.out.println("Unknown system disk");
        }
        byte outFileData[] = new byte[194816];
        KryoFluxDisk.i4ToDsk(data, outFileData, datadisk);
        try {
            DSK_Load(name, outFileData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int[] getBlocks() {
        return blocks;

    }

    public static String[] getIDs() {
        return ids;

    }

    public void assemble(String file, String code) {
        if (argAssembler == null) {
            argAssembler = new EditorPanel(null, 0);
        }
        argAssembler.printInfo = true;
        argAssembler.asmFile = file;
        argAssembler.Assemble(code, false);
    }

    public void checkArgs() {
        if (drivea != null) {
            doargs = 1;
            loaddrivea = true;
        }
        if (assemblercode != null) {
            doargs = 1;
            assemblecode = true;
        }
        if (snapshot != null) {
            doargs = 1;
            loadsnapshot = true;
        }
        if (driveb != null) {
            doargs = 1;
            loaddriveb = true;

        }
        if (tape != null) {
            doargs = 1;
            loadtapedrive = true;

        }
        if (autotypetext != null) {
            doautotype = 1;

        }

    }

    protected EditorPanel argAssembler;

    public void doArgs() throws Exception {
        if (assemblercode != null) {
            assemblecode = false;
            byte[] data = this.getFile(assemblercode);
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < data.length; i++) {
                builder.append((char) (data[i] & 0x0ff));
            }
            argAssembler = new EditorPanel(null, 0);
            argAssembler.asmFile = assemblercode;
            argAssembler.printInfo = true;
            argAssembler.Assemble(builder.toString(), false);
        }
        if (drivea != null) {
            loaddrivea = false;
            byte[] data = this.getFile(drivea);
            DSK_Load(drivea, data, 0);
        }
        if (snapshot != null) {
            loadsnapshot = false;
            byte[] data = this.getFile(snapshot);
            SNA_Load(snapshot, data);
            snapshot = null;
        }
        if (driveb != null) {
            loaddriveb = false;
            byte[] data = this.getFile(driveb);
            DSK_Load(drivea, data, 1);
        }
        if (tape != null) {
            loadtapedrive = false;
            byte[] data = this.getFile(tape);
            CDT_Load(drivea, data);
        }
        if (bootdrive.equals("df0")) {
            bootDisk(0, true);
        }
        if (bootdrive.equals("df1")) {
            bootDisk(1, true);
        }
        if (bootdrive.equals("tape")) {
            tapestarttimer = 1;
        }
        resync = true;

    }
    protected int doautotype = 0;
    protected int doargs = 0;

    int frequency;

    public void CDT_Load(String name, byte[] data) throws Exception {
        if (loadtap) {
            this.unpatchOS();
        }
        loadtap = false;
        if (loadtapedrive) {
            return;

        }
        blocks = null;
        ids = null;
        tape_stereo = false;
        bitrate = 8;
        tapeloaded = false;
        jemu.ui.JEMU.isTape = true;

        int freq = 44100;

        if (Switches.khz44) {
            freq = 44100;

        }
        if (Switches.khz11) {
            freq = 11025;

        }
        if (!Switches.khz11 && !Switches.khz44) {
            freq = 22050;

        }
        frequency = freq;
        System.out.println("Converting CDT to " + freq + "hz WAV...");
        System.out.println("CDT size is:" + data.length);
        isCDT = true;
        Switches.booter = 0;

        tapesample = null;
        CDT2WAV cdt2wav = new CDT2WAV(data, freq);
        tapesample = cdt2wav.convert();

        if (tapesample == null) {
            tapesample = new byte[0]; // avoid tapesample being null

        }
        blocks = cdt2wav.blocks;
        ids = cdt2wav.ids;
        blocks[blocks.length - 1] = tapesample.length - 44;
        ids[ids.length - 1] = "Eject tape";
        cdt2wav.dispose();
        tape_delay = 1050000 / (freq);
        tapedelay = 1050000;

        tapeBandPosition = 0;

        tapePlay = true;

        if (Switches.FloppySound && !tapeloaded) {
            Samples.TAPEINSERT.play();

        }
        TapeDrive.pressPlay();
        tapeloaded = true;
        recordcount = tapesample.length;
        //  TapeDeck.positionslider.setMaximum(recordcount);
        //    TapeDeck.positionslider.setValue(0);
        System.out.println("Tape size is:" + tapesample.length + " bytes");
        TapeDrive.showText(TapeDrive.filename);
        reSync();

    }

    public void DSK_Load(String name, byte[] data, int drive) throws Exception {
        int i = getCurrentDrive();
        setCurrentDrive(drive);
        DSK_Load(name, data);
        setCurrentDrive(i);
    }

    public byte[] getDSKImage(int drive, int head) {
        byte[] dump = null;
        dump = fdc.getDrive(drive).getDisc(head).getImage();
//        System.out.println(Util.dumpBytes(dump));
        return dump;
    }

    public byte[] getDSKImage(int drive) {
        byte[] dump = null;
        dump = fdc.getDrive(drive).getDisc(0).getImage();
//        System.out.println(Util.dumpBytes(dump));
        return dump;
    }

    public void DSK_Load(String name, byte[] data) throws Exception {
        byte[] sector0 = new byte[512];
        System.arraycopy(data, 512, sector0, 0, 512);
        int result = 0;
        for (int i = 0; i < sectorsize; i++) {
            result += sector0[i] & 0x0ff;
        }
        result /= sectorsize;
        result &= 0x0ffff;
        System.out.println("DSK checksum:" + result);
        if (Switches.FloppySound && Switches.audioenabler == 1) {
            Samples.INSERT.play();
        }
        Switches.booter = 0;
        int drive = getCurrentDrive();
        disableSave[drive] = false;
        if (loaddrivea && drive == 0) {
            return;
        }
        if (loaddriveb && drive == 1) {
            return;
        }
        CPCDiscImage image = new CPCDiscImage(name, data);
        System.out.println("data length:" + data.length);
        if (drive == 0) {
            checkDF0();
            dskImageA = image;
            df0mod = false;
        }
        if (drive == 1) {
            checkDF1();
            dskImageB = image;
            df1mod = false;
        }
        if (drive == 2) {
            checkDF2();
            dskImageC = image;
            df2mod = false;
        }
        if (drive == 3) {
            checkDF3();
            dskImageD = image;
            df3mod = false;
        } //         fdc.setDrive(drive, floppies[drive] = new Drive(drive == 0 ? 1 : 2));

        floppies[drive].setSides(image.getNumberOfSides());
        int heads = image.getNumberOfSides() == 1 ? Drive.HEAD_0 : Drive.BOTH_HEADS;
        fdc.setDrive(drive, floppies[drive]);
        fdc.getDrive(drive).setDisc(heads, image);
        fdc.changeFloppyInDrive(drive);
        if (getCurrentDrive() == 0) {
            Switches.loaddrivea = name;
        }
        if (getCurrentDrive() == 1) {
            Switches.loaddriveb = name;
        }
        if (getCurrentDrive() == 2) {
            Switches.loaddrivec = name;
        }
        if (getCurrentDrive() == 3) {
            Switches.loaddrived = name;
        }
        if (Switches.inspector) {
            inspectdrive = drive;
            inspect = 1;
        }
        if (shouldBoot) {
            inspectdrive = drive;
            boot = 1;
        }
        reSync();
    }

    public void updateBox() {
        boolean sys = fdc.showSys;
        fdc.showSys = true;
        int drive = getCurrentDrive();
        overscanPaintBox.files = fdc.getInfo(drive);
        fdc.showSys = sys;

    }

    public String[] getDir() {
        return fdc.getInfo(0);
    }

    public void NormalupdateBox() {
        boolean sys = fdc.showSys;
        fdc.showSys = true;

        int drive = getCurrentDrive();
        normalPaintBox.files = fdc.getInfo(drive);
        fdc.showSys = sys;

    }
    byte[] codeo, coden;
    int snacount = 0;
    int snaocount = 0;

    public void loadNormalPaint2() {
        disableresync = true;
        if (coden == null) {
            coden = getRom("file/normalpaint.sna");
        }
        snacount = 1;
    }

    public void loadOverscanPaint2() {
        disableresync = true;
        if (codeo == null) {
            codeo = getRom("file/overscanpaint.sna");
        }
        snaocount = 1;
    }
//

    public void loadOverscanPaint() {
        if (codeo == null) {
            codeo = getRom("file/CODEOV.BIN", 935);
        }
        POKE(0x8fff, 20);

        for (int i = 0; i < codeo.length; i++) {
            POKE(0x9000 + i, codeo[i]);
        }
        runBinary(0x9000);

    }

    public void loadNormalPaint() {
        if (coden == null) {
            coden = getRom("file/CODENO.BIN", 935);

        }
        for (int i = 0x200; i < 0xa000; i++) {
            POKE(i, 0);

        }
        for (int i = 0; i < coden.length; i++) {
            POKE(0x9000 + i, coden[i]);
        }
        POKE(0x8fff, 0);
        runBinary(
                0x9000);

    }
    int[] rdiskbanks = {
        0xcc, 0xcd, 0xce, 0xcf,
        0xd4, 0xd5, 0xd6, 0xd7,
        0xdc, 0xdd, 0xde, 0xdf,
        0xe4, 0xe5, 0xe6, 0xe7,
        0xec, 0xed, 0xee, 0xef,
        0xf4, 0xf5, 0xf6, 0xf7,
        0xfc, 0xfd, 0xfe, 0xff
    };
    int[] banks = {
        0xc0, 0xc4, 0xc5, 0xc6, 0xc7, 0xcc, 0xcd, 0xce, 0xcf,
        0xd4, 0xd5, 0xd6, 0xd7, 0xdc, 0xdd, 0xde, 0xdf,
        0xe4, 0xe5, 0xe6, 0xe7, 0xec, 0xed, 0xee, 0xef,
        0xf4, 0xf5, 0xf6, 0xf7, 0xfc, 0xfd, 0xfe, 0xff,};

    private void RAW_Load(byte[] data) {
        int pos = 0;
        boolean mb4 = data.length > 589824 + 16384;
        int m = memory.getRAMBank();
        for (int i = 0; i < data.length; i += 0x4000) {
            if (mb4) {
                memory.set4MBRamBank(banks4mb[pos++]);
            } else {
                memory.setRAMBank(banks[pos++]);
            }
            for (int g = 0; g < 0x4000; g++) {
                POKE(0x4000 + g, data[i + g]);
            }
        }
        memory.setRAMBank(m);
    }

    protected int[] banks4mb = {
        0x7FC0, 0x7FC4, 0x7FC5, 0x7FC6, 0x7FC7, 0x7FCC, 0x7FCD, 0x7FCE, 0x7FCF, 0x7FD4,
        0x7FD5, 0x7FD6, 0x7FD7, 0x7FDC, 0x7FDD, 0x7FDE, 0x7FDF, 0x7FE4, 0x7FE5, 0x7FE6,
        0x7FE7, 0x7FEC, 0x7FED, 0x7FEE, 0x7FEF, 0x7FF4, 0x7FF5, 0x7FF6, 0x7FF7, 0x7FFC,
        0x7FFD, 0x7FFE, 0x7FFF, 0x7EC4, 0x7EC5, 0x7EC6, 0x7EC7, 0x7ECC, 0x7ECD, 0x7ECE,
        0x7ECF, 0x7ED4, 0x7ED5, 0x7ED6, 0x7ED7, 0x7EDC, 0x7EDD, 0x7EDE, 0x7EDF, 0x7EE4,
        0x7EE5, 0x7EE6, 0x7EE7, 0x7EEC, 0x7EED, 0x7EEE, 0x7EEF, 0x7EF4, 0x7EF5, 0x7EF6,
        0x7EF7, 0x7EFC, 0x7EFD, 0x7EFE, 0x7EFF, 0x7DC4, 0x7DC5, 0x7DC6, 0x7DC7, 0x7DCC,
        0x7DCD, 0x7DCE, 0x7DCF, 0x7DD4, 0x7DD5, 0x7DD6, 0x7DD7, 0x7DDC, 0x7DDD, 0x7DDE,
        0x7DDF, 0x7DE4, 0x7DE5, 0x7DE6, 0x7DE7, 0x7DEC, 0x7DED, 0x7DEE, 0x7DEF, 0x7DF4,
        0x7DF5, 0x7DF6, 0x7DF7, 0x7DFC, 0x7DFD, 0x7DFE, 0x7DFF, 0x7CC4, 0x7CC5, 0x7CC6,
        0x7CC7, 0x7CCC, 0x7CCD, 0x7CCE, 0x7CCF, 0x7CD4, 0x7CD5, 0x7CD6, 0x7CD7, 0x7CDc,
        0x7CDD, 0x7CDE, 0x7CDF, 0x7CE4, 0x7CE5, 0x7CE6, 0x7CE7, 0x7CEC, 0x7CED, 0x7CEE,
        0x7CEF, 0x7CF4, 0x7CF5, 0x7CF6, 0x7CF7, 0x7CFC, 0x7CFD, 0x7CFE, 0x7CFF, 0x7BC4,
        0x7BC5, 0x7BC6, 0x7BC7, 0x7BCC, 0x7BCD, 0x7BCE, 0x7BCF, 0x7BD4, 0x7BD5, 0x7BD6,
        0x7BD7, 0x7BDC, 0x7BDD, 0x7BDE, 0x7BDF, 0x7BE4, 0x7BE5, 0x7BE6, 0x7BE7, 0x7BEC,
        0x7BED, 0x7BEE, 0x7BEF, 0x7BF4, 0x7BF5, 0x7BF6, 0x7BF7, 0x7BFC, 0x7BFD, 0x7BFE,
        0x7BFF, 0x7AC4, 0x7AC5, 0x7AC6, 0x7AC7, 0x7ACC, 0x7ACD, 0x7ACE, 0x7ACF, 0x7AD4,
        0x7AD5, 0x7AD6, 0x7AD7, 0x7ADC, 0x7ADD, 0x7ADE, 0x7ADF, 0x7AE4, 0x7AE5, 0x7AE6,
        0x7AE7, 0x7AEC, 0x7AED, 0x7AEE, 0x7AEF, 0x7AF4, 0x7AF5, 0x7AF6, 0x7AF7, 0x7AFC,
        0x7AFD, 0x7AFE, 0x7AFF, 0x79C4, 0x79C5, 0x79C6, 0x79C7, 0x79CC, 0x79CD, 0x79CE,
        0x79CF, 0x79D4, 0x79D5, 0x79D6, 0x79D7, 0x79DC, 0x79DD, 0x79DE, 0x79DF, 0x79E4,
        0x79E5, 0x79E6, 0x79E7, 0x79EC, 0x79ED, 0x79EE, 0x79EF, 0x79F4, 0x79F5, 0x79F6,
        0x79F7, 0x79FC, 0x79FD, 0x79FE, 0x79FF, 0x78C4, 0x78C5, 0x78C6, 0x78C7, 0x78CC,
        0x78CD, 0x78CE, 0x78CF, 0x78D4, 0x78D5, 0x78D6, 0x78D7, 0x78DC, 0x78DD, 0x78DE,
        0x78DF, 0x78E4, 0x78E5, 0x78E6, 0x78E7, 0x78EC, 0x78ED, 0x78EE, 0x78EF, 0x78F4,
        0x78F5, 0x78F6, 0x78F7, 0x78FC, 0x78FD, 0x78FE, 0x78FF
    };
//protected int[] banks4mb2 = {
//        0x7CC0, 0x78FF, 0x78FE, 0x78FD, 0x78FC, 0x78F7, 0x78F6, 0x78F5, 0x78F4,
//        0x78EF, 0x78EE, 0x78ED, 0x78EC, 0x78E7, 0x78E6, 0x78E5, 0x78E4, 0x78DF,
//        0x78DE, 0x78DD, 0x78DC, 0x78D7, 0x78D6, 0x78D5, 0x78D4, 0x78CF, 0x78CE,
//        0x78CD, 0x78CC, 0x78C7, 0x78C6, 0x78C5, 0x78C4, 0x79FF, 0x79FE, 0x79FD,
//        0x79FC, 0x79F7, 0x79F6, 0x79F5, 0x79F4, 0x79EF, 0x79EE, 0x79ED, 0x79EC,
//        0x79E7, 0x79E6, 0x79E5, 0x79E4, 0x79DF, 0x79DE, 0x79DD, 0x79DC, 0x79D7,
//        0x79D6, 0x79D5, 0x79D4, 0x79CF, 0x79CE, 0x79CD, 0x79CC, 0x79C7, 0x79C6,
//        0x79C5, 0x79C4, 0x7AFF, 0x7AFE, 0x7AFD, 0x7AFC, 0x7AF7, 0x7AF6, 0x7AF5,
//        0x7AF4, 0x7AEF, 0x7AEE, 0x7AED, 0x7AEC, 0x7AE7, 0x7AE6, 0x7AE5, 0x7AE4,
//        0x7ADF, 0x7ADE, 0x7ADD, 0x7ADC, 0x7AD7, 0x7AD6, 0x7AD5, 0x7AD4, 0x7ACF,
//        0x7ACE, 0x7ACD, 0x7ACC, 0x7AC7, 0x7AC6, 0x7AC5, 0x7AC4, 0x7BFF, 0x7BFE,
//        0x7BFD, 0x7BFC, 0x7BF7, 0x7BF6, 0x7BF5, 0x7BF4, 0x7BEF, 0x7BEE, 0x7BED,
//        0x7BEC, 0x7BE7, 0x7BE6, 0x7BE5, 0x7BE4, 0x7BDF, 0x7BDE, 0x7BDD, 0x7BDC,
//        0x7BD7, 0x7BD6, 0x7BD5, 0x7BD4, 0x7BCF, 0x7BCE, 0x7BCD, 0x7BCC, 0x7BC7,
//        0x7BC6, 0x7BC5, 0x7BC4, 0x7CFF, 0x7CFE, 0x7CFD, 0x7CFC, 0x7CF7, 0x7CF6,
//        0x7CF5, 0x7CF4, 0x7CEF, 0x7CEE, 0x7CED, 0x7CEC, 0x7CE7, 0x7CE6, 0x7CE5,
//        0x7CE4, 0x7CDF, 0x7CDE, 0x7CDD, 0x7CDC, 0x7CD7, 0x7CD6, 0x7CD5, 0x7CD4,
//        0x7CCF, 0x7CCE, 0x7CCD, 0x7CCC, 0x7CC7, 0x7CC6, 0x7CC5, 0x7CC4, 0x7DFF,
//        0x7DFE, 0x7DFD, 0x7DFC, 0x7DF7, 0x7DF6, 0x7DF5, 0x7DF4, 0x7DEF, 0x7DEE,
//        0x7DED, 0x7DEC, 0x7DE7, 0x7DE6, 0x7DE5, 0x7DE4, 0x7DDF, 0x7DDE, 0x7DDD,
//        0x7DDC, 0x7DD7, 0x7DD6, 0x7DD5, 0x7DD4, 0x7DCF, 0x7DCE, 0x7DCD, 0x7DCC,
//        0x7DC7, 0x7DC6, 0x7DC5, 0x7DC4, 0x7EFF, 0x7EFE, 0x7EFD, 0x7EFC, 0x7EF7,
//        0x7EF6, 0x7EF5, 0x7EF4, 0x7EEF, 0x7EEE, 0x7EED, 0x7EEC, 0x7EE7, 0x7EE6,
//        0x7EE5, 0x7EE4, 0x7EDF, 0x7EDE, 0x7EDD, 0x7EDC, 0x7ED7, 0x7ED6, 0x7ED5,
//        0x7ED4, 0x7ECF, 0x7ECE, 0x7ECD, 0x7ECC, 0x7EC7, 0x7EC6, 0x7EC5, 0x7EC4,
//        0x7FFF, 0x7FFE, 0x7FFD, 0x7FFC, 0x7FF7, 0x7FF6, 0x7FF5, 0x7FF4, 0x7FEF,
//        0x7FEE, 0x7FED, 0x7FEC, 0x7FE7, 0x7FE6, 0x7FE5, 0x7FE4, 0x7FDF, 0x7FDE,
//        0x7FDD, 0x7FDC, 0x7FD7, 0x7FD6, 0x7FD5, 0x7FD4, 0x7FCF, 0x7FCE, 0x7FCD,
//        0x7FCC, 0x7FC7, 0x7FC6, 0x7FC5, 0x7FC4
//    };

    public void SNA_Load(String name, byte[] data) {
//        z80.stop();
        Switches.booter = 1;
        z80.setAF(getWord(data, AF));
        z80.setBC(getWord(data, BC));
        z80.setDE(getWord(data, DE));
        z80.setHL(getWord(data, HL));
        z80.setR(data[R]);
        z80.setI(data[I]);
        z80.setIFF1(data[IFF1] != 0);
        z80.setIFF2(data[IFF2] != 0);
        z80.setIX(getWord(data, IX));
        z80.setIY(getWord(data, IY));
        z80.setSP(getWord(data, SP));
        z80.setPC(getWord(data, PC));
        z80.setIM(data[IM]);
        z80.setAF1(getWord(data, AF1));
        z80.setBC1(getWord(data, BC1));
        z80.setDE1(getWord(data, DE1));
        z80.setHL1(getWord(data, HL1));

        gateArray.setSelectedInk(data[GA_PEN]);

        for (int i = 0; i < 0x11; i++) {
            gateArray.setInk(i, data[GA_INKS + i]);
        }

        gateArray.setModeAndROMEnable(memory, data[GA_ROM]);
        memory.setRAMBank(data[GA_RAM]);

        crtc.setSelectedRegister(data[CRTC_REG]);

        for (int i = 0; i < 18; i++) {
            crtc.setRegister(i, data[CRTC_REGS + i]);
        }
        memory.setUpperROM(data[UPPER_ROM]);

        ppi.setControl(data[PPI_CONTROL] & 0xff | 0x80);
        ppi.setOutputValue(PPI8255.PORT_A, data[PPI_A] & 0xff);
        ppi.setOutputValue(PPI8255.PORT_B, data[PPI_B] & 0xff);

        int portC = data[PPI_C] & 0xff;
        ppi.setOutputValue(PPI8255.PORT_C, portC);

        psg.setBDIR_BC2_BC1(PSG_VALUES[portC >> 6], ppi.readOutput(PPI8255.PORT_A));

        psg.reset();
        psg.setSelectedRegister(data[PSG_REG]);

        for (int i = 0; i < 14; i++) {
            psg.setRegister(i, data[PSG_REGS + i] & 0xff);

        }
        int checkplaycity = 0;
        for (int i = 0; i < 16; i++) {
            checkplaycity += (data[PLAY_CITY_A + i]) & 0x0ff;
        }
        if (checkplaycity > 0) {
            psg1.reset();
            psg1.resetRegisters();
            psg2.reset();
            psg2.resetRegisters();
            this.z84c30.reset();
            this.z84c30.counter = data[PLAY_CITY_A - 1];
            this.z84c30.docycle = data[PLAY_CITY_A - 2] != 0;

            psg1.setBDIR_BC2_BC1(PSG_VALUES[portC >> 6], ppi.readOutput(PPI8255.PORT_A));
            psg2.setBDIR_BC2_BC1(PSG_VALUES[portC >> 6], ppi.readOutput(PPI8255.PORT_A));
            psg1.setSelectedRegister(data[PLAY_CITY_A] & 0x0ff);
            for (int i = 0; i < 16; i++) {
                psg1.setRegister(i, data[PLAY_CITY_A + 1 + i] & 0x0ff);
            }
            psg2.setSelectedRegister(data[PLAY_CITY_B] & 0x0ff);
            for (int i = 0; i < 16; i++) {
                psg2.setRegister(i, data[PLAY_CITY_B + 1 + i] & 0x0ff);
            }
        }
        int crt = data[CRTC];

        if (crt > 0) {
            crtc.setCRTC(data[CRTC] - 1);
        }

        int memSize = getWord(data, MEM_SIZE) * 1024;
        SNAsize = 0x100 + memSize;

        if (memory.has4MB && memSize > 576 * 1024) {
            memSize = (64 + 4096) * 1024;
        } else if (memory.getRAMType() == CPCMemory.TYPE_64K && memSize > 0x10000) {
            memSize = 0x10000;
        } else if (memory.getRAMType() == CPCMemory.TYPE_128K && memSize > 0x20000) {
            memSize = 0x20000;
        } else if (memory.getRAMType() == CPCMemory.TYPE_256K && memSize > 320 * 1024) {
            memSize = 320 * 1024;
        } else if (memory.getRAMType() == CPCMemory.TYPE_512K && memSize > 576 * 1024) {
            memSize = 576 * 1024;
        }

        byte[] mem = memory.getMemory();
        System.arraycopy(data, 0x100, mem, 0, memSize);
//        System.arraycopy(data, 0x100, gateArray.screenmemory, 0, 0x10000);
//        start();

    }

    private void SNA_Play(String name, byte[] data) {
        z80.setAF(getWord(data, AF));
        z80.setBC(getWord(data, BC));
        z80.setDE(getWord(data, DE));
        z80.setHL(getWord(data, HL));
        z80.setR(data[R]);
        z80.setI(data[I]);
        z80.setIFF1(data[IFF1] != 0);
        z80.setIFF2(data[IFF2] != 0);
        z80.setIX(getWord(data, IX));
        z80.setIY(getWord(data, IY));
        z80.setSP(getWord(data, SP));
        z80.setPC(getWord(data, PC));
        z80.setIM(data[IM]);
        z80.setAF1(getWord(data, AF1));
        z80.setBC1(getWord(data, BC1));
        z80.setDE1(getWord(data, DE1));
        z80.setHL1(getWord(data, HL1));

        gateArray.setSelectedInk(data[GA_PEN]);

//        System.err.println("Palette:");
        for (int i = 0; i < 0x11; i++) {
            gateArray.setInk(i, data[GA_INKS + i]);
//            System.err.print(data[GA_INKS + i] + ",");
        }
//        System.err.println("");

        gateArray.setModeAndROMEnable(memory, data[GA_ROM]);
        memory.setRAMBank(data[GA_RAM]);

        crtc.setSelectedRegister(data[CRTC_REG]);

        for (int i = 0; i
                < 18; i++) {
            crtc.setRegister(i, data[CRTC_REGS + i]);

        }
        memory.setUpperROM(data[UPPER_ROM]);

        ppi.setControl(data[PPI_CONTROL] & 0xff | 0x80);
        ppi.setOutputValue(PPI8255.PORT_A, data[PPI_A] & 0xff);
        ppi.setOutputValue(PPI8255.PORT_B, data[PPI_B] & 0xff);

        int portC = data[PPI_C] & 0xff;
        ppi.setOutputValue(PPI8255.PORT_C, portC);

        psg.setBDIR_BC2_BC1(PSG_VALUES[portC >> 6], ppi.readOutput(PPI8255.PORT_A));

        psg.setSelectedRegister(data[PSG_REG]);

        for (int i = 0; i
                < 14; i++) {
            psg.setRegister(i, data[PSG_REGS + i] & 0xff);

        }
        int crt = data[CRTC];

        if (crt > 0) {
            crtc.setCRTC(data[CRTC] - 1);

        }

        int memSize = getWord(data, MEM_SIZE) * 1024;
        SNAsize = 0x100 + memSize;

        if (memory.getRAMType() == CPCMemory.TYPE_64K && memSize > 0x10000) {
            memSize = 0x10000;

        } else if (memory.getRAMType() == CPCMemory.TYPE_128K && memSize > 0x20000) {
            memSize = 0x20000;

        } else if (memory.getRAMType() == CPCMemory.TYPE_256K && memSize > 320 * 1024) {
            memSize = 320 * 1024;

        } else if (memory.getRAMType() == CPCMemory.TYPE_512K && memSize > 576 * 1024) {
            memSize = 576 * 1024;

        }

        byte[] mem = memory.getMemory();
        System.arraycopy(data, 0x100, mem, 0, memSize);
        System.arraycopy(data, 0x100, gateArray.screenmemory, 0, 0x10000);

    }
    private int SNAsize;
    public static boolean playSNP = false;
    private byte[] keys = null;
    private byte[] snpbyte;
    private String snpname;

    private void SNP_Load(String name, byte[] data, boolean showinfo) {
        System.out.println("Recorded data file opened");
        reloadsnp = false;
        snpname = name;
        snpbyte = data;

        int memSize = getWord(data, MEM_SIZE) * 1024;
        SNAsize = 0x100 + memSize;

        byte[] s = new byte[SNAsize];
        System.arraycopy(data, 0, s, 0, SNAsize);

        int keylength = data.length - SNAsize;
        keys = new byte[keylength];
        System.arraycopy(data, SNAsize, keys, 0, keylength);

        byte[] info = new byte[32];
        System.arraycopy(data, 0xe0, info, 0, 32);
        String inf = "";

        int p = 0;

        try {
            while (info[p] != 0) {
                inf += (char) info[p];
                p++;

            }

        } catch (Exception e) {
        }
        if (showinfo) {
            JOptionPane.showMessageDialog(new Frame(), "Recorded with " + inf);

        }
        memory.reset();
        z80.reset();
        SNA_Load("buffer", s);
        playSNP = true;
        keyOffset = 0;
        FrameCount = 0;
        GetFrameCount();
        keytime = 0;

    }
    private int keyOffset = 0;
    private int FrameCount = 0;
    private int numKeys;
    private int time;
    private boolean reloadsnp = false;

    private void SetKeys() {
        numKeys = (int) keys[keyOffset++] & 0x0ff;
        while (numKeys > 0) {
            numKeys--;
            getKeyboard().processKey(keys[keyOffset++]);
        }
    }

    private void UpdateSNP(boolean loop) {
        if (playSNP) {
            FrameCount--;
            if (FrameCount <= 0) {
                try {
                    SetKeys();
                    GetFrameCount();
                } catch (Exception e) {
                    for (int i = 0; i <= 127; i++) {
                        getKeyboard().ReleaseKey((byte) i);
                    }
                    playSNP = false;
                    if (loop) {
                        reloadsnp = true;
                    }
                }
            }
        } else if (StoreSNP) {
            StoreSNP();
        }
    }

    private void GetFrameCount() {
        if ((time = keys[keyOffset++] & 0x0ff) != 0) {
            FrameCount = (time);
            return;
        }
        FrameCount = getDWord(keys, keyOffset);
        keyOffset += 4;
    }
    private byte[] keybytes = null;
    private BufferedOutputStream snpout = null;
    private int snpcounter = 0;
    public static boolean StoreSNP = false;

    public void SNP_Save() {
        snpCapture = true;
    }

    private void SNP_Capture() {
        try {
            if (snpout != null) {
                return;
            }
            byte[] sna = getSNA(512);
            snpcounter = 0;
            String catcher = SNP_EYECATCHER;
            for (int i = 0; i
                    < 19; i++) {
                catcher += (char) 0;
            }
            System.arraycopy(SNP_HEADER.getBytes("UTF-8"), 0, sna, 0, SNP_HEADER.length());
            System.arraycopy(catcher.getBytes("UTF-8"), 0, sna, 0xe0, catcher.length());
            if (snpout == null) {
                File snpfile = new File("output.snp");
                String add = "_";
                int ad = 0;
                while (snpfile.exists()) {
                    snpfile = new File("output" + add + ad++ + ".snp");
                }
                snpout = new BufferedOutputStream(new FileOutputStream(snpfile));
                snpout.write(sna);
                StoreSNP = true;
                keytime = 0;
                getKeyboard().initBytes();
            }
        } catch (final IOException iox) {
            iox.printStackTrace();
        }
    }

    public void SNP_Stop() {
        if (snpout != null) {
            try {
                snpout.close();
            } catch (final IOException iox) {
            }
        }
        snpout = null;
        StoreSNP = false;
    }

    private void StoreSNP() {
        try {
            snpcounter++;
            keybytes = getKeyboard().getKeyNum();
            if (keybytes.length > 0) {
                if (snpcounter < 256) {
                    snpout.write(snpcounter);
                } else {
                    snpout.write(0);
                    byte[] leng = new byte[4];
                    putDWord(
                            leng, 0, snpcounter);
                    snpout.write(leng);
                }
                snpout.write(keybytes.length);
                snpout.write(keybytes);
                snpcounter = 0;
            }
        } catch (IOException e) {
        }
    }

    public void SNK_Load(String name, byte[] data) {
        Switches.booter = 1;
        totalKeyNumber = getDWord(data, 20);
        int f1l = getDWord(data, 40);
        int f2l = getDWord(data, 50);
        int rl = getDWord(data, 60);
        byte[] ram = new byte[rl];
        byte[] f1 = new byte[f1l];
        byte[] f2 = new byte[f2l];
        System.arraycopy(data, 0x100 + totalKeyNumber, f1, 0, f1l);
        System.arraycopy(data, 0x100 + totalKeyNumber + f1l, f2, 0, f2l);
        System.arraycopy(data, 0x100 + totalKeyNumber + f1l + f2l, ram, 0, rl);
        System.arraycopy(data, 0x100, keyStroke, 0, totalKeyNumber);
        String flop1 = "";
        String flop2 = "";
        for (int i = 0; i < f1.length; i++) {
            flop1 += (char) f1[i];
        }
        for (int i = 0; i < f2.length; i++) {
            flop2 += (char) f2[i];
        }
        Settings.set(Settings.DRIVE_FILE + Integer.toString(0), flop1);
        Settings.set(Settings.DRIVE_FILE + Integer.toString(1), flop2);
        updateDrive(0);
        updateDrive(1);
        SNA_Load("buffer", ram);
        System.out.println("Length is " + totalKeyNumber);
        playKeys();
    }
    byte[] buffSNA = null;
    public static boolean getbuff;

    public void restoreState() {
        try {
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(snapfile));
            buffSNA = new byte[bis.available()];
            bis.read(buffSNA);
            bis.close();
            restorebuf = true;

        } catch (Exception e) {
        }
    }
    private final File snapfile = new File(System.getProperty("user.home"), "/JavaCPC/savestate.sna");
    private boolean restorebuf = false;
    private boolean storebuf = false;

    public void storeState() {
        storebuf = true;

    }

    protected void stoSNA() {
        buffSNA = getSNA(512);
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(snapfile));
            bos.write(buffSNA);
            bos.close();

        } catch (Exception e) {
        }
    }

    public void SNK_Save() {
        SNK_FLOPPY_A = Settings.get(Settings.DRIVE_FILE + Integer.toString(0), "empty");
        SNK_FLOPPY_B = Settings.get(Settings.DRIVE_FILE + Integer.toString(1), "empty");

        FileDialog filedia = new FileDialog((Frame) new Frame(), "Save SNK Snapshot File", FileDialog.SAVE);
        if (Switches.uncompressed) {
            filedia.setFile("*.snk");
        } else {
            filedia.setFile("*.szk");
        }
        filedia.setVisible(true);
        String filename = filedia.getFile();
        if (filename != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            String savename = filename;
            File file = new File(savename);
            try {
                byte[] ram = buffSNA;
                byte[] flopa = SNK_FLOPPY_A.getBytes("UTF-8");
                byte[] flopb = SNK_FLOPPY_B.getBytes("UTF-8");
                int len = 0;
                if (ram != null) {
                    len += ram.length;
                }
                if (flopa != null) {
                    len += flopa.length;
                }
                if (flopb != null) {
                    len += flopb.length;
                }
                byte[] data = new byte[0x0100 + totalKeyNumber + len];
                try {
                    System.arraycopy(SNK_HEADER.getBytes("UTF-8"), 0, data, 0, SNK_HEADER.length());
                } catch (final Exception iox) {
                }
                try {
                    System.arraycopy(SNK_EYECATCHER.getBytes("UTF-8"), 0, data, 0xe0, SNK_EYECATCHER.length());

                } catch (final Exception iox) {
                }
                System.out.println("Length is " + totalKeyNumber);
                putDWord(data, 40, flopa.length);
                putDWord(data, 50, flopb.length);
                putDWord(data, 60, ram.length);
                putDWord(data, 20, totalKeyNumber);
                System.arraycopy(keyStroke, 0, data, 0x0100, totalKeyNumber);
                System.arraycopy(flopa, 0, data, 0x0100 + totalKeyNumber, flopa.length);
                System.arraycopy(flopb, 0, data, 0x0100 + totalKeyNumber + flopa.length, flopb.length);
                System.arraycopy(ram, 0, data, 0x0100 + totalKeyNumber + flopa.length + flopb.length, ram.length);
                try {
                    Thread.sleep(200);
                } catch (Exception cantsleep) {
                }
                if (Switches.uncompressed) {
                    try {
                        savename = "";
                        if (!file.toString().toLowerCase().endsWith(".snk")) {
                            savename = savename + ".snk";
                        }
                        final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file + savename));
                        bos.write(data);
                        bos.close();
                    } catch (final IOException iox) {
                        System.out.println("can't write to file ");
                    }
                } else {
                    savename = "";
                    if (!file.toString().toLowerCase().endsWith(".szk")) {
                        savename = savename + ".szk";
                    }
                    File gzip_output = new File(file + savename);
                    GZIPOutputStream gzip_out_stream;
                    try {
                        FileOutputStream out = new FileOutputStream(gzip_output);
                        gzip_out_stream
                                = new GZIPOutputStream(new BufferedOutputStream(out));
                        gzip_out_stream.write(data, 0, data.length);
                        gzip_out_stream.close();
                    } catch (IOException e) {
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.exit(0);
            }
        }

    }

    public byte[] getSNA(int sizemem) {

        if (memory.getRAMType() == memory.TYPE_64K && sizemem > 64) {
            sizemem = 64;
        }
        if (memory.getRAMType() == memory.TYPE_128K && sizemem > 128) {
            sizemem = 128;
        }
        if (memory.getRAMType() == memory.TYPE_256K && sizemem > 256) {
            sizemem = 256;
        }

        int memSize = 0x10000;
        if (sizemem == 128) {
            memSize = 0x20000;
        }
        if (sizemem == 256) {
            memSize = 320 * 1024;
        }
        if (sizemem == 512) {
            memSize = 576 * 1024;
        }
        byte[] data = new byte[0x0100 + memSize];
        try {
            System.arraycopy(SNA_HEADER.getBytes("UTF-8"), 0, data, 0, SNA_HEADER.length());
        } catch (final IOException iox) {
        }
        String snasize = k64;
        if (sizemem == 64) {
            snasize = k64;
        }
        if (sizemem == 128) {
            snasize = k128;
        }
        if (sizemem == 256) {
            snasize = k256;
        }
        if (sizemem == 512) {
            snasize = k512;
        }
        if (sizemem == 4096) {
            snasize = k4096;
        }
        try {
            SNA_EYECATCHER = SNA_EYECATCHER + snasize;
            System.arraycopy(SNA_EYECATCHER.getBytes("UTF-8"), 0, data, 0xe0, SNA_EYECATCHER.length());
        } catch (final IOException iox) {
        }
        data[VERSION] = (byte) 1;

        // z80 registers
        putWord(data, AF, z80.getAF());
        putWord(data, BC, z80.getBC());
        putWord(data, DE, z80.getDE());
        putWord(data, HL, z80.getHL());
        data[R] = (byte) z80.getR();
        data[I] = (byte) z80.getI();
        data[IFF1] = (byte) z80.getIFF1();
        data[IFF2] = (byte) z80.getIFF2();
        putWord(data, IX, z80.getIX());
        putWord(data, IY, z80.getIY());
        putWord(data, SP, z80.getSP());
        putWord(data, PC, z80.getPC());
        data[IM] = (byte) z80.getIM();
        putWord(data, AF1, z80.getAF1());
        putWord(data, BC1, z80.getBC1());
        putWord(data, DE1, z80.getDE1());
        putWord(data, HL1, z80.getHL1());

        // inks and pens
        data[GA_PEN] = (byte) gateArray.getSelectedInk();
//        System.out.print("CPC Palette is: ");

        for (int i = 0; i < 0x11; i++) {
            data[GA_INKS + i] = (byte) gateArray.getInks(i);
            System.out.print((byte) gateArray.getInks(i) + ", ");
        }
        System.out.println();
        // CRTC registers
        data[CRTC_REG] = (byte) crtc.getSelectedRegister();
        for (int i = 0; i
                < 18; i++) {
            data[CRTC_REGS + i] = (byte) crtc.getReg(i);
        }
        data[CRTC] = (byte) (crtc.getCRTC() + 1);
        data[PPI_CONTROL] = (byte) ppi.getPORT_CONTROL();

//            data[PPI_A] = (byte) ppi.getOutputValue(PPI8255.PORT_A);
//            data[PPI_B] = (byte) ppi.getOutputValue(PPI8255.PORT_B);
//            data[PPI_C] = (byte) ppi.getOutputValue(PPI8255.PORT_C);
        data[PPI_A] = (byte) ppi.getPORT_A();
        data[PPI_B] = (byte) ppi.getPORT_B();
        data[PPI_C] = (byte) ppi.getPORT_C();
        data[PSG_REG] = (byte) psg.getSelectedRegister();
        for (int i = 0; i < 16; i++) {
            data[PSG_REGS + i] = (byte) psg.getRegister(i);
        }

        data[GA_ROM] = (byte) gateArray.getMode();
        data[GA_RAM] = (byte) (Pal16L8.getRAMBank());
        data[UPPER_ROM] = (byte) memory.getUpperROM();
        putWord(data, MEM_SIZE, 64);

        if (sizemem == 128) {
            putWord(data, MEM_SIZE, 128);
        }
        if (sizemem == 256) {
            putWord(data, MEM_SIZE, 320);
        }
        if (sizemem == 512) {
            putWord(data, MEM_SIZE, 576);
        }
        data[CPC_TYPE] = (byte) 2;
        byte[] mem = memory.getMemory();
        System.arraycopy(mem, 0, data, 0x0100, memSize);
        System.arraycopy(gateArray.screenmemory, 0, data, 0x0100, 0x10000);
        return data;
    }

    public boolean playcity = false;

    public void SNA_Save(int sizemem) {
        if (memory.getRAMType() == memory.TYPE_64K && sizemem > 64) {
            sizemem = 64;
        }
        if (memory.getRAMType() == memory.TYPE_128K && sizemem > 128) {
            sizemem = 128;
        }
        if (memory.getRAMType() == memory.TYPE_256K && sizemem > 256) {
            sizemem = 256;
        }
        if (memory.has4MB) {
            sizemem = 4096;
        }
        snap = true;
        // saveauto data to file
        Hold();
        int memSize = 0x10000;
        if (sizemem == 128) {
            memSize = 0x20000;
        }
        if (sizemem == 256) {
            memSize = 320 * 1024;
        }
        if (sizemem == 512) {
            memSize = 576 * 1024;
        }
        if (sizemem == 4096) {
            memSize = (64 + 4096) * 1024;
        }
        byte[] data = new byte[0x0100 + memSize];

        try {
            System.arraycopy(SNA_HEADER.getBytes("UTF-8"), 0, data, 0, SNA_HEADER.length());

        } catch (final IOException iox) {
        }
        String snasize = k64;

        if (sizemem == 64) {
            snasize = k64;

        }
        if (sizemem == 128) {
            snasize = k128;

        }
        if (sizemem == 256) {
            snasize = k256;

        }
        if (sizemem == 512) {
            snasize = k512;

        }
        if (sizemem == 4096) {
            snasize = k4096;

        }
        try {
            SNA_EYECATCHER = SNA_EYECATCHER + snasize;
            System.arraycopy(SNA_EYECATCHER.getBytes("UTF-8"), 0, data, 0xe0, SNA_EYECATCHER.length());

        } catch (final IOException iox) {
        }
        data[VERSION] = (byte) 1;

        // z80 registers
        putWord(data, AF, z80.getAF());
        putWord(data, BC, z80.getBC());
        putWord(data, DE, z80.getDE());
        putWord(data, HL, z80.getHL());
        data[R] = (byte) z80.getR();
        data[I] = (byte) z80.getI();
        data[IFF1] = (byte) z80.getIFF1();
        data[IFF2] = (byte) z80.getIFF2();
        putWord(data, IX, z80.getIX());
        putWord(data, IY, z80.getIY());
        putWord(data, SP, z80.getSP());
        putWord(data, PC, z80.getPC());
        data[IM] = (byte) z80.getIM();
        putWord(data, AF1, z80.getAF1());
        putWord(data, BC1, z80.getBC1());
        putWord(data, DE1, z80.getDE1());
        putWord(data, HL1, z80.getHL1());

//            putWord(data, AF, z80.getRegisterValue(1));
//            putWord(data, BC, z80.getRegisterValue(7));
//            putWord(data, DE, z80.getRegisterValue(5));
//            putWord(data, HL, z80.getRegisterValue(3));
//            data[R] = (byte) z80.getRegisterValue(14);
//            data[I] = (byte) z80.getRegisterValue(12);
//            data[IFF1] = (byte) z80.getIFF1();
//            data[IFF2] = (byte) z80.getIFF2();
//            putWord(data, IX, z80.getRegisterValue(9));
//            putWord(data, IY, z80.getRegisterValue(11));
//            putWord(data, SP, z80.getRegisterValue(10));
//            putWord(data, PC, z80.getRegisterValue(13));
//            data[IM] = (byte) z80.getIM();
//            putWord(data, AF1, z80.getRegisterValue(2));
//            putWord(data, BC1, z80.getRegisterValue(8));
//            putWord(data, DE1, z80.getRegisterValue(6));
//            putWord(data, HL1, z80.getRegisterValue(4));
        // inks and pens
        data[GA_PEN] = (byte) gateArray.getSelectedInk();
        System.out.print("CPC Palette is: ");

        for (int i = 0; i
                < 0x11; i++) {
            data[GA_INKS + i] = (byte) gateArray.getInks(i);
            System.out.print((byte) gateArray.getInks(i) + ", ");

        }
        System.out.println();
        // CRTC registers
        data[CRTC_REG] = (byte) crtc.getSelectedRegister();

        for (int i = 0; i
                < 18; i++) {
            data[CRTC_REGS + i] = (byte) crtc.getReg(i);

        }
        data[CRTC] = (byte) (crtc.getCRTC() + 1);
        data[PPI_CONTROL] = (byte) ppi.getPORT_CONTROL();

//            data[PPI_A] = (byte) ppi.getOutputValue(PPI8255.PORT_A);
//            data[PPI_B] = (byte) ppi.getOutputValue(PPI8255.PORT_B);
//            data[PPI_C] = (byte) ppi.getOutputValue(PPI8255.PORT_C);
        data[PPI_A] = (byte) ppi.getPORT_A();
        data[PPI_B] = (byte) ppi.getPORT_B();
        data[PPI_C] = (byte) ppi.getPORT_C();

        data[PSG_REG] = (byte) psg.getSelectedRegister();

        for (int i = 0; i < 16; i++) {
            data[PSG_REGS + i] = (byte) psg.getRegister(i);
        }

        data[GA_ROM] = (byte) gateArray.getMode();
        data[GA_RAM] = (byte) (Pal16L8.getRAMBank());

        data[UPPER_ROM] = (byte) memory.getUpperROM();
        putWord(data, MEM_SIZE, 64);

        if (sizemem == 128) {
            putWord(data, MEM_SIZE, 128);

        }
        if (sizemem == 256) {
            putWord(data, MEM_SIZE, 320);

        }
        if (sizemem == 512) {
            putWord(data, MEM_SIZE, 576);
        }
        if (sizemem == 4096) {
            putWord(data, MEM_SIZE, 4096 + 64);
        }
        data[CPC_TYPE] = (byte) 2;

        if (playcity) {
            data[PLAY_CITY_A - 1] = (byte) this.z84c30.getCounter();
            data[PLAY_CITY_A - 2] = (byte) (this.z84c30.getCycle() ? 0 : 1);
            data[PLAY_CITY_A] = (byte) psg1.getSelectedRegister();
            for (int i = 0; i < 16; i++) {
                data[PLAY_CITY_A + 1 + i] = (byte) psg1.getRegister(i);
            }
            data[PLAY_CITY_B] = (byte) psg1.getSelectedRegister();
            for (int i = 0; i < 16; i++) {
                data[PLAY_CITY_B + 1 + i] = (byte) psg2.getRegister(i);
            }
        }

        byte[] mem = memory.getMemory();
        System.arraycopy(mem, 0, data, 0x0100, memSize);
        System.arraycopy(gateArray.screenmemory, 0, data, 0x0100, 0x10000);

        FileDialog filedia = new FileDialog((Frame) new Frame(), "Save " + sizemem + "k Snapshot File", FileDialog.SAVE);

        if (Switches.uncompressed) {
            filedia.setFile("*.sna");
        } else {
            filedia.setFile("*.snz");
        }
        filedia.setVisible(true);
        String filename = filedia.getFile();

        if (filename != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            String savename = filename;
            File file = new File(savename);
            if (Switches.uncompressed) {
                try {
                    savename = "";

                    if (!file.toString().toLowerCase().endsWith(".sna")) {
                        savename = savename + ".sna";

                    }
                    final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file + savename));
                    bos.write(data);
//                    bos.write(fdc.getDrive(0).getDisc(0).getImage());
                    bos.close();

                } catch (final IOException iox) {
                    System.out.println("can't write to file ");

                }
            } else {
                savename = "";

                if (!file.toString().toLowerCase().endsWith(".snz")) {
                    savename = savename + ".snz";

                }
                File gzip_output = new File(file + savename);
                GZIPOutputStream gzip_out_stream;

                try {
                    FileOutputStream out = new FileOutputStream(gzip_output);
                    gzip_out_stream
                            = new GZIPOutputStream(new BufferedOutputStream(out));
                    gzip_out_stream.write(data, 0, data.length);
                    gzip_out_stream.close();

                } catch (IOException e) {
                }
            }
        }
        goOn();
        snap = false;
        filedia.dispose();
        reSync();

    }
    boolean snap;

    public int getPPI_A() {
        return ppi.getPORT_A();
    }

    public int getPPI_B() {
        return ppi.getPORT_B();

    }

    public int getPPI_C() {
        return ppi.getPORT_C();

    }

    public int getPPI_Control() {
        return ppi.getPORT_CONTROL();

    }

    public void tape_WAV_save() {
        if (tapesample == null || tapesample.length < 1000) {
            return;

        }
        if (recordcount >= 100) {
            FileDialog filedia = new FileDialog((Frame) new Frame(), "Export JavaCPC tape file...", FileDialog.SAVE);

            if (Switches.uncompressed) {
                if (TapeDeck.ascdt.isSelected() && TapeDeck.ascdt.isVisible()) {
                    filedia.setFile("*.cdt");
                } else {
                    filedia.setFile("*.wav");
                }

            } else {
                filedia.setFile("*.taz");

            }
            filedia.setVisible(true);
            String filename = filedia.getDirectory() + filedia.getFile();

            if (filename != null) {
                tape_WAV_save(filename);
                TapeDeck.tapeChanged = false;

            }
        }
    }

    public void CDT2WAV() {
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Open CDT to convert...", FileDialog.LOAD);
        filedia.setFile("*.cdt; *.tzx; *.zip");
        filedia.setVisible(true);
        String filename = filedia.getDirectory() + filedia.getFile();

        if (filedia.getFile() != null) {
            CDT2WAV(filename);

        }
    }

    public void tape_load() {
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Open Tape image...", FileDialog.LOAD);
        filedia.setFile("*.cdt; *.tzx; *.wav; *.csw; *.mp3; *.zip");
        filedia.setVisible(true);
        String filename = filedia.getDirectory() + filedia.getFile();

        if (filedia.getFile() != null) {
            setInfo(filename, true);

            try {
                loadFile(0, filename);
                Settings.set(Settings.TAPE_FILE, filename);
                Settings.setBoolean(Settings.LOADTAPE, true);
                TapeDeck.tapeChanged = false;
                TapeDrive.buildTapeBlocks();

            } catch (Exception e) {
            }
        }

    }

    public void setInfo(String name, boolean store) {
        int cutter = 0;
        for (int i = 0; i
                < name.length(); i++) {
            if ((name.charAt(i) == '/') || (name.charAt(i) == 0x05c)) {
                cutter = i + 1;

            }
        }
        name = name.substring(cutter);
        name = name.replaceAll("%20", " ");
        TapeDrive.setName(name);
        name = name.replaceAll("_", " ");
        TapeDrive.setInfo(name.substring(0, name.length() - 4), store);

    }

    public void CDT2WAV(String name) {
        try {
            byte[] data = getFile(name);
            CDT_Load(name, data);
            tape_WAV_save();

        } catch (Exception error) {
        }
    }

    public void tape_WAV_save(String filename) {
        if (tapesample.length < 1000) {
            return;

        }
        if (fromCapture) {
            fromCapture = false;
            Switches.khz44 = true;
            Switches.khz11 = false;
            tape_stereo = true;
            bitrate = 8;
        }
        if (Switches.uncompressed) {
            String cdt_name = filename;
            if (!cdt_name.toUpperCase().endsWith(".CDT")) {
                if (cdt_name.toLowerCase().endsWith(".wav")) {
                    cdt_name = cdt_name.substring(0, cdt_name.length() - 4);
                }
                cdt_name += ".cdt";
            }
            if (!filename.toUpperCase().endsWith(".WAV")) {
                filename = filename + ".wav";

            }

            try {
                final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filename));

                if (!WAV_HEADER.equals(new String(tapesample, 0, WAV_HEADER.length()).toUpperCase())) {
                    if (Switches.khz44) {
                        if (tape_stereo) {
                            WAV_HEADER_44KHz[22] = 2;
                            WAV_HEADER_44KHz[32] = 2;
                            putLong(WAV_HEADER_44KHz, 28, 88200);
                        }
                        putLong(WAV_HEADER_44KHz, 40, recordcount);
                        putLong(WAV_HEADER_44KHz, 4, 36 + recordcount);
                        for (int i = 0; i < 0x2c; i++) {
                            bos.write((byte) WAV_HEADER_44KHz[i]);
                        }
                    }
                    if (Switches.khz11) {
                        putLong(WAV_HEADER_11KHz, 40, recordcount);
                        putLong(WAV_HEADER_11KHz, 4, 36 + recordcount);
                        for (int i = 0; i < 0x2c; i++) {
                            bos.write((byte) WAV_HEADER_11KHz[i]);
                        }
                    }
                    if (!Switches.khz11 && !Switches.khz44) {
                        putLong(WAV_HEADER_22KHz, 40, recordcount);
                        putLong(
                                WAV_HEADER_22KHz, 4, 36 + recordcount);

                        for (int i = 0; i
                                < 0x2c; i++) {
                            bos.write((byte) WAV_HEADER_22KHz[i]);

                        }
                    }
                    for (int i = 0; i < recordcount; i++) {
                        bos.write(tapesample[i]);
                    }
                } else {
                    bos.write(tapesample);
                }
                bos.close();
                if (TapeDeck.ascdt.isSelected() && TapeDeck.ascdt.isVisible()) {
                    samp2cdt.SAMP2CDT(filename, cdt_name);
                    File a = new File(filename);
                    a.delete();
                } else {
                    cdt_name = filename;
                }
            } catch (final IOException iox) {
                System.out.println("can't write to file ");
            }
            try {
                loadFile(0, cdt_name);

                if (!cdt_name.toLowerCase().contains("buffer.wav")) {
                    setInfo(cdt_name, true);

                }
                Settings.set(Settings.TAPE_FILE, cdt_name);
                Settings.setBoolean(Settings.LOADTAPE, true);

            } catch (Exception error) {
            }
        } else {
            String savename = "";

            if (!filename.toLowerCase().endsWith(".taz")) {
                savename = savename + ".taz";

            }
            System.out.println("Saving to " + filename);
            File gzip_output = new File(filename + savename);
            GZIPOutputStream gzip_out_stream;

            try {
                FileOutputStream out = new FileOutputStream(gzip_output);
                gzip_out_stream
                        = new GZIPOutputStream(new BufferedOutputStream(out));

                if (!WAV_HEADER.equals(new String(tapesample, 0, WAV_HEADER.length()).toUpperCase())) {
                    if (Switches.khz44) {
                        putLong(WAV_HEADER_44KHz, 40, recordcount);

                        for (int i = 0; i
                                < 0x2c; i++) {
                            gzip_out_stream.write((byte) WAV_HEADER_44KHz[i]);

                        }
                    }
                    if (Switches.khz11) {
                        putLong(WAV_HEADER_11KHz, 40, recordcount);

                        for (int i = 0; i
                                < 0x2c; i++) {
                            gzip_out_stream.write((byte) WAV_HEADER_11KHz[i]);

                        }
                    }
                    if (!Switches.khz11 && !Switches.khz44) {
                        putLong(WAV_HEADER_22KHz, 40, recordcount);

                        for (int i = 0; i
                                < 0x2c; i++) {
                            gzip_out_stream.write((byte) WAV_HEADER_22KHz[i]);

                        }
                    }
                    for (int i = 0; i
                            < recordcount; i++) {
                        gzip_out_stream.write(tapesample[i]);

                    }
                } else {
                    gzip_out_stream.write(tapesample);

                }

                gzip_out_stream.close();

            } catch (IOException e) {
            }
        }

    }

    public void loadFile(byte[] data, int start) {
        if (SNA_HEADER.equals(new String(data, 0, SNA_HEADER.length()).toUpperCase())) {
            SNA_Load(name, data);
            return;
        }
        int pos = 0;
        int filetype = 2;
        int BasicEnd = 0;
        int filelength;
        if (this.CheckAMSDOS(data)) {
            if (start == 0) {
                start = getWord(data, 0x15);
                filelength = getWord(data, 0x18);
                BasicEnd = start + filelength;
                filetype = (data[0x12]);
            }
            pos = 0x80;
        }
        for (int i = pos; i < data.length; i++) {
            if (start < 0x10000) {
                POKE(start++, data[i]);
            }
        }
        if (filetype == 0) {
            if (Switches.ROM.equals("CPC6128")) {
                importBasic1_1(BasicEnd);

            }
            if (Switches.ROM.equals("CPC664")) {
                importBasic664(BasicEnd);

            }
            if (Switches.ROM.equals("CPC464")) {
                importBasic1_0(BasicEnd);
            }
        }
    }

    public void BIN_Load() {
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Import CPC file...", FileDialog.LOAD);
        filedia.setVisible(true);
        String filename = filedia.getFile();

        if (filename != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            BIN_Load(
                    filename, getFile(filename));

        }
    }

    public void BIN_Load(String name, byte[] data) {
        Switches.booter = 1;
        stop();

        int header = 0;

        int start = 0;

        int execaddress = 0;

        int BasicEnd = 0;
        String Sexc = "";

        byte filetype = 0;

        if (CheckAMSDOS(data)) {
            int startaddress = getWord(data, 0x15);
            execaddress = getWord(data, 0x1a);

            int filelength = getWord(data, 0x18);
            filetype = (data[0x12]);
            String ftype = "";
            //if(filetype == 0)
            //    filetype = 2;

            if (filetype == 0) {
                ftype = "BASIC";

            }
            if (filetype == 1) {
                ftype = "BASIC (protected)";

            }
            if (filetype == 2) {
                ftype = "BINARY";

            }
            if (filetype == 3) {
                ftype = "BINARY (protected)";

            }
            if (filetype == 4) {
                ftype = "IMAGE";

            }
            if (filetype == 5) {
                ftype = "IMAGE (protected)";

            }
            if (filetype == 6) {
                ftype = "ASCII";

            }
            if (filetype == 7) {
                ftype = "ASCII (protected)";

            }

            start = startaddress;
            String Sadr = Util.hex(start).substring(4);
            String Slen = Util.hex(filelength).substring(4);
            Sexc = Util.hex(execaddress).substring(4);
            BasicEnd = start + filelength;
            Object[] oheader = {"AMSDOS header found...\n\n"
                + "&" + Sadr + " - Load address\n"
                + "&" + Slen + " - File length\n"
                + "&" + Sexc + " - Exec. address\n\n"
                + "Filetype is: " + ftype + "\n\n"
                + "Enter load address:\n(Hexadecimal)"};

            String CNG_CHECK = new String(data, 0x8c, 0x0c);
            CNG = false;

            if (CNG_CHECK.equals(CNG_HEADER)) {
                CNG = true;

            }
            CNG_CHECK = null;
            CNGBIN = false;
            CNG_CHECK = new String(data, 0x80, 0x0c);

            if (CNG_CHECK.equals(CNG_HEADER)) {
                CNG = true;
                CNGBIN = true;

            }
            String selectedHeader = null;
            String bak = null;

            if (filetype == 0) {
                selectedHeader = "170";

            }
            if (filetype >= 1 && !CNG) {
                selectedHeader = JOptionPane.showInputDialog(new Frame(), oheader, Sadr);

            }
            if (selectedHeader == null) {
                start();
                return;

            }
            if (!selectedHeader.equals("")) {
                try {
                    start = Util.hexValue(selectedHeader);

                    if (start != Util.hexValue(Sadr)) {
                        execaddress = 0;

                    }
                } catch (final Exception iox) {
                    start();
                    return;

                }
            }
            header = 0x80;

        } else {
            String result;
            String CNG_CHECK = new String(data, 0x0c, 0x0c);
            CNG = false;

            if (CNG_CHECK.equals(CNG_HEADER)) {
                CNG = true;

            }
            CNGBIN = false;
            CNG_CHECK = null;
            CNG_CHECK = new String(data, 0x80, 0x0c);

            if (CNG_CHECK.equals(CNG_HEADER)) {
                CNG = true;
                CNGBIN = true;

            }
            if (!CNG) {
                result = JOptionPane.showInputDialog(new Frame(), "No AMSDOS header found...\n\n"
                        + "Please enter start address:\n(Hexadecimal)\n");

            } else {
                result = "100";

            }
            if (result == null) {
                start();
                return;

            }
            if (!result.equals("")) {
                try {
                    start = Util.hexValue(result);

                } catch (final Exception iox) {
                    start();
                    return;

                }
            } else {
                start();
                return;

            }
            header = 0x00;

        }
        System.out.println(start);

        int length = data.length;

        if (CheckAMSDOS(data)) {
            length -= 0x80;

        }
        int chb = memory.getRAMBank();

        if (start + length < 0x8001 && start > 0x3fff) {
            Object[] rbanks = {
                "C0", "C4", "C5", "C6", "C7", "CC", "CD", "CE", "CF",
                "D4", "D5", "D6", "D7", "DC", "DD", "DE", "DF",
                "E4", "E5", "E6", "E7", "EC", "ED", "EE", "EF",
                "F4", "F5", "F6", "F7", "FC", "FD", "FE", "FF"
            };
            String s = (String) JOptionPane.showInputDialog(
                    new JFrame(),
                    "Please choose ram bank:",
                    "Select",
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    rbanks,
                    "C0");
            System.out.println(s);

            if (s != null) {
                try {
                    memory.setRAMBank(Util.hexValue(s));

                } catch (Exception e) {
                }
            }

        }
        byte[] mem = memory.getMemory();

        int memSize = data.length;

        if ((start + (memSize - header)) >= 0x10001) {
            JOptionPane.showMessageDialog(null, "An error occured during importing file:\n" + "no or wrong start address entered...\n");

        } else {
//            System.arraycopy(data, header, mem, start, data.length - header);
//            try {
//                System.arraycopy(data, header, gateArray.screenmemory, start, data.length - header);
//            } catch (Exception e) {
//            }
            int addr = start;

            for (int i = header; i
                    < data.length; i++) {
                if (addr > 0xb7ff && addr < 0x0b900) {
                    firmwareErased = true;

                }
                POKE(addr++, data[i]);

            }
            System.out.println("Firmware has been disabled: " + firmwareErased);

        }
        if (CheckAMSDOS(data)) {
            if ((execaddress != 0 && !CNG) || (filetype == 0 && !CNG)) {
                if (filetype == 2) {
                    if (execaddress != 0 && (filetype >= 2 && filetype <= 3)) {
                        int ok = JOptionPane.showConfirmDialog(new Frame(), "Execute binary?",
                                "Please choose", JOptionPane.YES_NO_OPTION);

                        if (ok == JOptionPane.YES_OPTION) {
                            launch = execaddress;

                        } else {
                            start();
                            return;

                        }
                    }
                } else {
                    if (Switches.ROM.equals("CPC6128")) {
                        importBasic1_1(BasicEnd);

                    }
                    if (Switches.ROM.equals("CPC664")) {
                        importBasic664(BasicEnd);

                    }
                    if (Switches.ROM.equals("CPC464")) {
                        importBasic1_0(BasicEnd);

                    }
                    int ok = JOptionPane.showConfirmDialog(new Frame(), "Execute basic?\n(at your own risk)",
                            "Please choose", JOptionPane.YES_NO_OPTION);

                    if (ok == JOptionPane.YES_OPTION) {
                        executeBasic();
                        start();

                    } else {
                        start();
                        return;

                    } //AutoType("list\n");
                }
            }
        }
        if (CNG) {
            if (!CNGBIN) {
                if (execaddress == 0) {
                    execaddress = 0x130;

                }
                if (execaddress == 0x170) {
                    execaddress = 0x1a0;

                }
            } else {
                execaddress = 0x120;

            }
            runBinary(execaddress);

        }
        memory.setRAMBank(chb);
        start();
    }
    protected static boolean call = false;
    public static boolean firmwareErased = false;

    public void runBinary(int address) {
        if (firmwareErased) {
            memory.setLowerEnabled(false);
            z80.setPC(address);
        } else {
            POKE(0xfff8, 0x0E);
            POKE(0xfff9, 0xFF);
            POKE(0xfffa, 0x21);
            POKE(0xfffb, address & 0xFF);
            POKE(0xfffc, (address / 256) & 0xFF);
            POKE(0xfffd, 0xC3);
            POKE(0xfffe, 0x16);
            POKE(0xffff, 0xBD);
            call = true;
        }
        firmwareErased = false;
    }
    Baslist lister;

    public Baslist getBasLister() {
        if (lister == null) {
            lister = new Baslist();
        }
        return lister;
    }

    public String getBasList() {
        if (lister == null) {
            lister = new Baslist();
        }
        int siz = GateArray.cpc.getBasSize1_1();
        if (Switches.ROM.equals("CPC464")) {
            siz = GateArray.cpc.getBasSize1_0();
        }
//        System.out.println("Size is " + siz);
        int pos = 0x170;
        byte[] data = new byte[siz + 2];
        int d = 0;
        for (int i = pos; i < pos + siz; i++) {
            data[d++] = (byte) GateArray.cpc.memory.readWriteByte(i);
        }
        try {
            return lister.LIST(data);
        } catch (Exception e) {
            return "";
        }
    }

    /*
     * java.awt.EventQueue.invokeLater(new Runnable() { public void run() {
     * CALL(0xBF00); } });
     */
    public int getBasSize1_0() {
        int a = PEEK(0x0ae83);
        int b = PEEK(0x0ae84);
        String c = "" + Util.hex((byte) b) + Util.hex((byte) a);
        try {
            return Util.hexValue(c) - 0x170;
        } catch (Exception e) {
        }
        return 0;
    }

    public int getBasSize1_1() {
        int a = PEEK(0x0ae66);
        int b = PEEK(0x0ae67);
        String c = "" + Util.hex((byte) b) + Util.hex((byte) a);
        try {
            return Util.hexValue(c) - 0x170;
        } catch (Exception e) {
        }
        return 0;
    }

    public void importBasic1_0(int BasicEnd) {
        POKE(0x0ae83, BasicEnd & 0x0ff);
        POKE(0x0ae84, (BasicEnd >> 8) & 0x0ff);
        POKE(0x0ae85, BasicEnd & 0x0ff);
        POKE(0x0ae86, (BasicEnd >> 8) & 0x0ff);
        POKE(0x0ae87, BasicEnd & 0x0ff);
        POKE(0x0ae88, (BasicEnd >> 8) & 0x0ff);

    }

    public void importBasic1_1(int BasicEnd) {
        POKE(0x0ae66, BasicEnd & 0x0ff);
        POKE(0x0ae67, (BasicEnd >> 8) & 0x0ff);
        POKE(0x0ae68, BasicEnd & 0x0ff);
        POKE(0x0ae69, (BasicEnd >> 8) & 0x0ff);
        POKE(0x0ae6a, BasicEnd & 0x0ff);
        POKE(0x0ae6b, (BasicEnd >> 8) & 0x0ff);
    }

    public void importBasic664(int BasicEnd) {
        POKE(0x0ae66, BasicEnd & 0x0ff);
        POKE(0x0ae67, (BasicEnd >> 8) & 0x0ff);
        POKE(0x0ae68, BasicEnd & 0x0ff);
        POKE(0x0ae69, (BasicEnd >> 8) & 0x0ff);
        POKE(0x0ae6a, BasicEnd & 0x0ff);
        POKE(0x0ae6b, (BasicEnd >> 8) & 0x0ff);
    }

    /*
     * LD C,&00 0E 00 LD HL,&EA78 21 78 EA JP &BD16 C3 16 BD
     */
    public void executeBasic() {
        POKE(0x0bf00, 0x0e);
        POKE(0x0bf01, 0x000);
        POKE(0x0bf02, 0x021);
        POKE(0x0bf03, 0x078);
        POKE(0x0bf04, 0x0ea);
        POKE(0x0bf05, 0x0c3);
        POKE(0x0bf06, 0x016);
        POKE(0x0bf07, 0x0bd);
        CALL(0x0bf00);
    }
    public static int launch = 90000;

    public void CALL(int address) {
        z80.setPC(address);

    }

    public void POKE() {
        int address = 0;

        int value = 0;

        JTextField Address = new JTextField();
        JTextField Value = new JTextField();
        Object[] message = {"Address", Address,
            "Value", Value};

        JOptionPane pane = new JOptionPane(message,
                JOptionPane.WARNING_MESSAGE,
                JOptionPane.OK_CANCEL_OPTION);

        pane.createDialog(null, "Poke Memory").setVisible(true);

        if (Address.getText().equals("")) {
            JOptionPane.showMessageDialog(null, "nothing poked...");

            return;

        }
        String Address1 = Address.getText();
        String Value1 = Value.getText();

        try {
            address = Util.hexValue(Address1);
            value = Util.hexValue(Value1);
            POKE(address, value);

        } catch (final Exception iox) {
            JOptionPane.showMessageDialog(null, "nothing poked...");

            return;

        }
    }

    public static void POKE(int address, int value) {
        memory.writeByte(address & 0x0FFFF, (byte) (value & 0x0FF));
        if (memory.getRAMBank() == 0xc0 || address < 0x4000 || address > 0x8000) {
            GateArray.screenmemory[address] = (byte) (value & 0xff);
        }
    }

    public void BIN_Export() {
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Export CPC file...", FileDialog.SAVE);
        filedia.setFile("*.bin");
        filedia.setVisible(true);
        String filename = filedia.getFile();

        if (filename != null) {
            String ss = filename.toUpperCase();

            if (ss.endsWith(".BIN")) {
                ss = ss.substring(0, (ss.length() - 4));

            }
            ss = ss + "             ";
            String newname = "";

            for (int i = 0; i
                    < 8; i++) {
                if (ss.charAt(i) != '.' && ss.charAt(i) != '_' && ss.charAt(i) != '-') {
                    newname = newname + ss.charAt(i);

                } else {
                    newname = newname + " ";

                }
            }
            BIN_HEADER = newname + "BIN";

            filename = filedia.getDirectory() + filedia.getFile();

            if (!filename.toLowerCase().endsWith(".bin")) {
                filename = filename + ".bin";

            }

            int address = 0;

            int length = 0;

            int exec = 0;

            JTextField Address = new JTextField();
            JTextField Startaddress = new JTextField();
            JTextField Exec = new JTextField();
            JTextField InternalName = new JTextField();
            InternalName.setText(BIN_HEADER);
            InternalName.setEditable(false);
            Object[] message = {"Internal name", InternalName, "Start address", Address,
                "Length", Startaddress, "Exec. address (optional)", Exec, AmHeader};

            JOptionPane pane = new JOptionPane(message,
                    JOptionPane.QUESTION_MESSAGE,
                    JOptionPane.OK_CANCEL_OPTION);

            pane.createDialog(null, "Export binary").setVisible(true);

            if (Address.getText().equals("") || Startaddress.getText().equals("")) {
                JOptionPane.showMessageDialog(null, "An error occurred...");

                return;

            }
            String Address1 = Address.getText();
            String Startaddress1 = Startaddress.getText();
            String Exec1 = Exec.getText();
            String intname = "";

            if (InternalName != null) {
                intname = InternalName.getText();

            }
            if (intname.length() == 11) {
                BIN_HEADER = intname;

            }

            if (Exec1 == null) {
                Exec1 = "0";

            }
            try {
                address = Util.hexValue(Address1);
                length = Util.hexValue(Startaddress1);
                exec = Util.hexValue(Exec1);
                BIN_Export(
                        filename, address, length, exec, amheader);

            } catch (final Exception iox) {
                JOptionPane.showMessageDialog(null, "An error occurred...");

                return;

            }
        }

    }

    public static void BIN_Export(String filename, int fileaddress, int filelength, int exaddress, boolean writeheader) {
        byte[] header = new byte[0x80];

        byte[] data = new byte[filelength];
        putWord(
                header, 0x15, fileaddress);
        putWord(
                header, 0x1a, exaddress);
        putWord(
                header, 0x18, filelength);
        putWord(
                header, 0x40, filelength);
        header[0x12] = 2;

        byte[] mem = memory.getMemory();

        try {
            System.arraycopy(BIN_HEADER.getBytes("UTF-8"), 0, header, 1, BIN_HEADER.length());
            System.arraycopy(BIN_EYECATCHER.getBytes("UTF-8"), 0, header, 0x60, BIN_EYECATCHER.length());

        } catch (final IOException iox) {
        }
        putWord(header, 67, ChecksumAMSDOS(header));
        System.arraycopy(mem, fileaddress, data, 0, filelength - 1);

        try {
            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filename));

            if (writeheader) {
                for (int i = 0; i
                        < 0x080; i++) {
                    bos.write(header[i]);

                }
            }
            for (int i = 0; i
                    < filelength; i++) {
                bos.write(data[i]);

            }
            bos.close();

        } catch (final IOException iox) {
        }
    }

    public class CheckBoxListener implements ItemListener {

        public void itemStateChanged(ItemEvent e) {
            if (e.getSource() == AmHeader) {
                if (e.getStateChange() == ItemEvent.DESELECTED) {
                    amheader = false;
                } else {
                    amheader = true;
                }
            }
            if (e.getSource() == YMInterleaved) {
                if (e.getStateChange() == ItemEvent.DESELECTED) {
                    YM_Interleaved = false;
                } else {
                    YM_Interleaved = true;
                }
            }
            if (e.getSource() == Overscan) {
                if (e.getStateChange() == ItemEvent.DESELECTED) {
                    soverscan = false;
                    AddressA.setEnabled(false);
                    AddressB.setEnabled(false);
                    AddressA.setText("");
                    AddressB.setText("C000");
                } else {
                    soverscan = true;
                    AddressA.setEnabled(true);
                    AddressB.setEnabled(true);
                    AddressA.setText("4000");
                    AddressB.setText("C000");
                }
            }
        }
    }

    @Override
    public void displayLostFocus() {
        keyboardb.reset();
        keyboarda.reset();
        keyboardn.reset();

    }

    @Override
    public Drive[] getFloppyDrives() {
        return floppies;

    }

    private static GridBagConstraints getGridBagConstraints(int x, int y, double weightx, double weighty,
            int width, int fill) {
        if (gbcConstraints == null) {
            gbcConstraints = new GridBagConstraints();

        }
        gbcConstraints.gridx = x;
        gbcConstraints.gridy = y;
        gbcConstraints.weightx = weightx;
        gbcConstraints.weighty = weighty;
        gbcConstraints.gridwidth = width;
        gbcConstraints.fill = fill;

        return gbcConstraints;

    }

    public static Color getCol(int pen) {
        Color colo = Palcols[GateArray.getInk(pen)];
        return colo;

    }

    public static Color getGCol(int pen) {
        Color colo = Greencols[GateArray.getInk(pen)];

        return colo;

    }

    public static JPanel showPalette() {
        JPanel Output = new JPanel();
        Output.setLayout(new GridBagLayout());

        for (int i = 0; i < 17; i++) {
            Palette[i] = "" + GateArray.getInk(i);
            String pals;
            pals = Palette[i];

            int cols;
            cols = GateArray.getInk(i);
            String hcols = "" + Util.hex((GateArray.getInks(i)));
            hcols = hcols.substring(6);
            String gcols = "" + Util.hex((GateArray.getInks(i) | 0x40));
            gcols = gcols.substring(6);

            if (GateArray.getInk(i) <= 9) {
                pals = "0" + pals;

            }
            int x = i;
            JButton Palettes = new JButton(pals);
            JButton Paletteg = new JButton(gcols);
            JButton Paletteh = new JButton(hcols);
            JPanel Paletten = new JPanel();
            Paletten.setPreferredSize(new Dimension(20, 20));
            Paletten.setSize(20, 20);
            Paletten.setBackground(Palcols[cols]);
            Paletten.setFocusable(false);
            Palettes.setFont(new Font("Monospaced", 1, 16));
            Palettes.setBorder(new EtchedBorder(EtchedBorder.LOWERED));
            Palettes.setFocusable(false);
            Paletteg.setFont(new Font("Monospaced", 1, 16));
            Paletteg.setBorder(new EtchedBorder(EtchedBorder.LOWERED));
            Paletteg.setFocusable(false);
            Paletteh.setFont(new Font("Monospaced", 1, 16));
            Paletteh.setBorder(new EtchedBorder(EtchedBorder.LOWERED));
            Paletteh.setFocusable(false);
            Output.add(Paletten, getGridBagConstraints(x, 1, 0.0, 0.0, 1, GridBagConstraints.BOTH));
            Output.add(Palettes, getGridBagConstraints(x, 2, 0.0, 0.0, 1, GridBagConstraints.BOTH));
            Output.add(Paletteg, getGridBagConstraints(x, 3, 0.0, 0.0, 1, GridBagConstraints.BOTH));
            Output.add(Paletteh, getGridBagConstraints(x, 4, 0.0, 0.0, 1, GridBagConstraints.BOTH));

        }

        BufferedImage images = new BufferedImage(384, 272, BufferedImage.SCALE_SMOOTH);
        images.getGraphics().drawImage(Display.image, 0, 0, 384, 272, null);
        JLabel Display = new JLabel(new ImageIcon(images));
        Output.add(Display, getGridBagConstraints(0, 5, 0.0, 0.0, 17, GridBagConstraints.BOTH));
        Output.setVisible(true);

        return Output;

    }

    public void saveScreen(String filename) {
        filename = filename + "        ";
        System.out.println("Saving screen");

        boolean plusmode = false;
        try {
            plusmode = normalPaintBox.getPlus();
        } catch (Exception e) {
        }
        if (!plusmode) {
            for (int i = 0; i < 16; i++) {
                POKE(0xd7d1 + i, (byte) GateArray.getInk(i));
            }
            for (int i = 0; i < SCR_CODE.length; i++) {
                POKE(0xc7d0 + i, (byte) SCR_CODE[i]);
            }
            for (int i = 0; i < FLIP_CODE.length; i++) {
                POKE(0xe7d0 + i, (byte) FLIP_CODE[i]);
            }
            POKE(0xd7d0, (byte) gateArray.getScreenMode());
        } else {
            for (int i = 0; i < CodeP0.length; i++) {
                POKE(0xc7d0 + i, (byte) CodeP0[i]);
            }
            for (int i = 0; i < CodeP1.length; i++) {
                POKE(0xcfd0 + i, (byte) CodeP1[i]);
            }
            for (int i = 0; i < CodeP3.length; i++) {
                POKE(0xdfd0 + i, (byte) CodeP3[i]);
            }
            for (int i = 0; i < FLIP_CODE.length; i++) {
                POKE(0xe7d0 + i, (byte) FLIP_CODE[i]);
            }
            int mode = gateArray.getScreenMode();
            byte mo = (byte) 0x8c;
            if (mode == 1) {
                mo = (byte) 0x8d;
            }
            if (mode == 2) {
                mo = (byte) 0x8e;
            }
            POKE(0xd7d0, mo);
            byte[] pluspal = normalPaintBox.getPlusPalette();
            System.arraycopy(pluspal, 0, GateArray.screenmemory, 0xd7d1, 32);
        }
        try {
            int ad2 = 0x21d;
            byte[] save = filename.getBytes("UTF-8");
            for (int i = 0x11d; i < 0x11d + 8; i++) {
                POKE(0x9000 + i, save[i - 0x11d]);
                POKE(0x9000 + ad2, save[i - 0x11d]);
                ad2++;
            }
        } catch (Exception e) {
        }
        POKE(0x8fff, 200);
        if (saveOCP) {
            writePal = 1;
        }
    }

    public void saveOverscanScreen(String filename) {
        filename = filename + "        ";
        System.out.println("Saving screen");

        boolean plusmode = false;
        try {
            plusmode = overscanPaintBox.getPlus();
        } catch (Exception e) {
        }
        if (!plusmode) {
            POKE(0x800, (byte) gateArray.getScreenMode());
            for (int i = 0; i < 16; i++) {
                POKE(0x801 + i, (byte) GateArray.getInk(i));
            }
        } else {
            int mode = gateArray.getScreenMode();
            byte mo = (byte) 0x8c;
            if (mode == 1) {
                mo = (byte) 0x8d;
            }
            if (mode == 2) {
                mo = (byte) 0x8e;
            }
            GateArray.screenmemory[0x800] = mo;
            POKE(0x800, mo);
        }
        try {
            int ad2 = 0x21d;
            byte[] save = filename.getBytes("UTF-8");
            for (int i = 0x11d; i < 0x11d + 8; i++) {
                POKE(0x9000 + i, save[i - 0x11d]);
                POKE(0x9000 + ad2, save[i - 0x11d]);
                ad2++;
            }
        } catch (Exception e) {
        }
        POKE(0x8fff, 200);
        if (saveOCP) {
            writePal = 1;
        }
    }

    public void exportScreen(boolean overscan) {
        boolean RETURN = false;
        AddressA.setText("4000");
        AddressB.setText("C000");
        Object[] object = {"You can set the screen-mode and inks\n"
            + "with a CALL &C7D0 after you loaded\n"
            + "an exported screen.\n"
            + "Please choose now:\n"
            + "YES:\nWait for a key before return to BASIC", "NO:\nReturn to BASIC after a CALL &C7D0\n\n", Overscan, "Start part A", AddressA, "Start part B", AddressB};
        Object[] objectb = {"You can set the screen-mode and inks\n"
            + "with a CALL &C7D0 after you loaded\n"
            + "an exported screen.\n"
            + "Please choose now:\n"
            + "YES:\nWait for a key before return to BASIC", "NO:\nReturn to BASIC after a CALL &C7D0\n\n"};

        int selectedValue;

        if (overscan) {
            selectedValue = JOptionPane.showOptionDialog(new Frame(), object, "Please choose:",
                    JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, null, null);

        } else {
            selectedValue = JOptionPane.showOptionDialog(new Frame(), objectb, "Please choose:",
                    JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, null, null);

        }

        if (selectedValue == JOptionPane.NO_OPTION) {
            RETURN = true;

        }
        if (selectedValue == JOptionPane.CANCEL_OPTION) {
            return;

        }
        try {
            startimageA = Util.hexValue(AddressA.getText());
            startimageB = Util.hexValue(AddressB.getText());

        } catch (final Exception error) {
        }
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Save 16k CPC Screen File + PAL", FileDialog.SAVE);
        filedia.setFile("*.scr");
        filedia.setVisible(true);
        String filename = filedia.getFile();

        if (filename != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            String savename = filename;
            savename = savename.toUpperCase();
            String palname = filename;

            int length = savename.length();
            String temp = savename;

            if (savename.toLowerCase().endsWith(".scr")) {
                temp = savename.substring(0, (length - 4));

            }
            if (savename.toLowerCase().endsWith(".bin")) {
                temp = savename.substring(0, (length - 4));

            }
            savename = temp + ".SCR";
            palname = temp + ".PAL";

            if (soverscan) {
                String savename2 = temp + ".SC1";
                savename = temp + ".SC2";
                File fileb = new File(savename2);

                try {
                    int memSize = 0x4000;

                    byte[] data = new byte[0x080 + memSize];

                    for (int i = 0; i
                            < 0x80; i++) {
                        data[i] = (byte) SCR_HEADER[i];

                    }
                    byte[] mem = memory.getMemory();
                    System.arraycopy(mem, startimageA, data, 0x80, memSize - 1);
                    final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(fileb));

                    for (int i = 0; i
                            < 0x080 + memSize; i++) {
                        bos.write(data[i]);

                    }
                    bos.close();

                } catch (final IOException iox) {
                }
            }

            File file = new File(savename);
            // saveauto data to file

            try {
                int memSize = 0x4000;

                byte[] data = new byte[0x080 + memSize];

                for (int i = 0; i
                        < 0x80; i++) {
                    data[i] = (byte) SCR_HEADER[i];

                }
                byte[] mem = memory.getMemory();
                System.arraycopy(mem, startimageB, data, 0x80, memSize - 1);

                if (!soverscan) {

                    boolean plusmode = false;
                    try {
                        plusmode = normalPaintBox.getPlus();
                    } catch (Exception e) {
                    }

                    if (!plusmode) {
                        for (int i = 0; i < 16; i++) {
                            data[0x17d1 + i + 0x80] = (byte) GateArray.getInk(i);
                        }
                        for (int i = 0; i < 36; i++) {
                            data[0x07d0 + i + 0x80] = (byte) SCR_CODE[i];
                        }
                        for (int i = 0; i < FLIP_CODE.length; i++) {
                            data[0x27d0 + i + 0x80] = (byte) FLIP_CODE[i];
                        }
                        data[0x17d0 + 0x80] = (byte) gateArray.getScreenMode();
                    } else {

                        for (int i = 0; i < CodeP0.length; i++) {
                            data[0x07d0 + i + 0x80] = (byte) CodeP0[i];
                        }
                        for (int i = 0; i < CodeP1.length; i++) {
                            data[0x0fd0 + i + 0x80] = (byte) CodeP1[i];
                        }
                        for (int i = 0; i < CodeP3.length; i++) {
                            data[0x1fd0 + i + 0x80] = (byte) CodeP3[i];
                        }
                        for (int i = 0; i < FLIP_CODE.length; i++) {
                            data[0x27d0 + i + 0x80] = (byte) FLIP_CODE[i];
                        }
                        int moded = gateArray.getScreenMode();
                        byte mo = (byte) 0x8c;
                        if (moded == 1) {
                            mo = (byte) 0x8d;
                        }
                        if (moded == 2) {
                            mo = (byte) 0x8e;
                        }
                        data[0x17d0 + 0x80] = mo;
                        byte[] pluspal = normalPaintBox.getPlusPalette();
                        System.arraycopy(pluspal, 0, data, 0x17d1 + 0x80, 32);
                    }
                    int adr = 0x07d0 + 0x80;
                    if (!RETURN) {
//                        0xC3, 0x18, 0xBB
                        data[adr + 33] = (byte) 0xC3;
                        data[adr + 34] = (byte) 0x18;
                        data[adr + 35] = (byte) 0xBB;
                    }
                }
                final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));

                for (int i = 0; i < 0x080 + memSize; i++) {
                    bos.write(data[i]);
                }
                bos.close();

                if (!soverscan) {
                    exportPal(palname);

                }
            } catch (final IOException iox) {
            }
        }
    }

    public void exportPal(String name) {

        File file = new File(name);

        // saveauto data to file
        try {
            int memSize = 0xef;

            byte[] data = new byte[0x080 + memSize];

            for (int i = 0; i
                    < 0x80; i++) {
                data[i] = (byte) PAL_HEADER[i];

            }
            data[0x80] = (byte) gateArray.getScreenMode();

            int adr = 0x83;

            for (int i = 0; i
                    < 17; i++) {
                for (int g = 0; g
                        < 12; g++) {
                    int numb = gateArray.getInk(i);
                    data[adr] = (byte) PAL_INK[numb];
                    adr++;

                }

            }

            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));

            for (int i = 0; i
                    < 0x080 + memSize; i++) {
                bos.write(data[i]);

            }
            bos.close();

        } catch (final IOException iox) {
        }
    }

    public void doMultiface() {
        Hold();
        memory.setLowerEnabled(true);
        memory.setMultiEnabled(true);
        gateArray.setModeAndROMEnable(memory, 0x089);
        z80.nmi();
        goOn();
        reSync();

    }

    public void Check() {
        if (Switches.save64) {
            Switches.save64 = false;
            SNA_Save(64);

        }
        if (Switches.save128) {
            Switches.save128 = false;
            SNA_Save(128);

        }
        if (Switches.save256) {
            Switches.save256 = false;
            SNA_Save(256);

        }
        if (Switches.save512) {
            Switches.save512 = false;
            SNA_Save(512);

        }
        if (Switches.scores) {
            Switches.scores = false;
            //getScores();
            getScores.getDW3Scores();

        }
        if (Switches.poke) {
            Switches.poke = false;
            POKE();

        }

        if (Switches.devil) {
            Cheat();
            Switches.devil = false;

        }

        if (Switches.export) {
            Switches.export = false;
            BIN_Export();

        }
        if (Switches.saveScr) {
            Switches.saveScr = false;
            exportScreen(
                    true);

        }
        if (Switches.savePScr) {
            Switches.savePScr = false;
            exportScreen(
                    false);

        }

        if (Switches.showPalette) {
            Switches.showPalette = false;
            showPalette();

        }
        if (Switches.dskcheck == true) {
            Switches.dskcheck = false;
            SaveDSK();

        }
        if (Switches.BINImport) {
            Switches.BINImport = false;
            BIN_Load();

        }
        if (Switches.digi) {
            Switches.digi = false;
            Digitracker();

        }
        if (Switches.digimc) {
            Switches.digimc = false;
            DigitrackerMC();

        }
        if (Switches.digipg) {
            Switches.digipg = false;
            DigitrackerPG();

        }
    }

    public void StartOverscanPaint(String fname) {
        if (normalPaintFrame != null && normalPaintFrame.isVisible()) {
            return;

        }
        StartOverscanPaint();
        overscanPaintBox.setFilename(fname);

    }
    public static boolean resetregisters = false;

    public void StartOverscanPaint() {
        if (normalPaintFrame != null && normalPaintFrame.isVisible()) {
            return;

        }
        if (overscanPaintFrame == null) {
            overscanPaintBox = new overscanPaint();
            overscanPaintFrame = new JFrame() {
                protected void processWindowEvent(WindowEvent we) {
                    super.processWindowEvent(we);

                    if (we.getID() == WindowEvent.WINDOW_CLOSING) {
                        overscanPaintBox.manipframe.setVisible(false);

                        if (PEEK(0x9000) == 0x2a && PEEK(0x9128) == 0x52 && PEEK(0x9227) == 0x41) {
                            for (int i = 0x170; i
                                    < 0x9fff; i++) {
                                POKE(i, 0);

                            }
                            resetregisters = true;
                            reset = true;
                            disableresync = false;

                        }
                        overscanPaintFrame.dispose();

                    }
                }
            };
            overscanPaintFrame.setTitle("JavaCPC Paint 2.0");
            overscanPaintFrame.add(overscanPaintBox);
            overscanPaintBox.initialize();
            overscanPaintFrame.pack();
            overscanPaintFrame.setSize(870, 890);
            overscanPaintFrame.setResizable(false);
            overscanPaintFrame.setAlwaysOnTop(false);
            overscanPaintBox.makeUndo();
            overscanPaintFrame.setVisible(true);

        } else {
            try {
                overscanPaintBox.makeUndo();
                overscanPaintFrame.setVisible(true);
                overscanPaintBox.manipframe.setVisible(true);

            } catch (Exception e) {
            }
        }
    }

    public void StartNormalPaint(String fname) {
        if (overscanPaintFrame != null && overscanPaintFrame.isVisible()) {
            return;

        }
        StartNormalPaint();
        normalPaintBox.setFilename(fname);

    }

    public void StartNormalPaint() {
        if (overscanPaintFrame != null && overscanPaintFrame.isVisible()) {
            return;

        }
        if (normalPaintFrame == null) {
            normalPaintBox = new normalPaint();
            normalPaintFrame = new JFrame() {
                protected void processWindowEvent(WindowEvent we) {
                    super.processWindowEvent(we);

                    if (we.getID() == WindowEvent.WINDOW_CLOSING) {
                        normalPaintBox.manipframe.setVisible(false);

                        if (PEEK(0x9000) == 0x2a && PEEK(0x9128) == 0x52 && PEEK(0x9227) == 0x41) {
                            for (int i = 0x170; i
                                    < 0x9fff; i++) {
                                POKE(i, 0);

                            }
                            disableresync = false;
                            reset = true;
//                            jemu.ui.JEMU.restoreComputer = true;

                        }
                        normalPaintFrame.dispose();

                    }
                }
            };
            normalPaintFrame.setTitle("JavaCPC Paint 2.0");
            normalPaintFrame.add(normalPaintBox);
            normalPaintBox.initialize();
            normalPaintFrame.pack();
            normalPaintFrame.setSize(760, 760);
            normalPaintFrame.setResizable(false);
            normalPaintFrame.setAlwaysOnTop(false);
            normalPaintBox.makeUndo();
            normalPaintFrame.setVisible(true);

        } else {
            try {
                normalPaintBox.makeUndo();
                normalPaintFrame.setVisible(true);
                normalPaintBox.manipframe.setVisible(true);

            } catch (Exception e) {
            }
        }
    }

    public void Digitracker() {

        launchcount = 1;
        launchcode = 1;
        // launchDigitracker();

    }

    public void DigitrackerMC() {
        launchcount = 1;
        launchcode = 3;

    }

    public void DigitrackerPG() {
        launchcount = 1;
        launchcode = 4;

    }

    public void LOAD(String name, int address, int length, int launchaddress, boolean type) {
        byte[] data = getRom(name, length);
        type = false;
        byte[] mem = memory.getMemory();
        System.arraycopy(data, 0, mem, address, length);
        System.arraycopy(data, 0, gateArray.screenmemory, address, length);

        if (launchaddress > 0) {
            if (type) {
                AutoType("CALL &" + Util.hex(launchaddress).substring(4) + "\n");

            } else {
                runBinary(launchaddress);
                //launch = launchaddress;

            }
            this.reSync();
            this.reSync();
            this.reSync();
        }
    }

    public void SNAP(String name) {
        byte[] data = getRom(name, 131328);
        SNA_Load("nix", data);

    }

    public void launchDigitracker() {
        LOAD("file/DIGITRAK.DT", 0x5D73, 0x498D, 0x5D73, false);
        blastercount = 1;

    }

    public void launchXMS() {
//        this.runDeathSword();
        LOAD("file/XMAS09.BIN", 0x0140, 0x50ba, 0x51a7, true);
        reSync();
    }

    public void launchDigitrackerMC() {
        LOAD("file/DIGITRAK.MC", 0x3C2C, 0x2501, 0x6080, false);

    }

    public void launchDigitrackerPG() {
        LOAD("file/DIGITRAK.PG", 0x3E4C, 0x1EE1, 0x5C80, false);

    }

    public void Cheat() {
        launchcode = 2;
        launchcount = 1;
    }

    public void launchCheat() {
        Devil.Devil();
        runBinary(0x9000);
    }

    int YM_Hours;

    public void storeYM() {
        if ((psg.readRegister(8) != 0 || psg.readRegister(9) != 0 || psg.readRegister(10) != 0) && !doRecord) {
            doRecord = true;

        }
        if (doRecord) {
            vcount++;

            if (vcount == 50) {
                vcount = 0;
                YM_Seconds++;

                if (YM_Seconds == 60) {
                    YM_Seconds = 0;
                    YM_Minutes++;
                    if (YM_Minutes == 60) {
                        YM_Minutes = 0;
                        YM_Hours++;
                    }

                }

            }
            String minutes = "" + YM_Minutes;

            if (YM_Minutes <= 9) {
                minutes = "0" + minutes;
            }
            String hours = "" + YM_Hours;

            if (YM_Hours <= 9) {
                hours = "0" + hours;
            }
            String seconds = "" + YM_Seconds;

            if (YM_Seconds <= 9) {
                seconds = "0" + seconds;

            }
            String milliseconds = "" + (vcount * 2);

            if (vcount <= 4) {
                milliseconds = "0" + milliseconds;

            }

            YMControl.doYMDisplay(hours + ":" + minutes, seconds, milliseconds,
                    "*RECORDING*", minutes, seconds);

            for (int i = 0; i
                    < 16; i++) {
                if (i == 13) {
                    if (psg.registerUpdated()) {
                        YM_Data[ymcount] = psg.readRegister(i);

                    } else {
                        YM_Data[ymcount] = 0x0ff;

                    }
                } else {
                    YM_Data[ymcount] = psg.readRegister(i);

                }
                if (i == 14 || i == 15) {
                    YM_Data[ymcount] = 0x00;

                }
                ymcount++;
                YM_RecCount++;

            }

            if (ymcount >= 999980) {
                System.out.println("Recording stopped... Buffer full!");
                YM_Rec = false;
                ymcount = 0;

            }
            YM_vbl++;
            psg.resetUpdated();

        }
    }

    public void Slide(int pos) {
        if (!YM_Rec) {
            ymcount = pos * 50 * YM_registers;
            vcount = 0;
        }
    }
    int YM_size;

    int[] secondsToTime(int secs) {
        double hours = Math.floor(secs / (60 * 60));

        double divisor_for_minutes = secs % (60 * 60);
        double minutes = Math.floor(divisor_for_minutes / 60);

        double divisor_for_seconds = divisor_for_minutes % 60;
        double seconds = Math.ceil(divisor_for_seconds);

        int[] obj = {
            (int) hours,
            (int) minutes,
            (int) seconds
        };
        return obj;
    }

    public void playYM() {
        if (atari_st_mode && !st_mode) {
            psg.changeClockSpeed(CYCLES_PER_SECOND_ST);
            st_mode = true;

        }
        if (spectrum_mode && !zx_mode) {
            psg.changeClockSpeed(CYCLES_PER_SECOND_ZX);
            zx_mode = true;

        } //int vcount, YM_Minutes, YM_Seconds, msecs
        vcount++;

        YM_size = (YM_RecCount / 50) / YM_registers;
        YMControl.ympos.setMaximum(YM_size);

        if (vcount == 50) {
            vcount = 0;
        }

        int second = ((ymcount / 50) / YM_registers);
        int[] timer = this.secondsToTime(second);
        YM_Minutes = timer[1];
        YM_Seconds = timer[2];
        String minutes = "" + YM_Minutes;

        if (YM_Minutes <= 9) {
            minutes = "0" + minutes;

        }
        minutes = timer[0] + ":" + minutes;
        if (timer[0] < 10) {
        }
        minutes = "0" + minutes;
        String seconds = "" + YM_Seconds;

        if (YM_Seconds <= 9) {
            seconds = "0" + seconds;
        }
        int ms = (vcount * 2);
        if (ms > 99) {
            ms = 99;
        }
        String milliseconds = (ms < 10 ? "0" : "") + ms;

        YMControl.doYMDisplay(minutes, seconds, milliseconds, YMtitle, YMauthor, YMcreator);
        YMControl.ympos.setValue((ymcount / 50) / YM_registers);

        if (YM_RecCount >= 1) {
            for (int i = 0; i
                    < YM_registers; i++) {
                if (i == 13) {
                    if (YM_Data[ymcount] != 0x0ff) {
                        try {
                            psg.setRegister(i, YM_Data[ymcount]);
                        } catch (Exception e) {
                        }

                    }
                } else {
                    try {
                        psg.setRegister(i, YM_Data[ymcount]);
                    } catch (Exception e) {
                    }
                }
                ymcount++;
            }
            /*
             * if (oldYM){ psg.setRegister(14, 0x00); psg.setRegister(15, 0x00);
             * }
             */
            if (ymcount >= YM_RecCount) {
//                YM_Minutes = 0;
//                YM_Seconds = 0;
                ymcount = ym_loop * YM_registers;
                YMControl.UpdateLCD("*YM PLAYER*");

            }
        } else {
            psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
            st_mode = false;
            YM_Play = false;
            System.out.println("Sorry, no playback-data in buffer");

        }
    }

    public void loadAlarm() {
        loadYM(System.getProperty("user.home") + "/JavaCPC/aha.ym", false);
        YM_Play = true;

    }

    public void loadYM() {
        jemu.ui.JEMU.ymControl.setVisible(false);
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Load YM audio File", FileDialog.LOAD);
        filedia.setFile("*.ym; *.bin");
        filedia.setVisible(true);
        String filename = filedia.getFile();

        if (filename != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            String loadname = filename;

            try {
                loadYM(unLHA(loadname), false);

            } catch (Exception e) {
                loadYM(loadname, false);

            }
        }
        jemu.ui.JEMU.ymControl.setVisible(true);

    }
    boolean del = false;
    ;

    int ym_loop = 0;

    public void loadYM(String loadname, boolean delete) {
        YMControl.displaycount1 = 0;
        YMControl.displaycount2 = 0;
        YMControl.DisplayStart = 0;
        YM_Minutes = 0;
        YM_Seconds = 0;
        ymcount = 0;
        YMControl.UpdateLCD("*YM PLAYER*");

        if (loadname.startsWith("http://") || loadname.startsWith("www.")) {
            if (loadname.startsWith("www.")) {
                loadname = "http://" + loadname;

            }
            String savename = "buffer.ym";
            String[] arg = {loadname, savename};
            jemu.ui.copyURL.download(arg, true);
            loadname = savename;

        }
        psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
        st_mode = false;
        YMtitle = "";
        YMauthor = "";
        YMcreator = "";
        shouldcount = false;
        begincount = 0;
        YM_RecCount = 0;

        int value0 = 0;

        int value1 = 0;

        int value2 = 0;

        int value3 = 0;

        int YM_length = 0;
        atari_st_mode = false;
        spectrum_mode = false;
        YM_Interleaved = false;
        File file = new File(loadname);

        int ym_read_byte = 0;

        ym_loop = 0;

        try {
            final BufferedInputStream bos = new BufferedInputStream(new FileInputStream(file));
            long len = file.length();
            for (int ym_filepos = 0; ym_filepos
                    <= len; ym_filepos++) {
                ym_read_byte = bos.read();

                if (ym_filepos == 2) {
                    if (ym_read_byte == 0x035 || ym_read_byte == 0x036 || ym_read_byte == 0x033 || ym_read_byte == 0x032) {
                        if (ym_read_byte == 0x033 || ym_read_byte == 0x032) {
                            YM_registers = 14;
                            YM_Interleaved = true;
                            oldYM = true;
                            atari_st_mode = true;
                            spectrum_mode = false;

                            if (ym_read_byte == 0x032) {
                                System.out.println("opening YM2! file...");

                            } else {
                                System.out.println("opening YM3! file...");

                            }
                        }
                        if (ym_read_byte == 0x035) {
                            YM_registers = 16;
                            oldYM = false;
                            System.out.println("opening YM5! file...");
                            try {
                                final BufferedInputStream boss = new BufferedInputStream(new FileInputStream(file));
                                byte[] check = new byte[boss.available()];
                                boss.read(check);
                                boss.close();
                                ym_loop = Device.getLWord(check, 28);
                                System.out.println("loop is " + ym_loop);
                            } catch (Exception e) {
                            }

                        }
                        if (ym_read_byte == 0x036) {
                            YM_registers = 16;
                            oldYM = false;
                            System.out.println("opening YM6! file...");
                            try {
                                final BufferedInputStream boss = new BufferedInputStream(new FileInputStream(file));
                                byte[] check = new byte[bos.available()];
                                boss.read(check);
                                boss.close();
                                ym_loop = Device.getLWord(check, 28);
                                System.out.println("loop is " + ym_loop);
                            } catch (Exception e) {
                            }

                        }
                    } else {

                        System.out.println("Wrong format... Cannot playback!");
                        YM_Interleaved = false;
                        atari_st_mode = false;
                        spectrum_mode = false;
                        YM_RecCount = 0;
                        bos.close();

                        return;

                    }
                }
                if (ym_filepos == 12) {
                    value0 = ym_read_byte;

                }
                if (ym_filepos == 13) {
                    value1 = ym_read_byte;

                }
                if (ym_filepos == 14) {
                    value2 = ym_read_byte;

                }
                if (ym_filepos == 15) {
                    value3 = ym_read_byte;

                }
                if (!oldYM && (ym_filepos == 19 && (ym_read_byte & 1) == 1)) {
                    System.out.println("Found an interleaved file of " + YM_registers + " registers.");
                    YM_Interleaved = true;

                }
                if (ym_filepos == 25) {
                    if (ym_read_byte == 0x080) {
                        atari_st_mode = true;
                        spectrum_mode = false;

                    }
                    if (ym_read_byte == 0x058) {
                        atari_st_mode = false;
                        spectrum_mode = true;

                    }
                }

                if (!oldYM && ym_filepos >= 34 && !shouldcount) {
                    if (begincount >= 3) {
                        shouldcount = true;

                    }

                    if (ym_read_byte == 0 && begincount <= 5) {
                        begincount++;

                    }
                    if (begincount == 0) {
                        if (ym_read_byte != 0) {
                            char c = (char) ym_read_byte;
                            YMtitle += c;

                        }
                    }
                    if (begincount == 1) {
                        if (ym_read_byte != 0) {
                            char c = (char) (ym_read_byte);
                            YMauthor += c;

                        }
                    }
                    if (begincount == 2) {
                        if (ym_read_byte != 0) {
                            char c = (char) (ym_read_byte);
                            YMcreator += c;

                        }
                    }
                }

                if (oldYM && ym_filepos >= 4 && !shouldcount) {
                    YMtitle = "none";
                    YMauthor = "none";
                    YMcreator = "none";
                    shouldcount = true;

                }

                if (shouldcount) {
                    if (!YM_Interleaved) {
                        YM_Data[YM_RecCount] = ym_read_byte;
                        YM_RecCount++;

                    } else {
                        YM_DataInterleaved[YM_RecCount] = ym_read_byte;
                        YM_RecCount++;

                    }

                }

            }
            bos.close();

            if (delete || del) {
                try {
                    File check = new File(loadname);
                    check.delete();

                } catch (Exception e) {
                }
            }
            if (!oldYM) {
                YM_length = (value0 * 256) + (value1 * 256) + (value2 * 256) + (value3);

                System.out.println("YM_RecCount " + Util.hex(YM_RecCount));
                System.out.println("YM_length " + Util.hex(YM_length));
                YM_registers = (YM_RecCount / YM_length);

                if (YM_registers > 16) {
                    YM_registers = 16;

                }
                System.out.println("Registers: " + (YM_registers));
                YM_vbl = YM_length;

            } else {
                YM_vbl = YM_RecCount / YM_registers;

            }

            YMControl.UpdateLCD("*YM PLAYER*");
            ymcount = 0;

            if (YM_Interleaved && !oldYM) {
                int counted = 0;

                for (int jk = 0; jk
                        < YM_registers; jk++) {
                    for (int ik = 0; ik
                            < YM_length; ik++) {
                        YM_Data[jk + ik * YM_registers] = YM_DataInterleaved[counted];
                        counted++;

                    }

                }
            } else if (YM_Interleaved) {
                int counted = 0;

                for (int jk = 0; jk
                        < YM_registers; jk++) {
                    for (int ik = 0; ik
                            < YM_RecCount / YM_registers; ik++) {
                        YM_Data[(ik * YM_registers) + jk] = YM_DataInterleaved[counted];
                        counted++;

                    }

                }
            }

            Display.title = YMtitle;
            Display.author = YMauthor;
            Display.creator = YMcreator;
            System.out.println("Title: " + YMtitle);
            System.out.println("Author: " + YMauthor);
            System.out.println("Creator: " + YMcreator);

            if (atari_st_mode) {
                System.out.println("AY speed is 2000000 hz!");

            } else if (spectrum_mode) {
                System.out.println("AY speed is 1773400 hz!");

            } else {
                System.out.println("AY speed is 1000000 hz!");

            }
        } catch (final IOException iox) {
            System.out.println("can't read file ");

        }

    }

    public void saveYM() {
        jemu.ui.JEMU.ymControl.setVisible(false);

        if (YM_RecCount >= 1) {
            FileDialog filedia = new FileDialog((Frame) new Frame(), "Save YM audio File", FileDialog.SAVE);
            filedia.setFile("*.ym");
            filedia.setVisible(true);
            String filename = filedia.getFile();

            if (filename != null) {
                filename = filedia.getDirectory() + filedia.getFile();
                String savename = filename;

                if (!savename.toLowerCase().endsWith(".ym")) {
                    savename = savename + ".ym";

                }
                saveYM(savename);

            }
        } else {
            System.out.println("Sorry, no data in buffer, cannot save!");

        }
        jemu.ui.JEMU.ymControl.setVisible(true);

    }

    public void saveYM(String savename) {
        /*
         * Header YM5 : (format BIG ENDIAN)
         *
         * Offset Size Type Comment 0 4 DWORD ID of YM5 format. ('YM5!') 4 8
         * string[8] Check String ('LeOnArD!') 12 4 DWORD Nb of valid VBL of the
         * file 16 4 DWORD Song attributes (see bellow) 20 2 WORD Nb of
         * digi-drum sample (can be 0) 22 4 DWORD YM2149 External frequency in
         * Hz (1000000) 26 2 WORD Player frequency in Hz (50Hz for almost
         * player) 28 4 DWORD VBL number to loop the song. (0 is default) 32 2
         * WORD Must be 0 for the moment ? ? NT-String Name of the song ? ?
         * NT-String Name of the author ? ? NT-String Comments (Name of the YM
         * converter !) ? ? All YM2149 registers ? 4 DWORD End-File check
         * ('End!')
         *
         */
        atari_st_mode = false;
        spectrum_mode = false;
        psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
        st_mode = false;
        YM_Interleaved = true;
        File file = new File(savename);
        String HeaderYM = "YM5!LeOnArD!";
        String title = "";
        String author = "";

        if (!oldYM) {
            JTextField YMTitle = new JTextField();
            JTextField YMAuthor = new JTextField();
            YMAuthor.setText(author);
            YMTitle.setText(title);
            Object[] message = {"Song name", YMTitle, "Authors name", YMAuthor
        //, YMInterleaved
            };

            JOptionPane pane = new JOptionPane(message,
                    JOptionPane.QUESTION_MESSAGE,
                    JOptionPane.DEFAULT_OPTION);

            pane.createDialog(null, "Create YM file").setVisible(true);

            title = YMTitle.getText();
            author = YMAuthor.getText();

        }
        try {
            final BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));

            if (!oldYM) {
                if (title == null) {
                    title = "none";

                }
                if (author == null) {
                    author = "none";

                }
                String recorded = "recorded with JavaCPC";
                // write header

                byte[] header = new byte[34];

                byte[] authorbyte = new byte[1000];

                byte[] titlebyte = new byte[1000];

                byte[] recbyte = new byte[40];
                System.arraycopy(HeaderYM.getBytes("UTF-8"), 0, header, 0, HeaderYM.length());
                System.arraycopy(title.getBytes("UTF-8"), 0, titlebyte, 0, title.length());
                System.arraycopy(author.getBytes("UTF-8"), 0, authorbyte, 0, author.length());
                System.arraycopy(recorded.getBytes("UTF-8"), 0, recbyte, 0, recorded.length());
                putLongBigEndian(
                        header, 12, YM_vbl);
                putWordBigEndian(
                        header, 16, 0);

                if (YM_Interleaved) {
                    header[19] = 1;

                } else {
                    header[19] = 0;

                }
                putLongBigEndian(header, 22, 1000000);
                putWordBigEndian(header, 26, 50);
                putLongBigEndian(header, 28, ym_loop);

                for (int i = 0; i < 34; i++) {
                    bos.write(header[i]);
                }
                for (int i = 0; i
                        < title.length() + 1; i++) {
                    bos.write(titlebyte[i]);
                }
                for (int i = 0; i
                        < author.length() + 1; i++) {
                    bos.write(authorbyte[i]);
                }
                for (int i = 0; i
                        < recorded.length() + 1; i++) {
                    bos.write(recbyte[i]);

                }
            } else {
                String YMHeader = "YM3!";

                byte[] header = new byte[14];
                System.arraycopy(YMHeader.getBytes("UTF-8"), 0, header, 0, YMHeader.length());

                for (int i = 0; i
                        < 4; i++) {
                    bos.write(header[i]);

                }
                YM_Interleaved = true;

            }
            // write data (YM_Interleaved)
            if (YM_Interleaved) {
                for (int j = 0; j
                        < YM_registers; j++) {
                    for (int i = 0; i
                            < YM_RecCount / YM_registers; i++) {
                        bos.write(YM_Data[(i * YM_registers) + j]);

                    }
                }
            } else {
                for (int j = 0; j
                        <= YM_RecCount; j++) {
                    bos.write(YM_Data[j]);

                }
            }
            // write endheader
            if (!oldYM) {
                String EndYM = "End!";

                byte[] headerend = new byte[14];
                System.arraycopy(EndYM.getBytes("UTF-8"), 0, headerend, 0, EndYM.length());

                for (int i = 0; i
                        < 4; i++) {
                    bos.write(headerend[i]);

                }
            }

            bos.close();

        } catch (final IOException iox) {
            System.out.println("can't write to file ");

        }
    }

    private void YMCheck() {

        if (YM_Rec) {
            storeYM();

        }
        if (YM_Play && !YM_Stop) {
            Switches.blockKeyboard = true;
            playYM();

        }
        if (YM_Stop && !YM_Rec) {
            Switches.blockKeyboard = false;
            psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
            st_mode = false;
            YM_Stop = false;
            psg.resetRegisters();
//            psg.setRegister(7, 0x3f);

        }
        if (YM_Stop && YM_Rec) {
            Switches.blockKeyboard = false;
            psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
            st_mode = false;
            YM_Stop = false;

        }
        if (YM_Save) {
            YM_Save = false;
            saveYM();

        }

        if (YM_Load) {
            YM_Load = false;
            loadYM();

        }
    }

    protected void TapeLoad(String loadname, byte[] data) {
        tape_stereo = false;
        bitrate = 8;
        tapeloaded = false;
        isCDT = false;
        tapeBandPosition = 0;
        doLoad = 0;
        jemu.ui.JEMU.isTape = true;
        tapesample = null;
        tapesample = data;
        int tapelength = getDWord(tapesample, 40);
        frequency = getDWord(tapesample, 24);
        int channels = tapesample[22];
        int bits = tapesample[34];
        tape_delay = 1010000 / (frequency);
        tapedelay = 1010000;
        System.out.println("Tape delay is: " + tape_delay);

        bitrate = bits;

        if (tapelength > (int) Switches.availmem) {
            System.out.println("Sorry, the file is too large");
            tapesample = new byte[0];
            return;
        }

        if (tapelength > data.length) {
            System.out.println("Reloading file... File is larger than buffer.");
            tapesample = null;
            tapesample = getFile(loadname);
        }

        System.out.println("Stream has " + frequency + " hz, " + tapelength + " bytes, " + channels + " channels, " + bits + " bits");

        if (channels >= 2) {
            tape_stereo = true;

        } else {
            tape_stereo = false;

        }
        tapePlay = true;
        TapeDrive.pressPlay();
        //    TapeDeck.positionslider.setValue(0);

        if (Switches.FloppySound && !tapeloaded) {
            Samples.TAPEINSERT.play();

        }
        tapeloaded = true;
        recordcount = tapesample.length;
        //  TapeDeck.positionslider.setMaximum(recordcount);
        TapeDrive.showText(TapeDrive.filename);
        reSync();
        if (data != null && key != null) {
            key.reset();
        }

    }

    public void tapeEject() {
        TAPData = null;
        if (loadtap) {
            this.unpatchOS();
        }
        loadtap = false;
//        if (this.tapeloaded) {
        TapeDrive.pressEject();
//        }

    }

    protected void optimizeWAV() {
        FileDialog filedia = new FileDialog((Frame) new Frame(), "Load WAV file", FileDialog.LOAD);
        filedia.setFile("*.wav");
        filedia.setVisible(true);
        String filename = filedia.getFile();

        if (filename != null) {
            filename = filedia.getDirectory() + filedia.getFile();
            String loadname = filename;
            SetByte.setText(("6F"));
            Object[] object = {"Enter togglebyte-value", SetByte};

            int selectedValue = JOptionPane.showOptionDialog(new Frame(), object, "Please enter:",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, null, null);

            if (selectedValue == JOptionPane.NO_OPTION) {
                return;

            }
            if (selectedValue == JOptionPane.CANCEL_OPTION) {
                return;

            }
            optimizeWAV(loadname, SetByte.getText());

        }
    }

    protected void optimizeWAV(String name, String setbyte) {
        try {
            int setByte = Util.hexValue(setbyte);

            try {
                int length;
                BufferedInputStream bos = new BufferedInputStream(new FileInputStream(name));
                tapesample = null;
                tapesample = new byte[bos.available()];
                bos.read(tapesample);
                bos.close();
                length = tapesample.length - 44;

                for (int i = 0; i
                        < length; i++) {
                    int value = tapesample[i + 44] ^ 0x80;

                    if (tapesample[i + 44] != (byte) 0x80) {
                        if (value <= setByte) {
                            tapesample[i + 44] = (byte) 0x026;

                        } else {
                            tapesample[i + 44] = (byte) 0x0da;

                        }
                    }
                }
                BufferedOutputStream boss = new BufferedOutputStream(new FileOutputStream(name + "_optimized.wav"));
                boss.write(tapesample);
                boss.close();
                System.out.println("Successfully optimized");

            } catch (final IOException iox) {
                System.out.println("can't read/write file ");

            }
        } catch (final Exception err) {
        }
    }

    public void CSWLoad(String name, byte[] data) {
        tapeloaded = false;
        tape_stereo = false;
        bitrate = 8;
        tapesample = null;
        int length = data.length;
        frequency = getWord(data, 25);
        if (data[27] != 1) {
            System.err.println("Wrong compression format!");
            return;
        }
        int polarity = 0x7F + data[28] % 2;
        boolean odd = ((data[28] + 2) % 2 == 0);
        String pol = "positive";
        if (odd) {
            pol = "negative";
        }
        tape_delay = 1010000 / (frequency);
        tapedelay = 1010000;
        System.out.println("CSW loaded.");
        System.out.println("polarity  = " + pol);
        System.out.println("frequency = " + frequency);
        int size = 0;

        //loop1
        int i = 32;
        while (i < length) {
            int a = data[i++] & 0xff;
            if (a == 0) {
                a = data[i++] + (data[i++] << 8) + (data[i++] << 16) + (data[i++] << 24);
            }
            while (a-- > 0) {
                size++;
            }
        }
        tapesample = new byte[size];

        //loop2
        int tapecount = 0;
        i = 32;
        while (i < length) {
            int a = data[i++] & 0xff;
            if (a == 0) {
                a = data[i++] + (data[i++] << 8) + (data[i++] << 16) + (data[i++] << 24);
            }
            if (!odd) {
                polarity = 0xff - polarity;
            }
            while (a-- > 0) {
                tapesample[tapecount] = (byte) (polarity ^ 0x80);
                if (tapesample[tapecount] == 0) {
                    tapesample[tapecount] = (byte) 0xda;
                } else {
                    tapesample[tapecount] = (byte) 0x26;
                }
                tapecount++;
            }
            if (odd) {
                polarity = 0xff - polarity;
            }
        }
        tapePlay = true;
        TapeDrive.pressPlay();
        if (Switches.FloppySound && !tapeloaded) {
            Samples.TAPEINSERT.play();
        }
        tapeloaded = true;
        recordcount = tapesample.length;
    }

    public void MP3Load(String name) {
        mp3loaded = false;
        mp3name = name;
        if (!playmovie) {
            mp3.setVisible(true);
        }
        mp3count = 1;

    }
    boolean mp3loaded = false;

    public void MP3Load() {
        mp3count = 0;
        Thread importmp3 = new Thread() {
            public void run() {
                try {
                    bitrate = 8;
                    tapesample = null;
                    tapesample = mp3c.convertToArray(mp3name);
                    FileOutputStream buffer = new FileOutputStream("buffer.wav");
                    buffer.write(tapesample);
                    buffer.close();
                    TapeLoad(mp3name, tapesample);
                    mp3loaded = true;
                    mp3.setVisible(false);
                } catch (Exception error) {
                    System.out.println(error.getMessage());
                }
                reSync();
            }
        };
        importmp3.start();
    }

    public void keySample(KeyEvent e, boolean release) {
        if (Switches.KeyboardSound) {
            keySample(e.getKeyCode(), release);
        }

    }

    public void keySample(int e, boolean release) {

        if (!release) {
            if (Switches.ROM.equals("CPC664") || Switches.ROM.equals("CPC464")) {
                if (e == KeyEvent.VK_SPACE) {
                    Samples.SPRESS.play();

                } else if (e == KeyEvent.VK_ENTER) {
                    Samples.EPRESS.play();

                } else {
                    Samples.KPRESS.play();

                }
            } else {
                if (e == KeyEvent.VK_SPACE) {
                    Samples.SPACEPRESS.play();

                } else if (e == KeyEvent.VK_ENTER) {
                    Samples.ENTERPRESS.play();

                } else {
                    Samples.KEYPRESS.play();

                }
            }

        } else if (Switches.ROM.equals("CPC664") || Switches.ROM.equals("CPC464")) {
            if (e == KeyEvent.VK_SPACE) {
                Samples.SRELEASE.play();

            } else if (e == KeyEvent.VK_ENTER) {
                Samples.ERELEASE.play();

            } else {
                Samples.KRELEASE.play();

            }
        } else {
            if (e == KeyEvent.VK_SPACE) {
                Samples.SPACERELEASE.play();

            } else if (e == KeyEvent.VK_ENTER) {
                Samples.ENTERRELEASE.play();

            } else {
                Samples.KEYRELEASE.play();

            }
        }

    }

    public void LoadPNGDisk(String name, byte[] data) {
        dskname = name;
        while (dskname.contains("\\")) {
            dskname = dskname.substring(1);
        }
        dskname = dskname.replace(".png", "");
        try {
            int dskloc = ArrayFind.indexOf(data, "PNGDIVIDER".getBytes("UTF-8")) + 10;
            byte[] dsk = new byte[data.length - dskloc];
            System.arraycopy(data, dskloc, dsk, 0, dsk.length);
            byte[] disk = Compressor.gUnzip(dsk);
            DSK_Load(name, disk);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void savePNGDisk() {
        Thread save = new Thread() {
            public void run() {
                BufferedImage image = new BufferedImage(384, 272, BufferedImage.TYPE_INT_RGB);
                image.getGraphics().drawImage(display.getImag(), 0, 0, 384, 272, null);
                FileDialog filedia = new FileDialog((Frame) new JFrame(),
                        "Save PNG Disk image", FileDialog.SAVE);
                filedia.setFile("*dsk.png");
                filedia.setVisible(true);
                String filename = filedia.getFile();
                if (filename != null) {
                    filename = filedia.getDirectory() + filedia.getFile();
                    if (!filename.toLowerCase().endsWith(".dsk.png")) {
                        filename += ".dsk.png";
                    }
                    try {
                        byte[] disk = fdc.getDrive(0).getDisc(0).getImage();
                        byte[] dsk = Compressor.gZip(disk);
                        File file = new File(filename);
                        javax.imageio.ImageIO.write(image, "PNG", file);
                        BufferedInputStream bin = new BufferedInputStream(new FileInputStream(file));
                        byte[] png = new byte[bin.available()];
                        bin.read(png);
                        bin.close();
                        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
                        bos.write(png);
                        bos.write("PNGDIVIDER".getBytes("UTF-8"));
                        bos.write(dsk);
                        bos.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

            }
        };
        save.start();
    }
    BufferedImage diskimage;
    String dskname = "empty";

    public void CAT() {
        System.out.println("Directory of drive DF" + catdrive + ":");
        System.out.println("-----------------------");

        try {
            String entry[] = fdc.getInfo(catdrive);

            for (int i = 0; i
                    < entry.length; i += 2) {
                System.out.print(entry[i] + "    ");

                try {
                    System.out.println(entry[i + 1]);

                } catch (Exception f) {
                    System.out.println();

                }
            }
            System.out.println();

        } catch (Exception e) {
            System.out.println("Directory or Drive is empty.\r\n");

        }
    }
    public static boolean cat = false;
    public static int catdrive = 0;

    public void bootDisk(final int drive, final boolean sys) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                fdc.showSys = sys;
                entries = fdc.getInfo(drive);
                users = fdc.getUser();
                int notfound = 0;
                String dr = "";
                String typethis = "";
                String loadthis = "";
                if (drive > 1) {
                    return;
                }
                if (drive == 0) {
                    dr = "";
                } else {
                    dr = "|B:";
                }
                if (entries == null && !sys) {
                    System.out.println("Checking for system files");
                    bootDisk(drive, true);
                    return;
                } else if (entries == null && sys) {
                    fromautoboot = true;
                    BasicAutoType("|CPM");
                    return;
                } else {
                    System.out.println(entries.length + " entries found...");
                }

                if (entries.length < 1 && !sys) {
                    System.out.println("Checking for system files");
                    bootDisk(drive, true);
                    return;
                }
                if (entries.length < 1 && sys) {
                    fromautoboot = true;
                    BasicAutoType("|CPM");
                    return;
                }
                if (entries.length == 1) {
                    cleanEntries(0);
                    if (users[0] != 0) {
                        dr += "|USER," + users[0] + ":";
                    }
                    loadthis = entries[0];
                } else {
                    for (int i = 0; i < entries.length; i++) {
                        entries[i] = entries[i].toUpperCase();
                        if (entries[i].endsWith(".BIN") || entries[i].endsWith(".BIN<") || entries[i].endsWith(".BIN<>") || entries[i].endsWith(".BIN>")) {
                            notfound = i;
                        }
                    }
                    for (int i = 0; i < entries.length; i++) {
                        try {
                            while (entries[i].charAt(0) < '-' || entries[i].charAt(0) > 'Z') {
                                i++;
                            }
                        } catch (Exception e) {
                            i--;
                            break;
                        }
                        try {
                            while (users[i] != 0) {
                                i++;
                            }
                        } catch (Exception e) {
                            i--;
                            break;
                        }
                        System.out.println("Analysing: " + entries[i]);
                        if (entries[i].startsWith("-")) {
                            cleanEntries(i);
                            loadthis = entries[i];
                            if (users[i] != 0) {
                                dr += "|USER," + users[0] + ":";
                            }
                            break;
                        }
                        if (entries[i].contains(".  ") || entries[i].contains("  <") || entries[i].contains("  <>") || entries[i].contains("  >")) {
                            cleanEntries(i);
                            loadthis = entries[i];
                            if (users[i] != 0) {
                                dr += "|USER," + users[0] + ":";
                            }
                            break;
                        }
                        if (entries[i].contains("#")) {
                            cleanEntries(i);
                            loadthis = entries[i];
                            if (users[i] != 0) {
                                dr += "|USER," + users[0] + ":";
                            }
                            break;
                        }
                        if (entries[i].startsWith("DISC.") || entries[i].startsWith("DISK.")) {
                            cleanEntries(i);
                            loadthis = entries[i];
                            if (users[i] != 0) {
                                dr += "|USER," + users[0] + ":";
                            }
                            break;
                        }
                        if (entries[i].endsWith(".BAS") || entries[i].endsWith(".BAS<") || entries[i].endsWith(".BAS<>") || entries[i].endsWith(".BAS>")) {
                            cleanEntries(i);
                            loadthis = entries[i];
                            if (users[i] != 0) {
                                dr += "|USER," + users[0] + ":";
                            }
                            break;
                        }
                        if (i == entries.length - 1 && fdc.getSystem()) {
                            fromautoboot = true;
                            BasicAutoType("|CPM");
                            fdc.seek(0, 0);
                            return;
                        }
                    }
                }
                if (loadthis.length() <= 1) {
                    cleanEntries(notfound);
                    loadthis = entries[notfound];
                }
                typethis += dr;
                if (loadthis.endsWith(".BAS")) {
                    loadthis = loadthis.replace(".BAS", "");
                }
                if (loadthis.endsWith(".")) {
                    loadthis = loadthis.replace(".", "");
                }
                typethis += "RUN\"" + loadthis + "\"\r\n";
                fromautoboot = true;
//                            fdc.seek(0, 0);
                BasicAutoType(typethis);
            }
        });
    }

    public void cleanEntries(int i) {
        entries[i] = entries[i].replaceAll(">", "");
        entries[i] = entries[i].replaceAll("<", "");
        entries[i] = entries[i].replaceAll(" ", "");

    }

    public int[] getUser() {
        return fdc.getUser();
    }

    public void diskInspector(int drive) {
        final int drivec = drive;
        loadFile.dispose();
        final int choosend = drive;
        enter = null;
        entries = null;
        entries = fdc.getInfo(drive);

        if (entries == null) {
            return;

        }
        System.out.println(entries.length + " entries found...");
        final int[] user = fdc.getUser();
        enter = new String[entries.length][4];

        for (int i = 0; i
                < entries.length; i++) {
            if (entries[i].endsWith(">")) {
                entries[i] = entries[i].replaceAll(">", "");
                enter[i][2] = "*";

            } else {
                enter[i][2] = "";

            }
            if (entries[i].endsWith("<")) {
                entries[i] = entries[i].replaceAll("<", "");
                enter[i][3] = "*";

            } else {
                enter[i][3] = "";

            }

            enter[i][0] = entries[i];
            enter[i][1] = "USER:" + user[i];

        }
        if (entries != null) {
            fileTable = new JTable(new driveTable());
            fileTable.repaint();
            fileTable.setShowGrid(true);
            fileTable.setFocusable(false);
            fileTable.setColumnSelectionAllowed(false);
            fileTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
            fileTable.setFont(new Font("Monospaced", 1, 12));
            fileTable.setSelectionBackground(Color.BLUE);
            fileTable.setSelectionForeground(Color.WHITE);
            loadFile = new JDialog(new Frame(), "Load file from disk");
            loadFile.setAlwaysOnTop(true);
            loadFile.setLayout(new BorderLayout());
            loadFile.add(new JScrollPane(fileTable), BorderLayout.CENTER);
            loadFile.add(fileTable.getTableHeader(), BorderLayout.NORTH);
            JPanel jp = new JPanel();
            JButton jb;

            if (fdc.getSystem() && drive == 0) {
                jp.add(jb = new JButton("Boot CPM"));
                jb.setBorder(new BevelBorder(BevelBorder.RAISED));
                jb.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent ae) {
                        fromautoboot = true;
                        BasicAutoType("|CPM");
                        loadFile.setVisible(false);

                    }
                });

            }
            jp.add(jb = new JButton("Run file"));
            jb.setBorder(new BevelBorder(BevelBorder.RAISED));
            jb.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent ae) {
                    int choosen = fileTable.getSelectedRow();

                    if (choosen >= 0) {
                        System.out.println("file choosen:" + choosen);
                        entries[choosen] = entries[choosen].replace(" ", "");

                        if (entries[choosen].endsWith(".")) {
                            entries[choosen] = entries[choosen].replace(".", "");

                        }
                        String us = "|USER," + user[choosen] + ":";
                        String before = "";

                        if (choosend == 0) {
                            before = "|A:";

                        }
                        if (choosend == 1) {
                            before = "|B:";

                        }
                        fromautoboot = true;
                        BasicAutoType(before + us + "RUN\"" + entries[choosen] + "\"");

                    }
                    loadFile.setVisible(false);

                }
            });
            jp.add(jb = new JButton("Load file"));
            jb.setBorder(new BevelBorder(BevelBorder.RAISED));
            jb.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent ae) {
                    int choosen = fileTable.getSelectedRow();

                    if (choosen >= 0) {
                        System.out.println("file choosen:" + choosen);
                        entries[choosen] = entries[choosen].replace(" ", "");

                        if (entries[choosen].endsWith(".")) {
                            entries[choosen] = entries[choosen].replace(".", "");

                        }
                        String us = "|USER," + user[choosen] + ":";
                        String before = "";

                        if (choosend == 0) {
                            before = "|A:";

                        }
                        if (choosend == 1) {
                            before = "|B:";

                        }
                        fromautoboot = true;
                        BasicAutoType(before + us + "LOAD\"" + entries[choosen] + "\"");

                    }
                    loadFile.setVisible(false);

                }
            });
            jp.add(jb = new JButton("Autoboot"));
            jb.setBorder(new BevelBorder(BevelBorder.RAISED));
            jb.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent ae) {
                    if (fdc.showSys) {
                        bootDisk(drivec, true);

                    } else {
                        bootDisk(drivec, false);

                    }
                    loadFile.setVisible(false);

                }
            });

            if (fdc.showSys) {
                jp.add(jb = new JButton("Hide Systemfiles"));
                jb.setBorder(new BevelBorder(BevelBorder.RAISED));
                jb.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent ae) {
                        fdc.showSys = false;
                        loadFile.setVisible(false);
                        diskInspector(
                                drivec);

                    }
                });

            } else {
                jp.add(jb = new JButton("Show Systemfiles"));
                jb.setBorder(new BevelBorder(BevelBorder.RAISED));
                jb.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent ae) {
                        fdc.showSys = true;
                        loadFile.setVisible(false);
                        diskInspector(
                                drivec);

                    }
                });

            }
            jp.add(jb = new JButton("Cancel"));
            jb.setBorder(new BevelBorder(BevelBorder.RAISED));
            jb.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent ae) {
                    loadFile.setVisible(false);

                }
            });
            loadFile.add(jp, BorderLayout.PAGE_END);
            JTextField jl;
            loadFile.add(jl = new JTextField(entries.length + " directory entries found"), BorderLayout.PAGE_START);
            jl.setEditable(false);
            loadFile.setSize(440, 300);
            loadFile.setResizable(false);
            final Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
            loadFile.setLocation((d.width - loadFile.getSize().width) / 2, (d.height - loadFile.getSize().height) / 2);
            loadFile.setVisible(true);

        }
    }

    protected class driveTable extends AbstractTableModel {

        String[][] data = enter;
        String[] columns = {"Filename:", "User:", "SYS:", "R/O:"};

        public int getColumnCount() {
            return 4;
        }

        public int getRowCount() {
            return data.length;
        }

        @Override
        public String getColumnName(int c) {
            return columns[c];
        }

        public Object getValueAt(int rowIndex, int colIndex) {
            return data[rowIndex][colIndex];
        }

        @Override
        public boolean isCellEditable(int rowIndex, int colIndex) {
            return false;
        }
    }
    ItemListener OCPListener = new ItemListener() {
        public void itemStateChanged(ItemEvent itemEvent) {
            int state = itemEvent.getStateChange();

            if (state == ItemEvent.SELECTED) {
                saveOCP = true;

            }
            if (state == ItemEvent.DESELECTED) {
                saveOCP = false;

            }
        }
    };

    public String unLHA(String name) {
        del = false;
        String ret = name;

        try {
            int BUFFSER_SIZE = 4096;

            byte[] buff = new byte[BUFFSER_SIZE];
            File check = new File(name);
            LhaFile file = new LhaFile(name);
            Iterator iter = file.entryIterator();

            while (iter.hasNext()) {
                LhaEntry entry = (LhaEntry) iter.next();

                File dst = entry.getFile();
                System.out.println("EXTRACT FILE        = " + entry.getFile());
                System.out.println("    METHOD          = " + entry.getMethod());
                System.out.println("    COMPRESSED SIZE = " + entry.getCompressedSize());
                System.out.println("    ORIGINAL SIZE   = " + entry.getOriginalSize());
                System.out.println("    TIME STAMP      = " + entry.getTimeStamp());

                if (entry.getMethod().equals(LhaEntry.METHOD_SIG_LHD)) {
                    dst.mkdirs();

                } else {
                    File parent = dst.getParentFile();

                    if (parent != null) {
                        parent.mkdirs();

                    }

                    InputStream in = new BufferedInputStream(file.getInputStream(entry),
                            BUFFSER_SIZE);
                    OutputStream out = new BufferedOutputStream(new FileOutputStream(check.getPath() + "_" + dst),
                            BUFFSER_SIZE);

                    while (true) {
                        int len = in.read(buff, 0, BUFFSER_SIZE);

                        if (len < 0) {
                            break;

                        }

                        out.write(buff, 0, len);

                    }

                    out.flush();
                    out.close();
                    ret = check.getPath() + "_" + dst.getName();

                }
            }

            file.close();

            del = true;

        } catch (Exception e) {
            //e.printStackTrace();
        }
        System.out.println(ret);

        return ret;

    }

    public void loadEntry(int index, int drive) {
        try {
            if (disknames[index].toLowerCase().endsWith("dsk")) {
                int drv = this.getCurrentDrive();
                this.setCurrentDrive(drive);
                this.DSK_Load(disknames[index], disks[index]);
                this.setCurrentDrive(drv);
            }
            if (disknames[index].toLowerCase().endsWith("cdt")
                    || disknames[index].toLowerCase().endsWith("tzx")) {
                CDT_Load(disknames[index], disks[index]);

            }
            if (disknames[index].toLowerCase().endsWith("sna")) {
                SNA_Load(disknames[index], disks[index]);

            }
            if (disknames[index].toLowerCase().endsWith("csw")) {
                CSWLoad(disknames[index], disks[index]);

            }
        } catch (Exception er) {
            er.printStackTrace();
        }
    }

    public void pressPlay() {
        TapeDrive.pressPlay();

    }

    public void pressRec() {
        TapeDrive.pressRec(false);

    }

    public void pressRew() {
        TapeDrive.pressRew();

    }

    public void pressFwd() {
        TapeDrive.pressFwd();

    }

    public void pressStop() {
        TapeDrive.pressStop();
    }

    public void pressPause() {
        TapeDrive.pressPause();

    }

    // 248
    public String getCounter() {
        int counter = 0;
        try {
            counter = tapeBandPosition / ((2045000) / (byte) tape_delay);
        } catch (Exception e) {
        }
        String before = "";

        if (counter <= 9999) {
            before = "";

        }
        if (counter <= 999) {
            before = "0";

        }
        if (counter <= 99) {
            before = "00";

        }
        if (counter <= 9) {
            before = "000";

        }
        return before + counter;

    }

    public static String getCount() {
        int counter = tapeBandPosition / ((2045000) / (byte) tape_delay);
        String before = "";

        if (counter <= 9999) {
            before = "";

        }
        if (counter <= 999) {
            before = "0";

        }
        if (counter <= 99) {
            before = "00";

        }
        if (counter <= 9) {
            before = "000";

        }
        return before + counter;

    }
    public static byte[][] movie;
    public static int moviecount = 0;
    public static int maxcount = 0;
    protected int smode = 0;
    public static boolean initmovie;
    protected boolean hasMP3;

    public static int movieFPS = 30;

    byte[] moviePalette = new byte[20];

    public void restoreMovie(final String filename, final byte[] data) {
        this.reset();
        Thread thread = new Thread() {
            public void run() {
                try {
                    System.arraycopy(data, 0, moviePalette, 0, moviePalette.length);
                    infotimer = 1;
                    playmovie = true;
                    String mp3name = filename;
                    mp3name = mp3name.substring(0, mp3name.length() - 4);
                    mp3name += ".mp3";
                    File b = new File(mp3name);
                    if (b.exists()) {
                        loadFile(0, mp3name);
                        hasMP3 = true;
                    }
                    movie = null;
                    System.gc();
                    movie = new byte[(data.length - 17) / 0x4000][0x4000];
                    System.out.println("Movie has " + movie.length + " frames");
                    initmovie = false;
                    int testFPS = data[0] & 0x0ff;
                    int off = 0;
                    if (testFPS > 3) {
                        movieFPS = testFPS;
                        off++;
                    } else {
                        movieFPS = 20;
                    }
                    smode = data[off];
//                    INK(-1, data[off + 1]);
                    int mcount = 0;
                    int mlen = 0;
//                    for (int i = off + 1; i < off + 17; i++) {
//                        INK(i - 1 - off, data[i]);
//                    }
                    for (int i = 17 + off; i < data.length; i++) {
                        if (mcount > 24999) {
                            break;
                        }
                        movie[mcount][mlen] = data[i];
                        mlen++;
                        if (mlen == 0x4000) {
                            mlen = 0;
                            mcount++;
                        }
                    }
                    System.out.println("Movie has " + mcount + " frames");
                    maxcount = mcount - 1;
                    moviecount = 0;
                    resync = true;

                } catch (Exception e) {
                }
            }
        };
        thread.start();
    }

    boolean playMP3 = false;

    public void stopMovie() {
        System.out.println("Stopping Movie");
        moviecount = 0;
        playmovie = false;
        this.stopTapeMotor();
        playMP3 = false;
        hasMP3 = false;
        this.reset();
    }

    int infotimer;

    public void playMovie() {
        try {
            if (hasMP3 && !mp3loaded) {
                return;
            }
            if (infotimer > 0) {
                infotimer++;
                if (infotimer == 10) {
                    this.INK(0, 0);
                    this.INK(1, 26);
                    this.INK(16, 2);
                    this.BasicAutoType("'    **** JavaCPC MoviePlayer *****     "
                            + "                                          Movie info: "
                            + movieFPS + " FPS - " + maxcount + " Frames                    ");
                    this.reSync();
                }
                if (infotimer == 90) {
                    this.reSync();

                    int testFPS = moviePalette[0] & 0x0ff;
                    int off = 0;
                    if (testFPS > 3) {
                        movieFPS = testFPS;
                        off++;
                    } else {
                        movieFPS = 20;
                    }
                    smode = moviePalette[off];
                    INK(-1, moviePalette[off + 1]);
                    for (int i = off + 1; i < off + 17; i++) {
                        INK(i - 1 - off, moviePalette[i]);
                    }
                    this.BasicAutoType("MODE " + smode);
                }
                if (infotimer == 120) {
                    infotimer = 0;
                }
                return;
            }
            if (!playMP3 && mp3loaded && hasMP3) {
                this.startTapeMotor();
                this.tapeBandPosition = 0;
                playMP3 = true;
            }
            if (moviecount >= maxcount) {
                if (jemu.ui.paint.MovieMaker.loop.isSelected()) {
                    System.out.println("Repeating Movie");
                    moviecount = 0;
                    if (hasMP3) {
                        this.tapeBandPosition = 0;
                        TapeDrive.pressPlay();
                        this.startTapeMotor();
                        playMP3 = true;
                    }
                } else {
                    stopMovie();
                }
                return;
            }
            System.arraycopy(movie[moviecount++], 0, GateArray.screenmemory, 0xc000, 0x4000);
        } catch (Exception e) {
            stopMovie();
        }
    }
    protected int[] GateArrayINKs = {
        20, 4, 21, 28, 24, 29, 12, 5, 13,
        22, 6, 23, 30, 0, 31, 14, 7, 15,
        18, 2, 19, 26, 25, 27, 10, 3, 11
    };

    public void INK(int pen, int ink) {
        if (pen == 16) {
            pen = -1;
        }
        int addressA = 0xb7d4;
        int addressB = 0xb7e5;
        if (Switches.ROM.equals("CPC464")) {
            addressA = 0xb1d9;
            addressB = 0xb1ea;
        }
        POKE(addressA + 1 + pen, GateArrayINKs[ink]);
        POKE(addressB + 1 + pen, GateArrayINKs[ink]);
    }

    public void INK(int pen, int ink, int inkb) {
        if (pen == 16) {
            pen = -1;
        }
        int addressA = 0xb7d4;
        int addressB = 0xb7e5;

        if (Switches.ROM.equals("CPC464")) {
            addressA = 0xb1d9;
            addressB = 0xb1ea;
        }
        POKE(addressA + 1 + pen, GateArrayINKs[ink]);
        POKE(addressB + 1 + pen, GateArrayINKs[inkb]);
    }

    public void softReset() {
        tapei = tapep = 0;
        disableresync = false;
        ssa1.reset();
        // initpaint = 0;
        doLoad = 0;
        portB = 0;
        YMControl.displaycount1 = 0;
        YMControl.displaycount2 = 0;
        YMControl.DisplayStart = 0;
        psg.changeClockSpeed(CYCLES_PER_SECOND_CPC);
        st_mode = false;
        zx_mode = false;

        if (YM_Play) {
            YM_Play = false;
            YM_Stop = true;
            System.out.println("Playback stopped...");

        }
        Switches.turbo = 1;
        JEMU.turbo.setState(false);
        jemu.ui.Desktop.jCheckBox8.setSelected(false);
        z80.setPC(0);
        fdc.reset();
        memory.reset();
        reSync();
        z80.reset();

    }
}
