<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK50MHz" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="XLXN_18" />
        <signal name="REDin" />
        <signal name="GREENin" />
        <signal name="BLUEin" />
        <signal name="XLXN_23" />
        <signal name="XLXN_20(7:0)" />
        <signal name="XLXN_28(2:0)" />
        <signal name="XLXN_29(13:0)" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <blockdef name="aZRaEL_vga">
            <timestamp>2010-11-1T17:23:23</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-448" height="640" />
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
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="AZRAEL_ROM">
            <timestamp>2010-12-5T15:41:51</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="aZRaEL_fifo">
            <timestamp>2010-11-1T17:53:14</timestamp>
            <rect width="64" x="368" y="20" height="24" />
            <line x2="432" y1="32" y2="32" x1="368" />
            <rect width="64" x="368" y="84" height="24" />
            <line x2="432" y1="96" y2="96" x1="368" />
            <rect width="64" x="368" y="148" height="24" />
            <line x2="432" y1="160" y2="160" x1="368" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-320" y2="-320" x1="368" />
            <line x2="432" y1="-176" y2="-176" x1="368" />
            <rect width="304" x="64" y="-640" height="832" />
        </blockdef>
        <block symbolname="aZRaEL_vga" name="XLXI_1">
            <blockpin signalname="XLXN_33" name="clock_pop" />
            <blockpin signalname="XLXN_28(2:0)" name="pop_pixel(2:0)" />
            <blockpin signalname="RED" name="red" />
            <blockpin signalname="GREEN" name="green" />
            <blockpin signalname="BLUE" name="blue" />
            <blockpin signalname="VSYNC" name="vsync" />
            <blockpin signalname="HSYNC" name="hsync" />
            <blockpin signalname="XLXN_23" name="do_pop" />
            <blockpin signalname="XLXN_32" name="resynchro_pop" />
        </block>
        <block symbolname="dcm" name="XLXI_2">
            <attr value="TRUE" name="CLKIN_DIVIDE_BY_2">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_18" name="CLKFB" />
            <blockpin signalname="CLK50MHz" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_33" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin signalname="XLXN_34" name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_10">
            <blockpin signalname="XLXN_33" name="I" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_4">
            <blockpin signalname="GREENin" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="BLUEin" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_6">
            <blockpin signalname="REDin" name="P" />
        </block>
        <block symbolname="AZRAEL_ROM" name="XLXI_11">
            <blockpin signalname="XLXN_34" name="CLK" />
            <blockpin signalname="XLXN_29(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="XLXN_20(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="aZRaEL_fifo" name="XLXI_12">
            <blockpin signalname="XLXN_34" name="clock_pop" />
            <blockpin name="clock_push" />
            <blockpin name="clock_force_push" />
            <blockpin name="push_pixel" />
            <blockpin name="force_push_pixel" />
            <blockpin name="force_addr" />
            <blockpin signalname="XLXN_23" name="do_pop" />
            <blockpin signalname="XLXN_31" name="do_push" />
            <blockpin signalname="XLXN_31" name="do_force_push" />
            <blockpin signalname="XLXN_32" name="resynchro_pop" />
            <blockpin signalname="XLXN_20(7:0)" name="ram_data(7:0)" />
            <blockpin name="ram_write" />
            <blockpin name="ram_read" />
            <blockpin signalname="XLXN_28(2:0)" name="pop_pixel(2:0)" />
            <blockpin signalname="XLXN_29(13:0)" name="ram_addr(13:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_13">
            <blockpin signalname="XLXN_31" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="CLK50MHz">
            <wire x2="816" y1="528" y2="528" x1="784" />
        </branch>
        <instance x="816" y="1488" name="XLXI_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKIN_DIVIDE_BY_2" x="0" y="-64" type="instance" />
        </instance>
        <branch name="RED">
            <wire x2="1840" y1="528" y2="528" x1="1776" />
        </branch>
        <branch name="GREEN">
            <wire x2="1840" y1="592" y2="592" x1="1776" />
        </branch>
        <branch name="BLUE">
            <wire x2="1840" y1="656" y2="656" x1="1776" />
        </branch>
        <branch name="VSYNC">
            <wire x2="1840" y1="720" y2="720" x1="1776" />
        </branch>
        <branch name="HSYNC">
            <wire x2="1840" y1="784" y2="784" x1="1776" />
        </branch>
        <instance x="912" y="352" name="XLXI_10" orien="R180" />
        <branch name="XLXN_18">
            <wire x2="688" y1="384" y2="384" x1="576" />
            <wire x2="576" y1="384" y2="592" x1="576" />
            <wire x2="816" y1="592" y2="592" x1="576" />
        </branch>
        <instance x="1392" y="944" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1840" y="528" name="RED" orien="R0" />
        <iomarker fontsize="28" x="1840" y="592" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="1840" y="656" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="1840" y="720" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="1840" y="784" name="HSYNC" orien="R0" />
        <instance x="1408" y="1296" name="XLXI_6" orien="R0" />
        <branch name="REDin">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1536" y="1328" type="branch" />
            <wire x2="1472" y1="1296" y2="1328" x1="1472" />
            <wire x2="1536" y1="1328" y2="1328" x1="1472" />
        </branch>
        <branch name="GREENin">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1600" y="1360" type="branch" />
            <wire x2="1472" y1="1360" y2="1424" x1="1472" />
            <wire x2="1600" y1="1360" y2="1360" x1="1472" />
        </branch>
        <branch name="BLUEin">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1680" y="1392" type="branch" />
            <wire x2="1616" y1="1392" y2="1424" x1="1616" />
            <wire x2="1680" y1="1392" y2="1392" x1="1616" />
        </branch>
        <instance x="1552" y="1552" name="XLXI_5" orien="R0" />
        <instance x="1408" y="1552" name="XLXI_4" orien="R0" />
        <iomarker fontsize="28" x="784" y="528" name="CLK50MHz" orien="R180" />
        <instance x="2208" y="1344" name="XLXI_11" orien="R0">
        </instance>
        <instance x="2560" y="960" name="XLXI_12" orien="R0">
        </instance>
        <branch name="XLXN_23">
            <wire x2="1792" y1="848" y2="848" x1="1776" />
            <wire x2="2160" y1="848" y2="848" x1="1792" />
            <wire x2="2160" y1="736" y2="848" x1="2160" />
            <wire x2="2560" y1="736" y2="736" x1="2160" />
        </branch>
        <branch name="XLXN_20(7:0)">
            <wire x2="2608" y1="1248" y2="1248" x1="2592" />
            <wire x2="2672" y1="1248" y2="1248" x1="2608" />
            <wire x2="2672" y1="1248" y2="1424" x1="2672" />
            <wire x2="2672" y1="1424" y2="1424" x1="2592" />
            <wire x2="2592" y1="1424" y2="1440" x1="2592" />
            <wire x2="3072" y1="1440" y2="1440" x1="2592" />
            <wire x2="3072" y1="1120" y2="1120" x1="2992" />
            <wire x2="3072" y1="1120" y2="1440" x1="3072" />
        </branch>
        <branch name="XLXN_28(2:0)">
            <wire x2="1312" y1="240" y2="976" x1="1312" />
            <wire x2="1392" y1="976" y2="976" x1="1312" />
            <wire x2="3072" y1="240" y2="240" x1="1312" />
            <wire x2="3072" y1="240" y2="992" x1="3072" />
            <wire x2="3072" y1="992" y2="992" x1="2992" />
        </branch>
        <branch name="XLXN_29(13:0)">
            <wire x2="2144" y1="1168" y2="1312" x1="2144" />
            <wire x2="2208" y1="1312" y2="1312" x1="2144" />
            <wire x2="3056" y1="1168" y2="1168" x1="2144" />
            <wire x2="3056" y1="1056" y2="1056" x1="2992" />
            <wire x2="3056" y1="1056" y2="1168" x1="3056" />
        </branch>
        <instance x="2320" y="1008" name="XLXI_13" orien="R0" />
        <branch name="XLXN_31">
            <wire x2="2560" y1="800" y2="800" x1="2384" />
            <wire x2="2384" y1="800" y2="864" x1="2384" />
            <wire x2="2560" y1="864" y2="864" x1="2384" />
            <wire x2="2384" y1="864" y2="880" x1="2384" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="1856" y1="912" y2="912" x1="1776" />
            <wire x2="1856" y1="832" y2="912" x1="1856" />
            <wire x2="2464" y1="832" y2="832" x1="1856" />
            <wire x2="2464" y1="832" y2="928" x1="2464" />
            <wire x2="2560" y1="928" y2="928" x1="2464" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1248" y1="384" y2="384" x1="912" />
            <wire x2="1248" y1="384" y2="528" x1="1248" />
            <wire x2="1392" y1="528" y2="528" x1="1248" />
            <wire x2="1248" y1="528" y2="528" x1="1200" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="1264" y1="784" y2="784" x1="1200" />
            <wire x2="2560" y1="352" y2="352" x1="1264" />
            <wire x2="1264" y1="352" y2="432" x1="1264" />
            <wire x2="1264" y1="432" y2="784" x1="1264" />
            <wire x2="1824" y1="432" y2="432" x1="1264" />
            <wire x2="1824" y1="432" y2="1248" x1="1824" />
            <wire x2="2208" y1="1248" y2="1248" x1="1824" />
        </branch>
    </sheet>
</drawing>