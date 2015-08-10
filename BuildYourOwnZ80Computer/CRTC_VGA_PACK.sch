<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="MA(9:5),RA(2:0),MA(4:0),zero" />
        <signal name="XLXN_241" />
        <signal name="CLK50MHz" />
        <signal name="VRAM_COLOR(7:0)" />
        <signal name="MA(13:0)" />
        <signal name="RA(4:0)" />
        <signal name="XLXN_486" />
        <signal name="XLXN_487" />
        <signal name="XLXN_533" />
        <signal name="XLXN_534" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="VRAM_COLOR(7)" />
        <signal name="VRAM_COLOR(6)" />
        <signal name="VRAM_COLOR(5)" />
        <signal name="XLXN_543" />
        <signal name="zero" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
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
        <blockdef name="AZRAEL_128x128_ROM">
            <timestamp>2010-12-14T14:45:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
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
            <timestamp>2010-12-17T10:43:11</timestamp>
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
        <block symbolname="AZRAEL_128x128_ROM" name="XLXI_15">
            <blockpin signalname="XLXN_543" name="CLK" />
            <blockpin signalname="MA(9:5),RA(2:0),MA(4:0),zero" name="ADDR(13:0)" />
            <blockpin signalname="VRAM_COLOR(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_135">
            <blockpin signalname="XLXN_487" name="P" />
        </block>
        <block symbolname="CLK_commander" name="XLXI_1">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="CLK100MHz" />
            <blockpin signalname="XLXN_241" name="CLK25MHz" />
            <blockpin signalname="XLXN_543" name="CLK1MHz" />
            <blockpin name="PREPARE_WRITE" />
            <blockpin name="DO_WRITE" />
            <blockpin name="PREPARE_READ" />
            <blockpin name="DO_READ" />
            <blockpin name="CLK4MHz" />
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
            <blockpin signalname="VRAM_COLOR(7)" name="CRTC_RED" />
            <blockpin signalname="VRAM_COLOR(6)" name="CRTC_GREEN" />
            <blockpin signalname="VRAM_COLOR(5)" name="CRTC_BLUE" />
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
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="1088" y="576" name="XLXI_15" orien="R0">
        </instance>
        <branch name="MA(9:5),RA(2:0),MA(4:0),zero">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="544" type="branch" />
            <wire x2="1088" y1="544" y2="544" x1="1008" />
        </branch>
        <instance x="960" y="720" name="XLXI_135" orien="R0" />
        <instance x="176" y="592" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="144" y1="176" y2="240" x1="144" />
            <wire x2="176" y1="176" y2="176" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="240" name="CLK50MHz" orien="R90" />
        <branch name="VRAM_COLOR(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="480" type="branch" />
            <wire x2="1568" y1="480" y2="480" x1="1472" />
        </branch>
        <instance x="1152" y="1296" name="XLXI_142" orien="R0">
        </instance>
        <branch name="MA(13:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1600" y="1200" type="branch" />
            <wire x2="1600" y1="1200" y2="1200" x1="1536" />
        </branch>
        <branch name="RA(4:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1600" y="1264" type="branch" />
            <wire x2="1600" y1="1264" y2="1264" x1="1536" />
        </branch>
        <branch name="XLXN_487">
            <wire x2="1024" y1="720" y2="752" x1="1024" />
            <wire x2="1152" y1="752" y2="752" x1="1024" />
            <wire x2="1024" y1="752" y2="832" x1="1024" />
            <wire x2="1152" y1="832" y2="832" x1="1024" />
            <wire x2="1024" y1="832" y2="912" x1="1024" />
            <wire x2="1152" y1="912" y2="912" x1="1024" />
            <wire x2="1024" y1="912" y2="992" x1="1024" />
            <wire x2="1152" y1="992" y2="992" x1="1024" />
            <wire x2="1024" y1="992" y2="1072" x1="1024" />
            <wire x2="1152" y1="1072" y2="1072" x1="1024" />
        </branch>
        <branch name="XLXN_533">
            <wire x2="1744" y1="752" y2="752" x1="1536" />
            <wire x2="1744" y1="752" y2="880" x1="1744" />
            <wire x2="1952" y1="880" y2="880" x1="1744" />
        </branch>
        <branch name="XLXN_534">
            <wire x2="1952" y1="816" y2="816" x1="1536" />
        </branch>
        <branch name="RED">
            <wire x2="2400" y1="944" y2="944" x1="2336" />
        </branch>
        <branch name="GREEN">
            <wire x2="2400" y1="848" y2="848" x1="2336" />
        </branch>
        <branch name="BLUE">
            <wire x2="2400" y1="752" y2="752" x1="2336" />
        </branch>
        <branch name="VSYNC">
            <wire x2="2400" y1="656" y2="656" x1="2336" />
        </branch>
        <branch name="HSYNC">
            <wire x2="2400" y1="560" y2="560" x1="2336" />
        </branch>
        <branch name="VRAM_COLOR(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1872" y="560" type="branch" />
            <wire x2="1952" y1="560" y2="560" x1="1872" />
        </branch>
        <branch name="VRAM_COLOR(6)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1872" y="624" type="branch" />
            <wire x2="1952" y1="624" y2="624" x1="1872" />
        </branch>
        <branch name="VRAM_COLOR(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1872" y="688" type="branch" />
            <wire x2="1952" y1="688" y2="688" x1="1872" />
        </branch>
        <instance x="1952" y="976" name="XLXI_143" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2400" y="944" name="RED" orien="R0" />
        <iomarker fontsize="28" x="2400" y="848" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="2400" y="752" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="2400" y="656" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="2400" y="560" name="HSYNC" orien="R0" />
        <branch name="XLXN_241">
            <wire x2="1904" y1="240" y2="240" x1="640" />
            <wire x2="1904" y1="240" y2="752" x1="1904" />
            <wire x2="1952" y1="752" y2="752" x1="1904" />
        </branch>
        <branch name="XLXN_543">
            <wire x2="928" y1="304" y2="304" x1="640" />
            <wire x2="1088" y1="304" y2="304" x1="928" />
            <wire x2="1088" y1="304" y2="480" x1="1088" />
            <wire x2="928" y1="304" y2="1152" x1="928" />
            <wire x2="1152" y1="1152" y2="1152" x1="928" />
            <wire x2="928" y1="1152" y2="1344" x1="928" />
            <wire x2="1872" y1="1344" y2="1344" x1="928" />
            <wire x2="1952" y1="944" y2="944" x1="1872" />
            <wire x2="1872" y1="944" y2="1344" x1="1872" />
        </branch>
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="544" y="848" type="branch" />
            <wire x2="544" y1="848" y2="976" x1="544" />
        </branch>
        <instance x="480" y="1104" name="XLXI_141" orien="R0" />
    </sheet>
</drawing>