<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="PS2_CLK" />
        <signal name="PS2_DATA" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_9" />
        <signal name="PRESS" />
        <signal name="UNPRESS" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <port polarity="Input" name="PS2_CLK" />
        <port polarity="Input" name="PS2_DATA" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="PRESS" />
        <port polarity="Output" name="UNPRESS" />
        <blockdef name="ps2kbd_revised">
            <timestamp>2011-4-15T23:48:36</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="divideby3">
            <timestamp>2011-4-16T2:54:55</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="divideby2">
            <timestamp>2011-2-10T17:25:54</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <block symbolname="ps2kbd_revised" name="XLXI_489">
            <blockpin signalname="XLXN_9" name="Rst_n" />
            <blockpin signalname="XLXN_10" name="Clk_circuit" />
            <blockpin signalname="PS2_CLK" name="PS2_Clk" />
            <blockpin signalname="PS2_DATA" name="PS2_Data" />
            <blockpin signalname="PRESS" name="Press" />
            <blockpin signalname="UNPRESS" name="Release" />
            <blockpin name="ScanCode(7:0)" />
        </block>
        <block symbolname="divideby3" name="XLXI_490">
            <blockpin signalname="CLK50MHz" name="CLKin" />
            <blockpin signalname="XLXN_6" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_491">
            <blockpin signalname="XLXN_6" name="CLKin" />
            <blockpin signalname="XLXN_7" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_492">
            <blockpin signalname="XLXN_7" name="CLKin" />
            <blockpin signalname="XLXN_11" name="CLKout" />
        </block>
        <block symbolname="vcc" name="XLXI_493">
            <blockpin signalname="XLXN_9" name="P" />
        </block>
        <block symbolname="inv" name="XLXI_494">
            <blockpin signalname="XLXN_11" name="I" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="PS2_CLK">
            <wire x2="2032" y1="992" y2="992" x1="1936" />
        </branch>
        <branch name="PS2_DATA">
            <wire x2="2032" y1="1056" y2="1056" x1="1936" />
        </branch>
        <instance x="2032" y="1088" name="XLXI_489" orien="R0">
        </instance>
        <instance x="768" y="592" name="XLXI_491" orien="R0">
        </instance>
        <instance x="752" y="864" name="XLXI_492" orien="R0">
        </instance>
        <instance x="752" y="336" name="XLXI_490" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="752" y1="304" y2="304" x1="608" />
        </branch>
        <iomarker fontsize="28" x="608" y="304" name="CLK50MHz" orien="R180" />
        <branch name="XLXN_6">
            <wire x2="768" y1="560" y2="560" x1="688" />
            <wire x2="688" y1="560" y2="672" x1="688" />
            <wire x2="1216" y1="672" y2="672" x1="688" />
            <wire x2="1216" y1="304" y2="304" x1="1136" />
            <wire x2="1216" y1="304" y2="672" x1="1216" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="672" y1="736" y2="832" x1="672" />
            <wire x2="752" y1="832" y2="832" x1="672" />
            <wire x2="1200" y1="736" y2="736" x1="672" />
            <wire x2="1200" y1="560" y2="560" x1="1152" />
            <wire x2="1200" y1="560" y2="736" x1="1200" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="2032" y1="928" y2="928" x1="1520" />
        </branch>
        <instance x="1456" y="928" name="XLXI_493" orien="R0" />
        <branch name="PRESS">
            <wire x2="2496" y1="864" y2="864" x1="2416" />
        </branch>
        <branch name="UNPRESS">
            <wire x2="2496" y1="960" y2="960" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="2496" y="864" name="PRESS" orien="R0" />
        <iomarker fontsize="28" x="2496" y="960" name="UNPRESS" orien="R0" />
        <instance x="1632" y="896" name="XLXI_494" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="2032" y1="864" y2="864" x1="1856" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1616" y1="832" y2="832" x1="1136" />
            <wire x2="1616" y1="832" y2="864" x1="1616" />
            <wire x2="1632" y1="864" y2="864" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1936" y="1056" name="PS2_DATA" orien="R180" />
        <iomarker fontsize="28" x="1936" y="992" name="PS2_CLK" orien="R180" />
    </sheet>
</drawing>