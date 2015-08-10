<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="zero" />
        <signal name="ram_D(7:0)" />
        <signal name="pic_W" />
        <signal name="pic_A(14:0)" />
        <signal name="pic_D(7:0)" />
        <signal name="CLK50MHz" />
        <signal name="CE1" />
        <signal name="UB1" />
        <signal name="LB1" />
        <signal name="OE1" />
        <signal name="LED" />
        <signal name="ram_W" />
        <signal name="SWITCH_FILL" />
        <signal name="ram_A(14:0)" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="XLXN_552" />
        <signal name="A(13:0)" />
        <signal name="zero,zero,zero,zero,zero,A(13:0)" />
        <port polarity="BiDirectional" name="ram_D(7:0)" />
        <port polarity="Input" name="pic_W" />
        <port polarity="Input" name="pic_A(14:0)" />
        <port polarity="Input" name="pic_D(7:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CE1" />
        <port polarity="Output" name="UB1" />
        <port polarity="Output" name="LB1" />
        <port polarity="Output" name="OE1" />
        <port polarity="Output" name="LED" />
        <port polarity="Output" name="ram_W" />
        <port polarity="Input" name="SWITCH_FILL" />
        <port polarity="Output" name="ram_A(14:0)" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="CLK_commander">
            <timestamp>2010-12-22T17:16:0</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="336" x="64" y="-448" height="512" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="RAMFiller">
            <timestamp>2011-1-7T11:6:16</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-12-20T16:48:42</timestamp>
            <rect width="304" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_141">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="CLK_commander" name="XLXI_1">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="CLK100MHz" />
            <blockpin signalname="XLXN_552" name="CLK25MHz" />
            <blockpin name="CLK1MHz" />
            <blockpin name="CLK4MHz" />
        </block>
        <block symbolname="inv" name="XLXI_159">
            <blockpin signalname="SWITCH_FILL" name="I" />
            <blockpin signalname="LED" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_163">
            <blockpin signalname="CE1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_164">
            <blockpin signalname="UB1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_165">
            <blockpin signalname="LB1" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_166">
            <blockpin signalname="LED" name="I" />
            <blockpin signalname="OE1" name="O" />
        </block>
        <block symbolname="RAMFiller" name="XLXI_144">
            <blockpin signalname="pic_W" name="pic_W" />
            <blockpin signalname="SWITCH_FILL" name="FILL" />
            <blockpin signalname="pic_A(14:0)" name="pic_A(15:0)" />
            <blockpin signalname="pic_D(7:0)" name="pic_D(7:0)" />
            <blockpin signalname="zero,zero,zero,zero,zero,A(13:0)" name="A(18:0)" />
            <blockpin signalname="ram_W" name="ram_W" />
            <blockpin signalname="ram_A(14:0)" name="ram_A(14:0)" />
            <blockpin signalname="ram_D(7:0)" name="ram_D(7:0)" />
        </block>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_170">
            <blockpin signalname="XLXN_552" name="CLK_25MHz" />
            <blockpin signalname="ram_D(7:0)" name="DATA(7:0)" />
            <blockpin name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="A(13:0)" name="ADDRESS(13:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="336" y="1008" type="branch" />
            <wire x2="336" y1="1008" y2="1136" x1="336" />
        </branch>
        <instance x="272" y="1264" name="XLXI_141" orien="R0" />
        <branch name="ram_D(7:0)">
            <wire x2="2304" y1="592" y2="1440" x1="2304" />
            <wire x2="2352" y1="1440" y2="1440" x1="2304" />
            <wire x2="2640" y1="592" y2="592" x1="2304" />
            <wire x2="2640" y1="592" y2="688" x1="2640" />
            <wire x2="2640" y1="688" y2="704" x1="2640" />
            <wire x2="2640" y1="480" y2="480" x1="2624" />
            <wire x2="2640" y1="480" y2="592" x1="2640" />
        </branch>
        <branch name="pic_W">
            <wire x2="2144" y1="224" y2="224" x1="2128" />
            <wire x2="2240" y1="224" y2="224" x1="2144" />
        </branch>
        <branch name="pic_A(14:0)">
            <wire x2="2144" y1="352" y2="352" x1="2128" />
            <wire x2="2240" y1="352" y2="352" x1="2144" />
        </branch>
        <branch name="pic_D(7:0)">
            <wire x2="2144" y1="416" y2="416" x1="2128" />
            <wire x2="2240" y1="416" y2="416" x1="2144" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="176" y1="352" y2="416" x1="176" />
            <wire x2="208" y1="352" y2="352" x1="176" />
        </branch>
        <instance x="208" y="768" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1504" y="224" name="XLXI_159" orien="R0" />
        <branch name="CE1">
            <wire x2="1808" y1="1296" y2="1360" x1="1808" />
        </branch>
        <branch name="UB1">
            <wire x2="1936" y1="1296" y2="1360" x1="1936" />
        </branch>
        <branch name="LB1">
            <wire x2="2064" y1="1296" y2="1360" x1="2064" />
        </branch>
        <instance x="1872" y="1168" name="XLXI_163" orien="R180" />
        <instance x="2000" y="1168" name="XLXI_164" orien="R180" />
        <instance x="2128" y="1168" name="XLXI_165" orien="R180" />
        <branch name="OE1">
            <wire x2="2096" y1="160" y2="160" x1="2048" />
        </branch>
        <instance x="1824" y="192" name="XLXI_166" orien="R0" />
        <branch name="LED">
            <wire x2="1776" y1="192" y2="192" x1="1728" />
            <wire x2="1776" y1="192" y2="336" x1="1776" />
            <wire x2="1776" y1="160" y2="192" x1="1776" />
            <wire x2="1824" y1="160" y2="160" x1="1776" />
        </branch>
        <branch name="ram_W">
            <wire x2="2880" y1="224" y2="224" x1="2624" />
            <wire x2="2896" y1="224" y2="224" x1="2880" />
        </branch>
        <branch name="SWITCH_FILL">
            <wire x2="1456" y1="288" y2="288" x1="1360" />
            <wire x2="1552" y1="288" y2="288" x1="1456" />
            <wire x2="2240" y1="288" y2="288" x1="1552" />
            <wire x2="1504" y1="192" y2="192" x1="1456" />
            <wire x2="1456" y1="192" y2="288" x1="1456" />
        </branch>
        <instance x="2240" y="512" name="XLXI_144" orien="R0">
        </instance>
        <branch name="ram_A(14:0)">
            <wire x2="2784" y1="352" y2="352" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2640" y="704" name="ram_D(7:0)" orien="R90" />
        <iomarker fontsize="28" x="2128" y="224" name="pic_W" orien="R180" />
        <iomarker fontsize="28" x="2128" y="352" name="pic_A(14:0)" orien="R180" />
        <iomarker fontsize="28" x="2128" y="416" name="pic_D(7:0)" orien="R180" />
        <iomarker fontsize="28" x="176" y="416" name="CLK50MHz" orien="R90" />
        <iomarker fontsize="28" x="1360" y="288" name="SWITCH_FILL" orien="R180" />
        <iomarker fontsize="28" x="1808" y="1360" name="CE1" orien="R90" />
        <iomarker fontsize="28" x="2064" y="1360" name="LB1" orien="R90" />
        <iomarker fontsize="28" x="1936" y="1360" name="UB1" orien="R90" />
        <iomarker fontsize="28" x="2096" y="160" name="OE1" orien="R0" />
        <iomarker fontsize="28" x="2896" y="224" name="ram_W" orien="R0" />
        <iomarker fontsize="28" x="1776" y="336" name="LED" orien="R90" />
        <iomarker fontsize="28" x="2784" y="352" name="ram_A(14:0)" orien="R0" />
        <instance x="2352" y="1472" name="XLXI_170" orien="R0">
        </instance>
        <branch name="RED">
            <wire x2="2848" y1="1120" y2="1120" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1120" name="RED" orien="R0" />
        <branch name="GREEN">
            <wire x2="2848" y1="1184" y2="1184" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1184" name="GREEN" orien="R0" />
        <branch name="BLUE">
            <wire x2="2848" y1="1248" y2="1248" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1248" name="BLUE" orien="R0" />
        <branch name="VSYNC">
            <wire x2="2848" y1="1312" y2="1312" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1312" name="VSYNC" orien="R0" />
        <branch name="HSYNC">
            <wire x2="2848" y1="1376" y2="1376" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1376" name="HSYNC" orien="R0" />
        <branch name="XLXN_552">
            <wire x2="1728" y1="416" y2="416" x1="672" />
            <wire x2="1728" y1="416" y2="912" x1="1728" />
            <wire x2="1744" y1="912" y2="912" x1="1728" />
            <wire x2="1744" y1="912" y2="1056" x1="1744" />
            <wire x2="2352" y1="1056" y2="1056" x1="1744" />
        </branch>
        <branch name="A(13:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2992" y="1440" type="branch" />
            <wire x2="2992" y1="1440" y2="1440" x1="2784" />
        </branch>
        <branch name="zero,zero,zero,zero,zero,A(13:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2144" y="480" type="branch" />
            <wire x2="2240" y1="480" y2="480" x1="2144" />
        </branch>
    </sheet>
</drawing>