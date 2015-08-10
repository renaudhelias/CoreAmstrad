<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_32" />
        <signal name="CLK25MHz" />
        <signal name="nCLK25MHz" />
        <signal name="nCLK4MHz" />
        <signal name="CLK4MHz" />
        <signal name="nCLK8MHz" />
        <signal name="CLK8MHz" />
        <signal name="CLKin" />
        <signal name="XLXN_74" />
        <port polarity="Output" name="CLK25MHz" />
        <port polarity="Output" name="nCLK25MHz" />
        <port polarity="Output" name="nCLK4MHz" />
        <port polarity="Output" name="CLK4MHz" />
        <port polarity="Output" name="nCLK8MHz" />
        <port polarity="Output" name="CLK8MHz" />
        <port polarity="Input" name="CLKin" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="mmcme2_base" name="XLXI_24">
            <attr value="96" name="CLKOUT2_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="32" name="CLKOUT1_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="48" name="CLKOUT0_DIVIDE_F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 1 128" />
            </attr>
            <attr value="8" name="CLKFBOUT_MULT_F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float 2 64" />
            </attr>
            <attr value="1" name="CLKOUT3_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="48" name="CLKOUT6_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="4" name="CLKOUT4_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128" />
            </attr>
            <attr value="TRUE" name="CLKOUT4_CASCADE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList FALSE TRUE" />
            </attr>
            <attr value="1" name="DIVCLK_DIVIDE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106" />
            </attr>
            <attr value="0.000" name="CLKOUT1_PHASE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float -360 360" />
            </attr>
            <attr value="0" name="CLKOUT4_PHASE">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Float -360 360" />
            </attr>
            <blockpin signalname="XLXN_74" name="CLKFBIN" />
            <blockpin signalname="CLKin" name="CLKIN1" />
            <blockpin signalname="XLXN_32" name="PWRDWN" />
            <blockpin signalname="XLXN_32" name="RST" />
            <blockpin signalname="XLXN_74" name="CLKFBOUT" />
            <blockpin name="CLKFBOUTB" />
            <blockpin name="CLKOUT0" />
            <blockpin name="CLKOUT0B" />
            <blockpin signalname="CLK25MHz" name="CLKOUT1" />
            <blockpin signalname="nCLK25MHz" name="CLKOUT1B" />
            <blockpin signalname="CLK8MHz" name="CLKOUT2" />
            <blockpin signalname="nCLK8MHz" name="CLKOUT2B" />
            <blockpin name="CLKOUT3" />
            <blockpin name="CLKOUT3B" />
            <blockpin signalname="nCLK4MHz" name="CLKOUT4" />
            <blockpin name="CLKOUT5" />
            <blockpin name="CLKOUT6" />
            <blockpin name="LOCKED" />
        </block>
        <block symbolname="gnd" name="XLXI_25">
            <blockpin signalname="XLXN_32" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_38">
            <blockpin signalname="nCLK4MHz" name="I" />
            <blockpin signalname="CLK4MHz" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <text style="fontsize:48;fontname:Arial" x="1980" y="760">http://www.hitequest.com/Hardware/a120.htm</text>
        <instance x="560" y="1632" name="XLXI_24" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT0_DIVIDE_F" x="0" y="92" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFBOUT_MULT_F" x="0" y="120" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="DIVCLK_DIVIDE" x="64" y="42" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT1_DIVIDE" x="0" y="148" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT6_DIVIDE" x="0" y="176" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT4_DIVIDE" x="0" y="208" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT4_CASCADE" x="0" y="240" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT2_DIVIDE" x="0" y="272" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKOUT4_PHASE" x="0" y="314" type="instance" />
        </instance>
        <instance x="320" y="1792" name="XLXI_25" orien="R0" />
        <branch name="XLXN_32">
            <wire x2="560" y1="1440" y2="1440" x1="384" />
            <wire x2="384" y1="1440" y2="1568" x1="384" />
            <wire x2="384" y1="1568" y2="1664" x1="384" />
            <wire x2="560" y1="1568" y2="1568" x1="384" />
        </branch>
        <branch name="CLK25MHz">
            <wire x2="1680" y1="1312" y2="1312" x1="1456" />
            <wire x2="1696" y1="1312" y2="1312" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1312" name="CLK25MHz" orien="R0" />
        <branch name="nCLK25MHz">
            <wire x2="1680" y1="1344" y2="1344" x1="1456" />
            <wire x2="1696" y1="1344" y2="1344" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1344" name="nCLK25MHz" orien="R0" />
        <branch name="nCLK4MHz">
            <wire x2="1520" y1="1504" y2="1504" x1="1456" />
            <wire x2="1616" y1="1504" y2="1504" x1="1520" />
            <wire x2="1520" y1="1504" y2="1568" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1504" name="nCLK4MHz" orien="R0" />
        <instance x="1520" y="1600" name="XLXI_38" orien="R0" />
        <branch name="CLK4MHz">
            <wire x2="1776" y1="1568" y2="1568" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="1776" y="1568" name="CLK4MHz" orien="R0" />
        <branch name="nCLK8MHz">
            <wire x2="1600" y1="1408" y2="1408" x1="1456" />
            <wire x2="1616" y1="1408" y2="1408" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1408" name="nCLK8MHz" orien="R0" />
        <branch name="CLK8MHz">
            <wire x2="1600" y1="1376" y2="1376" x1="1456" />
            <wire x2="1616" y1="1376" y2="1376" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1376" name="CLK8MHz" orien="R0" />
        <branch name="CLKin">
            <wire x2="160" y1="1312" y2="1312" x1="144" />
            <wire x2="208" y1="1312" y2="1312" x1="160" />
            <wire x2="560" y1="1312" y2="1312" x1="208" />
        </branch>
        <iomarker fontsize="28" x="144" y="1312" name="CLKin" orien="R180" />
        <text style="fontsize:36;fontname:Arial" x="88" y="1248">100MHz</text>
        <branch name="XLXN_74">
            <wire x2="528" y1="944" y2="1184" x1="528" />
            <wire x2="544" y1="1184" y2="1184" x1="528" />
            <wire x2="560" y1="1184" y2="1184" x1="544" />
            <wire x2="1168" y1="944" y2="944" x1="528" />
            <wire x2="1520" y1="944" y2="944" x1="1168" />
            <wire x2="1520" y1="944" y2="1008" x1="1520" />
            <wire x2="1520" y1="1008" y2="1184" x1="1520" />
            <wire x2="1472" y1="1184" y2="1184" x1="1456" />
            <wire x2="1520" y1="1184" y2="1184" x1="1472" />
        </branch>
    </sheet>
</drawing>