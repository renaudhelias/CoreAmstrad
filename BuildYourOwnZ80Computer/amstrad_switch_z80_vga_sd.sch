<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="RESET_n" />
        <signal name="clk" />
        <signal name="MISO" />
        <signal name="MOSI" />
        <signal name="SCLK" />
        <signal name="SS_n" />
        <signal name="Vsync" />
        <signal name="Hsync" />
        <signal name="clk25MHz" />
        <signal name="un,un,un,un,un,un" />
        <signal name="audio" />
        <signal name="XLXN_736" />
        <signal name="XLXN_737(22:0)" />
        <signal name="XLXN_753" />
        <signal name="XLXN_759(7:0)" />
        <signal name="XLXN_760(14:0)" />
        <signal name="RAMBank(2:0)" />
        <signal name="ROMBank(3:0)" />
        <signal name="ROMen" />
        <signal name="btnC" />
        <signal name="sw(4:0)" />
        <signal name="XLXN_770" />
        <signal name="XLXN_771(7:0)" />
        <signal name="XLXN_772(13:0)" />
        <signal name="nCLK25MHz" />
        <signal name="PS2Clk" />
        <signal name="PS2Data" />
        <signal name="led(7:0)" />
        <signal name="ampPWM" />
        <signal name="ampSD" />
        <signal name="XLXN_787" />
        <signal name="XLXN_788(7:0)" />
        <signal name="XLXN_789" />
        <signal name="CLK4MHz" />
        <signal name="nCLK4MHz" />
        <signal name="XLXN_790(6:0)" />
        <signal name="XLXN_791(5:0)" />
        <signal name="RamWEn" />
        <signal name="XLXN_796" />
        <signal name="XLXN_797" />
        <signal name="XLXN_798(22:0)" />
        <signal name="XLXN_799(7:0)" />
        <signal name="XLXN_800(7:0)" />
        <signal name="XLXN_801(7:0)" />
        <signal name="RamOEn" />
        <signal name="MemAdr(22:0)" />
        <signal name="MemDB(7:0)" />
        <signal name="MemDB_U(7:0)" />
        <signal name="RamLBn" />
        <signal name="RamUBn" />
        <signal name="RamCEn" />
        <signal name="RamADVn" />
        <signal name="RamCLK" />
        <signal name="RamCRE" />
        <signal name="vgaGreen(3:0)" />
        <signal name="vgaRed(3:0)" />
        <signal name="vgaBlue(3:0)" />
        <signal name="XLXN_831(1:0)" />
        <signal name="XLXN_832(2:0)" />
        <signal name="XLXN_833(1:0)" />
        <signal name="un" />
        <signal name="XLXN_834(7:0)" />
        <signal name="XLXN_836" />
        <signal name="XLXN_837" />
        <signal name="XLXN_839" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="MISO" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Output" name="SCLK" />
        <port polarity="Output" name="SS_n" />
        <port polarity="Output" name="Vsync" />
        <port polarity="Output" name="Hsync" />
        <port polarity="Output" name="audio" />
        <port polarity="Output" name="RAMBank(2:0)" />
        <port polarity="Output" name="ROMBank(3:0)" />
        <port polarity="Output" name="ROMen" />
        <port polarity="Input" name="btnC" />
        <port polarity="Input" name="sw(4:0)" />
        <port polarity="Input" name="PS2Clk" />
        <port polarity="Input" name="PS2Data" />
        <port polarity="Output" name="led(7:0)" />
        <port polarity="Output" name="ampPWM" />
        <port polarity="Output" name="ampSD" />
        <port polarity="Output" name="RamWEn" />
        <port polarity="Output" name="RamOEn" />
        <port polarity="Output" name="MemAdr(22:0)" />
        <port polarity="BiDirectional" name="MemDB(7:0)" />
        <port polarity="BiDirectional" name="MemDB_U(7:0)" />
        <port polarity="Output" name="RamLBn" />
        <port polarity="Output" name="RamUBn" />
        <port polarity="Output" name="RamCEn" />
        <port polarity="Output" name="RamADVn" />
        <port polarity="Output" name="RamCLK" />
        <port polarity="Output" name="RamCRE" />
        <port polarity="Output" name="vgaGreen(3:0)" />
        <port polarity="Output" name="vgaRed(3:0)" />
        <port polarity="Output" name="vgaBlue(3:0)" />
        <blockdef name="bootloader_sd">
            <timestamp>2015-3-14T15:55:22</timestamp>
            <rect width="64" x="0" y="164" height="24" />
            <line x2="0" y1="176" y2="176" x1="64" />
            <line x2="496" y1="176" y2="176" x1="432" />
            <line x2="0" y1="80" y2="80" x1="64" />
            <line x2="0" y1="128" y2="128" x1="64" />
            <line x2="496" y1="80" y2="80" x1="432" />
            <line x2="496" y1="32" y2="32" x1="432" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="496" y1="-608" y2="-608" x1="432" />
            <rect width="64" x="432" y="-492" height="24" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <rect width="64" x="432" y="-108" height="24" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="496" y1="-336" y2="-336" x1="432" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="432" y="-444" height="24" />
            <line x2="496" y1="-432" y2="-432" x1="432" />
            <rect width="64" x="0" y="-572" height="24" />
            <line x2="0" y1="-560" y2="-560" x1="64" />
            <rect width="64" x="432" y="-572" height="24" />
            <line x2="496" y1="-560" y2="-560" x1="432" />
            <rect width="368" x="64" y="-656" height="900" />
        </blockdef>
        <blockdef name="amstrad_video">
            <timestamp>2015-2-25T9:22:52</timestamp>
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <line x2="464" y1="-496" y2="-496" x1="400" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <rect width="64" x="0" y="-476" height="24" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <rect width="64" x="0" y="-412" height="24" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <rect width="336" x="64" y="-640" height="884" />
            <rect width="64" x="400" y="-284" height="24" />
            <line x2="464" y1="-272" y2="-272" x1="400" />
            <rect width="64" x="400" y="-156" height="24" />
            <line x2="464" y1="-144" y2="-144" x1="400" />
            <rect width="64" x="400" y="-220" height="24" />
            <line x2="464" y1="-208" y2="-208" x1="400" />
        </blockdef>
        <blockdef name="amstrad_motherboard">
            <timestamp>2015-3-11T18:58:43</timestamp>
            <rect width="64" x="0" y="436" height="24" />
            <line x2="0" y1="448" y2="448" x1="64" />
            <rect width="64" x="384" y="436" height="24" />
            <line x2="448" y1="448" y2="448" x1="384" />
            <rect width="64" x="384" y="324" height="24" />
            <line x2="448" y1="336" y2="336" x1="384" />
            <rect width="64" x="384" y="388" height="24" />
            <line x2="448" y1="400" y2="400" x1="384" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="384" y="-620" height="24" />
            <line x2="448" y1="-608" y2="-608" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <line x2="448" y1="-320" y2="-320" x1="384" />
            <rect width="64" x="384" y="-380" height="24" />
            <line x2="448" y1="-368" y2="-368" x1="384" />
            <rect width="64" x="384" y="36" height="24" />
            <line x2="448" y1="48" y2="48" x1="384" />
            <rect width="64" x="384" y="84" height="24" />
            <line x2="448" y1="96" y2="96" x1="384" />
            <line x2="448" y1="144" y2="144" x1="384" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <line x2="0" y1="336" y2="336" x1="64" />
            <line x2="0" y1="272" y2="272" x1="64" />
            <line x2="448" y1="272" y2="272" x1="384" />
            <line x2="448" y1="224" y2="224" x1="384" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <rect width="64" x="384" y="-508" height="24" />
            <line x2="448" y1="-496" y2="-496" x1="384" />
            <rect width="320" x="64" y="-768" height="1248" />
            <rect width="64" x="384" y="-700" height="24" />
            <line x2="448" y1="-688" y2="-688" x1="384" />
            <rect width="64" x="0" y="-700" height="24" />
            <line x2="0" y1="-688" y2="-688" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <rect width="64" x="384" y="-156" height="24" />
            <line x2="448" y1="-144" y2="-144" x1="384" />
            <rect width="64" x="384" y="-300" height="24" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-240" y2="-240" x1="384" />
            <line x2="448" y1="-192" y2="-192" x1="384" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="divideby6">
            <timestamp>2014-12-22T18:21:43</timestamp>
            <line x2="384" y1="288" y2="288" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <rect width="256" x="64" y="-64" height="376" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="384" y1="160" y2="160" x1="320" />
        </blockdef>
        <blockdef name="NEXYS4_SDRAM">
            <timestamp>2015-2-25T9:15:51</timestamp>
            <rect width="64" x="320" y="68" height="24" />
            <line x2="384" y1="80" y2="80" x1="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="256" x="64" y="-320" height="432" />
            <line x2="384" y1="-256" y2="-256" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-188" height="24" />
            <line x2="384" y1="-176" y2="-176" x1="320" />
            <line x2="384" y1="-112" y2="-112" x1="320" />
            <line x2="384" y1="-80" y2="-80" x1="320" />
            <line x2="384" y1="-48" y2="-48" x1="320" />
            <line x2="384" y1="-16" y2="-16" x1="320" />
            <line x2="384" y1="16" y2="16" x1="320" />
            <line x2="384" y1="48" y2="48" x1="320" />
        </blockdef>
        <blockdef name="NEXYS4_RGB">
            <timestamp>2014-10-11T9:47:0</timestamp>
            <rect width="352" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-172" height="24" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <rect width="64" x="416" y="-108" height="24" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
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
        <block symbolname="amstrad_video" name="XLXI_511">
            <blockpin signalname="XLXN_753" name="vram_W" />
            <blockpin signalname="XLXN_759(7:0)" name="vram_D(7:0)" />
            <blockpin signalname="XLXN_760(14:0)" name="vram_A(14:0)" />
            <blockpin signalname="nCLK4MHz" name="vram_CLK" />
            <blockpin signalname="clk25MHz" name="CLK25MHz" />
            <blockpin signalname="XLXN_770" name="palette_W" />
            <blockpin signalname="XLXN_771(7:0)" name="palette_D(7:0)" />
            <blockpin signalname="XLXN_772(13:0)" name="palette_A(13:0)" />
            <blockpin signalname="nCLK4MHz" name="palette_CLK" />
            <blockpin signalname="nCLK25MHz" name="nCLK25MHz" />
            <blockpin signalname="Hsync" name="HSYNC" />
            <blockpin signalname="Vsync" name="VSYNC" />
            <blockpin signalname="XLXN_831(1:0)" name="RED2(1:0)" />
            <blockpin signalname="XLXN_833(1:0)" name="BLUE2(1:0)" />
            <blockpin signalname="XLXN_832(2:0)" name="GREEN3(2:0)" />
        </block>
        <block symbolname="amstrad_motherboard" name="XLXI_512">
            <attr value="TRUE" name="KEEP_HIERARCHY">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_737(22:0)" name="init_A(22:0)" />
            <blockpin signalname="CLK4MHz" name="CLK4MHz" />
            <blockpin signalname="nCLK4MHz" name="nCLK4MHz" />
            <blockpin signalname="XLXN_836" name="is_ucpm" />
            <blockpin signalname="RESET_n" name="RESET_n" />
            <blockpin signalname="PS2Data" name="PS2_DATA" />
            <blockpin signalname="PS2Clk" name="PS2_CLK" />
            <blockpin signalname="XLXN_791(5:0)" name="FDD_input(5:0)" />
            <blockpin signalname="XLXN_837" name="init_R_n" />
            <blockpin signalname="XLXN_736" name="init_W_n" />
            <blockpin signalname="XLXN_834(7:0)" name="init_Din(7:0)" />
            <blockpin signalname="XLXN_800(7:0)" name="ram_Din(7:0)" />
            <blockpin signalname="un,un,un,un,un,un" name="JOYSTICK1(5:0)" />
            <blockpin signalname="un,un,un,un,un,un" name="JOYSTICK2(5:0)" />
            <blockpin signalname="RAMBank(2:0)" name="RAMBank(2:0)" />
            <blockpin signalname="ROMBank(3:0)" name="ROMbank(3:0)" />
            <blockpin signalname="XLXN_798(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="audio" name="audio" />
            <blockpin signalname="XLXN_759(7:0)" name="vram_D(7:0)" />
            <blockpin signalname="XLXN_772(13:0)" name="palette_A(13:0)" />
            <blockpin signalname="XLXN_771(7:0)" name="palette_D(7:0)" />
            <blockpin signalname="XLXN_753" name="vram_W" />
            <blockpin signalname="XLXN_760(14:0)" name="vram_A(14:0)" />
            <blockpin signalname="ROMen" name="ROMen" />
            <blockpin signalname="XLXN_796" name="ram_W" />
            <blockpin signalname="XLXN_770" name="palette_W" />
            <blockpin signalname="XLXN_797" name="ram_R" />
            <blockpin signalname="XLXN_787" name="key_reset" />
            <blockpin signalname="XLXN_789" name="change" />
            <blockpin signalname="XLXN_788(7:0)" name="DSK_select(7:0)" />
            <blockpin signalname="XLXN_790(6:0)" name="FDD_output(6:0)" />
            <blockpin signalname="XLXN_801(7:0)" name="init_Dout(7:0)" />
            <blockpin signalname="XLXN_799(7:0)" name="ram_Dout(7:0)" />
        </block>
        <block symbolname="inv" name="XLXI_524">
            <blockpin signalname="audio" name="I" />
            <blockpin signalname="ampPWM" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_526">
            <blockpin signalname="ampSD" name="P" />
        </block>
        <block symbolname="divideby6" name="XLXI_528">
            <blockpin signalname="clk" name="CLKin" />
            <blockpin signalname="clk25MHz" name="CLK25MHz" />
            <blockpin name="CLK8MHz" />
            <blockpin signalname="nCLK4MHz" name="nCLK4MHz" />
            <blockpin signalname="nCLK25MHz" name="nCLK25MHz" />
            <blockpin signalname="CLK4MHz" name="CLK4MHz" />
            <blockpin name="nCLK8MHz" />
        </block>
        <block symbolname="NEXYS4_SDRAM" name="XLXI_529">
            <blockpin signalname="XLXN_796" name="w" />
            <blockpin signalname="XLXN_797" name="r" />
            <blockpin signalname="XLXN_798(22:0)" name="A(22:0)" />
            <blockpin signalname="XLXN_799(7:0)" name="Din(7:0)" />
            <blockpin signalname="RamWEn" name="RamWEn" />
            <blockpin signalname="XLXN_800(7:0)" name="Dout(7:0)" />
            <blockpin signalname="MemDB_U(7:0)" name="MemDB_U(7:0)" />
            <blockpin signalname="RamOEn" name="RamOEn" />
            <blockpin signalname="MemAdr(22:0)" name="MemAdr(22:0)" />
            <blockpin signalname="MemDB(7:0)" name="MemDB(7:0)" />
            <blockpin signalname="RamLBn" name="RamLBn" />
            <blockpin signalname="RamUBn" name="RamUBn" />
            <blockpin signalname="RamCEn" name="RamCEn" />
            <blockpin signalname="RamADVn" name="RamADVn" />
            <blockpin signalname="RamCLK" name="RamCLK" />
            <blockpin signalname="RamCRE" name="RamCRE" />
        </block>
        <block symbolname="NEXYS4_RGB" name="XLXI_530">
            <blockpin signalname="XLXN_831(1:0)" name="RED_FF(1:0)" />
            <blockpin signalname="XLXN_832(2:0)" name="GREEN_FFF(2:0)" />
            <blockpin signalname="XLXN_833(1:0)" name="BLUE_FF(1:0)" />
            <blockpin signalname="vgaRed(3:0)" name="RED4(3:0)" />
            <blockpin signalname="vgaGreen(3:0)" name="GREEN4(3:0)" />
            <blockpin signalname="vgaBlue(3:0)" name="BLUE4(3:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_256">
            <blockpin signalname="un" name="P" />
        </block>
        <block symbolname="bootloader_sd" name="XLXI_462">
            <blockpin signalname="MISO" name="MISO" />
            <blockpin signalname="XLXN_788(7:0)" name="FILE_SELECT(7:0)" />
            <blockpin signalname="nCLK4MHz" name="CLK8MHz" />
            <blockpin signalname="CLK4MHz" name="nCLK8MHz" />
            <blockpin signalname="btnC" name="dump" />
            <blockpin signalname="sw(4:0)" name="leds_select(4:0)" />
            <blockpin signalname="XLXN_787" name="key_reset" />
            <blockpin signalname="XLXN_789" name="file_change" />
            <blockpin signalname="XLXN_790(6:0)" name="FDC_input(6:0)" />
            <blockpin signalname="XLXN_801(7:0)" name="ram_Din(7:0)" />
            <blockpin signalname="XLXN_839" name="dir_entry_ack" />
            <blockpin signalname="XLXN_839" name="dir_entry_downloading" />
            <blockpin signalname="MOSI" name="MOSI" />
            <blockpin signalname="XLXN_737(22:0)" name="ram_A(22:0)" />
            <blockpin signalname="SCLK" name="SCLK" />
            <blockpin signalname="XLXN_836" name="is_ucpm" />
            <blockpin signalname="RESET_n" name="FILE_LOADED" />
            <blockpin signalname="XLXN_736" name="ram_W_n" />
            <blockpin signalname="led(7:0)" name="LEDS(7:0)" />
            <blockpin signalname="SS_n" name="SS_n" />
            <blockpin signalname="XLXN_791(5:0)" name="FDC_output(5:0)" />
            <blockpin signalname="XLXN_834(7:0)" name="ram_Dout(7:0)" />
            <blockpin signalname="XLXN_837" name="ram_R_n" />
            <blockpin name="dir_entry_clk" />
            <blockpin name="dir_entry_d(7:0)" />
            <blockpin name="dir_entry_r" />
        </block>
        <block symbolname="gnd" name="XLXI_531">
            <blockpin signalname="XLXN_839" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="MISO">
            <wire x2="6144" y1="272" y2="272" x1="6064" />
        </branch>
        <branch name="MOSI">
            <wire x2="6688" y1="128" y2="128" x1="6640" />
        </branch>
        <branch name="SCLK">
            <wire x2="6672" y1="512" y2="512" x1="6640" />
        </branch>
        <branch name="SS_n">
            <wire x2="6688" y1="704" y2="704" x1="6640" />
        </branch>
        <iomarker fontsize="28" x="6064" y="272" name="MISO" orien="R180" />
        <iomarker fontsize="28" x="6688" y="704" name="SS_n" orien="R0" />
        <iomarker fontsize="28" x="6672" y="512" name="SCLK" orien="R0" />
        <iomarker fontsize="28" x="6688" y="128" name="MOSI" orien="R0" />
        <instance x="4320" y="1488" name="XLXI_511" orien="R0">
        </instance>
        <branch name="Vsync">
            <wire x2="4848" y1="880" y2="880" x1="4784" />
        </branch>
        <branch name="Hsync">
            <wire x2="4832" y1="992" y2="992" x1="4784" />
        </branch>
        <iomarker fontsize="28" x="4848" y="880" name="Vsync" orien="R0" />
        <iomarker fontsize="28" x="4832" y="992" name="Hsync" orien="R0" />
        <instance x="1424" y="2000" name="XLXI_512" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP_HIERARCHY" x="193" y="-680" type="instance" />
        </instance>
        <branch name="un,un,un,un,un,un">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="1904" type="branch" />
            <wire x2="1968" y1="1904" y2="1904" x1="1872" />
            <wire x2="2032" y1="1904" y2="1904" x1="1968" />
            <wire x2="1968" y1="1904" y2="1968" x1="1968" />
            <wire x2="1968" y1="1968" y2="1968" x1="1872" />
        </branch>
        <branch name="audio">
            <wire x2="1936" y1="1584" y2="1584" x1="1872" />
            <wire x2="2000" y1="1584" y2="1584" x1="1936" />
            <wire x2="2448" y1="1504" y2="1504" x1="1936" />
            <wire x2="1936" y1="1504" y2="1584" x1="1936" />
        </branch>
        <branch name="XLXN_736">
            <wire x2="1424" y1="1360" y2="1360" x1="1200" />
            <wire x2="1200" y1="1360" y2="2880" x1="1200" />
            <wire x2="6960" y1="2880" y2="2880" x1="1200" />
            <wire x2="6960" y1="576" y2="576" x1="6640" />
            <wire x2="6960" y1="576" y2="2880" x1="6960" />
        </branch>
        <branch name="XLXN_737(22:0)">
            <wire x2="1360" y1="16" y2="1264" x1="1360" />
            <wire x2="1424" y1="1264" y2="1264" x1="1360" />
            <wire x2="6672" y1="16" y2="16" x1="1360" />
            <wire x2="6672" y1="16" y2="256" x1="6672" />
            <wire x2="6672" y1="256" y2="256" x1="6640" />
        </branch>
        <text style="fontsize:64;fontname:Arial" x="344" y="600">100MHz !</text>
        <text style="fontsize:64;fontname:Arial" x="284" y="512">NEXYS4 :</text>
        <branch name="clk">
            <wire x2="160" y1="688" y2="688" x1="144" />
            <wire x2="160" y1="688" y2="1328" x1="160" />
            <wire x2="208" y1="1328" y2="1328" x1="160" />
        </branch>
        <iomarker fontsize="28" x="144" y="688" name="clk" orien="R180" />
        <branch name="clk25MHz">
            <wire x2="672" y1="1328" y2="1328" x1="592" />
            <wire x2="672" y1="1328" y2="2576" x1="672" />
            <wire x2="3744" y1="2576" y2="2576" x1="672" />
            <wire x2="3744" y1="1456" y2="2576" x1="3744" />
            <wire x2="4320" y1="1456" y2="1456" x1="3744" />
        </branch>
        <branch name="XLXN_753">
            <wire x2="2160" y1="1680" y2="1680" x1="1872" />
            <wire x2="2160" y1="960" y2="1680" x1="2160" />
            <wire x2="4320" y1="960" y2="960" x1="2160" />
        </branch>
        <branch name="XLXN_759(7:0)">
            <wire x2="2176" y1="1632" y2="1632" x1="1872" />
            <wire x2="2176" y1="1024" y2="1632" x1="2176" />
            <wire x2="4320" y1="1024" y2="1024" x1="2176" />
        </branch>
        <branch name="XLXN_760(14:0)">
            <wire x2="3072" y1="1712" y2="1712" x1="1872" />
            <wire x2="3072" y1="1088" y2="1712" x1="3072" />
            <wire x2="4320" y1="1088" y2="1088" x1="3072" />
        </branch>
        <text style="fontsize:64;fontname:Arial" x="2644" y="600">Normalement 16MHz, mais pb boot Z80 qui wr_n par defaut donc inconscient 4MHz afin de reveiller doucement le Z80</text>
        <branch name="RESET_n">
            <wire x2="1424" y1="1840" y2="1840" x1="336" />
            <wire x2="336" y1="1840" y2="2800" x1="336" />
            <wire x2="6928" y1="2800" y2="2800" x1="336" />
            <wire x2="6928" y1="448" y2="448" x1="6640" />
            <wire x2="6928" y1="448" y2="2800" x1="6928" />
        </branch>
        <branch name="RAMBank(2:0)">
            <wire x2="2048" y1="2048" y2="2048" x1="1872" />
        </branch>
        <branch name="ROMBank(3:0)">
            <wire x2="2048" y1="2096" y2="2096" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="2048" y="2048" name="RAMBank(2:0)" orien="R0" />
        <iomarker fontsize="28" x="2048" y="2096" name="ROMBank(3:0)" orien="R0" />
        <branch name="ROMen">
            <wire x2="2048" y1="2144" y2="2144" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="2048" y="2144" name="ROMen" orien="R0" />
        <branch name="btnC">
            <wire x2="6144" y1="592" y2="592" x1="6016" />
        </branch>
        <branch name="sw(4:0)">
            <wire x2="6144" y1="128" y2="128" x1="5936" />
        </branch>
        <branch name="XLXN_770">
            <wire x2="3056" y1="2272" y2="2272" x1="1872" />
            <wire x2="3056" y1="1648" y2="2272" x1="3056" />
            <wire x2="4320" y1="1648" y2="1648" x1="3056" />
        </branch>
        <branch name="XLXN_771(7:0)">
            <wire x2="3040" y1="2400" y2="2400" x1="1872" />
            <wire x2="3040" y1="1520" y2="2400" x1="3040" />
            <wire x2="4320" y1="1520" y2="1520" x1="3040" />
        </branch>
        <branch name="XLXN_772(13:0)">
            <wire x2="3104" y1="2336" y2="2336" x1="1872" />
            <wire x2="3104" y1="1584" y2="2336" x1="3104" />
            <wire x2="4320" y1="1584" y2="1584" x1="3104" />
        </branch>
        <branch name="PS2Clk">
            <wire x2="1424" y1="1648" y2="1648" x1="1392" />
        </branch>
        <iomarker fontsize="28" x="1392" y="1648" name="PS2Clk" orien="R180" />
        <branch name="PS2Data">
            <wire x2="1424" y1="1744" y2="1744" x1="1392" />
        </branch>
        <iomarker fontsize="28" x="1392" y="1744" name="PS2Data" orien="R180" />
        <branch name="led(7:0)">
            <wire x2="6720" y1="640" y2="640" x1="6640" />
        </branch>
        <iomarker fontsize="28" x="6720" y="640" name="led(7:0)" orien="R0" />
        <branch name="ampPWM">
            <wire x2="2704" y1="1504" y2="1504" x1="2672" />
        </branch>
        <instance x="2448" y="1536" name="XLXI_524" orien="R0" />
        <iomarker fontsize="28" x="2704" y="1504" name="ampPWM" orien="R0" />
        <iomarker fontsize="28" x="2000" y="1584" name="audio" orien="R0" />
        <instance x="2560" y="1616" name="XLXI_526" orien="R0" />
        <branch name="ampSD">
            <wire x2="2624" y1="1616" y2="1648" x1="2624" />
            <wire x2="2704" y1="1648" y2="1648" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2704" y="1648" name="ampSD" orien="R0" />
        <iomarker fontsize="28" x="6016" y="592" name="btnC" orien="R180" />
        <branch name="XLXN_787">
            <wire x2="4096" y1="2224" y2="2224" x1="1872" />
            <wire x2="4096" y1="2224" y2="2480" x1="4096" />
            <wire x2="5728" y1="2480" y2="2480" x1="4096" />
            <wire x2="6144" y1="768" y2="768" x1="5728" />
            <wire x2="5728" y1="768" y2="2480" x1="5728" />
        </branch>
        <branch name="XLXN_788(7:0)">
            <wire x2="1920" y1="1504" y2="1504" x1="1872" />
            <wire x2="1920" y1="1440" y2="1504" x1="1920" />
            <wire x2="2256" y1="1440" y2="1440" x1="1920" />
            <wire x2="2256" y1="480" y2="1440" x1="2256" />
            <wire x2="6144" y1="480" y2="480" x1="2256" />
        </branch>
        <branch name="XLXN_789">
            <wire x2="2240" y1="1456" y2="1456" x1="1872" />
            <wire x2="2240" y1="432" y2="1456" x1="2240" />
            <wire x2="6144" y1="432" y2="432" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="5936" y="128" name="sw(4:0)" orien="R180" />
        <branch name="nCLK25MHz">
            <wire x2="656" y1="1392" y2="1392" x1="592" />
            <wire x2="2560" y1="1152" y2="1152" x1="656" />
            <wire x2="2560" y1="1152" y2="1408" x1="2560" />
            <wire x2="4320" y1="1408" y2="1408" x1="2560" />
            <wire x2="656" y1="1152" y2="1392" x1="656" />
        </branch>
        <instance x="208" y="1360" name="XLXI_528" orien="R0">
        </instance>
        <branch name="CLK4MHz">
            <wire x2="1008" y1="1584" y2="1584" x1="592" />
            <wire x2="1008" y1="1584" y2="2336" x1="1008" />
            <wire x2="1424" y1="2336" y2="2336" x1="1008" />
            <wire x2="6144" y1="320" y2="320" x1="1008" />
            <wire x2="1008" y1="320" y2="1584" x1="1008" />
        </branch>
        <branch name="nCLK4MHz">
            <wire x2="992" y1="1648" y2="1648" x1="592" />
            <wire x2="992" y1="1648" y2="2272" x1="992" />
            <wire x2="1424" y1="2272" y2="2272" x1="992" />
            <wire x2="992" y1="2272" y2="2496" x1="992" />
            <wire x2="2480" y1="2496" y2="2496" x1="992" />
            <wire x2="6144" y1="368" y2="368" x1="992" />
            <wire x2="992" y1="368" y2="1648" x1="992" />
            <wire x2="2480" y1="1744" y2="2496" x1="2480" />
            <wire x2="4064" y1="1744" y2="1744" x1="2480" />
            <wire x2="4320" y1="1152" y2="1152" x1="4064" />
            <wire x2="4064" y1="1152" y2="1712" x1="4064" />
            <wire x2="4320" y1="1712" y2="1712" x1="4064" />
            <wire x2="4064" y1="1712" y2="1744" x1="4064" />
        </branch>
        <branch name="XLXN_790(6:0)">
            <wire x2="4000" y1="2448" y2="2448" x1="1872" />
            <wire x2="4000" y1="528" y2="2448" x1="4000" />
            <wire x2="6144" y1="528" y2="528" x1="4000" />
        </branch>
        <branch name="XLXN_791(5:0)">
            <wire x2="1424" y1="2448" y2="2448" x1="1360" />
            <wire x2="1360" y1="2448" y2="2512" x1="1360" />
            <wire x2="6912" y1="2512" y2="2512" x1="1360" />
            <wire x2="6912" y1="304" y2="304" x1="6640" />
            <wire x2="6912" y1="304" y2="2512" x1="6912" />
        </branch>
        <instance x="4496" y="2160" name="XLXI_529" orien="R0">
        </instance>
        <branch name="RamWEn">
            <wire x2="4912" y1="1872" y2="1872" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="1872" name="RamWEn" orien="R0" />
        <branch name="XLXN_796">
            <wire x2="3184" y1="1760" y2="1760" x1="1872" />
            <wire x2="3184" y1="1760" y2="1872" x1="3184" />
            <wire x2="4496" y1="1872" y2="1872" x1="3184" />
        </branch>
        <branch name="XLXN_797">
            <wire x2="3168" y1="1808" y2="1808" x1="1872" />
            <wire x2="3168" y1="1808" y2="1936" x1="3168" />
            <wire x2="4496" y1="1936" y2="1936" x1="3168" />
        </branch>
        <branch name="XLXN_798(22:0)">
            <wire x2="3152" y1="1392" y2="1392" x1="1872" />
            <wire x2="3152" y1="1392" y2="2000" x1="3152" />
            <wire x2="4496" y1="2000" y2="2000" x1="3152" />
        </branch>
        <branch name="XLXN_799(7:0)">
            <wire x2="3136" y1="1856" y2="1856" x1="1872" />
            <wire x2="3136" y1="1856" y2="2064" x1="3136" />
            <wire x2="4496" y1="2064" y2="2064" x1="3136" />
        </branch>
        <branch name="XLXN_800(7:0)">
            <wire x2="1424" y1="1936" y2="1936" x1="1376" />
            <wire x2="1376" y1="1936" y2="2544" x1="1376" />
            <wire x2="2352" y1="2544" y2="2544" x1="1376" />
            <wire x2="2352" y1="2128" y2="2544" x1="2352" />
            <wire x2="4496" y1="2128" y2="2128" x1="2352" />
        </branch>
        <branch name="XLXN_801(7:0)">
            <wire x2="3984" y1="1312" y2="1312" x1="1872" />
            <wire x2="3984" y1="176" y2="1312" x1="3984" />
            <wire x2="6144" y1="176" y2="176" x1="3984" />
        </branch>
        <branch name="RamOEn">
            <wire x2="4912" y1="1904" y2="1904" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="1904" name="RamOEn" orien="R0" />
        <branch name="MemAdr(22:0)">
            <wire x2="4912" y1="1936" y2="1936" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="1936" name="MemAdr(22:0)" orien="R0" />
        <branch name="MemDB(7:0)">
            <wire x2="4912" y1="1984" y2="1984" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="1984" name="MemDB(7:0)" orien="R0" />
        <branch name="MemDB_U(7:0)">
            <wire x2="4912" y1="2240" y2="2240" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2240" name="MemDB_U(7:0)" orien="R0" />
        <branch name="RamLBn">
            <wire x2="4912" y1="2048" y2="2048" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2048" name="RamLBn" orien="R0" />
        <branch name="RamUBn">
            <wire x2="4912" y1="2080" y2="2080" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2080" name="RamUBn" orien="R0" />
        <branch name="RamCEn">
            <wire x2="4912" y1="2112" y2="2112" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2112" name="RamCEn" orien="R0" />
        <branch name="RamADVn">
            <wire x2="4912" y1="2144" y2="2144" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2144" name="RamADVn" orien="R0" />
        <branch name="RamCLK">
            <wire x2="4912" y1="2176" y2="2176" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2176" name="RamCLK" orien="R0" />
        <branch name="RamCRE">
            <wire x2="4912" y1="2208" y2="2208" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2208" name="RamCRE" orien="R0" />
        <instance x="4880" y="1376" name="XLXI_530" orien="R0">
        </instance>
        <branch name="vgaGreen(3:0)">
            <wire x2="5424" y1="1280" y2="1280" x1="5360" />
        </branch>
        <branch name="vgaRed(3:0)">
            <wire x2="5424" y1="1216" y2="1216" x1="5360" />
        </branch>
        <branch name="vgaBlue(3:0)">
            <wire x2="5424" y1="1344" y2="1344" x1="5360" />
        </branch>
        <iomarker fontsize="28" x="5424" y="1280" name="vgaGreen(3:0)" orien="R0" />
        <iomarker fontsize="28" x="5424" y="1216" name="vgaRed(3:0)" orien="R0" />
        <iomarker fontsize="28" x="5424" y="1344" name="vgaBlue(3:0)" orien="R0" />
        <branch name="XLXN_831(1:0)">
            <wire x2="4880" y1="1216" y2="1216" x1="4784" />
        </branch>
        <branch name="XLXN_832(2:0)">
            <wire x2="4880" y1="1280" y2="1280" x1="4784" />
        </branch>
        <branch name="XLXN_833(1:0)">
            <wire x2="4880" y1="1344" y2="1344" x1="4784" />
        </branch>
        <branch name="un">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="2400" y="2048" type="branch" />
            <wire x2="2400" y1="2000" y2="2048" x1="2400" />
        </branch>
        <instance x="2336" y="2000" name="XLXI_256" orien="R0" />
        <instance x="6144" y="736" name="XLXI_462" orien="R0">
        </instance>
        <branch name="XLXN_834(7:0)">
            <wire x2="1200" y1="736" y2="1312" x1="1200" />
            <wire x2="1424" y1="1312" y2="1312" x1="1200" />
            <wire x2="5824" y1="736" y2="736" x1="1200" />
            <wire x2="5824" y1="736" y2="1120" x1="5824" />
            <wire x2="6992" y1="1120" y2="1120" x1="5824" />
            <wire x2="6992" y1="176" y2="176" x1="6640" />
            <wire x2="6992" y1="176" y2="1120" x1="6992" />
        </branch>
        <branch name="XLXN_836">
            <wire x2="5920" y1="656" y2="656" x1="1072" />
            <wire x2="5920" y1="656" y2="1040" x1="5920" />
            <wire x2="6800" y1="1040" y2="1040" x1="5920" />
            <wire x2="1072" y1="656" y2="1552" x1="1072" />
            <wire x2="1424" y1="1552" y2="1552" x1="1072" />
            <wire x2="6800" y1="768" y2="768" x1="6640" />
            <wire x2="6800" y1="768" y2="1040" x1="6800" />
        </branch>
        <branch name="XLXN_837">
            <wire x2="1120" y1="704" y2="1408" x1="1120" />
            <wire x2="1424" y1="1408" y2="1408" x1="1120" />
            <wire x2="5872" y1="704" y2="704" x1="1120" />
            <wire x2="5872" y1="704" y2="1088" x1="5872" />
            <wire x2="6864" y1="1088" y2="1088" x1="5872" />
            <wire x2="6864" y1="400" y2="400" x1="6640" />
            <wire x2="6864" y1="400" y2="1088" x1="6864" />
        </branch>
        <instance x="6000" y="1040" name="XLXI_531" orien="R0" />
        <branch name="XLXN_839">
            <wire x2="6144" y1="816" y2="816" x1="6064" />
            <wire x2="6064" y1="816" y2="864" x1="6064" />
            <wire x2="6144" y1="864" y2="864" x1="6064" />
            <wire x2="6064" y1="864" y2="912" x1="6064" />
        </branch>
    </sheet>
</drawing>