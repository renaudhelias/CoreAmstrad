<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BUTTONS(7:0)" />
        <signal name="BUTTONS(0)" />
        <signal name="BUTTONS(1)" />
        <signal name="BUTTONS(2)" />
        <signal name="BUTTONS(3)" />
        <signal name="BUTTONS(4)" />
        <signal name="BUTTONS(5)" />
        <signal name="BUTTONS(6)" />
        <signal name="BUTTONS(7)" />
        <signal name="LEDS(7:0)" />
        <signal name="XLXN_80(7:0)" />
        <signal name="TEST0" />
        <signal name="TEST1" />
        <signal name="XLXN_93" />
        <signal name="XLXN_94" />
        <signal name="XLXN_98" />
        <signal name="XLXN_99" />
        <signal name="XLXN_100" />
        <signal name="LEDS(1)" />
        <signal name="LEDS(2)" />
        <signal name="LEDS(3)" />
        <signal name="LEDS(4)" />
        <signal name="LEDS(5)" />
        <signal name="LEDS(6)" />
        <signal name="LEDS(7)" />
        <signal name="LEDS(0)" />
        <port polarity="Input" name="BUTTONS(0)" />
        <port polarity="Input" name="BUTTONS(1)" />
        <port polarity="Input" name="BUTTONS(2)" />
        <port polarity="Input" name="BUTTONS(3)" />
        <port polarity="Input" name="BUTTONS(4)" />
        <port polarity="Input" name="BUTTONS(5)" />
        <port polarity="Input" name="BUTTONS(6)" />
        <port polarity="Input" name="BUTTONS(7)" />
        <port polarity="Input" name="TEST0" />
        <port polarity="Input" name="TEST1" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <port polarity="Output" name="LEDS(0)" />
        <blockdef name="OPEN_BUS">
            <timestamp>2010-9-19T12:4:55</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <block symbolname="OPEN_BUS" name="XLXI_14">
            <blockpin signalname="TEST0" name="CE" />
            <blockpin signalname="BUTTONS(7:0)" name="I(7:0)" />
            <blockpin signalname="XLXN_80(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_36">
            <blockpin signalname="XLXN_94" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_37">
            <blockpin signalname="XLXN_93" name="G" />
        </block>
        <block symbolname="ld8ce" name="XLXI_35">
            <blockpin signalname="XLXN_93" name="CLR" />
            <blockpin signalname="XLXN_80(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_94" name="G" />
            <blockpin signalname="TEST1" name="GE" />
            <blockpin signalname="LEDS(7:0)" name="Q(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <bustap x2="720" y1="720" y2="624" x1="720" />
        <bustap x2="800" y1="720" y2="624" x1="800" />
        <bustap x2="880" y1="720" y2="624" x1="880" />
        <bustap x2="960" y1="720" y2="624" x1="960" />
        <bustap x2="1040" y1="720" y2="624" x1="1040" />
        <bustap x2="1120" y1="720" y2="624" x1="1120" />
        <bustap x2="1200" y1="720" y2="624" x1="1200" />
        <bustap x2="1280" y1="720" y2="624" x1="1280" />
        <branch name="BUTTONS(0)">
            <wire x2="720" y1="512" y2="624" x1="720" />
        </branch>
        <branch name="BUTTONS(1)">
            <wire x2="800" y1="512" y2="624" x1="800" />
        </branch>
        <branch name="BUTTONS(2)">
            <wire x2="880" y1="512" y2="624" x1="880" />
        </branch>
        <branch name="BUTTONS(3)">
            <wire x2="960" y1="512" y2="624" x1="960" />
        </branch>
        <branch name="BUTTONS(4)">
            <wire x2="1040" y1="512" y2="624" x1="1040" />
        </branch>
        <branch name="BUTTONS(5)">
            <wire x2="1120" y1="512" y2="624" x1="1120" />
        </branch>
        <branch name="BUTTONS(6)">
            <wire x2="1200" y1="512" y2="624" x1="1200" />
        </branch>
        <branch name="BUTTONS(7)">
            <wire x2="1280" y1="512" y2="624" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="720" y="512" name="BUTTONS(0)" orien="R270" />
        <iomarker fontsize="28" x="800" y="512" name="BUTTONS(1)" orien="R270" />
        <iomarker fontsize="28" x="880" y="512" name="BUTTONS(2)" orien="R270" />
        <iomarker fontsize="28" x="960" y="512" name="BUTTONS(3)" orien="R270" />
        <iomarker fontsize="28" x="1040" y="512" name="BUTTONS(4)" orien="R270" />
        <iomarker fontsize="28" x="1120" y="512" name="BUTTONS(5)" orien="R270" />
        <iomarker fontsize="28" x="1200" y="512" name="BUTTONS(6)" orien="R270" />
        <iomarker fontsize="28" x="1280" y="512" name="BUTTONS(7)" orien="R270" />
        <branch name="XLXN_80(7:0)">
            <wire x2="1488" y1="816" y2="816" x1="1472" />
            <wire x2="1472" y1="816" y2="976" x1="1472" />
            <wire x2="1552" y1="976" y2="976" x1="1472" />
            <wire x2="1552" y1="976" y2="1040" x1="1552" />
            <wire x2="1584" y1="1040" y2="1040" x1="1552" />
        </branch>
        <branch name="TEST0">
            <wire x2="1472" y1="224" y2="224" x1="816" />
            <wire x2="1472" y1="224" y2="688" x1="1472" />
            <wire x2="1488" y1="688" y2="688" x1="1472" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="736" y1="880" y2="1104" x1="736" />
            <wire x2="816" y1="880" y2="880" x1="736" />
            <wire x2="896" y1="880" y2="880" x1="816" />
            <wire x2="976" y1="880" y2="880" x1="896" />
            <wire x2="1056" y1="880" y2="880" x1="976" />
            <wire x2="1136" y1="880" y2="880" x1="1056" />
            <wire x2="1216" y1="880" y2="880" x1="1136" />
            <wire x2="1296" y1="880" y2="880" x1="1216" />
            <wire x2="2032" y1="880" y2="880" x1="1296" />
            <wire x2="2032" y1="880" y2="1040" x1="2032" />
            <wire x2="1296" y1="880" y2="1104" x1="1296" />
            <wire x2="1216" y1="880" y2="1104" x1="1216" />
            <wire x2="1136" y1="880" y2="1104" x1="1136" />
            <wire x2="1056" y1="880" y2="1104" x1="1056" />
            <wire x2="976" y1="880" y2="1104" x1="976" />
            <wire x2="896" y1="880" y2="1104" x1="896" />
            <wire x2="816" y1="880" y2="1104" x1="816" />
            <wire x2="2032" y1="1040" y2="1040" x1="1968" />
        </branch>
        <branch name="BUTTONS(7:0)">
            <wire x2="720" y1="720" y2="752" x1="720" />
            <wire x2="800" y1="752" y2="752" x1="720" />
            <wire x2="880" y1="752" y2="752" x1="800" />
            <wire x2="960" y1="752" y2="752" x1="880" />
            <wire x2="1040" y1="752" y2="752" x1="960" />
            <wire x2="1120" y1="752" y2="752" x1="1040" />
            <wire x2="1200" y1="752" y2="752" x1="1120" />
            <wire x2="1280" y1="752" y2="752" x1="1200" />
            <wire x2="1488" y1="752" y2="752" x1="1280" />
            <wire x2="800" y1="720" y2="752" x1="800" />
            <wire x2="880" y1="720" y2="752" x1="880" />
            <wire x2="960" y1="720" y2="752" x1="960" />
            <wire x2="1040" y1="720" y2="752" x1="1040" />
            <wire x2="1120" y1="720" y2="752" x1="1120" />
            <wire x2="1200" y1="720" y2="752" x1="1200" />
            <wire x2="1280" y1="720" y2="752" x1="1280" />
        </branch>
        <instance x="1488" y="848" name="XLXI_14" orien="R0">
        </instance>
        <iomarker fontsize="28" x="816" y="224" name="TEST0" orien="R180" />
        <branch name="TEST1">
            <wire x2="1360" y1="1056" y2="1056" x1="1344" />
            <wire x2="1344" y1="1056" y2="1104" x1="1344" />
            <wire x2="1584" y1="1104" y2="1104" x1="1344" />
        </branch>
        <instance x="1360" y="1216" name="XLXI_36" orien="R0" />
        <branch name="XLXN_93">
            <wire x2="1584" y1="1264" y2="1312" x1="1584" />
        </branch>
        <branch name="XLXN_94">
            <wire x2="1424" y1="1216" y2="1232" x1="1424" />
            <wire x2="1504" y1="1232" y2="1232" x1="1424" />
            <wire x2="1504" y1="1168" y2="1232" x1="1504" />
            <wire x2="1584" y1="1168" y2="1168" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1056" name="TEST1" orien="R0" />
        <instance x="1584" y="1296" name="XLXI_35" orien="R0" />
        <instance x="1520" y="1440" name="XLXI_37" orien="R0" />
        <branch name="LEDS(1)">
            <wire x2="816" y1="1200" y2="1280" x1="816" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="896" y1="1200" y2="1280" x1="896" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="976" y1="1200" y2="1280" x1="976" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="1056" y1="1200" y2="1280" x1="1056" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="1136" y1="1200" y2="1280" x1="1136" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="1216" y1="1200" y2="1280" x1="1216" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="1296" y1="1200" y2="1280" x1="1296" />
        </branch>
        <bustap x2="736" y1="1104" y2="1200" x1="736" />
        <bustap x2="816" y1="1104" y2="1200" x1="816" />
        <bustap x2="896" y1="1104" y2="1200" x1="896" />
        <bustap x2="976" y1="1104" y2="1200" x1="976" />
        <bustap x2="1056" y1="1104" y2="1200" x1="1056" />
        <bustap x2="1136" y1="1104" y2="1200" x1="1136" />
        <bustap x2="1216" y1="1104" y2="1200" x1="1216" />
        <bustap x2="1296" y1="1104" y2="1200" x1="1296" />
        <branch name="LEDS(0)">
            <wire x2="736" y1="1200" y2="1280" x1="736" />
        </branch>
        <iomarker fontsize="28" x="816" y="1280" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="896" y="1280" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="976" y="1280" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="1056" y="1280" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="1136" y="1280" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="1216" y="1280" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="1296" y="1280" name="LEDS(7)" orien="R90" />
        <iomarker fontsize="28" x="736" y="1280" name="LEDS(0)" orien="R90" />
    </sheet>
</drawing>