<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="GND,MA(9:5),RA(2:0),MA(4:0)" />
        <signal name="XLXN_71" />
        <signal name="XLXN_70" />
        <signal name="XLXN_74" />
        <signal name="CLK1MHz" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_73" />
        <signal name="XLXN_72" />
        <signal name="RGB(7:0)" />
        <signal name="RGB(0)" />
        <signal name="RGB(1)" />
        <signal name="RGB(2)" />
        <signal name="XLXN_109(7:0)" />
        <signal name="CLKOUT(15:0)" />
        <signal name="CLKOUT(5)" />
        <signal name="CLKOUT(4)" />
        <signal name="RED" />
        <signal name="BLUE" />
        <signal name="GREEN" />
        <signal name="MA(13:0)" />
        <signal name="RA(4:0)" />
        <signal name="MA(4:0)" />
        <signal name="MA(9:5)" />
        <signal name="RA(2:0)" />
        <signal name="TEST_VCC" />
        <signal name="TEST_GND" />
        <signal name="XLXN_133" />
        <signal name="RESET" />
        <signal name="XLXN_136" />
        <signal name="XLXN_153" />
        <signal name="XLXN_170" />
        <signal name="XLXN_171" />
        <signal name="VSYNC2" />
        <signal name="HSYNC" />
        <signal name="CLKOUT(3)" />
        <signal name="XLXN_177(7:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="TEST_VCC" />
        <port polarity="Output" name="TEST_GND" />
        <port polarity="Input" name="RESET" />
        <port polarity="Output" name="VSYNC2" />
        <port polarity="Output" name="HSYNC" />
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
        <blockdef name="crtcV">
            <timestamp>2010-11-12T9:31:22</timestamp>
            <rect width="256" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
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
        <blockdef name="DBLSCAN">
            <timestamp>2010-9-26T12:38:25</timestamp>
            <rect width="304" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="AZRAEL_128x128_ROM">
            <timestamp>2010-11-13T13:0:14</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_36">
            <blockpin signalname="XLXN_70" name="G" />
        </block>
        <block symbolname="cb16ce" name="XLXI_35">
            <blockpin signalname="CLK1MHz" name="C" />
            <blockpin signalname="XLXN_71" name="CE" />
            <blockpin signalname="XLXN_70" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="CLKOUT(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_37">
            <blockpin signalname="XLXN_71" name="P" />
        </block>
        <block symbolname="bufg" name="XLXI_40">
            <blockpin signalname="XLXN_72" name="I" />
            <blockpin signalname="CLK1MHz" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_39">
            <blockpin signalname="XLXN_73" name="I" />
            <blockpin signalname="XLXN_74" name="O" />
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
        <block symbolname="and2" name="XLXI_62">
            <blockpin signalname="RGB(0)" name="I0" />
            <blockpin signalname="RED" name="I1" />
            <blockpin name="O" />
        </block>
        <block symbolname="and2" name="XLXI_63">
            <blockpin signalname="RGB(2)" name="I0" />
            <blockpin signalname="RED" name="I1" />
            <blockpin signalname="BLUE" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_64">
            <blockpin signalname="RGB(1)" name="I0" />
            <blockpin signalname="RED" name="I1" />
            <blockpin signalname="GREEN" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_13">
            <blockpin signalname="XLXN_133" name="P" />
        </block>
        <block symbolname="crtcV" name="XLXI_14">
            <blockpin signalname="XLXN_133" name="IOCLK" />
            <blockpin signalname="XLXN_133" name="RS" />
            <blockpin signalname="XLXN_133" name="CS" />
            <blockpin signalname="XLXN_133" name="RW" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="CLKOUT(5)" name="CLK" />
            <blockpin name="Din(7:0)" />
            <blockpin signalname="XLXN_153" name="HSYNC" />
            <blockpin signalname="XLXN_136" name="VSYNC" />
            <blockpin signalname="RED" name="DISP" />
            <blockpin name="CPCHSYNC" />
            <blockpin name="CPCVSYNC" />
            <blockpin name="CPCDISP" />
            <blockpin name="CPCBLACK" />
            <blockpin signalname="MA(13:0)" name="MA(13:0)" />
            <blockpin signalname="RA(4:0)" name="RA(4:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_15">
            <blockpin signalname="TEST_VCC" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_57">
            <blockpin signalname="TEST_GND" name="G" />
        </block>
        <block symbolname="DBLSCAN" name="XLXI_41">
            <blockpin signalname="XLXN_153" name="HSYNC_IN" />
            <blockpin signalname="XLXN_136" name="VSYNC_IN" />
            <blockpin signalname="CLKOUT(5)" name="CLK" />
            <blockpin signalname="CLKOUT(4)" name="CLK_X2" />
            <blockpin signalname="XLXN_109(7:0)" name="RGB_IN(7:0)" />
            <blockpin signalname="XLXN_170" name="HSYNC_OUT" />
            <blockpin signalname="XLXN_171" name="VSYNC_OUT" />
            <blockpin signalname="XLXN_177(7:0)" name="RGB_OUT(7:0)" />
        </block>
        <block symbolname="DBLSCAN" name="XLXI_71">
            <blockpin signalname="XLXN_170" name="HSYNC_IN" />
            <blockpin signalname="XLXN_171" name="VSYNC_IN" />
            <blockpin signalname="CLKOUT(4)" name="CLK" />
            <blockpin signalname="CLKOUT(3)" name="CLK_X2" />
            <blockpin signalname="XLXN_177(7:0)" name="RGB_IN(7:0)" />
            <blockpin signalname="HSYNC" name="HSYNC_OUT" />
            <blockpin signalname="VSYNC2" name="VSYNC_OUT" />
            <blockpin signalname="RGB(7:0)" name="RGB_OUT(7:0)" />
        </block>
        <block symbolname="AZRAEL_128x128_ROM" name="XLXI_72">
            <blockpin name="CLK" />
            <blockpin signalname="GND,MA(9:5),RA(2:0),MA(4:0)" name="ADDR(13:0)" />
            <blockpin signalname="XLXN_109(7:0)" name="DATA(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="GND,MA(9:5),RA(2:0),MA(4:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1408" y="1440" type="branch" />
            <wire x2="1424" y1="1440" y2="1440" x1="1408" />
            <wire x2="1776" y1="1232" y2="1232" x1="1424" />
            <wire x2="1424" y1="1232" y2="1440" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="2720" y="560" name="CLK50MHz" orien="R180" />
        <instance x="2720" y="2032" name="XLXI_36" orien="R0" />
        <instance x="2800" y="1888" name="XLXI_35" orien="R0" />
        <instance x="2688" y="1664" name="XLXI_37" orien="R0" />
        <instance x="3216" y="1040" name="XLXI_40" orien="R90" />
        <instance x="2976" y="304" name="XLXI_39" orien="R180" />
        <instance x="2752" y="1520" name="XLXI_38" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
        </instance>
        <branch name="XLXN_71">
            <wire x2="2752" y1="1664" y2="1696" x1="2752" />
            <wire x2="2800" y1="1696" y2="1696" x1="2752" />
        </branch>
        <branch name="XLXN_70">
            <wire x2="2800" y1="1856" y2="1856" x1="2784" />
            <wire x2="2784" y1="1856" y2="1904" x1="2784" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="2512" y1="336" y2="624" x1="2512" />
            <wire x2="2752" y1="624" y2="624" x1="2512" />
            <wire x2="2752" y1="336" y2="336" x1="2512" />
        </branch>
        <branch name="CLK1MHz">
            <wire x2="2704" y1="1488" y2="1760" x1="2704" />
            <wire x2="2800" y1="1760" y2="1760" x1="2704" />
            <wire x2="3248" y1="1488" y2="1488" x1="2704" />
            <wire x2="3248" y1="1264" y2="1488" x1="3248" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="2752" y1="560" y2="560" x1="2720" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="3152" y1="336" y2="336" x1="2976" />
            <wire x2="3152" y1="336" y2="560" x1="3152" />
            <wire x2="3152" y1="560" y2="560" x1="3136" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="3248" y1="1008" y2="1008" x1="3136" />
            <wire x2="3248" y1="1008" y2="1040" x1="3248" />
        </branch>
        <branch name="RGB(7:0)">
            <wire x2="2032" y1="752" y2="752" x1="1936" />
            <wire x2="2048" y1="448" y2="448" x1="2032" />
            <wire x2="2144" y1="448" y2="448" x1="2048" />
            <wire x2="2240" y1="448" y2="448" x1="2144" />
            <wire x2="2032" y1="448" y2="752" x1="2032" />
        </branch>
        <bustap x2="2048" y1="448" y2="352" x1="2048" />
        <bustap x2="2144" y1="448" y2="352" x1="2144" />
        <branch name="RGB(0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2048" y="256" type="branch" />
            <wire x2="2384" y1="96" y2="96" x1="2048" />
            <wire x2="2048" y1="96" y2="256" x1="2048" />
            <wire x2="2048" y1="256" y2="352" x1="2048" />
        </branch>
        <branch name="RGB(1)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2144" y="256" type="branch" />
            <wire x2="2144" y1="128" y2="256" x1="2144" />
            <wire x2="2144" y1="256" y2="352" x1="2144" />
            <wire x2="2832" y1="128" y2="128" x1="2144" />
        </branch>
        <bustap x2="2240" y1="448" y2="352" x1="2240" />
        <branch name="RGB(2)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="2240" y="256" type="branch" />
            <wire x2="2240" y1="256" y2="272" x1="2240" />
            <wire x2="2240" y1="272" y2="352" x1="2240" />
            <wire x2="2384" y1="272" y2="272" x1="2240" />
        </branch>
        <branch name="XLXN_109(7:0)">
            <wire x2="912" y1="752" y2="752" x1="848" />
            <wire x2="848" y1="752" y2="832" x1="848" />
            <wire x2="2176" y1="832" y2="832" x1="848" />
            <wire x2="2176" y1="832" y2="1168" x1="2176" />
            <wire x2="2176" y1="1168" y2="1168" x1="2160" />
        </branch>
        <bustap x2="3296" y1="1632" y2="1728" x1="3296" />
        <branch name="CLKOUT(15:0)">
            <wire x2="3232" y1="1632" y2="1632" x1="3184" />
            <wire x2="3296" y1="1632" y2="1632" x1="3232" />
            <wire x2="3360" y1="1632" y2="1632" x1="3296" />
        </branch>
        <branch name="CLKOUT(5)">
            <wire x2="368" y1="896" y2="896" x1="336" />
            <wire x2="336" y1="896" y2="1872" x1="336" />
            <wire x2="1760" y1="1872" y2="1872" x1="336" />
            <wire x2="3296" y1="1872" y2="1872" x1="1760" />
            <wire x2="912" y1="624" y2="624" x1="832" />
            <wire x2="832" y1="624" y2="848" x1="832" />
            <wire x2="1760" y1="848" y2="848" x1="832" />
            <wire x2="1760" y1="848" y2="1872" x1="1760" />
            <wire x2="3296" y1="1728" y2="1872" x1="3296" />
        </branch>
        <bustap x2="3232" y1="1632" y2="1728" x1="3232" />
        <branch name="CLKOUT(4)">
            <wire x2="912" y1="688" y2="688" x1="800" />
            <wire x2="800" y1="688" y2="1632" x1="800" />
            <wire x2="800" y1="1632" y2="1888" x1="800" />
            <wire x2="3232" y1="1888" y2="1888" x1="800" />
            <wire x2="1488" y1="1632" y2="1632" x1="800" />
            <wire x2="1488" y1="624" y2="1632" x1="1488" />
            <wire x2="1504" y1="624" y2="624" x1="1488" />
            <wire x2="3232" y1="1728" y2="1888" x1="3232" />
        </branch>
        <instance x="2384" y="160" name="XLXI_62" orien="R0" />
        <instance x="2384" y="336" name="XLXI_63" orien="R0" />
        <branch name="BLUE">
            <wire x2="2672" y1="240" y2="240" x1="2640" />
        </branch>
        <iomarker fontsize="28" x="2672" y="240" name="BLUE" orien="R0" />
        <branch name="GREEN">
            <wire x2="3120" y1="96" y2="96" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="96" name="GREEN" orien="R0" />
        <instance x="2832" y="192" name="XLXI_64" orien="R0" />
        <branch name="MA(13:0)">
            <wire x2="1024" y1="944" y2="944" x1="752" />
            <wire x2="1152" y1="944" y2="944" x1="1024" />
        </branch>
        <branch name="RA(4:0)">
            <wire x2="896" y1="1008" y2="1008" x1="752" />
        </branch>
        <bustap x2="896" y1="1008" y2="1104" x1="896" />
        <bustap x2="1024" y1="944" y2="1040" x1="1024" />
        <branch name="MA(4:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1024" y="1184" type="branch" />
            <wire x2="1024" y1="1040" y2="1184" x1="1024" />
        </branch>
        <bustap x2="1152" y1="944" y2="1040" x1="1152" />
        <branch name="MA(9:5)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1152" y="1184" type="branch" />
            <wire x2="1152" y1="1040" y2="1184" x1="1152" />
        </branch>
        <branch name="RA(2:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="896" y="1408" type="branch" />
            <wire x2="896" y1="1104" y2="1408" x1="896" />
        </branch>
        <instance x="112" y="624" name="XLXI_13" orien="R0" />
        <instance x="368" y="1040" name="XLXI_14" orien="R0">
        </instance>
        <instance x="528" y="1328" name="XLXI_15" orien="R0" />
        <branch name="TEST_VCC">
            <wire x2="592" y1="1328" y2="1360" x1="592" />
        </branch>
        <branch name="TEST_GND">
            <wire x2="496" y1="1536" y2="1568" x1="496" />
        </branch>
        <branch name="XLXN_133">
            <wire x2="176" y1="624" y2="656" x1="176" />
            <wire x2="176" y1="656" y2="736" x1="176" />
            <wire x2="368" y1="736" y2="736" x1="176" />
            <wire x2="288" y1="656" y2="656" x1="176" />
            <wire x2="368" y1="656" y2="656" x1="288" />
            <wire x2="368" y1="496" y2="496" x1="288" />
            <wire x2="288" y1="496" y2="576" x1="288" />
            <wire x2="368" y1="576" y2="576" x1="288" />
            <wire x2="288" y1="576" y2="656" x1="288" />
        </branch>
        <branch name="RESET">
            <wire x2="368" y1="816" y2="816" x1="240" />
        </branch>
        <branch name="XLXN_136">
            <wire x2="912" y1="560" y2="560" x1="752" />
        </branch>
        <instance x="432" y="1696" name="XLXI_57" orien="R0" />
        <iomarker fontsize="28" x="592" y="1360" name="TEST_VCC" orien="R90" />
        <iomarker fontsize="28" x="496" y="1536" name="TEST_GND" orien="R270" />
        <iomarker fontsize="28" x="240" y="816" name="RESET" orien="R180" />
        <branch name="XLXN_153">
            <wire x2="912" y1="496" y2="496" x1="752" />
        </branch>
        <branch name="RED">
            <wire x2="784" y1="624" y2="624" x1="752" />
            <wire x2="2272" y1="32" y2="32" x1="784" />
            <wire x2="2384" y1="32" y2="32" x1="2272" />
            <wire x2="2272" y1="32" y2="176" x1="2272" />
            <wire x2="2272" y1="176" y2="208" x1="2272" />
            <wire x2="2384" y1="208" y2="208" x1="2272" />
            <wire x2="2704" y1="176" y2="176" x1="2272" />
            <wire x2="784" y1="32" y2="144" x1="784" />
            <wire x2="784" y1="144" y2="624" x1="784" />
            <wire x2="848" y1="144" y2="144" x1="784" />
            <wire x2="2704" y1="64" y2="176" x1="2704" />
            <wire x2="2832" y1="64" y2="64" x1="2704" />
        </branch>
        <instance x="1504" y="784" name="XLXI_71" orien="R0">
        </instance>
        <instance x="912" y="784" name="XLXI_41" orien="R0">
        </instance>
        <branch name="XLXN_170">
            <wire x2="1504" y1="496" y2="496" x1="1344" />
        </branch>
        <branch name="XLXN_171">
            <wire x2="1424" y1="624" y2="624" x1="1344" />
            <wire x2="1424" y1="560" y2="624" x1="1424" />
            <wire x2="1504" y1="560" y2="560" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="2224" y="624" name="VSYNC2" orien="R0" />
        <branch name="VSYNC2">
            <wire x2="2224" y1="624" y2="624" x1="1936" />
        </branch>
        <branch name="HSYNC">
            <wire x2="1952" y1="496" y2="496" x1="1936" />
            <wire x2="2208" y1="496" y2="496" x1="1952" />
        </branch>
        <iomarker fontsize="28" x="2208" y="496" name="HSYNC" orien="R0" />
        <bustap x2="3360" y1="1632" y2="1728" x1="3360" />
        <branch name="CLKOUT(3)">
            <wire x2="1504" y1="688" y2="688" x1="1472" />
            <wire x2="1472" y1="688" y2="2064" x1="1472" />
            <wire x2="3360" y1="2064" y2="2064" x1="1472" />
            <wire x2="3360" y1="1728" y2="2064" x1="3360" />
        </branch>
        <branch name="XLXN_177(7:0)">
            <wire x2="1504" y1="752" y2="752" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="848" y="144" name="RED" orien="R0" />
        <instance x="1776" y="1264" name="XLXI_72" orien="R0">
        </instance>
    </sheet>
</drawing>