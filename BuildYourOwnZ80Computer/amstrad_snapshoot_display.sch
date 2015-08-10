<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ram_D(7:0)" />
        <signal name="XLXN_2" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="ram_A(15:0)" />
        <signal name="CE1" />
        <signal name="UB1" />
        <signal name="LB1" />
        <signal name="OE1" />
        <signal name="ram_W" />
        <signal name="CLK50MHz" />
        <port polarity="Input" name="ram_D(7:0)" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Output" name="ram_A(15:0)" />
        <port polarity="Output" name="CE1" />
        <port polarity="Output" name="UB1" />
        <port polarity="Output" name="LB1" />
        <port polarity="Output" name="OE1" />
        <port polarity="Output" name="ram_W" />
        <port polarity="Input" name="CLK50MHz" />
        <blockdef name="aZRaEL_vram2vgaAmstrad">
            <timestamp>2011-1-10T16:50:40</timestamp>
            <rect width="320" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="CLK_commander">
            <timestamp>2011-1-12T22:12:31</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="336" x="64" y="-448" height="512" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="aZRaEL_vram2vgaAmstrad" name="XLXI_1">
            <blockpin signalname="XLXN_2" name="CLK_25MHz" />
            <blockpin signalname="ram_D(7:0)" name="DATA(7:0)" />
            <blockpin name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="ram_A(15:0)" name="ADDRESS(15:0)" />
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
        <block symbolname="gnd" name="XLXI_167">
            <blockpin signalname="OE1" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_166">
            <blockpin signalname="ram_W" name="P" />
        </block>
        <block symbolname="CLK_commander" name="XLXI_2">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="CLK100MHz" />
            <blockpin signalname="XLXN_2" name="CLK25MHz" />
            <blockpin name="CLK1MHz" />
            <blockpin name="CLK4MHz" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1168" y="880" name="XLXI_1" orien="R0">
        </instance>
        <branch name="ram_D(7:0)">
            <wire x2="1168" y1="848" y2="848" x1="1056" />
        </branch>
        <iomarker fontsize="28" x="1056" y="848" name="ram_D(7:0)" orien="R180" />
        <branch name="XLXN_2">
            <wire x2="1152" y1="464" y2="464" x1="784" />
            <wire x2="1168" y1="464" y2="464" x1="1152" />
        </branch>
        <branch name="RED">
            <wire x2="1664" y1="528" y2="528" x1="1616" />
        </branch>
        <branch name="GREEN">
            <wire x2="1664" y1="592" y2="592" x1="1616" />
        </branch>
        <branch name="BLUE">
            <wire x2="1664" y1="656" y2="656" x1="1616" />
        </branch>
        <branch name="VSYNC">
            <wire x2="1664" y1="720" y2="720" x1="1616" />
        </branch>
        <branch name="HSYNC">
            <wire x2="1680" y1="784" y2="784" x1="1616" />
        </branch>
        <branch name="ram_A(15:0)">
            <wire x2="1696" y1="848" y2="848" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1664" y="528" name="RED" orien="R0" />
        <iomarker fontsize="28" x="1664" y="592" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="1664" y="656" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="1664" y="720" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="1680" y="784" name="HSYNC" orien="R0" />
        <iomarker fontsize="28" x="1696" y="848" name="ram_A(15:0)" orien="R0" />
        <instance x="1312" y="992" name="XLXI_163" orien="R180" />
        <instance x="1440" y="992" name="XLXI_164" orien="R180" />
        <instance x="1568" y="992" name="XLXI_165" orien="R180" />
        <branch name="CE1">
            <wire x2="1248" y1="1120" y2="1184" x1="1248" />
        </branch>
        <branch name="UB1">
            <wire x2="1376" y1="1120" y2="1184" x1="1376" />
        </branch>
        <branch name="LB1">
            <wire x2="1504" y1="1120" y2="1184" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1248" y="1184" name="CE1" orien="R90" />
        <iomarker fontsize="28" x="1504" y="1184" name="LB1" orien="R90" />
        <iomarker fontsize="28" x="1376" y="1184" name="UB1" orien="R90" />
        <branch name="OE1">
            <wire x2="1760" y1="1136" y2="1136" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1136" name="OE1" orien="R0" />
        <instance x="1648" y="1264" name="XLXI_167" orien="R0" />
        <branch name="ram_W">
            <wire x2="1760" y1="1056" y2="1056" x1="1712" />
        </branch>
        <instance x="1648" y="1056" name="XLXI_166" orien="R0" />
        <iomarker fontsize="28" x="1760" y="1056" name="ram_W" orien="R0" />
        <instance x="320" y="816" name="XLXI_2" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="320" y1="400" y2="400" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="400" name="CLK50MHz" orien="R180" />
    </sheet>
</drawing>