<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLKin" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="CLKout" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <port polarity="Input" name="CLKin" />
        <port polarity="Output" name="CLKout" />
        <blockdef name="cb2ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <block symbolname="cb2ce" name="XLXI_24">
            <blockpin signalname="CLKin" name="C" />
            <blockpin signalname="XLXN_34" name="CE" />
            <blockpin signalname="XLXN_35" name="CLR" />
            <blockpin name="CEO" />
            <blockpin name="Q0" />
            <blockpin signalname="CLKout" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_25">
            <blockpin signalname="XLXN_34" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_26">
            <blockpin signalname="XLXN_35" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <text style="fontsize:48;fontname:Arial" x="2044" y="888">http://www.hitequest.com/Hardware/a120.htm</text>
        <branch name="CLKin">
            <wire x2="704" y1="944" y2="944" x1="688" />
            <wire x2="704" y1="944" y2="1088" x1="704" />
            <wire x2="864" y1="1088" y2="1088" x1="704" />
        </branch>
        <instance x="864" y="1216" name="XLXI_24" orien="R0" />
        <branch name="XLXN_34">
            <wire x2="864" y1="1024" y2="1024" x1="784" />
        </branch>
        <instance x="720" y="1024" name="XLXI_25" orien="R0" />
        <branch name="XLXN_35">
            <wire x2="864" y1="1184" y2="1184" x1="784" />
        </branch>
        <instance x="720" y="1312" name="XLXI_26" orien="R0" />
        <iomarker fontsize="28" x="688" y="944" name="CLKin" orien="R180" />
        <iomarker fontsize="28" x="3040" y="496" name="CLKout" orien="R0" />
        <branch name="CLKout">
            <wire x2="1312" y1="960" y2="960" x1="1248" />
            <wire x2="1312" y1="960" y2="1248" x1="1312" />
            <wire x2="1248" y1="1248" y2="1536" x1="1248" />
            <wire x2="1312" y1="1536" y2="1536" x1="1248" />
            <wire x2="1312" y1="1536" y2="1552" x1="1312" />
            <wire x2="2544" y1="1552" y2="1552" x1="1312" />
            <wire x2="1312" y1="1248" y2="1248" x1="1248" />
            <wire x2="2896" y1="544" y2="544" x1="2544" />
            <wire x2="2544" y1="544" y2="1552" x1="2544" />
            <wire x2="3040" y1="496" y2="496" x1="2896" />
            <wire x2="2896" y1="496" y2="544" x1="2896" />
        </branch>
    </sheet>
</drawing>