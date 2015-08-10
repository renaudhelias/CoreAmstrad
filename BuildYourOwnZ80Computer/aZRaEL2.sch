<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_20(13:0)" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="XLXN_31(7:0)" />
        <signal name="XLXN_32(7:0)" />
        <signal name="CLK50MHz" />
        <signal name="DO_READ" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64" />
        <signal name="CLK1MHz" />
        <signal name="PREPARE_WRITE" />
        <signal name="DO_WRITE" />
        <signal name="PREPARE_READ" />
        <signal name="CLK100MHz" />
        <signal name="CLK25MHz" />
        <signal name="XLXN_74" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="DO_READ" />
        <port polarity="Output" name="CLK1MHz" />
        <port polarity="Output" name="PREPARE_WRITE" />
        <port polarity="Output" name="DO_WRITE" />
        <port polarity="Output" name="PREPARE_READ" />
        <port polarity="Output" name="CLK100MHz" />
        <port polarity="Output" name="CLK25MHz" />
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-11-15T20:55:23</timestamp>
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
        <blockdef name="AZRAEL_128x128_ROM">
            <timestamp>2010-11-13T13:0:14</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="CLK_commander">
            <timestamp>2010-11-15T19:19:44</timestamp>
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
        <blockdef name="ld8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="64" x="0" y="-268" height="24" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
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
        <block symbolname="aZRaEL_vram2vga" name="XLXI_12">
            <blockpin signalname="CLK25MHz" name="CLK_25MHz" />
            <blockpin signalname="XLXN_32(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_63" name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="XLXN_20(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="AZRAEL_128x128_ROM" name="XLXI_15">
            <blockpin signalname="CLK100MHz" name="CLK" />
            <blockpin signalname="XLXN_20(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="XLXN_31(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="CLK_commander" name="XLXI_21">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin signalname="CLK100MHz" name="CLK100MHz" />
            <blockpin signalname="CLK25MHz" name="CLK25MHz" />
            <blockpin signalname="CLK1MHz" name="CLK1MHz" />
            <blockpin signalname="PREPARE_WRITE" name="PREPARE_WRITE" />
            <blockpin signalname="DO_WRITE" name="DO_WRITE" />
            <blockpin signalname="PREPARE_READ" name="PREPARE_READ" />
            <blockpin signalname="DO_READ" name="DO_READ" />
            <blockpin name="CLK4MHz" />
        </block>
        <block symbolname="ld8ce" name="XLXI_24">
            <blockpin signalname="XLXN_64" name="CLR" />
            <blockpin signalname="XLXN_31(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_63" name="G" />
            <blockpin signalname="DO_READ" name="GE" />
            <blockpin signalname="XLXN_32(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_26">
            <blockpin signalname="XLXN_64" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1968" y="704" name="XLXI_12" orien="R0">
        </instance>
        <branch name="RED">
            <wire x2="2608" y1="352" y2="352" x1="2400" />
        </branch>
        <branch name="GREEN">
            <wire x2="2608" y1="416" y2="416" x1="2400" />
        </branch>
        <branch name="BLUE">
            <wire x2="2608" y1="480" y2="480" x1="2400" />
        </branch>
        <branch name="VSYNC">
            <wire x2="2592" y1="544" y2="544" x1="2400" />
        </branch>
        <branch name="HSYNC">
            <wire x2="2608" y1="608" y2="608" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2608" y="352" name="RED" orien="R0" />
        <iomarker fontsize="28" x="2608" y="416" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="2608" y="480" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="2592" y="544" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="2608" y="608" name="HSYNC" orien="R0" />
        <branch name="XLXN_31(7:0)">
            <wire x2="1520" y1="800" y2="928" x1="1520" />
            <wire x2="1584" y1="928" y2="928" x1="1520" />
            <wire x2="1808" y1="800" y2="800" x1="1520" />
            <wire x2="1808" y1="688" y2="688" x1="1760" />
            <wire x2="1808" y1="688" y2="800" x1="1808" />
        </branch>
        <branch name="XLXN_32(7:0)">
            <wire x2="1968" y1="672" y2="672" x1="1904" />
            <wire x2="1904" y1="672" y2="768" x1="1904" />
            <wire x2="2032" y1="768" y2="768" x1="1904" />
            <wire x2="2032" y1="768" y2="928" x1="2032" />
            <wire x2="2032" y1="928" y2="928" x1="1968" />
        </branch>
        <branch name="XLXN_20(13:0)">
            <wire x2="1296" y1="176" y2="752" x1="1296" />
            <wire x2="1376" y1="752" y2="752" x1="1296" />
            <wire x2="2464" y1="176" y2="176" x1="1296" />
            <wire x2="2464" y1="176" y2="672" x1="2464" />
            <wire x2="2464" y1="672" y2="672" x1="2400" />
        </branch>
        <instance x="1376" y="784" name="XLXI_15" orien="R0">
        </instance>
        <instance x="448" y="1024" name="XLXI_21" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="448" y1="608" y2="608" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="608" name="CLK50MHz" orien="R180" />
        <branch name="DO_READ">
            <wire x2="1024" y1="992" y2="992" x1="912" />
            <wire x2="1584" y1="992" y2="992" x1="1024" />
            <wire x2="1024" y1="992" y2="1024" x1="1024" />
        </branch>
        <instance x="1584" y="1184" name="XLXI_24" orien="R0" />
        <branch name="XLXN_63">
            <wire x2="2448" y1="192" y2="192" x1="1360" />
            <wire x2="2448" y1="192" y2="288" x1="2448" />
            <wire x2="1360" y1="192" y2="1056" x1="1360" />
            <wire x2="1584" y1="1056" y2="1056" x1="1360" />
            <wire x2="2448" y1="288" y2="288" x1="2400" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="1584" y1="1152" y2="1152" x1="1536" />
        </branch>
        <instance x="1472" y="1280" name="XLXI_26" orien="R0" />
        <branch name="CLK1MHz">
            <wire x2="944" y1="736" y2="736" x1="912" />
        </branch>
        <iomarker fontsize="28" x="944" y="736" name="CLK1MHz" orien="R0" />
        <branch name="PREPARE_WRITE">
            <wire x2="944" y1="800" y2="800" x1="912" />
        </branch>
        <iomarker fontsize="28" x="944" y="800" name="PREPARE_WRITE" orien="R0" />
        <branch name="DO_WRITE">
            <wire x2="944" y1="864" y2="864" x1="912" />
        </branch>
        <iomarker fontsize="28" x="944" y="864" name="DO_WRITE" orien="R0" />
        <branch name="PREPARE_READ">
            <wire x2="944" y1="928" y2="928" x1="912" />
        </branch>
        <iomarker fontsize="28" x="944" y="928" name="PREPARE_READ" orien="R0" />
        <iomarker fontsize="28" x="1024" y="1024" name="DO_READ" orien="R90" />
        <iomarker fontsize="28" x="960" y="528" name="CLK25MHz" orien="R270" />
        <iomarker fontsize="28" x="1056" y="528" name="CLK100MHz" orien="R270" />
        <branch name="CLK100MHz">
            <wire x2="1056" y1="608" y2="608" x1="912" />
            <wire x2="1056" y1="608" y2="688" x1="1056" />
            <wire x2="1376" y1="688" y2="688" x1="1056" />
            <wire x2="1056" y1="528" y2="608" x1="1056" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="960" y1="672" y2="672" x1="912" />
            <wire x2="1344" y1="672" y2="672" x1="960" />
            <wire x2="960" y1="528" y2="672" x1="960" />
            <wire x2="1344" y1="464" y2="672" x1="1344" />
            <wire x2="1424" y1="464" y2="464" x1="1344" />
            <wire x2="1808" y1="464" y2="464" x1="1424" />
            <wire x2="1888" y1="336" y2="336" x1="1808" />
            <wire x2="1808" y1="336" y2="464" x1="1808" />
            <wire x2="1888" y1="288" y2="336" x1="1888" />
            <wire x2="1968" y1="288" y2="288" x1="1888" />
        </branch>
    </sheet>
</drawing>