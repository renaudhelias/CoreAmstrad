<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="zero,zero,zero,zero,zero,zero,zero,zero" />
        <signal name="FX2BB(40:1)" />
        <signal name="LEDS(15:0)" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="zero" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="BiDirectional" name="FX2BB(40:1)" />
        <port polarity="Output" name="LEDS(15:0)" />
        <blockdef name="T80configurator">
            <timestamp>2011-5-18T11:55:6</timestamp>
            <rect width="256" x="64" y="-704" height="704" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <line x2="0" y1="-432" y2="-432" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-124" height="24" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
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
        <blockdef name="divideby3">
            <timestamp>2011-4-20T16:38:52</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="divideby2">
            <timestamp>2011-4-18T15:8:20</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="T80configurator" name="XLXI_1">
            <blockpin signalname="XLXN_5" name="RESET_n" />
            <blockpin signalname="XLXN_17" name="CLK_n" />
            <blockpin signalname="XLXN_5" name="CLKEN" />
            <blockpin signalname="XLXN_5" name="WAIT_n" />
            <blockpin signalname="XLXN_5" name="INT_n" />
            <blockpin signalname="XLXN_5" name="NMI_n" />
            <blockpin signalname="XLXN_5" name="BUSRQ_n" />
            <blockpin signalname="zero,zero,zero,zero,zero,zero,zero,zero" name="DI(7:0)" />
            <blockpin signalname="FX2BB(40:1)" name="FX2BB(40:1)" />
            <blockpin name="M1_n" />
            <blockpin name="MREQ_n" />
            <blockpin name="IORQ_n" />
            <blockpin name="RD_n" />
            <blockpin name="WR_n" />
            <blockpin name="RFSH_n" />
            <blockpin name="HALT_n" />
            <blockpin name="BUSAK_n" />
            <blockpin signalname="LEDS(15:0)" name="A(15:0)" />
            <blockpin name="DO(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_2">
            <blockpin signalname="XLXN_5" name="P" />
        </block>
        <block symbolname="divideby3" name="XLXI_3">
            <blockpin signalname="CLK50MHz" name="CLKin" />
            <blockpin signalname="XLXN_7" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_4">
            <blockpin signalname="XLXN_7" name="CLKin" />
            <blockpin signalname="XLXN_8" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_5">
            <blockpin signalname="XLXN_8" name="CLKin" />
            <blockpin signalname="XLXN_10" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_7">
            <blockpin signalname="XLXN_10" name="CLKin" />
            <blockpin signalname="XLXN_11" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_8">
            <blockpin signalname="XLXN_11" name="CLKin" />
            <blockpin signalname="XLXN_12" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_9">
            <blockpin signalname="XLXN_12" name="CLKin" />
            <blockpin signalname="XLXN_13" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_10">
            <blockpin signalname="XLXN_13" name="CLKin" />
            <blockpin signalname="XLXN_14" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_11">
            <blockpin signalname="XLXN_14" name="CLKin" />
            <blockpin signalname="XLXN_15" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_12">
            <blockpin signalname="XLXN_15" name="CLKin" />
            <blockpin signalname="XLXN_16" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_13">
            <blockpin signalname="XLXN_16" name="CLKin" />
            <blockpin signalname="XLXN_17" name="CLKout" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="zero" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1136" y="1200" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_5">
            <wire x2="1120" y1="416" y2="528" x1="1120" />
            <wire x2="1136" y1="528" y2="528" x1="1120" />
            <wire x2="1120" y1="528" y2="688" x1="1120" />
            <wire x2="1136" y1="688" y2="688" x1="1120" />
            <wire x2="1120" y1="688" y2="768" x1="1120" />
            <wire x2="1136" y1="768" y2="768" x1="1120" />
            <wire x2="1120" y1="768" y2="848" x1="1120" />
            <wire x2="1136" y1="848" y2="848" x1="1120" />
            <wire x2="1120" y1="848" y2="928" x1="1120" />
            <wire x2="1136" y1="928" y2="928" x1="1120" />
            <wire x2="1120" y1="928" y2="1008" x1="1120" />
            <wire x2="1136" y1="1008" y2="1008" x1="1120" />
        </branch>
        <instance x="1056" y="416" name="XLXI_2" orien="R0" />
        <instance x="368" y="560" name="XLXI_3" orien="R0">
        </instance>
        <instance x="368" y="720" name="XLXI_4" orien="R0">
        </instance>
        <instance x="368" y="880" name="XLXI_5" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="368" y1="528" y2="528" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="528" name="CLK50MHz" orien="R180" />
        <branch name="XLXN_7">
            <wire x2="304" y1="592" y2="688" x1="304" />
            <wire x2="368" y1="688" y2="688" x1="304" />
            <wire x2="832" y1="592" y2="592" x1="304" />
            <wire x2="832" y1="528" y2="528" x1="752" />
            <wire x2="832" y1="528" y2="592" x1="832" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="304" y1="752" y2="848" x1="304" />
            <wire x2="368" y1="848" y2="848" x1="304" />
            <wire x2="832" y1="752" y2="752" x1="304" />
            <wire x2="832" y1="688" y2="688" x1="752" />
            <wire x2="832" y1="688" y2="752" x1="832" />
        </branch>
        <branch name="zero,zero,zero,zero,zero,zero,zero,zero">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1104" y="1088" type="branch" />
            <wire x2="1136" y1="1088" y2="1088" x1="1104" />
        </branch>
        <branch name="FX2BB(40:1)">
            <wire x2="1552" y1="1168" y2="1168" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1168" name="FX2BB(40:1)" orien="R0" />
        <branch name="LEDS(15:0)">
            <wire x2="1712" y1="1040" y2="1040" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1712" y="1040" name="LEDS(15:0)" orien="R0" />
        <instance x="2064" y="240" name="XLXI_7" orien="R0">
        </instance>
        <instance x="2032" y="384" name="XLXI_8" orien="R0">
        </instance>
        <instance x="2048" y="544" name="XLXI_9" orien="R0">
        </instance>
        <instance x="2048" y="688" name="XLXI_10" orien="R0">
        </instance>
        <instance x="2064" y="848" name="XLXI_11" orien="R0">
        </instance>
        <instance x="2112" y="992" name="XLXI_12" orien="R0">
        </instance>
        <instance x="2144" y="1152" name="XLXI_13" orien="R0">
        </instance>
        <branch name="XLXN_10">
            <wire x2="944" y1="848" y2="848" x1="752" />
            <wire x2="2064" y1="208" y2="208" x1="944" />
            <wire x2="944" y1="208" y2="848" x1="944" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1968" y1="256" y2="352" x1="1968" />
            <wire x2="2032" y1="352" y2="352" x1="1968" />
            <wire x2="2528" y1="256" y2="256" x1="1968" />
            <wire x2="2528" y1="208" y2="208" x1="2448" />
            <wire x2="2528" y1="208" y2="256" x1="2528" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="2048" y1="512" y2="512" x1="1984" />
            <wire x2="1984" y1="512" y2="608" x1="1984" />
            <wire x2="2496" y1="608" y2="608" x1="1984" />
            <wire x2="2496" y1="352" y2="352" x1="2416" />
            <wire x2="2496" y1="352" y2="608" x1="2496" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="2048" y1="656" y2="656" x1="1984" />
            <wire x2="1984" y1="656" y2="752" x1="1984" />
            <wire x2="2480" y1="752" y2="752" x1="1984" />
            <wire x2="2480" y1="512" y2="512" x1="2432" />
            <wire x2="2480" y1="512" y2="752" x1="2480" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2064" y1="816" y2="816" x1="2000" />
            <wire x2="2000" y1="816" y2="912" x1="2000" />
            <wire x2="2544" y1="912" y2="912" x1="2000" />
            <wire x2="2544" y1="656" y2="656" x1="2432" />
            <wire x2="2544" y1="656" y2="912" x1="2544" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="2112" y1="960" y2="960" x1="2048" />
            <wire x2="2048" y1="960" y2="1056" x1="2048" />
            <wire x2="2576" y1="1056" y2="1056" x1="2048" />
            <wire x2="2576" y1="816" y2="816" x1="2448" />
            <wire x2="2576" y1="816" y2="1056" x1="2576" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2144" y1="1120" y2="1120" x1="2080" />
            <wire x2="2080" y1="1120" y2="1232" x1="2080" />
            <wire x2="2592" y1="1232" y2="1232" x1="2080" />
            <wire x2="2592" y1="960" y2="960" x1="2496" />
            <wire x2="2592" y1="960" y2="1232" x1="2592" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1136" y1="608" y2="608" x1="1040" />
            <wire x2="1040" y1="608" y2="1264" x1="1040" />
            <wire x2="2576" y1="1264" y2="1264" x1="1040" />
            <wire x2="2576" y1="1120" y2="1120" x1="2528" />
            <wire x2="2576" y1="1120" y2="1264" x1="2576" />
        </branch>
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="640" y="992" type="branch" />
            <wire x2="640" y1="992" y2="1056" x1="640" />
        </branch>
        <instance x="576" y="1184" name="XLXI_6" orien="R0" />
    </sheet>
</drawing>