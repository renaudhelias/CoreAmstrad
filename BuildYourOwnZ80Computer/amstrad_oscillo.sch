<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="cpc_M1_n" />
        <signal name="cpc_WAIT_n" />
        <signal name="cpc_INT_n" />
        <signal name="cpc_SYNC" />
        <signal name="LEDS(7:0)" />
        <signal name="ram_A(22:0)" />
        <signal name="ram_D(7:0)" />
        <signal name="XLXN_10" />
        <signal name="ram_W_n" />
        <signal name="UB1_n" />
        <signal name="LB1_n" />
        <signal name="ADV1_n" />
        <signal name="CLK1" />
        <signal name="CRE1" />
        <signal name="ram_D_U(7:0)" />
        <signal name="OE1_n" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_2" />
        <signal name="cpc_CLK" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_22" />
        <signal name="CLK3(2:0)" />
        <signal name="CLK3(1)" />
        <signal name="CLK3(2)" />
        <signal name="CLK3(0)" />
        <signal name="XLXN_27(2:0)" />
        <signal name="CE1_n" />
        <port polarity="Input" name="cpc_M1_n" />
        <port polarity="Input" name="cpc_WAIT_n" />
        <port polarity="Input" name="cpc_INT_n" />
        <port polarity="Input" name="cpc_SYNC" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="Output" name="ram_A(22:0)" />
        <port polarity="BiDirectional" name="ram_D(7:0)" />
        <port polarity="Output" name="ram_W_n" />
        <port polarity="Output" name="UB1_n" />
        <port polarity="Output" name="LB1_n" />
        <port polarity="Output" name="ADV1_n" />
        <port polarity="Output" name="CLK1" />
        <port polarity="Output" name="CRE1" />
        <port polarity="BiDirectional" name="ram_D_U(7:0)" />
        <port polarity="Output" name="OE1_n" />
        <port polarity="Input" name="cpc_CLK" />
        <port polarity="Output" name="CE1_n" />
        <blockdef name="raptor">
            <timestamp>2011-5-9T17:21:37</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <rect width="64" x="320" y="84" height="24" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <rect width="64" x="320" y="148" height="24" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="256" x="64" y="-320" height="500" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="data_off">
            <timestamp>2011-4-18T15:8:34</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="dcm_sp">
            <timestamp>2007-4-11T22:49:47</timestamp>
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <rect width="256" x="64" y="-1024" height="960" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <rect width="64" x="320" y="-336" height="32" />
            <line x2="80" y1="-944" y2="-960" x1="64" />
            <line x2="64" y1="-960" y2="-976" x1="80" />
            <line x2="64" y1="-288" y2="-288" x1="320" />
            <line x2="80" y1="-880" y2="-896" x1="64" />
            <line x2="64" y1="-896" y2="-912" x1="80" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="cb2ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <block symbolname="raptor" name="XLXI_2">
            <blockpin signalname="XLXN_3" name="cpc_M1_n" />
            <blockpin signalname="XLXN_4" name="cpc_WAIT_n" />
            <blockpin signalname="XLXN_5" name="cpc_INT_n" />
            <blockpin signalname="XLXN_6" name="cpc_SYNC" />
            <blockpin signalname="ram_D(7:0)" name="ram_D(7:0)" />
            <blockpin signalname="XLXN_10" name="ram_W" />
            <blockpin signalname="ram_A(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="LEDS(7:0)" name="LEDS(7:0)" />
            <blockpin signalname="CLK3(2:0)" name="cpc_CLK(2:0)" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="cpc_WAIT_n" name="I" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="cpc_INT_n" name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="cpc_SYNC" name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="XLXN_10" name="I" />
            <blockpin signalname="ram_W_n" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_424">
            <blockpin signalname="LB1_n" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_425">
            <blockpin signalname="UB1_n" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_457">
            <blockpin signalname="CLK1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_458">
            <blockpin signalname="ADV1_n" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_446">
            <blockpin signalname="CRE1" name="G" />
        </block>
        <block symbolname="data_off" name="XLXI_461">
            <blockpin signalname="ram_D_U(7:0)" name="off(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_462">
            <blockpin signalname="OE1_n" name="P" />
        </block>
        <block symbolname="dcm_sp" name="XLXI_463">
            <blockpin signalname="XLXN_15" name="CLKFB" />
            <blockpin signalname="XLXN_2" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_14" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin signalname="XLXN_19" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_465">
            <blockpin signalname="XLXN_14" name="I" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="cpc_M1_n" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_3">
            <blockpin signalname="cpc_CLK" name="I" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="cb2ce" name="XLXI_468">
            <blockpin signalname="XLXN_19" name="C" />
            <blockpin signalname="XLXN_22" name="CE" />
            <blockpin signalname="XLXN_20" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="CLK3(1)" name="Q0" />
            <blockpin signalname="CLK3(2)" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="gnd" name="XLXI_469">
            <blockpin signalname="XLXN_20" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_470">
            <blockpin signalname="XLXN_22" name="P" />
        </block>
        <block symbolname="inv" name="XLXI_471">
            <blockpin signalname="XLXN_19" name="I" />
            <blockpin signalname="CLK3(0)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_163">
            <blockpin signalname="CE1_n" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="608" y="1072" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_3">
            <wire x2="608" y1="848" y2="848" x1="576" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="608" y1="912" y2="912" x1="576" />
        </branch>
        <instance x="352" y="944" name="XLXI_5" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="608" y1="976" y2="976" x1="576" />
        </branch>
        <instance x="352" y="1008" name="XLXI_6" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="608" y1="1040" y2="1040" x1="576" />
        </branch>
        <instance x="352" y="1072" name="XLXI_7" orien="R0" />
        <branch name="cpc_M1_n">
            <wire x2="352" y1="848" y2="848" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="848" name="cpc_M1_n" orien="R180" />
        <branch name="cpc_WAIT_n">
            <wire x2="352" y1="912" y2="912" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="912" name="cpc_WAIT_n" orien="R180" />
        <branch name="cpc_INT_n">
            <wire x2="336" y1="976" y2="976" x1="320" />
            <wire x2="352" y1="976" y2="976" x1="336" />
        </branch>
        <branch name="cpc_SYNC">
            <wire x2="352" y1="1040" y2="1040" x1="320" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="1024" y1="784" y2="784" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="784" name="LEDS(7:0)" orien="R0" />
        <branch name="ram_A(22:0)">
            <wire x2="1024" y1="1232" y2="1232" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="1232" name="ram_A(22:0)" orien="R0" />
        <branch name="ram_D(7:0)">
            <wire x2="1024" y1="1168" y2="1168" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="1168" name="ram_D(7:0)" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="1024" y1="1104" y2="1104" x1="992" />
        </branch>
        <instance x="1024" y="1136" name="XLXI_10" orien="R0" />
        <branch name="ram_W_n">
            <wire x2="1280" y1="1104" y2="1104" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="1280" y="1104" name="ram_W_n" orien="R0" />
        <branch name="UB1_n">
            <wire x2="1536" y1="768" y2="768" x1="1504" />
        </branch>
        <branch name="LB1_n">
            <wire x2="1536" y1="704" y2="704" x1="1504" />
        </branch>
        <instance x="1376" y="640" name="XLXI_424" orien="R90" />
        <instance x="1376" y="704" name="XLXI_425" orien="R90" />
        <iomarker fontsize="28" x="1536" y="704" name="LB1_n" orien="R0" />
        <iomarker fontsize="28" x="1536" y="768" name="UB1_n" orien="R0" />
        <branch name="ADV1_n">
            <wire x2="1872" y1="1136" y2="1200" x1="1872" />
        </branch>
        <branch name="CLK1">
            <wire x2="2000" y1="1024" y2="1104" x1="2000" />
        </branch>
        <instance x="1936" y="1232" name="XLXI_457" orien="R0" />
        <instance x="1936" y="1008" name="XLXI_458" orien="R180" />
        <instance x="2176" y="1184" name="XLXI_446" orien="R0" />
        <branch name="CRE1">
            <wire x2="2240" y1="976" y2="1056" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="1872" y="1200" name="ADV1_n" orien="R90" />
        <iomarker fontsize="28" x="2000" y="1024" name="CLK1" orien="R270" />
        <iomarker fontsize="28" x="2240" y="976" name="CRE1" orien="R270" />
        <branch name="ram_D_U(7:0)">
            <wire x2="2528" y1="496" y2="496" x1="2384" />
        </branch>
        <instance x="2000" y="528" name="XLXI_461" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2528" y="496" name="ram_D_U(7:0)" orien="R0" />
        <branch name="OE1_n">
            <wire x2="1376" y1="1552" y2="1552" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1376" y="1552" name="OE1_n" orien="R0" />
        <instance x="1264" y="1552" name="XLXI_462" orien="R0" />
        <instance x="672" y="2528" name="XLXI_463" orien="R0" />
        <branch name="XLXN_14">
            <wire x2="1072" y1="1376" y2="1376" x1="912" />
            <wire x2="1072" y1="1376" y2="1568" x1="1072" />
            <wire x2="1072" y1="1568" y2="1568" x1="1056" />
        </branch>
        <instance x="912" y="1344" name="XLXI_465" orien="R180" />
        <instance x="352" y="880" name="XLXI_4" orien="R0" />
        <branch name="XLXN_15">
            <wire x2="656" y1="1376" y2="1632" x1="656" />
            <wire x2="672" y1="1632" y2="1632" x1="656" />
            <wire x2="688" y1="1376" y2="1376" x1="656" />
        </branch>
        <iomarker fontsize="28" x="320" y="1040" name="cpc_SYNC" orien="R180" />
        <branch name="XLXN_2">
            <wire x2="672" y1="1568" y2="1568" x1="640" />
        </branch>
        <branch name="cpc_CLK">
            <wire x2="416" y1="1568" y2="1568" x1="384" />
        </branch>
        <instance x="416" y="1600" name="XLXI_3" orien="R0" />
        <iomarker fontsize="28" x="384" y="1568" name="cpc_CLK" orien="R180" />
        <branch name="XLXN_19">
            <wire x2="1184" y1="2016" y2="2016" x1="1056" />
            <wire x2="1264" y1="2016" y2="2016" x1="1184" />
            <wire x2="1360" y1="2016" y2="2016" x1="1264" />
            <wire x2="1184" y1="1984" y2="2016" x1="1184" />
        </branch>
        <instance x="1360" y="2144" name="XLXI_468" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="1360" y1="2112" y2="2144" x1="1360" />
        </branch>
        <instance x="1296" y="2272" name="XLXI_469" orien="R0" />
        <branch name="XLXN_22">
            <wire x2="1360" y1="1952" y2="1952" x1="1328" />
        </branch>
        <instance x="1328" y="2016" name="XLXI_470" orien="R270" />
        <branch name="CLK3(2:0)">
            <wire x2="528" y1="576" y2="800" x1="528" />
            <wire x2="608" y1="800" y2="800" x1="528" />
            <wire x2="2128" y1="576" y2="576" x1="528" />
            <wire x2="2128" y1="576" y2="1568" x1="2128" />
            <wire x2="2128" y1="1568" y2="1648" x1="2128" />
            <wire x2="2128" y1="1648" y2="1824" x1="2128" />
            <wire x2="2128" y1="1824" y2="1888" x1="2128" />
        </branch>
        <bustap x2="2032" y1="1888" y2="1888" x1="2128" />
        <bustap x2="2032" y1="1824" y2="1824" x1="2128" />
        <branch name="CLK3(1)">
            <wire x2="2032" y1="1824" y2="1824" x1="1744" />
        </branch>
        <branch name="CLK3(2)">
            <wire x2="2032" y1="1888" y2="1888" x1="1744" />
        </branch>
        <bustap x2="2032" y1="1648" y2="1648" x1="2128" />
        <instance x="1216" y="1984" name="XLXI_471" orien="R270" />
        <branch name="CLK3(0)">
            <wire x2="2032" y1="1648" y2="1648" x1="1184" />
            <wire x2="1184" y1="1648" y2="1760" x1="1184" />
        </branch>
        <branch name="CE1_n">
            <wire x2="1712" y1="848" y2="912" x1="1712" />
        </branch>
        <instance x="1776" y="720" name="XLXI_163" orien="R180" />
        <iomarker fontsize="28" x="1712" y="912" name="CE1_n" orien="R90" />
        <iomarker fontsize="28" x="320" y="976" name="cpc_INT_n" orien="R180" />
    </sheet>
</drawing>