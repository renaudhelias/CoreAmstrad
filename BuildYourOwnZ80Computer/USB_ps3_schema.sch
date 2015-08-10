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
        <signal name="XLXN_6" />
        <signal name="PLAGE(3:0)" />
        <signal name="LEDS(7:0)" />
        <signal name="USB_DATA(1:0)" />
        <signal name="USB_DATA(1)" />
        <signal name="USB_DATA(0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Input" name="PLAGE(3:0)" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="BiDirectional" name="USB_DATA(1:0)" />
        <blockdef name="USB_ps3">
            <timestamp>2011-11-10T11:8:46</timestamp>
            <rect width="304" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-108" height="24" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
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
        <block symbolname="USB_ps3" name="XLXI_1">
            <blockpin signalname="XLXN_6" name="CLK60MHz" />
            <blockpin signalname="PLAGE(3:0)" name="PLAGE(3:0)" />
            <blockpin signalname="LEDS(7:0)" name="LEDS(7:0)" />
            <blockpin signalname="USB_DATA(1:0)" name="USB_DATA(1:0)" />
        </block>
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
            <blockpin signalname="XLXN_6" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_6">
            <blockpin signalname="XLXN_1" name="I" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_9">
            <blockpin signalname="USB_DATA(0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_10">
            <blockpin signalname="USB_DATA(1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1808" y="912" name="XLXI_1" orien="R0">
        </instance>
        <instance x="944" y="1552" name="XLXI_5" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
        </instance>
        <instance x="1264" y="320" name="XLXI_6" orien="R180" />
        <branch name="XLXN_1">
            <wire x2="1344" y1="352" y2="352" x1="1264" />
            <wire x2="1344" y1="352" y2="592" x1="1344" />
            <wire x2="1344" y1="592" y2="592" x1="1328" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1040" y1="352" y2="352" x1="832" />
            <wire x2="832" y1="352" y2="656" x1="832" />
            <wire x2="944" y1="656" y2="656" x1="832" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="896" y1="560" y2="592" x1="896" />
            <wire x2="944" y1="592" y2="592" x1="896" />
        </branch>
        <iomarker fontsize="28" x="896" y="560" name="CLK50MHz" orien="R270" />
        <branch name="XLXN_6">
            <wire x2="1344" y1="1040" y2="1040" x1="1328" />
            <wire x2="1568" y1="1040" y2="1040" x1="1344" />
            <wire x2="1568" y1="816" y2="1040" x1="1568" />
            <wire x2="1808" y1="816" y2="816" x1="1568" />
        </branch>
        <branch name="PLAGE(3:0)">
            <wire x2="1808" y1="880" y2="880" x1="1776" />
        </branch>
        <iomarker fontsize="28" x="1776" y="880" name="PLAGE(3:0)" orien="R180" />
        <branch name="LEDS(7:0)">
            <wire x2="2256" y1="816" y2="816" x1="2240" />
            <wire x2="2272" y1="816" y2="816" x1="2256" />
        </branch>
        <branch name="USB_DATA(1:0)">
            <wire x2="2256" y1="880" y2="880" x1="2240" />
            <wire x2="2304" y1="880" y2="880" x1="2256" />
            <wire x2="2368" y1="880" y2="880" x1="2304" />
            <wire x2="2512" y1="880" y2="880" x1="2368" />
        </branch>
        <bustap x2="2304" y1="880" y2="976" x1="2304" />
        <bustap x2="2368" y1="880" y2="976" x1="2368" />
        <branch name="USB_DATA(1)">
            <wire x2="2304" y1="976" y2="1024" x1="2304" />
        </branch>
        <branch name="USB_DATA(0)">
            <wire x2="2368" y1="976" y2="1024" x1="2368" />
        </branch>
        <instance x="2304" y="1184" name="XLXI_9" orien="R0" />
        <instance x="2240" y="1184" name="XLXI_10" orien="R0" />
        <iomarker fontsize="28" x="2272" y="816" name="LEDS(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2512" y="880" name="USB_DATA(1:0)" orien="R0" />
    </sheet>
</drawing>