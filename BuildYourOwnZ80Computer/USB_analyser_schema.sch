<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="USB_DATA(1:0)" />
        <signal name="USB_DATA(1)" />
        <signal name="USB_DATA(0)" />
        <signal name="XLXN_25(15:0)" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="ram_W_n" />
        <signal name="LB1_n" />
        <signal name="UB1_n" />
        <signal name="OE1_n" />
        <signal name="CE1_n" />
        <signal name="ram_D_U(7:0)" />
        <signal name="CRE1" />
        <signal name="CLK1" />
        <signal name="LEDS(7:0)" />
        <signal name="ram_D(7:0)" />
        <signal name="ram_A(22:0)" />
        <signal name="ADV1_n" />
        <signal name="XLXN_42(15:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="BiDirectional" name="USB_DATA(1:0)" />
        <port polarity="Output" name="ram_W_n" />
        <port polarity="Output" name="LB1_n" />
        <port polarity="Output" name="UB1_n" />
        <port polarity="Output" name="OE1_n" />
        <port polarity="Output" name="CE1_n" />
        <port polarity="BiDirectional" name="ram_D_U(7:0)" />
        <port polarity="Output" name="CRE1" />
        <port polarity="Output" name="CLK1" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="BiDirectional" name="ram_D(7:0)" />
        <port polarity="Output" name="ram_A(22:0)" />
        <port polarity="Output" name="ADV1_n" />
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
        <blockdef name="USB_analyser">
            <timestamp>2011-11-10T11:9:41</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="USB_analyser_to_RAM">
            <timestamp>2011-11-10T11:9:44</timestamp>
            <rect width="256" x="64" y="-768" height="768" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="pulldown">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-160" y2="-128" x1="64" />
            <line x2="60" y1="0" y2="0" x1="68" />
            <line x2="52" y1="-16" y2="-16" x1="76" />
            <line x2="40" y1="-32" y2="-32" x1="88" />
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
        </blockdef>
        <blockdef name="pullup">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
            <line x2="64" y1="-56" y2="-48" x1="48" />
            <line x2="48" y1="-72" y2="-56" x1="80" />
            <line x2="80" y1="-88" y2="-72" x1="48" />
            <line x2="48" y1="-104" y2="-88" x1="80" />
            <line x2="80" y1="-108" y2="-104" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-128" y2="-128" x1="96" />
        </blockdef>
        <block symbolname="dcm_sp" name="XLXI_5">
            <attr value="6" name="CLKFX_MULTIPLY">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <attr value="5" name="CLKFX_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_2" name="CLKFB" />
            <blockpin signalname="CLK50MHz" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_1" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin signalname="XLXN_27" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_6">
            <blockpin signalname="XLXN_1" name="I" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="USB_analyser" name="XLXI_7">
            <blockpin signalname="XLXN_27" name="CLK" />
            <blockpin signalname="XLXN_26" name="clk_write" />
            <blockpin signalname="XLXN_25(15:0)" name="octet(15:0)" />
            <blockpin signalname="USB_DATA(1:0)" name="USB_DATA(1:0)" />
        </block>
        <block symbolname="pullup" name="XLXI_13">
            <blockpin signalname="USB_DATA(1)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_12">
            <blockpin signalname="USB_DATA(0)" name="O" />
        </block>
        <block symbolname="USB_analyser_to_RAM" name="XLXI_10">
            <blockpin signalname="XLXN_27" name="CLK" />
            <blockpin signalname="XLXN_26" name="CLK_write" />
            <blockpin signalname="XLXN_25(15:0)" name="octet(15:0)" />
            <blockpin signalname="CE1_n" name="CE1_n" />
            <blockpin signalname="OE1_n" name="OE1_n" />
            <blockpin signalname="UB1_n" name="UB1_n" />
            <blockpin signalname="LB1_n" name="LB1_n" />
            <blockpin signalname="ram_W_n" name="ram_W_n" />
            <blockpin signalname="ADV1_n" name="ADV1_n" />
            <blockpin signalname="CLK1" name="CLK1" />
            <blockpin signalname="CRE1" name="CRE1" />
            <blockpin signalname="LEDS(7:0)" name="LEDS(7:0)" />
            <blockpin signalname="ram_A(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="ram_D(7:0)" name="ram_D(7:0)" />
            <blockpin signalname="ram_D_U(7:0)" name="ram_D_U(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="560" y="1552" name="XLXI_5" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
        </instance>
        <instance x="880" y="320" name="XLXI_6" orien="R180" />
        <branch name="XLXN_1">
            <wire x2="960" y1="352" y2="352" x1="880" />
            <wire x2="960" y1="352" y2="592" x1="960" />
            <wire x2="960" y1="592" y2="592" x1="944" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="656" y1="352" y2="352" x1="448" />
            <wire x2="448" y1="352" y2="656" x1="448" />
            <wire x2="560" y1="656" y2="656" x1="448" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="512" y1="560" y2="592" x1="512" />
            <wire x2="560" y1="592" y2="592" x1="512" />
        </branch>
        <iomarker fontsize="28" x="512" y="560" name="CLK50MHz" orien="R270" />
        <instance x="1248" y="1600" name="XLXI_7" orien="R0">
        </instance>
        <branch name="USB_DATA(1:0)">
            <wire x2="1184" y1="1776" y2="2016" x1="1184" />
            <wire x2="1696" y1="2016" y2="2016" x1="1184" />
            <wire x2="1264" y1="1776" y2="1776" x1="1184" />
            <wire x2="1376" y1="1776" y2="1776" x1="1264" />
            <wire x2="1264" y1="1776" y2="1856" x1="1264" />
            <wire x2="1264" y1="1856" y2="1936" x1="1264" />
            <wire x2="1696" y1="1568" y2="1568" x1="1632" />
            <wire x2="1696" y1="1568" y2="2016" x1="1696" />
        </branch>
        <bustap x2="1360" y1="1856" y2="1856" x1="1264" />
        <branch name="USB_DATA(1)">
            <wire x2="1440" y1="1856" y2="1856" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1376" y="1776" name="USB_DATA(1:0)" orien="R0" />
        <bustap x2="1360" y1="1936" y2="1936" x1="1264" />
        <branch name="USB_DATA(0)">
            <wire x2="1440" y1="1936" y2="1936" x1="1360" />
        </branch>
        <instance x="1440" y="1792" name="XLXI_13" orien="R90" />
        <instance x="1600" y="2000" name="XLXI_12" orien="R270" />
        <branch name="XLXN_25(15:0)">
            <wire x2="1760" y1="1504" y2="1504" x1="1632" />
            <wire x2="1760" y1="1504" y2="1648" x1="1760" />
            <wire x2="1840" y1="1648" y2="1648" x1="1760" />
        </branch>
        <instance x="1840" y="1680" name="XLXI_10" orien="R0">
        </instance>
        <branch name="ram_W_n">
            <wire x2="2304" y1="1200" y2="1200" x1="2224" />
        </branch>
        <branch name="LB1_n">
            <wire x2="2272" y1="1136" y2="1136" x1="2224" />
        </branch>
        <branch name="UB1_n">
            <wire x2="2272" y1="1072" y2="1072" x1="2224" />
        </branch>
        <branch name="OE1_n">
            <wire x2="2336" y1="1008" y2="1008" x1="2224" />
        </branch>
        <branch name="CE1_n">
            <wire x2="2352" y1="944" y2="944" x1="2224" />
        </branch>
        <branch name="ram_D_U(7:0)">
            <wire x2="2304" y1="1648" y2="1648" x1="2224" />
        </branch>
        <branch name="CRE1">
            <wire x2="2352" y1="1392" y2="1392" x1="2224" />
        </branch>
        <branch name="CLK1">
            <wire x2="2336" y1="1328" y2="1328" x1="2224" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="2256" y1="1456" y2="1456" x1="2224" />
        </branch>
        <branch name="ram_D(7:0)">
            <wire x2="2304" y1="1584" y2="1584" x1="2224" />
        </branch>
        <branch name="ram_A(22:0)">
            <wire x2="2272" y1="1520" y2="1520" x1="2224" />
        </branch>
        <branch name="ADV1_n">
            <wire x2="2336" y1="1264" y2="1264" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2304" y="1200" name="ram_W_n" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1136" name="LB1_n" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1072" name="UB1_n" orien="R0" />
        <iomarker fontsize="28" x="2336" y="1008" name="OE1_n" orien="R0" />
        <iomarker fontsize="28" x="2352" y="944" name="CE1_n" orien="R0" />
        <iomarker fontsize="28" x="2304" y="1648" name="ram_D_U(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1392" name="CRE1" orien="R0" />
        <iomarker fontsize="28" x="2336" y="1328" name="CLK1" orien="R0" />
        <iomarker fontsize="28" x="2256" y="1456" name="LEDS(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2304" y="1584" name="ram_D(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1520" name="ram_A(22:0)" orien="R0" />
        <iomarker fontsize="28" x="2336" y="1264" name="ADV1_n" orien="R0" />
        <branch name="XLXN_27">
            <wire x2="1088" y1="1040" y2="1040" x1="944" />
            <wire x2="1088" y1="1040" y2="1440" x1="1088" />
            <wire x2="1248" y1="1440" y2="1440" x1="1088" />
            <wire x2="1840" y1="944" y2="944" x1="1088" />
            <wire x2="1088" y1="944" y2="1040" x1="1088" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="1648" y1="1440" y2="1440" x1="1632" />
            <wire x2="1840" y1="1296" y2="1296" x1="1648" />
            <wire x2="1648" y1="1296" y2="1440" x1="1648" />
        </branch>
    </sheet>
</drawing>