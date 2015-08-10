<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK_RD" />
        <signal name="CLK_WE" />
        <signal name="XLXN_118" />
        <signal name="XLXN_119" />
        <signal name="XLXN_121" />
        <signal name="XLXN_122" />
        <signal name="XLXN_123" />
        <signal name="XLXN_124(0:0)" />
        <signal name="ADDR_WE(13:0)" />
        <signal name="ADDR_RD(13:0)" />
        <signal name="WE_RED" />
        <signal name="DO_WE" />
        <signal name="RD_RED" />
        <signal name="XLXN_131" />
        <signal name="XLXN_132" />
        <signal name="XLXN_133" />
        <signal name="XLXN_134(0:0)" />
        <signal name="RD_GREEN" />
        <signal name="XLXN_137" />
        <signal name="XLXN_138" />
        <signal name="WE_GREEN" />
        <signal name="XLXN_135(0:0)" />
        <signal name="XLXN_140" />
        <signal name="XLXN_141" />
        <signal name="XLXN_142" />
        <signal name="XLXN_143" />
        <signal name="XLXN_144" />
        <signal name="WE_BLUE" />
        <signal name="RD_BLUE" />
        <signal name="XLXN_120" />
        <port polarity="Input" name="CLK_RD" />
        <port polarity="Input" name="CLK_WE" />
        <port polarity="Input" name="ADDR_WE(13:0)" />
        <port polarity="Input" name="ADDR_RD(13:0)" />
        <port polarity="Input" name="WE_RED" />
        <port polarity="Input" name="DO_WE" />
        <port polarity="Output" name="RD_RED" />
        <port polarity="Output" name="RD_GREEN" />
        <port polarity="Input" name="WE_GREEN" />
        <port polarity="Input" name="WE_BLUE" />
        <port polarity="Output" name="RD_BLUE" />
        <blockdef name="ramb16_s1_s1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-1088" y2="-1088" x1="544" />
            <line x2="544" y1="-640" y2="-1088" x1="544" />
            <rect width="64" x="544" y="-368" height="32" />
            <rect width="64" x="544" y="-880" height="32" />
            <line x2="64" y1="-1088" y2="-640" x1="64" />
            <line x2="64" y1="-832" y2="-848" x1="80" />
            <line x2="80" y1="-816" y2="-832" x1="64" />
            <rect width="64" x="0" y="-720" height="32" />
            <rect width="64" x="0" y="-784" height="32" />
            <rect width="64" x="0" y="-208" height="32" />
            <rect width="64" x="0" y="-272" height="32" />
            <line x2="64" y1="-320" y2="-336" x1="80" />
            <line x2="80" y1="-304" y2="-320" x1="64" />
            <line x2="64" y1="-640" y2="-640" x1="128" />
            <line x2="128" y1="-576" y2="-640" x1="128" />
            <line x2="128" y1="-576" y2="-576" x1="64" />
            <line x2="64" y1="-128" y2="-576" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="544" />
            <line x2="544" y1="-576" y2="-128" x1="544" />
            <line x2="544" y1="-576" y2="-576" x1="480" />
            <line x2="480" y1="-640" y2="-576" x1="480" />
            <line x2="480" y1="-640" y2="-640" x1="544" />
            <line x2="544" y1="-352" y2="-352" x1="608" />
            <line x2="544" y1="-864" y2="-864" x1="608" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-768" y2="-768" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-832" y2="-832" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
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
        <block symbolname="ramb16_s1_s1" name="XLXI_198">
            <blockpin signalname="ADDR_WE(13:0)" name="ADDRA(13:0)" />
            <blockpin signalname="ADDR_RD(13:0)" name="ADDRB(13:0)" />
            <blockpin signalname="CLK_WE" name="CLKA" />
            <blockpin signalname="XLXN_120" name="CLKB" />
            <blockpin signalname="WE_RED" name="DIA(0:0)" />
            <blockpin signalname="XLXN_124(0:0)" name="DIB(0:0)" />
            <blockpin signalname="XLXN_118" name="ENA" />
            <blockpin signalname="XLXN_119" name="ENB" />
            <blockpin signalname="XLXN_122" name="SSRA" />
            <blockpin signalname="XLXN_121" name="SSRB" />
            <blockpin signalname="DO_WE" name="WEA" />
            <blockpin signalname="XLXN_123" name="WEB" />
            <blockpin name="DOA(0:0)" />
            <blockpin signalname="RD_RED" name="DOB(0:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_246">
            <blockpin signalname="XLXN_118" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_247">
            <blockpin signalname="XLXN_119" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_248">
            <blockpin signalname="XLXN_121" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_249">
            <blockpin signalname="XLXN_122" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_250">
            <blockpin signalname="XLXN_123" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_251">
            <blockpin signalname="XLXN_124(0:0)" name="G" />
        </block>
        <block symbolname="ramb16_s1_s1" name="XLXI_243">
            <blockpin signalname="ADDR_WE(13:0)" name="ADDRA(13:0)" />
            <blockpin signalname="ADDR_RD(13:0)" name="ADDRB(13:0)" />
            <blockpin signalname="CLK_WE" name="CLKA" />
            <blockpin signalname="XLXN_120" name="CLKB" />
            <blockpin signalname="WE_GREEN" name="DIA(0:0)" />
            <blockpin signalname="XLXN_134(0:0)" name="DIB(0:0)" />
            <blockpin signalname="XLXN_137" name="ENA" />
            <blockpin signalname="XLXN_131" name="ENB" />
            <blockpin signalname="XLXN_138" name="SSRA" />
            <blockpin signalname="XLXN_132" name="SSRB" />
            <blockpin signalname="DO_WE" name="WEA" />
            <blockpin signalname="XLXN_133" name="WEB" />
            <blockpin name="DOA(0:0)" />
            <blockpin signalname="RD_GREEN" name="DOB(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_252">
            <blockpin signalname="XLXN_132" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_253">
            <blockpin signalname="XLXN_131" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_254">
            <blockpin signalname="XLXN_133" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_256">
            <blockpin signalname="XLXN_134(0:0)" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_257">
            <blockpin signalname="XLXN_137" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_258">
            <blockpin signalname="XLXN_138" name="G" />
        </block>
        <block symbolname="ramb16_s1_s1" name="XLXI_244">
            <blockpin signalname="ADDR_WE(13:0)" name="ADDRA(13:0)" />
            <blockpin signalname="ADDR_RD(13:0)" name="ADDRB(13:0)" />
            <blockpin signalname="CLK_WE" name="CLKA" />
            <blockpin signalname="XLXN_120" name="CLKB" />
            <blockpin signalname="WE_BLUE" name="DIA(0:0)" />
            <blockpin signalname="XLXN_135(0:0)" name="DIB(0:0)" />
            <blockpin signalname="XLXN_143" name="ENA" />
            <blockpin signalname="XLXN_141" name="ENB" />
            <blockpin signalname="XLXN_144" name="SSRA" />
            <blockpin signalname="XLXN_140" name="SSRB" />
            <blockpin signalname="DO_WE" name="WEA" />
            <blockpin signalname="XLXN_142" name="WEB" />
            <blockpin name="DOA(0:0)" />
            <blockpin signalname="RD_BLUE" name="DOB(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_255">
            <blockpin signalname="XLXN_135(0:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_259">
            <blockpin signalname="XLXN_140" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_260">
            <blockpin signalname="XLXN_141" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_261">
            <blockpin signalname="XLXN_142" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_262">
            <blockpin signalname="XLXN_143" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_263">
            <blockpin signalname="XLXN_144" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_245">
            <blockpin signalname="CLK_RD" name="I" />
            <blockpin signalname="XLXN_120" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="448" y="1568" name="XLXI_198" orien="R0" />
        <branch name="CLK_RD">
            <wire x2="80" y1="304" y2="352" x1="80" />
            <wire x2="80" y1="352" y2="368" x1="80" />
        </branch>
        <branch name="CLK_WE">
            <wire x2="288" y1="288" y2="400" x1="288" />
            <wire x2="288" y1="400" y2="736" x1="288" />
            <wire x2="448" y1="736" y2="736" x1="288" />
            <wire x2="1376" y1="400" y2="400" x1="288" />
            <wire x2="1376" y1="400" y2="736" x1="1376" />
            <wire x2="1552" y1="736" y2="736" x1="1376" />
            <wire x2="2640" y1="400" y2="400" x1="1376" />
            <wire x2="2640" y1="400" y2="752" x1="2640" />
            <wire x2="2752" y1="752" y2="752" x1="2640" />
        </branch>
        <branch name="XLXN_118">
            <wire x2="448" y1="608" y2="608" x1="160" />
        </branch>
        <instance x="96" y="608" name="XLXI_246" orien="R0" />
        <instance x="96" y="1120" name="XLXI_247" orien="R0" />
        <branch name="XLXN_119">
            <wire x2="448" y1="1120" y2="1120" x1="160" />
        </branch>
        <branch name="XLXN_121">
            <wire x2="448" y1="1184" y2="1184" x1="160" />
        </branch>
        <instance x="96" y="1312" name="XLXI_248" orien="R0" />
        <instance x="96" y="800" name="XLXI_249" orien="R0" />
        <branch name="XLXN_122">
            <wire x2="448" y1="672" y2="672" x1="160" />
        </branch>
        <branch name="XLXN_123">
            <wire x2="448" y1="1056" y2="1056" x1="288" />
        </branch>
        <instance x="224" y="1184" name="XLXI_250" orien="R0" />
        <instance x="336" y="1504" name="XLXI_251" orien="R0" />
        <branch name="XLXN_124(0:0)">
            <wire x2="448" y1="1376" y2="1376" x1="400" />
        </branch>
        <branch name="ADDR_WE(13:0)">
            <wire x2="368" y1="288" y2="320" x1="368" />
            <wire x2="368" y1="320" y2="800" x1="368" />
            <wire x2="448" y1="800" y2="800" x1="368" />
            <wire x2="1472" y1="320" y2="320" x1="368" />
            <wire x2="1472" y1="320" y2="800" x1="1472" />
            <wire x2="1552" y1="800" y2="800" x1="1472" />
            <wire x2="2384" y1="320" y2="320" x1="1472" />
            <wire x2="2384" y1="320" y2="816" x1="2384" />
            <wire x2="2752" y1="816" y2="816" x1="2384" />
        </branch>
        <branch name="ADDR_RD(13:0)">
            <wire x2="336" y1="1312" y2="1600" x1="336" />
            <wire x2="336" y1="1600" y2="1760" x1="336" />
            <wire x2="1520" y1="1600" y2="1600" x1="336" />
            <wire x2="2176" y1="1600" y2="1600" x1="1520" />
            <wire x2="448" y1="1312" y2="1312" x1="336" />
            <wire x2="1552" y1="1312" y2="1312" x1="1520" />
            <wire x2="1520" y1="1312" y2="1600" x1="1520" />
            <wire x2="2176" y1="1328" y2="1600" x1="2176" />
            <wire x2="2752" y1="1328" y2="1328" x1="2176" />
        </branch>
        <branch name="WE_RED">
            <wire x2="448" y1="864" y2="864" x1="352" />
        </branch>
        <branch name="DO_WE">
            <wire x2="432" y1="288" y2="352" x1="432" />
            <wire x2="432" y1="352" y2="544" x1="432" />
            <wire x2="448" y1="544" y2="544" x1="432" />
            <wire x2="1424" y1="352" y2="352" x1="432" />
            <wire x2="1424" y1="352" y2="544" x1="1424" />
            <wire x2="1552" y1="544" y2="544" x1="1424" />
            <wire x2="2624" y1="352" y2="352" x1="1424" />
            <wire x2="2624" y1="352" y2="560" x1="2624" />
            <wire x2="2752" y1="560" y2="560" x1="2624" />
        </branch>
        <branch name="RD_RED">
            <wire x2="1072" y1="1216" y2="1216" x1="1056" />
            <wire x2="1120" y1="1216" y2="1216" x1="1072" />
        </branch>
        <instance x="1552" y="1568" name="XLXI_243" orien="R0" />
        <branch name="XLXN_131">
            <wire x2="1552" y1="1120" y2="1120" x1="1376" />
        </branch>
        <branch name="XLXN_132">
            <wire x2="1552" y1="1184" y2="1184" x1="1376" />
        </branch>
        <instance x="1312" y="1312" name="XLXI_252" orien="R0" />
        <instance x="1312" y="1120" name="XLXI_253" orien="R0" />
        <branch name="XLXN_133">
            <wire x2="1552" y1="1056" y2="1056" x1="1472" />
        </branch>
        <instance x="1408" y="1184" name="XLXI_254" orien="R0" />
        <branch name="XLXN_134(0:0)">
            <wire x2="1552" y1="1376" y2="1376" x1="1472" />
        </branch>
        <instance x="1408" y="1504" name="XLXI_256" orien="R0" />
        <branch name="RD_GREEN">
            <wire x2="2240" y1="1216" y2="1216" x1="2160" />
        </branch>
        <branch name="XLXN_137">
            <wire x2="1552" y1="608" y2="608" x1="1328" />
        </branch>
        <instance x="1264" y="608" name="XLXI_257" orien="R0" />
        <branch name="XLXN_138">
            <wire x2="1552" y1="672" y2="672" x1="1328" />
        </branch>
        <instance x="1264" y="800" name="XLXI_258" orien="R0" />
        <branch name="WE_GREEN">
            <wire x2="1552" y1="864" y2="864" x1="1264" />
        </branch>
        <instance x="2752" y="1584" name="XLXI_244" orien="R0" />
        <branch name="XLXN_135(0:0)">
            <wire x2="2752" y1="1392" y2="1392" x1="2672" />
        </branch>
        <instance x="2608" y="1520" name="XLXI_255" orien="R0" />
        <branch name="XLXN_140">
            <wire x2="2752" y1="1200" y2="1200" x1="2560" />
        </branch>
        <instance x="2496" y="1328" name="XLXI_259" orien="R0" />
        <branch name="XLXN_141">
            <wire x2="2752" y1="1136" y2="1136" x1="2560" />
        </branch>
        <instance x="2496" y="1136" name="XLXI_260" orien="R0" />
        <branch name="XLXN_142">
            <wire x2="2752" y1="1072" y2="1072" x1="2624" />
        </branch>
        <instance x="2560" y="1200" name="XLXI_261" orien="R0" />
        <branch name="XLXN_143">
            <wire x2="2752" y1="624" y2="624" x1="2544" />
        </branch>
        <instance x="2480" y="624" name="XLXI_262" orien="R0" />
        <branch name="XLXN_144">
            <wire x2="2752" y1="688" y2="688" x1="2544" />
        </branch>
        <instance x="2480" y="816" name="XLXI_263" orien="R0" />
        <branch name="WE_BLUE">
            <wire x2="2752" y1="880" y2="880" x1="2480" />
        </branch>
        <branch name="RD_BLUE">
            <wire x2="3424" y1="1232" y2="1232" x1="3360" />
        </branch>
        <instance x="48" y="368" name="XLXI_245" orien="R90" />
        <branch name="XLXN_120">
            <wire x2="80" y1="592" y2="912" x1="80" />
            <wire x2="240" y1="912" y2="912" x1="80" />
            <wire x2="240" y1="912" y2="1248" x1="240" />
            <wire x2="448" y1="1248" y2="1248" x1="240" />
            <wire x2="240" y1="1248" y2="1696" x1="240" />
            <wire x2="1424" y1="1696" y2="1696" x1="240" />
            <wire x2="2624" y1="1696" y2="1696" x1="1424" />
            <wire x2="1552" y1="1248" y2="1248" x1="1424" />
            <wire x2="1424" y1="1248" y2="1696" x1="1424" />
            <wire x2="2624" y1="1264" y2="1696" x1="2624" />
            <wire x2="2752" y1="1264" y2="1264" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="288" y="288" name="CLK_WE" orien="R270" />
        <iomarker fontsize="28" x="368" y="288" name="ADDR_WE(13:0)" orien="R270" />
        <iomarker fontsize="28" x="352" y="864" name="WE_RED" orien="R180" />
        <iomarker fontsize="28" x="432" y="288" name="DO_WE" orien="R270" />
        <iomarker fontsize="28" x="336" y="1760" name="ADDR_RD(13:0)" orien="R0" />
        <iomarker fontsize="28" x="1120" y="1216" name="RD_RED" orien="R0" />
        <iomarker fontsize="28" x="2240" y="1216" name="RD_GREEN" orien="R0" />
        <iomarker fontsize="28" x="1264" y="864" name="WE_GREEN" orien="R180" />
        <iomarker fontsize="28" x="2480" y="880" name="WE_BLUE" orien="R180" />
        <iomarker fontsize="28" x="3424" y="1232" name="RD_BLUE" orien="R270" />
        <iomarker fontsize="28" x="80" y="304" name="CLK_RD" orien="R270" />
    </sheet>
</drawing>