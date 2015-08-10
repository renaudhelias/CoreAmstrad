<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_29" />
        <signal name="XLXN_36" />
        <signal name="XLXN_47" />
        <signal name="XLXN_55" />
        <signal name="XLXN_57" />
        <signal name="XLXN_60" />
        <signal name="XLXN_66" />
        <signal name="XLXN_67" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_69" />
        <signal name="CLK1MHz" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_85" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="CLKOUT(15:0)" />
        <signal name="XLXN_96(15:0)" />
        <signal name="XLXN_97" />
        <signal name="TEST_VCC" />
        <signal name="TEST_GND" />
        <signal name="XLXN_101" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CLK1MHz" />
        <port polarity="Output" name="CLKOUT(15:0)" />
        <port polarity="Output" name="TEST_VCC" />
        <port polarity="Output" name="TEST_GND" />
        <blockdef name="dcm">
            <timestamp>2007-4-11T22:46:4</timestamp>
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
        <blockdef name="cb16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <block symbolname="dcm" name="XLXI_1">
            <attr value="16" name="CLKDV_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 1 16" />
            </attr>
            <attr value="FALSE" name="CLKIN_DIVIDE_BY_2">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <attr value="32" name="CLKFX_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <attr value="2" name="CLKFX_MULTIPLY">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_29" name="CLKFB" />
            <blockpin signalname="XLXN_67" name="CLKIN" />
            <blockpin signalname="XLXN_36" name="DSSEN" />
            <blockpin signalname="XLXN_36" name="PSCLK" />
            <blockpin signalname="XLXN_36" name="PSEN" />
            <blockpin signalname="XLXN_36" name="PSINCDEC" />
            <blockpin signalname="XLXN_36" name="RST" />
            <blockpin signalname="XLXN_66" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin signalname="XLXN_69" name="CLKDV" />
            <blockpin name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_6">
            <blockpin signalname="XLXN_66" name="I" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_36" name="G" />
        </block>
        <block symbolname="bufg" name="XLXI_12">
            <blockpin signalname="XLXN_69" name="I" />
            <blockpin signalname="CLK1MHz" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_32">
            <blockpin signalname="CLK50MHz" name="I" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_36">
            <blockpin signalname="XLXN_70" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_37">
            <blockpin signalname="XLXN_71" name="P" />
        </block>
        <block symbolname="cb16ce" name="XLXI_35">
            <blockpin signalname="CLK1MHz" name="C" />
            <blockpin signalname="XLXN_71" name="CE" />
            <blockpin signalname="XLXN_70" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="CLKOUT(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_15">
            <blockpin signalname="TEST_VCC" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_14">
            <blockpin signalname="TEST_GND" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1136" y="1792" name="XLXI_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKDV_DIVIDE" x="0" y="-1112" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="96" y="-1016" type="instance" />
        </instance>
        <branch name="XLXN_36">
            <wire x2="1136" y1="1408" y2="1408" x1="1104" />
            <wire x2="1104" y1="1408" y2="1536" x1="1104" />
            <wire x2="1136" y1="1536" y2="1536" x1="1104" />
            <wire x2="1104" y1="1536" y2="1600" x1="1104" />
            <wire x2="1136" y1="1600" y2="1600" x1="1104" />
            <wire x2="1104" y1="1600" y2="1664" x1="1104" />
            <wire x2="1136" y1="1664" y2="1664" x1="1104" />
            <wire x2="1104" y1="1664" y2="1680" x1="1104" />
            <wire x2="1136" y1="960" y2="1408" x1="1136" />
        </branch>
        <instance x="1040" y="1808" name="XLXI_7" orien="R0" />
        <branch name="XLXN_66">
            <wire x2="1536" y1="592" y2="592" x1="1408" />
            <wire x2="1536" y1="592" y2="832" x1="1536" />
            <wire x2="1536" y1="832" y2="832" x1="1520" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="1088" y1="1136" y2="1152" x1="1088" />
            <wire x2="1088" y1="1152" y2="1200" x1="1088" />
        </branch>
        <branch name="XLXN_69">
            <wire x2="1648" y1="1216" y2="1216" x1="1520" />
            <wire x2="1648" y1="1184" y2="1216" x1="1648" />
        </branch>
        <branch name="CLK1MHz">
            <wire x2="1552" y1="1296" y2="1552" x1="1552" />
            <wire x2="1648" y1="1552" y2="1552" x1="1552" />
            <wire x2="1744" y1="1296" y2="1296" x1="1552" />
            <wire x2="1744" y1="960" y2="960" x1="1648" />
            <wire x2="1744" y1="960" y2="1296" x1="1744" />
            <wire x2="1744" y1="880" y2="960" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="1744" y="880" name="CLK1MHz" orien="R270" />
        <instance x="1680" y="1184" name="XLXI_12" orien="R270" />
        <branch name="XLXN_67">
            <wire x2="1088" y1="832" y2="912" x1="1088" />
            <wire x2="1136" y1="832" y2="832" x1="1088" />
        </branch>
        <branch name="XLXN_70">
            <wire x2="1648" y1="1648" y2="1648" x1="1632" />
            <wire x2="1632" y1="1648" y2="1696" x1="1632" />
        </branch>
        <instance x="1536" y="1456" name="XLXI_37" orien="R0" />
        <branch name="XLXN_71">
            <wire x2="1600" y1="1456" y2="1472" x1="1600" />
            <wire x2="1600" y1="1472" y2="1488" x1="1600" />
            <wire x2="1648" y1="1488" y2="1488" x1="1600" />
        </branch>
        <branch name="CLKOUT(15:0)">
            <wire x2="2048" y1="1424" y2="1424" x1="2032" />
            <wire x2="2048" y1="1360" y2="1376" x1="2048" />
            <wire x2="2048" y1="1376" y2="1424" x1="2048" />
        </branch>
        <instance x="1648" y="1680" name="XLXI_35" orien="R0" />
        <iomarker fontsize="28" x="2048" y="1360" name="CLKOUT(15:0)" orien="R270" />
        <instance x="1568" y="1824" name="XLXI_36" orien="R0" />
        <instance x="1920" y="768" name="XLXI_15" orien="R0" />
        <branch name="TEST_VCC">
            <wire x2="1984" y1="768" y2="800" x1="1984" />
        </branch>
        <instance x="1824" y="1136" name="XLXI_14" orien="R0" />
        <branch name="TEST_GND">
            <wire x2="1888" y1="976" y2="1008" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1984" y="800" name="TEST_VCC" orien="R90" />
        <iomarker fontsize="28" x="1888" y="976" name="TEST_GND" orien="R270" />
        <instance x="1408" y="560" name="XLXI_6" orien="R180" />
        <branch name="XLXN_29">
            <wire x2="1184" y1="592" y2="592" x1="1120" />
            <wire x2="1120" y1="592" y2="896" x1="1120" />
            <wire x2="1136" y1="896" y2="896" x1="1120" />
        </branch>
        <instance x="1120" y="1136" name="XLXI_32" orien="R270" />
        <iomarker fontsize="28" x="1088" y="1200" name="CLK50MHz" orien="R90" />
    </sheet>
</drawing>