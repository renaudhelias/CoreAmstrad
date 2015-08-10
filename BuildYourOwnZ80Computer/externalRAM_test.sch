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
        <signal name="XLXN_487" />
        <signal name="XLXN_533" />
        <signal name="XLXN_534" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="ram_D(7)" />
        <signal name="ram_D(6)" />
        <signal name="ram_D(5)" />
        <signal name="XLXN_241" />
        <signal name="zero" />
        <signal name="MA(13:5),RA(4:0),MA(4:0)" />
        <signal name="ram_D(7:0)" />
        <signal name="pic_W" />
        <signal name="pic_A(14:0)" />
        <signal name="pic_D(7:0)" />
        <signal name="SWITCH_FILL" />
        <signal name="XLXN_543" />
        <signal name="CLK50MHz" />
        <signal name="CE1" />
        <signal name="UB1" />
        <signal name="LB1" />
        <signal name="OE1" />
        <signal name="LED" />
        <signal name="ram_W" />
        <signal name="ram_A(14:0)" />
        <signal name="zero,zero,MA(13:0)" />
        <signal name="AM(15:0)" />
        <signal name="zero,zero,zero,RA(4:0)" />
        <signal name="AR(7:0)" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="BiDirectional" name="ram_D(7:0)" />
        <port polarity="Input" name="pic_W" />
        <port polarity="Input" name="pic_A(14:0)" />
        <port polarity="Input" name="pic_D(7:0)" />
        <port polarity="Input" name="SWITCH_FILL" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CE1" />
        <port polarity="Output" name="UB1" />
        <port polarity="Output" name="LB1" />
        <port polarity="Output" name="OE1" />
        <port polarity="Output" name="LED" />
        <port polarity="Output" name="ram_W" />
        <port polarity="Output" name="ram_A(14:0)" />
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="CLK_commander">
            <timestamp>2010-12-22T17:16:0</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="336" x="64" y="-448" height="512" />
        </blockdef>
        <blockdef name="crtcV">
            <timestamp>2010-12-14T14:46:3</timestamp>
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
        <blockdef name="CRTC2VGA">
            <timestamp>2010-12-20T17:11:18</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-320" y2="-320" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <blockdef name="RAMFiller">
            <timestamp>2010-12-21T16:25:32</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <blockdef name="inv8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <circle r="16" cx="144" cy="-32" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="160" y="-44" height="24" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <block symbolname="vcc" name="XLXI_135">
            <blockpin signalname="XLXN_487" name="P" />
        </block>
        <block symbolname="crtcV" name="XLXI_142">
            <blockpin signalname="XLXN_487" name="IOCLK" />
            <blockpin signalname="XLXN_487" name="RS" />
            <blockpin signalname="XLXN_487" name="CS" />
            <blockpin signalname="XLXN_487" name="RW" />
            <blockpin signalname="XLXN_487" name="RESET" />
            <blockpin signalname="XLXN_543" name="CLK" />
            <blockpin name="Din(7:0)" />
            <blockpin signalname="XLXN_533" name="HSYNC" />
            <blockpin signalname="XLXN_534" name="VSYNC" />
            <blockpin name="DISP" />
            <blockpin name="CPCHSYNC" />
            <blockpin name="CPCVSYNC" />
            <blockpin name="CPCDISP" />
            <blockpin name="CPCBLACK" />
            <blockpin signalname="MA(13:0)" name="MA(13:0)" />
            <blockpin signalname="RA(4:0)" name="RA(4:0)" />
        </block>
        <block symbolname="CRTC2VGA" name="XLXI_143">
            <blockpin signalname="ram_D(7)" name="CRTC_RED" />
            <blockpin signalname="ram_D(6)" name="CRTC_GREEN" />
            <blockpin signalname="ram_D(5)" name="CRTC_BLUE" />
            <blockpin signalname="XLXN_241" name="CLK25MHz" />
            <blockpin signalname="XLXN_534" name="CRTC_VSYNC" />
            <blockpin signalname="XLXN_533" name="CRTC_HSYNC" />
            <blockpin signalname="XLXN_543" name="CLK1MHz" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="RED" name="RED" />
        </block>
        <block symbolname="gnd" name="XLXI_141">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="RAMFiller" name="XLXI_144">
            <blockpin signalname="pic_W" name="pic_W" />
            <blockpin signalname="SWITCH_FILL" name="FILL" />
            <blockpin signalname="pic_A(14:0)" name="pic_A(14:0)" />
            <blockpin signalname="pic_D(7:0)" name="pic_D(7:0)" />
            <blockpin signalname="MA(13:5),RA(4:0),MA(4:0)" name="A(18:0)" />
            <blockpin signalname="ram_W" name="ram_W" />
            <blockpin signalname="ram_A(14:0)" name="ram_A(14:0)" />
            <blockpin signalname="ram_D(7:0)" name="ram_D(7:0)" />
        </block>
        <block symbolname="CLK_commander" name="XLXI_1">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="CLK100MHz" />
            <blockpin signalname="XLXN_241" name="CLK25MHz" />
            <blockpin signalname="XLXN_543" name="CLK1MHz" />
            <blockpin name="CLK4MHz" />
        </block>
        <block symbolname="inv" name="XLXI_159">
            <blockpin signalname="SWITCH_FILL" name="I" />
            <blockpin signalname="LED" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_163">
            <blockpin signalname="CE1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_164">
            <blockpin signalname="UB1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_165">
            <blockpin signalname="LB1" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_166">
            <blockpin signalname="LED" name="I" />
            <blockpin signalname="OE1" name="O" />
        </block>
        <block symbolname="inv16" name="XLXI_168">
            <blockpin signalname="zero,zero,MA(13:0)" name="I(15:0)" />
            <blockpin signalname="AM(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="inv8" name="XLXI_169">
            <blockpin signalname="zero,zero,zero,RA(4:0)" name="I(7:0)" />
            <blockpin signalname="AR(7:0)" name="O(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="640" y="768" name="XLXI_135" orien="R0" />
        <instance x="832" y="1344" name="XLXI_142" orien="R0">
        </instance>
        <branch name="MA(13:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="1248" type="branch" />
            <wire x2="1280" y1="1248" y2="1248" x1="1216" />
        </branch>
        <branch name="RA(4:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="1312" type="branch" />
            <wire x2="1280" y1="1312" y2="1312" x1="1216" />
        </branch>
        <branch name="XLXN_487">
            <wire x2="704" y1="768" y2="800" x1="704" />
            <wire x2="832" y1="800" y2="800" x1="704" />
            <wire x2="704" y1="800" y2="880" x1="704" />
            <wire x2="832" y1="880" y2="880" x1="704" />
            <wire x2="704" y1="880" y2="960" x1="704" />
            <wire x2="832" y1="960" y2="960" x1="704" />
            <wire x2="704" y1="960" y2="1040" x1="704" />
            <wire x2="832" y1="1040" y2="1040" x1="704" />
            <wire x2="704" y1="1040" y2="1120" x1="704" />
            <wire x2="832" y1="1120" y2="1120" x1="704" />
        </branch>
        <branch name="XLXN_533">
            <wire x2="1424" y1="800" y2="800" x1="1216" />
            <wire x2="1424" y1="800" y2="928" x1="1424" />
            <wire x2="1632" y1="928" y2="928" x1="1424" />
        </branch>
        <branch name="XLXN_534">
            <wire x2="1632" y1="864" y2="864" x1="1216" />
        </branch>
        <branch name="RED">
            <wire x2="2080" y1="992" y2="992" x1="2016" />
        </branch>
        <branch name="GREEN">
            <wire x2="2080" y1="896" y2="896" x1="2016" />
        </branch>
        <branch name="BLUE">
            <wire x2="2080" y1="800" y2="800" x1="2016" />
        </branch>
        <branch name="VSYNC">
            <wire x2="2080" y1="704" y2="704" x1="2016" />
        </branch>
        <branch name="HSYNC">
            <wire x2="2080" y1="608" y2="608" x1="2016" />
        </branch>
        <branch name="ram_D(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1552" y="608" type="branch" />
            <wire x2="1632" y1="608" y2="608" x1="1552" />
        </branch>
        <branch name="ram_D(6)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1552" y="672" type="branch" />
            <wire x2="1632" y1="672" y2="672" x1="1552" />
        </branch>
        <branch name="ram_D(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1552" y="736" type="branch" />
            <wire x2="1632" y1="736" y2="736" x1="1552" />
        </branch>
        <instance x="1632" y="1024" name="XLXI_143" orien="R0">
        </instance>
        <branch name="XLXN_241">
            <wire x2="1616" y1="304" y2="304" x1="560" />
            <wire x2="1616" y1="304" y2="800" x1="1616" />
            <wire x2="1632" y1="800" y2="800" x1="1616" />
        </branch>
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="224" y="896" type="branch" />
            <wire x2="224" y1="896" y2="1024" x1="224" />
        </branch>
        <instance x="160" y="1152" name="XLXI_141" orien="R0" />
        <branch name="MA(13:5),RA(4:0),MA(4:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2048" y="368" type="branch" />
            <wire x2="2128" y1="368" y2="368" x1="2048" />
        </branch>
        <branch name="ram_D(7:0)">
            <wire x2="2528" y1="368" y2="368" x1="2512" />
            <wire x2="2528" y1="368" y2="592" x1="2528" />
        </branch>
        <branch name="pic_W">
            <wire x2="2128" y1="112" y2="112" x1="2016" />
        </branch>
        <branch name="pic_A(14:0)">
            <wire x2="2128" y1="240" y2="240" x1="2016" />
        </branch>
        <branch name="pic_D(7:0)">
            <wire x2="2128" y1="304" y2="304" x1="2016" />
        </branch>
        <branch name="XLXN_543">
            <wire x2="608" y1="368" y2="368" x1="560" />
            <wire x2="608" y1="368" y2="1200" x1="608" />
            <wire x2="832" y1="1200" y2="1200" x1="608" />
            <wire x2="608" y1="1200" y2="1392" x1="608" />
            <wire x2="1552" y1="1392" y2="1392" x1="608" />
            <wire x2="1632" y1="992" y2="992" x1="1552" />
            <wire x2="1552" y1="992" y2="1392" x1="1552" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="64" y1="240" y2="304" x1="64" />
            <wire x2="96" y1="240" y2="240" x1="64" />
        </branch>
        <instance x="96" y="656" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2080" y="992" name="RED" orien="R0" />
        <iomarker fontsize="28" x="2080" y="896" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="2080" y="800" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="2080" y="704" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="2080" y="608" name="HSYNC" orien="R0" />
        <iomarker fontsize="28" x="2528" y="592" name="ram_D(7:0)" orien="R90" />
        <iomarker fontsize="28" x="2016" y="112" name="pic_W" orien="R180" />
        <iomarker fontsize="28" x="2016" y="240" name="pic_A(14:0)" orien="R180" />
        <iomarker fontsize="28" x="2016" y="304" name="pic_D(7:0)" orien="R180" />
        <iomarker fontsize="28" x="64" y="304" name="CLK50MHz" orien="R90" />
        <iomarker fontsize="28" x="1248" y="176" name="SWITCH_FILL" orien="R180" />
        <instance x="1392" y="112" name="XLXI_159" orien="R0" />
        <branch name="CE1">
            <wire x2="1696" y1="1184" y2="1248" x1="1696" />
        </branch>
        <branch name="UB1">
            <wire x2="1824" y1="1184" y2="1248" x1="1824" />
        </branch>
        <branch name="LB1">
            <wire x2="1952" y1="1184" y2="1248" x1="1952" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1248" name="CE1" orien="R90" />
        <iomarker fontsize="28" x="1952" y="1248" name="LB1" orien="R90" />
        <iomarker fontsize="28" x="1824" y="1248" name="UB1" orien="R90" />
        <instance x="1760" y="1056" name="XLXI_163" orien="R180" />
        <instance x="1888" y="1056" name="XLXI_164" orien="R180" />
        <instance x="2016" y="1056" name="XLXI_165" orien="R180" />
        <branch name="OE1">
            <wire x2="1984" y1="48" y2="48" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1984" y="48" name="OE1" orien="R0" />
        <instance x="1712" y="80" name="XLXI_166" orien="R0" />
        <branch name="LED">
            <wire x2="1664" y1="80" y2="80" x1="1616" />
            <wire x2="1664" y1="80" y2="224" x1="1664" />
            <wire x2="1664" y1="48" y2="80" x1="1664" />
            <wire x2="1712" y1="48" y2="48" x1="1664" />
        </branch>
        <iomarker fontsize="28" x="2784" y="112" name="ram_W" orien="R0" />
        <branch name="ram_W">
            <wire x2="2784" y1="112" y2="112" x1="2512" />
        </branch>
        <branch name="SWITCH_FILL">
            <wire x2="1344" y1="176" y2="176" x1="1248" />
            <wire x2="2128" y1="176" y2="176" x1="1344" />
            <wire x2="1392" y1="80" y2="80" x1="1344" />
            <wire x2="1344" y1="80" y2="176" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="1664" y="224" name="LED" orien="R90" />
        <instance x="2128" y="400" name="XLXI_144" orien="R0">
        </instance>
        <branch name="ram_A(14:0)">
            <wire x2="2672" y1="240" y2="240" x1="2512" />
        </branch>
        <iomarker fontsize="28" x="2672" y="240" name="ram_A(14:0)" orien="R0" />
        <instance x="1344" y="1536" name="XLXI_168" orien="R0" />
        <branch name="zero,zero,MA(13:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1216" y="1504" type="branch" />
            <wire x2="1344" y1="1504" y2="1504" x1="1216" />
        </branch>
        <branch name="AM(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1664" y="1504" type="branch" />
            <wire x2="1664" y1="1504" y2="1504" x1="1568" />
        </branch>
        <instance x="1360" y="1632" name="XLXI_169" orien="R0" />
        <branch name="zero,zero,zero,RA(4:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1248" y="1600" type="branch" />
            <wire x2="1360" y1="1600" y2="1600" x1="1248" />
        </branch>
        <branch name="AR(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1680" y="1600" type="branch" />
            <wire x2="1680" y1="1600" y2="1600" x1="1584" />
        </branch>
    </sheet>
</drawing>