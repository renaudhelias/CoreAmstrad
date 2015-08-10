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
        <signal name="LEDS(7:0)" />
        <signal name="USB_DATA(1:0)" />
        <signal name="USB_DATA(1)" />
        <signal name="USB_DATA(0)" />
        <signal name="PLAGE(2:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="BiDirectional" name="USB_DATA(1:0)" />
        <port polarity="Input" name="PLAGE(2:0)" />
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
        <blockdef name="USB_logitech">
            <timestamp>2011-11-10T11:20:46</timestamp>
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="448" y1="96" y2="96" x1="384" />
            <line x2="448" y1="160" y2="160" x1="384" />
            <line x2="448" y1="224" y2="224" x1="384" />
            <line x2="448" y1="288" y2="288" x1="384" />
            <line x2="448" y1="352" y2="352" x1="384" />
            <line x2="448" y1="416" y2="416" x1="384" />
            <line x2="448" y1="480" y2="480" x1="384" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="320" x="64" y="-128" height="640" />
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
        <block symbolname="dcm_sp" name="XLXI_5">
            <attr value="3" name="CLKFX_MULTIPLY">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <attr value="20" name="CLKFX_DIVIDE">
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
        <block symbolname="USB_logitech" name="XLXI_7">
            <blockpin signalname="XLXN_6" name="CLK7_5MHz" />
            <blockpin signalname="PLAGE(2:0)" name="PLAGE(2:0)" />
            <blockpin signalname="USB_DATA(1:0)" name="USB_DATA(1:0)" />
            <blockpin signalname="LEDS(7:0)" name="LEDS(7:0)" />
            <blockpin name="joystick_left" />
            <blockpin name="joystick_right" />
            <blockpin name="joystick_up" />
            <blockpin name="joystick_down" />
            <blockpin name="joystick_button1" />
            <blockpin name="joystick_button2" />
            <blockpin name="joystick_button3" />
            <blockpin name="joystick_button4" />
        </block>
        <block symbolname="pulldown" name="XLXI_8">
            <blockpin signalname="USB_DATA(0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_10">
            <blockpin signalname="USB_DATA(1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="464" y="1616" name="XLXI_5" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
        </instance>
        <instance x="784" y="384" name="XLXI_6" orien="R180" />
        <branch name="XLXN_1">
            <wire x2="864" y1="416" y2="416" x1="784" />
            <wire x2="864" y1="416" y2="656" x1="864" />
            <wire x2="864" y1="656" y2="656" x1="848" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="560" y1="416" y2="416" x1="352" />
            <wire x2="352" y1="416" y2="720" x1="352" />
            <wire x2="464" y1="720" y2="720" x1="352" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="416" y1="624" y2="656" x1="416" />
            <wire x2="464" y1="656" y2="656" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="624" name="CLK50MHz" orien="R270" />
        <instance x="1232" y="976" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_6">
            <wire x2="1040" y1="1104" y2="1104" x1="848" />
            <wire x2="1040" y1="880" y2="1104" x1="1040" />
            <wire x2="1232" y1="880" y2="880" x1="1040" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="1696" y1="880" y2="880" x1="1680" />
            <wire x2="1712" y1="880" y2="880" x1="1696" />
        </branch>
        <branch name="USB_DATA(1:0)">
            <wire x2="1696" y1="944" y2="944" x1="1680" />
            <wire x2="1744" y1="944" y2="944" x1="1696" />
            <wire x2="1808" y1="944" y2="944" x1="1744" />
            <wire x2="1952" y1="944" y2="944" x1="1808" />
        </branch>
        <bustap x2="1744" y1="944" y2="1040" x1="1744" />
        <bustap x2="1808" y1="944" y2="1040" x1="1808" />
        <branch name="USB_DATA(1)">
            <wire x2="1744" y1="1040" y2="1088" x1="1744" />
        </branch>
        <branch name="USB_DATA(0)">
            <wire x2="1808" y1="1040" y2="1088" x1="1808" />
        </branch>
        <instance x="1744" y="1248" name="XLXI_8" orien="R0" />
        <instance x="1680" y="1248" name="XLXI_10" orien="R0" />
        <iomarker fontsize="28" x="1712" y="880" name="LEDS(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="944" name="USB_DATA(1:0)" orien="R0" />
        <branch name="PLAGE(2:0)">
            <wire x2="1232" y1="944" y2="944" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="944" name="PLAGE(2:0)" orien="R180" />
    </sheet>
</drawing>