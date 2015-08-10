<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_326" />
        <signal name="XLXN_328(7:0)" />
        <signal name="XLXN_331(7:0)" />
        <signal name="XLXN_334(7:0)" />
        <signal name="XLXN_338(7:0)" />
        <signal name="XLXN_343(7:0)" />
        <signal name="XLXN_347(7:0)" />
        <signal name="XLXN_351(7:0)" />
        <signal name="XLXN_399" />
        <signal name="XLXN_407(7:0)" />
        <signal name="XLXN_421(7:0)" />
        <signal name="XLXN_429" />
        <signal name="XLXN_437(7:0)" />
        <signal name="XLXN_451(7:0)" />
        <signal name="XLXN_459" />
        <signal name="XLXN_467(7:0)" />
        <signal name="XLXN_481(7:0)" />
        <signal name="ADDRESSES(15:0)" />
        <signal name="XLXN_220" />
        <signal name="XLXN_227" />
        <signal name="XLXN_229" />
        <signal name="XLXN_231" />
        <signal name="XLXN_218(7:0)" />
        <signal name="T9" />
        <signal name="XLXN_489" />
        <signal name="XLXN_308" />
        <signal name="ADDRESSES(10:0)" />
        <signal name="XLXN_222(0:7)" />
        <signal name="XLXN_319" />
        <signal name="XLXN_320" />
        <signal name="XLXN_321" />
        <signal name="XLXN_323" />
        <signal name="XLXN_276(7:0)" />
        <signal name="XLXN_497(7:0)" />
        <signal name="XLXN_342" />
        <signal name="XLXN_221" />
        <signal name="XLXN_230" />
        <signal name="XLXN_102" />
        <signal name="LEDS(0)" />
        <signal name="LEDS(1)" />
        <signal name="LEDS(2)" />
        <signal name="LEDS(3)" />
        <signal name="LEDS(4)" />
        <signal name="LEDS(5)" />
        <signal name="LEDS(6)" />
        <signal name="LEDS(7)" />
        <signal name="LEDS(7:0)" />
        <signal name="XLXN_511(7:0)" />
        <port polarity="Input" name="T9" />
        <port polarity="Output" name="LEDS(0)" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <blockdef name="T80se">
            <timestamp>2010-9-18T15:6:53</timestamp>
            <rect width="256" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="INVADERS_CLOCKS">
            <timestamp>2010-9-19T16:4:39</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="SIMPLE_ROM">
            <timestamp>2010-9-25T18:36:31</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="T80se" name="XLXI_1">
            <blockpin signalname="XLXN_308" name="RESET_n" />
            <blockpin signalname="XLXN_321" name="CLK_n" />
            <blockpin signalname="XLXN_308" name="CLKEN" />
            <blockpin signalname="XLXN_308" name="WAIT_n" />
            <blockpin signalname="XLXN_308" name="INT_n" />
            <blockpin signalname="XLXN_308" name="NMI_n" />
            <blockpin signalname="XLXN_308" name="BUSRQ_n" />
            <blockpin signalname="XLXN_276(7:0)" name="DI(7:0)" />
            <blockpin name="M1_n" />
            <blockpin signalname="XLXN_231" name="MREQ_n" />
            <blockpin signalname="XLXN_220" name="IORQ_n" />
            <blockpin signalname="XLXN_227" name="RD_n" />
            <blockpin signalname="XLXN_229" name="WR_n" />
            <blockpin name="RFSH_n" />
            <blockpin name="HALT_n" />
            <blockpin name="BUSAK_n" />
            <blockpin signalname="ADDRESSES(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_218(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_61">
            <blockpin signalname="XLXN_308" name="P" />
        </block>
        <block symbolname="INVADERS_CLOCKS" name="XLXI_90">
            <blockpin signalname="T9" name="I_CLK_REF" />
            <blockpin signalname="XLXN_308" name="I_RESET_L" />
            <blockpin signalname="XLXN_321" name="O_CLK" />
            <blockpin name="O_CLK_X2" />
        </block>
        <block symbolname="SIMPLE_ROM" name="XLXI_91">
            <blockpin signalname="XLXN_321" name="CLK" />
            <blockpin signalname="XLXN_320" name="ENA" />
            <blockpin signalname="ADDRESSES(10:0)" name="ADDR(10:0)" />
            <blockpin signalname="XLXN_222(0:7)" name="DATA(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_96">
            <blockpin signalname="XLXN_320" name="P" />
        </block>
        <block symbolname="ld8ce" name="XLXI_64">
            <blockpin signalname="XLXN_342" name="CLR" />
            <blockpin signalname="XLXN_222(0:7)" name="D(7:0)" />
            <blockpin signalname="XLXN_323" name="G" />
            <blockpin signalname="XLXN_319" name="GE" />
            <blockpin signalname="XLXN_276(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_69">
            <blockpin signalname="XLXN_231" name="I" />
            <blockpin signalname="XLXN_319" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_67">
            <blockpin signalname="XLXN_227" name="I" />
            <blockpin signalname="XLXN_323" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_101">
            <blockpin signalname="XLXN_220" name="I" />
            <blockpin signalname="XLXN_221" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_102">
            <blockpin signalname="XLXN_229" name="I" />
            <blockpin signalname="XLXN_230" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_78">
            <blockpin signalname="XLXN_342" name="G" />
        </block>
        <block symbolname="ld8ce" name="XLXI_35">
            <blockpin signalname="XLXN_102" name="CLR" />
            <blockpin signalname="XLXN_218(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_230" name="G" />
            <blockpin signalname="XLXN_221" name="GE" />
            <blockpin signalname="LEDS(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_36">
            <blockpin signalname="XLXN_102" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="912" y="880" name="XLXI_1" orien="R0">
        </instance>
        <branch name="ADDRESSES(15:0)">
            <wire x2="1536" y1="784" y2="784" x1="1296" />
        </branch>
        <instance x="608" y="736" name="XLXI_61" orien="R0" />
        <branch name="XLXN_220">
            <wire x2="1488" y1="400" y2="400" x1="1296" />
            <wire x2="1488" y1="400" y2="944" x1="1488" />
        </branch>
        <branch name="XLXN_227">
            <wire x2="1632" y1="464" y2="464" x1="1296" />
        </branch>
        <branch name="XLXN_229">
            <wire x2="1376" y1="528" y2="528" x1="1296" />
            <wire x2="1376" y1="528" y2="1024" x1="1376" />
        </branch>
        <branch name="XLXN_231">
            <wire x2="1648" y1="336" y2="336" x1="1296" />
        </branch>
        <bustap x2="1632" y1="784" y2="784" x1="1536" />
        <branch name="XLXN_218(7:0)">
            <wire x2="1312" y1="848" y2="848" x1="1296" />
            <wire x2="1312" y1="848" y2="1104" x1="1312" />
            <wire x2="2000" y1="1104" y2="1104" x1="1312" />
        </branch>
        <instance x="144" y="448" name="XLXI_90" orien="R0">
        </instance>
        <branch name="T9">
            <wire x2="144" y1="352" y2="352" x1="112" />
        </branch>
        <branch name="XLXN_308">
            <wire x2="144" y1="416" y2="416" x1="96" />
            <wire x2="96" y1="416" y2="752" x1="96" />
            <wire x2="672" y1="752" y2="752" x1="96" />
            <wire x2="784" y1="752" y2="752" x1="672" />
            <wire x2="912" y1="752" y2="752" x1="784" />
            <wire x2="672" y1="736" y2="752" x1="672" />
            <wire x2="912" y1="272" y2="272" x1="784" />
            <wire x2="784" y1="272" y2="432" x1="784" />
            <wire x2="784" y1="432" y2="512" x1="784" />
            <wire x2="784" y1="512" y2="592" x1="784" />
            <wire x2="784" y1="592" y2="672" x1="784" />
            <wire x2="784" y1="672" y2="752" x1="784" />
            <wire x2="912" y1="672" y2="672" x1="784" />
            <wire x2="912" y1="592" y2="592" x1="784" />
            <wire x2="912" y1="512" y2="512" x1="784" />
            <wire x2="912" y1="432" y2="432" x1="784" />
        </branch>
        <branch name="ADDRESSES(10:0)">
            <wire x2="1664" y1="784" y2="784" x1="1632" />
        </branch>
        <instance x="1664" y="816" name="XLXI_91" orien="R0">
        </instance>
        <branch name="XLXN_222(0:7)">
            <wire x2="2208" y1="656" y2="656" x1="2048" />
        </branch>
        <branch name="XLXN_319">
            <wire x2="2160" y1="336" y2="336" x1="1872" />
            <wire x2="2160" y1="336" y2="720" x1="2160" />
            <wire x2="2208" y1="720" y2="720" x1="2160" />
        </branch>
        <branch name="XLXN_320">
            <wire x2="1552" y1="704" y2="720" x1="1552" />
            <wire x2="1664" y1="720" y2="720" x1="1552" />
        </branch>
        <instance x="1488" y="704" name="XLXI_96" orien="R0" />
        <branch name="XLXN_321">
            <wire x2="624" y1="352" y2="352" x1="528" />
            <wire x2="912" y1="352" y2="352" x1="624" />
            <wire x2="624" y1="160" y2="352" x1="624" />
            <wire x2="1552" y1="160" y2="160" x1="624" />
            <wire x2="1552" y1="160" y2="576" x1="1552" />
            <wire x2="1648" y1="576" y2="576" x1="1552" />
            <wire x2="1648" y1="576" y2="656" x1="1648" />
            <wire x2="1664" y1="656" y2="656" x1="1648" />
        </branch>
        <branch name="XLXN_323">
            <wire x2="2112" y1="464" y2="464" x1="1856" />
            <wire x2="2112" y1="464" y2="784" x1="2112" />
            <wire x2="2208" y1="784" y2="784" x1="2112" />
        </branch>
        <instance x="2208" y="912" name="XLXI_64" orien="R0" />
        <instance x="1648" y="368" name="XLXI_69" orien="R0" />
        <instance x="1632" y="496" name="XLXI_67" orien="R0" />
        <instance x="1488" y="976" name="XLXI_101" orien="R0" />
        <instance x="1376" y="1056" name="XLXI_102" orien="R0" />
        <branch name="XLXN_276(7:0)">
            <wire x2="912" y1="832" y2="832" x1="320" />
            <wire x2="320" y1="832" y2="1456" x1="320" />
            <wire x2="2672" y1="1456" y2="1456" x1="320" />
            <wire x2="2672" y1="656" y2="656" x1="2592" />
            <wire x2="2672" y1="656" y2="1456" x1="2672" />
        </branch>
        <branch name="XLXN_342">
            <wire x2="2208" y1="880" y2="880" x1="2128" />
        </branch>
        <instance x="2000" y="816" name="XLXI_78" orien="R90" />
        <instance x="2000" y="1360" name="XLXI_35" orien="R0" />
        <branch name="XLXN_221">
            <wire x2="1728" y1="944" y2="944" x1="1712" />
            <wire x2="1728" y1="944" y2="1168" x1="1728" />
            <wire x2="2000" y1="1168" y2="1168" x1="1728" />
        </branch>
        <branch name="XLXN_230">
            <wire x2="1616" y1="1024" y2="1024" x1="1600" />
            <wire x2="1616" y1="1024" y2="1232" x1="1616" />
            <wire x2="2000" y1="1232" y2="1232" x1="1616" />
        </branch>
        <branch name="XLXN_102">
            <wire x2="2000" y1="1328" y2="1328" x1="1952" />
        </branch>
        <instance x="1824" y="1264" name="XLXI_36" orien="R90" />
        <branch name="LEDS(0)">
            <wire x2="496" y1="1088" y2="1136" x1="496" />
        </branch>
        <branch name="LEDS(1)">
            <wire x2="576" y1="1088" y2="1136" x1="576" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="656" y1="1088" y2="1136" x1="656" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="736" y1="1088" y2="1136" x1="736" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="816" y1="1088" y2="1136" x1="816" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="896" y1="1088" y2="1136" x1="896" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="976" y1="1088" y2="1136" x1="976" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="1056" y1="1088" y2="1136" x1="1056" />
        </branch>
        <bustap x2="496" y1="992" y2="1088" x1="496" />
        <bustap x2="576" y1="992" y2="1088" x1="576" />
        <bustap x2="656" y1="992" y2="1088" x1="656" />
        <bustap x2="736" y1="992" y2="1088" x1="736" />
        <bustap x2="816" y1="992" y2="1088" x1="816" />
        <bustap x2="896" y1="992" y2="1088" x1="896" />
        <bustap x2="976" y1="992" y2="1088" x1="976" />
        <bustap x2="1056" y1="992" y2="1088" x1="1056" />
        <branch name="LEDS(7:0)">
            <wire x2="576" y1="976" y2="976" x1="496" />
            <wire x2="576" y1="976" y2="992" x1="576" />
            <wire x2="656" y1="976" y2="976" x1="576" />
            <wire x2="656" y1="976" y2="992" x1="656" />
            <wire x2="736" y1="976" y2="976" x1="656" />
            <wire x2="736" y1="976" y2="992" x1="736" />
            <wire x2="816" y1="976" y2="976" x1="736" />
            <wire x2="816" y1="976" y2="992" x1="816" />
            <wire x2="896" y1="976" y2="976" x1="816" />
            <wire x2="896" y1="976" y2="992" x1="896" />
            <wire x2="976" y1="976" y2="976" x1="896" />
            <wire x2="976" y1="976" y2="992" x1="976" />
            <wire x2="1056" y1="976" y2="976" x1="976" />
            <wire x2="1056" y1="976" y2="992" x1="1056" />
            <wire x2="1136" y1="976" y2="976" x1="1056" />
            <wire x2="1136" y1="976" y2="1392" x1="1136" />
            <wire x2="2464" y1="1392" y2="1392" x1="1136" />
            <wire x2="496" y1="976" y2="992" x1="496" />
            <wire x2="2464" y1="1104" y2="1104" x1="2384" />
            <wire x2="2464" y1="1104" y2="1392" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="112" y="352" name="T9" orien="R180" />
        <iomarker fontsize="28" x="496" y="1136" name="LEDS(0)" orien="R90" />
        <iomarker fontsize="28" x="576" y="1136" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="656" y="1136" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="736" y="1136" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="816" y="1136" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="896" y="1136" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="976" y="1136" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="1056" y="1136" name="LEDS(7)" orien="R90" />
    </sheet>
</drawing>