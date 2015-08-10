<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_162(7:0)" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_267" />
        <signal name="XLXN_273" />
        <signal name="zero" />
        <signal name="un" />
        <signal name="un,un,zero,zero,zero,zero,un,un" />
        <signal name="XLXN_308(7:0)" />
        <signal name="XLXN_311" />
        <signal name="XLXN_312(13:0)" />
        <signal name="XLXN_313" />
        <signal name="XLXN_317" />
        <signal name="SWITCH" />
        <signal name="BUTTON" />
        <signal name="XLXN_321" />
        <signal name="XLXN_322" />
        <signal name="XLXN_323" />
        <signal name="XLXN_324" />
        <signal name="XLXN_325" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Input" name="SWITCH" />
        <port polarity="Input" name="BUTTON" />
        <blockdef name="aZRaEL2">
            <timestamp>2010-11-13T16:23:36</timestamp>
            <rect width="336" x="64" y="-768" height="768" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <line x2="464" y1="-672" y2="-672" x1="400" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-11-15T20:55:23</timestamp>
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
        <blockdef name="RAM_A14_D8">
            <timestamp>2010-11-14T11:55:34</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
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
        <blockdef name="ld8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="64" x="0" y="-268" height="24" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_42">
            <blockpin signalname="XLXN_267" name="CLK_25MHz" />
            <blockpin signalname="XLXN_162(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_313" name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="XLXN_312(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="RAM_A14_D8" name="XLXI_127">
            <blockpin signalname="un,un,zero,zero,zero,zero,un,un" name="D(7:0)" />
            <blockpin signalname="XLXN_312(13:0)" name="A(13:0)" />
            <blockpin signalname="XLXN_273" name="CLK" />
            <blockpin signalname="XLXN_324" name="WE" />
            <blockpin signalname="XLXN_308(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="aZRaEL2" name="XLXI_152">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin name="RED" />
            <blockpin name="GREEN" />
            <blockpin name="BLUE" />
            <blockpin name="VSYNC" />
            <blockpin name="HSYNC" />
            <blockpin signalname="XLXN_273" name="CLK100MHz" />
            <blockpin signalname="XLXN_325" name="DO_READ" />
            <blockpin signalname="XLXN_267" name="CLK25MHz" />
            <blockpin name="CLK1MHz" />
            <blockpin name="PREPARE_WRITE" />
            <blockpin signalname="XLXN_317" name="DO_WRITE" />
            <blockpin name="PREPARE_READ" />
        </block>
        <block symbolname="vcc" name="XLXI_165">
            <blockpin signalname="un" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_166">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="ld8ce" name="XLXI_167">
            <blockpin signalname="XLXN_311" name="CLR" />
            <blockpin signalname="XLXN_308(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_313" name="G" />
            <blockpin signalname="XLXN_325" name="GE" />
            <blockpin signalname="XLXN_162(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_168">
            <blockpin signalname="XLXN_311" name="G" />
        </block>
        <block symbolname="and2" name="XLXI_170">
            <blockpin signalname="BUTTON" name="I0" />
            <blockpin signalname="SWITCH" name="I1" />
            <blockpin signalname="XLXN_322" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_171">
            <blockpin signalname="XLXN_321" name="I0" />
            <blockpin signalname="XLXN_317" name="I1" />
            <blockpin signalname="XLXN_323" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_172">
            <blockpin signalname="SWITCH" name="I" />
            <blockpin signalname="XLXN_321" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_173">
            <blockpin signalname="XLXN_323" name="I0" />
            <blockpin signalname="XLXN_322" name="I1" />
            <blockpin signalname="XLXN_324" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_162(7:0)">
            <wire x2="5456" y1="720" y2="720" x1="5200" />
        </branch>
        <instance x="5456" y="752" name="XLXI_42" orien="R0">
        </instance>
        <branch name="RED">
            <wire x2="5968" y1="400" y2="400" x1="5888" />
        </branch>
        <branch name="GREEN">
            <wire x2="5968" y1="464" y2="464" x1="5888" />
        </branch>
        <branch name="BLUE">
            <wire x2="5968" y1="528" y2="528" x1="5888" />
        </branch>
        <branch name="VSYNC">
            <wire x2="5968" y1="592" y2="592" x1="5888" />
        </branch>
        <branch name="HSYNC">
            <wire x2="5968" y1="656" y2="656" x1="5888" />
        </branch>
        <instance x="4048" y="1008" name="XLXI_127" orien="R0">
        </instance>
        <iomarker fontsize="28" x="5968" y="400" name="RED" orien="R0" />
        <iomarker fontsize="28" x="5968" y="464" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="5968" y="528" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="5968" y="592" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="5968" y="656" name="HSYNC" orien="R0" />
        <instance x="960" y="1088" name="XLXI_152" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="880" y1="352" y2="368" x1="880" />
            <wire x2="960" y1="352" y2="352" x1="880" />
        </branch>
        <iomarker fontsize="28" x="880" y="368" name="CLK50MHz" orien="R90" />
        <branch name="XLXN_267">
            <wire x2="1680" y1="800" y2="800" x1="1424" />
            <wire x2="3568" y1="800" y2="800" x1="1680" />
            <wire x2="3568" y1="336" y2="800" x1="3568" />
            <wire x2="5456" y1="336" y2="336" x1="3568" />
        </branch>
        <branch name="XLXN_273">
            <wire x2="1488" y1="672" y2="672" x1="1424" />
            <wire x2="1488" y1="672" y2="912" x1="1488" />
            <wire x2="4048" y1="912" y2="912" x1="1488" />
        </branch>
        <instance x="5056" y="1216" name="XLXI_165" orien="R0" />
        <instance x="4832" y="1536" name="XLXI_166" orien="R0" />
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="4896" y="1344" type="branch" />
            <wire x2="4896" y1="1344" y2="1408" x1="4896" />
        </branch>
        <branch name="un">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="5120" y="1312" type="branch" />
            <wire x2="5120" y1="1216" y2="1312" x1="5120" />
        </branch>
        <branch name="un,un,zero,zero,zero,zero,un,un">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3968" y="848" type="branch" />
            <wire x2="4048" y1="848" y2="848" x1="3968" />
        </branch>
        <branch name="XLXN_308(7:0)">
            <wire x2="4816" y1="720" y2="720" x1="4432" />
        </branch>
        <instance x="4816" y="976" name="XLXI_167" orien="R0" />
        <branch name="XLXN_311">
            <wire x2="4816" y1="944" y2="944" x1="4768" />
        </branch>
        <instance x="4704" y="1072" name="XLXI_168" orien="R0" />
        <branch name="XLXN_312(13:0)">
            <wire x2="4048" y1="720" y2="720" x1="3984" />
            <wire x2="3984" y1="720" y2="1088" x1="3984" />
            <wire x2="5936" y1="1088" y2="1088" x1="3984" />
            <wire x2="5936" y1="720" y2="720" x1="5888" />
            <wire x2="5936" y1="720" y2="1088" x1="5936" />
        </branch>
        <branch name="XLXN_313">
            <wire x2="4816" y1="848" y2="848" x1="4800" />
            <wire x2="4800" y1="848" y2="1024" x1="4800" />
            <wire x2="5952" y1="1024" y2="1024" x1="4800" />
            <wire x2="5952" y1="336" y2="336" x1="5888" />
            <wire x2="5952" y1="336" y2="1024" x1="5952" />
        </branch>
        <branch name="XLXN_317">
            <wire x2="2288" y1="992" y2="992" x1="1424" />
            <wire x2="2288" y1="672" y2="992" x1="2288" />
            <wire x2="3184" y1="672" y2="672" x1="2288" />
        </branch>
        <branch name="SWITCH">
            <wire x2="2912" y1="480" y2="544" x1="2912" />
            <wire x2="2992" y1="544" y2="544" x1="2912" />
            <wire x2="3184" y1="544" y2="544" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="2912" y="480" name="SWITCH" orien="R270" />
        <branch name="BUTTON">
            <wire x2="2816" y1="480" y2="608" x1="2816" />
            <wire x2="3184" y1="608" y2="608" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2816" y="480" name="BUTTON" orien="R270" />
        <instance x="3184" y="672" name="XLXI_170" orien="R0" />
        <instance x="3184" y="800" name="XLXI_171" orien="R0" />
        <instance x="2960" y="544" name="XLXI_172" orien="R90" />
        <branch name="XLXN_321">
            <wire x2="2992" y1="768" y2="832" x1="2992" />
            <wire x2="3088" y1="832" y2="832" x1="2992" />
            <wire x2="3088" y1="736" y2="832" x1="3088" />
            <wire x2="3184" y1="736" y2="736" x1="3088" />
        </branch>
        <instance x="3504" y="704" name="XLXI_173" orien="R0" />
        <branch name="XLXN_322">
            <wire x2="3504" y1="576" y2="576" x1="3440" />
        </branch>
        <branch name="XLXN_323">
            <wire x2="3472" y1="704" y2="704" x1="3440" />
            <wire x2="3472" y1="640" y2="704" x1="3472" />
            <wire x2="3504" y1="640" y2="640" x1="3472" />
        </branch>
        <branch name="XLXN_324">
            <wire x2="3904" y1="608" y2="608" x1="3760" />
            <wire x2="3904" y1="608" y2="784" x1="3904" />
            <wire x2="4048" y1="784" y2="784" x1="3904" />
        </branch>
        <branch name="XLXN_325">
            <wire x2="1472" y1="736" y2="736" x1="1424" />
            <wire x2="1472" y1="736" y2="1072" x1="1472" />
            <wire x2="4496" y1="1072" y2="1072" x1="1472" />
            <wire x2="4496" y1="784" y2="1072" x1="4496" />
            <wire x2="4816" y1="784" y2="784" x1="4496" />
        </branch>
    </sheet>
</drawing>