<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5" />
        <signal name="XLXN_11(15:0)" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_74" />
        <signal name="CLK50MHz" />
        <signal name="CLK1MHz">
        </signal>
        <signal name="XLXN_77" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83" />
        <signal name="XLXN_88(15:0)" />
        <signal name="XLXN_92(15:0)" />
        <signal name="XLXN_93" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="CLKOUT(15:0)" />
        <signal name="XLXN_97(15:0)" />
        <signal name="XLXN_98" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CLKOUT(15:0)" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="dcm" name="XLXI_38">
            <attr value="2" name="CLKFX_MULTIPLY">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <attr value="3" name="CLKFX_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_74" name="CLKFB" />
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
        <block symbolname="bufg" name="XLXI_39">
            <blockpin signalname="XLXN_73" name="I" />
            <blockpin signalname="XLXN_74" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_40">
            <blockpin signalname="XLXN_72" name="I" />
            <blockpin signalname="CLK1MHz" name="O" />
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
        <block symbolname="gnd" name="XLXI_36">
            <blockpin signalname="XLXN_70" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_72">
            <wire x2="1152" y1="960" y2="960" x1="1040" />
            <wire x2="1152" y1="960" y2="992" x1="1152" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="1056" y1="288" y2="288" x1="880" />
            <wire x2="1056" y1="288" y2="512" x1="1056" />
            <wire x2="1056" y1="512" y2="512" x1="1040" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="656" y1="512" y2="512" x1="624" />
        </branch>
        <branch name="CLK1MHz">
            <wire x2="608" y1="1440" y2="1712" x1="608" />
            <wire x2="704" y1="1712" y2="1712" x1="608" />
            <wire x2="1152" y1="1440" y2="1440" x1="608" />
            <wire x2="1152" y1="1216" y2="1440" x1="1152" />
        </branch>
        <instance x="656" y="1472" name="XLXI_38" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
        </instance>
        <branch name="XLXN_74">
            <wire x2="416" y1="288" y2="576" x1="416" />
            <wire x2="656" y1="576" y2="576" x1="416" />
            <wire x2="656" y1="288" y2="288" x1="416" />
        </branch>
        <iomarker fontsize="28" x="624" y="512" name="CLK50MHz" orien="R180" />
        <instance x="880" y="256" name="XLXI_39" orien="R180" />
        <instance x="1120" y="992" name="XLXI_40" orien="R90" />
        <branch name="XLXN_70">
            <wire x2="704" y1="1808" y2="1808" x1="688" />
            <wire x2="688" y1="1808" y2="1856" x1="688" />
        </branch>
        <instance x="592" y="1616" name="XLXI_37" orien="R0" />
        <branch name="XLXN_71">
            <wire x2="656" y1="1616" y2="1632" x1="656" />
            <wire x2="656" y1="1632" y2="1648" x1="656" />
            <wire x2="704" y1="1648" y2="1648" x1="656" />
        </branch>
        <branch name="CLKOUT(15:0)">
            <wire x2="1104" y1="1584" y2="1584" x1="1088" />
            <wire x2="1120" y1="1584" y2="1584" x1="1104" />
        </branch>
        <instance x="704" y="1840" name="XLXI_35" orien="R0" />
        <instance x="624" y="1984" name="XLXI_36" orien="R0" />
        <iomarker fontsize="28" x="1120" y="1584" name="CLKOUT(15:0)" orien="R0" />
    </sheet>
</drawing>