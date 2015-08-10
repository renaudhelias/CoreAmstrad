<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(0:0)" />
        <signal name="DI(7:0)" />
        <signal name="DI(0)" />
        <signal name="DI(1)" />
        <signal name="DI(2)" />
        <signal name="DI(3)" />
        <signal name="DI(4)" />
        <signal name="DI(5)" />
        <signal name="DI(6)" />
        <signal name="DI(7)" />
        <signal name="AI(10:0)" />
        <signal name="CLKI" />
        <signal name="XLXN_14" />
        <signal name="XLXN_17" />
        <signal name="CLKO" />
        <signal name="AO(10:0)">
        </signal>
        <signal name="XLXN_23(0:0)" />
        <signal name="zero,zero,zero,zero,zero,zero,zero,zero" />
        <signal name="XLXN_25(0:0)" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28(0:0)" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="zero" />
        <signal name="WR" />
        <signal name="AI(12)" />
        <signal name="AI(11)" />
        <signal name="XLXN_47" />
        <signal name="WR_00" />
        <signal name="WR_01" />
        <signal name="WR_10" />
        <signal name="XLXN_53" />
        <signal name="AI(12:0)" />
        <signal name="DO(7:0)" />
        <signal name="XLXN_76(7:0)" />
        <signal name="XLXN_77(7:0)" />
        <signal name="XLXN_78(7:0)" />
        <signal name="XLXN_79(7:0)" />
        <signal name="AO(12:0)" />
        <signal name="AO(12)" />
        <signal name="AO(11)" />
        <port polarity="Input" name="DI(7:0)" />
        <port polarity="Input" name="CLKI" />
        <port polarity="Input" name="CLKO" />
        <port polarity="Input" name="WR" />
        <port polarity="Input" name="AI(12:0)" />
        <port polarity="Output" name="DO(7:0)" />
        <port polarity="Input" name="AO(12:0)" />
        <blockdef name="ramb16_s9_s9">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="64" x="544" y="-960" height="32" />
            <line x2="64" y1="-1152" y2="-640" x1="64" />
            <rect width="64" x="0" y="-1104" height="32" />
            <rect width="64" x="544" y="-880" height="32" />
            <line x2="64" y1="-640" y2="-640" x1="128" />
            <line x2="128" y1="-576" y2="-640" x1="128" />
            <line x2="128" y1="-576" y2="-576" x1="64" />
            <line x2="64" y1="-64" y2="-576" x1="64" />
            <line x2="64" y1="-64" y2="-64" x1="544" />
            <line x2="544" y1="-576" y2="-64" x1="544" />
            <line x2="544" y1="-576" y2="-576" x1="480" />
            <line x2="480" y1="-640" y2="-576" x1="480" />
            <line x2="480" y1="-640" y2="-640" x1="544" />
            <line x2="64" y1="-1152" y2="-1152" x1="544" />
            <line x2="544" y1="-640" y2="-1152" x1="544" />
            <rect width="64" x="544" y="-368" height="32" />
            <rect width="64" x="0" y="-144" height="32" />
            <rect width="64" x="0" y="-208" height="32" />
            <line x2="64" y1="-832" y2="-848" x1="80" />
            <line x2="80" y1="-816" y2="-832" x1="64" />
            <rect width="64" x="0" y="-720" height="32" />
            <rect width="64" x="0" y="-784" height="32" />
            <rect width="64" x="0" y="-272" height="32" />
            <line x2="64" y1="-320" y2="-336" x1="80" />
            <line x2="80" y1="-304" y2="-320" x1="64" />
            <rect width="64" x="544" y="-432" height="32" />
            <line x2="544" y1="-944" y2="-944" x1="608" />
            <line x2="64" y1="-1088" y2="-1088" x1="0" />
            <line x2="544" y1="-864" y2="-864" x1="608" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
            <line x2="64" y1="-768" y2="-768" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="544" y1="-352" y2="-352" x1="608" />
            <line x2="544" y1="-416" y2="-416" x1="608" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-832" y2="-832" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
        </blockdef>
        <blockdef name="xor8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <arc ex="48" ey="-336" sx="48" sy="-240" r="56" cx="16" cy="-288" />
            <arc ex="64" ey="-336" sx="64" sy="-240" r="56" cx="32" cy="-288" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="60" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-384" y2="-384" x1="0" />
            <line x2="208" y1="-288" y2="-288" x1="256" />
            <arc ex="208" ey="-288" sx="128" sy="-240" r="88" cx="132" cy="-328" />
            <arc ex="128" ey="-336" sx="208" sy="-288" r="88" cx="132" cy="-248" />
            <line x2="64" y1="-240" y2="-240" x1="128" />
            <line x2="64" y1="-336" y2="-336" x1="128" />
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="48" y1="-448" y2="-448" x1="0" />
            <line x2="48" y1="-512" y2="-512" x1="0" />
            <line x2="48" y1="-64" y2="-240" x1="48" />
            <line x2="48" y1="-336" y2="-512" x1="48" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="SELECT8">
            <timestamp>2011-11-26T13:29:18</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="ramb16_s9_s9" name="XLXI_1">
            <blockpin signalname="AO(10:0)" name="ADDRA(10:0)" />
            <blockpin signalname="AI(10:0)" name="ADDRB(10:0)" />
            <blockpin signalname="CLKO" name="CLKA" />
            <blockpin signalname="CLKI" name="CLKB" />
            <blockpin signalname="zero,zero,zero,zero,zero,zero,zero,zero" name="DIA(7:0)" />
            <blockpin signalname="DI(7:0)" name="DIB(7:0)" />
            <blockpin signalname="XLXN_23(0:0)" name="DIPA(0:0)" />
            <blockpin signalname="XLXN_1(0:0)" name="DIPB(0:0)" />
            <blockpin signalname="XLXN_17" name="ENA" />
            <blockpin signalname="XLXN_17" name="ENB" />
            <blockpin signalname="XLXN_14" name="SSRA" />
            <blockpin signalname="XLXN_17" name="SSRB" />
            <blockpin signalname="XLXN_14" name="WEA" />
            <blockpin signalname="WR_00" name="WEB" />
            <blockpin signalname="XLXN_78(7:0)" name="DOA(7:0)" />
            <blockpin name="DOB(7:0)" />
            <blockpin name="DOPA(0:0)" />
            <blockpin name="DOPB(0:0)" />
        </block>
        <block symbolname="xor8" name="XLXI_2">
            <blockpin signalname="DI(7)" name="I0" />
            <blockpin signalname="DI(6)" name="I1" />
            <blockpin signalname="DI(5)" name="I2" />
            <blockpin signalname="DI(4)" name="I3" />
            <blockpin signalname="DI(3)" name="I4" />
            <blockpin signalname="DI(2)" name="I5" />
            <blockpin signalname="DI(1)" name="I6" />
            <blockpin signalname="DI(0)" name="I7" />
            <blockpin signalname="XLXN_1(0:0)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_3">
            <blockpin signalname="XLXN_14" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_4">
            <blockpin signalname="XLXN_17" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_23(0:0)" name="G" />
        </block>
        <block symbolname="ramb16_s9_s9" name="XLXI_9">
            <blockpin signalname="AO(10:0)" name="ADDRA(10:0)" />
            <blockpin signalname="AI(10:0)" name="ADDRB(10:0)" />
            <blockpin signalname="CLKO" name="CLKA" />
            <blockpin signalname="CLKI" name="CLKB" />
            <blockpin signalname="zero,zero,zero,zero,zero,zero,zero,zero" name="DIA(7:0)" />
            <blockpin signalname="DI(7:0)" name="DIB(7:0)" />
            <blockpin signalname="XLXN_25(0:0)" name="DIPA(0:0)" />
            <blockpin signalname="XLXN_1(0:0)" name="DIPB(0:0)" />
            <blockpin signalname="XLXN_27" name="ENA" />
            <blockpin signalname="XLXN_27" name="ENB" />
            <blockpin signalname="XLXN_26" name="SSRA" />
            <blockpin signalname="XLXN_27" name="SSRB" />
            <blockpin signalname="XLXN_26" name="WEA" />
            <blockpin signalname="WR_10" name="WEB" />
            <blockpin signalname="XLXN_76(7:0)" name="DOA(7:0)" />
            <blockpin name="DOB(7:0)" />
            <blockpin name="DOPA(0:0)" />
            <blockpin name="DOPB(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_10">
            <blockpin signalname="XLXN_25(0:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_11">
            <blockpin signalname="XLXN_26" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_12">
            <blockpin signalname="XLXN_27" name="P" />
        </block>
        <block symbolname="ramb16_s9_s9" name="XLXI_13">
            <blockpin signalname="AO(10:0)" name="ADDRA(10:0)" />
            <blockpin signalname="AI(10:0)" name="ADDRB(10:0)" />
            <blockpin signalname="CLKO" name="CLKA" />
            <blockpin signalname="CLKI" name="CLKB" />
            <blockpin signalname="zero,zero,zero,zero,zero,zero,zero,zero" name="DIA(7:0)" />
            <blockpin signalname="DI(7:0)" name="DIB(7:0)" />
            <blockpin signalname="XLXN_28(0:0)" name="DIPA(0:0)" />
            <blockpin signalname="XLXN_1(0:0)" name="DIPB(0:0)" />
            <blockpin signalname="XLXN_30" name="ENA" />
            <blockpin signalname="XLXN_30" name="ENB" />
            <blockpin signalname="XLXN_29" name="SSRA" />
            <blockpin signalname="XLXN_30" name="SSRB" />
            <blockpin signalname="XLXN_29" name="WEA" />
            <blockpin signalname="WR_01" name="WEB" />
            <blockpin signalname="XLXN_79(7:0)" name="DOA(7:0)" />
            <blockpin name="DOB(7:0)" />
            <blockpin name="DOPA(0:0)" />
            <blockpin name="DOPB(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_14">
            <blockpin signalname="XLXN_28(0:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="XLXN_29" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_16">
            <blockpin signalname="XLXN_30" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_20">
            <blockpin signalname="AI(12)" name="I" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_21">
            <blockpin signalname="AI(11)" name="I" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_22">
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="XLXN_53" name="I1" />
            <blockpin signalname="WR" name="I2" />
            <blockpin signalname="WR_00" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_23">
            <blockpin signalname="AI(11)" name="I0" />
            <blockpin signalname="XLXN_53" name="I1" />
            <blockpin signalname="WR" name="I2" />
            <blockpin signalname="WR_01" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_24">
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="AI(12)" name="I1" />
            <blockpin signalname="WR" name="I2" />
            <blockpin signalname="WR_10" name="O" />
        </block>
        <block symbolname="SELECT8" name="XLXI_25">
            <blockpin signalname="AO(12)" name="s1" />
            <blockpin signalname="XLXN_76(7:0)" name="DATA1(7:0)" />
            <blockpin signalname="XLXN_77(7:0)" name="DATA2(7:0)" />
            <blockpin signalname="DO(7:0)" name="DATA0(7:0)" />
        </block>
        <block symbolname="SELECT8" name="XLXI_26">
            <blockpin signalname="AO(11)" name="s1" />
            <blockpin signalname="XLXN_79(7:0)" name="DATA1(7:0)" />
            <blockpin signalname="XLXN_78(7:0)" name="DATA2(7:0)" />
            <blockpin signalname="XLXN_77(7:0)" name="DATA0(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="944" y="1744" name="XLXI_1" orien="R0" />
        <instance x="480" y="2048" name="XLXI_2" orien="R0" />
        <branch name="XLXN_1(0:0)">
            <wire x2="832" y1="1760" y2="1760" x1="736" />
            <wire x2="832" y1="1760" y2="3008" x1="832" />
            <wire x2="2384" y1="3008" y2="3008" x1="832" />
            <wire x2="2448" y1="1760" y2="1760" x1="832" />
            <wire x2="832" y1="1616" y2="1760" x1="832" />
            <wire x2="944" y1="1616" y2="1616" x1="832" />
            <wire x2="2448" y1="1456" y2="1760" x1="2448" />
            <wire x2="4064" y1="1456" y2="1456" x1="2448" />
        </branch>
        <branch name="DI(7:0)">
            <wire x2="896" y1="1552" y2="1552" x1="832" />
            <wire x2="944" y1="1552" y2="1552" x1="896" />
            <wire x2="896" y1="1552" y2="1712" x1="896" />
            <wire x2="896" y1="1712" y2="2944" x1="896" />
            <wire x2="2384" y1="2944" y2="2944" x1="896" />
            <wire x2="2368" y1="1712" y2="1712" x1="896" />
            <wire x2="2368" y1="1392" y2="1712" x1="2368" />
            <wire x2="4064" y1="1392" y2="1392" x1="2368" />
        </branch>
        <branch name="DI(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1536" type="branch" />
            <wire x2="480" y1="1536" y2="1536" x1="448" />
        </branch>
        <branch name="DI(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1600" type="branch" />
            <wire x2="480" y1="1600" y2="1600" x1="448" />
        </branch>
        <branch name="DI(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1664" type="branch" />
            <wire x2="480" y1="1664" y2="1664" x1="448" />
        </branch>
        <branch name="DI(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1728" type="branch" />
            <wire x2="480" y1="1728" y2="1728" x1="448" />
        </branch>
        <branch name="DI(4)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1792" type="branch" />
            <wire x2="480" y1="1792" y2="1792" x1="448" />
        </branch>
        <branch name="DI(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1856" type="branch" />
            <wire x2="480" y1="1856" y2="1856" x1="448" />
        </branch>
        <branch name="DI(6)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1920" type="branch" />
            <wire x2="480" y1="1920" y2="1920" x1="448" />
        </branch>
        <branch name="DI(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="1984" type="branch" />
            <wire x2="480" y1="1984" y2="1984" x1="448" />
        </branch>
        <branch name="AI(10:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="160" y="1488" type="branch" />
            <wire x2="272" y1="1488" y2="1488" x1="160" />
            <wire x2="272" y1="1488" y2="2112" x1="272" />
            <wire x2="1664" y1="2112" y2="2112" x1="272" />
            <wire x2="1664" y1="2112" y2="2880" x1="1664" />
            <wire x2="2384" y1="2880" y2="2880" x1="1664" />
            <wire x2="944" y1="1488" y2="1488" x1="272" />
            <wire x2="4064" y1="1328" y2="1328" x1="1664" />
            <wire x2="1664" y1="1328" y2="2112" x1="1664" />
        </branch>
        <branch name="CLKI">
            <wire x2="256" y1="1424" y2="1424" x1="176" />
            <wire x2="944" y1="1424" y2="1424" x1="256" />
            <wire x2="256" y1="1424" y2="2160" x1="256" />
            <wire x2="256" y1="2160" y2="2816" x1="256" />
            <wire x2="2384" y1="2816" y2="2816" x1="256" />
            <wire x2="1728" y1="2160" y2="2160" x1="256" />
            <wire x2="4064" y1="1264" y2="1264" x1="1728" />
            <wire x2="1728" y1="1264" y2="2160" x1="1728" />
        </branch>
        <instance x="688" y="784" name="XLXI_3" orien="R90" />
        <branch name="XLXN_14">
            <wire x2="864" y1="848" y2="848" x1="816" />
            <wire x2="944" y1="848" y2="848" x1="864" />
            <wire x2="944" y1="720" y2="720" x1="864" />
            <wire x2="864" y1="720" y2="848" x1="864" />
        </branch>
        <instance x="544" y="848" name="XLXI_4" orien="R270" />
        <branch name="XLXN_17">
            <wire x2="592" y1="784" y2="784" x1="544" />
            <wire x2="592" y1="784" y2="1360" x1="592" />
            <wire x2="944" y1="1360" y2="1360" x1="592" />
            <wire x2="624" y1="784" y2="784" x1="592" />
            <wire x2="624" y1="784" y2="1296" x1="624" />
            <wire x2="944" y1="1296" y2="1296" x1="624" />
            <wire x2="944" y1="784" y2="784" x1="624" />
        </branch>
        <iomarker fontsize="28" x="832" y="1552" name="DI(7:0)" orien="R180" />
        <branch name="CLKO">
            <wire x2="240" y1="912" y2="912" x1="176" />
            <wire x2="944" y1="912" y2="912" x1="240" />
            <wire x2="1856" y1="464" y2="464" x1="240" />
            <wire x2="1856" y1="464" y2="752" x1="1856" />
            <wire x2="4064" y1="752" y2="752" x1="1856" />
            <wire x2="1856" y1="752" y2="2304" x1="1856" />
            <wire x2="2384" y1="2304" y2="2304" x1="1856" />
            <wire x2="240" y1="464" y2="912" x1="240" />
        </branch>
        <branch name="AO(10:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="192" y="976" type="branch" />
            <wire x2="272" y1="976" y2="976" x1="192" />
            <wire x2="944" y1="976" y2="976" x1="272" />
            <wire x2="1808" y1="480" y2="480" x1="272" />
            <wire x2="1808" y1="480" y2="816" x1="1808" />
            <wire x2="4064" y1="816" y2="816" x1="1808" />
            <wire x2="1808" y1="816" y2="2368" x1="1808" />
            <wire x2="2384" y1="2368" y2="2368" x1="1808" />
            <wire x2="272" y1="480" y2="976" x1="272" />
        </branch>
        <instance x="752" y="592" name="XLXI_5" orien="R90" />
        <branch name="zero,zero,zero,zero,zero,zero,zero,zero">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="384" y="1040" type="branch" />
            <wire x2="416" y1="1040" y2="1040" x1="384" />
            <wire x2="944" y1="1040" y2="1040" x1="416" />
            <wire x2="416" y1="512" y2="1040" x1="416" />
            <wire x2="1776" y1="512" y2="512" x1="416" />
            <wire x2="1776" y1="512" y2="880" x1="1776" />
            <wire x2="4064" y1="880" y2="880" x1="1776" />
            <wire x2="1776" y1="880" y2="2432" x1="1776" />
            <wire x2="2384" y1="2432" y2="2432" x1="1776" />
        </branch>
        <branch name="XLXN_23(0:0)">
            <wire x2="944" y1="656" y2="656" x1="880" />
        </branch>
        <branch name="XLXN_25(0:0)">
            <wire x2="2384" y1="2048" y2="2048" x1="2320" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="2304" y1="2240" y2="2240" x1="2256" />
            <wire x2="2384" y1="2240" y2="2240" x1="2304" />
            <wire x2="2304" y1="2112" y2="2240" x1="2304" />
            <wire x2="2384" y1="2112" y2="2112" x1="2304" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="2032" y1="2176" y2="2176" x1="1984" />
            <wire x2="2064" y1="2176" y2="2176" x1="2032" />
            <wire x2="2384" y1="2176" y2="2176" x1="2064" />
            <wire x2="2064" y1="2176" y2="2688" x1="2064" />
            <wire x2="2384" y1="2688" y2="2688" x1="2064" />
            <wire x2="2032" y1="2176" y2="2752" x1="2032" />
            <wire x2="2384" y1="2752" y2="2752" x1="2032" />
        </branch>
        <instance x="2384" y="3136" name="XLXI_9" orien="R0" />
        <instance x="2192" y="1984" name="XLXI_10" orien="R90" />
        <instance x="2128" y="2176" name="XLXI_11" orien="R90" />
        <instance x="1984" y="2240" name="XLXI_12" orien="R270" />
        <branch name="XLXN_28(0:0)">
            <wire x2="4064" y1="496" y2="496" x1="4000" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="3984" y1="688" y2="688" x1="3936" />
            <wire x2="4064" y1="688" y2="688" x1="3984" />
            <wire x2="3984" y1="560" y2="688" x1="3984" />
            <wire x2="4064" y1="560" y2="560" x1="3984" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="3712" y1="624" y2="624" x1="3664" />
            <wire x2="3744" y1="624" y2="624" x1="3712" />
            <wire x2="4064" y1="624" y2="624" x1="3744" />
            <wire x2="3744" y1="624" y2="1136" x1="3744" />
            <wire x2="4064" y1="1136" y2="1136" x1="3744" />
            <wire x2="3712" y1="624" y2="1200" x1="3712" />
            <wire x2="4064" y1="1200" y2="1200" x1="3712" />
        </branch>
        <instance x="4064" y="1584" name="XLXI_13" orien="R0" />
        <instance x="3872" y="432" name="XLXI_14" orien="R90" />
        <instance x="3808" y="624" name="XLXI_15" orien="R90" />
        <instance x="3664" y="688" name="XLXI_16" orien="R270" />
        <iomarker fontsize="28" x="176" y="1424" name="CLKI" orien="R180" />
        <instance x="240" y="3376" name="XLXI_6" orien="R0" />
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="304" y="3184" type="branch" />
            <wire x2="304" y1="3184" y2="3248" x1="304" />
        </branch>
        <branch name="WR">
            <wire x2="4288" y1="2240" y2="2240" x1="3728" />
            <wire x2="4400" y1="2240" y2="2240" x1="4288" />
            <wire x2="4288" y1="2240" y2="2496" x1="4288" />
            <wire x2="4288" y1="2496" y2="2752" x1="4288" />
            <wire x2="4384" y1="2752" y2="2752" x1="4288" />
            <wire x2="4400" y1="2496" y2="2496" x1="4288" />
        </branch>
        <instance x="3856" y="2528" name="XLXI_20" orien="R0" />
        <instance x="3856" y="2640" name="XLXI_21" orien="R0" />
        <branch name="XLXN_47">
            <wire x2="4256" y1="2608" y2="2608" x1="4080" />
            <wire x2="4256" y1="2608" y2="2880" x1="4256" />
            <wire x2="4384" y1="2880" y2="2880" x1="4256" />
            <wire x2="4256" y1="2368" y2="2608" x1="4256" />
            <wire x2="4400" y1="2368" y2="2368" x1="4256" />
        </branch>
        <instance x="4400" y="2432" name="XLXI_22" orien="R0" />
        <instance x="4400" y="2688" name="XLXI_23" orien="R0" />
        <instance x="4384" y="2944" name="XLXI_24" orien="R0" />
        <branch name="WR_00">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4784" y="2304" type="branch" />
            <wire x2="944" y1="1232" y2="1232" x1="928" />
            <wire x2="928" y1="1232" y2="1744" x1="928" />
            <wire x2="4752" y1="1744" y2="1744" x1="928" />
            <wire x2="4752" y1="1744" y2="2304" x1="4752" />
            <wire x2="4784" y1="2304" y2="2304" x1="4752" />
            <wire x2="4752" y1="2304" y2="2304" x1="4656" />
        </branch>
        <branch name="WR_01">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4784" y="2560" type="branch" />
            <wire x2="4064" y1="1072" y2="1072" x1="4016" />
            <wire x2="4016" y1="1072" y2="2448" x1="4016" />
            <wire x2="4752" y1="2448" y2="2448" x1="4016" />
            <wire x2="4752" y1="2448" y2="2560" x1="4752" />
            <wire x2="4784" y1="2560" y2="2560" x1="4752" />
            <wire x2="4752" y1="2560" y2="2560" x1="4656" />
        </branch>
        <branch name="WR_10">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4752" y="2816" type="branch" />
            <wire x2="2384" y1="2624" y2="2624" x1="1984" />
            <wire x2="1984" y1="2624" y2="3184" x1="1984" />
            <wire x2="4720" y1="3184" y2="3184" x1="1984" />
            <wire x2="4720" y1="2816" y2="2816" x1="4640" />
            <wire x2="4752" y1="2816" y2="2816" x1="4720" />
            <wire x2="4720" y1="2816" y2="3184" x1="4720" />
        </branch>
        <branch name="XLXN_53">
            <wire x2="4208" y1="2496" y2="2496" x1="4080" />
            <wire x2="4208" y1="2496" y2="2560" x1="4208" />
            <wire x2="4400" y1="2560" y2="2560" x1="4208" />
            <wire x2="4400" y1="2304" y2="2304" x1="4208" />
            <wire x2="4208" y1="2304" y2="2496" x1="4208" />
        </branch>
        <iomarker fontsize="28" x="3728" y="2240" name="WR" orien="R180" />
        <branch name="AI(12:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="96" y="336" type="branch" />
            <wire x2="96" y1="192" y2="336" x1="96" />
        </branch>
        <iomarker fontsize="28" x="96" y="192" name="AI(12:0)" orien="R270" />
        <iomarker fontsize="28" x="176" y="912" name="CLKO" orien="R180" />
        <instance x="2224" y="272" name="XLXI_25" orien="R0">
        </instance>
        <instance x="2512" y="608" name="XLXI_26" orien="R0">
        </instance>
        <branch name="DO(7:0)">
            <wire x2="2640" y1="112" y2="112" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2640" y="112" name="DO(7:0)" orien="R0" />
        <branch name="XLXN_76(7:0)">
            <wire x2="2224" y1="176" y2="176" x1="2144" />
            <wire x2="2144" y1="176" y2="288" x1="2144" />
            <wire x2="3056" y1="288" y2="288" x1="2144" />
            <wire x2="3056" y1="288" y2="2272" x1="3056" />
            <wire x2="3056" y1="2272" y2="2272" x1="2992" />
        </branch>
        <branch name="XLXN_77(7:0)">
            <wire x2="2224" y1="240" y2="240" x1="2160" />
            <wire x2="2160" y1="240" y2="336" x1="2160" />
            <wire x2="2960" y1="336" y2="336" x1="2160" />
            <wire x2="2960" y1="336" y2="448" x1="2960" />
            <wire x2="2960" y1="448" y2="448" x1="2896" />
        </branch>
        <branch name="XLXN_78(7:0)">
            <wire x2="1616" y1="880" y2="880" x1="1552" />
            <wire x2="1616" y1="576" y2="880" x1="1616" />
            <wire x2="2512" y1="576" y2="576" x1="1616" />
        </branch>
        <branch name="XLXN_79(7:0)">
            <wire x2="2496" y1="400" y2="512" x1="2496" />
            <wire x2="2512" y1="512" y2="512" x1="2496" />
            <wire x2="4736" y1="400" y2="400" x1="2496" />
            <wire x2="4736" y1="400" y2="720" x1="4736" />
            <wire x2="4736" y1="720" y2="720" x1="4672" />
        </branch>
        <branch name="AO(12:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="256" y="304" type="branch" />
            <wire x2="256" y1="192" y2="304" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="192" name="AO(12:0)" orien="R270" />
        <branch name="AI(12)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3408" y="2496" type="branch" />
            <wire x2="3808" y1="2496" y2="2496" x1="3408" />
            <wire x2="3856" y1="2496" y2="2496" x1="3808" />
            <wire x2="3808" y1="2496" y2="2816" x1="3808" />
            <wire x2="4384" y1="2816" y2="2816" x1="3808" />
        </branch>
        <branch name="AI(11)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3408" y="2608" type="branch" />
            <wire x2="3776" y1="2608" y2="2608" x1="3408" />
            <wire x2="3856" y1="2608" y2="2608" x1="3776" />
            <wire x2="3776" y1="2608" y2="2672" x1="3776" />
            <wire x2="4400" y1="2672" y2="2672" x1="3776" />
            <wire x2="4400" y1="2624" y2="2672" x1="4400" />
        </branch>
        <branch name="AO(12)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2144" y="112" type="branch" />
            <wire x2="2224" y1="112" y2="112" x1="2144" />
        </branch>
        <branch name="AO(11)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2432" y="448" type="branch" />
            <wire x2="2512" y1="448" y2="448" x1="2432" />
        </branch>
    </sheet>
</drawing>