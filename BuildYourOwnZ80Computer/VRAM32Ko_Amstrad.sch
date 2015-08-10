<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="vram_CLK" />
        <signal name="vga_CLK" />
        <signal name="vram_A(14:0)" />
        <signal name="vram_A(13:0)" />
        <signal name="vga_A(14:0)" />
        <signal name="vga_A(13:0)" />
        <signal name="vram_W" />
        <signal name="vram_D(7:0)" />
        <signal name="XLXN_19" />
        <signal name="XLXN_21" />
        <signal name="XLXN_23" />
        <signal name="vram_A(14)" />
        <signal name="vga_A(14)" />
        <signal name="XLXN_31" />
        <signal name="vga_D(7:0)" />
        <signal name="XLXN_40(7:0)" />
        <signal name="XLXN_46(7:0)" />
        <port polarity="Input" name="vram_CLK" />
        <port polarity="Input" name="vga_CLK" />
        <port polarity="Input" name="vram_A(14:0)" />
        <port polarity="Input" name="vga_A(14:0)" />
        <port polarity="Input" name="vram_W" />
        <port polarity="Input" name="vram_D(7:0)" />
        <port polarity="Output" name="vga_D(7:0)" />
        <blockdef name="and_then">
            <timestamp>2011-11-26T15:46:2</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
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
        <blockdef name="SELECT8">
            <timestamp>2011-11-26T13:29:17</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="VRAM_Amstrad_NEXYS4_16Ko">
            <timestamp>2014-10-11T17:41:8</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
        <block symbolname="and_then" name="XLXI_2">
            <blockpin signalname="vram_W" name="A" />
            <blockpin signalname="XLXN_21" name="B" />
            <blockpin signalname="XLXN_19" name="C" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="vram_A(14)" name="I" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="vga_A(14)" name="I" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="and_then" name="XLXI_7">
            <blockpin signalname="vram_W" name="A" />
            <blockpin signalname="vram_A(14)" name="B" />
            <blockpin signalname="XLXN_31" name="C" />
        </block>
        <block symbolname="SELECT8" name="XLXI_4">
            <blockpin signalname="XLXN_23" name="s1" />
            <blockpin signalname="XLXN_40(7:0)" name="DATA1(7:0)" />
            <blockpin signalname="XLXN_46(7:0)" name="DATA2(7:0)" />
            <blockpin signalname="vga_D(7:0)" name="DATA0(7:0)" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4_16Ko" name="XLXI_8">
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="XLXN_19" name="vram_W" />
            <blockpin signalname="vram_D(7:0)" name="vram_D(7:0)" />
            <blockpin signalname="XLXN_40(7:0)" name="vga_D(7:0)" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4_16Ko" name="XLXI_9">
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="XLXN_31" name="vram_W" />
            <blockpin signalname="vram_D(7:0)" name="vram_D(7:0)" />
            <blockpin signalname="XLXN_46(7:0)" name="vga_D(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="1136" y="240" name="vram_CLK" orien="R270" />
        <iomarker fontsize="28" x="1072" y="240" name="vga_CLK" orien="R270" />
        <branch name="vram_A(14:0)">
            <wire x2="928" y1="240" y2="544" x1="928" />
            <wire x2="928" y1="544" y2="608" x1="928" />
        </branch>
        <bustap x2="1024" y1="608" y2="608" x1="928" />
        <iomarker fontsize="28" x="928" y="240" name="vram_A(14:0)" orien="R270" />
        <branch name="vga_A(14:0)">
            <wire x2="784" y1="240" y2="592" x1="784" />
            <wire x2="784" y1="592" y2="672" x1="784" />
        </branch>
        <bustap x2="880" y1="672" y2="672" x1="784" />
        <iomarker fontsize="28" x="784" y="240" name="vga_A(14:0)" orien="R270" />
        <bustap x2="832" y1="544" y2="544" x1="928" />
        <bustap x2="688" y1="592" y2="592" x1="784" />
        <iomarker fontsize="28" x="1104" y="1728" name="vram_D(7:0)" orien="R90" />
        <iomarker fontsize="28" x="656" y="240" name="vram_W" orien="R270" />
        <branch name="vram_D(7:0)">
            <wire x2="1104" y1="1600" y2="1632" x1="1104" />
            <wire x2="1104" y1="1632" y2="1728" x1="1104" />
            <wire x2="1472" y1="1632" y2="1632" x1="1104" />
            <wire x2="1472" y1="1632" y2="2176" x1="1472" />
            <wire x2="1856" y1="2176" y2="2176" x1="1472" />
            <wire x2="1264" y1="1600" y2="1600" x1="1104" />
            <wire x2="1264" y1="848" y2="1600" x1="1264" />
            <wire x2="1872" y1="848" y2="848" x1="1264" />
        </branch>
        <branch name="vga_A(13:0)">
            <wire x2="896" y1="672" y2="672" x1="880" />
            <wire x2="896" y1="672" y2="720" x1="896" />
            <wire x2="1360" y1="720" y2="720" x1="896" />
            <wire x2="1872" y1="720" y2="720" x1="1360" />
            <wire x2="1360" y1="720" y2="2048" x1="1360" />
            <wire x2="1856" y1="2048" y2="2048" x1="1360" />
        </branch>
        <branch name="vram_A(13:0)">
            <wire x2="1040" y1="608" y2="608" x1="1024" />
            <wire x2="1040" y1="608" y2="656" x1="1040" />
            <wire x2="1632" y1="656" y2="656" x1="1040" />
            <wire x2="1872" y1="656" y2="656" x1="1632" />
            <wire x2="1632" y1="656" y2="1984" x1="1632" />
            <wire x2="1856" y1="1984" y2="1984" x1="1632" />
        </branch>
        <branch name="vga_CLK">
            <wire x2="1072" y1="240" y2="528" x1="1072" />
            <wire x2="1072" y1="528" y2="544" x1="1072" />
            <wire x2="1472" y1="544" y2="544" x1="1072" />
            <wire x2="1472" y1="544" y2="592" x1="1472" />
            <wire x2="1872" y1="592" y2="592" x1="1472" />
            <wire x2="1216" y1="528" y2="528" x1="1072" />
            <wire x2="1216" y1="528" y2="1920" x1="1216" />
            <wire x2="1856" y1="1920" y2="1920" x1="1216" />
        </branch>
        <branch name="vram_CLK">
            <wire x2="1136" y1="240" y2="480" x1="1136" />
            <wire x2="1152" y1="480" y2="480" x1="1136" />
            <wire x2="1504" y1="480" y2="480" x1="1152" />
            <wire x2="1504" y1="480" y2="528" x1="1504" />
            <wire x2="1872" y1="528" y2="528" x1="1504" />
            <wire x2="1152" y1="480" y2="1856" x1="1152" />
            <wire x2="1856" y1="1856" y2="1856" x1="1152" />
        </branch>
        <branch name="vram_W">
            <wire x2="320" y1="256" y2="1392" x1="320" />
            <wire x2="400" y1="1392" y2="1392" x1="320" />
            <wire x2="320" y1="1392" y2="1632" x1="320" />
            <wire x2="384" y1="1632" y2="1632" x1="320" />
            <wire x2="656" y1="256" y2="256" x1="320" />
            <wire x2="656" y1="240" y2="256" x1="656" />
        </branch>
        <instance x="400" y="1488" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_21">
            <wire x2="160" y1="1056" y2="1456" x1="160" />
            <wire x2="400" y1="1456" y2="1456" x1="160" />
        </branch>
        <instance x="128" y="832" name="XLXI_3" orien="R90" />
        <branch name="vram_A(14)">
            <wire x2="160" y1="544" y2="544" x1="112" />
            <wire x2="832" y1="544" y2="544" x1="160" />
            <wire x2="160" y1="544" y2="832" x1="160" />
            <wire x2="112" y1="544" y2="1696" x1="112" />
            <wire x2="384" y1="1696" y2="1696" x1="112" />
        </branch>
        <branch name="vga_A(14)">
            <wire x2="672" y1="400" y2="592" x1="672" />
            <wire x2="688" y1="592" y2="592" x1="672" />
            <wire x2="2928" y1="400" y2="400" x1="672" />
            <wire x2="2928" y1="400" y2="416" x1="2928" />
        </branch>
        <instance x="384" y="1728" name="XLXI_7" orien="R0">
        </instance>
        <branch name="vga_D(7:0)">
            <wire x2="3184" y1="960" y2="960" x1="3040" />
        </branch>
        <instance x="2656" y="1120" name="XLXI_4" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3184" y="960" name="vga_D(7:0)" orien="R0" />
        <branch name="XLXN_23">
            <wire x2="2640" y1="800" y2="960" x1="2640" />
            <wire x2="2656" y1="960" y2="960" x1="2640" />
            <wire x2="2928" y1="800" y2="800" x1="2640" />
            <wire x2="2928" y1="640" y2="800" x1="2928" />
        </branch>
        <instance x="2896" y="416" name="XLXI_5" orien="R90" />
        <branch name="XLXN_19">
            <wire x2="800" y1="1392" y2="1392" x1="784" />
            <wire x2="1872" y1="784" y2="784" x1="800" />
            <wire x2="800" y1="784" y2="1392" x1="800" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="784" y1="1632" y2="1632" x1="768" />
            <wire x2="784" y1="1632" y2="2112" x1="784" />
            <wire x2="1856" y1="2112" y2="2112" x1="784" />
        </branch>
        <branch name="XLXN_40(7:0)">
            <wire x2="2336" y1="528" y2="528" x1="2256" />
            <wire x2="2336" y1="528" y2="1024" x1="2336" />
            <wire x2="2656" y1="1024" y2="1024" x1="2336" />
        </branch>
        <branch name="XLXN_46(7:0)">
            <wire x2="2448" y1="1856" y2="1856" x1="2240" />
            <wire x2="2448" y1="1088" y2="1856" x1="2448" />
            <wire x2="2656" y1="1088" y2="1088" x1="2448" />
        </branch>
        <instance x="1872" y="880" name="XLXI_8" orien="R0">
        </instance>
        <instance x="1856" y="2208" name="XLXI_9" orien="R0">
        </instance>
    </sheet>
</drawing>