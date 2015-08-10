<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK100MHz" />
        <signal name="CLK25MHz" />
        <signal name="COMPTEUR25(7:0)" />
        <signal name="COMPTEUR25(0)" />
        <signal name="COMPTEUR25(1)" />
        <signal name="COMPTEUR25(2)" />
        <signal name="COMPTEUR25(3)" />
        <signal name="COMPTEUR25(4)" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_211" />
        <signal name="XLXN_212" />
        <signal name="XLXN_213" />
        <signal name="XLXN_214" />
        <signal name="XLXN_215" />
        <signal name="XLXN_216" />
        <signal name="XLXN_217" />
        <signal name="XLXN_218" />
        <signal name="CLK1MHz" />
        <signal name="XLXN_220" />
        <signal name="XLXN_221" />
        <signal name="XLXN_223" />
        <signal name="XLXN_224" />
        <signal name="XLXN_225" />
        <signal name="XLXN_226" />
        <signal name="CLK4MHz" />
        <signal name="XLXN_228" />
        <port polarity="Output" name="CLK100MHz" />
        <port polarity="Output" name="CLK25MHz" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="CLK1MHz" />
        <port polarity="Output" name="CLK4MHz" />
        <blockdef name="dcm">
            <timestamp>2007-4-11T22:46:4</timestamp>
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <rect width="256" x="64" y="-1024" height="960" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <rect width="64" x="320" y="-336" height="32" />
            <line x2="80" y1="-944" y2="-960" x1="64" />
            <line x2="64" y1="-960" y2="-976" x1="80" />
            <line x2="64" y1="-288" y2="-288" x1="320" />
            <line x2="80" y1="-880" y2="-896" x1="64" />
            <line x2="64" y1="-896" y2="-912" x1="80" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="cb2re">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="cb8re">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="d3_8e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-640" height="576" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <block symbolname="cb2re" name="XLXI_5">
            <blockpin signalname="CLK100MHz" name="C" />
            <blockpin signalname="XLXN_33" name="CE" />
            <blockpin signalname="XLXN_34" name="R" />
            <blockpin name="CEO" />
            <blockpin name="Q0" />
            <blockpin signalname="CLK25MHz" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="cb8re" name="XLXI_8">
            <blockpin signalname="CLK25MHz" name="C" />
            <blockpin signalname="XLXN_32" name="CE" />
            <blockpin signalname="XLXN_31" name="R" />
            <blockpin name="CEO" />
            <blockpin signalname="COMPTEUR25(7:0)" name="Q(7:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="and3" name="XLXI_16">
            <blockpin signalname="COMPTEUR25(4)" name="I0" />
            <blockpin signalname="COMPTEUR25(3)" name="I1" />
            <blockpin signalname="COMPTEUR25(0)" name="I2" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_17">
            <blockpin signalname="XLXN_32" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_18">
            <blockpin signalname="XLXN_33" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_19">
            <blockpin signalname="XLXN_34" name="G" />
        </block>
        <block symbolname="dcm" name="XLXI_1">
            <blockpin signalname="XLXN_3" name="CLKFB" />
            <blockpin signalname="CLK50MHz" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_2" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin signalname="CLK100MHz" name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_2">
            <blockpin signalname="XLXN_2" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="d3_8e" name="XLXI_33">
            <blockpin signalname="COMPTEUR25(2)" name="A0" />
            <blockpin signalname="COMPTEUR25(1)" name="A1" />
            <blockpin signalname="COMPTEUR25(0)" name="A2" />
            <blockpin signalname="XLXN_228" name="E" />
            <blockpin name="D0" />
            <blockpin signalname="XLXN_220" name="D1" />
            <blockpin name="D2" />
            <blockpin signalname="XLXN_221" name="D3" />
            <blockpin name="D4" />
            <blockpin signalname="XLXN_223" name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_224" name="D7" />
        </block>
        <block symbolname="inv" name="XLXI_35">
            <blockpin signalname="COMPTEUR25(4)" name="I" />
            <blockpin signalname="XLXN_215" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_36">
            <blockpin signalname="COMPTEUR25(3)" name="I" />
            <blockpin signalname="XLXN_216" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_37">
            <blockpin signalname="XLXN_216" name="I0" />
            <blockpin signalname="XLXN_215" name="I1" />
            <blockpin signalname="XLXN_218" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_38">
            <blockpin signalname="XLXN_220" name="I0" />
            <blockpin signalname="XLXN_218" name="I1" />
            <blockpin signalname="CLK1MHz" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_39">
            <blockpin signalname="XLXN_224" name="I0" />
            <blockpin signalname="XLXN_223" name="I1" />
            <blockpin signalname="XLXN_221" name="I2" />
            <blockpin signalname="XLXN_220" name="I3" />
            <blockpin signalname="XLXN_225" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_40">
            <blockpin signalname="XLXN_225" name="I0" />
            <blockpin signalname="XLXN_218" name="I1" />
            <blockpin signalname="CLK4MHz" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_41">
            <blockpin signalname="XLXN_228" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="944" y="608" name="XLXI_5" orien="R0" />
        <instance x="2288" y="480" name="XLXI_8" orien="R0" />
        <branch name="COMPTEUR25(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3104" y="224" type="branch" />
            <wire x2="2720" y1="224" y2="224" x1="2672" />
            <wire x2="2784" y1="224" y2="224" x1="2720" />
            <wire x2="2848" y1="224" y2="224" x1="2784" />
            <wire x2="2912" y1="224" y2="224" x1="2848" />
            <wire x2="2976" y1="224" y2="224" x1="2912" />
            <wire x2="3104" y1="224" y2="224" x1="2976" />
        </branch>
        <bustap x2="2720" y1="224" y2="320" x1="2720" />
        <branch name="COMPTEUR25(0)">
            <wire x2="2720" y1="320" y2="480" x1="2720" />
            <wire x2="3232" y1="480" y2="480" x1="2720" />
            <wire x2="3232" y1="480" y2="656" x1="3232" />
            <wire x2="2720" y1="480" y2="1392" x1="2720" />
            <wire x2="3280" y1="1392" y2="1392" x1="2720" />
        </branch>
        <branch name="COMPTEUR25(1)">
            <wire x2="2784" y1="320" y2="1328" x1="2784" />
            <wire x2="3280" y1="1328" y2="1328" x1="2784" />
        </branch>
        <branch name="COMPTEUR25(2)">
            <wire x2="2848" y1="320" y2="1264" x1="2848" />
            <wire x2="3280" y1="1264" y2="1264" x1="2848" />
        </branch>
        <bustap x2="2784" y1="224" y2="320" x1="2784" />
        <bustap x2="2848" y1="224" y2="320" x1="2848" />
        <bustap x2="2912" y1="224" y2="320" x1="2912" />
        <bustap x2="2976" y1="224" y2="320" x1="2976" />
        <instance x="3040" y="656" name="XLXI_16" orien="R90" />
        <branch name="COMPTEUR25(3)">
            <wire x2="2912" y1="320" y2="544" x1="2912" />
            <wire x2="3168" y1="544" y2="544" x1="2912" />
            <wire x2="3168" y1="544" y2="656" x1="3168" />
            <wire x2="2912" y1="544" y2="1088" x1="2912" />
            <wire x2="2976" y1="1088" y2="1088" x1="2912" />
        </branch>
        <branch name="COMPTEUR25(4)">
            <wire x2="2976" y1="320" y2="624" x1="2976" />
            <wire x2="2976" y1="624" y2="1024" x1="2976" />
            <wire x2="3104" y1="624" y2="624" x1="2976" />
            <wire x2="3104" y1="624" y2="656" x1="3104" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="2288" y1="448" y2="912" x1="2288" />
            <wire x2="3168" y1="912" y2="912" x1="2288" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="2288" y1="288" y2="288" x1="2256" />
        </branch>
        <instance x="2192" y="288" name="XLXI_17" orien="R0" />
        <branch name="XLXN_33">
            <wire x2="944" y1="416" y2="416" x1="912" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="944" y1="576" y2="576" x1="912" />
        </branch>
        <instance x="848" y="416" name="XLXI_18" orien="R0" />
        <instance x="848" y="704" name="XLXI_19" orien="R0" />
        <instance x="272" y="1184" name="XLXI_1" orien="R0" />
        <branch name="CLK50MHz">
            <wire x2="272" y1="224" y2="224" x1="208" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="672" y1="80" y2="80" x1="560" />
            <wire x2="672" y1="80" y2="224" x1="672" />
            <wire x2="672" y1="224" y2="224" x1="656" />
        </branch>
        <instance x="560" y="48" name="XLXI_2" orien="R180" />
        <branch name="XLXN_3">
            <wire x2="336" y1="80" y2="80" x1="256" />
            <wire x2="256" y1="80" y2="288" x1="256" />
            <wire x2="272" y1="288" y2="288" x1="256" />
        </branch>
        <iomarker fontsize="28" x="1728" y="272" name="CLK25MHz" orien="R270" />
        <iomarker fontsize="28" x="736" y="384" name="CLK100MHz" orien="R270" />
        <iomarker fontsize="28" x="208" y="224" name="CLK50MHz" orien="R180" />
        <instance x="3280" y="1840" name="XLXI_33" orien="R0" />
        <instance x="2976" y="1056" name="XLXI_35" orien="R0" />
        <instance x="3248" y="1152" name="XLXI_37" orien="R0" />
        <instance x="2976" y="1120" name="XLXI_36" orien="R0" />
        <branch name="XLXN_215">
            <wire x2="3248" y1="1024" y2="1024" x1="3200" />
        </branch>
        <branch name="XLXN_216">
            <wire x2="3248" y1="1088" y2="1088" x1="3200" />
        </branch>
        <branch name="XLXN_218">
            <wire x2="3904" y1="1056" y2="1056" x1="3504" />
            <wire x2="3904" y1="1056" y2="1264" x1="3904" />
            <wire x2="4208" y1="1056" y2="1056" x1="3904" />
            <wire x2="4208" y1="1056" y2="1568" x1="4208" />
            <wire x2="4368" y1="1568" y2="1568" x1="4208" />
        </branch>
        <instance x="3904" y="1392" name="XLXI_38" orien="R0" />
        <branch name="CLK1MHz">
            <wire x2="4160" y1="1296" y2="1360" x1="4160" />
        </branch>
        <iomarker fontsize="28" x="4160" y="1360" name="CLK1MHz" orien="R90" />
        <instance x="3936" y="1792" name="XLXI_39" orien="R0" />
        <branch name="XLXN_220">
            <wire x2="3808" y1="1328" y2="1328" x1="3664" />
            <wire x2="3904" y1="1328" y2="1328" x1="3808" />
            <wire x2="3808" y1="1328" y2="1536" x1="3808" />
            <wire x2="3936" y1="1536" y2="1536" x1="3808" />
        </branch>
        <branch name="XLXN_221">
            <wire x2="3792" y1="1456" y2="1456" x1="3664" />
            <wire x2="3792" y1="1456" y2="1600" x1="3792" />
            <wire x2="3936" y1="1600" y2="1600" x1="3792" />
        </branch>
        <branch name="XLXN_223">
            <wire x2="3776" y1="1584" y2="1584" x1="3664" />
            <wire x2="3776" y1="1584" y2="1664" x1="3776" />
            <wire x2="3936" y1="1664" y2="1664" x1="3776" />
        </branch>
        <branch name="XLXN_224">
            <wire x2="3792" y1="1712" y2="1712" x1="3664" />
            <wire x2="3792" y1="1712" y2="1728" x1="3792" />
            <wire x2="3936" y1="1728" y2="1728" x1="3792" />
        </branch>
        <branch name="XLXN_225">
            <wire x2="4368" y1="1632" y2="1632" x1="4192" />
        </branch>
        <instance x="4368" y="1696" name="XLXI_40" orien="R0" />
        <branch name="CLK4MHz">
            <wire x2="4656" y1="1600" y2="1600" x1="4624" />
        </branch>
        <iomarker fontsize="28" x="4656" y="1600" name="CLK4MHz" orien="R0" />
        <branch name="CLK100MHz">
            <wire x2="736" y1="480" y2="480" x1="656" />
            <wire x2="944" y1="480" y2="480" x1="736" />
            <wire x2="736" y1="384" y2="480" x1="736" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="1376" y1="352" y2="352" x1="1328" />
            <wire x2="1728" y1="352" y2="352" x1="1376" />
            <wire x2="2288" y1="352" y2="352" x1="1728" />
            <wire x2="1728" y1="272" y2="352" x1="1728" />
        </branch>
        <branch name="XLXN_228">
            <wire x2="3280" y1="1712" y2="1712" x1="3216" />
        </branch>
        <instance x="3152" y="1712" name="XLXI_41" orien="R0" />
    </sheet>
</drawing>