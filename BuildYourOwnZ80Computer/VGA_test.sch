<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK50MHz" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="RED3(2:0)" />
        <signal name="GREEN3(2:0)" />
        <signal name="BLUE2(1:0)" />
        <signal name="zero" />
        <signal name="un" />
        <signal name="un,zero,zero,un,un,zero,zero,un" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Output" name="RED3(2:0)" />
        <port polarity="Output" name="GREEN3(2:0)" />
        <port polarity="Output" name="BLUE2(1:0)" />
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-12-20T16:48:44</timestamp>
            <rect width="304" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="NEXUS_RGB">
            <timestamp>2011-2-10T19:2:53</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="320" y="-428" height="24" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="divideby2">
            <timestamp>2011-2-10T16:25:52</timestamp>
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_1">
            <blockpin signalname="XLXN_2" name="CLK_25MHz" />
            <blockpin signalname="un,zero,zero,un,un,zero,zero,un" name="DATA(7:0)" />
            <blockpin name="R" />
            <blockpin signalname="XLXN_3" name="RED" />
            <blockpin signalname="XLXN_4" name="GREEN" />
            <blockpin signalname="XLXN_5" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin name="ADDRESS(13:0)" />
        </block>
        <block symbolname="NEXUS_RGB" name="XLXI_2">
            <blockpin signalname="XLXN_3" name="RED_FF" />
            <blockpin signalname="XLXN_4" name="GREEN_FF" />
            <blockpin signalname="XLXN_5" name="BLUE_FF" />
            <blockpin signalname="RED3(2:0)" name="RED3(2:0)" />
            <blockpin signalname="GREEN3(2:0)" name="GREEN3(2:0)" />
            <blockpin signalname="BLUE2(1:0)" name="BLUE2(1:0)" />
        </block>
        <block symbolname="divideby2" name="XLXI_3">
            <blockpin signalname="CLK50MHz" name="CLKin" />
            <blockpin signalname="XLXN_2" name="CLKout" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_6">
            <blockpin signalname="un" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1168" y="1120" name="XLXI_1" orien="R0">
        </instance>
        <instance x="656" y="736" name="XLXI_3" orien="R0">
        </instance>
        <branch name="CLK50MHz">
            <wire x2="656" y1="704" y2="704" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="704" name="CLK50MHz" orien="R180" />
        <branch name="XLXN_2">
            <wire x2="1168" y1="704" y2="704" x1="1040" />
        </branch>
        <instance x="2048" y="1184" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_3">
            <wire x2="2048" y1="768" y2="768" x1="1600" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1824" y1="832" y2="832" x1="1600" />
            <wire x2="1824" y1="832" y2="896" x1="1824" />
            <wire x2="2048" y1="896" y2="896" x1="1824" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1808" y1="896" y2="896" x1="1600" />
            <wire x2="1808" y1="896" y2="1024" x1="1808" />
            <wire x2="2048" y1="1024" y2="1024" x1="1808" />
        </branch>
        <branch name="VSYNC">
            <wire x2="1648" y1="960" y2="960" x1="1600" />
        </branch>
        <branch name="HSYNC">
            <wire x2="1648" y1="1024" y2="1024" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1648" y="960" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="1648" y="1024" name="HSYNC" orien="R0" />
        <branch name="RED3(2:0)">
            <wire x2="2528" y1="768" y2="768" x1="2432" />
        </branch>
        <branch name="GREEN3(2:0)">
            <wire x2="2528" y1="960" y2="960" x1="2432" />
        </branch>
        <branch name="BLUE2(1:0)">
            <wire x2="2528" y1="1152" y2="1152" x1="2432" />
        </branch>
        <iomarker fontsize="28" x="2528" y="768" name="RED3(2:0)" orien="R0" />
        <iomarker fontsize="28" x="2528" y="960" name="GREEN3(2:0)" orien="R0" />
        <iomarker fontsize="28" x="2528" y="1152" name="BLUE2(1:0)" orien="R0" />
        <instance x="1136" y="1520" name="XLXI_5" orien="R0" />
        <instance x="1248" y="1376" name="XLXI_6" orien="R0" />
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="1200" y="1344" type="branch" />
            <wire x2="1200" y1="1344" y2="1392" x1="1200" />
        </branch>
        <branch name="un">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1312" y="1424" type="branch" />
            <wire x2="1312" y1="1376" y2="1424" x1="1312" />
        </branch>
        <branch name="un,zero,zero,un,un,zero,zero,un">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1056" y="1088" type="branch" />
            <wire x2="1168" y1="1088" y2="1088" x1="1056" />
        </branch>
    </sheet>
</drawing>