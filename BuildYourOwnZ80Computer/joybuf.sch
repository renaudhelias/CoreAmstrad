<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="JOY_IN(0)">
        </signal>
        <signal name="JOY_OUT(0)">
        </signal>
        <signal name="JOY_IN(1)">
        </signal>
        <signal name="JOY_OUT(1)">
        </signal>
        <signal name="JOY_IN(2)">
        </signal>
        <signal name="JOY_OUT(2)">
        </signal>
        <signal name="JOY_IN(3)">
        </signal>
        <signal name="JOY_OUT(3)">
        </signal>
        <signal name="JOY_IN(4)">
        </signal>
        <signal name="JOY_OUT(4)">
        </signal>
        <signal name="JOY_IN(5)">
        </signal>
        <signal name="JOY_OUT(5)">
        </signal>
        <signal name="JOY_IN(6)">
        </signal>
        <signal name="JOY_OUT(6)">
        </signal>
        <signal name="JOY_IN(7)">
        </signal>
        <signal name="JOY_OUT(7)">
        </signal>
        <signal name="JOY_IN(7:0)" />
        <signal name="JOY_OUT(7:0)" />
        <port polarity="BiDirectional" name="JOY_IN(7:0)" />
        <port polarity="Output" name="JOY_OUT(7:0)" />
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="pulldown">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-160" y2="-128" x1="64" />
            <line x2="60" y1="0" y2="0" x1="68" />
            <line x2="52" y1="-16" y2="-16" x1="76" />
            <line x2="40" y1="-32" y2="-32" x1="88" />
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
        </blockdef>
        <block symbolname="buf" name="XLXI_1">
            <blockpin signalname="JOY_IN(0)" name="I" />
            <blockpin signalname="JOY_OUT(0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_2">
            <blockpin signalname="JOY_IN(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="JOY_IN(1)" name="I" />
            <blockpin signalname="JOY_OUT(1)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_6">
            <blockpin signalname="JOY_IN(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="JOY_IN(2)" name="I" />
            <blockpin signalname="JOY_OUT(2)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_8">
            <blockpin signalname="JOY_IN(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9">
            <blockpin signalname="JOY_IN(3)" name="I" />
            <blockpin signalname="JOY_OUT(3)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_10">
            <blockpin signalname="JOY_IN(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_11">
            <blockpin signalname="JOY_IN(4)" name="I" />
            <blockpin signalname="JOY_OUT(4)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_12">
            <blockpin signalname="JOY_IN(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_13">
            <blockpin signalname="JOY_IN(5)" name="I" />
            <blockpin signalname="JOY_OUT(5)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_14">
            <blockpin signalname="JOY_IN(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="JOY_IN(6)" name="I" />
            <blockpin signalname="JOY_OUT(6)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_16">
            <blockpin signalname="JOY_IN(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="JOY_IN(7)" name="I" />
            <blockpin signalname="JOY_OUT(7)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_18">
            <blockpin signalname="JOY_IN(7)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="JOY_IN(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="448" y="192" type="branch" />
            <wire x2="560" y1="192" y2="192" x1="448" />
            <wire x2="672" y1="192" y2="192" x1="560" />
        </branch>
        <instance x="672" y="224" name="XLXI_1" orien="R0" />
        <instance x="496" y="352" name="XLXI_2" orien="R0" />
        <branch name="JOY_OUT(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1024" y="192" type="branch" />
            <wire x2="1024" y1="192" y2="192" x1="896" />
        </branch>
        <branch name="JOY_IN(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="432" y="544" type="branch" />
            <wire x2="544" y1="544" y2="544" x1="432" />
            <wire x2="656" y1="544" y2="544" x1="544" />
        </branch>
        <instance x="656" y="576" name="XLXI_5" orien="R0" />
        <instance x="480" y="704" name="XLXI_6" orien="R0" />
        <branch name="JOY_OUT(1)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1008" y="544" type="branch" />
            <wire x2="1008" y1="544" y2="544" x1="880" />
        </branch>
        <branch name="JOY_IN(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="464" y="928" type="branch" />
            <wire x2="576" y1="928" y2="928" x1="464" />
            <wire x2="688" y1="928" y2="928" x1="576" />
        </branch>
        <instance x="688" y="960" name="XLXI_7" orien="R0" />
        <instance x="512" y="1088" name="XLXI_8" orien="R0" />
        <branch name="JOY_OUT(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1040" y="928" type="branch" />
            <wire x2="1040" y1="928" y2="928" x1="912" />
        </branch>
        <branch name="JOY_IN(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="464" y="1296" type="branch" />
            <wire x2="576" y1="1296" y2="1296" x1="464" />
            <wire x2="688" y1="1296" y2="1296" x1="576" />
        </branch>
        <instance x="688" y="1328" name="XLXI_9" orien="R0" />
        <instance x="512" y="1456" name="XLXI_10" orien="R0" />
        <branch name="JOY_OUT(3)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1040" y="1296" type="branch" />
            <wire x2="1040" y1="1296" y2="1296" x1="912" />
        </branch>
        <branch name="JOY_IN(4)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1952" y="208" type="branch" />
            <wire x2="2064" y1="208" y2="208" x1="1952" />
            <wire x2="2176" y1="208" y2="208" x1="2064" />
        </branch>
        <instance x="2176" y="240" name="XLXI_11" orien="R0" />
        <instance x="2000" y="368" name="XLXI_12" orien="R0" />
        <branch name="JOY_OUT(4)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2528" y="208" type="branch" />
            <wire x2="2528" y1="208" y2="208" x1="2400" />
        </branch>
        <branch name="JOY_IN(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1888" y="544" type="branch" />
            <wire x2="2000" y1="544" y2="544" x1="1888" />
            <wire x2="2112" y1="544" y2="544" x1="2000" />
        </branch>
        <instance x="2112" y="576" name="XLXI_13" orien="R0" />
        <instance x="1936" y="704" name="XLXI_14" orien="R0" />
        <branch name="JOY_OUT(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2464" y="544" type="branch" />
            <wire x2="2464" y1="544" y2="544" x1="2336" />
        </branch>
        <branch name="JOY_IN(6)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1888" y="928" type="branch" />
            <wire x2="2000" y1="928" y2="928" x1="1888" />
            <wire x2="2112" y1="928" y2="928" x1="2000" />
        </branch>
        <instance x="2112" y="960" name="XLXI_15" orien="R0" />
        <instance x="1936" y="1088" name="XLXI_16" orien="R0" />
        <branch name="JOY_OUT(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2464" y="928" type="branch" />
            <wire x2="2464" y1="928" y2="928" x1="2336" />
        </branch>
        <branch name="JOY_IN(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1872" y="1296" type="branch" />
            <wire x2="1984" y1="1296" y2="1296" x1="1872" />
            <wire x2="2096" y1="1296" y2="1296" x1="1984" />
        </branch>
        <instance x="2096" y="1328" name="XLXI_17" orien="R0" />
        <instance x="1920" y="1456" name="XLXI_18" orien="R0" />
        <branch name="JOY_OUT(7)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2448" y="1296" type="branch" />
            <wire x2="2448" y1="1296" y2="1296" x1="2320" />
        </branch>
        <branch name="JOY_IN(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1040" y="1808" type="branch" />
            <wire x2="1040" y1="1808" y2="1808" x1="496" />
        </branch>
        <iomarker fontsize="28" x="496" y="1808" name="JOY_IN(7:0)" orien="R180" />
        <branch name="JOY_OUT(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1680" y="1808" type="branch" />
            <wire x2="2320" y1="1808" y2="1808" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1808" name="JOY_OUT(7:0)" orien="R0" />
    </sheet>
</drawing>