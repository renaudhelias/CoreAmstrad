<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK4MHz" />
        <signal name="PPI_portC(3:0)" />
        <signal name="PPI_enable" />
        <signal name="XLXN_27(9:0)" />
        <signal name="XLXN_29(7:0)" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="PPI_portA(7:0)" />
        <signal name="joystick1(5:0)" />
        <signal name="joystick2(5:0)" />
        <signal name="PS2_DATA" />
        <signal name="PS2_CLK" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="key_reset" />
        <port polarity="Input" name="CLK4MHz" />
        <port polarity="Input" name="PPI_portC(3:0)" />
        <port polarity="Output" name="PPI_portA(7:0)" />
        <port polarity="Input" name="joystick1(5:0)" />
        <port polarity="Input" name="joystick2(5:0)" />
        <port polarity="Input" name="PS2_DATA" />
        <port polarity="Input" name="PS2_CLK" />
        <port polarity="Output" name="key_reset" />
        <blockdef name="KEYBOARD_driver">
            <timestamp>2015-2-23T13:1:35</timestamp>
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="64" y2="64" x1="320" />
            <line x2="384" y1="0" y2="0" x1="320" />
            <rect width="64" x="320" y="52" height="24" />
            <rect width="64" x="320" y="-12" height="24" />
            <rect width="256" x="64" y="-256" height="372" />
            <line x2="384" y1="-176" y2="-176" x1="320" />
        </blockdef>
        <blockdef name="KEYBOARD_controller">
            <timestamp>2011-4-21T12:12:9</timestamp>
            <rect width="336" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
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
        <blockdef name="Keyboard">
            <timestamp>2011-11-7T8:3:56</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="256" x="64" y="-256" height="320" />
        </blockdef>
        <block symbolname="KEYBOARD_controller" name="XLXI_3">
            <blockpin signalname="CLK4MHz" name="CLK" />
            <blockpin signalname="XLXN_57" name="fok" />
            <blockpin signalname="XLXN_29(7:0)" name="scancode_in(7:0)" />
            <blockpin signalname="XLXN_30" name="press" />
            <blockpin signalname="XLXN_31" name="unpress" />
            <blockpin signalname="XLXN_27(9:0)" name="keycode(9:0)" />
        </block>
        <block symbolname="KEYBOARD_driver" name="XLXI_2">
            <blockpin signalname="CLK4MHz" name="CLK" />
            <blockpin signalname="PPI_enable" name="enable" />
            <blockpin signalname="XLXN_30" name="press" />
            <blockpin signalname="XLXN_31" name="unpress" />
            <blockpin signalname="PPI_portC(3:0)" name="portC(3:0)" />
            <blockpin signalname="joystick1(5:0)" name="joystick1(5:0)" />
            <blockpin signalname="joystick2(5:0)" name="joystick2(5:0)" />
            <blockpin signalname="XLXN_27(9:0)" name="keycode(9:0)" />
            <blockpin signalname="key_reset" name="key_reset" />
            <blockpin signalname="PPI_portA(7:0)" name="portA(7:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_4">
            <blockpin signalname="PPI_enable" name="P" />
        </block>
        <block symbolname="Keyboard" name="XLXI_489">
            <blockpin signalname="PS2_DATA" name="datain" />
            <blockpin signalname="PS2_CLK" name="clkin" />
            <blockpin signalname="CLK4MHz" name="fclk" />
            <blockpin signalname="XLXN_56" name="rst" />
            <blockpin signalname="XLXN_57" name="fok" />
            <blockpin signalname="XLXN_29(7:0)" name="scancode(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_490">
            <blockpin signalname="XLXN_56" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="PPI_portC(3:0)">
            <wire x2="2464" y1="656" y2="656" x1="2320" />
        </branch>
        <branch name="PPI_enable">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="2320" y="592" type="branch" />
            <wire x2="2320" y1="576" y2="576" x1="2288" />
            <wire x2="2320" y1="576" y2="592" x1="2320" />
            <wire x2="2464" y1="592" y2="592" x1="2320" />
        </branch>
        <instance x="2464" y="752" name="XLXI_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2320" y="656" name="PPI_portC(3:0)" orien="R180" />
        <instance x="1408" y="1008" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_27(9:0)">
            <wire x2="2096" y1="976" y2="976" x1="1872" />
            <wire x2="2096" y1="784" y2="976" x1="2096" />
            <wire x2="2464" y1="784" y2="784" x1="2096" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="2080" y1="848" y2="848" x1="1872" />
            <wire x2="2080" y1="720" y2="848" x1="2080" />
            <wire x2="2464" y1="720" y2="720" x1="2080" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="2160" y1="912" y2="912" x1="1872" />
            <wire x2="2464" y1="848" y2="848" x1="2160" />
            <wire x2="2160" y1="848" y2="912" x1="2160" />
        </branch>
        <branch name="PPI_portA(7:0)">
            <wire x2="2880" y1="528" y2="528" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2880" y="528" name="PPI_portA(7:0)" orien="R0" />
        <branch name="joystick1(5:0)">
            <wire x2="2880" y1="752" y2="752" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2880" y="752" name="joystick1(5:0)" orien="R0" />
        <branch name="joystick2(5:0)">
            <wire x2="2880" y1="816" y2="816" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2880" y="816" name="joystick2(5:0)" orien="R0" />
        <instance x="2288" y="640" name="XLXI_4" orien="R270" />
        <branch name="XLXN_29(7:0)">
            <wire x2="1216" y1="320" y2="320" x1="1056" />
            <wire x2="1216" y1="320" y2="976" x1="1216" />
            <wire x2="1408" y1="976" y2="976" x1="1216" />
        </branch>
        <instance x="672" y="544" name="XLXI_489" orien="R0">
        </instance>
        <branch name="CLK4MHz">
            <wire x2="464" y1="688" y2="688" x1="304" />
            <wire x2="704" y1="688" y2="688" x1="464" />
            <wire x2="704" y1="688" y2="848" x1="704" />
            <wire x2="1104" y1="848" y2="848" x1="704" />
            <wire x2="1408" y1="848" y2="848" x1="1104" />
            <wire x2="672" y1="448" y2="448" x1="464" />
            <wire x2="464" y1="448" y2="688" x1="464" />
            <wire x2="2464" y1="528" y2="528" x1="1104" />
            <wire x2="1104" y1="528" y2="848" x1="1104" />
        </branch>
        <branch name="PS2_DATA">
            <wire x2="672" y1="320" y2="320" x1="608" />
        </branch>
        <iomarker fontsize="28" x="608" y="320" name="PS2_DATA" orien="R180" />
        <iomarker fontsize="28" x="304" y="688" name="CLK4MHz" orien="R180" />
        <branch name="PS2_CLK">
            <wire x2="672" y1="384" y2="384" x1="224" />
        </branch>
        <iomarker fontsize="28" x="224" y="384" name="PS2_CLK" orien="R180" />
        <instance x="224" y="656" name="XLXI_490" orien="R0" />
        <branch name="XLXN_56">
            <wire x2="672" y1="512" y2="512" x1="288" />
            <wire x2="288" y1="512" y2="528" x1="288" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1232" y1="576" y2="576" x1="1056" />
            <wire x2="1232" y1="576" y2="912" x1="1232" />
            <wire x2="1408" y1="912" y2="912" x1="1232" />
        </branch>
        <branch name="key_reset">
            <wire x2="2880" y1="576" y2="576" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2880" y="576" name="key_reset" orien="R0" />
    </sheet>
</drawing>