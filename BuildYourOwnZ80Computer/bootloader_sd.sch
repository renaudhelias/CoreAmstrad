<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="MISO" />
        <signal name="MOSI" />
        <signal name="FILE_SELECT(7:0)" />
        <signal name="XLXN_55(31:0)" />
        <signal name="ram_A(22:0)" />
        <signal name="ram_W" />
        <signal name="INIT_DONE" />
        <signal name="CLK8MHz" />
        <signal name="SCLK" />
        <signal name="DO_STOP" />
        <signal name="nCLK8MHz" />
        <signal name="is_ucpm" />
        <signal name="FILE_LOADED" />
        <signal name="XLXN_89" />
        <signal name="XLXN_91" />
        <signal name="ram_W_n" />
        <signal name="XLXN_94" />
        <signal name="XLXN_98" />
        <signal name="XLXN_99" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101" />
        <signal name="XLXN_52(7:0)" />
        <signal name="XLXN_103(7:0)" />
        <signal name="dump" />
        <signal name="XLXN_107(7:0)" />
        <signal name="LEDS(7:0)" />
        <signal name="leds_select(4:0)" />
        <signal name="leds_select(3)" />
        <signal name="leds_select(2:0)" />
        <signal name="XLXN_114(7:0)" />
        <signal name="leds_select(4)" />
        <signal name="SS_n" />
        <signal name="XLXN_76" />
        <signal name="XLXN_126" />
        <signal name="XLXN_127" />
        <signal name="XLXN_128" />
        <signal name="XLXN_129" />
        <signal name="key_reset" />
        <signal name="file_change" />
        <signal name="FDC_input(6:0)" />
        <signal name="FDC_output(5:0)" />
        <signal name="ram_Din(7:0)" />
        <signal name="ram_Dout(7:0)" />
        <signal name="XLXN_130" />
        <signal name="ram_R_n" />
        <signal name="dir_entry_clk" />
        <signal name="dir_entry_r" />
        <signal name="dir_entry_ack" />
        <signal name="dir_entry_downloading" />
        <signal name="dir_entry_d(7:0)" />
        <port polarity="Input" name="MISO" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Input" name="FILE_SELECT(7:0)" />
        <port polarity="Output" name="ram_A(22:0)" />
        <port polarity="Input" name="CLK8MHz" />
        <port polarity="Output" name="SCLK" />
        <port polarity="Input" name="nCLK8MHz" />
        <port polarity="Output" name="is_ucpm" />
        <port polarity="Output" name="FILE_LOADED" />
        <port polarity="Output" name="ram_W_n" />
        <port polarity="Input" name="dump" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="Input" name="leds_select(4:0)" />
        <port polarity="Output" name="SS_n" />
        <port polarity="Input" name="key_reset" />
        <port polarity="Input" name="file_change" />
        <port polarity="Input" name="FDC_input(6:0)" />
        <port polarity="Output" name="FDC_output(5:0)" />
        <port polarity="Input" name="ram_Din(7:0)" />
        <port polarity="Output" name="ram_Dout(7:0)" />
        <port polarity="Output" name="ram_R_n" />
        <port polarity="Output" name="dir_entry_clk" />
        <port polarity="Output" name="dir_entry_r" />
        <port polarity="Input" name="dir_entry_ack" />
        <port polarity="Input" name="dir_entry_downloading" />
        <port polarity="Input" name="dir_entry_d(7:0)" />
        <blockdef name="SDRAM_SPIMASTER">
            <timestamp>2015-3-11T18:39:17</timestamp>
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="256" x="64" y="-256" height="636" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="SDRAM_FAT32_LOADER">
            <timestamp>2015-3-14T15:54:3</timestamp>
            <rect width="64" x="0" y="660" height="24" />
            <line x2="0" y1="672" y2="672" x1="64" />
            <line x2="0" y1="576" y2="576" x1="64" />
            <line x2="0" y1="624" y2="624" x1="64" />
            <line x2="432" y1="576" y2="576" x1="368" />
            <line x2="432" y1="624" y2="624" x1="368" />
            <rect width="64" x="0" y="516" height="24" />
            <line x2="0" y1="528" y2="528" x1="64" />
            <rect width="64" x="368" y="516" height="24" />
            <line x2="432" y1="528" y2="528" x1="368" />
            <line x2="432" y1="480" y2="480" x1="368" />
            <line x2="0" y1="416" y2="416" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <line x2="432" y1="224" y2="224" x1="368" />
            <rect width="64" x="368" y="20" height="24" />
            <line x2="432" y1="32" y2="32" x1="368" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <line x2="432" y1="-304" y2="-304" x1="368" />
            <line x2="432" y1="96" y2="96" x1="368" />
            <line x2="432" y1="160" y2="160" x1="368" />
            <rect width="64" x="0" y="-92" height="24" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <rect width="64" x="368" y="260" height="24" />
            <line x2="432" y1="272" y2="272" x1="368" />
            <rect width="64" x="0" y="-316" height="24" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="368" y2="368" x1="64" />
            <line x2="432" y1="320" y2="320" x1="368" />
            <line x2="0" y1="480" y2="480" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="368" y="-268" height="24" />
            <line x2="432" y1="-256" y2="-256" x1="368" />
            <rect width="304" x="64" y="-384" height="1136" />
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="LEDS_SWITCH2">
            <timestamp>2014-11-9T11:21:50</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="SDRAM_SPIMASTER" name="XLXI_1">
            <blockpin signalname="XLXN_130" name="reset" />
            <blockpin signalname="nCLK8MHz" name="SCLK" />
            <blockpin signalname="MISO" name="MISO" />
            <blockpin signalname="XLXN_89" name="CD_n" />
            <blockpin signalname="XLXN_100" name="spi_R" />
            <blockpin signalname="XLXN_101" name="spi_W" />
            <blockpin signalname="XLXN_129" name="spi_Wblock" />
            <blockpin signalname="XLXN_91" name="special_W" />
            <blockpin signalname="leds_select(4)" name="leds_select" />
            <blockpin signalname="XLXN_55(31:0)" name="address(31:0)" />
            <blockpin signalname="XLXN_103(7:0)" name="data_in(7:0)" />
            <blockpin signalname="MOSI" name="MOSI" />
            <blockpin name="SS_n" />
            <blockpin signalname="XLXN_98" name="spi_Rdone" />
            <blockpin signalname="XLXN_99" name="spi_Wdone" />
            <blockpin signalname="INIT_DONE" name="spi_init_done" />
            <blockpin signalname="XLXN_52(7:0)" name="data_out(7:0)" />
            <blockpin signalname="XLXN_107(7:0)" name="leds(7:0)" />
        </block>
        <block symbolname="SDRAM_FAT32_LOADER" name="XLXI_7">
            <blockpin signalname="CLK8MHz" name="CLK" />
            <blockpin signalname="XLXN_98" name="spi_Rdone" />
            <blockpin signalname="XLXN_99" name="spi_Wdone" />
            <blockpin signalname="INIT_DONE" name="spi_init_done" />
            <blockpin signalname="dump" name="dump_button" />
            <blockpin signalname="DO_STOP" name="stop" />
            <blockpin signalname="key_reset" name="key_reset" />
            <blockpin signalname="file_change" name="changeDSK" />
            <blockpin signalname="dir_entry_ack" name="dir_entry_ack" />
            <blockpin signalname="dir_entry_downloading" name="dir_entry_downloading" />
            <blockpin signalname="FILE_SELECT(7:0)" name="file_select(7:0)" />
            <blockpin signalname="ram_Din(7:0)" name="ram_Din(7:0)" />
            <blockpin signalname="XLXN_52(7:0)" name="spi_Din(7:0)" />
            <blockpin signalname="leds_select(2:0)" name="leds_select(2:0)" />
            <blockpin signalname="FDC_input(6:0)" name="FDC_input(6:0)" />
            <blockpin signalname="ram_W" name="ram_W" />
            <blockpin signalname="XLXN_126" name="ram_R" />
            <blockpin signalname="XLXN_100" name="spi_Rdo" />
            <blockpin signalname="XLXN_101" name="spi_Wdo" />
            <blockpin signalname="XLXN_129" name="spi_Wblock" />
            <blockpin signalname="FILE_LOADED" name="load_init_done" />
            <blockpin signalname="is_ucpm" name="is_ucpm" />
            <blockpin signalname="dir_entry_clk" name="dir_entry_clk" />
            <blockpin signalname="dir_entry_r" name="dir_entry_r" />
            <blockpin signalname="ram_A(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="ram_Dout(7:0)" name="ram_Dout(7:0)" />
            <blockpin signalname="XLXN_55(31:0)" name="spi_A(31:0)" />
            <blockpin signalname="XLXN_103(7:0)" name="spi_Dout(7:0)" />
            <blockpin signalname="XLXN_114(7:0)" name="leds(7:0)" />
            <blockpin signalname="FDC_output(5:0)" name="FDC_output(5:0)" />
            <blockpin signalname="dir_entry_d(7:0)" name="dir_entry_d(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_43">
            <blockpin signalname="DO_STOP" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_52">
            <blockpin signalname="XLXN_89" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_54">
            <blockpin signalname="XLXN_91" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_46">
            <blockpin signalname="CLK8MHz" name="I" />
            <blockpin signalname="SCLK" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_57">
            <blockpin signalname="XLXN_127" name="I0" />
            <blockpin signalname="ram_W" name="I1" />
            <blockpin signalname="XLXN_94" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="XLXN_94" name="I" />
            <blockpin signalname="ram_W_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_59">
            <blockpin signalname="FILE_LOADED" name="I" />
            <blockpin signalname="XLXN_127" name="O" />
        </block>
        <block symbolname="LEDS_SWITCH2" name="XLXI_60">
            <blockpin signalname="leds_select(3)" name="select_leds" />
            <blockpin signalname="XLXN_107(7:0)" name="leds1(7:0)" />
            <blockpin signalname="XLXN_114(7:0)" name="leds2(7:0)" />
            <blockpin signalname="LEDS(7:0)" name="leds(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_40">
            <blockpin signalname="XLXN_76" name="I" />
            <blockpin signalname="SS_n" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_41">
            <blockpin signalname="XLXN_76" name="P" />
        </block>
        <block symbolname="and2" name="XLXI_63">
            <blockpin signalname="XLXN_126" name="I0" />
            <blockpin signalname="XLXN_127" name="I1" />
            <blockpin signalname="XLXN_128" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_65">
            <blockpin signalname="XLXN_130" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_64">
            <blockpin signalname="XLXN_128" name="I" />
            <blockpin signalname="ram_R_n" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="672" y="1184" name="XLXI_1" orien="R0">
        </instance>
        <branch name="MISO">
            <wire x2="672" y1="1024" y2="1024" x1="304" />
        </branch>
        <branch name="MOSI">
            <wire x2="1168" y1="960" y2="960" x1="1056" />
        </branch>
        <instance x="2160" y="768" name="XLXI_7" orien="R0">
        </instance>
        <branch name="FILE_SELECT(7:0)">
            <wire x2="2160" y1="608" y2="608" x1="2096" />
        </branch>
        <branch name="XLXN_55(31:0)">
            <wire x2="672" y1="1152" y2="1152" x1="400" />
            <wire x2="400" y1="1152" y2="1616" x1="400" />
            <wire x2="2656" y1="1616" y2="1616" x1="400" />
            <wire x2="2656" y1="736" y2="736" x1="2592" />
            <wire x2="2656" y1="736" y2="1616" x1="2656" />
        </branch>
        <branch name="ram_A(22:0)">
            <wire x2="2704" y1="608" y2="608" x1="2592" />
        </branch>
        <branch name="ram_W">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2624" y="416" type="branch" />
            <wire x2="2624" y1="416" y2="416" x1="2592" />
            <wire x2="2960" y1="416" y2="416" x1="2624" />
            <wire x2="2960" y1="416" y2="608" x1="2960" />
            <wire x2="3152" y1="608" y2="608" x1="2960" />
        </branch>
        <branch name="INIT_DONE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1664" y="1344" type="branch" />
            <wire x2="1600" y1="1344" y2="1344" x1="1056" />
            <wire x2="1664" y1="1344" y2="1344" x1="1600" />
            <wire x2="1600" y1="992" y2="1344" x1="1600" />
            <wire x2="2160" y1="992" y2="992" x1="1600" />
        </branch>
        <branch name="DO_STOP">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2112" y="1184" type="branch" />
            <wire x2="2112" y1="1184" y2="1184" x1="1872" />
            <wire x2="2160" y1="1184" y2="1184" x1="2112" />
            <wire x2="1872" y1="1184" y2="1232" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="2096" y="608" name="FILE_SELECT(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2704" y="608" name="ram_A(22:0)" orien="R0" />
        <branch name="is_ucpm">
            <wire x2="2752" y1="1248" y2="1248" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1248" name="is_ucpm" orien="R0" />
        <branch name="XLXN_89">
            <wire x2="672" y1="1280" y2="1280" x1="640" />
        </branch>
        <instance x="512" y="1216" name="XLXI_52" orien="R90" />
        <branch name="XLXN_91">
            <wire x2="672" y1="1408" y2="1408" x1="640" />
        </branch>
        <instance x="512" y="1344" name="XLXI_54" orien="R90" />
        <branch name="ram_W_n">
            <wire x2="3392" y1="400" y2="400" x1="3376" />
            <wire x2="3392" y1="352" y2="400" x1="3392" />
        </branch>
        <instance x="3152" y="432" name="XLXI_26" orien="R0" />
        <iomarker fontsize="28" x="3392" y="352" name="ram_W_n" orien="R270" />
        <branch name="XLXN_94">
            <wire x2="3152" y1="400" y2="400" x1="3136" />
            <wire x2="3136" y1="400" y2="496" x1="3136" />
            <wire x2="3472" y1="496" y2="496" x1="3136" />
            <wire x2="3472" y1="496" y2="640" x1="3472" />
            <wire x2="3472" y1="640" y2="640" x1="3408" />
        </branch>
        <branch name="FILE_LOADED">
            <wire x2="2816" y1="992" y2="992" x1="2592" />
            <wire x2="3168" y1="992" y2="992" x1="2816" />
            <wire x2="2816" y1="928" y2="992" x1="2816" />
        </branch>
        <branch name="XLXN_98">
            <wire x2="1840" y1="1088" y2="1088" x1="1056" />
            <wire x2="1840" y1="768" y2="1088" x1="1840" />
            <wire x2="2160" y1="768" y2="768" x1="1840" />
        </branch>
        <branch name="XLXN_99">
            <wire x2="1648" y1="1024" y2="1024" x1="1056" />
            <wire x2="1648" y1="832" y2="1024" x1="1648" />
            <wire x2="2160" y1="832" y2="832" x1="1648" />
        </branch>
        <branch name="XLXN_100">
            <wire x2="16" y1="256" y2="1088" x1="16" />
            <wire x2="672" y1="1088" y2="1088" x1="16" />
            <wire x2="2640" y1="256" y2="256" x1="16" />
            <wire x2="2640" y1="256" y2="864" x1="2640" />
            <wire x2="2640" y1="864" y2="864" x1="2592" />
        </branch>
        <branch name="XLXN_101">
            <wire x2="672" y1="1344" y2="1344" x1="464" />
            <wire x2="464" y1="1344" y2="1648" x1="464" />
            <wire x2="2640" y1="1648" y2="1648" x1="464" />
            <wire x2="2640" y1="928" y2="928" x1="2592" />
            <wire x2="2640" y1="928" y2="1648" x1="2640" />
        </branch>
        <branch name="XLXN_52(7:0)">
            <wire x2="1856" y1="1152" y2="1152" x1="1056" />
            <wire x2="2160" y1="688" y2="688" x1="1856" />
            <wire x2="1856" y1="688" y2="1152" x1="1856" />
        </branch>
        <branch name="XLXN_103(7:0)">
            <wire x2="672" y1="1216" y2="1216" x1="480" />
            <wire x2="480" y1="1216" y2="1584" x1="480" />
            <wire x2="2624" y1="1584" y2="1584" x1="480" />
            <wire x2="2624" y1="1040" y2="1040" x1="2592" />
            <wire x2="2624" y1="1040" y2="1584" x1="2624" />
        </branch>
        <branch name="dump">
            <wire x2="2160" y1="1136" y2="1136" x1="2048" />
        </branch>
        <iomarker fontsize="28" x="2048" y="1136" name="dump" orien="R180" />
        <instance x="1168" y="1920" name="XLXI_60" orien="R0">
        </instance>
        <branch name="LEDS(7:0)">
            <wire x2="1696" y1="1760" y2="1760" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1760" name="LEDS(7:0)" orien="R0" />
        <branch name="leds_select(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1232" y="2144" type="branch" />
            <wire x2="1232" y1="2144" y2="2144" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="2144" name="leds_select(4:0)" orien="R180" />
        <branch name="leds_select(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="1760" type="branch" />
            <wire x2="1168" y1="1760" y2="1760" x1="1040" />
        </branch>
        <branch name="leds_select(2:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2016" y="464" type="branch" />
            <wire x2="2160" y1="464" y2="464" x1="2016" />
        </branch>
        <branch name="XLXN_107(7:0)">
            <wire x2="1104" y1="1216" y2="1216" x1="1056" />
            <wire x2="1104" y1="1216" y2="1824" x1="1104" />
            <wire x2="1168" y1="1824" y2="1824" x1="1104" />
        </branch>
        <branch name="XLXN_114(7:0)">
            <wire x2="1168" y1="1888" y2="1888" x1="1104" />
            <wire x2="1104" y1="1888" y2="1984" x1="1104" />
            <wire x2="2720" y1="1984" y2="1984" x1="1104" />
            <wire x2="2720" y1="800" y2="800" x1="2592" />
            <wire x2="2720" y1="800" y2="1984" x1="2720" />
        </branch>
        <branch name="leds_select(4)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="544" y="1472" type="branch" />
            <wire x2="672" y1="1472" y2="1472" x1="544" />
        </branch>
        <branch name="SS_n">
            <wire x2="544" y1="2176" y2="2240" x1="544" />
        </branch>
        <instance x="512" y="1952" name="XLXI_40" orien="R90" />
        <branch name="XLXN_76">
            <wire x2="544" y1="1872" y2="1952" x1="544" />
        </branch>
        <instance x="480" y="1872" name="XLXI_41" orien="R0" />
        <iomarker fontsize="28" x="544" y="2240" name="SS_n" orien="R90" />
        <branch name="XLXN_127">
            <wire x2="2816" y1="672" y2="704" x1="2816" />
            <wire x2="3120" y1="672" y2="672" x1="2816" />
            <wire x2="3152" y1="672" y2="672" x1="3120" />
            <wire x2="3120" y1="672" y2="1312" x1="3120" />
            <wire x2="3136" y1="1312" y2="1312" x1="3120" />
        </branch>
        <branch name="XLXN_128">
            <wire x2="3424" y1="1344" y2="1344" x1="3392" />
            <wire x2="3424" y1="1200" y2="1344" x1="3424" />
        </branch>
        <branch name="XLXN_129">
            <wire x2="672" y1="1536" y2="1536" x1="592" />
            <wire x2="592" y1="1536" y2="1600" x1="592" />
            <wire x2="2672" y1="1600" y2="1600" x1="592" />
            <wire x2="2672" y1="1088" y2="1088" x1="2592" />
            <wire x2="2672" y1="1088" y2="1600" x1="2672" />
        </branch>
        <branch name="SCLK">
            <wire x2="1024" y1="640" y2="640" x1="928" />
        </branch>
        <branch name="CLK8MHz">
            <wire x2="624" y1="528" y2="640" x1="624" />
            <wire x2="704" y1="640" y2="640" x1="624" />
            <wire x2="1616" y1="528" y2="528" x1="624" />
            <wire x2="1616" y1="416" y2="416" x1="1456" />
            <wire x2="1616" y1="416" y2="528" x1="1616" />
            <wire x2="2160" y1="416" y2="416" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="240" y="640" name="nCLK8MHz" orien="R180" />
        <iomarker fontsize="28" x="304" y="1024" name="MISO" orien="R180" />
        <iomarker fontsize="28" x="1168" y="960" name="MOSI" orien="R0" />
        <iomarker fontsize="28" x="1024" y="640" name="SCLK" orien="R0" />
        <instance x="704" y="672" name="XLXI_46" orien="R0" />
        <branch name="nCLK8MHz">
            <wire x2="384" y1="640" y2="640" x1="240" />
            <wire x2="384" y1="640" y2="960" x1="384" />
            <wire x2="672" y1="960" y2="960" x1="384" />
        </branch>
        <iomarker fontsize="28" x="1456" y="416" name="CLK8MHz" orien="R180" />
        <branch name="key_reset">
            <wire x2="2160" y1="1248" y2="1248" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="1248" name="key_reset" orien="R180" />
        <instance x="1808" y="1360" name="XLXI_43" orien="R0" />
        <branch name="file_change">
            <wire x2="2160" y1="560" y2="560" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="2000" y="560" name="file_change" orien="R180" />
        <branch name="FDC_input(6:0)">
            <wire x2="2160" y1="1296" y2="1296" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="1296" name="FDC_input(6:0)" orien="R180" />
        <branch name="FDC_output(5:0)">
            <wire x2="2768" y1="1296" y2="1296" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1296" name="FDC_output(5:0)" orien="R0" />
        <branch name="ram_Din(7:0)">
            <wire x2="2160" y1="512" y2="512" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="512" name="ram_Din(7:0)" orien="R180" />
        <branch name="ram_Dout(7:0)">
            <wire x2="2720" y1="512" y2="512" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="2720" y="512" name="ram_Dout(7:0)" orien="R0" />
        <instance x="368" y="928" name="XLXI_65" orien="R90" />
        <branch name="XLXN_130">
            <wire x2="672" y1="992" y2="992" x1="496" />
        </branch>
        <branch name="ram_R_n">
            <wire x2="3424" y1="912" y2="976" x1="3424" />
        </branch>
        <instance x="3456" y="1200" name="XLXI_64" orien="R270" />
        <iomarker fontsize="28" x="3424" y="912" name="ram_R_n" orien="R270" />
        <instance x="3136" y="1440" name="XLXI_63" orien="R0" />
        <branch name="XLXN_126">
            <wire x2="3040" y1="464" y2="464" x1="2592" />
            <wire x2="3040" y1="464" y2="1376" x1="3040" />
            <wire x2="3136" y1="1376" y2="1376" x1="3040" />
        </branch>
        <instance x="2848" y="928" name="XLXI_59" orien="R270" />
        <instance x="3152" y="736" name="XLXI_57" orien="R0" />
        <iomarker fontsize="28" x="3168" y="992" name="FILE_LOADED" orien="R0" />
        <branch name="dir_entry_clk">
            <wire x2="2768" y1="1344" y2="1344" x1="2592" />
        </branch>
        <branch name="dir_entry_r">
            <wire x2="2768" y1="1392" y2="1392" x1="2592" />
        </branch>
        <branch name="dir_entry_ack">
            <wire x2="2160" y1="1344" y2="1344" x1="2128" />
        </branch>
        <branch name="dir_entry_downloading">
            <wire x2="2160" y1="1392" y2="1392" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1344" name="dir_entry_clk" orien="R0" />
        <iomarker fontsize="28" x="2768" y="1392" name="dir_entry_r" orien="R0" />
        <iomarker fontsize="28" x="2128" y="1344" name="dir_entry_ack" orien="R180" />
        <iomarker fontsize="28" x="2128" y="1392" name="dir_entry_downloading" orien="R180" />
        <branch name="dir_entry_d(7:0)">
            <wire x2="2160" y1="1440" y2="1440" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="1440" name="dir_entry_d(7:0)" orien="R180" />
    </sheet>
</drawing>