<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="SCLK_pha" />
        <signal name="start" />
        <signal name="SPI_ON" />
        <signal name="CD_LED" />
        <signal name="CD_n" />
        <signal name="SCLK" />
        <signal name="MISO" />
        <signal name="XLXN_45" />
        <signal name="INV_POL">
        </signal>
        <signal name="MOSI" />
        <signal name="XLXN_49" />
        <signal name="INV_PHA" />
        <signal name="FILE_SELECT(7:0)" />
        <signal name="XLXN_52(7:0)" />
        <signal name="XLXN_55(31:0)" />
        <signal name="ram_D(7:0)" />
        <signal name="ram_A(22:0)" />
        <signal name="ram_W" />
        <signal name="XLXN_57" />
        <signal name="INIT_DONE" />
        <signal name="FILE_LOADED" />
        <signal name="XLXN_61" />
        <signal name="ram_W_n" />
        <signal name="CE1_n" />
        <signal name="OE1_n" />
        <signal name="UB1_n" />
        <signal name="LB1_n" />
        <signal name="ADV1_n" />
        <signal name="CLK1" />
        <signal name="CRE1" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="XLXN_72" />
        <signal name="LEDS(7:0)" />
        <signal name="SS_n" />
        <signal name="XLXN_76" />
        <signal name="DO_STOP" />
        <signal name="XLXN_78" />
        <port polarity="Output" name="CD_LED" />
        <port polarity="Input" name="CD_n" />
        <port polarity="Output" name="SCLK" />
        <port polarity="Input" name="MISO" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Input" name="FILE_SELECT(7:0)" />
        <port polarity="Output" name="ram_D(7:0)" />
        <port polarity="Output" name="ram_A(22:0)" />
        <port polarity="Output" name="ram_W" />
        <port polarity="Output" name="INIT_DONE" />
        <port polarity="Output" name="FILE_LOADED" />
        <port polarity="Output" name="ram_W_n" />
        <port polarity="Output" name="CE1_n" />
        <port polarity="Output" name="OE1_n" />
        <port polarity="Output" name="UB1_n" />
        <port polarity="Output" name="LB1_n" />
        <port polarity="Output" name="ADV1_n" />
        <port polarity="Output" name="CLK1" />
        <port polarity="Output" name="CRE1" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="LEDS(7:0)" />
        <port polarity="Output" name="SS_n" />
        <port polarity="Input" name="DO_STOP" />
        <blockdef name="SDRAM_SPIMASTER">
            <timestamp>2011-4-13T8:41:51</timestamp>
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-256" height="436" />
        </blockdef>
        <blockdef name="divideby2">
            <timestamp>2011-2-10T16:25:52</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="SDRAM_FAT32_LOADER">
            <timestamp>2011-4-8T17:51:56</timestamp>
            <line x2="432" y1="480" y2="480" x1="368" />
            <line x2="0" y1="416" y2="416" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <line x2="432" y1="224" y2="224" x1="368" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="432" y1="96" y2="96" x1="368" />
            <rect width="64" x="368" y="20" height="24" />
            <line x2="432" y1="32" y2="32" x1="368" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-108" height="24" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <rect width="304" x="64" y="-384" height="896" />
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
        <block symbolname="SDRAM_SPIMASTER" name="XLXI_4">
            <blockpin signalname="SCLK_pha" name="SCLK" />
            <blockpin signalname="XLXN_45" name="MISO" />
            <blockpin signalname="start" name="SS" />
            <blockpin signalname="XLXN_61" name="do_read" />
            <blockpin signalname="XLXN_55(31:0)" name="address(31:0)" />
            <blockpin signalname="XLXN_49" name="MOSI" />
            <blockpin signalname="XLXN_57" name="read_done" />
            <blockpin signalname="INIT_DONE" name="spi_init_done" />
            <blockpin signalname="XLXN_52(7:0)" name="data(7:0)" />
            <blockpin name="leds(7:0)" />
        </block>
        <block symbolname="divideby2" name="XLXI_6">
            <blockpin signalname="XLXN_70" name="CLKin" />
            <blockpin signalname="SCLK" name="CLKout" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="SPI_ON" name="I0" />
            <blockpin signalname="CD_LED" name="I1" />
            <blockpin signalname="start" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="CD_n" name="I" />
            <blockpin signalname="CD_LED" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_13">
            <blockpin signalname="MISO" name="I0" />
            <blockpin signalname="INV_POL" name="I1" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_14">
            <blockpin signalname="XLXN_49" name="I0" />
            <blockpin signalname="INV_POL" name="I1" />
            <blockpin signalname="MOSI" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_12">
            <blockpin signalname="SCLK" name="I0" />
            <blockpin signalname="INV_PHA" name="I1" />
            <blockpin signalname="SCLK_pha" name="O" />
        </block>
        <block symbolname="SDRAM_FAT32_LOADER" name="XLXI_19">
            <blockpin signalname="SCLK_pha" name="CLK" />
            <blockpin signalname="XLXN_57" name="spi_done" />
            <blockpin signalname="INIT_DONE" name="spi_init_done" />
            <blockpin signalname="DO_STOP" name="stop" />
            <blockpin signalname="FILE_SELECT(7:0)" name="file_select(7:0)" />
            <blockpin signalname="XLXN_52(7:0)" name="spi_D(7:0)" />
            <blockpin signalname="ram_D(7:0)" name="ram_D(7:0)" />
            <blockpin signalname="ram_W" name="ram_W" />
            <blockpin signalname="XLXN_61" name="spi_do" />
            <blockpin signalname="FILE_LOADED" name="load_init_done" />
            <blockpin name="is_ucpm" />
            <blockpin signalname="ram_A(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="XLXN_55(31:0)" name="spi_A(31:0)" />
            <blockpin signalname="LEDS(7:0)" name="leds(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="ram_W" name="I" />
            <blockpin signalname="ram_W_n" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_22">
            <blockpin signalname="CE1_n" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_23">
            <blockpin signalname="OE1_n" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_24">
            <blockpin signalname="UB1_n" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_25">
            <blockpin signalname="LB1_n" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_27">
            <blockpin signalname="ADV1_n" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_28">
            <blockpin signalname="CLK1" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_29">
            <blockpin signalname="CRE1" name="G" />
        </block>
        <block symbolname="divideby2" name="XLXI_37">
            <blockpin signalname="CLK50MHz" name="CLKin" />
            <blockpin signalname="XLXN_72" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_38">
            <blockpin signalname="XLXN_72" name="CLKin" />
            <blockpin signalname="XLXN_71" name="CLKout" />
        </block>
        <block symbolname="divideby2" name="XLXI_39">
            <blockpin signalname="XLXN_71" name="CLKin" />
            <blockpin signalname="XLXN_70" name="CLKout" />
        </block>
        <block symbolname="inv" name="XLXI_40">
            <blockpin signalname="XLXN_76" name="I" />
            <blockpin signalname="SS_n" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_41">
            <blockpin signalname="XLXN_76" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_42">
            <blockpin signalname="INV_PHA" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_43">
            <blockpin signalname="SPI_ON" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_44">
            <blockpin signalname="INV_POL" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="480" y="1008" name="XLXI_4" orien="R0">
        </instance>
        <instance x="176" y="496" name="XLXI_6" orien="R0">
        </instance>
        <branch name="start">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="1120" y="848" type="branch" />
            <wire x2="416" y1="672" y2="1104" x1="416" />
            <wire x2="480" y1="1104" y2="1104" x1="416" />
            <wire x2="880" y1="672" y2="672" x1="416" />
            <wire x2="880" y1="672" y2="944" x1="880" />
            <wire x2="1040" y1="944" y2="944" x1="880" />
            <wire x2="1120" y1="848" y2="848" x1="1040" />
            <wire x2="1040" y1="848" y2="944" x1="1040" />
            <wire x2="1120" y1="560" y2="848" x1="1120" />
        </branch>
        <branch name="SPI_ON">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1088" y="224" type="branch" />
            <wire x2="1088" y1="192" y2="224" x1="1088" />
            <wire x2="1088" y1="224" y2="304" x1="1088" />
        </branch>
        <instance x="1024" y="304" name="XLXI_8" orien="R90" />
        <branch name="CD_LED">
            <wire x2="1168" y1="304" y2="304" x1="1152" />
            <wire x2="1184" y1="304" y2="304" x1="1168" />
            <wire x2="1168" y1="192" y2="304" x1="1168" />
        </branch>
        <instance x="1408" y="272" name="XLXI_10" orien="R180" />
        <branch name="CD_n">
            <wire x2="1408" y1="240" y2="304" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1408" y="240" name="CD_n" orien="R270" />
        <branch name="MISO">
            <wire x2="208" y1="576" y2="576" x1="128" />
        </branch>
        <iomarker fontsize="28" x="128" y="576" name="MISO" orien="R180" />
        <instance x="144" y="576" name="XLXI_13" orien="R90" />
        <branch name="XLXN_45">
            <wire x2="240" y1="832" y2="848" x1="240" />
            <wire x2="480" y1="848" y2="848" x1="240" />
        </branch>
        <branch name="INV_POL">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="320" y="560" type="branch" />
            <wire x2="544" y1="512" y2="512" x1="272" />
            <wire x2="544" y1="512" y2="576" x1="544" />
            <wire x2="1184" y1="576" y2="576" x1="544" />
            <wire x2="272" y1="512" y2="560" x1="272" />
            <wire x2="272" y1="560" y2="576" x1="272" />
            <wire x2="320" y1="560" y2="560" x1="272" />
            <wire x2="368" y1="560" y2="560" x1="320" />
            <wire x2="368" y1="560" y2="576" x1="368" />
        </branch>
        <instance x="1184" y="704" name="XLXI_14" orien="R0" />
        <branch name="MOSI">
            <wire x2="1488" y1="608" y2="608" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1488" y="608" name="MOSI" orien="R0" />
        <branch name="XLXN_49">
            <wire x2="944" y1="784" y2="784" x1="864" />
            <wire x2="944" y1="592" y2="784" x1="944" />
            <wire x2="1168" y1="592" y2="592" x1="944" />
            <wire x2="1168" y1="592" y2="640" x1="1168" />
            <wire x2="1184" y1="640" y2="640" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="192" name="CD_LED" orien="R270" />
        <branch name="INV_PHA">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="672" y="144" type="branch" />
            <wire x2="672" y1="112" y2="144" x1="672" />
            <wire x2="672" y1="144" y2="208" x1="672" />
        </branch>
        <instance x="1968" y="592" name="XLXI_19" orien="R0">
        </instance>
        <branch name="FILE_SELECT(7:0)">
            <wire x2="1968" y1="432" y2="432" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1904" y="432" name="FILE_SELECT(7:0)" orien="R180" />
        <branch name="XLXN_52(7:0)">
            <wire x2="1664" y1="976" y2="976" x1="864" />
            <wire x2="1664" y1="528" y2="976" x1="1664" />
            <wire x2="1968" y1="528" y2="528" x1="1664" />
        </branch>
        <branch name="XLXN_55(31:0)">
            <wire x2="480" y1="976" y2="976" x1="464" />
            <wire x2="464" y1="976" y2="1312" x1="464" />
            <wire x2="2464" y1="1312" y2="1312" x1="464" />
            <wire x2="2464" y1="560" y2="560" x1="2400" />
            <wire x2="2464" y1="560" y2="1312" x1="2464" />
        </branch>
        <branch name="ram_D(7:0)">
            <wire x2="2512" y1="496" y2="496" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2512" y="496" name="ram_D(7:0)" orien="R0" />
        <branch name="ram_A(22:0)">
            <wire x2="2512" y1="432" y2="432" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2512" y="432" name="ram_A(22:0)" orien="R0" />
        <branch name="ram_W">
            <wire x2="2432" y1="240" y2="240" x1="2400" />
            <wire x2="2432" y1="240" y2="320" x1="2432" />
            <wire x2="2448" y1="320" y2="320" x1="2432" />
            <wire x2="2496" y1="240" y2="240" x1="2432" />
        </branch>
        <iomarker fontsize="28" x="2496" y="240" name="ram_W" orien="R0" />
        <branch name="XLXN_57">
            <wire x2="1456" y1="912" y2="912" x1="864" />
            <wire x2="1968" y1="688" y2="688" x1="1456" />
            <wire x2="1456" y1="688" y2="912" x1="1456" />
        </branch>
        <branch name="INIT_DONE">
            <wire x2="1408" y1="1168" y2="1168" x1="864" />
            <wire x2="1472" y1="1168" y2="1168" x1="1408" />
            <wire x2="1408" y1="816" y2="1168" x1="1408" />
            <wire x2="1968" y1="816" y2="816" x1="1408" />
        </branch>
        <branch name="FILE_LOADED">
            <wire x2="2512" y1="816" y2="816" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2512" y="816" name="FILE_LOADED" orien="R0" />
        <branch name="XLXN_61">
            <wire x2="480" y1="912" y2="912" x1="384" />
            <wire x2="384" y1="912" y2="1296" x1="384" />
            <wire x2="2448" y1="1296" y2="1296" x1="384" />
            <wire x2="2448" y1="688" y2="688" x1="2400" />
            <wire x2="2448" y1="688" y2="1296" x1="2448" />
        </branch>
        <branch name="SCLK_pha">
            <wire x2="400" y1="688" y2="784" x1="400" />
            <wire x2="480" y1="784" y2="784" x1="400" />
            <wire x2="640" y1="688" y2="688" x1="400" />
            <wire x2="640" y1="464" y2="512" x1="640" />
            <wire x2="640" y1="512" y2="688" x1="640" />
            <wire x2="704" y1="512" y2="512" x1="640" />
            <wire x2="704" y1="512" y2="736" x1="704" />
            <wire x2="1472" y1="736" y2="736" x1="704" />
            <wire x2="1968" y1="240" y2="240" x1="1472" />
            <wire x2="1472" y1="240" y2="736" x1="1472" />
        </branch>
        <branch name="SCLK">
            <wire x2="512" y1="144" y2="144" x1="464" />
            <wire x2="512" y1="144" y2="368" x1="512" />
            <wire x2="576" y1="368" y2="368" x1="512" />
            <wire x2="576" y1="368" y2="464" x1="576" />
            <wire x2="608" y1="144" y2="144" x1="512" />
            <wire x2="608" y1="144" y2="208" x1="608" />
            <wire x2="576" y1="464" y2="464" x1="560" />
        </branch>
        <instance x="544" y="208" name="XLXI_12" orien="R90" />
        <iomarker fontsize="28" x="464" y="144" name="SCLK" orien="R180" />
        <instance x="2448" y="352" name="XLXI_26" orien="R0" />
        <branch name="ram_W_n">
            <wire x2="2688" y1="320" y2="320" x1="2672" />
            <wire x2="2688" y1="272" y2="320" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2688" y="272" name="ram_W_n" orien="R270" />
        <iomarker fontsize="28" x="1472" y="1168" name="INIT_DONE" orien="R0" />
        <branch name="CE1_n">
            <wire x2="1872" y1="1456" y2="1520" x1="1872" />
        </branch>
        <instance x="1936" y="1328" name="XLXI_22" orien="R180" />
        <branch name="OE1_n">
            <wire x2="2064" y1="1456" y2="1504" x1="2064" />
        </branch>
        <instance x="2000" y="1456" name="XLXI_23" orien="R0" />
        <branch name="UB1_n">
            <wire x2="2224" y1="1456" y2="1520" x1="2224" />
        </branch>
        <branch name="LB1_n">
            <wire x2="2320" y1="1456" y2="1520" x1="2320" />
        </branch>
        <branch name="ADV1_n">
            <wire x2="2432" y1="1456" y2="1520" x1="2432" />
        </branch>
        <instance x="2288" y="1328" name="XLXI_24" orien="R180" />
        <instance x="2384" y="1328" name="XLXI_25" orien="R180" />
        <instance x="2496" y="1328" name="XLXI_27" orien="R180" />
        <branch name="CLK1">
            <wire x2="2544" y1="1456" y2="1504" x1="2544" />
        </branch>
        <branch name="CRE1">
            <wire x2="2624" y1="1456" y2="1504" x1="2624" />
        </branch>
        <instance x="2608" y="1328" name="XLXI_28" orien="R180" />
        <instance x="2688" y="1328" name="XLXI_29" orien="R180" />
        <iomarker fontsize="28" x="1872" y="1520" name="CE1_n" orien="R90" />
        <iomarker fontsize="28" x="2064" y="1504" name="OE1_n" orien="R90" />
        <iomarker fontsize="28" x="2224" y="1520" name="UB1_n" orien="R90" />
        <iomarker fontsize="28" x="2320" y="1520" name="LB1_n" orien="R90" />
        <iomarker fontsize="28" x="2432" y="1520" name="ADV1_n" orien="R90" />
        <iomarker fontsize="28" x="2544" y="1504" name="CLK1" orien="R90" />
        <iomarker fontsize="28" x="2624" y="1504" name="CRE1" orien="R90" />
        <branch name="CLK50MHz">
            <wire x2="304" y1="1632" y2="1632" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="1632" name="CLK50MHz" orien="R180" />
        <instance x="304" y="1664" name="XLXI_37" orien="R0">
        </instance>
        <instance x="752" y="1664" name="XLXI_38" orien="R0">
        </instance>
        <instance x="1216" y="1664" name="XLXI_39" orien="R0">
        </instance>
        <branch name="XLXN_70">
            <wire x2="176" y1="464" y2="464" x1="112" />
            <wire x2="112" y1="464" y2="512" x1="112" />
            <wire x2="144" y1="512" y2="512" x1="112" />
            <wire x2="144" y1="512" y2="1456" x1="144" />
            <wire x2="1664" y1="1456" y2="1456" x1="144" />
            <wire x2="1664" y1="1456" y2="1632" x1="1664" />
            <wire x2="1664" y1="1632" y2="1632" x1="1600" />
        </branch>
        <branch name="XLXN_71">
            <wire x2="1216" y1="1632" y2="1632" x1="1136" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="752" y1="1632" y2="1632" x1="688" />
        </branch>
        <branch name="LEDS(7:0)">
            <wire x2="2544" y1="624" y2="624" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2544" y="624" name="LEDS(7:0)" orien="R0" />
        <instance x="1776" y="1104" name="XLXI_40" orien="R0" />
        <branch name="SS_n">
            <wire x2="2000" y1="1072" y2="1136" x1="2000" />
        </branch>
        <instance x="1648" y="1072" name="XLXI_41" orien="R0" />
        <branch name="XLXN_76">
            <wire x2="1712" y1="1072" y2="1136" x1="1712" />
            <wire x2="1760" y1="1136" y2="1136" x1="1712" />
            <wire x2="1760" y1="1072" y2="1136" x1="1760" />
            <wire x2="1776" y1="1072" y2="1072" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1136" name="SS_n" orien="R90" />
        <branch name="DO_STOP">
            <wire x2="1920" y1="928" y2="1008" x1="1920" />
            <wire x2="1968" y1="1008" y2="1008" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="1920" y="928" name="DO_STOP" orien="R270" />
        <instance x="1024" y="192" name="XLXI_43" orien="R0" />
        <instance x="608" y="112" name="XLXI_42" orien="R0" />
        <instance x="304" y="704" name="XLXI_44" orien="R0" />
    </sheet>
</drawing>