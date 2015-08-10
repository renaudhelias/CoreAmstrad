<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="CLKout" />
        <signal name="CLKin" />
        <signal name="XLXN_25" />
        <signal name="XLXN_24" />
        <port polarity="Output" name="CLKout" />
        <port polarity="Input" name="CLKin" />
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
        <block symbolname="dcm" name="XLXI_23">
            <attr value="12" name="CLKDV_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 1 16" />
            </attr>
            <blockpin signalname="XLXN_25" name="CLKFB" />
            <blockpin signalname="CLKin" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_24" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin signalname="CLKout" name="CLKDV" />
            <blockpin name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_2">
            <blockpin signalname="XLXN_24" name="I" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <text style="fontsize:48;fontname:Arial" x="1836" y="856">http://www.hitequest.com/Hardware/a120.htm</text>
        <instance x="720" y="2032" name="XLXI_23" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKDV_DIVIDE" x="0" y="-1112" type="instance" />
        </instance>
        <branch name="CLKout">
            <wire x2="2336" y1="1456" y2="1456" x1="1104" />
            <wire x2="2688" y1="512" y2="512" x1="2336" />
            <wire x2="2336" y1="512" y2="1456" x1="2336" />
            <wire x2="2832" y1="464" y2="464" x1="2688" />
            <wire x2="2688" y1="464" y2="512" x1="2688" />
        </branch>
        <branch name="CLKin">
            <wire x2="656" y1="912" y2="912" x1="480" />
            <wire x2="656" y1="912" y2="1072" x1="656" />
            <wire x2="720" y1="1072" y2="1072" x1="656" />
        </branch>
        <instance x="1040" y="768" name="XLXI_2" orien="R180" />
        <branch name="XLXN_25">
            <wire x2="704" y1="800" y2="1136" x1="704" />
            <wire x2="720" y1="1136" y2="1136" x1="704" />
            <wire x2="816" y1="800" y2="800" x1="704" />
        </branch>
        <branch name="XLXN_24">
            <wire x2="1136" y1="800" y2="800" x1="1040" />
            <wire x2="1136" y1="800" y2="1072" x1="1136" />
            <wire x2="1136" y1="1072" y2="1072" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="480" y="912" name="CLKin" orien="R180" />
        <iomarker fontsize="28" x="2832" y="464" name="CLKout" orien="R0" />
    </sheet>
</drawing>