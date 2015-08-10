<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_221" />
        <signal name="XLXN_322(7:0)" />
        <signal name="XLXN_333(7:0)" />
        <signal name="XLXN_306" />
        <signal name="XLXN_337" />
        <signal name="XLXN_342" />
        <signal name="XLXN_348(3:0)" />
        <signal name="XLXN_358(7:0)" />
        <signal name="XLXN_360(7:0)" />
        <signal name="XLXN_373(7:0)" />
        <signal name="XLXN_375(7:0)" />
        <signal name="XLXN_381" />
        <signal name="XLXN_397(7:0)" />
        <signal name="XLXN_412(7:0)" />
        <signal name="XLXN_415" />
        <signal name="XLXN_427(7:0)" />
        <signal name="XLXN_442(7:0)" />
        <signal name="XLXN_445" />
        <signal name="XLXN_457(7:0)" />
        <signal name="XLXN_472(7:0)" />
        <signal name="XLXN_475" />
        <signal name="XLXN_481" />
        <signal name="XLXN_483" />
        <signal name="XLXN_492(7:0)" />
        <signal name="XLXN_507(7:0)" />
        <signal name="XLXN_510" />
        <signal name="ADDRESSES(15:0)" />
        <signal name="XLXN_222(0:7)" />
        <signal name="XLXN_227" />
        <signal name="XLXN_231" />
        <signal name="ADDRESSES(3:0)" />
        <signal name="XLXN_274" />
        <signal name="XLXN_275" />
        <signal name="XLXN_276(7:0)" />
        <signal name="XLXN_522(7:0)" />
        <signal name="XLXN_218(7:0)" />
        <signal name="XLXN_230" />
        <signal name="XLXN_346" />
        <signal name="XLXN_347" />
        <signal name="XLXN_273" />
        <signal name="LEDS(0)" />
        <signal name="LEDS(1)" />
        <signal name="LEDS(2)" />
        <signal name="LEDS(3)" />
        <signal name="LEDS(4)" />
        <signal name="LEDS(5)" />
        <signal name="LEDS(6)" />
        <signal name="LEDS(7)" />
        <signal name="LEDS(7:0)" />
        <signal name="XLXN_537(7:0)" />
        <signal name="XLXN_102" />
        <signal name="XLXN_540" />
        <signal name="XLXN_308" />
        <signal name="T9" />
        <port polarity="Output" name="LEDS(0)" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <port polarity="Input" name="T9" />
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
        <blockdef name="ROM">
            <timestamp>2010-9-25T16:53:27</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="T80se" name="XLXI_1">
            <blockpin signalname="XLXN_308" name="RESET_n" />
            <blockpin signalname="XLXN_381" name="CLK_n" />
            <blockpin signalname="XLXN_308" name="CLKEN" />
            <blockpin signalname="XLXN_308" name="WAIT_n" />
            <blockpin signalname="XLXN_308" name="INT_n" />
            <blockpin signalname="XLXN_308" name="NMI_n" />
            <blockpin signalname="XLXN_308" name="BUSRQ_n" />
            <blockpin signalname="XLXN_276(7:0)" name="DI(7:0)" />
            <blockpin name="M1_n" />
            <blockpin signalname="XLXN_231" name="MREQ_n" />
            <blockpin signalname="XLXN_346" name="IORQ_n" />
            <blockpin signalname="XLXN_227" name="RD_n" />
            <blockpin signalname="XLXN_347" name="WR_n" />
            <blockpin name="RFSH_n" />
            <blockpin name="HALT_n" />
            <blockpin name="BUSAK_n" />
            <blockpin signalname="ADDRESSES(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_218(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_67">
            <blockpin signalname="XLXN_227" name="I" />
            <blockpin signalname="XLXN_275" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_69">
            <blockpin signalname="XLXN_231" name="I" />
            <blockpin signalname="XLXN_274" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_103">
            <blockpin signalname="XLXN_346" name="I" />
            <blockpin signalname="XLXN_221" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_104">
            <blockpin signalname="XLXN_347" name="I" />
            <blockpin signalname="XLXN_230" name="O" />
        </block>
        <block symbolname="ROM" name="XLXI_60">
            <blockpin signalname="ADDRESSES(3:0)" name="address(3:0)" />
            <blockpin signalname="XLXN_222(0:7)" name="data(7:0)" />
        </block>
        <block symbolname="ld8ce" name="XLXI_64">
            <blockpin signalname="XLXN_273" name="CLR" />
            <blockpin signalname="XLXN_222(0:7)" name="D(7:0)" />
            <blockpin signalname="XLXN_275" name="G" />
            <blockpin signalname="XLXN_274" name="GE" />
            <blockpin signalname="XLXN_276(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_78">
            <blockpin signalname="XLXN_273" name="G" />
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
        <block symbolname="vcc" name="XLXI_61">
            <blockpin signalname="XLXN_308" name="P" />
        </block>
        <block symbolname="INVADERS_CLOCKS" name="XLXI_90">
            <blockpin signalname="T9" name="I_CLK_REF" />
            <blockpin signalname="XLXN_308" name="I_RESET_L" />
            <blockpin signalname="XLXN_381" name="O_CLK" />
            <blockpin name="O_CLK_X2" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="640" y="848" name="XLXI_1" orien="R0">
        </instance>
        <branch name="ADDRESSES(15:0)">
            <wire x2="1264" y1="752" y2="752" x1="1024" />
        </branch>
        <branch name="XLXN_222(0:7)">
            <wire x2="1792" y1="544" y2="544" x1="1696" />
        </branch>
        <branch name="XLXN_227">
            <wire x2="1296" y1="432" y2="432" x1="1024" />
        </branch>
        <branch name="XLXN_231">
            <wire x2="1296" y1="304" y2="304" x1="1024" />
        </branch>
        <bustap x2="1360" y1="752" y2="752" x1="1264" />
        <branch name="ADDRESSES(3:0)">
            <wire x2="1312" y1="544" y2="544" x1="1232" />
            <wire x2="1232" y1="544" y2="592" x1="1232" />
            <wire x2="1360" y1="592" y2="592" x1="1232" />
            <wire x2="1360" y1="592" y2="752" x1="1360" />
        </branch>
        <instance x="1296" y="464" name="XLXI_67" orien="R0" />
        <instance x="1296" y="336" name="XLXI_69" orien="R0" />
        <branch name="XLXN_274">
            <wire x2="1728" y1="304" y2="304" x1="1520" />
            <wire x2="1728" y1="304" y2="608" x1="1728" />
            <wire x2="1792" y1="608" y2="608" x1="1728" />
        </branch>
        <branch name="XLXN_275">
            <wire x2="1744" y1="432" y2="432" x1="1520" />
            <wire x2="1744" y1="432" y2="672" x1="1744" />
            <wire x2="1792" y1="672" y2="672" x1="1744" />
        </branch>
        <branch name="XLXN_276(7:0)">
            <wire x2="640" y1="800" y2="800" x1="624" />
            <wire x2="624" y1="800" y2="896" x1="624" />
            <wire x2="2208" y1="896" y2="896" x1="624" />
            <wire x2="2208" y1="544" y2="544" x1="2176" />
            <wire x2="2208" y1="544" y2="896" x1="2208" />
        </branch>
        <branch name="XLXN_218(7:0)">
            <wire x2="1040" y1="816" y2="816" x1="1024" />
            <wire x2="1040" y1="816" y2="1040" x1="1040" />
            <wire x2="1680" y1="1040" y2="1040" x1="1040" />
        </branch>
        <instance x="1344" y="816" name="XLXI_103" orien="R0" />
        <instance x="1152" y="880" name="XLXI_104" orien="R0" />
        <branch name="XLXN_230">
            <wire x2="1536" y1="848" y2="848" x1="1376" />
            <wire x2="1536" y1="848" y2="1168" x1="1536" />
            <wire x2="1680" y1="1168" y2="1168" x1="1536" />
        </branch>
        <branch name="XLXN_346">
            <wire x2="1184" y1="368" y2="368" x1="1024" />
            <wire x2="1184" y1="368" y2="784" x1="1184" />
            <wire x2="1344" y1="784" y2="784" x1="1184" />
        </branch>
        <branch name="XLXN_347">
            <wire x2="1088" y1="496" y2="496" x1="1024" />
            <wire x2="1088" y1="496" y2="848" x1="1088" />
            <wire x2="1152" y1="848" y2="848" x1="1088" />
        </branch>
        <instance x="1312" y="576" name="XLXI_60" orien="R0">
        </instance>
        <instance x="1792" y="800" name="XLXI_64" orien="R0" />
        <instance x="1552" y="656" name="XLXI_78" orien="R90" />
        <branch name="XLXN_273">
            <wire x2="1728" y1="720" y2="720" x1="1680" />
            <wire x2="1728" y1="720" y2="768" x1="1728" />
            <wire x2="1792" y1="768" y2="768" x1="1728" />
        </branch>
        <branch name="LEDS(0)">
            <wire x2="816" y1="1216" y2="1264" x1="816" />
        </branch>
        <branch name="LEDS(1)">
            <wire x2="896" y1="1216" y2="1264" x1="896" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="976" y1="1216" y2="1264" x1="976" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="1056" y1="1216" y2="1264" x1="1056" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="1136" y1="1216" y2="1264" x1="1136" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="1216" y1="1216" y2="1264" x1="1216" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="1296" y1="1216" y2="1264" x1="1296" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="1376" y1="1216" y2="1264" x1="1376" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="896" y1="1104" y2="1104" x1="816" />
            <wire x2="896" y1="1104" y2="1120" x1="896" />
            <wire x2="976" y1="1104" y2="1104" x1="896" />
            <wire x2="976" y1="1104" y2="1120" x1="976" />
            <wire x2="1056" y1="1104" y2="1104" x1="976" />
            <wire x2="1056" y1="1104" y2="1120" x1="1056" />
            <wire x2="1136" y1="1104" y2="1104" x1="1056" />
            <wire x2="1136" y1="1104" y2="1120" x1="1136" />
            <wire x2="1216" y1="1104" y2="1104" x1="1136" />
            <wire x2="1216" y1="1104" y2="1120" x1="1216" />
            <wire x2="1296" y1="1104" y2="1104" x1="1216" />
            <wire x2="1296" y1="1104" y2="1120" x1="1296" />
            <wire x2="1376" y1="1104" y2="1104" x1="1296" />
            <wire x2="1376" y1="1104" y2="1120" x1="1376" />
            <wire x2="1472" y1="1104" y2="1104" x1="1376" />
            <wire x2="1472" y1="1104" y2="1344" x1="1472" />
            <wire x2="2080" y1="1344" y2="1344" x1="1472" />
            <wire x2="816" y1="1104" y2="1120" x1="816" />
            <wire x2="2080" y1="1040" y2="1040" x1="2064" />
            <wire x2="2080" y1="1040" y2="1344" x1="2080" />
        </branch>
        <bustap x2="816" y1="1120" y2="1216" x1="816" />
        <bustap x2="896" y1="1120" y2="1216" x1="896" />
        <bustap x2="976" y1="1120" y2="1216" x1="976" />
        <bustap x2="1056" y1="1120" y2="1216" x1="1056" />
        <bustap x2="1136" y1="1120" y2="1216" x1="1136" />
        <bustap x2="1216" y1="1120" y2="1216" x1="1216" />
        <bustap x2="1296" y1="1120" y2="1216" x1="1296" />
        <bustap x2="1376" y1="1120" y2="1216" x1="1376" />
        <instance x="1680" y="1296" name="XLXI_35" orien="R0" />
        <instance x="1504" y="1200" name="XLXI_36" orien="R90" />
        <branch name="XLXN_102">
            <wire x2="1680" y1="1264" y2="1264" x1="1632" />
        </branch>
        <branch name="XLXN_221">
            <wire x2="1584" y1="784" y2="784" x1="1568" />
            <wire x2="1584" y1="784" y2="1104" x1="1584" />
            <wire x2="1680" y1="1104" y2="1104" x1="1584" />
        </branch>
        <branch name="XLXN_308">
            <wire x2="496" y1="672" y2="720" x1="496" />
            <wire x2="592" y1="720" y2="720" x1="496" />
            <wire x2="640" y1="720" y2="720" x1="592" />
            <wire x2="496" y1="720" y2="784" x1="496" />
            <wire x2="640" y1="240" y2="240" x1="592" />
            <wire x2="592" y1="240" y2="400" x1="592" />
            <wire x2="640" y1="400" y2="400" x1="592" />
            <wire x2="592" y1="400" y2="480" x1="592" />
            <wire x2="640" y1="480" y2="480" x1="592" />
            <wire x2="592" y1="480" y2="560" x1="592" />
            <wire x2="640" y1="560" y2="560" x1="592" />
            <wire x2="592" y1="560" y2="640" x1="592" />
            <wire x2="640" y1="640" y2="640" x1="592" />
            <wire x2="592" y1="640" y2="720" x1="592" />
        </branch>
        <branch name="T9">
            <wire x2="432" y1="672" y2="688" x1="432" />
            <wire x2="432" y1="688" y2="704" x1="432" />
        </branch>
        <instance x="560" y="784" name="XLXI_61" orien="R180" />
        <instance x="528" y="672" name="XLXI_90" orien="R270">
        </instance>
        <branch name="XLXN_381">
            <wire x2="432" y1="224" y2="288" x1="432" />
            <wire x2="624" y1="224" y2="224" x1="432" />
            <wire x2="624" y1="224" y2="320" x1="624" />
            <wire x2="640" y1="320" y2="320" x1="624" />
        </branch>
        <iomarker fontsize="28" x="816" y="1264" name="LEDS(0)" orien="R90" />
        <iomarker fontsize="28" x="896" y="1264" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="976" y="1264" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="1056" y="1264" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="1136" y="1264" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="1216" y="1264" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="1296" y="1264" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="1376" y="1264" name="LEDS(7)" orien="R90" />
        <iomarker fontsize="28" x="432" y="704" name="T9" orien="R90" />
    </sheet>
</drawing>