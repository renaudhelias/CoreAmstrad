<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BUS_0(7:0)" />
        <signal name="BUS_1(7:0)" />
        <signal name="BUSout(7:0)" />
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="ENABLE_BUS_0" />
        <signal name="XLXN_7" />
        <port polarity="Input" name="BUS_0(7:0)" />
        <port polarity="Input" name="BUS_1(7:0)" />
        <port polarity="Output" name="BUSout(7:0)" />
        <port polarity="Input" name="ENABLE_BUS_0" />
        <blockdef name="ENABLE8">
            <timestamp>2010-11-13T12:23:16</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="OR8_8">
            <timestamp>2010-11-13T12:23:25</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
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
        <block symbolname="ENABLE8" name="XLXI_1">
            <blockpin signalname="ENABLE_BUS_0" name="ENABLE" />
            <blockpin signalname="BUS_0(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_4(7:0)" name="C(7:0)" />
        </block>
        <block symbolname="ENABLE8" name="XLXI_2">
            <blockpin signalname="XLXN_7" name="ENABLE" />
            <blockpin signalname="BUS_1(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="C(7:0)" />
        </block>
        <block symbolname="OR8_8" name="XLXI_3">
            <blockpin signalname="XLXN_4(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="B(7:0)" />
            <blockpin signalname="BUSout(7:0)" name="C(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_4">
            <blockpin signalname="ENABLE_BUS_0" name="I" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="512" y="320" name="XLXI_1" orien="R0">
        </instance>
        <instance x="528" y="576" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1120" y="448" name="XLXI_3" orien="R0">
        </instance>
        <branch name="BUS_0(7:0)">
            <wire x2="512" y1="288" y2="288" x1="352" />
        </branch>
        <branch name="BUS_1(7:0)">
            <wire x2="528" y1="544" y2="544" x1="368" />
        </branch>
        <branch name="BUSout(7:0)">
            <wire x2="1584" y1="352" y2="352" x1="1504" />
        </branch>
        <branch name="XLXN_4(7:0)">
            <wire x2="1008" y1="224" y2="224" x1="896" />
            <wire x2="1008" y1="224" y2="352" x1="1008" />
            <wire x2="1120" y1="352" y2="352" x1="1008" />
        </branch>
        <branch name="XLXN_5(7:0)">
            <wire x2="1008" y1="480" y2="480" x1="912" />
            <wire x2="1008" y1="416" y2="480" x1="1008" />
            <wire x2="1120" y1="416" y2="416" x1="1008" />
        </branch>
        <branch name="ENABLE_BUS_0">
            <wire x2="416" y1="224" y2="224" x1="352" />
            <wire x2="512" y1="224" y2="224" x1="416" />
            <wire x2="416" y1="224" y2="240" x1="416" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="416" y1="464" y2="480" x1="416" />
            <wire x2="528" y1="480" y2="480" x1="416" />
        </branch>
        <instance x="384" y="240" name="XLXI_4" orien="R90" />
        <iomarker fontsize="28" x="352" y="288" name="BUS_0(7:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="544" name="BUS_1(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1584" y="352" name="BUSout(7:0)" orien="R0" />
        <iomarker fontsize="28" x="352" y="224" name="ENABLE_BUS_0" orien="R180" />
    </sheet>
</drawing>