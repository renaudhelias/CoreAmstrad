<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(7:0)" />
        <signal name="XLXN_1(7:0)" />
        <signal name="AB(0)">
        </signal>
        <signal name="AB(1)">
        </signal>
        <signal name="XLXN_15" />
        <signal name="BUS_A_B(7:0)" />
        <signal name="BUS_AnB(7:0)" />
        <signal name="BUS_A_Bn(7:0)" />
        <signal name="BUS_AnBn(7:0)" />
        <signal name="BUSout(7:0)" />
        <signal name="AB(1:0)" />
        <port polarity="Input" name="BUS_A_B(7:0)" />
        <port polarity="Input" name="BUS_AnB(7:0)" />
        <port polarity="Input" name="BUS_A_Bn(7:0)" />
        <port polarity="Input" name="BUS_AnBn(7:0)" />
        <port polarity="Output" name="BUSout(7:0)" />
        <port polarity="Input" name="AB(1:0)" />
        <blockdef name="BUS_SELECT">
            <timestamp>2010-12-22T12:9:49</timestamp>
            <rect width="64" x="352" y="20" height="24" />
            <line x2="416" y1="32" y2="32" x1="352" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="288" x="64" y="-192" height="256" />
        </blockdef>
        <block symbolname="BUS_SELECT" name="XLXI_1">
            <blockpin signalname="BUS_A_B(7:0)" name="BUS_0(7:0)" />
            <blockpin signalname="BUS_AnB(7:0)" name="BUS_1(7:0)" />
            <blockpin signalname="AB(1)" name="ENABLE_BUS_0" />
            <blockpin signalname="XLXN_1(7:0)" name="BUSout(7:0)" />
        </block>
        <block symbolname="BUS_SELECT" name="XLXI_3">
            <blockpin signalname="XLXN_1(7:0)" name="BUS_0(7:0)" />
            <blockpin signalname="XLXN_2(7:0)" name="BUS_1(7:0)" />
            <blockpin signalname="AB(0)" name="ENABLE_BUS_0" />
            <blockpin signalname="BUSout(7:0)" name="BUSout(7:0)" />
        </block>
        <block symbolname="BUS_SELECT" name="XLXI_2">
            <blockpin signalname="BUS_A_Bn(7:0)" name="BUS_0(7:0)" />
            <blockpin signalname="BUS_AnBn(7:0)" name="BUS_1(7:0)" />
            <blockpin signalname="AB(1)" name="ENABLE_BUS_0" />
            <blockpin signalname="XLXN_2(7:0)" name="BUSout(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2112" y="768" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2752" y="864" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_2(7:0)">
            <wire x2="2736" y1="1264" y2="1264" x1="2528" />
            <wire x2="2752" y1="768" y2="768" x1="2736" />
            <wire x2="2736" y1="768" y2="1264" x1="2736" />
        </branch>
        <branch name="XLXN_1(7:0)">
            <wire x2="2640" y1="800" y2="800" x1="2528" />
            <wire x2="2752" y1="704" y2="704" x1="2640" />
            <wire x2="2640" y1="704" y2="800" x1="2640" />
        </branch>
        <branch name="AB(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1856" y="832" type="branch" />
            <wire x2="2752" y1="832" y2="832" x1="1856" />
        </branch>
        <branch name="AB(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1856" y="736" type="branch" />
            <wire x2="2080" y1="736" y2="736" x1="1856" />
            <wire x2="2112" y1="736" y2="736" x1="2080" />
            <wire x2="2080" y1="736" y2="1200" x1="2080" />
            <wire x2="2112" y1="1200" y2="1200" x1="2080" />
        </branch>
        <instance x="2112" y="1232" name="XLXI_2" orien="R0">
        </instance>
        <branch name="BUS_A_B(7:0)">
            <wire x2="2112" y1="608" y2="608" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="1920" y="608" name="BUS_A_B(7:0)" orien="R180" />
        <branch name="BUS_AnB(7:0)">
            <wire x2="2112" y1="672" y2="672" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="1920" y="672" name="BUS_AnB(7:0)" orien="R180" />
        <branch name="BUS_A_Bn(7:0)">
            <wire x2="2112" y1="1072" y2="1072" x1="1920" />
        </branch>
        <branch name="BUS_AnBn(7:0)">
            <wire x2="2112" y1="1136" y2="1136" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="1920" y="1072" name="BUS_A_Bn(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1920" y="1136" name="BUS_AnBn(7:0)" orien="R180" />
        <branch name="BUSout(7:0)">
            <wire x2="3232" y1="896" y2="896" x1="3168" />
            <wire x2="3232" y1="704" y2="896" x1="3232" />
        </branch>
        <iomarker fontsize="28" x="3232" y="704" name="BUSout(7:0)" orien="R0" />
        <branch name="AB(1:0)">
            <wire x2="1760" y1="736" y2="736" x1="1680" />
            <wire x2="1760" y1="736" y2="832" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1680" y="736" name="AB(1:0)" orien="R180" />
        <bustap x2="1856" y1="736" y2="736" x1="1760" />
        <bustap x2="1856" y1="832" y2="832" x1="1760" />
    </sheet>
</drawing>