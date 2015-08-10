<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_73" />
        <signal name="XLXN_103" />
        <signal name="XLXN_72" />
        <signal name="CLK66MHz" />
        <signal name="CLKOUT(15:0)" />
        <signal name="XLXN_71" />
        <signal name="XLXN_70" />
        <signal name="CLK25MHz" />
        <signal name="CLK50MHz" />
        <signal name="CLKOUT(5)" />
        <signal name="CLK1MHz" />
        <signal name="XLXN_109" />
        <port polarity="Output" name="CLK25MHz" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CLK1MHz" />
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
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
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
        <block symbolname="cb2ce" name="XLXI_50">
            <blockpin signalname="XLXN_109" name="C" />
            <blockpin signalname="XLXN_103" name="CE" />
            <blockpin name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="CLK25MHz" name="Q0" />
            <blockpin name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="bufg" name="XLXI_39">
            <blockpin signalname="XLXN_73" name="I" />
            <blockpin signalname="XLXN_109" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_52">
            <blockpin signalname="XLXN_103" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_51">
            <blockpin name="G" />
        </block>
        <block symbolname="bufg" name="XLXI_40">
            <blockpin signalname="XLXN_72" name="I" />
            <blockpin signalname="CLK66MHz" name="O" />
        </block>
        <block symbolname="cb16ce" name="XLXI_35">
            <blockpin signalname="CLK66MHz" name="C" />
            <blockpin signalname="XLXN_71" name="CE" />
            <blockpin signalname="XLXN_70" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="CLKOUT(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_37">
            <blockpin signalname="XLXN_71" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_36">
            <blockpin signalname="XLXN_70" name="G" />
        </block>
        <block symbolname="bufg" name="XLXI_53">
            <blockpin signalname="CLKOUT(5)" name="I" />
            <blockpin signalname="CLK1MHz" name="O" />
        </block>
        <block symbolname="dcm" name="XLXI_38">
            <attr value="4" name="CLKFX_MULTIPLY">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <attr value="3" name="CLKFX_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_109" name="CLKFB" />
            <blockpin signalname="CLK50MHz" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_73" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin signalname="XLXN_72" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="896" y="672" name="XLXI_50" orien="R0" />
        <instance x="672" y="384" name="XLXI_39" orien="R180" />
        <branch name="XLXN_73">
            <wire x2="848" y1="416" y2="416" x1="672" />
            <wire x2="848" y1="416" y2="640" x1="848" />
            <wire x2="848" y1="640" y2="640" x1="832" />
        </branch>
        <instance x="800" y="368" name="XLXI_52" orien="R0" />
        <branch name="XLXN_103">
            <wire x2="864" y1="368" y2="480" x1="864" />
            <wire x2="896" y1="480" y2="480" x1="864" />
        </branch>
        <instance x="832" y="800" name="XLXI_51" orien="R0" />
        <instance x="896" y="1120" name="XLXI_40" orien="R90" />
        <branch name="XLXN_72">
            <wire x2="928" y1="1088" y2="1088" x1="832" />
            <wire x2="928" y1="1088" y2="1120" x1="928" />
        </branch>
        <branch name="CLK66MHz">
            <wire x2="384" y1="1568" y2="1840" x1="384" />
            <wire x2="480" y1="1840" y2="1840" x1="384" />
            <wire x2="928" y1="1568" y2="1568" x1="384" />
            <wire x2="928" y1="1344" y2="1568" x1="928" />
        </branch>
        <instance x="480" y="1968" name="XLXI_35" orien="R0" />
        <branch name="CLKOUT(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1040" y="1712" type="branch" />
            <wire x2="976" y1="1712" y2="1712" x1="864" />
            <wire x2="992" y1="1712" y2="1712" x1="976" />
            <wire x2="1040" y1="1712" y2="1712" x1="992" />
        </branch>
        <branch name="XLXN_71">
            <wire x2="432" y1="1744" y2="1776" x1="432" />
            <wire x2="480" y1="1776" y2="1776" x1="432" />
        </branch>
        <instance x="368" y="1744" name="XLXI_37" orien="R0" />
        <instance x="400" y="2112" name="XLXI_36" orien="R0" />
        <branch name="XLXN_70">
            <wire x2="480" y1="1936" y2="1936" x1="464" />
            <wire x2="464" y1="1936" y2="1984" x1="464" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="1360" y1="352" y2="352" x1="1280" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="448" y1="640" y2="640" x1="400" />
        </branch>
        <bustap x2="992" y1="1712" y2="1808" x1="992" />
        <branch name="CLKOUT(5)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="992" y="1904" type="branch" />
            <wire x2="992" y1="1808" y2="1888" x1="992" />
            <wire x2="992" y1="1888" y2="1904" x1="992" />
        </branch>
        <instance x="992" y="1920" name="XLXI_53" orien="R0" />
        <branch name="CLK1MHz">
            <wire x2="1264" y1="1888" y2="1888" x1="1216" />
        </branch>
        <instance x="448" y="1600" name="XLXI_38" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
        </instance>
        <branch name="XLXN_109">
            <wire x2="432" y1="416" y2="416" x1="416" />
            <wire x2="448" y1="416" y2="416" x1="432" />
            <wire x2="432" y1="416" y2="704" x1="432" />
            <wire x2="448" y1="704" y2="704" x1="432" />
            <wire x2="416" y1="416" y2="544" x1="416" />
            <wire x2="896" y1="544" y2="544" x1="416" />
        </branch>
        <iomarker fontsize="28" x="400" y="640" name="CLK50MHz" orien="R180" />
        <iomarker fontsize="28" x="1360" y="352" name="CLK25MHz" orien="R0" />
        <iomarker fontsize="28" x="1264" y="1888" name="CLK1MHz" orien="R0" />
    </sheet>
</drawing>