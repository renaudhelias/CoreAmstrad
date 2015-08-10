<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADRESSES(15:0)" />
        <signal name="ADRESSES(7:0)" />
        <signal name="XLXN_97" />
        <signal name="XLXN_98" />
        <signal name="NOPS(7:0)" />
        <signal name="NOPS(6)" />
        <signal name="NOPS(0)" />
        <signal name="NOPS(1)" />
        <signal name="NOPS(2)" />
        <signal name="NOPS(3)" />
        <signal name="NOPS(4)" />
        <signal name="NOPS(5)" />
        <signal name="NOPS(7)" />
        <signal name="TEST" />
        <signal name="XLXN_5" />
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
        <port polarity="Input" name="TEST" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <port polarity="Output" name="LEDS(0)" />
        <blockdef name="T80se">
            <timestamp>2011-1-24T17:35:28</timestamp>
            <rect width="256" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="inv" name="XLXI_38">
            <blockpin signalname="XLXN_97" name="I" />
            <blockpin signalname="XLXN_98" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_2">
            <blockpin signalname="XLXN_5" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_3">
            <blockpin signalname="NOPS(6)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_4">
            <blockpin signalname="NOPS(1)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="NOPS(0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="NOPS(2)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="NOPS(3)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_8">
            <blockpin signalname="NOPS(4)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_9">
            <blockpin signalname="NOPS(5)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_10">
            <blockpin signalname="NOPS(7)" name="G" />
        </block>
        <block symbolname="T80se" name="XLXI_1">
            <blockpin signalname="XLXN_5" name="RESET_n" />
            <blockpin signalname="TEST" name="CLK_n" />
            <blockpin signalname="XLXN_5" name="CLKEN" />
            <blockpin signalname="XLXN_5" name="WAIT_n" />
            <blockpin signalname="XLXN_5" name="INT_n" />
            <blockpin signalname="XLXN_5" name="NMI_n" />
            <blockpin signalname="XLXN_5" name="BUSRQ_n" />
            <blockpin signalname="NOPS(7:0)" name="DI(7:0)" />
            <blockpin name="M1_n" />
            <blockpin signalname="XLXN_97" name="MREQ_n" />
            <blockpin name="IORQ_n" />
            <blockpin name="RD_n" />
            <blockpin name="WR_n" />
            <blockpin name="RFSH_n" />
            <blockpin name="HALT_n" />
            <blockpin name="BUSAK_n" />
            <blockpin signalname="ADRESSES(15:0)" name="A(15:0)" />
            <blockpin name="DO(7:0)" />
        </block>
        <block symbolname="ld8ce" name="XLXI_35">
            <blockpin signalname="XLXN_93" name="CLR" />
            <blockpin signalname="ADRESSES(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_94" name="G" />
            <blockpin signalname="XLXN_98" name="GE" />
            <blockpin signalname="LEDS(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_36">
            <blockpin signalname="XLXN_94" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_37">
            <blockpin signalname="XLXN_93" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="ADRESSES(15:0)">
            <wire x2="1696" y1="1008" y2="1008" x1="1584" />
        </branch>
        <bustap x2="1696" y1="1008" y2="1104" x1="1696" />
        <branch name="ADRESSES(7:0)">
            <wire x2="1424" y1="1120" y2="1344" x1="1424" />
            <wire x2="1472" y1="1344" y2="1344" x1="1424" />
            <wire x2="1696" y1="1120" y2="1120" x1="1424" />
            <wire x2="1696" y1="1104" y2="1120" x1="1696" />
        </branch>
        <branch name="XLXN_97">
            <wire x2="1920" y1="560" y2="560" x1="1584" />
            <wire x2="1920" y1="560" y2="688" x1="1920" />
        </branch>
        <instance x="1888" y="688" name="XLXI_38" orien="R90" />
        <branch name="XLXN_98">
            <wire x2="1472" y1="1408" y2="1408" x1="1392" />
            <wire x2="1392" y1="1408" y2="1584" x1="1392" />
            <wire x2="1920" y1="1584" y2="1584" x1="1392" />
            <wire x2="1920" y1="912" y2="928" x1="1920" />
            <wire x2="1920" y1="928" y2="1584" x1="1920" />
        </branch>
        <instance x="960" y="736" name="XLXI_2" orien="R0" />
        <branch name="NOPS(7:0)">
            <wire x2="688" y1="1056" y2="1056" x1="624" />
            <wire x2="752" y1="1056" y2="1056" x1="688" />
            <wire x2="832" y1="1056" y2="1056" x1="752" />
            <wire x2="896" y1="1056" y2="1056" x1="832" />
            <wire x2="960" y1="1056" y2="1056" x1="896" />
            <wire x2="1024" y1="1056" y2="1056" x1="960" />
            <wire x2="1104" y1="1056" y2="1056" x1="1024" />
            <wire x2="1200" y1="1056" y2="1056" x1="1104" />
        </branch>
        <bustap x2="624" y1="1056" y2="1152" x1="624" />
        <bustap x2="688" y1="1056" y2="1152" x1="688" />
        <bustap x2="752" y1="1056" y2="1152" x1="752" />
        <bustap x2="832" y1="1056" y2="1152" x1="832" />
        <bustap x2="896" y1="1056" y2="1152" x1="896" />
        <bustap x2="960" y1="1056" y2="1152" x1="960" />
        <bustap x2="1024" y1="1056" y2="1152" x1="1024" />
        <bustap x2="1104" y1="1056" y2="1152" x1="1104" />
        <instance x="960" y="1296" name="XLXI_3" orien="R0" />
        <branch name="NOPS(6)">
            <wire x2="1024" y1="1152" y2="1168" x1="1024" />
        </branch>
        <instance x="624" y="1296" name="XLXI_4" orien="R0" />
        <instance x="560" y="1296" name="XLXI_5" orien="R0" />
        <instance x="688" y="1296" name="XLXI_6" orien="R0" />
        <instance x="768" y="1296" name="XLXI_7" orien="R0" />
        <instance x="832" y="1296" name="XLXI_8" orien="R0" />
        <instance x="896" y="1296" name="XLXI_9" orien="R0" />
        <instance x="1040" y="1296" name="XLXI_10" orien="R0" />
        <branch name="NOPS(0)">
            <wire x2="624" y1="1152" y2="1168" x1="624" />
        </branch>
        <branch name="NOPS(1)">
            <wire x2="688" y1="1152" y2="1168" x1="688" />
        </branch>
        <branch name="NOPS(2)">
            <wire x2="752" y1="1152" y2="1168" x1="752" />
        </branch>
        <branch name="NOPS(3)">
            <wire x2="832" y1="1152" y2="1168" x1="832" />
        </branch>
        <branch name="NOPS(4)">
            <wire x2="896" y1="1152" y2="1168" x1="896" />
        </branch>
        <branch name="NOPS(5)">
            <wire x2="960" y1="1152" y2="1168" x1="960" />
        </branch>
        <branch name="NOPS(7)">
            <wire x2="1104" y1="1152" y2="1168" x1="1104" />
        </branch>
        <branch name="TEST">
            <wire x2="1200" y1="576" y2="576" x1="912" />
        </branch>
        <instance x="1200" y="1104" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_5">
            <wire x2="1024" y1="736" y2="800" x1="1024" />
            <wire x2="1120" y1="800" y2="800" x1="1024" />
            <wire x2="1120" y1="800" y2="816" x1="1120" />
            <wire x2="1120" y1="816" y2="896" x1="1120" />
            <wire x2="1200" y1="896" y2="896" x1="1120" />
            <wire x2="1120" y1="896" y2="976" x1="1120" />
            <wire x2="1200" y1="976" y2="976" x1="1120" />
            <wire x2="1200" y1="816" y2="816" x1="1120" />
            <wire x2="1200" y1="496" y2="496" x1="1120" />
            <wire x2="1120" y1="496" y2="656" x1="1120" />
            <wire x2="1120" y1="656" y2="736" x1="1120" />
            <wire x2="1120" y1="736" y2="800" x1="1120" />
            <wire x2="1200" y1="736" y2="736" x1="1120" />
            <wire x2="1200" y1="656" y2="656" x1="1120" />
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
    </sheet>
</drawing>