<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ram_W" />
        <signal name="XLXN_8" />
        <signal name="LB1" />
        <signal name="CE1" />
        <signal name="UB1" />
        <signal name="XLXN_15(7:0)" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="BUTTON_0" />
        <signal name="ram_D(7:0)" />
        <signal name="LEDS(7:0)" />
        <signal name="ram_A(15:0)" />
        <signal name="OE1" />
        <port polarity="Output" name="ram_W" />
        <port polarity="Output" name="LB1" />
        <port polarity="Output" name="CE1" />
        <port polarity="Output" name="UB1" />
        <port polarity="Input" name="BUTTON_0" />
        <port polarity="Input" name="ram_D(7:0)" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="Output" name="ram_A(15:0)" />
        <port polarity="Output" name="OE1" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="ibuf8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="96" x="128" y="-44" height="24" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="cb16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_165">
            <blockpin signalname="LB1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_164">
            <blockpin signalname="UB1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_163">
            <blockpin signalname="CE1" name="G" />
        </block>
        <block symbolname="cb16ce" name="XLXI_172">
            <blockpin signalname="BUTTON_0" name="C" />
            <blockpin signalname="XLXN_20" name="CE" />
            <blockpin signalname="XLXN_21" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="ram_A(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_173">
            <blockpin signalname="XLXN_20" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_174">
            <blockpin signalname="XLXN_21" name="G" />
        </block>
        <block symbolname="ibuf8" name="XLXI_171">
            <blockpin signalname="ram_D(7:0)" name="I(7:0)" />
            <blockpin signalname="LEDS(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_176">
            <blockpin signalname="ram_W" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_178">
            <blockpin signalname="OE1" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="ram_W">
            <wire x2="2064" y1="320" y2="320" x1="1792" />
        </branch>
        <branch name="LB1">
            <wire x2="1600" y1="768" y2="832" x1="1600" />
        </branch>
        <instance x="1664" y="640" name="XLXI_165" orien="R180" />
        <branch name="CE1">
            <wire x2="1344" y1="768" y2="832" x1="1344" />
        </branch>
        <branch name="UB1">
            <wire x2="1472" y1="768" y2="832" x1="1472" />
        </branch>
        <instance x="1536" y="640" name="XLXI_164" orien="R180" />
        <instance x="1408" y="640" name="XLXI_163" orien="R180" />
        <iomarker fontsize="28" x="2064" y="320" name="ram_W" orien="R0" />
        <iomarker fontsize="28" x="1600" y="832" name="LB1" orien="R90" />
        <iomarker fontsize="28" x="1472" y="832" name="UB1" orien="R90" />
        <iomarker fontsize="28" x="1344" y="832" name="CE1" orien="R90" />
        <instance x="496" y="960" name="XLXI_172" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="496" y1="768" y2="768" x1="416" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="496" y1="928" y2="928" x1="416" />
        </branch>
        <instance x="352" y="768" name="XLXI_173" orien="R0" />
        <instance x="352" y="1056" name="XLXI_174" orien="R0" />
        <branch name="BUTTON_0">
            <wire x2="496" y1="832" y2="832" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="832" name="BUTTON_0" orien="R180" />
        <branch name="ram_D(7:0)">
            <wire x2="480" y1="528" y2="528" x1="416" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="736" y1="528" y2="528" x1="704" />
        </branch>
        <instance x="480" y="560" name="XLXI_171" orien="R0" />
        <iomarker fontsize="28" x="416" y="528" name="ram_D(7:0)" orien="R180" />
        <iomarker fontsize="28" x="736" y="528" name="LEDS(7:0)" orien="R0" />
        <branch name="ram_A(15:0)">
            <wire x2="976" y1="704" y2="704" x1="880" />
        </branch>
        <iomarker fontsize="28" x="976" y="704" name="ram_A(15:0)" orien="R0" />
        <instance x="1728" y="320" name="XLXI_176" orien="R0" />
        <branch name="OE1">
            <wire x2="2064" y1="480" y2="480" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="2064" y="480" name="OE1" orien="R0" />
        <instance x="1728" y="608" name="XLXI_178" orien="R0" />
    </sheet>
</drawing>