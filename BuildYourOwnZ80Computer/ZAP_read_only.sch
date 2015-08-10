<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDRESSES(15:0)" />
        <signal name="XLXN_207" />
        <signal name="TEST" />
        <signal name="XLXN_218(7:0)" />
        <signal name="XLXN_220" />
        <signal name="XLXN_222(0:7)" />
        <signal name="XLXN_227" />
        <signal name="XLXN_229" />
        <signal name="XLXN_231" />
        <signal name="XLXN_221" />
        <signal name="XLXN_230" />
        <signal name="ADDRESSES(3:0)" />
        <signal name="XLXN_273" />
        <signal name="XLXN_274" />
        <signal name="XLXN_275" />
        <signal name="XLXN_276(7:0)" />
        <signal name="LEDS(0)" />
        <signal name="LEDS(1)" />
        <signal name="LEDS(2)" />
        <signal name="LEDS(3)" />
        <signal name="LEDS(4)" />
        <signal name="LEDS(5)" />
        <signal name="LEDS(6)" />
        <signal name="LEDS(7)" />
        <signal name="LEDS(7:0)" />
        <signal name="XLXN_102" />
        <port polarity="Input" name="TEST" />
        <port polarity="Output" name="LEDS(0)" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <blockdef name="T80se">
            <timestamp>2011-1-24T17:35:28</timestamp>
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
        <blockdef name="ROM">
            <timestamp>2010-9-25T16:53:27</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
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
        <block symbolname="T80se" name="XLXI_1">
            <blockpin signalname="XLXN_207" name="RESET_n" />
            <blockpin signalname="TEST" name="CLK_n" />
            <blockpin signalname="XLXN_207" name="CLKEN" />
            <blockpin signalname="XLXN_207" name="WAIT_n" />
            <blockpin signalname="XLXN_207" name="INT_n" />
            <blockpin signalname="XLXN_207" name="NMI_n" />
            <blockpin signalname="XLXN_207" name="BUSRQ_n" />
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
            <blockpin signalname="XLXN_207" name="P" />
        </block>
        <block symbolname="ld8ce" name="XLXI_64">
            <blockpin signalname="XLXN_273" name="CLR" />
            <blockpin signalname="XLXN_222(0:7)" name="D(7:0)" />
            <blockpin signalname="XLXN_275" name="G" />
            <blockpin signalname="XLXN_274" name="GE" />
            <blockpin signalname="XLXN_276(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_67">
            <blockpin signalname="XLXN_227" name="I" />
            <blockpin signalname="XLXN_275" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_69">
            <blockpin signalname="XLXN_231" name="I" />
            <blockpin signalname="XLXN_274" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_63">
            <blockpin signalname="XLXN_220" name="I" />
            <blockpin signalname="XLXN_221" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_68">
            <blockpin signalname="XLXN_229" name="I" />
            <blockpin signalname="XLXN_230" name="O" />
        </block>
        <block symbolname="ROM" name="XLXI_60">
            <blockpin signalname="ADDRESSES(3:0)" name="address(3:0)" />
            <blockpin signalname="XLXN_222(0:7)" name="data(7:0)" />
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
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="864" y="784" name="XLXI_1" orien="R0">
        </instance>
        <branch name="ADDRESSES(15:0)">
            <wire x2="1488" y1="688" y2="688" x1="1248" />
        </branch>
        <branch name="XLXN_207">
            <wire x2="624" y1="640" y2="656" x1="624" />
            <wire x2="736" y1="656" y2="656" x1="624" />
            <wire x2="864" y1="656" y2="656" x1="736" />
            <wire x2="864" y1="176" y2="176" x1="736" />
            <wire x2="736" y1="176" y2="336" x1="736" />
            <wire x2="736" y1="336" y2="416" x1="736" />
            <wire x2="736" y1="416" y2="496" x1="736" />
            <wire x2="736" y1="496" y2="576" x1="736" />
            <wire x2="736" y1="576" y2="656" x1="736" />
            <wire x2="864" y1="576" y2="576" x1="736" />
            <wire x2="864" y1="496" y2="496" x1="736" />
            <wire x2="864" y1="416" y2="416" x1="736" />
            <wire x2="864" y1="336" y2="336" x1="736" />
        </branch>
        <instance x="560" y="640" name="XLXI_61" orien="R0" />
        <branch name="TEST">
            <wire x2="864" y1="256" y2="256" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="256" name="TEST" orien="R180" />
        <branch name="XLXN_220">
            <wire x2="1440" y1="304" y2="304" x1="1248" />
            <wire x2="1440" y1="304" y2="848" x1="1440" />
        </branch>
        <branch name="XLXN_222(0:7)">
            <wire x2="2016" y1="512" y2="512" x1="1920" />
        </branch>
        <branch name="XLXN_227">
            <wire x2="1520" y1="368" y2="368" x1="1248" />
        </branch>
        <branch name="XLXN_229">
            <wire x2="1328" y1="432" y2="432" x1="1248" />
            <wire x2="1328" y1="432" y2="848" x1="1328" />
        </branch>
        <branch name="XLXN_231">
            <wire x2="1520" y1="240" y2="240" x1="1248" />
        </branch>
        <instance x="1408" y="848" name="XLXI_63" orien="R90" />
        <branch name="XLXN_221">
            <wire x2="1440" y1="1072" y2="1088" x1="1440" />
            <wire x2="1808" y1="1088" y2="1088" x1="1440" />
            <wire x2="1808" y1="1088" y2="1392" x1="1808" />
            <wire x2="1904" y1="1392" y2="1392" x1="1808" />
        </branch>
        <instance x="1296" y="848" name="XLXI_68" orien="R90" />
        <branch name="XLXN_230">
            <wire x2="1328" y1="1072" y2="1152" x1="1328" />
            <wire x2="1744" y1="1152" y2="1152" x1="1328" />
            <wire x2="1744" y1="1152" y2="1456" x1="1744" />
            <wire x2="1904" y1="1456" y2="1456" x1="1744" />
        </branch>
        <bustap x2="1584" y1="688" y2="688" x1="1488" />
        <branch name="ADDRESSES(3:0)">
            <wire x2="1536" y1="512" y2="512" x1="1472" />
            <wire x2="1472" y1="512" y2="576" x1="1472" />
            <wire x2="1584" y1="576" y2="576" x1="1472" />
            <wire x2="1584" y1="576" y2="688" x1="1584" />
        </branch>
        <instance x="1520" y="400" name="XLXI_67" orien="R0" />
        <instance x="1520" y="272" name="XLXI_69" orien="R0" />
        <instance x="1536" y="544" name="XLXI_60" orien="R0">
        </instance>
        <instance x="2016" y="768" name="XLXI_64" orien="R0" />
        <branch name="XLXN_273">
            <wire x2="2016" y1="736" y2="800" x1="2016" />
        </branch>
        <instance x="1952" y="928" name="XLXI_78" orien="R0" />
        <branch name="XLXN_274">
            <wire x2="1984" y1="240" y2="240" x1="1744" />
            <wire x2="1984" y1="240" y2="576" x1="1984" />
            <wire x2="2016" y1="576" y2="576" x1="1984" />
        </branch>
        <branch name="XLXN_275">
            <wire x2="1952" y1="368" y2="368" x1="1744" />
            <wire x2="1952" y1="368" y2="640" x1="1952" />
            <wire x2="2016" y1="640" y2="640" x1="1952" />
        </branch>
        <branch name="XLXN_276(7:0)">
            <wire x2="864" y1="736" y2="736" x1="784" />
            <wire x2="784" y1="736" y2="1168" x1="784" />
            <wire x2="2480" y1="1168" y2="1168" x1="784" />
            <wire x2="2480" y1="512" y2="512" x1="2400" />
            <wire x2="2480" y1="512" y2="1168" x1="2480" />
        </branch>
        <branch name="XLXN_218(7:0)">
            <wire x2="1264" y1="752" y2="752" x1="1248" />
            <wire x2="1264" y1="752" y2="1328" x1="1264" />
            <wire x2="1904" y1="1328" y2="1328" x1="1264" />
        </branch>
        <branch name="LEDS(0)">
            <wire x2="1040" y1="1504" y2="1584" x1="1040" />
        </branch>
        <branch name="LEDS(1)">
            <wire x2="1120" y1="1504" y2="1584" x1="1120" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="1200" y1="1504" y2="1584" x1="1200" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="1280" y1="1504" y2="1584" x1="1280" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="1360" y1="1504" y2="1584" x1="1360" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="1440" y1="1504" y2="1584" x1="1440" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="1520" y1="1504" y2="1584" x1="1520" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="1600" y1="1504" y2="1584" x1="1600" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="1120" y1="1392" y2="1392" x1="1040" />
            <wire x2="1120" y1="1392" y2="1408" x1="1120" />
            <wire x2="1200" y1="1392" y2="1392" x1="1120" />
            <wire x2="1200" y1="1392" y2="1408" x1="1200" />
            <wire x2="1280" y1="1392" y2="1392" x1="1200" />
            <wire x2="1280" y1="1392" y2="1408" x1="1280" />
            <wire x2="1360" y1="1392" y2="1392" x1="1280" />
            <wire x2="1360" y1="1392" y2="1408" x1="1360" />
            <wire x2="1440" y1="1392" y2="1392" x1="1360" />
            <wire x2="1440" y1="1392" y2="1408" x1="1440" />
            <wire x2="1520" y1="1392" y2="1392" x1="1440" />
            <wire x2="1520" y1="1392" y2="1408" x1="1520" />
            <wire x2="1600" y1="1392" y2="1392" x1="1520" />
            <wire x2="1600" y1="1392" y2="1408" x1="1600" />
            <wire x2="1696" y1="1392" y2="1392" x1="1600" />
            <wire x2="1696" y1="1392" y2="1760" x1="1696" />
            <wire x2="2304" y1="1760" y2="1760" x1="1696" />
            <wire x2="1040" y1="1392" y2="1408" x1="1040" />
            <wire x2="2304" y1="1328" y2="1328" x1="2288" />
            <wire x2="2304" y1="1328" y2="1760" x1="2304" />
        </branch>
        <bustap x2="1040" y1="1408" y2="1504" x1="1040" />
        <bustap x2="1120" y1="1408" y2="1504" x1="1120" />
        <bustap x2="1200" y1="1408" y2="1504" x1="1200" />
        <bustap x2="1280" y1="1408" y2="1504" x1="1280" />
        <bustap x2="1360" y1="1408" y2="1504" x1="1360" />
        <bustap x2="1440" y1="1408" y2="1504" x1="1440" />
        <bustap x2="1520" y1="1408" y2="1504" x1="1520" />
        <bustap x2="1600" y1="1408" y2="1504" x1="1600" />
        <instance x="1904" y="1584" name="XLXI_35" orien="R0" />
        <instance x="1840" y="1728" name="XLXI_36" orien="R0" />
        <branch name="XLXN_102">
            <wire x2="1904" y1="1552" y2="1600" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1040" y="1584" name="LEDS(0)" orien="R90" />
        <iomarker fontsize="28" x="1120" y="1584" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="1200" y="1584" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="1280" y="1584" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="1360" y="1584" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="1440" y="1584" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="1520" y="1584" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="1600" y="1584" name="LEDS(7)" orien="R90" />
    </sheet>
</drawing>