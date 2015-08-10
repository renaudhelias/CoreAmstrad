<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="crtc6845">
            <timestamp>2010-9-26T9:18:15</timestamp>
            <rect width="320" x="64" y="-1024" height="1024" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="448" y1="-992" y2="-992" x1="384" />
            <line x2="448" y1="-928" y2="-928" x1="384" />
            <line x2="448" y1="-864" y2="-864" x1="384" />
            <line x2="448" y1="-800" y2="-800" x1="384" />
            <rect width="64" x="384" y="-748" height="24" />
            <line x2="448" y1="-736" y2="-736" x1="384" />
            <rect width="64" x="384" y="-684" height="24" />
            <line x2="448" y1="-672" y2="-672" x1="384" />
            <line x2="448" y1="-608" y2="-608" x1="384" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <block symbolname="crtc6845" name="XLXI_1">
            <blockpin name="LPSTBn" />
            <blockpin name="E" />
            <blockpin name="RS" />
            <blockpin name="CSn" />
            <blockpin name="RW" />
            <blockpin name="RESETn" />
            <blockpin name="CLK" />
            <blockpin name="REG_INIT" />
            <blockpin name="HSYNC" />
            <blockpin name="VSYNC" />
            <blockpin name="DE" />
            <blockpin name="CURSOR" />
            <blockpin name="MA(13:0)" />
            <blockpin name="RA(4:0)" />
            <blockpin name="Hend" />
            <blockpin name="HS" />
            <blockpin name="CHROW_CLK" />
            <blockpin name="Vend" />
            <blockpin name="SLadj" />
            <blockpin name="H" />
            <blockpin name="V" />
            <blockpin name="CURSOR_ACTIVE" />
            <blockpin name="VERT_RST" />
            <blockpin name="D(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1088" y="1648" name="XLXI_1" orien="R0">
        </instance>
    </sheet>
</drawing>