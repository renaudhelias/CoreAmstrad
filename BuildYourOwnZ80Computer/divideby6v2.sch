<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLKin" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83" />
        <signal name="XLXN_84" />
        <signal name="CLK25MHz" />
        <signal name="nCLK25MHz" />
        <signal name="XLXN_87" />
        <signal name="XLXN_92" />
        <signal name="XLXN_93" />
        <signal name="CLK8MHz" />
        <signal name="XLXN_101" />
        <signal name="XLXN_102" />
        <signal name="XLXN_103" />
        <signal name="XLXN_104" />
        <signal name="nCLK8MHz" />
        <signal name="CLK4MHz" />
        <signal name="nCLK4MHz" />
        <signal name="XLXN_32" />
        <signal name="XLXN_109" />
        <port polarity="Input" name="CLKin" />
        <port polarity="Output" name="CLK25MHz" />
        <port polarity="Output" name="nCLK25MHz" />
        <port polarity="Output" name="CLK8MHz" />
        <port polarity="Output" name="nCLK8MHz" />
        <port polarity="Output" name="CLK4MHz" />
        <port polarity="Output" name="nCLK4MHz" />
        <blockdef name="mmcme2_base">
            <timestamp>2010-10-29T18:40:40</timestamp>
            <rect width="768" x="64" y="-480" height="480" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="896" y1="-448" y2="-448" x1="832" />
            <line x2="896" y1="-416" y2="-416" x1="832" />
            <line x2="896" y1="-384" y2="-384" x1="832" />
            <line x2="896" y1="-352" y2="-352" x1="832" />
            <line x2="896" y1="-320" y2="-320" x1="832" />
            <line x2="896" y1="-288" y2="-288" x1="832" />
            <line x2="896" y1="-256" y2="-256" x1="832" />
            <line x2="896" y1="-224" y2="-224" x1="832" />
            <line x2="896" y1="-192" y2="-192" x1="832" />
            <line x2="896" y1="-160" y2="-160" x1="832" />
            <line x2="896" y1="-128" y2="-128" x1="832" />
            <line x2="896" y1="-96" y2="-96" x1="832" />
            <line x2="896" y1="-64" y2="-64" x1="832" />
            <line x2="896" y1="-32" y2="-32" x1="832" />
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
        <blockdef name="ibufg">
            <timestamp>2008-10-8T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <block symbolname="ibufg" name="XLXI_40">
            <blockpin signalname="CLKin" name="I" />
            <blockpin signalname="XLXN_81" name="O" />
        </block>
        <block symbolname="mmcme2_base" name="XLXI_41">
            <attr value="32" name="CLKOUT1_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="8.000" name="CLKFBOUT_MULT_F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 2 64" />
            </attr>
            <attr value="96.000" name="CLKOUT0_DIVIDE_F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 1 128" />
            </attr>
            <blockpin signalname="XLXN_83" name="CLKFBIN" />
            <blockpin signalname="XLXN_81" name="CLKIN1" />
            <blockpin signalname="XLXN_32" name="PWRDWN" />
            <blockpin signalname="XLXN_32" name="RST" />
            <blockpin signalname="XLXN_82" name="CLKFBOUT" />
            <blockpin name="CLKFBOUTB" />
            <blockpin signalname="XLXN_92" name="CLKOUT0" />
            <blockpin name="CLKOUT0B" />
            <blockpin signalname="XLXN_84" name="CLKOUT1" />
            <blockpin signalname="XLXN_87" name="CLKOUT1B" />
            <blockpin name="CLKOUT2" />
            <blockpin name="CLKOUT2B" />
            <blockpin name="CLKOUT3" />
            <blockpin name="CLKOUT3B" />
            <blockpin name="CLKOUT4" />
            <blockpin name="CLKOUT5" />
            <blockpin name="CLKOUT6" />
            <blockpin name="LOCKED" />
        </block>
        <block symbolname="bufg" name="XLXI_42">
            <blockpin signalname="XLXN_82" name="I" />
            <blockpin signalname="XLXN_83" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_43">
            <blockpin signalname="XLXN_84" name="I" />
            <blockpin signalname="CLK25MHz" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_44">
            <blockpin signalname="XLXN_87" name="I" />
            <blockpin signalname="nCLK25MHz" name="O" />
        </block>
        <block symbolname="mmcme2_base" name="XLXI_46">
            <attr value="16" name="CLKOUT1_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="8.000" name="CLKOUT0_DIVIDE_F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 1 128" />
            </attr>
            <attr value="8.000" name="CLKFBOUT_MULT_F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 2 64" />
            </attr>
            <blockpin signalname="XLXN_93" name="CLKFBIN" />
            <blockpin signalname="XLXN_92" name="CLKIN1" />
            <blockpin signalname="XLXN_109" name="PWRDWN" />
            <blockpin signalname="XLXN_109" name="RST" />
            <blockpin signalname="XLXN_93" name="CLKFBOUT" />
            <blockpin name="CLKFBOUTB" />
            <blockpin signalname="XLXN_101" name="CLKOUT0" />
            <blockpin signalname="XLXN_102" name="CLKOUT0B" />
            <blockpin signalname="XLXN_103" name="CLKOUT1" />
            <blockpin signalname="XLXN_104" name="CLKOUT1B" />
            <blockpin name="CLKOUT2" />
            <blockpin name="CLKOUT2B" />
            <blockpin name="CLKOUT3" />
            <blockpin name="CLKOUT3B" />
            <blockpin name="CLKOUT4" />
            <blockpin name="CLKOUT5" />
            <blockpin name="CLKOUT6" />
            <blockpin name="LOCKED" />
        </block>
        <block symbolname="bufg" name="XLXI_47">
            <blockpin signalname="XLXN_101" name="I" />
            <blockpin signalname="CLK8MHz" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_48">
            <blockpin signalname="XLXN_102" name="I" />
            <blockpin signalname="nCLK8MHz" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_49">
            <blockpin signalname="XLXN_103" name="I" />
            <blockpin signalname="CLK4MHz" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_50">
            <blockpin signalname="XLXN_104" name="I" />
            <blockpin signalname="nCLK4MHz" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_25">
            <blockpin signalname="XLXN_32" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_52">
            <blockpin signalname="XLXN_109" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="CLKin">
            <wire x2="592" y1="704" y2="704" x1="480" />
        </branch>
        <text style="fontsize:36;fontname:Arial" x="424" y="640">100MHz</text>
        <iomarker fontsize="28" x="480" y="704" name="CLKin" orien="R180" />
        <instance x="592" y="736" name="XLXI_40" orien="R0" />
        <instance x="880" y="1024" name="XLXI_41" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT1_DIVIDE" x="336" y="52" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFBOUT_MULT_F" x="336" y="100" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT0_DIVIDE_F" x="320" y="148" type="instance" />
        </instance>
        <branch name="XLXN_81">
            <wire x2="832" y1="704" y2="704" x1="816" />
            <wire x2="880" y1="704" y2="704" x1="832" />
        </branch>
        <instance x="1824" y="608" name="XLXI_42" orien="R0" />
        <instance x="1824" y="736" name="XLXI_43" orien="R0" />
        <branch name="XLXN_82">
            <wire x2="1808" y1="576" y2="576" x1="1776" />
            <wire x2="1824" y1="576" y2="576" x1="1808" />
        </branch>
        <branch name="XLXN_83">
            <wire x2="2128" y1="416" y2="416" x1="864" />
            <wire x2="2128" y1="416" y2="576" x1="2128" />
            <wire x2="864" y1="416" y2="576" x1="864" />
            <wire x2="880" y1="576" y2="576" x1="864" />
            <wire x2="2064" y1="576" y2="576" x1="2048" />
            <wire x2="2128" y1="576" y2="576" x1="2064" />
        </branch>
        <branch name="XLXN_84">
            <wire x2="1808" y1="704" y2="704" x1="1776" />
            <wire x2="1824" y1="704" y2="704" x1="1808" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="2240" y1="704" y2="704" x1="2048" />
        </branch>
        <branch name="nCLK25MHz">
            <wire x2="2240" y1="800" y2="800" x1="2160" />
        </branch>
        <instance x="1936" y="832" name="XLXI_44" orien="R0" />
        <branch name="XLXN_87">
            <wire x2="1808" y1="736" y2="736" x1="1776" />
            <wire x2="1808" y1="736" y2="800" x1="1808" />
            <wire x2="1920" y1="800" y2="800" x1="1808" />
            <wire x2="1936" y1="800" y2="800" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="2240" y="800" name="nCLK25MHz" orien="R0" />
        <iomarker fontsize="28" x="2240" y="704" name="CLK25MHz" orien="R0" />
        <instance x="1040" y="1824" name="XLXI_46" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT1_DIVIDE" x="160" y="36" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT0_DIVIDE_F" x="176" y="84" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFBOUT_MULT_F" x="192" y="148" type="instance" />
        </instance>
        <branch name="XLXN_92">
            <wire x2="976" y1="1264" y2="1504" x1="976" />
            <wire x2="1024" y1="1504" y2="1504" x1="976" />
            <wire x2="1040" y1="1504" y2="1504" x1="1024" />
            <wire x2="2224" y1="1264" y2="1264" x1="976" />
            <wire x2="1792" y1="640" y2="640" x1="1776" />
            <wire x2="2224" y1="640" y2="640" x1="1792" />
            <wire x2="2224" y1="640" y2="1264" x1="2224" />
        </branch>
        <branch name="XLXN_93">
            <wire x2="992" y1="1280" y2="1376" x1="992" />
            <wire x2="1024" y1="1376" y2="1376" x1="992" />
            <wire x2="1040" y1="1376" y2="1376" x1="1024" />
            <wire x2="2000" y1="1280" y2="1280" x1="992" />
            <wire x2="2000" y1="1280" y2="1376" x1="2000" />
            <wire x2="1952" y1="1376" y2="1376" x1="1936" />
            <wire x2="2000" y1="1376" y2="1376" x1="1952" />
        </branch>
        <branch name="CLK8MHz">
            <wire x2="2592" y1="1408" y2="1408" x1="2432" />
        </branch>
        <iomarker fontsize="28" x="2592" y="1408" name="CLK8MHz" orien="R0" />
        <instance x="2208" y="1440" name="XLXI_47" orien="R0" />
        <instance x="2208" y="1504" name="XLXI_48" orien="R0" />
        <instance x="2208" y="1568" name="XLXI_49" orien="R0" />
        <instance x="2208" y="1632" name="XLXI_50" orien="R0" />
        <branch name="XLXN_101">
            <wire x2="2064" y1="1440" y2="1440" x1="1936" />
            <wire x2="2064" y1="1408" y2="1440" x1="2064" />
            <wire x2="2192" y1="1408" y2="1408" x1="2064" />
            <wire x2="2208" y1="1408" y2="1408" x1="2192" />
        </branch>
        <branch name="XLXN_102">
            <wire x2="2192" y1="1472" y2="1472" x1="1936" />
            <wire x2="2208" y1="1472" y2="1472" x1="2192" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="2064" y1="1504" y2="1504" x1="1936" />
            <wire x2="2064" y1="1504" y2="1536" x1="2064" />
            <wire x2="2192" y1="1536" y2="1536" x1="2064" />
            <wire x2="2208" y1="1536" y2="1536" x1="2192" />
        </branch>
        <branch name="XLXN_104">
            <wire x2="2048" y1="1536" y2="1536" x1="1936" />
            <wire x2="2048" y1="1536" y2="1600" x1="2048" />
            <wire x2="2192" y1="1600" y2="1600" x1="2048" />
            <wire x2="2208" y1="1600" y2="1600" x1="2192" />
        </branch>
        <branch name="nCLK8MHz">
            <wire x2="2592" y1="1472" y2="1472" x1="2432" />
        </branch>
        <iomarker fontsize="28" x="2592" y="1472" name="nCLK8MHz" orien="R0" />
        <branch name="CLK4MHz">
            <wire x2="2576" y1="1536" y2="1536" x1="2432" />
        </branch>
        <iomarker fontsize="28" x="2576" y="1536" name="CLK4MHz" orien="R0" />
        <branch name="nCLK4MHz">
            <wire x2="2592" y1="1600" y2="1600" x1="2432" />
        </branch>
        <iomarker fontsize="28" x="2592" y="1600" name="nCLK4MHz" orien="R0" />
        <branch name="XLXN_32">
            <wire x2="880" y1="832" y2="832" x1="704" />
            <wire x2="704" y1="832" y2="960" x1="704" />
            <wire x2="704" y1="960" y2="1056" x1="704" />
            <wire x2="880" y1="960" y2="960" x1="704" />
        </branch>
        <instance x="640" y="1184" name="XLXI_25" orien="R0" />
        <branch name="XLXN_109">
            <wire x2="1040" y1="1632" y2="1632" x1="864" />
            <wire x2="864" y1="1632" y2="1760" x1="864" />
            <wire x2="864" y1="1760" y2="1856" x1="864" />
            <wire x2="1040" y1="1760" y2="1760" x1="864" />
        </branch>
        <instance x="800" y="1984" name="XLXI_52" orien="R0" />
    </sheet>
</drawing>