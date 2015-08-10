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
        <signal name="XLXN_120" />
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
        <signal name="XLXN_135(0:0)" />
        <signal name="RD_GREEN" />
        <signal name="XLXN_137" />
        <signal name="XLXN_138" />
        <signal name="WE_GREEN" />
        <signal name="XLXN_140" />
        <signal name="XLXN_141" />
        <signal name="XLXN_142" />
        <signal name="XLXN_143" />
        <signal name="XLXN_144" />
        <signal name="WE_BLUE" />
        <signal name="RD_BLUE" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
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
        <block symbolname="inv" name="XLXI_245">
            <blockpin signalname="CLK_RD" name="I" />
            <blockpin signalname="XLXN_120" name="O" />
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
        <block symbolname="gnd" name="XLXI_252">
            <blockpin signalname="XLXN_132" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_253">
            <blockpin signalname="XLXN_131" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_254">
            <blockpin signalname="XLXN_133" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_255">
            <blockpin signalname="XLXN_135(0:0)" name="G" />
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
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="592" y="1472" name="XLXI_198" orien="R0" />
        <instance x="1904" y="1472" name="XLXI_243" orien="R0" />
        <instance x="3312" y="1472" name="XLXI_244" orien="R0" />
        <instance x="96" y="320" name="XLXI_245" orien="R0" />
        <branch name="CLK_RD">
            <wire x2="80" y1="192" y2="288" x1="80" />
            <wire x2="96" y1="288" y2="288" x1="80" />
        </branch>
        <iomarker fontsize="28" x="80" y="192" name="CLK_RD" orien="R270" />
        <branch name="CLK_WE">
            <wire x2="432" y1="192" y2="304" x1="432" />
            <wire x2="432" y1="304" y2="640" x1="432" />
            <wire x2="592" y1="640" y2="640" x1="432" />
            <wire x2="1520" y1="304" y2="304" x1="432" />
            <wire x2="1520" y1="304" y2="640" x1="1520" />
            <wire x2="1904" y1="640" y2="640" x1="1520" />
            <wire x2="2944" y1="304" y2="304" x1="1520" />
            <wire x2="2944" y1="304" y2="640" x1="2944" />
            <wire x2="3312" y1="640" y2="640" x1="2944" />
        </branch>
        <iomarker fontsize="28" x="432" y="192" name="CLK_WE" orien="R270" />
        <branch name="XLXN_118">
            <wire x2="592" y1="512" y2="512" x1="304" />
        </branch>
        <instance x="240" y="512" name="XLXI_246" orien="R0" />
        <instance x="240" y="1024" name="XLXI_247" orien="R0" />
        <branch name="XLXN_119">
            <wire x2="592" y1="1024" y2="1024" x1="304" />
        </branch>
        <branch name="XLXN_120">
            <wire x2="384" y1="288" y2="288" x1="320" />
            <wire x2="384" y1="288" y2="1152" x1="384" />
            <wire x2="592" y1="1152" y2="1152" x1="384" />
            <wire x2="384" y1="1152" y2="1600" x1="384" />
            <wire x2="1616" y1="1600" y2="1600" x1="384" />
            <wire x2="3056" y1="1600" y2="1600" x1="1616" />
            <wire x2="1616" y1="1152" y2="1600" x1="1616" />
            <wire x2="1904" y1="1152" y2="1152" x1="1616" />
            <wire x2="3312" y1="1152" y2="1152" x1="3056" />
            <wire x2="3056" y1="1152" y2="1600" x1="3056" />
        </branch>
        <branch name="XLXN_121">
            <wire x2="592" y1="1088" y2="1088" x1="304" />
        </branch>
        <instance x="240" y="1216" name="XLXI_248" orien="R0" />
        <instance x="240" y="704" name="XLXI_249" orien="R0" />
        <branch name="XLXN_122">
            <wire x2="592" y1="576" y2="576" x1="304" />
        </branch>
        <branch name="XLXN_123">
            <wire x2="592" y1="960" y2="960" x1="432" />
        </branch>
        <instance x="368" y="1088" name="XLXI_250" orien="R0" />
        <instance x="480" y="1408" name="XLXI_251" orien="R0" />
        <branch name="XLXN_124(0:0)">
            <wire x2="592" y1="1280" y2="1280" x1="544" />
        </branch>
        <branch name="ADDR_WE(13:0)">
            <wire x2="512" y1="192" y2="224" x1="512" />
            <wire x2="512" y1="224" y2="704" x1="512" />
            <wire x2="592" y1="704" y2="704" x1="512" />
            <wire x2="1616" y1="224" y2="224" x1="512" />
            <wire x2="1616" y1="224" y2="704" x1="1616" />
            <wire x2="1904" y1="704" y2="704" x1="1616" />
            <wire x2="3040" y1="224" y2="224" x1="1616" />
            <wire x2="3040" y1="224" y2="704" x1="3040" />
            <wire x2="3312" y1="704" y2="704" x1="3040" />
        </branch>
        <branch name="ADDR_RD(13:0)">
            <wire x2="480" y1="1216" y2="1504" x1="480" />
            <wire x2="480" y1="1504" y2="1664" x1="480" />
            <wire x2="1728" y1="1504" y2="1504" x1="480" />
            <wire x2="3120" y1="1504" y2="1504" x1="1728" />
            <wire x2="592" y1="1216" y2="1216" x1="480" />
            <wire x2="1904" y1="1216" y2="1216" x1="1728" />
            <wire x2="1728" y1="1216" y2="1504" x1="1728" />
            <wire x2="3312" y1="1216" y2="1216" x1="3120" />
            <wire x2="3120" y1="1216" y2="1504" x1="3120" />
        </branch>
        <iomarker fontsize="28" x="512" y="192" name="ADDR_WE(13:0)" orien="R270" />
        <branch name="WE_RED">
            <wire x2="592" y1="768" y2="768" x1="496" />
        </branch>
        <iomarker fontsize="28" x="496" y="768" name="WE_RED" orien="R180" />
        <branch name="DO_WE">
            <wire x2="576" y1="192" y2="256" x1="576" />
            <wire x2="576" y1="256" y2="448" x1="576" />
            <wire x2="592" y1="448" y2="448" x1="576" />
            <wire x2="1568" y1="256" y2="256" x1="576" />
            <wire x2="1568" y1="256" y2="448" x1="1568" />
            <wire x2="1904" y1="448" y2="448" x1="1568" />
            <wire x2="2992" y1="256" y2="256" x1="1568" />
            <wire x2="2992" y1="256" y2="448" x1="2992" />
            <wire x2="3312" y1="448" y2="448" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="576" y="192" name="DO_WE" orien="R270" />
        <branch name="RD_RED">
            <wire x2="1328" y1="1120" y2="1120" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1120" name="RD_RED" orien="R0" />
        <branch name="XLXN_131">
            <wire x2="1904" y1="1024" y2="1024" x1="1728" />
        </branch>
        <branch name="XLXN_132">
            <wire x2="1904" y1="1088" y2="1088" x1="1728" />
        </branch>
        <instance x="1664" y="1216" name="XLXI_252" orien="R0" />
        <instance x="1664" y="1024" name="XLXI_253" orien="R0" />
        <branch name="XLXN_133">
            <wire x2="1904" y1="960" y2="960" x1="1824" />
        </branch>
        <instance x="1760" y="1088" name="XLXI_254" orien="R0" />
        <iomarker fontsize="28" x="480" y="1664" name="ADDR_RD(13:0)" orien="R90" />
        <branch name="XLXN_134(0:0)">
            <wire x2="1904" y1="1280" y2="1280" x1="1824" />
        </branch>
        <branch name="XLXN_135(0:0)">
            <wire x2="3312" y1="1280" y2="1280" x1="3232" />
        </branch>
        <instance x="3168" y="1408" name="XLXI_255" orien="R0" />
        <instance x="1760" y="1408" name="XLXI_256" orien="R0" />
        <branch name="RD_GREEN">
            <wire x2="2592" y1="1120" y2="1120" x1="2512" />
        </branch>
        <iomarker fontsize="28" x="2592" y="1120" name="RD_GREEN" orien="R0" />
        <branch name="XLXN_137">
            <wire x2="1904" y1="512" y2="512" x1="1680" />
        </branch>
        <instance x="1616" y="512" name="XLXI_257" orien="R0" />
        <branch name="XLXN_138">
            <wire x2="1904" y1="576" y2="576" x1="1680" />
        </branch>
        <instance x="1616" y="704" name="XLXI_258" orien="R0" />
        <branch name="WE_GREEN">
            <wire x2="1904" y1="768" y2="768" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="768" name="WE_GREEN" orien="R180" />
        <branch name="XLXN_140">
            <wire x2="3312" y1="1088" y2="1088" x1="3120" />
        </branch>
        <instance x="3056" y="1216" name="XLXI_259" orien="R0" />
        <branch name="XLXN_141">
            <wire x2="3312" y1="1024" y2="1024" x1="3120" />
        </branch>
        <instance x="3056" y="1024" name="XLXI_260" orien="R0" />
        <branch name="XLXN_142">
            <wire x2="3312" y1="960" y2="960" x1="3184" />
        </branch>
        <instance x="3120" y="1088" name="XLXI_261" orien="R0" />
        <branch name="XLXN_143">
            <wire x2="3312" y1="512" y2="512" x1="3104" />
        </branch>
        <instance x="3040" y="512" name="XLXI_262" orien="R0" />
        <branch name="XLXN_144">
            <wire x2="3312" y1="576" y2="576" x1="3104" />
        </branch>
        <instance x="3040" y="704" name="XLXI_263" orien="R0" />
        <branch name="WE_BLUE">
            <wire x2="3312" y1="768" y2="768" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3040" y="768" name="WE_BLUE" orien="R180" />
        <branch name="RD_BLUE">
            <wire x2="3984" y1="1120" y2="1120" x1="3920" />
        </branch>
        <iomarker fontsize="28" x="3984" y="1120" name="RD_BLUE" orien="R0" />
    </sheet>
</drawing>