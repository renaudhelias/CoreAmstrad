<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="T9" />
        <signal name="XLXN_47" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_33" />
        <signal name="ADDRESSES(15:0)" />
        <signal name="ADDRESSES(10:0)" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_81(7:0)" />
        <signal name="XLXN_83" />
        <signal name="XLXN_101" />
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
        <signal name="XLXN_103" />
        <signal name="XLXN_106" />
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
        <signal name="XLXN_136(7:0)" />
        <signal name="XLXN_138(7:0)" />
        <signal name="XLXN_139" />
        <port polarity="Input" name="T9" />
        <port polarity="Output" name="XLXN_56" />
        <port polarity="Output" name="XLXN_57" />
        <port polarity="Output" name="XLXN_58" />
        <port polarity="Output" name="XLXN_59" />
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
            <blockpin signalname="XLXN_101" name="RESET_n" />
            <blockpin signalname="T9" name="CLK_n" />
            <blockpin signalname="XLXN_1" name="CLKEN" />
            <blockpin signalname="XLXN_47" name="WAIT_n" />
            <blockpin signalname="XLXN_47" name="INT_n" />
            <blockpin signalname="XLXN_47" name="NMI_n" />
            <blockpin signalname="XLXN_47" name="BUSRQ_n" />
            <blockpin signalname="XLXN_136(7:0)" name="DI(7:0)" />
            <blockpin signalname="XLXN_56" name="M1_n" />
            <blockpin signalname="XLXN_10" name="MREQ_n" />
            <blockpin signalname="XLXN_83" name="IORQ_n" />
            <blockpin signalname="XLXN_11" name="RD_n" />
            <blockpin signalname="XLXN_33" name="WR_n" />
            <blockpin signalname="XLXN_57" name="RFSH_n" />
            <blockpin signalname="XLXN_58" name="HALT_n" />
            <blockpin signalname="XLXN_59" name="BUSAK_n" />
            <blockpin signalname="ADDRESSES(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_81(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_3">
            <blockpin signalname="XLXN_1" name="P" />
        </block>
        <block symbolname="SIMPLE_ROM" name="XLXI_5">
            <blockpin signalname="T9" name="CLK" />
            <blockpin signalname="XLXN_139" name="ENA" />
            <blockpin signalname="ADDRESSES(10:0)" name="ADDR(10:0)" />
            <blockpin signalname="XLXN_138(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_30">
            <blockpin signalname="XLXN_47" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_31">
            <blockpin signalname="XLXN_101" name="P" />
        </block>
        <block symbolname="nor2" name="XLXI_32">
            <blockpin signalname="XLXN_11" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="XLXN_139" name="O" />
        </block>
        <block symbolname="OPEN_BUS" name="XLXI_12">
            <blockpin signalname="XLXN_139" name="CE" />
            <blockpin signalname="XLXN_138(7:0)" name="I(7:0)" />
            <blockpin signalname="XLXN_136(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="nor2" name="XLXI_34">
            <blockpin signalname="XLXN_33" name="I0" />
            <blockpin signalname="XLXN_83" name="I1" />
            <blockpin signalname="XLXN_106" name="O" />
        </block>
        <block symbolname="ld8ce" name="XLXI_35">
            <blockpin signalname="XLXN_102" name="CLR" />
            <blockpin signalname="XLXN_81(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_103" name="G" />
            <blockpin signalname="XLXN_106" name="GE" />
            <blockpin signalname="LEDS(7:0)" name="Q(7:0)" />
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
            <blockpin signalname="XLXN_136(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="nor2" name="XLXI_33">
            <blockpin signalname="XLXN_83" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="720" y="800" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="400" y1="320" y2="352" x1="400" />
            <wire x2="720" y1="352" y2="352" x1="400" />
        </branch>
        <instance x="336" y="320" name="XLXI_3" orien="R0" />
        <iomarker fontsize="28" x="304" y="192" name="T9" orien="R180" />
        <branch name="T9">
            <wire x2="512" y1="192" y2="192" x1="304" />
            <wire x2="512" y1="192" y2="272" x1="512" />
            <wire x2="720" y1="272" y2="272" x1="512" />
            <wire x2="560" y1="192" y2="192" x1="512" />
            <wire x2="560" y1="192" y2="864" x1="560" />
            <wire x2="1712" y1="864" y2="864" x1="560" />
            <wire x2="1712" y1="512" y2="864" x1="1712" />
            <wire x2="1728" y1="512" y2="512" x1="1712" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="368" y1="576" y2="592" x1="368" />
            <wire x2="512" y1="592" y2="592" x1="368" />
            <wire x2="720" y1="432" y2="432" x1="512" />
            <wire x2="512" y1="432" y2="512" x1="512" />
            <wire x2="512" y1="512" y2="592" x1="512" />
            <wire x2="592" y1="512" y2="512" x1="512" />
            <wire x2="592" y1="512" y2="672" x1="592" />
            <wire x2="720" y1="672" y2="672" x1="592" />
            <wire x2="640" y1="512" y2="512" x1="592" />
            <wire x2="640" y1="512" y2="592" x1="640" />
            <wire x2="720" y1="592" y2="592" x1="640" />
            <wire x2="720" y1="512" y2="512" x1="640" />
        </branch>
        <instance x="1728" y="672" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_10">
            <wire x2="1552" y1="256" y2="256" x1="1104" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1472" y1="384" y2="384" x1="1104" />
            <wire x2="1472" y1="368" y2="368" x1="1376" />
            <wire x2="1472" y1="368" y2="384" x1="1472" />
            <wire x2="1376" y1="368" y2="1136" x1="1376" />
            <wire x2="1536" y1="1136" y2="1136" x1="1376" />
            <wire x2="1552" y1="320" y2="320" x1="1472" />
            <wire x2="1472" y1="320" y2="368" x1="1472" />
        </branch>
        <branch name="ADDRESSES(15:0)">
            <wire x2="1584" y1="704" y2="704" x1="1104" />
            <wire x2="1584" y1="640" y2="704" x1="1584" />
        </branch>
        <bustap x2="1680" y1="640" y2="640" x1="1584" />
        <branch name="ADDRESSES(10:0)">
            <wire x2="1728" y1="640" y2="640" x1="1680" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="1424" y1="192" y2="192" x1="1104" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1424" y1="512" y2="512" x1="1104" />
        </branch>
        <branch name="XLXN_58">
            <wire x2="1424" y1="576" y2="576" x1="1104" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1424" y1="640" y2="640" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1424" y="192" name="XLXN_56" orien="R0" />
        <iomarker fontsize="28" x="1424" y="512" name="XLXN_57" orien="R0" />
        <iomarker fontsize="28" x="1424" y="576" name="XLXN_58" orien="R0" />
        <iomarker fontsize="28" x="1424" y="640" name="XLXN_59" orien="R0" />
        <branch name="XLXN_81(7:0)">
            <wire x2="1120" y1="768" y2="768" x1="1104" />
            <wire x2="1120" y1="768" y2="2048" x1="1120" />
            <wire x2="2624" y1="2048" y2="2048" x1="1120" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1248" y1="448" y2="448" x1="1104" />
            <wire x2="1248" y1="448" y2="2208" x1="1248" />
            <wire x2="1328" y1="2208" y2="2208" x1="1248" />
        </branch>
        <instance x="304" y="576" name="XLXI_30" orien="R0" />
        <instance x="592" y="192" name="XLXI_31" orien="R0" />
        <branch name="XLXN_101">
            <wire x2="656" y1="192" y2="256" x1="656" />
            <wire x2="704" y1="256" y2="256" x1="656" />
            <wire x2="704" y1="192" y2="256" x1="704" />
            <wire x2="720" y1="192" y2="192" x1="704" />
        </branch>
        <instance x="1552" y="384" name="XLXI_32" orien="R0" />
        <instance x="2960" y="624" name="XLXI_12" orien="R0">
        </instance>
        <branch name="LEDS(0)">
            <wire x2="1760" y1="2224" y2="2304" x1="1760" />
        </branch>
        <branch name="LEDS(1)">
            <wire x2="1840" y1="2224" y2="2304" x1="1840" />
        </branch>
        <branch name="LEDS(2)">
            <wire x2="1920" y1="2224" y2="2304" x1="1920" />
        </branch>
        <branch name="LEDS(3)">
            <wire x2="2000" y1="2224" y2="2304" x1="2000" />
        </branch>
        <branch name="LEDS(4)">
            <wire x2="2080" y1="2224" y2="2304" x1="2080" />
        </branch>
        <branch name="LEDS(5)">
            <wire x2="2160" y1="2224" y2="2304" x1="2160" />
        </branch>
        <branch name="LEDS(6)">
            <wire x2="2240" y1="2224" y2="2304" x1="2240" />
        </branch>
        <branch name="LEDS(7)">
            <wire x2="2320" y1="2224" y2="2304" x1="2320" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="1840" y1="2112" y2="2112" x1="1760" />
            <wire x2="1840" y1="2112" y2="2128" x1="1840" />
            <wire x2="1920" y1="2112" y2="2112" x1="1840" />
            <wire x2="1920" y1="2112" y2="2128" x1="1920" />
            <wire x2="2000" y1="2112" y2="2112" x1="1920" />
            <wire x2="2000" y1="2112" y2="2128" x1="2000" />
            <wire x2="2080" y1="2112" y2="2112" x1="2000" />
            <wire x2="2080" y1="2112" y2="2128" x1="2080" />
            <wire x2="2160" y1="2112" y2="2112" x1="2080" />
            <wire x2="2160" y1="2112" y2="2128" x1="2160" />
            <wire x2="2240" y1="2112" y2="2112" x1="2160" />
            <wire x2="2240" y1="2112" y2="2128" x1="2240" />
            <wire x2="2320" y1="2112" y2="2112" x1="2240" />
            <wire x2="2320" y1="2112" y2="2128" x1="2320" />
            <wire x2="2528" y1="2112" y2="2112" x1="2320" />
            <wire x2="2528" y1="2112" y2="2368" x1="2528" />
            <wire x2="3008" y1="2368" y2="2368" x1="2528" />
            <wire x2="1760" y1="2112" y2="2128" x1="1760" />
            <wire x2="3024" y1="2048" y2="2048" x1="3008" />
            <wire x2="3024" y1="2048" y2="2352" x1="3024" />
            <wire x2="3024" y1="2352" y2="2352" x1="3008" />
            <wire x2="3008" y1="2352" y2="2368" x1="3008" />
        </branch>
        <bustap x2="1760" y1="2128" y2="2224" x1="1760" />
        <bustap x2="1840" y1="2128" y2="2224" x1="1840" />
        <bustap x2="1920" y1="2128" y2="2224" x1="1920" />
        <bustap x2="2000" y1="2128" y2="2224" x1="2000" />
        <bustap x2="2080" y1="2128" y2="2224" x1="2080" />
        <bustap x2="2160" y1="2128" y2="2224" x1="2160" />
        <bustap x2="2240" y1="2128" y2="2224" x1="2240" />
        <bustap x2="2320" y1="2128" y2="2224" x1="2320" />
        <instance x="1328" y="2272" name="XLXI_34" orien="R0" />
        <instance x="2624" y="2304" name="XLXI_35" orien="R0" />
        <instance x="2560" y="2448" name="XLXI_36" orien="R0" />
        <instance x="2368" y="2256" name="XLXI_37" orien="R0" />
        <branch name="XLXN_102">
            <wire x2="2624" y1="2272" y2="2304" x1="2624" />
            <wire x2="2624" y1="2304" y2="2320" x1="2624" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="2432" y1="2256" y2="2272" x1="2432" />
            <wire x2="2560" y1="2272" y2="2272" x1="2432" />
            <wire x2="2624" y1="2176" y2="2176" x1="2560" />
            <wire x2="2560" y1="2176" y2="2272" x1="2560" />
        </branch>
        <branch name="XLXN_106">
            <wire x2="1600" y1="2176" y2="2176" x1="1584" />
            <wire x2="1664" y1="2176" y2="2176" x1="1600" />
            <wire x2="1664" y1="2176" y2="2288" x1="1664" />
            <wire x2="2480" y1="2288" y2="2288" x1="1664" />
            <wire x2="2592" y1="2144" y2="2144" x1="2480" />
            <wire x2="2480" y1="2144" y2="2288" x1="2480" />
            <wire x2="2624" y1="2112" y2="2112" x1="2592" />
            <wire x2="2592" y1="2112" y2="2144" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="1760" y="2304" name="LEDS(0)" orien="R90" />
        <iomarker fontsize="28" x="1840" y="2304" name="LEDS(1)" orien="R90" />
        <iomarker fontsize="28" x="1920" y="2304" name="LEDS(2)" orien="R90" />
        <iomarker fontsize="28" x="2000" y="2304" name="LEDS(3)" orien="R90" />
        <iomarker fontsize="28" x="2080" y="2304" name="LEDS(4)" orien="R90" />
        <iomarker fontsize="28" x="2160" y="2304" name="LEDS(5)" orien="R90" />
        <iomarker fontsize="28" x="2240" y="2304" name="LEDS(6)" orien="R90" />
        <iomarker fontsize="28" x="2320" y="2304" name="LEDS(7)" orien="R90" />
        <branch name="XLXN_83">
            <wire x2="1200" y1="320" y2="320" x1="1104" />
            <wire x2="1200" y1="320" y2="2144" x1="1200" />
            <wire x2="1328" y1="2144" y2="2144" x1="1200" />
            <wire x2="1280" y1="320" y2="320" x1="1200" />
            <wire x2="1280" y1="320" y2="1200" x1="1280" />
            <wire x2="1536" y1="1200" y2="1200" x1="1280" />
        </branch>
        <branch name="BUTTONS(7:0)">
            <wire x2="1776" y1="1616" y2="1632" x1="1776" />
            <wire x2="1856" y1="1632" y2="1632" x1="1776" />
            <wire x2="1936" y1="1632" y2="1632" x1="1856" />
            <wire x2="2016" y1="1632" y2="1632" x1="1936" />
            <wire x2="2096" y1="1632" y2="1632" x1="2016" />
            <wire x2="2176" y1="1632" y2="1632" x1="2096" />
            <wire x2="2256" y1="1632" y2="1632" x1="2176" />
            <wire x2="2336" y1="1632" y2="1632" x1="2256" />
            <wire x2="2544" y1="1632" y2="1632" x1="2336" />
            <wire x2="1856" y1="1616" y2="1632" x1="1856" />
            <wire x2="1936" y1="1616" y2="1632" x1="1936" />
            <wire x2="2016" y1="1616" y2="1632" x1="2016" />
            <wire x2="2096" y1="1616" y2="1632" x1="2096" />
            <wire x2="2176" y1="1616" y2="1632" x1="2176" />
            <wire x2="2256" y1="1616" y2="1632" x1="2256" />
            <wire x2="2336" y1="1616" y2="1632" x1="2336" />
        </branch>
        <bustap x2="1776" y1="1616" y2="1520" x1="1776" />
        <bustap x2="1856" y1="1616" y2="1520" x1="1856" />
        <bustap x2="1936" y1="1616" y2="1520" x1="1936" />
        <bustap x2="2016" y1="1616" y2="1520" x1="2016" />
        <bustap x2="2096" y1="1616" y2="1520" x1="2096" />
        <bustap x2="2176" y1="1616" y2="1520" x1="2176" />
        <bustap x2="2256" y1="1616" y2="1520" x1="2256" />
        <bustap x2="2336" y1="1616" y2="1520" x1="2336" />
        <branch name="BUTTONS(0)">
            <wire x2="1776" y1="1408" y2="1520" x1="1776" />
        </branch>
        <branch name="BUTTONS(1)">
            <wire x2="1856" y1="1408" y2="1520" x1="1856" />
        </branch>
        <branch name="BUTTONS(2)">
            <wire x2="1936" y1="1408" y2="1520" x1="1936" />
        </branch>
        <branch name="BUTTONS(3)">
            <wire x2="2016" y1="1408" y2="1520" x1="2016" />
        </branch>
        <branch name="BUTTONS(4)">
            <wire x2="2096" y1="1408" y2="1520" x1="2096" />
        </branch>
        <branch name="BUTTONS(5)">
            <wire x2="2176" y1="1408" y2="1520" x1="2176" />
        </branch>
        <branch name="BUTTONS(6)">
            <wire x2="2256" y1="1408" y2="1520" x1="2256" />
        </branch>
        <branch name="BUTTONS(7)">
            <wire x2="2336" y1="1408" y2="1520" x1="2336" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="2432" y1="1168" y2="1168" x1="1792" />
            <wire x2="2432" y1="1168" y2="1568" x1="2432" />
            <wire x2="2544" y1="1568" y2="1568" x1="2432" />
        </branch>
        <instance x="2544" y="1728" name="XLXI_14" orien="R0">
        </instance>
        <instance x="1536" y="1264" name="XLXI_33" orien="R0" />
        <iomarker fontsize="28" x="1776" y="1408" name="BUTTONS(0)" orien="R270" />
        <iomarker fontsize="28" x="1856" y="1408" name="BUTTONS(1)" orien="R270" />
        <iomarker fontsize="28" x="1936" y="1408" name="BUTTONS(2)" orien="R270" />
        <iomarker fontsize="28" x="2016" y="1408" name="BUTTONS(3)" orien="R270" />
        <iomarker fontsize="28" x="2096" y="1408" name="BUTTONS(4)" orien="R270" />
        <iomarker fontsize="28" x="2176" y="1408" name="BUTTONS(5)" orien="R270" />
        <iomarker fontsize="28" x="2256" y="1408" name="BUTTONS(6)" orien="R270" />
        <iomarker fontsize="28" x="2336" y="1408" name="BUTTONS(7)" orien="R270" />
        <branch name="XLXN_136(7:0)">
            <wire x2="720" y1="752" y2="752" x1="640" />
            <wire x2="640" y1="752" y2="1072" x1="640" />
            <wire x2="2976" y1="1072" y2="1072" x1="640" />
            <wire x2="640" y1="1072" y2="1680" x1="640" />
            <wire x2="688" y1="1680" y2="1680" x1="640" />
            <wire x2="688" y1="1680" y2="1696" x1="688" />
            <wire x2="2544" y1="1696" y2="1696" x1="688" />
            <wire x2="2960" y1="592" y2="592" x1="2896" />
            <wire x2="2896" y1="592" y2="688" x1="2896" />
            <wire x2="2976" y1="688" y2="688" x1="2896" />
            <wire x2="2976" y1="688" y2="1056" x1="2976" />
            <wire x2="2976" y1="1056" y2="1072" x1="2976" />
        </branch>
        <branch name="XLXN_138(7:0)">
            <wire x2="2528" y1="512" y2="512" x1="2112" />
            <wire x2="2528" y1="512" y2="528" x1="2528" />
            <wire x2="2960" y1="528" y2="528" x1="2528" />
        </branch>
        <branch name="XLXN_139">
            <wire x2="1632" y1="432" y2="576" x1="1632" />
            <wire x2="1728" y1="576" y2="576" x1="1632" />
            <wire x2="1856" y1="432" y2="432" x1="1632" />
            <wire x2="1856" y1="288" y2="288" x1="1808" />
            <wire x2="2384" y1="288" y2="288" x1="1856" />
            <wire x2="2384" y1="288" y2="464" x1="2384" />
            <wire x2="2960" y1="464" y2="464" x1="2384" />
            <wire x2="1856" y1="288" y2="432" x1="1856" />
        </branch>
    </sheet>
</drawing>