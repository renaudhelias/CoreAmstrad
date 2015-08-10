<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="z80_a(15:0)" />
        <signal name="z80_a(7:0)" />
        <signal name="z80_mreq" />
        <signal name="TEST" />
        <signal name="LEDS(1)" />
        <signal name="LEDS(2)" />
        <signal name="LEDS(3)" />
        <signal name="LEDS(4)" />
        <signal name="LEDS(5)" />
        <signal name="LEDS(6)" />
        <signal name="LEDS(7)" />
        <signal name="LEDS(0)" />
        <signal name="LEDS(7:0)" />
        <signal name="XLXN_93" />
        <signal name="XLXN_94" />
        <signal name="z80_clk" />
        <signal name="z80_rd" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101" />
        <signal name="XLXN_102" />
        <port polarity="Input" name="z80_a(15:0)" />
        <port polarity="Input" name="z80_mreq" />
        <port polarity="Input" name="TEST" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <port polarity="Output" name="LEDS(0)" />
        <port polarity="Output" name="z80_clk" />
        <port polarity="Input" name="z80_rd" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="zo">
            <timestamp>2011-2-2T12:4:52</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="inv" name="XLXI_38">
            <blockpin signalname="z80_mreq" name="I" />
            <blockpin signalname="XLXN_102" name="O" />
        </block>
        <block symbolname="ld8ce" name="XLXI_35">
            <blockpin signalname="XLXN_93" name="CLR" />
            <blockpin signalname="z80_a(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_94" name="G" />
            <blockpin signalname="XLXN_100" name="GE" />
            <blockpin signalname="LEDS(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_36">
            <blockpin signalname="XLXN_94" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_37">
            <blockpin signalname="XLXN_93" name="G" />
        </block>
        <block symbolname="and2" name="XLXI_401">
            <blockpin signalname="XLXN_101" name="I0" />
            <blockpin signalname="XLXN_102" name="I1" />
            <blockpin signalname="XLXN_100" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_402">
            <blockpin signalname="z80_rd" name="I" />
            <blockpin signalname="XLXN_101" name="O" />
        </block>
        <block symbolname="zo" name="XLXI_403">
            <blockpin signalname="TEST" name="A" />
            <blockpin signalname="z80_clk" name="B" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="z80_a(15:0)">
            <wire x2="1696" y1="1008" y2="1008" x1="1584" />
        </branch>
        <bustap x2="1696" y1="1008" y2="1104" x1="1696" />
        <branch name="z80_a(7:0)">
            <wire x2="1424" y1="1120" y2="1344" x1="1424" />
            <wire x2="1472" y1="1344" y2="1344" x1="1424" />
            <wire x2="1696" y1="1120" y2="1120" x1="1424" />
            <wire x2="1696" y1="1104" y2="1120" x1="1696" />
        </branch>
        <branch name="z80_mreq">
            <wire x2="1920" y1="560" y2="560" x1="1584" />
            <wire x2="1920" y1="560" y2="688" x1="1920" />
        </branch>
        <instance x="1888" y="688" name="XLXI_38" orien="R90" />
        <branch name="TEST">
            <wire x2="1040" y1="576" y2="576" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="576" name="TEST" orien="R180" />
        <branch name="LEDS(1)">
            <wire x2="992" y1="2048" y2="2128" x1="992" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="1072" y1="2048" y2="2128" x1="1072" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="1152" y1="2048" y2="2128" x1="1152" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="1232" y1="2048" y2="2128" x1="1232" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="1312" y1="2048" y2="2128" x1="1312" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="1392" y1="2048" y2="2128" x1="1392" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="1472" y1="2048" y2="2128" x1="1472" />
        </branch>
        <bustap x2="912" y1="1952" y2="2048" x1="912" />
        <bustap x2="992" y1="1952" y2="2048" x1="992" />
        <bustap x2="1072" y1="1952" y2="2048" x1="1072" />
        <bustap x2="1152" y1="1952" y2="2048" x1="1152" />
        <bustap x2="1232" y1="1952" y2="2048" x1="1232" />
        <bustap x2="1312" y1="1952" y2="2048" x1="1312" />
        <bustap x2="1392" y1="1952" y2="2048" x1="1392" />
        <bustap x2="1472" y1="1952" y2="2048" x1="1472" />
        <branch name="LEDS(0)">
            <wire x2="912" y1="2048" y2="2128" x1="912" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="912" y1="1760" y2="1952" x1="912" />
            <wire x2="992" y1="1760" y2="1760" x1="912" />
            <wire x2="1072" y1="1760" y2="1760" x1="992" />
            <wire x2="1152" y1="1760" y2="1760" x1="1072" />
            <wire x2="1232" y1="1760" y2="1760" x1="1152" />
            <wire x2="1312" y1="1760" y2="1760" x1="1232" />
            <wire x2="1392" y1="1760" y2="1760" x1="1312" />
            <wire x2="1472" y1="1760" y2="1760" x1="1392" />
            <wire x2="1472" y1="1760" y2="1952" x1="1472" />
            <wire x2="1936" y1="1760" y2="1760" x1="1472" />
            <wire x2="1392" y1="1760" y2="1952" x1="1392" />
            <wire x2="1312" y1="1760" y2="1952" x1="1312" />
            <wire x2="1232" y1="1760" y2="1952" x1="1232" />
            <wire x2="1152" y1="1760" y2="1952" x1="1152" />
            <wire x2="1072" y1="1760" y2="1952" x1="1072" />
            <wire x2="992" y1="1760" y2="1952" x1="992" />
            <wire x2="1936" y1="1344" y2="1344" x1="1856" />
            <wire x2="1936" y1="1344" y2="1760" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="992" y="2128" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="1072" y="2128" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="1152" y="2128" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="1232" y="2128" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="1312" y="2128" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="1392" y="2128" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="1472" y="2128" name="LEDS(7)" orien="R90" />
        <iomarker fontsize="28" x="912" y="2128" name="LEDS(0)" orien="R90" />
        <instance x="1472" y="1600" name="XLXI_35" orien="R0" />
        <instance x="1136" y="1504" name="XLXI_36" orien="R0" />
        <branch name="XLXN_93">
            <wire x2="1472" y1="1568" y2="1600" x1="1472" />
        </branch>
        <instance x="1408" y="1728" name="XLXI_37" orien="R0" />
        <branch name="XLXN_94">
            <wire x2="1200" y1="1504" y2="1584" x1="1200" />
            <wire x2="1296" y1="1584" y2="1584" x1="1200" />
            <wire x2="1296" y1="1472" y2="1584" x1="1296" />
            <wire x2="1472" y1="1472" y2="1472" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1584" y="560" name="z80_mreq" orien="R180" />
        <iomarker fontsize="28" x="1584" y="1008" name="z80_a(15:0)" orien="R180" />
        <branch name="z80_clk">
            <wire x2="1408" y1="704" y2="704" x1="1392" />
            <wire x2="1456" y1="704" y2="704" x1="1408" />
            <wire x2="1456" y1="576" y2="576" x1="1424" />
            <wire x2="1456" y1="576" y2="704" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="1392" y="704" name="z80_clk" orien="R180" />
        <instance x="1264" y="848" name="XLXI_402" orien="R0" />
        <branch name="z80_rd">
            <wire x2="1264" y1="816" y2="816" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="816" name="z80_rd" orien="R180" />
        <branch name="XLXN_100">
            <wire x2="1456" y1="1264" y2="1408" x1="1456" />
            <wire x2="1472" y1="1408" y2="1408" x1="1456" />
            <wire x2="1872" y1="1264" y2="1264" x1="1456" />
            <wire x2="1872" y1="1216" y2="1264" x1="1872" />
        </branch>
        <instance x="1776" y="960" name="XLXI_401" orien="R90" />
        <branch name="XLXN_101">
            <wire x2="1840" y1="816" y2="816" x1="1488" />
            <wire x2="1840" y1="816" y2="960" x1="1840" />
        </branch>
        <branch name="XLXN_102">
            <wire x2="1904" y1="928" y2="960" x1="1904" />
            <wire x2="1920" y1="928" y2="928" x1="1904" />
            <wire x2="1920" y1="912" y2="928" x1="1920" />
        </branch>
        <instance x="1040" y="608" name="XLXI_403" orien="R0">
        </instance>
    </sheet>
</drawing>