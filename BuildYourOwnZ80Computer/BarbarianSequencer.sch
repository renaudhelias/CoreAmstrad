<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CRTC_NORMAL(7:0)" />
        <signal name="CLK50MHz" />
        <signal name="CLK1MHz" />
        <signal name="CLK25MHz" />
        <signal name="MIRROR_1(7:0)" />
        <signal name="MIRROR_0(7:0)" />
        <signal name="CRTC_EXTEND(7:0)" />
        <signal name="Z80_WR_MEM" />
        <signal name="Z80_RD_MEM" />
        <signal name="VRAM_WE" />
        <signal name="VRAM_ADDR(9:0)" />
        <signal name="A14" />
        <signal name="A15" />
        <signal name="BUFFER_DISPLAY_ENABLE" />
        <signal name="BUFFER_WR_MEM_ENABLE" />
        <signal name="BUFFER_RD_MEM_ENABLE" />
        <port polarity="Input" name="CRTC_NORMAL(7:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CLK1MHz" />
        <port polarity="Output" name="CLK25MHz" />
        <port polarity="Input" name="MIRROR_1(7:0)" />
        <port polarity="Input" name="MIRROR_0(7:0)" />
        <port polarity="Input" name="CRTC_EXTEND(7:0)" />
        <port polarity="Input" name="Z80_WR_MEM" />
        <port polarity="Input" name="Z80_RD_MEM" />
        <port polarity="Output" name="VRAM_WE" />
        <port polarity="Output" name="VRAM_ADDR(9:0)" />
        <port polarity="Input" name="A14" />
        <port polarity="Input" name="A15" />
        <port polarity="Output" name="BUFFER_DISPLAY_ENABLE" />
        <port polarity="Output" name="BUFFER_WR_MEM_ENABLE" />
        <port polarity="Output" name="BUFFER_RD_MEM_ENABLE" />
        <blockdef name="CLK_commander">
            <timestamp>2010-12-14T14:45:57</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-448" height="512" />
        </blockdef>
        <block symbolname="CLK_commander" name="XLXI_1">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="CLK100MHz" />
            <blockpin signalname="CLK25MHz" name="CLK25MHz" />
            <blockpin signalname="CLK1MHz" name="CLK1MHz" />
            <blockpin name="PREPARE_WRITE" />
            <blockpin name="DO_WRITE" />
            <blockpin name="PREPARE_READ" />
            <blockpin name="DO_READ" />
            <blockpin name="CLK4MHz" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <branch name="CRTC_NORMAL(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="576" y="320" type="branch" />
            <wire x2="576" y1="320" y2="320" x1="400" />
        </branch>
        <instance x="992" y="960" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="992" y1="544" y2="544" x1="928" />
        </branch>
        <branch name="CLK1MHz">
            <wire x2="1504" y1="672" y2="672" x1="1456" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="1504" y1="608" y2="608" x1="1456" />
        </branch>
        <branch name="MIRROR_1(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="576" y="240" type="branch" />
            <wire x2="576" y1="240" y2="240" x1="368" />
        </branch>
        <branch name="MIRROR_0(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="560" y="160" type="branch" />
            <wire x2="560" y1="160" y2="160" x1="352" />
        </branch>
        <branch name="CRTC_EXTEND(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="592" y="400" type="branch" />
            <wire x2="592" y1="400" y2="400" x1="432" />
        </branch>
        <branch name="Z80_WR_MEM">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1328" y="272" type="branch" />
            <wire x2="1328" y1="272" y2="272" x1="1216" />
        </branch>
        <branch name="Z80_RD_MEM">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1328" y="336" type="branch" />
            <wire x2="1328" y1="336" y2="336" x1="1232" />
        </branch>
        <branch name="VRAM_WE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1152" y="176" type="branch" />
            <wire x2="1232" y1="176" y2="176" x1="1152" />
        </branch>
        <branch name="VRAM_ADDR(9:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1168" y="96" type="branch" />
            <wire x2="1248" y1="96" y2="96" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="400" y="320" name="CRTC_NORMAL(7:0)" orien="R180" />
        <iomarker fontsize="28" x="928" y="544" name="CLK50MHz" orien="R180" />
        <iomarker fontsize="28" x="1504" y="608" name="CLK25MHz" orien="R0" />
        <iomarker fontsize="28" x="1504" y="672" name="CLK1MHz" orien="R0" />
        <iomarker fontsize="28" x="368" y="240" name="MIRROR_1(7:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="160" name="MIRROR_0(7:0)" orien="R180" />
        <iomarker fontsize="28" x="432" y="400" name="CRTC_EXTEND(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1216" y="272" name="Z80_WR_MEM" orien="R180" />
        <iomarker fontsize="28" x="1232" y="336" name="Z80_RD_MEM" orien="R180" />
        <iomarker fontsize="28" x="1232" y="176" name="VRAM_WE" orien="R0" />
        <iomarker fontsize="28" x="1248" y="96" name="VRAM_ADDR(9:0)" orien="R0" />
        <branch name="A14">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="384" y="592" type="branch" />
            <wire x2="384" y1="592" y2="592" x1="224" />
        </branch>
        <branch name="A15">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="368" y="688" type="branch" />
            <wire x2="368" y1="688" y2="688" x1="208" />
        </branch>
        <iomarker fontsize="28" x="224" y="592" name="A14" orien="R180" />
        <iomarker fontsize="28" x="208" y="688" name="A15" orien="R180" />
        <branch name="BUFFER_DISPLAY_ENABLE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="976" type="branch" />
            <wire x2="576" y1="976" y2="976" x1="448" />
        </branch>
        <branch name="BUFFER_WR_MEM_ENABLE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="912" type="branch" />
            <wire x2="576" y1="912" y2="912" x1="448" />
        </branch>
        <branch name="BUFFER_RD_MEM_ENABLE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="864" type="branch" />
            <wire x2="576" y1="864" y2="864" x1="448" />
        </branch>
        <iomarker fontsize="28" x="576" y="864" name="BUFFER_RD_MEM_ENABLE" orien="R0" />
        <iomarker fontsize="28" x="576" y="912" name="BUFFER_WR_MEM_ENABLE" orien="R0" />
        <iomarker fontsize="28" x="576" y="976" name="BUFFER_DISPLAY_ENABLE" orien="R0" />
    </sheet>
</drawing>