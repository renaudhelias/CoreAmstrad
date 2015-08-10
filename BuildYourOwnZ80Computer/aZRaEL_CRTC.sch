<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="RESET" />
        <signal name="MASSE_0,MAA(9:5),RAA(2:0),MAA(4:0)" />
        <signal name="IMG(7:0)" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="IMG(7)" />
        <signal name="IMG(5)" />
        <signal name="IMG(6)" />
        <signal name="XLXN_89" />
        <signal name="XLXN_90" />
        <signal name="XLXN_91" />
        <signal name="XLXN_92" />
        <signal name="CLK50MHz" />
        <signal name="XLXN_139" />
        <signal name="XLXN_141" />
        <signal name="MAA(13:0)" />
        <signal name="RAA(4:0)" />
        <signal name="WA(13:0)" />
        <signal name="RA(13:0)" />
        <signal name="XLXN_162(7:0)" />
        <signal name="XLXN_163(7:0)" />
        <signal name="XLXN_183" />
        <signal name="RED" />
        <signal name="GREEN" />
        <signal name="BLUE" />
        <signal name="VSYNC" />
        <signal name="HSYNC" />
        <signal name="WA(14)" />
        <signal name="WA(15)" />
        <signal name="RA(14)" />
        <signal name="RA(15)" />
        <signal name="RA(15:0)" />
        <signal name="WA(15:0)" />
        <signal name="XLXN_229(15:0)" />
        <signal name="XLXN_230(15:0)" />
        <signal name="A_VRAM(15:0)" />
        <signal name="A_VRAM(13:0)" />
        <signal name="XLXN_238(7:0)" />
        <signal name="XLXN_243(7:0)" />
        <signal name="MASSE_0" />
        <signal name="XLXN_245" />
        <signal name="XLXN_246" />
        <signal name="DO_WRITE_EXECUTE" />
        <signal name="XLXN_248" />
        <signal name="PREPARE_READ_EXECUTE" />
        <signal name="XLXN_251" />
        <signal name="DO_READ_EXECUTE" />
        <signal name="XLXN_253" />
        <signal name="XLXN_254" />
        <signal name="XLXN_258" />
        <port polarity="Input" name="RESET" />
        <port polarity="Input" name="CLK50MHz" />
        <port polarity="Output" name="RED" />
        <port polarity="Output" name="GREEN" />
        <port polarity="Output" name="BLUE" />
        <port polarity="Output" name="VSYNC" />
        <port polarity="Output" name="HSYNC" />
        <blockdef name="crtcV">
            <timestamp>2010-11-12T9:31:22</timestamp>
            <rect width="256" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="aZRaEL_vga2vram">
            <timestamp>2010-11-14T11:59:31</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-204" height="24" />
            <line x2="432" y1="-192" y2="-192" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="aZRaEL_vram2vga">
            <timestamp>2010-12-5T17:51:56</timestamp>
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
        <blockdef name="AZRAEL_128x128_ROM">
            <timestamp>2010-11-13T13:0:14</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
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
        <blockdef name="RAM_A14_D8">
            <timestamp>2010-11-14T11:55:34</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="CLK_commander">
            <timestamp>2010-11-15T19:19:44</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-448" height="512" />
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
        <blockdef name="ENABLE16">
            <timestamp>2010-11-13T12:23:11</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="OR16_16">
            <timestamp>2010-11-13T12:23:20</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
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
        <blockdef name="ld8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <rect width="64" x="320" y="-268" height="24" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="aZRaEL2">
            <timestamp>2010-11-13T16:23:36</timestamp>
            <rect width="336" x="64" y="-768" height="768" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <line x2="464" y1="-672" y2="-672" x1="400" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <block symbolname="crtcV" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="IOCLK" />
            <blockpin signalname="XLXN_1" name="RS" />
            <blockpin signalname="XLXN_1" name="CS" />
            <blockpin signalname="XLXN_1" name="RW" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_139" name="CLK" />
            <blockpin name="Din(7:0)" />
            <blockpin signalname="XLXN_82" name="HSYNC" />
            <blockpin signalname="XLXN_81" name="VSYNC" />
            <blockpin signalname="XLXN_92" name="DISP" />
            <blockpin name="CPCHSYNC" />
            <blockpin name="CPCVSYNC" />
            <blockpin name="CPCDISP" />
            <blockpin name="CPCBLACK" />
            <blockpin signalname="MAA(13:0)" name="MA(13:0)" />
            <blockpin signalname="RAA(4:0)" name="RA(4:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="P" />
        </block>
        <block symbolname="aZRaEL_vga2vram" name="XLXI_41">
            <blockpin signalname="XLXN_91" name="RED" />
            <blockpin signalname="XLXN_89" name="GREEN" />
            <blockpin signalname="XLXN_90" name="BLUE" />
            <blockpin signalname="XLXN_81" name="VSYNC" />
            <blockpin signalname="XLXN_82" name="HSYNC" />
            <blockpin signalname="XLXN_139" name="CLK25MHz" />
            <blockpin signalname="XLXN_245" name="W" />
            <blockpin signalname="XLXN_243(7:0)" name="DATA(7:0)" />
            <blockpin signalname="WA(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="AZRAEL_128x128_ROM" name="XLXI_45">
            <blockpin signalname="XLXN_183" name="CLK" />
            <blockpin signalname="MASSE_0,MAA(9:5),RAA(2:0),MAA(4:0)" name="ADDR(13:0)" />
            <blockpin signalname="IMG(7:0)" name="DATA(7:0)" />
        </block>
        <block symbolname="and2" name="XLXI_47">
            <blockpin signalname="IMG(6)" name="I0" />
            <blockpin signalname="XLXN_92" name="I1" />
            <blockpin signalname="XLXN_89" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_49">
            <blockpin signalname="XLXN_92" name="I0" />
            <blockpin signalname="IMG(5)" name="I1" />
            <blockpin signalname="XLXN_90" name="O" />
        </block>
        <block symbolname="CLK_commander" name="XLXI_67">
            <blockpin signalname="CLK50MHz" name="CLK50MHz" />
            <blockpin signalname="XLXN_183" name="CLK100MHz" />
            <blockpin signalname="XLXN_141" name="CLK25MHz" />
            <blockpin signalname="XLXN_139" name="CLK1MHz" />
            <blockpin signalname="XLXN_258" name="PREPARE_WRITE" />
            <blockpin signalname="XLXN_246" name="DO_WRITE" />
            <blockpin signalname="XLXN_248" name="PREPARE_READ" />
            <blockpin signalname="XLXN_254" name="DO_READ" />
            <blockpin name="CLK4MHz" />
        </block>
        <block symbolname="aZRaEL_vram2vga" name="XLXI_42">
            <blockpin signalname="XLXN_141" name="CLK_25MHz" />
            <blockpin signalname="XLXN_162(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_253" name="R" />
            <blockpin signalname="RED" name="RED" />
            <blockpin signalname="GREEN" name="GREEN" />
            <blockpin signalname="BLUE" name="BLUE" />
            <blockpin signalname="VSYNC" name="VSYNC" />
            <blockpin signalname="HSYNC" name="HSYNC" />
            <blockpin signalname="RA(13:0)" name="ADDRESS(13:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_75">
            <blockpin signalname="WA(14)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_106">
            <blockpin signalname="WA(15)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_107">
            <blockpin signalname="RA(14)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_108">
            <blockpin signalname="RA(15)" name="G" />
        </block>
        <block symbolname="ENABLE16" name="XLXI_104">
            <blockpin signalname="XLXN_251" name="ENABLE" />
            <blockpin signalname="RA(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_230(15:0)" name="C(15:0)" />
        </block>
        <block symbolname="ENABLE16" name="XLXI_103">
            <blockpin signalname="DO_WRITE_EXECUTE" name="ENABLE" />
            <blockpin signalname="WA(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_229(15:0)" name="C(15:0)" />
        </block>
        <block symbolname="OR16_16" name="XLXI_105">
            <blockpin signalname="XLXN_229(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_230(15:0)" name="B(15:0)" />
            <blockpin signalname="A_VRAM(15:0)" name="C(15:0)" />
        </block>
        <block symbolname="RAM_A14_D8" name="XLXI_127">
            <blockpin signalname="XLXN_238(7:0)" name="D(7:0)" />
            <blockpin signalname="A_VRAM(13:0)" name="A(13:0)" />
            <blockpin signalname="XLXN_183" name="CLK" />
            <blockpin signalname="DO_WRITE_EXECUTE" name="WE" />
            <blockpin signalname="XLXN_163(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_128">
            <blockpin signalname="MASSE_0" name="G" />
        </block>
        <block symbolname="and2" name="XLXI_129">
            <blockpin signalname="XLXN_246" name="I0" />
            <blockpin signalname="XLXN_245" name="I1" />
            <blockpin signalname="DO_WRITE_EXECUTE" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_130">
            <blockpin signalname="XLXN_253" name="I0" />
            <blockpin signalname="XLXN_248" name="I1" />
            <blockpin signalname="PREPARE_READ_EXECUTE" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_131">
            <blockpin signalname="PREPARE_READ_EXECUTE" name="I0" />
            <blockpin signalname="DO_READ_EXECUTE" name="I1" />
            <blockpin signalname="XLXN_251" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_132">
            <blockpin signalname="XLXN_253" name="I0" />
            <blockpin signalname="XLXN_254" name="I1" />
            <blockpin signalname="DO_READ_EXECUTE" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_133">
            <blockpin signalname="IMG(7)" name="I0" />
            <blockpin signalname="XLXN_92" name="I1" />
            <blockpin signalname="XLXN_91" name="O" />
        </block>
        <block symbolname="ld8" name="XLXI_135">
            <blockpin signalname="XLXN_243(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_258" name="G" />
            <blockpin signalname="XLXN_238(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="ld8" name="XLXI_136">
            <blockpin signalname="XLXN_163(7:0)" name="D(7:0)" />
            <blockpin signalname="DO_READ_EXECUTE" name="G" />
            <blockpin signalname="XLXN_162(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="aZRaEL2" name="XLXI_137">
            <blockpin name="CLK50MHz" />
            <blockpin name="RED" />
            <blockpin name="GREEN" />
            <blockpin name="BLUE" />
            <blockpin name="VSYNC" />
            <blockpin name="HSYNC" />
            <blockpin name="CLK100MHz" />
            <blockpin name="DO_READ" />
            <blockpin name="CLK25MHz" />
            <blockpin name="CLK1MHz" />
            <blockpin name="PREPARE_WRITE" />
            <blockpin name="DO_WRITE" />
            <blockpin name="PREPARE_READ" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="400" y="752" name="XLXI_1" orien="R0">
        </instance>
        <instance x="176" y="208" name="XLXI_2" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="240" y1="208" y2="272" x1="240" />
            <wire x2="336" y1="272" y2="272" x1="240" />
            <wire x2="336" y1="272" y2="288" x1="336" />
            <wire x2="400" y1="288" y2="288" x1="336" />
            <wire x2="336" y1="288" y2="368" x1="336" />
            <wire x2="400" y1="368" y2="368" x1="336" />
            <wire x2="336" y1="368" y2="448" x1="336" />
            <wire x2="400" y1="448" y2="448" x1="336" />
            <wire x2="336" y1="208" y2="272" x1="336" />
            <wire x2="400" y1="208" y2="208" x1="336" />
        </branch>
        <branch name="RESET">
            <wire x2="400" y1="528" y2="528" x1="240" />
        </branch>
        <iomarker fontsize="28" x="240" y="528" name="RESET" orien="R180" />
        <branch name="IMG(7:0)">
            <wire x2="1344" y1="912" y2="912" x1="1328" />
            <wire x2="1344" y1="240" y2="304" x1="1344" />
            <wire x2="1344" y1="304" y2="368" x1="1344" />
            <wire x2="1344" y1="368" y2="912" x1="1344" />
        </branch>
        <bustap x2="1440" y1="240" y2="240" x1="1344" />
        <bustap x2="1440" y1="304" y2="304" x1="1344" />
        <bustap x2="1440" y1="368" y2="368" x1="1344" />
        <branch name="XLXN_82">
            <wire x2="1008" y1="208" y2="208" x1="784" />
            <wire x2="1008" y1="208" y2="576" x1="1008" />
            <wire x2="1872" y1="576" y2="576" x1="1008" />
            <wire x2="2032" y1="496" y2="496" x1="1872" />
            <wire x2="1872" y1="496" y2="576" x1="1872" />
        </branch>
        <instance x="2032" y="592" name="XLXI_41" orien="R0">
        </instance>
        <branch name="XLXN_81">
            <wire x2="864" y1="272" y2="272" x1="784" />
            <wire x2="864" y1="272" y2="528" x1="864" />
            <wire x2="1824" y1="528" y2="528" x1="864" />
            <wire x2="2032" y1="432" y2="432" x1="1824" />
            <wire x2="1824" y1="432" y2="528" x1="1824" />
        </branch>
        <instance x="1728" y="400" name="XLXI_47" orien="R0" />
        <instance x="1488" y="496" name="XLXI_49" orien="R0" />
        <branch name="IMG(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1459" y="240" type="branch" />
            <wire x2="1459" y1="240" y2="240" x1="1440" />
            <wire x2="1488" y1="240" y2="240" x1="1459" />
        </branch>
        <branch name="IMG(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1457" y="368" type="branch" />
            <wire x2="1457" y1="368" y2="368" x1="1440" />
            <wire x2="1488" y1="368" y2="368" x1="1457" />
        </branch>
        <branch name="IMG(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1523" y="304" type="branch" />
            <wire x2="1523" y1="304" y2="304" x1="1440" />
            <wire x2="1584" y1="304" y2="304" x1="1523" />
            <wire x2="1584" y1="304" y2="336" x1="1584" />
            <wire x2="1728" y1="336" y2="336" x1="1584" />
        </branch>
        <branch name="XLXN_89">
            <wire x2="2032" y1="304" y2="304" x1="1984" />
        </branch>
        <branch name="XLXN_90">
            <wire x2="1888" y1="400" y2="400" x1="1744" />
            <wire x2="1888" y1="368" y2="400" x1="1888" />
            <wire x2="2032" y1="368" y2="368" x1="1888" />
        </branch>
        <branch name="XLXN_91">
            <wire x2="1888" y1="208" y2="208" x1="1744" />
            <wire x2="1888" y1="208" y2="240" x1="1888" />
            <wire x2="2032" y1="240" y2="240" x1="1888" />
        </branch>
        <branch name="XLXN_92">
            <wire x2="1136" y1="336" y2="336" x1="784" />
            <wire x2="1136" y1="336" y2="432" x1="1136" />
            <wire x2="1488" y1="432" y2="432" x1="1136" />
            <wire x2="1728" y1="112" y2="112" x1="1136" />
            <wire x2="1728" y1="112" y2="272" x1="1728" />
            <wire x2="1136" y1="112" y2="176" x1="1136" />
            <wire x2="1136" y1="176" y2="336" x1="1136" />
            <wire x2="1488" y1="176" y2="176" x1="1136" />
        </branch>
        <instance x="944" y="1008" name="XLXI_45" orien="R0">
        </instance>
        <branch name="MASSE_0,MAA(9:5),RAA(2:0),MAA(4:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="736" y="976" type="branch" />
            <wire x2="944" y1="976" y2="976" x1="736" />
        </branch>
        <branch name="CLK50MHz">
            <wire x2="5264" y1="3328" y2="3344" x1="5264" />
            <wire x2="5456" y1="3328" y2="3328" x1="5264" />
            <wire x2="5456" y1="3328" y2="3376" x1="5456" />
            <wire x2="5472" y1="3376" y2="3376" x1="5456" />
        </branch>
        <branch name="XLXN_139">
            <wire x2="400" y1="608" y2="608" x1="320" />
            <wire x2="320" y1="608" y2="1088" x1="320" />
            <wire x2="1952" y1="1088" y2="1088" x1="320" />
            <wire x2="2032" y1="560" y2="560" x1="1952" />
            <wire x2="1952" y1="560" y2="1072" x1="1952" />
            <wire x2="1952" y1="1072" y2="1088" x1="1952" />
            <wire x2="5984" y1="1072" y2="1072" x1="1952" />
            <wire x2="5984" y1="1072" y2="3504" x1="5984" />
            <wire x2="5984" y1="3504" y2="3504" x1="5936" />
        </branch>
        <branch name="MAA(13:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="912" y="656" type="branch" />
            <wire x2="912" y1="656" y2="656" x1="784" />
        </branch>
        <branch name="RAA(4:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="912" y="720" type="branch" />
            <wire x2="912" y1="720" y2="720" x1="784" />
        </branch>
        <branch name="WA(13:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2191" y="2080" type="branch" />
            <wire x2="752" y1="2080" y2="2144" x1="752" />
            <wire x2="2191" y1="2080" y2="2080" x1="752" />
            <wire x2="2832" y1="2080" y2="2080" x1="2191" />
            <wire x2="2832" y1="560" y2="560" x1="2464" />
            <wire x2="2832" y1="560" y2="2080" x1="2832" />
        </branch>
        <branch name="RA(13:0)">
            <wire x2="912" y1="2912" y2="3120" x1="912" />
            <wire x2="6640" y1="3120" y2="3120" x1="912" />
            <wire x2="6640" y1="608" y2="608" x1="5968" />
            <wire x2="6640" y1="608" y2="3120" x1="6640" />
        </branch>
        <branch name="XLXN_162(7:0)">
            <wire x2="5536" y1="608" y2="608" x1="5280" />
        </branch>
        <instance x="5536" y="640" name="XLXI_42" orien="R0">
        </instance>
        <branch name="RED">
            <wire x2="6048" y1="288" y2="288" x1="5968" />
        </branch>
        <branch name="GREEN">
            <wire x2="6048" y1="352" y2="352" x1="5968" />
        </branch>
        <branch name="BLUE">
            <wire x2="6048" y1="416" y2="416" x1="5968" />
        </branch>
        <branch name="VSYNC">
            <wire x2="6048" y1="480" y2="480" x1="5968" />
        </branch>
        <branch name="HSYNC">
            <wire x2="6048" y1="544" y2="544" x1="5968" />
        </branch>
        <iomarker fontsize="28" x="6048" y="288" name="RED" orien="R0" />
        <iomarker fontsize="28" x="6048" y="352" name="GREEN" orien="R0" />
        <iomarker fontsize="28" x="6048" y="416" name="BLUE" orien="R0" />
        <iomarker fontsize="28" x="6048" y="480" name="VSYNC" orien="R0" />
        <iomarker fontsize="28" x="6048" y="544" name="HSYNC" orien="R0" />
        <branch name="XLXN_141">
            <wire x2="5520" y1="128" y2="224" x1="5520" />
            <wire x2="5536" y1="224" y2="224" x1="5520" />
            <wire x2="6032" y1="128" y2="128" x1="5520" />
            <wire x2="6032" y1="128" y2="3440" x1="6032" />
            <wire x2="6032" y1="3440" y2="3440" x1="5936" />
        </branch>
        <instance x="5472" y="3792" name="XLXI_67" orien="R0">
        </instance>
        <iomarker fontsize="28" x="5264" y="3344" name="CLK50MHz" orien="R90" />
        <branch name="XLXN_163(7:0)">
            <wire x2="4896" y1="608" y2="608" x1="4512" />
        </branch>
        <branch name="XLXN_183">
            <wire x2="944" y1="912" y2="912" x1="832" />
            <wire x2="832" y1="912" y2="1040" x1="832" />
            <wire x2="944" y1="1040" y2="1040" x1="832" />
            <wire x2="944" y1="1040" y2="1408" x1="944" />
            <wire x2="6000" y1="1408" y2="1408" x1="944" />
            <wire x2="6000" y1="1408" y2="3376" x1="6000" />
            <wire x2="896" y1="800" y2="1408" x1="896" />
            <wire x2="944" y1="1408" y2="1408" x1="896" />
            <wire x2="4128" y1="800" y2="800" x1="896" />
            <wire x2="6000" y1="3376" y2="3376" x1="5936" />
        </branch>
        <instance x="368" y="4432" name="XLXI_75" orien="R0" />
        <branch name="WA(14)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="432" y="4208" type="branch" />
            <wire x2="432" y1="4208" y2="4304" x1="432" />
        </branch>
        <instance x="560" y="4432" name="XLXI_106" orien="R0" />
        <branch name="WA(15)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="624" y="4192" type="branch" />
            <wire x2="624" y1="4192" y2="4304" x1="624" />
        </branch>
        <instance x="752" y="4432" name="XLXI_107" orien="R0" />
        <instance x="928" y="4432" name="XLXI_108" orien="R0" />
        <branch name="RA(14)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="816" y="4192" type="branch" />
            <wire x2="816" y1="4192" y2="4304" x1="816" />
        </branch>
        <branch name="RA(15)">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="992" y="4192" type="branch" />
            <wire x2="992" y1="4192" y2="4304" x1="992" />
        </branch>
        <branch name="RA(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="986" y="2816" type="branch" />
            <wire x2="986" y1="2816" y2="2816" x1="912" />
            <wire x2="1088" y1="2816" y2="2816" x1="986" />
            <wire x2="1696" y1="2816" y2="2816" x1="1088" />
        </branch>
        <branch name="WA(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="871" y="2240" type="branch" />
            <wire x2="871" y1="2240" y2="2240" x1="752" />
            <wire x2="976" y1="2240" y2="2240" x1="871" />
            <wire x2="1696" y1="2240" y2="2240" x1="976" />
        </branch>
        <bustap x2="752" y1="2240" y2="2144" x1="752" />
        <instance x="1696" y="2272" name="XLXI_103" orien="R0">
        </instance>
        <instance x="1696" y="2848" name="XLXI_104" orien="R0">
        </instance>
        <branch name="XLXN_229(15:0)">
            <wire x2="2176" y1="2176" y2="2176" x1="2080" />
            <wire x2="2176" y1="2176" y2="2432" x1="2176" />
            <wire x2="2288" y1="2432" y2="2432" x1="2176" />
        </branch>
        <branch name="XLXN_230(15:0)">
            <wire x2="2176" y1="2752" y2="2752" x1="2080" />
            <wire x2="2176" y1="2496" y2="2752" x1="2176" />
            <wire x2="2288" y1="2496" y2="2496" x1="2176" />
        </branch>
        <bustap x2="912" y1="2816" y2="2912" x1="912" />
        <branch name="A_VRAM(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2713" y="2432" type="branch" />
            <wire x2="2713" y1="2432" y2="2432" x1="2672" />
            <wire x2="2752" y1="2432" y2="2432" x1="2713" />
        </branch>
        <bustap x2="2752" y1="2432" y2="2528" x1="2752" />
        <instance x="2288" y="2528" name="XLXI_105" orien="R0">
        </instance>
        <branch name="A_VRAM(13:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3334" y="2576" type="branch" />
            <wire x2="2752" y1="2528" y2="2576" x1="2752" />
            <wire x2="3334" y1="2576" y2="2576" x1="2752" />
            <wire x2="3872" y1="2576" y2="2576" x1="3334" />
            <wire x2="3872" y1="608" y2="2576" x1="3872" />
            <wire x2="4128" y1="608" y2="608" x1="3872" />
        </branch>
        <branch name="XLXN_238(7:0)">
            <wire x2="3712" y1="144" y2="144" x1="3312" />
            <wire x2="3712" y1="144" y2="736" x1="3712" />
            <wire x2="4128" y1="736" y2="736" x1="3712" />
        </branch>
        <branch name="XLXN_243(7:0)">
            <wire x2="2688" y1="400" y2="400" x1="2464" />
            <wire x2="2688" y1="144" y2="400" x1="2688" />
            <wire x2="2928" y1="144" y2="144" x1="2688" />
        </branch>
        <instance x="4128" y="896" name="XLXI_127" orien="R0">
        </instance>
        <instance x="1104" y="4432" name="XLXI_128" orien="R0" />
        <branch name="MASSE_0">
            <attrtext style="alignment:SOFT-VLEFT" attrname="Name" x="1168" y="4176" type="branch" />
            <wire x2="1168" y1="4176" y2="4304" x1="1168" />
        </branch>
        <instance x="2528" y="3824" name="XLXI_129" orien="R0" />
        <branch name="XLXN_245">
            <wire x2="2544" y1="96" y2="96" x1="800" />
            <wire x2="2544" y1="96" y2="240" x1="2544" />
            <wire x2="800" y1="96" y2="3696" x1="800" />
            <wire x2="2528" y1="3696" y2="3696" x1="800" />
            <wire x2="2544" y1="240" y2="240" x1="2464" />
        </branch>
        <branch name="XLXN_246">
            <wire x2="2528" y1="3760" y2="3760" x1="2480" />
            <wire x2="2480" y1="3760" y2="3872" x1="2480" />
            <wire x2="6016" y1="3872" y2="3872" x1="2480" />
            <wire x2="6016" y1="3632" y2="3632" x1="5936" />
            <wire x2="6016" y1="3632" y2="3872" x1="6016" />
        </branch>
        <instance x="3952" y="4224" name="XLXI_130" orien="R0" />
        <branch name="XLXN_248">
            <wire x2="3952" y1="4096" y2="4096" x1="3888" />
            <wire x2="3888" y1="4096" y2="4256" x1="3888" />
            <wire x2="6000" y1="4256" y2="4256" x1="3888" />
            <wire x2="6000" y1="3696" y2="3696" x1="5936" />
            <wire x2="6000" y1="3696" y2="4256" x1="6000" />
        </branch>
        <instance x="4288" y="4144" name="XLXI_131" orien="R0" />
        <branch name="PREPARE_READ_EXECUTE">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4228" y="4128" type="branch" />
            <wire x2="4228" y1="4128" y2="4128" x1="4208" />
            <wire x2="4240" y1="4128" y2="4128" x1="4228" />
            <wire x2="4240" y1="4080" y2="4128" x1="4240" />
            <wire x2="4288" y1="4080" y2="4080" x1="4240" />
        </branch>
        <branch name="XLXN_251">
            <wire x2="1632" y1="2640" y2="2752" x1="1632" />
            <wire x2="1696" y1="2752" y2="2752" x1="1632" />
            <wire x2="4608" y1="2640" y2="2640" x1="1632" />
            <wire x2="4608" y1="2640" y2="4048" x1="4608" />
            <wire x2="4608" y1="4048" y2="4048" x1="4544" />
        </branch>
        <instance x="3952" y="4080" name="XLXI_132" orien="R0" />
        <branch name="DO_READ_EXECUTE">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4306" y="3984" type="branch" />
            <wire x2="4240" y1="3984" y2="3984" x1="4208" />
            <wire x2="4240" y1="3984" y2="4016" x1="4240" />
            <wire x2="4288" y1="4016" y2="4016" x1="4240" />
            <wire x2="4306" y1="3984" y2="3984" x1="4240" />
            <wire x2="4329" y1="3984" y2="3984" x1="4306" />
            <wire x2="4560" y1="3984" y2="3984" x1="4329" />
            <wire x2="4560" y1="736" y2="3984" x1="4560" />
            <wire x2="4896" y1="736" y2="736" x1="4560" />
        </branch>
        <branch name="XLXN_253">
            <wire x2="3952" y1="4016" y2="4016" x1="3872" />
            <wire x2="3872" y1="4016" y2="4160" x1="3872" />
            <wire x2="3952" y1="4160" y2="4160" x1="3872" />
            <wire x2="3872" y1="4160" y2="4192" x1="3872" />
            <wire x2="6256" y1="4192" y2="4192" x1="3872" />
            <wire x2="6256" y1="224" y2="224" x1="5968" />
            <wire x2="6256" y1="224" y2="4192" x1="6256" />
        </branch>
        <branch name="XLXN_254">
            <wire x2="3872" y1="3888" y2="3952" x1="3872" />
            <wire x2="3952" y1="3952" y2="3952" x1="3872" />
            <wire x2="5984" y1="3888" y2="3888" x1="3872" />
            <wire x2="5984" y1="3760" y2="3760" x1="5936" />
            <wire x2="5984" y1="3760" y2="3888" x1="5984" />
        </branch>
        <instance x="1488" y="304" name="XLXI_133" orien="R0" />
        <instance x="2928" y="400" name="XLXI_135" orien="R0" />
        <branch name="DO_WRITE_EXECUTE">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3121" y="3728" type="branch" />
            <wire x2="1616" y1="2096" y2="2176" x1="1616" />
            <wire x2="1696" y1="2176" y2="2176" x1="1616" />
            <wire x2="2199" y1="2096" y2="2096" x1="1616" />
            <wire x2="2848" y1="2096" y2="2096" x1="2199" />
            <wire x2="2848" y1="2096" y2="3245" x1="2848" />
            <wire x2="2848" y1="3245" y2="3260" x1="2848" />
            <wire x2="2848" y1="3260" y2="3728" x1="2848" />
            <wire x2="3121" y1="3728" y2="3728" x1="2848" />
            <wire x2="3488" y1="3728" y2="3728" x1="3121" />
            <wire x2="2848" y1="3728" y2="3728" x1="2784" />
            <wire x2="3488" y1="672" y2="3728" x1="3488" />
            <wire x2="4128" y1="672" y2="672" x1="3488" />
        </branch>
        <branch name="XLXN_258">
            <wire x2="2864" y1="16" y2="272" x1="2864" />
            <wire x2="2928" y1="272" y2="272" x1="2864" />
            <wire x2="6016" y1="16" y2="16" x1="2864" />
            <wire x2="6016" y1="16" y2="3568" x1="6016" />
            <wire x2="6016" y1="3568" y2="3568" x1="5936" />
        </branch>
        <instance x="4896" y="864" name="XLXI_136" orien="R0" />
        <instance x="1760" y="5056" name="XLXI_137" orien="R0">
        </instance>
    </sheet>
</drawing>