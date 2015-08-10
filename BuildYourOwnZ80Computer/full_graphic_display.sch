<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="MA(13:0)" />
        <signal name="RA(4:0)" />
        <signal name="MA(4:0)" />
        <signal name="MA(9:5)" />
        <signal name="RA(2:0)" />
        <signal name="HSYNC" />
        <signal name="VSYNC" />
        <signal name="XLXN_42" />
        <signal name="MA(9:5),RA(2:0),MA(4:0)" />
        <signal name="RGB(7:0)" />
        <signal name="RGB(0)" />
        <signal name="RGB(1)" />
        <signal name="RGB(2)" />
        <signal name="RGB(7:3)" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="CLK50MHz" />
        <signal name="CLK1MHz" />
        <signal name="XLXN_74" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="CLKOUT(15:0)" />
        <signal name="CLKOUT(5)" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="RGB(0)" />
        <port polarity="Output" name="RGB(1)" />
        <port polarity="Output" name="RGB(2)" />
        <port polarity="Output" name="RGB(7:3)" />
        <port polarity="Input" name="CLK50MHz" />
        <blockdef name="crtc6845">
            <timestamp>2010-9-26T9:18:15</timestamp>
            <rect width="320" x="64" y="-1024" height="1024" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="448" y1="-992" y2="-992" x1="384" />
            <line x2="448" y1="-928" y2="-928" x1="384" />
            <line x2="448" y1="-864" y2="-864" x1="384" />
            <line x2="448" y1="-800" y2="-800" x1="384" />
            <rect width="64" x="384" y="-748" height="24" />
            <line x2="448" y1="-736" y2="-736" x1="384" />
            <rect width="64" x="384" y="-684" height="24" />
            <line x2="448" y1="-672" y2="-672" x1="384" />
            <line x2="448" y1="-608" y2="-608" x1="384" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="ROM_0_12">
            <timestamp>2010-10-29T14:2:59</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="crtc6845" name="XLXI_1">
            <blockpin signalname="XLXN_42" name="LPSTBn" />
            <blockpin signalname="XLXN_42" name="E" />
            <blockpin signalname="XLXN_42" name="RS" />
            <blockpin signalname="XLXN_42" name="CSn" />
            <blockpin signalname="XLXN_42" name="RW" />
            <blockpin signalname="XLXN_42" name="RESETn" />
            <blockpin signalname="CLKOUT(5)" name="CLK" />
            <blockpin signalname="XLXN_42" name="REG_INIT" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin name="DE" />
            <blockpin name="CURSOR" />
            <blockpin signalname="MA(13:0)" name="MA(13:0)" />
            <blockpin signalname="RA(4:0)" name="RA(4:0)" />
            <blockpin name="Hend" />
            <blockpin name="HS" />
            <blockpin name="CHROW_CLK" />
            <blockpin name="Vend" />
            <blockpin name="SLadj" />
            <blockpin name="H" />
            <blockpin name="V" />
            <blockpin name="CURSOR_ACTIVE" />
            <blockpin name="VERT_RST" />
            <blockpin name="D(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_13">
            <blockpin signalname="XLXN_42" name="P" />
        </block>
        <block symbolname="ROM_0_12" name="XLXI_3">
            <blockpin signalname="MA(9:5),RA(2:0),MA(4:0)" name="address(12:0)" />
            <blockpin signalname="RGB(7:0)" name="data(7:0)" />
        </block>
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
        <instance x="528" y="1216" name="XLXI_1" orien="R0">
        </instance>
        <branch name="MA(13:0)">
            <wire x2="1248" y1="480" y2="480" x1="976" />
            <wire x2="1376" y1="480" y2="480" x1="1248" />
        </branch>
        <branch name="RA(4:0)">
            <wire x2="1120" y1="544" y2="544" x1="976" />
        </branch>
        <bustap x2="1120" y1="544" y2="640" x1="1120" />
        <bustap x2="1248" y1="480" y2="576" x1="1248" />
        <branch name="MA(4:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1248" y="720" type="branch" />
            <wire x2="1248" y1="576" y2="720" x1="1248" />
        </branch>
        <bustap x2="1376" y1="480" y2="576" x1="1376" />
        <branch name="MA(9:5)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1376" y="720" type="branch" />
            <wire x2="1376" y1="576" y2="720" x1="1376" />
        </branch>
        <branch name="RA(2:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1120" y="944" type="branch" />
            <wire x2="1120" y1="640" y2="944" x1="1120" />
        </branch>
        <branch name="HSYNC">
            <wire x2="1136" y1="224" y2="224" x1="976" />
        </branch>
        <branch name="VSYNC">
            <wire x2="1136" y1="288" y2="288" x1="976" />
        </branch>
        <instance x="384" y="176" name="XLXI_13" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="448" y1="176" y2="224" x1="448" />
            <wire x2="528" y1="224" y2="224" x1="448" />
            <wire x2="448" y1="224" y2="352" x1="448" />
            <wire x2="528" y1="352" y2="352" x1="448" />
            <wire x2="448" y1="352" y2="480" x1="448" />
            <wire x2="528" y1="480" y2="480" x1="448" />
            <wire x2="448" y1="480" y2="608" x1="448" />
            <wire x2="528" y1="608" y2="608" x1="448" />
            <wire x2="448" y1="608" y2="736" x1="448" />
            <wire x2="528" y1="736" y2="736" x1="448" />
            <wire x2="448" y1="736" y2="864" x1="448" />
            <wire x2="528" y1="864" y2="864" x1="448" />
            <wire x2="448" y1="864" y2="1120" x1="448" />
            <wire x2="528" y1="1120" y2="1120" x1="448" />
        </branch>
        <iomarker fontsize="28" x="1136" y="224" name="HSYNC" orien="R0" />
        <iomarker fontsize="28" x="1136" y="288" name="VSYNC" orien="R0" />
        <branch name="MA(9:5),RA(2:0),MA(4:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="864" y="1344" type="branch" />
            <wire x2="880" y1="1344" y2="1344" x1="864" />
        </branch>
        <instance x="880" y="1376" name="XLXI_3" orien="R0">
        </instance>
        <branch name="RGB(7:0)">
            <wire x2="1328" y1="1344" y2="1344" x1="1264" />
            <wire x2="1424" y1="1344" y2="1344" x1="1328" />
            <wire x2="1520" y1="1344" y2="1344" x1="1424" />
            <wire x2="1680" y1="1344" y2="1344" x1="1520" />
        </branch>
        <bustap x2="1328" y1="1344" y2="1248" x1="1328" />
        <bustap x2="1424" y1="1344" y2="1248" x1="1424" />
        <branch name="RGB(0)">
            <wire x2="1328" y1="1152" y2="1248" x1="1328" />
        </branch>
        <branch name="RGB(1)">
            <wire x2="1424" y1="1152" y2="1248" x1="1424" />
        </branch>
        <bustap x2="1520" y1="1344" y2="1248" x1="1520" />
        <branch name="RGB(2)">
            <wire x2="1520" y1="1152" y2="1248" x1="1520" />
        </branch>
        <bustap x2="1680" y1="1344" y2="1248" x1="1680" />
        <branch name="RGB(7:3)">
            <wire x2="1680" y1="1152" y2="1248" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1152" name="RGB(0)" orien="R270" />
        <iomarker fontsize="28" x="1424" y="1152" name="RGB(1)" orien="R270" />
        <iomarker fontsize="28" x="1520" y="1152" name="RGB(2)" orien="R270" />
        <iomarker fontsize="28" x="1680" y="1152" name="RGB(7:3)" orien="R270" />
        <branch name="XLXN_72">
            <wire x2="2768" y1="1104" y2="1104" x1="2656" />
            <wire x2="2768" y1="1104" y2="1120" x1="2768" />
            <wire x2="2768" y1="1120" y2="1136" x1="2768" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="2512" y1="432" y2="432" x1="2496" />
            <wire x2="2672" y1="432" y2="432" x1="2512" />
            <wire x2="2672" y1="432" y2="656" x1="2672" />
            <wire x2="2672" y1="656" y2="656" x1="2656" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="2256" y1="656" y2="656" x1="2240" />
            <wire x2="2272" y1="656" y2="656" x1="2256" />
        </branch>
        <branch name="CLK1MHz">
            <wire x2="2224" y1="1584" y2="1856" x1="2224" />
            <wire x2="2320" y1="1856" y2="1856" x1="2224" />
            <wire x2="2768" y1="1584" y2="1584" x1="2224" />
            <wire x2="2768" y1="1360" y2="1584" x1="2768" />
        </branch>
        <instance x="2272" y="1616" name="XLXI_38" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_DIVIDE" x="48" y="-1064" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
        </instance>
        <branch name="XLXN_74">
            <wire x2="2032" y1="432" y2="720" x1="2032" />
            <wire x2="2272" y1="720" y2="720" x1="2032" />
            <wire x2="2256" y1="432" y2="432" x1="2032" />
            <wire x2="2272" y1="432" y2="432" x1="2256" />
        </branch>
        <instance x="2496" y="400" name="XLXI_39" orien="R180" />
        <instance x="2736" y="1136" name="XLXI_40" orien="R90" />
        <branch name="XLXN_70">
            <wire x2="2320" y1="1952" y2="1952" x1="2304" />
            <wire x2="2304" y1="1952" y2="2000" x1="2304" />
        </branch>
        <instance x="2208" y="1760" name="XLXI_37" orien="R0" />
        <branch name="XLXN_71">
            <wire x2="2272" y1="1760" y2="1776" x1="2272" />
            <wire x2="2272" y1="1776" y2="1792" x1="2272" />
            <wire x2="2320" y1="1792" y2="1792" x1="2272" />
        </branch>
        <branch name="CLKOUT(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2816" y="1728" type="branch" />
            <wire x2="2720" y1="1728" y2="1728" x1="2704" />
            <wire x2="2816" y1="1728" y2="1728" x1="2720" />
        </branch>
        <instance x="2320" y="1984" name="XLXI_35" orien="R0" />
        <instance x="2240" y="2128" name="XLXI_36" orien="R0" />
        <bustap x2="2816" y1="1728" y2="1824" x1="2816" />
        <iomarker fontsize="28" x="2240" y="656" name="CLK50MHz" orien="R180" />
        <branch name="CLKOUT(5)">
            <wire x2="528" y1="992" y2="992" x1="464" />
            <wire x2="464" y1="992" y2="1968" x1="464" />
            <wire x2="2832" y1="1968" y2="1968" x1="464" />
            <wire x2="2832" y1="1824" y2="1824" x1="2816" />
            <wire x2="2832" y1="1824" y2="1968" x1="2832" />
        </branch>
    </sheet>
</drawing>