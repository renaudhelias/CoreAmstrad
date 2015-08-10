<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="vga_A(13:0)" />
        <signal name="vram_A(13:0)" />
        <signal name="XLXN_1(15:0)" />
        <signal name="vga_CLK" />
        <signal name="vram_CLK" />
        <signal name="XLXN_17" />
        <signal name="vram_W" />
        <signal name="vga_D" />
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_21" />
        <signal name="vram_D" />
        <signal name="XLXN_16(3:0)" />
        <signal name="XLXN_15(1:0)" />
        <port polarity="Input" name="vga_A(13:0)" />
        <port polarity="Input" name="vram_A(13:0)" />
        <port polarity="Input" name="vga_CLK" />
        <port polarity="Input" name="vram_CLK" />
        <port polarity="Input" name="vram_W" />
        <port polarity="Output" name="vga_D" />
        <port polarity="Input" name="vram_D" />
        <blockdef name="ramb18e1">
            <timestamp>2010-7-30T0:34:23</timestamp>
            <rect width="416" x="64" y="-1152" height="1152" />
            <rect width="64" x="0" y="-1132" height="24" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="480" y="-1132" height="24" />
            <line x2="544" y1="-1120" y2="-1120" x1="480" />
            <rect width="64" x="480" y="-780" height="24" />
            <line x2="544" y1="-768" y2="-768" x1="480" />
            <rect width="64" x="480" y="-428" height="24" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <rect width="64" x="480" y="-76" height="24" />
            <line x2="544" y1="-64" y2="-64" x1="480" />
        </blockdef>
        <blockdef name="SAME2">
            <timestamp>2014-10-11T13:14:0</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="SAME4">
            <timestamp>2014-10-11T13:14:6</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
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
        <blockdef name="D1_to_D16">
            <timestamp>2014-10-11T13:45:4</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="D16_to_D1">
            <timestamp>2014-10-11T13:55:30</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_9">
            <blockpin signalname="XLXN_17" name="G" />
        </block>
        <block symbolname="SAME2" name="XLXI_7">
            <blockpin signalname="XLXN_17" name="Sin" />
            <blockpin signalname="XLXN_15(1:0)" name="Sout(1:0)" />
        </block>
        <block symbolname="SAME4" name="XLXI_8">
            <blockpin signalname="vram_W" name="Sin" />
            <blockpin signalname="XLXN_16(3:0)" name="Sout(3:0)" />
        </block>
        <block symbolname="D16_to_D1" name="XLXI_14">
            <blockpin signalname="XLXN_3(15:0)" name="Din(15:0)" />
            <blockpin signalname="vga_D" name="Dout" />
        </block>
        <block symbolname="vcc" name="XLXI_13">
            <blockpin signalname="XLXN_21" name="P" />
        </block>
        <block symbolname="D1_to_D16" name="XLXI_11">
            <blockpin signalname="vram_D" name="Din" />
            <blockpin signalname="XLXN_1(15:0)" name="Dout(15:0)" />
        </block>
        <block symbolname="ramb18e1" name="XLXI_1">
            <attr value="TDP" name="RAM_MODE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList TDP SDP" />
            </attr>
            <attr value="1" name="WRITE_WIDTH_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18" />
            </attr>
            <attr value="1" name="READ_WIDTH_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18" />
            </attr>
            <attr value="7SERIES" name="SIM_DEVICE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList VIRTEX6 7SERIES" />
            </attr>
            <attr value="WRITE_FIRST" name="WRITE_MODE_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList WRITE_FIRST NO_CHANGE READ_FIRST" />
            </attr>
            <attr value="PERFORMANCE" name="RDADDR_COLLISION_HWCONFIG">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList DELAYED_WRITE PERFORMANCE" />
            </attr>
            <attr value="1" name="WRITE_WIDTH_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36 72" />
            </attr>
            <attr value="READ_FIRST" name="WRITE_MODE_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList WRITE_FIRST NO_CHANGE READ_FIRST" />
            </attr>
            <attr value="1" name="READ_WIDTH_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36 72" />
            </attr>
            <blockpin signalname="vga_A(13:0)" name="ADDRARDADDR(13:0)" />
            <blockpin signalname="vram_A(13:0)" name="ADDRBWRADDR(13:0)" />
            <blockpin name="DIADI(15:0)" />
            <blockpin signalname="XLXN_1(15:0)" name="DIBDI(15:0)" />
            <blockpin name="DIPADIP(1:0)" />
            <blockpin name="DIPBDIP(1:0)" />
            <blockpin signalname="XLXN_15(1:0)" name="WEA(1:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="WEBWE(3:0)" />
            <blockpin signalname="vga_CLK" name="CLKARDCLK" />
            <blockpin signalname="vram_CLK" name="CLKBWRCLK" />
            <blockpin signalname="XLXN_21" name="ENARDEN" />
            <blockpin signalname="XLXN_21" name="ENBWREN" />
            <blockpin name="REGCEAREGCE" />
            <blockpin name="REGCEB" />
            <blockpin name="RSTRAMARSTRAM" />
            <blockpin name="RSTRAMB" />
            <blockpin name="RSTREGARSTREG" />
            <blockpin name="RSTREGB" />
            <blockpin signalname="XLXN_3(15:0)" name="DOADO(15:0)" />
            <blockpin name="DOBDO(15:0)" />
            <blockpin name="DOPADOP(1:0)" />
            <blockpin name="DOPBDOP(1:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="960" y="1056" name="vga_CLK" orien="R180" />
        <iomarker fontsize="28" x="944" y="1120" name="vram_CLK" orien="R180" />
        <instance x="128" y="1104" name="XLXI_9" orien="R0" />
        <instance x="240" y="960" name="XLXI_7" orien="R0">
        </instance>
        <iomarker fontsize="28" x="528" y="992" name="vram_W" orien="R180" />
        <instance x="640" y="1024" name="XLXI_8" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2448" y="544" name="vga_D" orien="R0" />
        <instance x="1872" y="576" name="XLXI_14" orien="R0">
        </instance>
        <instance x="608" y="1152" name="XLXI_13" orien="R0" />
        <iomarker fontsize="28" x="272" y="688" name="vram_D" orien="R180" />
        <instance x="384" y="784" name="XLXI_11" orien="R0">
        </instance>
        <instance x="1184" y="1664" name="XLXI_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="WRITE_WIDTH_A" x="656" y="-800" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="READ_WIDTH_B" x="656" y="-944" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="SIM_DEVICE" x="656" y="-718" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="WRITE_MODE_B" x="656" y="-878" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RDADDR_COLLISION_HWCONFIG" x="657" y="-670" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="WRITE_WIDTH_B" x="660" y="-910" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="WRITE_MODE_A" x="660" y="-766" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="READ_WIDTH_A" x="660" y="-830" type="instance" />
        </instance>
        <branch name="vga_A(13:0)">
            <wire x2="1168" y1="544" y2="544" x1="944" />
            <wire x2="1184" y1="544" y2="544" x1="1168" />
        </branch>
        <branch name="vram_A(13:0)">
            <wire x2="1168" y1="608" y2="608" x1="960" />
            <wire x2="1184" y1="608" y2="608" x1="1168" />
        </branch>
        <branch name="XLXN_1(15:0)">
            <wire x2="320" y1="752" y2="864" x1="320" />
            <wire x2="736" y1="864" y2="864" x1="320" />
            <wire x2="368" y1="752" y2="752" x1="320" />
            <wire x2="384" y1="752" y2="752" x1="368" />
            <wire x2="736" y1="736" y2="864" x1="736" />
            <wire x2="1184" y1="736" y2="736" x1="736" />
        </branch>
        <branch name="vga_CLK">
            <wire x2="976" y1="1056" y2="1056" x1="960" />
            <wire x2="1184" y1="1056" y2="1056" x1="976" />
        </branch>
        <branch name="vram_CLK">
            <wire x2="960" y1="1120" y2="1120" x1="944" />
            <wire x2="1184" y1="1120" y2="1120" x1="960" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="240" y1="928" y2="928" x1="192" />
            <wire x2="192" y1="928" y2="976" x1="192" />
        </branch>
        <branch name="vram_W">
            <wire x2="640" y1="992" y2="992" x1="528" />
        </branch>
        <branch name="vga_D">
            <wire x2="2448" y1="544" y2="544" x1="2256" />
        </branch>
        <branch name="XLXN_3(15:0)">
            <wire x2="1856" y1="544" y2="544" x1="1728" />
            <wire x2="1872" y1="544" y2="544" x1="1856" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="672" y1="1152" y2="1184" x1="672" />
            <wire x2="1184" y1="1184" y2="1184" x1="672" />
            <wire x2="672" y1="1184" y2="1248" x1="672" />
            <wire x2="1184" y1="1248" y2="1248" x1="672" />
        </branch>
        <branch name="vram_D">
            <wire x2="384" y1="688" y2="688" x1="272" />
        </branch>
        <branch name="XLXN_16(3:0)">
            <wire x2="1040" y1="992" y2="992" x1="1024" />
            <wire x2="1184" y1="992" y2="992" x1="1040" />
        </branch>
        <branch name="XLXN_15(1:0)">
            <wire x2="640" y1="928" y2="928" x1="624" />
            <wire x2="1184" y1="928" y2="928" x1="640" />
        </branch>
        <iomarker fontsize="28" x="960" y="608" name="vram_A(13:0)" orien="R180" />
        <iomarker fontsize="28" x="944" y="544" name="vga_A(13:0)" orien="R180" />
    </sheet>
</drawing>