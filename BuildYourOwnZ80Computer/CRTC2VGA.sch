<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CRTC_RED" />
        <signal name="CRTC_GREEN" />
        <signal name="CRTC_BLUE" />
        <signal name="CLK25MHz" />
        <signal name="TATA(15:0)" />
        <signal name="TATA(13:0)" />
        <signal name="HSYNC" />
        <signal name="VSYNC" />
        <signal name="BLUE" />
        <signal name="GREEN" />
        <signal name="RED" />
        <signal name="TATA(6:0),TATA(13:7)" />
        <signal name="XLXN_257" />
        <signal name="XLXN_356" />
        <signal name="XLXN_457(13:0)" />
        <signal name="WE_COLOR(7:0)" />
        <signal name="WE_COLOR(7)" />
        <signal name="WE_COLOR(6)" />
        <signal name="WE_COLOR(5)" />
        <signal name="TOTO(15:0)" />
        <signal name="RD_COLOR(7:0)" />
        <signal name="RD_COLOR(7)" />
        <signal name="RD_COLOR(6)" />
        <signal name="RD_COLOR(5)" />
        <signal name="CRTC_VSYNC" />
        <signal name="CRTC_HSYNC" />
        <signal name="CLK1MHz" />
        <port polarity="Input" name="CRTC_RED" />
        <port polarity="Input" name="CRTC_GREEN" />
        <port polarity="Input" name="CRTC_BLUE" />
        <port polarity="Input" name="CLK25MHz" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="RED" />
        <port polarity="Input" name="CRTC_VSYNC" />
        <port polarity="Input" name="CRTC_HSYNC" />
        <port polarity="Input" name="CLK1MHz" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="aZRaEL_vga2vram">
            <timestamp>2010-12-14T16:34:59</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-204" height="24" />
            <line x2="432" y1="-192" y2="-192" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
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
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-12-20T16:48:42</timestamp>
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
        <block symbolname="aZRaEL_vga2vram" name="XLXI_109">
            <blockpin signalname="CRTC_RED" name="RED" />
            <blockpin signalname="CRTC_GREEN" name="GREEN" />
            <blockpin signalname="CRTC_BLUE" name="BLUE" />
            <blockpin signalname="CRTC_VSYNC" name="VSYNC" />
            <blockpin signalname="CRTC_HSYNC" name="HSYNC" />
            <blockpin signalname="CLK1MHz" name="CLK25MHz" />
            <blockpin signalname="XLXN_356" name="W" />
            <blockpin signalname="WE_COLOR(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_457(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="inv16" name="XLXI_106">
            <blockpin signalname="TATA(15:0)" name="I(15:0)" />
            <blockpin signalname="TOTO(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_4">
            <blockpin signalname="CLK25MHz" name="CLK_25MHz" />
            <blockpin signalname="RD_COLOR(7:0)" name="DATA(7:0)" />
            <blockpin name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="TATA(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="RAM_RGB_SYNC" name="XLXI_140">
            <blockpin signalname="CLK25MHz" name="CLK_RD" />
            <blockpin signalname="XLXN_257" name="CLK_WE" />
            <blockpin signalname="XLXN_457(13:0)" name="ADDR_WE(13:0)" />
            <blockpin signalname="TATA(6:0),TATA(13:7)" name="ADDR_RD(13:0)" />
            <blockpin signalname="WE_COLOR(7)" name="WE_RED" />
            <blockpin signalname="XLXN_356" name="DO_WE" />
            <blockpin signalname="WE_COLOR(6)" name="WE_GREEN" />
            <blockpin signalname="WE_COLOR(5)" name="WE_BLUE" />
            <blockpin signalname="RD_COLOR(7)" name="RD_RED" />
            <blockpin signalname="RD_COLOR(6)" name="RD_GREEN" />
            <blockpin signalname="RD_COLOR(5)" name="RD_BLUE" />
        </block>
        <block symbolname="inv" name="XLXI_102">
            <blockpin signalname="CLK1MHz" name="I" />
            <blockpin signalname="XLXN_257" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="736" y="1008" name="XLXI_109" orien="R0">
        </instance>
        <branch name="CRTC_RED">
            <wire x2="736" y1="656" y2="656" x1="672" />
        </branch>
        <branch name="CRTC_GREEN">
            <wire x2="736" y1="720" y2="720" x1="672" />
        </branch>
        <branch name="CRTC_BLUE">
            <wire x2="736" y1="784" y2="784" x1="672" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="1184" y1="176" y2="176" x1="224" />
            <wire x2="2128" y1="176" y2="176" x1="1184" />
            <wire x2="1184" y1="176" y2="256" x1="1184" />
            <wire x2="1408" y1="256" y2="256" x1="1184" />
        </branch>
        <instance x="2576" y="1072" name="XLXI_106" orien="R180" />
        <instance x="2128" y="592" name="XLXI_4" orien="R0">
        </instance>
        <branch name="TATA(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2640" y="1104" type="branch" />
            <wire x2="2640" y1="1104" y2="1104" x1="2576" />
        </branch>
        <branch name="TATA(13:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="2688" y="944" type="branch" />
            <wire x2="2688" y1="560" y2="560" x1="2560" />
            <wire x2="2688" y1="560" y2="944" x1="2688" />
        </branch>
        <branch name="HSYNC">
            <wire x2="2592" y1="496" y2="496" x1="2560" />
        </branch>
        <branch name="VSYNC">
            <wire x2="2592" y1="432" y2="432" x1="2560" />
        </branch>
        <branch name="BLUE">
            <wire x2="2608" y1="368" y2="368" x1="2560" />
        </branch>
        <branch name="GREEN">
            <wire x2="2608" y1="304" y2="304" x1="2560" />
        </branch>
        <branch name="RED">
            <wire x2="2608" y1="240" y2="240" x1="2560" />
        </branch>
        <branch name="TATA(6:0),TATA(13:7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="448" type="branch" />
            <wire x2="1408" y1="448" y2="448" x1="1376" />
        </branch>
        <instance x="1408" y="736" name="XLXI_140" orien="R0">
        </instance>
        <branch name="XLXN_257">
            <wire x2="1408" y1="320" y2="320" x1="1072" />
        </branch>
        <branch name="XLXN_356">
            <wire x2="1168" y1="576" y2="656" x1="1168" />
            <wire x2="1408" y1="576" y2="576" x1="1168" />
        </branch>
        <branch name="XLXN_457(13:0)">
            <wire x2="1280" y1="976" y2="976" x1="1168" />
            <wire x2="1280" y1="384" y2="976" x1="1280" />
            <wire x2="1408" y1="384" y2="384" x1="1280" />
        </branch>
        <branch name="WE_COLOR(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1392" y="816" type="branch" />
            <wire x2="1392" y1="816" y2="816" x1="1168" />
        </branch>
        <branch name="WE_COLOR(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="512" type="branch" />
            <wire x2="1408" y1="512" y2="512" x1="1376" />
        </branch>
        <branch name="WE_COLOR(6)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="640" type="branch" />
            <wire x2="1408" y1="640" y2="640" x1="1376" />
        </branch>
        <branch name="WE_COLOR(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="704" type="branch" />
            <wire x2="1408" y1="704" y2="704" x1="1376" />
        </branch>
        <branch name="TOTO(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2256" y="1104" type="branch" />
            <wire x2="2352" y1="1104" y2="1104" x1="2256" />
        </branch>
        <branch name="RD_COLOR(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2032" y="560" type="branch" />
            <wire x2="2128" y1="560" y2="560" x1="2032" />
        </branch>
        <branch name="RD_COLOR(7)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="256" type="branch" />
            <wire x2="1904" y1="256" y2="256" x1="1856" />
        </branch>
        <branch name="RD_COLOR(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="480" type="branch" />
            <wire x2="1904" y1="480" y2="480" x1="1856" />
        </branch>
        <branch name="RD_COLOR(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="704" type="branch" />
            <wire x2="1904" y1="704" y2="704" x1="1856" />
        </branch>
        <branch name="CRTC_VSYNC">
            <wire x2="736" y1="848" y2="848" x1="672" />
        </branch>
        <branch name="CRTC_HSYNC">
            <wire x2="736" y1="912" y2="912" x1="672" />
        </branch>
        <branch name="CLK1MHz">
            <wire x2="352" y1="320" y2="320" x1="224" />
            <wire x2="848" y1="320" y2="320" x1="352" />
            <wire x2="352" y1="320" y2="976" x1="352" />
            <wire x2="736" y1="976" y2="976" x1="352" />
        </branch>
        <instance x="848" y="352" name="XLXI_102" orien="R0" />
        <iomarker fontsize="28" x="2592" y="496" name="HSYNC" orien="R0" />
        <iomarker fontsize="28" x="2592" y="432" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="2608" y="368" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="2608" y="304" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="2608" y="240" name="RED" orien="R0" />
        <iomarker fontsize="28" x="672" y="720" name="CRTC_GREEN" orien="R180" />
        <iomarker fontsize="28" x="672" y="656" name="CRTC_RED" orien="R180" />
        <iomarker fontsize="28" x="672" y="784" name="CRTC_BLUE" orien="R180" />
        <iomarker fontsize="28" x="672" y="848" name="CRTC_VSYNC" orien="R180" />
        <iomarker fontsize="28" x="672" y="912" name="CRTC_HSYNC" orien="R180" />
        <iomarker fontsize="28" x="224" y="320" name="CLK1MHz" orien="R180" />
        <iomarker fontsize="28" x="224" y="176" name="CLK25MHz" orien="R180" />
    </sheet>
</drawing>