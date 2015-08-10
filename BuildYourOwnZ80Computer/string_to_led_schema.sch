<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK50MHz" />
        <signal name="LEDS(7:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="LEDS(7:0)" />
        <blockdef name="string_to_leds">
            <timestamp>2011-9-25T14:44:0</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="string_to_leds" name="XLXI_1">
            <blockpin signalname="CLK50MHz" name="CLK" />
            <blockpin signalname="LEDS(7:0)" name="LEDS(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1248" y="1024" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="1248" y1="992" y2="992" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="1216" y="992" name="CLK50MHz" orien="R180" />
        <branch name="LEDS(7:0)">
            <wire x2="1664" y1="992" y2="992" x1="1632" />
        </branch>
        <iomarker fontsize="28" x="1664" y="992" name="LEDS(7:0)" orien="R0" />
    </sheet>
</drawing>