<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_47" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="ADDRESSES(15:0)" />
        <signal name="ADDRESSES(10:0)" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_33" />
        <signal name="RESET_n" />
        <signal name="LEDS(0)" />
        <signal name="LEDS(1)" />
        <signal name="LEDS(2)" />
        <signal name="LEDS(3)" />
        <signal name="LEDS(4)" />
        <signal name="LEDS(5)" />
        <signal name="LEDS(6)" />
        <signal name="LEDS(7)" />
        <signal name="XLXN_102" />
        <signal name="XLXN_103" />
        <signal name="XLXN_83" />
        <signal name="BUTTONS(7:0)" />
        <signal name="BUTTONS(0)" />
        <signal name="BUTTONS(1)" />
        <signal name="BUTTONS(2)" />
        <signal name="BUTTONS(3)" />
        <signal name="BUTTONS(4)" />
        <signal name="BUTTONS(5)" />
        <signal name="BUTTONS(6)" />
        <signal name="BUTTONS(7)" />
        <signal name="XLXN_31" />
        <signal name="T9" />
        <signal name="XLXN_187" />
        <signal name="XLXN_189(7:0)" />
        <signal name="LEDS(7:0)" />
        <port polarity="Output" name="XLXN_56" />
        <port polarity="Output" name="XLXN_57" />
        <port polarity="Output" name="XLXN_58" />
        <port polarity="Output" name="XLXN_59" />
        <port polarity="Input" name="RESET_n" />
        <port polarity="Output" name="LEDS(0)" />
        <port polarity="Output" name="LEDS(1)" />
        <port polarity="Output" name="LEDS(2)" />
        <port polarity="Output" name="LEDS(3)" />
        <port polarity="Output" name="LEDS(4)" />
        <port polarity="Output" name="LEDS(5)" />
        <port polarity="Output" name="LEDS(6)" />
        <port polarity="Output" name="LEDS(7)" />
        <port polarity="Input" name="BUTTONS(0)" />
        <port polarity="Input" name="BUTTONS(1)" />
        <port polarity="Input" name="BUTTONS(2)" />
        <port polarity="Input" name="BUTTONS(3)" />
        <port polarity="Input" name="BUTTONS(4)" />
        <port polarity="Input" name="BUTTONS(5)" />
        <port polarity="Input" name="BUTTONS(6)" />
        <port polarity="Input" name="BUTTONS(7)" />
        <port polarity="Input" name="T9" />
        <blockdef name="T80se">
            <timestamp>2011-1-24T17:35:27</timestamp>
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
        <blockdef name="OPEN_BUS">
            <timestamp>2010-9-19T12:4:55</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="nor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
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
        <block symbolname="T80se" name="XLXI_1">
            <blockpin signalname="RESET_n" name="RESET_n" />
            <blockpin signalname="T9" name="CLK_n" />
            <blockpin signalname="XLXN_1" name="CLKEN" />
            <blockpin signalname="XLXN_47" name="WAIT_n" />
            <blockpin signalname="XLXN_47" name="INT_n" />
            <blockpin signalname="XLXN_47" name="NMI_n" />
            <blockpin signalname="XLXN_47" name="BUSRQ_n" />
            <blockpin signalname="XLXN_189(7:0)" name="DI(7:0)" />
            <blockpin signalname="XLXN_56" name="M1_n" />
            <blockpin signalname="XLXN_10" name="MREQ_n" />
            <blockpin signalname="XLXN_83" name="IORQ_n" />
            <blockpin signalname="XLXN_11" name="RD_n" />
            <blockpin signalname="XLXN_33" name="WR_n" />
            <blockpin signalname="XLXN_57" name="RFSH_n" />
            <blockpin signalname="XLXN_58" name="HALT_n" />
            <blockpin signalname="XLXN_59" name="BUSAK_n" />
            <blockpin signalname="ADDRESSES(15:0)" name="A(15:0)" />
            <blockpin signalname="LEDS(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_3">
            <blockpin signalname="XLXN_1" name="P" />
        </block>
        <block symbolname="SIMPLE_ROM" name="XLXI_5">
            <blockpin signalname="T9" name="CLK" />
            <blockpin signalname="XLXN_187" name="ENA" />
            <blockpin signalname="ADDRESSES(10:0)" name="ADDR(10:0)" />
            <blockpin signalname="XLXN_189(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_30">
            <blockpin signalname="XLXN_47" name="P" />
        </block>
        <block symbolname="nor2" name="XLXI_32">
            <blockpin signalname="XLXN_11" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_34">
            <blockpin signalname="XLXN_33" name="I0" />
            <blockpin signalname="XLXN_83" name="I1" />
            <blockpin name="O" />
        </block>
        <block symbolname="ld8ce" name="XLXI_35">
            <blockpin signalname="XLXN_102" name="CLR" />
            <blockpin name="D(7:0)" />
            <blockpin signalname="XLXN_103" name="G" />
            <blockpin name="GE" />
            <blockpin name="Q(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_36">
            <blockpin signalname="XLXN_102" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_37">
            <blockpin signalname="XLXN_103" name="P" />
        </block>
        <block symbolname="OPEN_BUS" name="XLXI_14">
            <blockpin signalname="XLXN_31" name="CE" />
            <blockpin signalname="BUTTONS(7:0)" name="I(7:0)" />
            <blockpin name="O(7:0)" />
        </block>
        <block symbolname="nor2" name="XLXI_33">
            <blockpin signalname="XLXN_83" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_58">
            <blockpin signalname="XLXN_187" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="864" y="784" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="608" y1="304" y2="336" x1="608" />
            <wire x2="864" y1="336" y2="336" x1="608" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="512" y1="560" y2="576" x1="512" />
            <wire x2="656" y1="576" y2="576" x1="512" />
            <wire x2="864" y1="416" y2="416" x1="656" />
            <wire x2="656" y1="416" y2="496" x1="656" />
            <wire x2="656" y1="496" y2="576" x1="656" />
            <wire x2="736" y1="496" y2="496" x1="656" />
            <wire x2="736" y1="496" y2="656" x1="736" />
            <wire x2="864" y1="656" y2="656" x1="736" />
            <wire x2="784" y1="496" y2="496" x1="736" />
            <wire x2="784" y1="496" y2="576" x1="784" />
            <wire x2="864" y1="576" y2="576" x1="784" />
            <wire x2="864" y1="496" y2="496" x1="784" />
        </branch>
        <instance x="1872" y="656" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_10">
            <wire x2="1696" y1="240" y2="240" x1="1248" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1616" y1="368" y2="368" x1="1248" />
            <wire x2="1616" y1="352" y2="352" x1="1520" />
            <wire x2="1616" y1="352" y2="368" x1="1616" />
            <wire x2="1520" y1="352" y2="1120" x1="1520" />
            <wire x2="1680" y1="1120" y2="1120" x1="1520" />
            <wire x2="1696" y1="304" y2="304" x1="1616" />
            <wire x2="1616" y1="304" y2="352" x1="1616" />
        </branch>
        <branch name="ADDRESSES(15:0)">
            <wire x2="1728" y1="688" y2="688" x1="1248" />
            <wire x2="1728" y1="624" y2="688" x1="1728" />
        </branch>
        <bustap x2="1824" y1="624" y2="624" x1="1728" />
        <branch name="ADDRESSES(10:0)">
            <wire x2="1872" y1="624" y2="624" x1="1824" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="1568" y1="176" y2="176" x1="1248" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1568" y1="496" y2="496" x1="1248" />
        </branch>
        <branch name="XLXN_58">
            <wire x2="1568" y1="560" y2="560" x1="1248" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1568" y1="624" y2="624" x1="1248" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1392" y1="432" y2="432" x1="1248" />
            <wire x2="1392" y1="432" y2="2192" x1="1392" />
            <wire x2="1472" y1="2192" y2="2192" x1="1392" />
        </branch>
        <instance x="448" y="560" name="XLXI_30" orien="R0" />
        <branch name="RESET_n">
            <wire x2="864" y1="176" y2="176" x1="800" />
        </branch>
        <instance x="1696" y="368" name="XLXI_32" orien="R0" />
        <branch name="LEDS(0)">
            <wire x2="1904" y1="2208" y2="2288" x1="1904" />
        </branch>
        <branch name="LEDS(1)">
            <wire x2="1984" y1="2208" y2="2288" x1="1984" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="2064" y1="2208" y2="2288" x1="2064" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="2144" y1="2208" y2="2288" x1="2144" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="2224" y1="2208" y2="2288" x1="2224" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="2304" y1="2208" y2="2288" x1="2304" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="2384" y1="2208" y2="2288" x1="2384" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="2464" y1="2208" y2="2288" x1="2464" />
        </branch>
        <bustap x2="1904" y1="2112" y2="2208" x1="1904" />
        <bustap x2="1984" y1="2112" y2="2208" x1="1984" />
        <bustap x2="2064" y1="2112" y2="2208" x1="2064" />
        <bustap x2="2144" y1="2112" y2="2208" x1="2144" />
        <bustap x2="2224" y1="2112" y2="2208" x1="2224" />
        <bustap x2="2304" y1="2112" y2="2208" x1="2304" />
        <bustap x2="2384" y1="2112" y2="2208" x1="2384" />
        <bustap x2="2464" y1="2112" y2="2208" x1="2464" />
        <instance x="2768" y="2288" name="XLXI_35" orien="R0" />
        <instance x="2704" y="2432" name="XLXI_36" orien="R0" />
        <instance x="2512" y="2240" name="XLXI_37" orien="R0" />
        <branch name="XLXN_102">
            <wire x2="2768" y1="2256" y2="2304" x1="2768" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="2576" y1="2240" y2="2256" x1="2576" />
            <wire x2="2704" y1="2256" y2="2256" x1="2576" />
            <wire x2="2768" y1="2160" y2="2160" x1="2704" />
            <wire x2="2704" y1="2160" y2="2256" x1="2704" />
        </branch>
        <branch name="BUTTONS(7:0)">
            <wire x2="1920" y1="1600" y2="1616" x1="1920" />
            <wire x2="2000" y1="1616" y2="1616" x1="1920" />
            <wire x2="2080" y1="1616" y2="1616" x1="2000" />
            <wire x2="2160" y1="1616" y2="1616" x1="2080" />
            <wire x2="2240" y1="1616" y2="1616" x1="2160" />
            <wire x2="2320" y1="1616" y2="1616" x1="2240" />
            <wire x2="2400" y1="1616" y2="1616" x1="2320" />
            <wire x2="2480" y1="1616" y2="1616" x1="2400" />
            <wire x2="2688" y1="1616" y2="1616" x1="2480" />
            <wire x2="2000" y1="1600" y2="1616" x1="2000" />
            <wire x2="2080" y1="1600" y2="1616" x1="2080" />
            <wire x2="2160" y1="1600" y2="1616" x1="2160" />
            <wire x2="2240" y1="1600" y2="1616" x1="2240" />
            <wire x2="2320" y1="1600" y2="1616" x1="2320" />
            <wire x2="2400" y1="1600" y2="1616" x1="2400" />
            <wire x2="2480" y1="1600" y2="1616" x1="2480" />
        </branch>
        <bustap x2="1920" y1="1600" y2="1504" x1="1920" />
        <bustap x2="2000" y1="1600" y2="1504" x1="2000" />
        <bustap x2="2080" y1="1600" y2="1504" x1="2080" />
        <bustap x2="2160" y1="1600" y2="1504" x1="2160" />
        <bustap x2="2240" y1="1600" y2="1504" x1="2240" />
        <bustap x2="2320" y1="1600" y2="1504" x1="2320" />
        <bustap x2="2400" y1="1600" y2="1504" x1="2400" />
        <bustap x2="2480" y1="1600" y2="1504" x1="2480" />
        <branch name="BUTTONS(0)">
            <wire x2="1920" y1="1392" y2="1504" x1="1920" />
        </branch>
        <branch name="BUTTONS(1)">
            <wire x2="2000" y1="1392" y2="1504" x1="2000" />
        </branch>
        <branch name="BUTTONS(2)">
            <wire x2="2080" y1="1392" y2="1504" x1="2080" />
        </branch>
        <branch name="BUTTONS(3)">
            <wire x2="2160" y1="1392" y2="1504" x1="2160" />
        </branch>
        <branch name="BUTTONS(4)">
            <wire x2="2240" y1="1392" y2="1504" x1="2240" />
        </branch>
        <branch name="BUTTONS(5)">
            <wire x2="2320" y1="1392" y2="1504" x1="2320" />
        </branch>
        <branch name="BUTTONS(6)">
            <wire x2="2400" y1="1392" y2="1504" x1="2400" />
        </branch>
        <branch name="BUTTONS(7)">
            <wire x2="2480" y1="1392" y2="1504" x1="2480" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="2576" y1="1152" y2="1152" x1="1936" />
            <wire x2="2576" y1="1152" y2="1552" x1="2576" />
            <wire x2="2688" y1="1552" y2="1552" x1="2576" />
        </branch>
        <instance x="2688" y="1712" name="XLXI_14" orien="R0">
        </instance>
        <instance x="1680" y="1248" name="XLXI_33" orien="R0" />
        <iomarker fontsize="28" x="1568" y="176" name="XLXN_56" orien="R0" />
        <iomarker fontsize="28" x="1568" y="496" name="XLXN_57" orien="R0" />
        <iomarker fontsize="28" x="1568" y="560" name="XLXN_58" orien="R0" />
        <iomarker fontsize="28" x="1568" y="624" name="XLXN_59" orien="R0" />
        <iomarker fontsize="28" x="1904" y="2288" name="LEDS(0)" orien="R90" />
        <iomarker fontsize="28" x="1984" y="2288" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="2064" y="2288" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="2144" y="2288" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="2224" y="2288" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="2304" y="2288" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="2384" y="2288" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="2464" y="2288" name="LEDS(7)" orien="R90" />
        <iomarker fontsize="28" x="1920" y="1392" name="BUTTONS(0)" orien="R270" />
        <iomarker fontsize="28" x="2000" y="1392" name="BUTTONS(1)" orien="R270" />
        <iomarker fontsize="28" x="2080" y="1392" name="BUTTONS(2)" orien="R270" />
        <iomarker fontsize="28" x="2160" y="1392" name="BUTTONS(3)" orien="R270" />
        <iomarker fontsize="28" x="2240" y="1392" name="BUTTONS(4)" orien="R270" />
        <iomarker fontsize="28" x="2320" y="1392" name="BUTTONS(5)" orien="R270" />
        <iomarker fontsize="28" x="2400" y="1392" name="BUTTONS(6)" orien="R270" />
        <iomarker fontsize="28" x="2480" y="1392" name="BUTTONS(7)" orien="R270" />
        <instance x="544" y="304" name="XLXI_3" orien="R0" />
        <branch name="T9">
            <wire x2="80" y1="176" y2="176" x1="64" />
            <wire x2="80" y1="176" y2="976" x1="80" />
            <wire x2="128" y1="976" y2="976" x1="80" />
            <wire x2="592" y1="976" y2="976" x1="128" />
            <wire x2="592" y1="976" y2="1104" x1="592" />
            <wire x2="656" y1="1104" y2="1104" x1="592" />
            <wire x2="656" y1="1104" y2="1424" x1="656" />
            <wire x2="720" y1="1424" y2="1424" x1="656" />
            <wire x2="496" y1="160" y2="176" x1="496" />
            <wire x2="704" y1="176" y2="176" x1="496" />
            <wire x2="704" y1="176" y2="256" x1="704" />
            <wire x2="864" y1="256" y2="256" x1="704" />
            <wire x2="704" y1="256" y2="832" x1="704" />
            <wire x2="1840" y1="832" y2="832" x1="704" />
            <wire x2="720" y1="160" y2="160" x1="496" />
            <wire x2="720" y1="160" y2="1424" x1="720" />
            <wire x2="1872" y1="496" y2="496" x1="1840" />
            <wire x2="1840" y1="496" y2="832" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="64" y="176" name="T9" orien="R180" />
        <branch name="XLXN_187">
            <wire x2="1792" y1="496" y2="560" x1="1792" />
            <wire x2="1872" y1="560" y2="560" x1="1792" />
        </branch>
        <instance x="1728" y="496" name="XLXI_58" orien="R0" />
        <branch name="XLXN_189(7:0)">
            <wire x2="864" y1="736" y2="736" x1="848" />
            <wire x2="848" y1="736" y2="960" x1="848" />
            <wire x2="864" y1="960" y2="960" x1="848" />
            <wire x2="2640" y1="960" y2="960" x1="864" />
            <wire x2="2640" y1="496" y2="496" x1="2256" />
            <wire x2="2640" y1="496" y2="960" x1="2640" />
        </branch>
        <branch name="XLXN_83">
            <wire x2="1344" y1="304" y2="304" x1="1248" />
            <wire x2="1424" y1="304" y2="304" x1="1344" />
            <wire x2="1424" y1="304" y2="1184" x1="1424" />
            <wire x2="1680" y1="1184" y2="1184" x1="1424" />
            <wire x2="1344" y1="304" y2="2128" x1="1344" />
            <wire x2="1472" y1="2128" y2="2128" x1="1344" />
        </branch>
        <instance x="1472" y="2256" name="XLXI_34" orien="R0" />
        <branch name="LEDS(7:0)">
            <wire x2="1328" y1="752" y2="752" x1="1248" />
            <wire x2="1328" y1="752" y2="848" x1="1328" />
            <wire x2="1328" y1="848" y2="848" x1="1248" />
            <wire x2="1248" y1="848" y2="1984" x1="1248" />
            <wire x2="1904" y1="1984" y2="1984" x1="1248" />
            <wire x2="1984" y1="1984" y2="1984" x1="1904" />
            <wire x2="2064" y1="1984" y2="1984" x1="1984" />
            <wire x2="2144" y1="1984" y2="1984" x1="2064" />
            <wire x2="2224" y1="1984" y2="1984" x1="2144" />
            <wire x2="2304" y1="1984" y2="1984" x1="2224" />
            <wire x2="2384" y1="1984" y2="1984" x1="2304" />
            <wire x2="2464" y1="1984" y2="1984" x1="2384" />
            <wire x2="2464" y1="1984" y2="2112" x1="2464" />
            <wire x2="2384" y1="1984" y2="2112" x1="2384" />
            <wire x2="2304" y1="1984" y2="2112" x1="2304" />
            <wire x2="2224" y1="1984" y2="2112" x1="2224" />
            <wire x2="2144" y1="1984" y2="2112" x1="2144" />
            <wire x2="2064" y1="1984" y2="2112" x1="2064" />
            <wire x2="1984" y1="1984" y2="2112" x1="1984" />
            <wire x2="1904" y1="1984" y2="2112" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="800" y="176" name="RESET_n" orien="R180" />
    </sheet>
</drawing>