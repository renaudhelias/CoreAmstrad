<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_13" />
        <signal name="CLK_DIV(15:0)" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_16" />
        <signal name="CLK_DIV(2)" />
        <signal name="OE1_n" />
        <signal name="UB1_n" />
        <signal name="LB1_n" />
        <signal name="ram_W_n" />
        <signal name="CE1_n" />
        <signal name="ADV1_n" />
        <signal name="CLK1" />
        <signal name="CRE1" />
        <signal name="ram_A(22:0)" />
        <signal name="ram_D_U(7:0)" />
        <signal name="ram_D(7:0)" />
        <signal name="MISO" />
        <signal name="CD_n" />
        <signal name="MOSI" />
        <signal name="SS_n" />
        <signal name="SCLK" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62(23:0)" />
        <signal name="XLXN_63(7:0)" />
        <signal name="XLXN_64" />
        <signal name="zero" />
        <signal name="zero,zero,un" />
        <signal name="un" />
        <signal name="zero,zero,zero,zero,zero,zero,zero,zero" />
        <signal name="LEDS(7:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="OE1_n" />
        <port polarity="Output" name="UB1_n" />
        <port polarity="Output" name="LB1_n" />
        <port polarity="Output" name="ram_W_n" />
        <port polarity="Output" name="CE1_n" />
        <port polarity="Output" name="ADV1_n" />
        <port polarity="Output" name="CLK1" />
        <port polarity="Output" name="CRE1" />
        <port polarity="Output" name="ram_A(22:0)" />
        <port polarity="BiDirectional" name="ram_D_U(7:0)" />
        <port polarity="BiDirectional" name="ram_D(7:0)" />
        <port polarity="Input" name="MISO" />
        <port polarity="Input" name="CD_n" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Output" name="SS_n" />
        <port polarity="Output" name="SCLK" />
        <port polarity="Output" name="LEDS(7:0)" />
        <blockdef name="RAM_dumper">
            <timestamp>2011-11-10T20:44:52</timestamp>
            <rect width="256" x="64" y="-1088" height="1088" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-1056" y2="-1056" x1="320" />
            <line x2="384" y1="-992" y2="-992" x1="320" />
            <line x2="384" y1="-928" y2="-928" x1="320" />
            <line x2="384" y1="-864" y2="-864" x1="320" />
            <line x2="384" y1="-800" y2="-800" x1="320" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DraculaSD">
            <timestamp>2011-11-10T20:44:56</timestamp>
            <rect width="320" x="64" y="-704" height="704" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-672" y2="-672" x1="384" />
            <line x2="448" y1="-576" y2="-576" x1="384" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-384" y2="-384" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <rect width="64" x="384" y="-204" height="24" />
            <line x2="448" y1="-192" y2="-192" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
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
        <block symbolname="cb16ce" name="XLXI_3">
            <blockpin signalname="CLK50MHz" name="C" />
            <blockpin signalname="XLXN_16" name="CE" />
            <blockpin signalname="XLXN_13" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="CLK_DIV(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="gnd" name="XLXI_4">
            <blockpin signalname="XLXN_13" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_16" name="P" />
        </block>
        <block symbolname="RAM_dumper" name="XLXI_1">
            <blockpin signalname="CLK_DIV(2)" name="CLK" />
            <blockpin signalname="XLXN_60" name="sd_ready" />
            <blockpin signalname="XLXN_61" name="sd_busy" />
            <blockpin signalname="CE1_n" name="CE1_n" />
            <blockpin signalname="OE1_n" name="OE1_n" />
            <blockpin signalname="UB1_n" name="UB1_n" />
            <blockpin signalname="LB1_n" name="LB1_n" />
            <blockpin signalname="ram_W_n" name="ram_W_n" />
            <blockpin signalname="ADV1_n" name="ADV1_n" />
            <blockpin signalname="CLK1" name="CLK1" />
            <blockpin signalname="CRE1" name="CRE1" />
            <blockpin signalname="XLXN_55" name="sd_CLK" />
            <blockpin signalname="XLXN_56" name="sd_W" />
            <blockpin signalname="XLXN_57" name="sd_special_W" />
            <blockpin signalname="ram_A(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="XLXN_62(23:0)" name="sd_A(23:0)" />
            <blockpin signalname="XLXN_63(7:0)" name="sd_D(7:0)" />
            <blockpin signalname="LEDS(7:0)" name="LEDS(7:0)" />
            <blockpin signalname="ram_D_U(7:0)" name="ram_D_U(7:0)" />
            <blockpin signalname="ram_D(7:0)" name="ram_D_L(7:0)" />
        </block>
        <block symbolname="DraculaSD" name="XLXI_2">
            <blockpin signalname="CLK_DIV(2)" name="CLK" />
            <blockpin signalname="XLXN_55" name="ram_CLK" />
            <blockpin signalname="XLXN_56" name="ram_W" />
            <blockpin signalname="XLXN_64" name="ram_R" />
            <blockpin signalname="XLXN_57" name="special_W" />
            <blockpin signalname="MISO" name="MISO" />
            <blockpin signalname="CD_n" name="CD_n" />
            <blockpin signalname="zero,zero,un" name="ram_S(2:0)" />
            <blockpin signalname="XLXN_62(23:0)" name="ram_A(23:0)" />
            <blockpin signalname="XLXN_63(7:0)" name="ram_Din(7:0)" />
            <blockpin signalname="zero,zero,zero,zero,zero,zero,zero,zero" name="file_select(7:0)" />
            <blockpin signalname="XLXN_60" name="ready" />
            <blockpin signalname="XLXN_61" name="busy" />
            <blockpin signalname="SS_n" name="SS_n" />
            <blockpin signalname="MOSI" name="MOSI" />
            <blockpin signalname="SCLK" name="SCLK" />
            <blockpin name="ram_Dout(7:0)" />
            <blockpin name="leds(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="XLXN_64" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_8">
            <blockpin signalname="un" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="432" y="592" name="XLXI_3" orien="R0" />
        <branch name="XLXN_13">
            <wire x2="432" y1="560" y2="560" x1="400" />
        </branch>
        <instance x="336" y="688" name="XLXI_4" orien="R0" />
        <branch name="CLK_DIV(15:0)">
            <wire x2="992" y1="336" y2="336" x1="816" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="432" y1="464" y2="464" x1="400" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="432" y1="400" y2="400" x1="240" />
        </branch>
        <instance x="176" y="400" name="XLXI_5" orien="R0" />
        <iomarker fontsize="28" x="400" y="464" name="CLK50MHz" orien="R180" />
        <bustap x2="992" y1="336" y2="432" x1="992" />
        <branch name="CLK_DIV(2)">
            <wire x2="464" y1="1040" y2="1040" x1="384" />
            <wire x2="384" y1="1040" y2="2160" x1="384" />
            <wire x2="1200" y1="2160" y2="2160" x1="384" />
            <wire x2="992" y1="432" y2="704" x1="992" />
            <wire x2="992" y1="704" y2="944" x1="992" />
            <wire x2="1200" y1="944" y2="944" x1="992" />
            <wire x2="1200" y1="944" y2="2160" x1="1200" />
            <wire x2="1760" y1="704" y2="704" x1="992" />
            <wire x2="1760" y1="704" y2="896" x1="1760" />
            <wire x2="2528" y1="896" y2="896" x1="1760" />
            <wire x2="2528" y1="896" y2="1088" x1="2528" />
            <wire x2="1648" y1="1088" y2="1168" x1="1648" />
            <wire x2="1728" y1="1168" y2="1168" x1="1648" />
            <wire x2="2528" y1="1088" y2="1088" x1="1648" />
        </branch>
        <instance x="464" y="2096" name="XLXI_1" orien="R0">
        </instance>
        <branch name="OE1_n">
            <wire x2="880" y1="1104" y2="1104" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1104" name="OE1_n" orien="R0" />
        <branch name="UB1_n">
            <wire x2="880" y1="1168" y2="1168" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1168" name="UB1_n" orien="R0" />
        <branch name="LB1_n">
            <wire x2="880" y1="1232" y2="1232" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1232" name="LB1_n" orien="R0" />
        <branch name="ram_W_n">
            <wire x2="880" y1="1296" y2="1296" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1296" name="ram_W_n" orien="R0" />
        <branch name="CE1_n">
            <wire x2="880" y1="1040" y2="1040" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1040" name="CE1_n" orien="R0" />
        <branch name="ADV1_n">
            <wire x2="880" y1="1360" y2="1360" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1360" name="ADV1_n" orien="R0" />
        <branch name="CLK1">
            <wire x2="880" y1="1424" y2="1424" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1424" name="CLK1" orien="R0" />
        <branch name="CRE1">
            <wire x2="880" y1="1488" y2="1488" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1488" name="CRE1" orien="R0" />
        <branch name="ram_A(22:0)">
            <wire x2="880" y1="1744" y2="1744" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1744" name="ram_A(22:0)" orien="R0" />
        <branch name="ram_D_U(7:0)">
            <wire x2="880" y1="2000" y2="2000" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="2000" name="ram_D_U(7:0)" orien="R0" />
        <branch name="ram_D(7:0)">
            <wire x2="880" y1="2064" y2="2064" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="2064" name="ram_D(7:0)" orien="R0" />
        <instance x="1728" y="1840" name="XLXI_2" orien="R0">
        </instance>
        <branch name="MISO">
            <wire x2="1728" y1="1488" y2="1488" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1488" name="MISO" orien="R180" />
        <branch name="CD_n">
            <wire x2="1728" y1="1552" y2="1552" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1552" name="CD_n" orien="R180" />
        <branch name="MOSI">
            <wire x2="2208" y1="1456" y2="1456" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1456" name="MOSI" orien="R0" />
        <branch name="SS_n">
            <wire x2="2208" y1="1360" y2="1360" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1360" name="SS_n" orien="R0" />
        <branch name="SCLK">
            <wire x2="2240" y1="1552" y2="1552" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2240" y="1552" name="SCLK" orien="R0" />
        <branch name="XLXN_55">
            <wire x2="1280" y1="1552" y2="1552" x1="848" />
            <wire x2="1280" y1="1232" y2="1552" x1="1280" />
            <wire x2="1728" y1="1232" y2="1232" x1="1280" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="1296" y1="1616" y2="1616" x1="848" />
            <wire x2="1296" y1="1296" y2="1616" x1="1296" />
            <wire x2="1728" y1="1296" y2="1296" x1="1296" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1312" y1="1680" y2="1680" x1="848" />
            <wire x2="1312" y1="1424" y2="1680" x1="1312" />
            <wire x2="1728" y1="1424" y2="1424" x1="1312" />
        </branch>
        <branch name="XLXN_60">
            <wire x2="464" y1="1552" y2="1552" x1="400" />
            <wire x2="400" y1="1552" y2="2144" x1="400" />
            <wire x2="2480" y1="2144" y2="2144" x1="400" />
            <wire x2="2480" y1="1168" y2="1168" x1="2176" />
            <wire x2="2480" y1="1168" y2="2144" x1="2480" />
        </branch>
        <branch name="XLXN_61">
            <wire x2="464" y1="2064" y2="2064" x1="416" />
            <wire x2="416" y1="2064" y2="2128" x1="416" />
            <wire x2="2464" y1="2128" y2="2128" x1="416" />
            <wire x2="2464" y1="1264" y2="1264" x1="2176" />
            <wire x2="2464" y1="1264" y2="2128" x1="2464" />
        </branch>
        <branch name="XLXN_62(23:0)">
            <wire x2="1328" y1="1808" y2="1808" x1="848" />
            <wire x2="1328" y1="1680" y2="1808" x1="1328" />
            <wire x2="1728" y1="1680" y2="1680" x1="1328" />
        </branch>
        <branch name="XLXN_63(7:0)">
            <wire x2="1344" y1="1872" y2="1872" x1="848" />
            <wire x2="1344" y1="1744" y2="1872" x1="1344" />
            <wire x2="1728" y1="1744" y2="1744" x1="1344" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="1728" y1="1360" y2="1360" x1="1696" />
        </branch>
        <instance x="1568" y="1296" name="XLXI_6" orien="R90" />
        <instance x="1376" y="1920" name="XLXI_7" orien="R90" />
        <branch name="zero">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="1984" type="branch" />
            <wire x2="1584" y1="1984" y2="1984" x1="1504" />
        </branch>
        <branch name="zero,zero,un">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1616" y="1616" type="branch" />
            <wire x2="1728" y1="1616" y2="1616" x1="1616" />
        </branch>
        <instance x="1856" y="2016" name="XLXI_8" orien="R270" />
        <branch name="un">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1936" y="1952" type="branch" />
            <wire x2="1936" y1="1952" y2="1952" x1="1856" />
        </branch>
        <branch name="zero,zero,zero,zero,zero,zero,zero,zero">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1808" type="branch" />
            <wire x2="1728" y1="1808" y2="1808" x1="1600" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="880" y1="1936" y2="1936" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1936" name="LEDS(7:0)" orien="R0" />
    </sheet>
</drawing>