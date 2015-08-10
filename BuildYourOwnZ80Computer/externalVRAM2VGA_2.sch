<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="LEDS(7:0)" />
        <signal name="CLK50MHz" />
        <signal name="SWITCH_FILL" />
        <signal name="SWITCH_READ" />
        <signal name="XLXN_618" />
        <signal name="zorg(15:0)" />
        <signal name="zorg(0)" />
        <signal name="zorg(1)" />
        <signal name="zorg(2)" />
        <signal name="zorg(3)" />
        <signal name="XLXN_634" />
        <signal name="XLXN_632" />
        <signal name="XLXN_926" />
        <signal name="XLXN_927" />
        <signal name="TX" />
        <signal name="RX" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="XLXN_965" />
        <signal name="zorg(4)" />
        <signal name="zorg(5)" />
        <signal name="zorg(6)" />
        <signal name="zorg(7)" />
        <signal name="XLXN_986" />
        <signal name="XLXN_987" />
        <signal name="LAST_COUNTER,COUNTER2(1:0),COUNTER(15:0)" />
        <signal name="COUNTER(15:0)" />
        <signal name="COUNTER2(15:0)" />
        <signal name="XLXN_622" />
        <signal name="OE1_n" />
        <signal name="SWITCH_DSK" />
        <signal name="COUNTER2(2)" />
        <signal name="LAST_COUNTER" />
        <signal name="zero" />
        <signal name="LED1" />
        <signal name="XLXN_1020(7:0)" />
        <signal name="RED3(2:0)" />
        <signal name="GREEN3(2:0)" />
        <signal name="BLUE2(1:0)" />
        <signal name="XLXN_1023" />
        <signal name="DIV16(3)" />
        <signal name="XLXN_1025" />
        <signal name="XLXN_1029" />
        <signal name="XLXN_1030" />
        <signal name="DIV16(15:0)" />
        <signal name="XLXN_1032" />
        <signal name="XLXN_1035" />
        <signal name="XLXN_1039" />
        <signal name="ram_A(22:0)" />
        <signal name="ram_D(7:0)" />
        <signal name="ram_D_U(7:0)" />
        <signal name="XLXN_1045(23:0)" />
        <signal name="ram_W_p" />
        <signal name="ram_W_n" />
        <signal name="XLXN_1057" />
        <signal name="XLXN_1058" />
        <signal name="LB1_n" />
        <signal name="UB1_n" />
        <signal name="CRE1" />
        <signal name="ADV1_n" />
        <signal name="CLK1" />
        <signal name="CE2_p" />
        <signal name="CE1_p" />
        <signal name="RP2_n" />
        <signal name="CE1_n" />
        <signal name="CE2_n" />
        <signal name="OE1_p" />
        <signal name="XLXN_1080(13:0)" />
        <signal name="XLXN_1081" />
        <signal name="XLXN_1083" />
        <signal name="XLXN_1087" />
        <signal name="XLXN_1088" />
        <signal name="RP2_p" />
        <signal name="XLXN_1090" />
        <signal name="ROM_en" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Input" name="SWITCH_FILL" />
        <port polarity="Input" name="SWITCH_READ" />
        <port polarity="Output" name="TX" />
        <port polarity="Input" name="RX" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <port polarity="Output" name="COUNTER(15:0)" />
        <port polarity="Output" name="OE1_n" />
        <port polarity="Input" name="SWITCH_DSK" />
        <port polarity="Output" name="LED1" />
        <port polarity="Output" name="RED3(2:0)" />
        <port polarity="Output" name="GREEN3(2:0)" />
        <port polarity="Output" name="BLUE2(1:0)" />
        <port polarity="Output" name="ram_A(22:0)" />
        <port polarity="BiDirectional" name="ram_D(7:0)" />
        <port polarity="BiDirectional" name="ram_D_U(7:0)" />
        <port polarity="Output" name="ram_W_n" />
        <port polarity="Output" name="LB1_n" />
        <port polarity="Output" name="UB1_n" />
        <port polarity="Output" name="CRE1" />
        <port polarity="Output" name="ADV1_n" />
        <port polarity="Output" name="CLK1" />
        <port polarity="Output" name="CE2_p" />
        <port polarity="Output" name="CE1_p" />
        <port polarity="Output" name="RP2_n" />
        <port polarity="Output" name="CE1_n" />
        <port polarity="Output" name="CE2_n" />
        <port polarity="Output" name="OE1_p" />
        <port polarity="Output" name="RP2_p" />
        <port polarity="Input" name="ROM_en" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
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
        <blockdef name="RAMFiller">
            <timestamp>2011-3-10T15:0:34</timestamp>
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="256" x="64" y="-320" height="636" />
        </blockdef>
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-12-20T16:48:42</timestamp>
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
        <blockdef name="coco">
            <timestamp>2011-3-10T18:10:5</timestamp>
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-256" height="448" />
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
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-1024" y2="-64" x1="64" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-768" y2="-768" x1="0" />
            <line x2="64" y1="-640" y2="-640" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <arc ex="144" ey="-592" sx="144" sy="-496" r="48" cx="144" cy="-544" />
            <line x2="144" y1="-592" y2="-592" x1="64" />
            <line x2="64" y1="-496" y2="-496" x1="144" />
            <line x2="192" y1="-544" y2="-544" x1="256" />
            <line x2="64" y1="-832" y2="-832" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
        </blockdef>
        <blockdef name="NEXUS_RGB">
            <timestamp>2011-4-18T15:8:25</timestamp>
            <rect width="64" x="320" y="-428" height="24" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-448" height="444" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <rect width="64" x="0" y="-140" height="24" />
        </blockdef>
        <blockdef name="divideby2">
            <timestamp>2011-4-18T15:8:20</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MemoryDoubler">
            <timestamp>2011-3-10T15:7:36</timestamp>
            <line x2="0" y1="480" y2="480" x1="64" />
            <rect width="64" x="0" y="340" height="24" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <rect width="64" x="352" y="340" height="24" />
            <line x2="416" y1="352" y2="352" x1="352" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="416" y1="96" y2="96" x1="352" />
            <line x2="416" y1="160" y2="160" x1="352" />
            <line x2="416" y1="224" y2="224" x1="352" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="352" y="-236" height="24" />
            <line x2="416" y1="-224" y2="-224" x1="352" />
            <rect width="64" x="352" y="-108" height="24" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
            <rect width="64" x="352" y="-44" height="24" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
            <rect width="288" x="64" y="-256" height="768" />
        </blockdef>
        <blockdef name="ibuf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <block symbolname="cb16ce" name="XLXI_172">
            <blockpin signalname="XLXN_1083" name="C" />
            <blockpin signalname="XLXN_1032" name="CE" />
            <blockpin signalname="XLXN_987" name="CLR" />
            <blockpin signalname="XLXN_986" name="CEO" />
            <blockpin signalname="COUNTER(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="inv" name="XLXI_173">
            <blockpin signalname="SWITCH_FILL" name="I" />
            <blockpin signalname="XLXN_987" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_207">
            <blockpin signalname="XLXN_926" name="I0" />
            <blockpin signalname="XLXN_927" name="I1" />
            <blockpin signalname="XLXN_618" name="O" />
        </block>
        <block symbolname="and16" name="XLXI_238">
            <blockpin signalname="XLXN_965" name="I0" />
            <blockpin signalname="XLXN_965" name="I1" />
            <blockpin signalname="zorg(5)" name="I10" />
            <blockpin signalname="zorg(4)" name="I11" />
            <blockpin signalname="zorg(3)" name="I12" />
            <blockpin signalname="zorg(2)" name="I13" />
            <blockpin signalname="zorg(1)" name="I14" />
            <blockpin signalname="zorg(0)" name="I15" />
            <blockpin signalname="XLXN_965" name="I2" />
            <blockpin signalname="XLXN_965" name="I3" />
            <blockpin signalname="XLXN_965" name="I4" />
            <blockpin signalname="XLXN_965" name="I5" />
            <blockpin signalname="XLXN_965" name="I6" />
            <blockpin signalname="XLXN_965" name="I7" />
            <blockpin signalname="zorg(7)" name="I8" />
            <blockpin signalname="zorg(6)" name="I9" />
            <blockpin signalname="XLXN_927" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_205">
            <blockpin signalname="XLXN_634" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_204">
            <blockpin signalname="XLXN_632" name="G" />
        </block>
        <block symbolname="cb16ce" name="XLXI_208">
            <blockpin signalname="XLXN_926" name="C" />
            <blockpin signalname="XLXN_634" name="CE" />
            <blockpin signalname="XLXN_632" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="zorg(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="and2" name="XLXI_195">
            <blockpin signalname="SWITCH_READ" name="I0" />
            <blockpin signalname="XLXN_618" name="I1" />
            <blockpin signalname="XLXN_1039" name="O" />
        </block>
        <block symbolname="coco" name="XLXI_171">
            <blockpin signalname="RX" name="rx" />
            <blockpin signalname="XLXN_1039" name="do_switch" />
            <blockpin signalname="CLK50MHz" name="CLK_50MHz" />
            <blockpin signalname="DIV16(3)" name="CLK_read" />
            <blockpin signalname="XLXN_1020(7:0)" name="switches(7:0)" />
            <blockpin signalname="TX" name="tx" />
            <blockpin signalname="XLXN_1035" name="do_led" />
            <blockpin signalname="XLXN_926" name="CLK_baud" />
            <blockpin signalname="LEDS(7:0)" name="leds(7:0)" />
            <blockpin signalname="XLXN_1087" name="tx_complete" />
        </block>
        <block symbolname="RAMFiller" name="XLXI_144">
            <blockpin signalname="SWITCH_FILL" name="DO_FILL" />
            <blockpin signalname="SWITCH_READ" name="DO_READ" />
            <blockpin signalname="LAST_COUNTER,COUNTER2(1:0),COUNTER(15:0)" name="pic_A(18:0)" />
            <blockpin signalname="XLXN_1080(13:0)" name="pixel_A(13:0)" />
            <blockpin signalname="XLXN_1045(23:0)" name="ram_A(23:0)" />
        </block>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_170">
            <blockpin signalname="XLXN_1023" name="CLK_25MHz" />
            <blockpin signalname="XLXN_1020(7:0)" name="DATA(7:0)" />
            <blockpin name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="XLXN_1080(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_410">
            <blockpin signalname="XLXN_965" name="P" />
        </block>
        <block symbolname="cb16ce" name="XLXI_413">
            <blockpin signalname="XLXN_1083" name="C" />
            <blockpin signalname="XLXN_986" name="CE" />
            <blockpin signalname="XLXN_987" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="COUNTER2(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="and2" name="XLXI_198">
            <blockpin signalname="XLXN_622" name="I0" />
            <blockpin signalname="SWITCH_FILL" name="I1" />
            <blockpin signalname="OE1_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_199">
            <blockpin signalname="SWITCH_READ" name="I" />
            <blockpin signalname="XLXN_622" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_421">
            <blockpin signalname="SWITCH_DSK" name="I0" />
            <blockpin signalname="COUNTER2(2)" name="I1" />
            <blockpin signalname="LAST_COUNTER" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_141">
            <blockpin signalname="zero" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_427">
            <blockpin signalname="SWITCH_DSK" name="I" />
            <blockpin signalname="LED1" name="O" />
        </block>
        <block symbolname="NEXUS_RGB" name="XLXI_431">
            <blockpin name="RED_FF(1:0)" />
            <blockpin name="GREEN_FF(1:0)" />
            <blockpin name="BLUE_FF(1:0)" />
            <blockpin signalname="RED3(2:0)" name="RED3(2:0)" />
            <blockpin signalname="GREEN3(2:0)" name="GREEN3(2:0)" />
            <blockpin signalname="BLUE2(1:0)" name="BLUE2(1:0)" />
        </block>
        <block symbolname="divideby2" name="XLXI_442">
            <blockpin signalname="CLK50MHz" name="CLKin" />
            <blockpin signalname="XLXN_1023" name="CLKout" />
        </block>
        <block symbolname="inv" name="XLXI_460">
            <blockpin signalname="CLK50MHz" name="I" />
            <blockpin signalname="XLXN_1025" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_473">
            <blockpin signalname="XLXN_1029" name="P" />
        </block>
        <block symbolname="cb16ce" name="XLXI_471">
            <blockpin signalname="XLXN_1025" name="C" />
            <blockpin signalname="XLXN_1029" name="CE" />
            <blockpin signalname="XLXN_1030" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="DIV16(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="gnd" name="XLXI_472">
            <blockpin signalname="XLXN_1030" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_474">
            <blockpin signalname="XLXN_1032" name="P" />
        </block>
        <block symbolname="inv" name="XLXI_475">
            <blockpin signalname="XLXN_1035" name="I" />
            <blockpin signalname="XLXN_1081" name="O" />
        </block>
        <block symbolname="MemoryDoubler" name="XLXI_496">
            <blockpin signalname="OE1_p" name="OE" />
            <blockpin signalname="XLXN_1035" name="w" />
            <blockpin signalname="XLXN_1045(23:0)" name="A(23:0)" />
            <blockpin signalname="LEDS(7:0)" name="Din(7:0)" />
            <blockpin signalname="ram_D_U(7:0)" name="ram_D_Upper(7:0)" />
            <blockpin signalname="ram_D(7:0)" name="ram_D_Lower(7:0)" />
            <blockpin signalname="ram_W_p" name="ram_W" />
            <blockpin signalname="XLXN_1057" name="ram_EnableUpper" />
            <blockpin signalname="XLXN_1058" name="ram_EnableLower" />
            <blockpin signalname="XLXN_1020(7:0)" name="Dout(7:0)" />
            <blockpin signalname="ram_A(22:0)" name="ram_A(22:0)" />
        </block>
        <block symbolname="inv" name="XLXI_487">
            <blockpin signalname="ram_W_p" name="I" />
            <blockpin signalname="ram_W_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_502">
            <blockpin signalname="XLXN_1057" name="I" />
            <blockpin signalname="UB1_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_503">
            <blockpin signalname="XLXN_1058" name="I" />
            <blockpin signalname="LB1_n" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_446">
            <blockpin signalname="CRE1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_457">
            <blockpin signalname="CLK1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_458">
            <blockpin signalname="ADV1_n" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_470">
            <blockpin signalname="CE2_n" name="I" />
            <blockpin signalname="CE2_p" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_439">
            <blockpin signalname="CE1_n" name="I" />
            <blockpin signalname="CE1_p" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_482">
            <blockpin signalname="RP2_n" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_486">
            <blockpin signalname="CE1_n" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_441">
            <blockpin signalname="OE1_n" name="I" />
            <blockpin signalname="OE1_p" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_506">
            <blockpin signalname="XLXN_1088" name="I0" />
            <blockpin signalname="XLXN_1081" name="I1" />
            <blockpin signalname="XLXN_1083" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_508">
            <blockpin signalname="XLXN_1087" name="I" />
            <blockpin signalname="XLXN_1088" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_509">
            <blockpin signalname="XLXN_1090" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_510">
            <blockpin signalname="XLXN_1090" name="I" />
            <blockpin signalname="RP2_p" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_511">
            <blockpin signalname="ROM_en" name="I" />
            <blockpin signalname="CE2_n" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="LEDS(7:0)">
            <wire x2="2112" y1="1040" y2="1040" x1="2000" />
            <wire x2="2112" y1="1040" y2="1072" x1="2112" />
            <wire x2="2176" y1="1040" y2="1040" x1="2112" />
            <wire x2="2176" y1="752" y2="1040" x1="2176" />
            <wire x2="3120" y1="752" y2="752" x1="2176" />
            <wire x2="3120" y1="752" y2="1936" x1="3120" />
            <wire x2="3296" y1="1936" y2="1936" x1="3120" />
        </branch>
        <instance x="1296" y="1536" name="XLXI_207" orien="R270" />
        <instance x="896" y="2288" name="XLXI_238" orien="R0" />
        <bustap x2="832" y1="1264" y2="1264" x1="736" />
        <bustap x2="832" y1="1328" y2="1328" x1="736" />
        <bustap x2="832" y1="1392" y2="1392" x1="736" />
        <bustap x2="832" y1="1456" y2="1456" x1="736" />
        <instance x="48" y="1216" name="XLXI_205" orien="R0" />
        <instance x="128" y="1504" name="XLXI_204" orien="R0" />
        <instance x="240" y="1408" name="XLXI_208" orien="R0" />
        <branch name="XLXN_618">
            <wire x2="1200" y1="1200" y2="1280" x1="1200" />
        </branch>
        <branch name="zorg(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="705" y="1152" type="branch" />
            <wire x2="736" y1="1152" y2="1152" x1="624" />
            <wire x2="736" y1="1152" y2="1264" x1="736" />
            <wire x2="736" y1="1264" y2="1328" x1="736" />
            <wire x2="736" y1="1328" y2="1392" x1="736" />
            <wire x2="736" y1="1392" y2="1456" x1="736" />
            <wire x2="736" y1="1456" y2="1520" x1="736" />
            <wire x2="736" y1="1520" y2="1584" x1="736" />
            <wire x2="736" y1="1584" y2="1648" x1="736" />
            <wire x2="736" y1="1648" y2="1712" x1="736" />
            <wire x2="736" y1="1712" y2="2224" x1="736" />
        </branch>
        <branch name="zorg(1)">
            <wire x2="896" y1="1328" y2="1328" x1="832" />
        </branch>
        <branch name="zorg(2)">
            <wire x2="896" y1="1392" y2="1392" x1="832" />
        </branch>
        <branch name="zorg(3)">
            <wire x2="896" y1="1456" y2="1456" x1="832" />
        </branch>
        <branch name="XLXN_634">
            <wire x2="240" y1="1216" y2="1216" x1="112" />
        </branch>
        <branch name="XLXN_632">
            <wire x2="240" y1="1376" y2="1376" x1="192" />
        </branch>
        <instance x="1328" y="1200" name="XLXI_195" orien="R270" />
        <branch name="XLXN_927">
            <wire x2="1168" y1="1744" y2="1744" x1="1152" />
            <wire x2="1168" y1="1536" y2="1744" x1="1168" />
        </branch>
        <instance x="1488" y="704" name="XLXI_172" orien="R0" />
        <branch name="TX">
            <wire x2="2048" y1="848" y2="848" x1="2000" />
        </branch>
        <branch name="RX">
            <wire x2="1616" y1="848" y2="848" x1="1568" />
        </branch>
        <instance x="1616" y="1072" name="XLXI_171" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2048" y="848" name="TX" orien="R0" />
        <iomarker fontsize="28" x="1568" y="848" name="RX" orien="R180" />
        <instance x="2656" y="1136" name="XLXI_144" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2432" y="1232" name="SWITCH_READ" orien="R180" />
        <iomarker fontsize="28" x="2432" y="1168" name="SWITCH_FILL" orien="R180" />
        <branch name="VSYNC">
            <wire x2="3840" y1="976" y2="976" x1="3696" />
        </branch>
        <branch name="HSYNC">
            <wire x2="3840" y1="1040" y2="1040" x1="3696" />
        </branch>
        <instance x="3264" y="1136" name="XLXI_170" orien="R0">
        </instance>
        <bustap x2="832" y1="1520" y2="1520" x1="736" />
        <bustap x2="832" y1="1584" y2="1584" x1="736" />
        <branch name="zorg(4)">
            <wire x2="896" y1="1520" y2="1520" x1="832" />
        </branch>
        <branch name="zorg(5)">
            <wire x2="896" y1="1584" y2="1584" x1="832" />
        </branch>
        <bustap x2="832" y1="1648" y2="1648" x1="736" />
        <branch name="zorg(6)">
            <wire x2="896" y1="1648" y2="1648" x1="832" />
        </branch>
        <bustap x2="832" y1="1712" y2="1712" x1="736" />
        <branch name="zorg(7)">
            <wire x2="896" y1="1712" y2="1712" x1="832" />
        </branch>
        <instance x="800" y="1216" name="XLXI_410" orien="R0" />
        <instance x="1984" y="2224" name="XLXI_173" orien="R180" />
        <instance x="2384" y="400" name="XLXI_413" orien="R0" />
        <branch name="XLXN_986">
            <wire x2="2096" y1="512" y2="512" x1="1872" />
            <wire x2="2096" y1="208" y2="512" x1="2096" />
            <wire x2="2384" y1="208" y2="208" x1="2096" />
        </branch>
        <branch name="LAST_COUNTER,COUNTER2(1:0),COUNTER(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2608" y="976" type="branch" />
            <wire x2="2656" y1="976" y2="976" x1="2608" />
        </branch>
        <branch name="COUNTER(15:0)">
            <wire x2="1952" y1="448" y2="448" x1="1872" />
        </branch>
        <branch name="COUNTER2(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="144" type="branch" />
            <wire x2="2960" y1="144" y2="144" x1="2768" />
        </branch>
        <instance x="3072" y="448" name="XLXI_421" orien="R0" />
        <branch name="LAST_COUNTER">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3424" y="352" type="branch" />
            <wire x2="3424" y1="352" y2="352" x1="3328" />
        </branch>
        <iomarker fontsize="28" x="496" y="144" name="CLK50MHz" orien="R180" />
        <instance x="320" y="688" name="XLXI_141" orien="R0" />
        <branch name="zero">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="384" y="432" type="branch" />
            <wire x2="384" y1="432" y2="560" x1="384" />
        </branch>
        <iomarker fontsize="28" x="2912" y="384" name="SWITCH_DSK" orien="R180" />
        <instance x="3024" y="528" name="XLXI_427" orien="R0" />
        <branch name="LED1">
            <wire x2="3328" y1="496" y2="496" x1="3248" />
        </branch>
        <iomarker fontsize="28" x="3328" y="496" name="LED1" orien="R0" />
        <iomarker fontsize="28" x="3888" y="784" name="RED" orien="R0" />
        <iomarker fontsize="28" x="3888" y="848" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="3888" y="912" name="BLUE" orien="R0" />
        <instance x="4336" y="976" name="XLXI_431" orien="R0">
        </instance>
        <branch name="RED3(2:0)">
            <wire x2="4800" y1="560" y2="560" x1="4720" />
        </branch>
        <branch name="GREEN3(2:0)">
            <wire x2="4800" y1="752" y2="752" x1="4720" />
        </branch>
        <branch name="BLUE2(1:0)">
            <wire x2="4800" y1="944" y2="944" x1="4720" />
        </branch>
        <iomarker fontsize="28" x="4800" y="560" name="RED3(2:0)" orien="R0" />
        <iomarker fontsize="28" x="4800" y="752" name="GREEN3(2:0)" orien="R0" />
        <iomarker fontsize="28" x="4800" y="944" name="BLUE2(1:0)" orien="R0" />
        <instance x="688" y="336" name="XLXI_442" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2112" y="1072" name="LEDS(7:0)" orien="R90" />
        <branch name="XLXN_1023">
            <wire x2="2192" y1="304" y2="304" x1="1072" />
            <wire x2="2192" y1="304" y2="720" x1="2192" />
            <wire x2="3264" y1="720" y2="720" x1="2192" />
        </branch>
        <branch name="XLXN_1025">
            <wire x2="560" y1="528" y2="656" x1="560" />
            <wire x2="608" y1="656" y2="656" x1="560" />
        </branch>
        <instance x="528" y="304" name="XLXI_460" orien="R90" />
        <instance x="608" y="784" name="XLXI_471" orien="R0" />
        <instance x="448" y="688" name="XLXI_472" orien="R90" />
        <branch name="XLXN_1030">
            <wire x2="608" y1="752" y2="752" x1="576" />
        </branch>
        <branch name="XLXN_1029">
            <wire x2="608" y1="592" y2="592" x1="592" />
        </branch>
        <instance x="592" y="656" name="XLXI_473" orien="R270" />
        <branch name="DIV16(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1056" y="528" type="branch" />
            <wire x2="1056" y1="528" y2="528" x1="992" />
        </branch>
        <branch name="XLXN_987">
            <wire x2="1488" y1="672" y2="672" x1="1440" />
            <wire x2="1440" y1="672" y2="768" x1="1440" />
            <wire x2="2384" y1="768" y2="768" x1="1440" />
            <wire x2="1440" y1="768" y2="2096" x1="1440" />
            <wire x2="1648" y1="2096" y2="2096" x1="1440" />
            <wire x2="1648" y1="2096" y2="2256" x1="1648" />
            <wire x2="1760" y1="2256" y2="2256" x1="1648" />
            <wire x2="2384" y1="368" y2="768" x1="2384" />
        </branch>
        <branch name="XLXN_1032">
            <wire x2="1488" y1="512" y2="512" x1="1456" />
        </branch>
        <instance x="1392" y="512" name="XLXI_474" orien="R0" />
        <branch name="DIV16(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1088" y="432" type="branch" />
            <wire x2="1408" y1="432" y2="432" x1="1088" />
            <wire x2="1408" y1="432" y2="1168" x1="1408" />
            <wire x2="1616" y1="1168" y2="1168" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1952" y="448" name="COUNTER(15:0)" orien="R0" />
        <branch name="COUNTER2(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2928" y="320" type="branch" />
            <wire x2="3072" y1="320" y2="320" x1="2928" />
        </branch>
        <branch name="SWITCH_DSK">
            <wire x2="3024" y1="384" y2="384" x1="2912" />
            <wire x2="3024" y1="384" y2="496" x1="3024" />
            <wire x2="3072" y1="384" y2="384" x1="3024" />
        </branch>
        <instance x="3296" y="1584" name="XLXI_496" orien="R0">
        </instance>
        <branch name="ram_A(22:0)">
            <wire x2="3760" y1="1360" y2="1360" x1="3712" />
        </branch>
        <branch name="ram_D(7:0)">
            <wire x2="3792" y1="1552" y2="1552" x1="3712" />
        </branch>
        <branch name="ram_D_U(7:0)">
            <wire x2="3792" y1="1488" y2="1488" x1="3712" />
        </branch>
        <iomarker fontsize="28" x="3760" y="1360" name="ram_A(22:0)" orien="R0" />
        <iomarker fontsize="28" x="3792" y="1552" name="ram_D(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3792" y="1488" name="ram_D_U(7:0)" orien="R0" />
        <branch name="XLXN_1045(23:0)">
            <wire x2="3184" y1="976" y2="976" x1="3040" />
            <wire x2="3184" y1="976" y2="1360" x1="3184" />
            <wire x2="3296" y1="1360" y2="1360" x1="3184" />
        </branch>
        <branch name="SWITCH_FILL">
            <wire x2="2496" y1="2256" y2="2256" x1="1984" />
            <wire x2="2496" y1="1168" y2="1168" x1="2432" />
            <wire x2="2560" y1="1168" y2="1168" x1="2496" />
            <wire x2="2656" y1="1168" y2="1168" x1="2560" />
            <wire x2="2560" y1="1168" y2="1536" x1="2560" />
            <wire x2="2880" y1="1536" y2="1536" x1="2560" />
            <wire x2="2880" y1="1536" y2="1904" x1="2880" />
            <wire x2="2496" y1="1168" y2="2256" x1="2496" />
        </branch>
        <instance x="2528" y="1776" name="XLXI_199" orien="R0" />
        <branch name="ram_W_n">
            <wire x2="4032" y1="1680" y2="1680" x1="3984" />
        </branch>
        <branch name="XLXN_1057">
            <wire x2="3760" y1="1744" y2="1744" x1="3712" />
        </branch>
        <branch name="XLXN_1058">
            <wire x2="3760" y1="1808" y2="1808" x1="3712" />
        </branch>
        <instance x="3760" y="1776" name="XLXI_502" orien="R0" />
        <instance x="3760" y="1840" name="XLXI_503" orien="R0" />
        <branch name="LB1_n">
            <wire x2="4032" y1="1808" y2="1808" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4032" y="1808" name="LB1_n" orien="R0" />
        <branch name="UB1_n">
            <wire x2="4032" y1="1744" y2="1744" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4032" y="1744" name="UB1_n" orien="R0" />
        <branch name="XLXN_1020(7:0)">
            <wire x2="1616" y1="1040" y2="1040" x1="1488" />
            <wire x2="1488" y1="1040" y2="2848" x1="1488" />
            <wire x2="4480" y1="2848" y2="2848" x1="1488" />
            <wire x2="3264" y1="1104" y2="1104" x1="3216" />
            <wire x2="3216" y1="1104" y2="1216" x1="3216" />
            <wire x2="4480" y1="1216" y2="1216" x1="3216" />
            <wire x2="4480" y1="1216" y2="1936" x1="4480" />
            <wire x2="4480" y1="1936" y2="2848" x1="4480" />
            <wire x2="4480" y1="1936" y2="1936" x1="3712" />
        </branch>
        <branch name="CRE1">
            <wire x2="3040" y1="3264" y2="3344" x1="3040" />
        </branch>
        <branch name="ADV1_n">
            <wire x2="2464" y1="3776" y2="3840" x1="2464" />
        </branch>
        <branch name="CLK1">
            <wire x2="2592" y1="3664" y2="3744" x1="2592" />
        </branch>
        <branch name="CE2_p">
            <wire x2="1728" y1="3216" y2="3216" x1="1712" />
            <wire x2="1712" y1="3216" y2="3328" x1="1712" />
        </branch>
        <branch name="CE1_p">
            <wire x2="2800" y1="3200" y2="3200" x1="2784" />
            <wire x2="2800" y1="3200" y2="3296" x1="2800" />
        </branch>
        <branch name="RP2_n">
            <wire x2="2288" y1="3440" y2="3536" x1="2288" />
        </branch>
        <branch name="CE1_n">
            <wire x2="2480" y1="3200" y2="3200" x1="2320" />
            <wire x2="2560" y1="3200" y2="3200" x1="2480" />
            <wire x2="2480" y1="3200" y2="3296" x1="2480" />
        </branch>
        <branch name="CE2_n">
            <wire x2="2032" y1="3216" y2="3216" x1="1952" />
            <wire x2="2032" y1="3216" y2="3296" x1="2032" />
            <wire x2="2048" y1="3216" y2="3216" x1="2032" />
            <wire x2="2048" y1="3136" y2="3216" x1="2048" />
        </branch>
        <instance x="2976" y="3472" name="XLXI_446" orien="R0" />
        <text style="fontsize:28;fontname:Arial" x="2688" y="3736">The CLK and ADV# inputs can be tied to VSS if the device is always operating in asynchronous                                                              
or page mode</text>
        <instance x="2528" y="3872" name="XLXI_457" orien="R0" />
        <instance x="2528" y="3648" name="XLXI_458" orien="R180" />
        <text style="fontsize:28;fontname:Arial" x="2728" y="3820">VSS must be connected to ground</text>
        <instance x="1952" y="3184" name="XLXI_470" orien="R180" />
        <instance x="2560" y="3232" name="XLXI_439" orien="R0" />
        <instance x="2224" y="3440" name="XLXI_482" orien="R0" />
        <instance x="2192" y="3136" name="XLXI_486" orien="R90" />
        <iomarker fontsize="28" x="3040" y="3264" name="CRE1" orien="R270" />
        <iomarker fontsize="28" x="2464" y="3840" name="ADV1_n" orien="R90" />
        <iomarker fontsize="28" x="2592" y="3664" name="CLK1" orien="R270" />
        <iomarker fontsize="28" x="2032" y="3296" name="CE2_n" orien="R90" />
        <iomarker fontsize="28" x="1712" y="3328" name="CE2_p" orien="R90" />
        <iomarker fontsize="28" x="2480" y="3296" name="CE1_n" orien="R90" />
        <iomarker fontsize="28" x="2800" y="3296" name="CE1_p" orien="R90" />
        <iomarker fontsize="28" x="2288" y="3536" name="RP2_n" orien="R90" />
        <branch name="OE1_p">
            <wire x2="3296" y1="2064" y2="2064" x1="3232" />
            <wire x2="3232" y1="2064" y2="2176" x1="3232" />
            <wire x2="3328" y1="2176" y2="2176" x1="3232" />
            <wire x2="3328" y1="2176" y2="2352" x1="3328" />
            <wire x2="3424" y1="2352" y2="2352" x1="3328" />
            <wire x2="3328" y1="2352" y2="2352" x1="3312" />
        </branch>
        <instance x="3088" y="2384" name="XLXI_441" orien="R0" />
        <iomarker fontsize="28" x="3424" y="2352" name="OE1_p" orien="R0" />
        <branch name="XLXN_622">
            <wire x2="2816" y1="1744" y2="1744" x1="2752" />
            <wire x2="2816" y1="1744" y2="1904" x1="2816" />
        </branch>
        <instance x="2752" y="1904" name="XLXI_198" orien="R90" />
        <branch name="OE1_n">
            <wire x2="2848" y1="2160" y2="2240" x1="2848" />
            <wire x2="3088" y1="2240" y2="2240" x1="2848" />
            <wire x2="3088" y1="2240" y2="2352" x1="3088" />
            <wire x2="3136" y1="2240" y2="2240" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3136" y="2240" name="OE1_n" orien="R0" />
        <branch name="XLXN_1080(13:0)">
            <wire x2="2576" y1="624" y2="1424" x1="2576" />
            <wire x2="2656" y1="1424" y2="1424" x1="2576" />
            <wire x2="3728" y1="624" y2="624" x1="2576" />
            <wire x2="3728" y1="624" y2="1104" x1="3728" />
            <wire x2="3728" y1="1104" y2="1104" x1="3696" />
        </branch>
        <iomarker fontsize="28" x="3840" y="976" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="3840" y="1040" name="HSYNC" orien="R0" />
        <branch name="ram_W_p">
            <wire x2="3760" y1="1680" y2="1680" x1="3712" />
        </branch>
        <instance x="3760" y="1712" name="XLXI_487" orien="R0" />
        <iomarker fontsize="28" x="4032" y="1680" name="ram_W_n" orien="R0" />
        <branch name="XLXN_1081">
            <wire x2="1216" y1="592" y2="608" x1="1216" />
            <wire x2="1360" y1="608" y2="608" x1="1216" />
            <wire x2="1360" y1="608" y2="720" x1="1360" />
            <wire x2="1504" y1="720" y2="720" x1="1360" />
        </branch>
        <branch name="XLXN_1083">
            <wire x2="1248" y1="272" y2="336" x1="1248" />
            <wire x2="1360" y1="272" y2="272" x1="1248" />
            <wire x2="1360" y1="272" y2="576" x1="1360" />
            <wire x2="1488" y1="576" y2="576" x1="1360" />
            <wire x2="2384" y1="272" y2="272" x1="1360" />
        </branch>
        <instance x="1344" y="592" name="XLXI_506" orien="R270" />
        <instance x="1728" y="688" name="XLXI_475" orien="R180" />
        <branch name="XLXN_1035">
            <wire x2="2144" y1="720" y2="720" x1="1728" />
            <wire x2="2144" y1="720" y2="864" x1="2144" />
            <wire x2="2544" y1="864" y2="864" x1="2144" />
            <wire x2="2544" y1="864" y2="1680" x1="2544" />
            <wire x2="3296" y1="1680" y2="1680" x1="2544" />
            <wire x2="2144" y1="864" y2="912" x1="2144" />
            <wire x2="2144" y1="912" y2="912" x1="2000" />
        </branch>
        <branch name="XLXN_926">
            <wire x2="240" y1="1280" y2="1280" x1="112" />
            <wire x2="112" y1="1280" y2="2288" x1="112" />
            <wire x2="1344" y1="2288" y2="2288" x1="112" />
            <wire x2="1232" y1="1536" y2="1568" x1="1232" />
            <wire x2="1344" y1="1568" y2="1568" x1="1232" />
            <wire x2="1344" y1="1568" y2="2288" x1="1344" />
            <wire x2="1344" y1="1328" y2="1568" x1="1344" />
            <wire x2="2080" y1="1328" y2="1328" x1="1344" />
            <wire x2="2080" y1="976" y2="976" x1="2000" />
            <wire x2="2080" y1="976" y2="1328" x1="2080" />
        </branch>
        <branch name="SWITCH_READ">
            <wire x2="1264" y1="1200" y2="1424" x1="1264" />
            <wire x2="2464" y1="1424" y2="1424" x1="1264" />
            <wire x2="2464" y1="1232" y2="1232" x1="2432" />
            <wire x2="2512" y1="1232" y2="1232" x1="2464" />
            <wire x2="2512" y1="1232" y2="1744" x1="2512" />
            <wire x2="2528" y1="1744" y2="1744" x1="2512" />
            <wire x2="2656" y1="1232" y2="1232" x1="2512" />
            <wire x2="2464" y1="1232" y2="1424" x1="2464" />
        </branch>
        <branch name="zorg(0)">
            <wire x2="896" y1="1264" y2="1264" x1="832" />
        </branch>
        <branch name="XLXN_965">
            <wire x2="864" y1="1216" y2="1776" x1="864" />
            <wire x2="896" y1="1776" y2="1776" x1="864" />
            <wire x2="864" y1="1776" y2="1840" x1="864" />
            <wire x2="864" y1="1840" y2="1904" x1="864" />
            <wire x2="896" y1="1904" y2="1904" x1="864" />
            <wire x2="864" y1="1904" y2="1968" x1="864" />
            <wire x2="896" y1="1968" y2="1968" x1="864" />
            <wire x2="864" y1="1968" y2="2032" x1="864" />
            <wire x2="896" y1="2032" y2="2032" x1="864" />
            <wire x2="864" y1="2032" y2="2096" x1="864" />
            <wire x2="896" y1="2096" y2="2096" x1="864" />
            <wire x2="864" y1="2096" y2="2160" x1="864" />
            <wire x2="896" y1="2160" y2="2160" x1="864" />
            <wire x2="864" y1="2160" y2="2224" x1="864" />
            <wire x2="896" y1="2224" y2="2224" x1="864" />
            <wire x2="896" y1="1840" y2="1840" x1="864" />
        </branch>
        <branch name="XLXN_1039">
            <wire x2="1232" y1="928" y2="944" x1="1232" />
            <wire x2="1296" y1="928" y2="928" x1="1232" />
            <wire x2="1296" y1="928" y2="1104" x1="1296" />
            <wire x2="1616" y1="1104" y2="1104" x1="1296" />
        </branch>
        <instance x="1248" y="880" name="XLXI_508" orien="R270" />
        <branch name="XLXN_1087">
            <wire x2="1216" y1="880" y2="896" x1="1216" />
            <wire x2="1280" y1="896" y2="896" x1="1216" />
            <wire x2="2032" y1="784" y2="784" x1="1280" />
            <wire x2="2032" y1="784" y2="1232" x1="2032" />
            <wire x2="1280" y1="784" y2="896" x1="1280" />
            <wire x2="2032" y1="1232" y2="1232" x1="2000" />
        </branch>
        <branch name="XLXN_1088">
            <wire x2="1216" y1="624" y2="656" x1="1216" />
            <wire x2="1280" y1="624" y2="624" x1="1216" />
            <wire x2="1280" y1="592" y2="624" x1="1280" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="560" y1="144" y2="144" x1="496" />
            <wire x2="560" y1="144" y2="304" x1="560" />
            <wire x2="688" y1="304" y2="304" x1="560" />
            <wire x2="1376" y1="144" y2="144" x1="560" />
            <wire x2="1376" y1="144" y2="976" x1="1376" />
            <wire x2="1616" y1="976" y2="976" x1="1376" />
        </branch>
        <instance x="3456" y="3472" name="XLXI_509" orien="R0" />
        <instance x="3536" y="3264" name="XLXI_510" orien="R0" />
        <branch name="RP2_p">
            <wire x2="3824" y1="3232" y2="3232" x1="3760" />
            <wire x2="3824" y1="3232" y2="3296" x1="3824" />
        </branch>
        <iomarker fontsize="28" x="3824" y="3296" name="RP2_p" orien="R90" />
        <branch name="XLXN_1090">
            <wire x2="3536" y1="3232" y2="3232" x1="3520" />
            <wire x2="3520" y1="3232" y2="3344" x1="3520" />
        </branch>
        <instance x="2016" y="2912" name="XLXI_511" orien="R90" />
        <branch name="ROM_en">
            <wire x2="1904" y1="2896" y2="2912" x1="1904" />
            <wire x2="2048" y1="2896" y2="2896" x1="1904" />
            <wire x2="2048" y1="2896" y2="2912" x1="2048" />
        </branch>
        <iomarker fontsize="28" x="1904" y="2912" name="ROM_en" orien="R90" />
        <branch name="RED">
            <wire x2="3808" y1="784" y2="784" x1="3696" />
            <wire x2="3888" y1="784" y2="784" x1="3808" />
            <wire x2="3808" y1="592" y2="784" x1="3808" />
        </branch>
        <branch name="GREEN">
            <wire x2="3840" y1="848" y2="848" x1="3696" />
            <wire x2="3888" y1="848" y2="848" x1="3840" />
            <wire x2="3840" y1="720" y2="848" x1="3840" />
        </branch>
        <branch name="BLUE">
            <wire x2="3792" y1="912" y2="912" x1="3696" />
            <wire x2="3888" y1="912" y2="912" x1="3792" />
            <wire x2="3792" y1="736" y2="912" x1="3792" />
            <wire x2="4096" y1="736" y2="736" x1="3792" />
            <wire x2="4096" y1="736" y2="848" x1="4096" />
        </branch>
    </sheet>
</drawing>