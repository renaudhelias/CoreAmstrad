<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK50MHz" />
        <signal name="XLXN_243" />
        <signal name="XLXN_244" />
        <signal name="XLXN_247" />
        <signal name="RGBxxXXX(7:0)" />
        <signal name="RGBxxXXX(7)" />
        <signal name="RGBxxXXX(6)" />
        <signal name="RGBxxXXX(5)" />
        <signal name="RGB(7:0)" />
        <signal name="RGB(7)" />
        <signal name="RGB(6)" />
        <signal name="RGB(5)" />
        <signal name="XLXN_257" />
        <signal name="XLXN_241" />
        <signal name="XLXN_266" />
        <signal name="ADDR_WE(15:0)" />
        <signal name="ADDR_WE(13:0)" />
        <signal name="TATA(6:0),TATA(13:7)" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="TATA(13:0)" />
        <signal name="TATA(15:0)" />
        <signal name="TOTO(15:0)" />
        <signal name="zero" />
        <signal name="orez" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-12-14T15:50:22</timestamp>
            <rect width="304" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="CLK_commander">
            <timestamp>2010-12-14T14:45:57</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-448" height="512" />
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
        <blockdef name="RAM_RGB_SYNC">
            <timestamp>2010-12-14T14:46:8</timestamp>
            <rect width="320" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-256" y2="-256" x1="384" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="cc16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="AZRAEL_128x128_ROM">
            <timestamp>2010-12-14T14:45:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="inv16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <rect width="64" x="160" y="-44" height="24" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="CLK_commander" name="XLXI_5">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="CLK100MHz" />
            <blockpin signalname="XLXN_241" name="CLK25MHz" />
            <blockpin signalname="XLXN_266" name="CLK1MHz" />
            <blockpin name="PREPARE_WRITE" />
            <blockpin name="DO_WRITE" />
            <blockpin name="PREPARE_READ" />
            <blockpin name="DO_READ" />
            <blockpin name="CLK4MHz" />
        </block>
        <block symbolname="RAM_RGB_SYNC" name="XLXI_96">
            <blockpin signalname="XLXN_241" name="CLK_RD" />
            <blockpin signalname="XLXN_266" name="CLK_WE" />
            <blockpin signalname="ADDR_WE(13:0)" name="ADDR_WE(13:0)" />
            <blockpin signalname="TATA(6:0),TATA(13:7)" name="ADDR_RD(13:0)" />
            <blockpin signalname="RGBxxXXX(7)" name="WE_RED" />
            <blockpin signalname="XLXN_247" name="DO_WE" />
            <blockpin signalname="RGBxxXXX(6)" name="WE_GREEN" />
            <blockpin signalname="RGBxxXXX(5)" name="WE_BLUE" />
            <blockpin signalname="RGB(7)" name="RD_RED" />
            <blockpin signalname="RGB(6)" name="RD_GREEN" />
            <blockpin signalname="RGB(5)" name="RD_BLUE" />
        </block>
        <block symbolname="cc16ce" name="XLXI_98">
            <blockpin signalname="XLXN_266" name="C" />
            <blockpin signalname="XLXN_243" name="CE" />
            <blockpin signalname="XLXN_244" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="ADDR_WE(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="gnd" name="XLXI_99">
            <blockpin signalname="XLXN_244" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_100">
            <blockpin signalname="XLXN_243" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_101">
            <blockpin signalname="XLXN_247" name="P" />
        </block>
        <block symbolname="AZRAEL_128x128_ROM" name="XLXI_15">
            <blockpin signalname="XLXN_266" name="CLK" />
            <blockpin signalname="ADDR_WE(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="RGBxxXXX(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_4">
            <blockpin signalname="XLXN_241" name="CLK_25MHz" />
            <blockpin signalname="RGB(7:0)" name="DATA(7:0)" />
            <blockpin name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="TATA(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="inv16" name="XLXI_106">
            <blockpin signalname="TATA(15:0)" name="I(15:0)" />
            <blockpin signalname="TOTO(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_103">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_104">
            <blockpin signalname="orez" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="144" y="528" name="XLXI_5" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="144" y1="112" y2="112" x1="112" />
            <wire x2="112" y1="112" y2="176" x1="112" />
        </branch>
        <instance x="1552" y="736" name="XLXI_96" orien="R0">
        </instance>
        <instance x="704" y="1040" name="XLXI_98" orien="R0" />
        <branch name="XLXN_243">
            <wire x2="704" y1="848" y2="848" x1="640" />
        </branch>
        <branch name="XLXN_244">
            <wire x2="704" y1="1008" y2="1008" x1="640" />
        </branch>
        <instance x="576" y="1136" name="XLXI_99" orien="R0" />
        <instance x="576" y="848" name="XLXI_100" orien="R0" />
        <branch name="XLXN_247">
            <wire x2="1552" y1="576" y2="576" x1="1392" />
        </branch>
        <instance x="1328" y="576" name="XLXI_101" orien="R0" />
        <branch name="RGBxxXXX(7:0)">
            <wire x2="1264" y1="416" y2="416" x1="1232" />
            <wire x2="1264" y1="416" y2="720" x1="1264" />
            <wire x2="1264" y1="720" y2="800" x1="1264" />
            <wire x2="1264" y1="800" y2="880" x1="1264" />
        </branch>
        <bustap x2="1360" y1="880" y2="880" x1="1264" />
        <bustap x2="1360" y1="800" y2="800" x1="1264" />
        <bustap x2="1360" y1="720" y2="720" x1="1264" />
        <branch name="RGBxxXXX(7)">
            <wire x2="1456" y1="720" y2="720" x1="1360" />
            <wire x2="1456" y1="512" y2="720" x1="1456" />
            <wire x2="1552" y1="512" y2="512" x1="1456" />
        </branch>
        <branch name="RGBxxXXX(6)">
            <wire x2="1488" y1="800" y2="800" x1="1360" />
            <wire x2="1488" y1="640" y2="800" x1="1488" />
            <wire x2="1552" y1="640" y2="640" x1="1488" />
        </branch>
        <branch name="RGBxxXXX(5)">
            <wire x2="1520" y1="880" y2="880" x1="1360" />
            <wire x2="1552" y1="704" y2="704" x1="1520" />
            <wire x2="1520" y1="704" y2="880" x1="1520" />
        </branch>
        <branch name="RGB(7:0)">
            <wire x2="2224" y1="256" y2="320" x1="2224" />
            <wire x2="2224" y1="320" y2="384" x1="2224" />
            <wire x2="2224" y1="384" y2="560" x1="2224" />
            <wire x2="2320" y1="560" y2="560" x1="2224" />
        </branch>
        <bustap x2="2128" y1="256" y2="256" x1="2224" />
        <bustap x2="2128" y1="320" y2="320" x1="2224" />
        <bustap x2="2128" y1="384" y2="384" x1="2224" />
        <branch name="RGB(7)">
            <wire x2="2128" y1="256" y2="256" x1="2000" />
        </branch>
        <branch name="RGB(6)">
            <wire x2="2064" y1="480" y2="480" x1="2000" />
            <wire x2="2064" y1="320" y2="480" x1="2064" />
            <wire x2="2128" y1="320" y2="320" x1="2064" />
        </branch>
        <branch name="RGB(5)">
            <wire x2="2080" y1="704" y2="704" x1="2000" />
            <wire x2="2080" y1="384" y2="704" x1="2080" />
            <wire x2="2128" y1="384" y2="384" x1="2080" />
        </branch>
        <instance x="848" y="512" name="XLXI_15" orien="R0">
        </instance>
        <branch name="XLXN_241">
            <wire x2="1488" y1="176" y2="176" x1="608" />
            <wire x2="1488" y1="176" y2="256" x1="1488" />
            <wire x2="1552" y1="256" y2="256" x1="1488" />
            <wire x2="2320" y1="176" y2="176" x1="1488" />
        </branch>
        <branch name="XLXN_266">
            <wire x2="688" y1="240" y2="240" x1="608" />
            <wire x2="688" y1="240" y2="912" x1="688" />
            <wire x2="704" y1="912" y2="912" x1="688" />
            <wire x2="848" y1="240" y2="240" x1="688" />
            <wire x2="1040" y1="240" y2="240" x1="848" />
            <wire x2="1264" y1="240" y2="240" x1="1040" />
            <wire x2="1408" y1="240" y2="240" x1="1264" />
            <wire x2="1408" y1="240" y2="320" x1="1408" />
            <wire x2="1552" y1="320" y2="320" x1="1408" />
            <wire x2="848" y1="240" y2="416" x1="848" />
        </branch>
        <branch name="ADDR_WE(15:0)">
            <wire x2="1152" y1="784" y2="784" x1="1088" />
        </branch>
        <bustap x2="1152" y1="784" y2="688" x1="1152" />
        <branch name="ADDR_WE(13:0)">
            <wire x2="848" y1="480" y2="480" x1="768" />
            <wire x2="768" y1="480" y2="576" x1="768" />
            <wire x2="1152" y1="576" y2="576" x1="768" />
            <wire x2="1152" y1="576" y2="688" x1="1152" />
            <wire x2="1344" y1="576" y2="576" x1="1152" />
            <wire x2="1344" y1="384" y2="576" x1="1344" />
            <wire x2="1552" y1="384" y2="384" x1="1344" />
        </branch>
        <branch name="TATA(6:0),TATA(13:7)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="2144" y="960" type="branch" />
            <wire x2="1552" y1="448" y2="448" x1="1536" />
            <wire x2="1536" y1="448" y2="912" x1="1536" />
            <wire x2="2144" y1="912" y2="912" x1="1536" />
            <wire x2="2144" y1="912" y2="960" x1="2144" />
        </branch>
        <instance x="2320" y="592" name="XLXI_4" orien="R0">
        </instance>
        <branch name="RED">
            <wire x2="2800" y1="240" y2="240" x1="2752" />
        </branch>
        <branch name="GREEN">
            <wire x2="2800" y1="304" y2="304" x1="2752" />
        </branch>
        <branch name="BLUE">
            <wire x2="2800" y1="368" y2="368" x1="2752" />
        </branch>
        <branch name="VSYNC">
            <wire x2="2784" y1="432" y2="432" x1="2752" />
        </branch>
        <branch name="HSYNC">
            <wire x2="2784" y1="496" y2="496" x1="2752" />
        </branch>
        <branch name="TATA(13:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="2880" y="944" type="branch" />
            <wire x2="2880" y1="560" y2="560" x1="2752" />
            <wire x2="2880" y1="560" y2="944" x1="2880" />
        </branch>
        <instance x="2768" y="1072" name="XLXI_106" orien="R180" />
        <branch name="TATA(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2832" y="1104" type="branch" />
            <wire x2="2832" y1="1104" y2="1104" x1="2768" />
        </branch>
        <branch name="TOTO(15:0)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="2400" y="1088" type="branch" />
            <wire x2="2400" y1="1088" y2="1104" x1="2400" />
            <wire x2="2544" y1="1104" y2="1104" x1="2400" />
        </branch>
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="256" y="816" type="branch" />
            <wire x2="256" y1="816" y2="896" x1="256" />
        </branch>
        <instance x="192" y="1024" name="XLXI_103" orien="R0" />
        <branch name="orez">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="400" y="816" type="branch" />
            <wire x2="400" y1="816" y2="928" x1="400" />
        </branch>
        <instance x="336" y="1056" name="XLXI_104" orien="R0" />
        <iomarker fontsize="28" x="112" y="176" name="CLK50MHz" orien="R90" />
        <iomarker fontsize="28" x="2800" y="240" name="RED" orien="R0" />
        <iomarker fontsize="28" x="2800" y="304" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="2800" y="368" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="2784" y="432" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="2784" y="496" name="HSYNC" orien="R0" />
    </sheet>
</drawing>