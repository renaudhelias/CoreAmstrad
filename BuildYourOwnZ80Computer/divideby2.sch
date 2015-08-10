<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLKout" />
        <signal name="CLKin" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <port polarity="Output" name="CLKout" />
        <port polarity="Input" name="CLKin" />
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
            <blockpin signalname="CLKout" name="Q0" />
            <blockpin name="Q1" />
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
        <text style="fontsize:48;fontname:Arial" x="1756" y="792">http://www.hitequest.com/Hardware/a120.htm</text>
        <branch name="CLKin">
            <wire x2="416" y1="848" y2="848" x1="400" />
            <wire x2="416" y1="848" y2="992" x1="416" />
            <wire x2="576" y1="992" y2="992" x1="416" />
        </branch>
        <iomarker fontsize="28" x="400" y="848" name="CLKin" orien="R180" />
        <iomarker fontsize="28" x="2752" y="400" name="CLKout" orien="R0" />
        <branch name="CLKout">
            <wire x2="1024" y1="800" y2="800" x1="960" />
            <wire x2="1024" y1="800" y2="1152" x1="1024" />
            <wire x2="1024" y1="1152" y2="1152" x1="960" />
            <wire x2="960" y1="1152" y2="1440" x1="960" />
            <wire x2="1024" y1="1440" y2="1440" x1="960" />
            <wire x2="1024" y1="1440" y2="1456" x1="1024" />
            <wire x2="2256" y1="1456" y2="1456" x1="1024" />
            <wire x2="2608" y1="448" y2="448" x1="2256" />
            <wire x2="2256" y1="448" y2="1456" x1="2256" />
            <wire x2="2752" y1="400" y2="400" x1="2608" />
            <wire x2="2608" y1="400" y2="448" x1="2608" />
        </branch>
        <instance x="576" y="1120" name="XLXI_24" orien="R0" />
        <branch name="XLXN_34">
            <wire x2="576" y1="928" y2="928" x1="496" />
        </branch>
        <instance x="432" y="928" name="XLXI_25" orien="R0" />
        <branch name="XLXN_35">
            <wire x2="576" y1="1088" y2="1088" x1="496" />
        </branch>
        <instance x="432" y="1216" name="XLXI_26" orien="R0" />
    </sheet>
</drawing>