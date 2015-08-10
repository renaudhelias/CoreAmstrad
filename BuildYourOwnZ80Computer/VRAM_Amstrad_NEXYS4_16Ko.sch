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
        <signal name="vram_A(13:0)" />
        <signal name="vga_A(13:0)" />
        <signal name="vram_W" />
        <signal name="vram_D(7:0)" />
        <signal name="vga_D(7:0)" />
        <signal name="vram_D(0)" />
        <signal name="vga_D(0)" />
        <signal name="vga_D(1)" />
        <signal name="vga_D(2)" />
        <signal name="vram_D(3)" />
        <signal name="vga_D(3)" />
        <signal name="vga_D(4)" />
        <signal name="vga_D(5)" />
        <signal name="vga_D(6)" />
        <signal name="vga_D(7)" />
        <signal name="vram_D(1)" />
        <signal name="vram_D(2)" />
        <signal name="vram_D(4)" />
        <signal name="vram_D(5)" />
        <signal name="vram_D(6)" />
        <signal name="vram_D(7)" />
        <port polarity="Input" name="vram_CLK" />
        <port polarity="Input" name="vga_CLK" />
        <port polarity="Input" name="vram_A(13:0)" />
        <port polarity="Input" name="vga_A(13:0)" />
        <port polarity="Input" name="vram_W" />
        <port polarity="Input" name="vram_D(7:0)" />
        <port polarity="Output" name="vga_D(7:0)" />
        <blockdef name="VRAM_Amstrad_NEXYS4">
            <timestamp>2014-10-11T17:40:46</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-384" height="448" />
        </blockdef>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_30">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(0)" name="vram_D" />
            <blockpin signalname="vga_D(0)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_31">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(1)" name="vram_D" />
            <blockpin signalname="vga_D(1)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_32">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(2)" name="vram_D" />
            <blockpin signalname="vga_D(2)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_33">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(3)" name="vram_D" />
            <blockpin signalname="vga_D(3)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_34">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(4)" name="vram_D" />
            <blockpin signalname="vga_D(4)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_35">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(5)" name="vram_D" />
            <blockpin signalname="vga_D(5)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_36">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(6)" name="vram_D" />
            <blockpin signalname="vga_D(6)" name="vga_D" />
        </block>
        <block symbolname="VRAM_Amstrad_NEXYS4" name="XLXI_37">
            <blockpin signalname="vram_A(13:0)" name="vram_A(13:0)" />
            <blockpin signalname="vga_A(13:0)" name="vga_A(13:0)" />
            <blockpin signalname="vram_CLK" name="vram_CLK" />
            <blockpin signalname="vga_CLK" name="vga_CLK" />
            <blockpin signalname="vram_W" name="vram_W" />
            <blockpin signalname="vram_D(7)" name="vram_D" />
            <blockpin signalname="vga_D(7)" name="vga_D" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="vram_CLK">
            <wire x2="608" y1="640" y2="1008" x1="608" />
            <wire x2="1552" y1="1008" y2="1008" x1="608" />
            <wire x2="2832" y1="1008" y2="1008" x1="1552" />
            <wire x2="4640" y1="1008" y2="1008" x1="2832" />
            <wire x2="4640" y1="1008" y2="1312" x1="4640" />
            <wire x2="4640" y1="1312" y2="2608" x1="4640" />
            <wire x2="4640" y1="2608" y2="3040" x1="4640" />
            <wire x2="5520" y1="3040" y2="3040" x1="4640" />
            <wire x2="5584" y1="1312" y2="1312" x1="4640" />
            <wire x2="2832" y1="1008" y2="1408" x1="2832" />
            <wire x2="4096" y1="1408" y2="1408" x1="2832" />
            <wire x2="1552" y1="1008" y2="1376" x1="1552" />
            <wire x2="2320" y1="1376" y2="1376" x1="1552" />
            <wire x2="608" y1="1008" y2="1344" x1="608" />
            <wire x2="1008" y1="1344" y2="1344" x1="608" />
            <wire x2="2400" y1="2608" y2="2608" x1="832" />
            <wire x2="3808" y1="2608" y2="2608" x1="2400" />
            <wire x2="4640" y1="2608" y2="2608" x1="3808" />
            <wire x2="3808" y1="2608" y2="3056" x1="3808" />
            <wire x2="4016" y1="3056" y2="3056" x1="3808" />
            <wire x2="2400" y1="2608" y2="3072" x1="2400" />
            <wire x2="2544" y1="3072" y2="3072" x1="2400" />
            <wire x2="832" y1="2608" y2="3088" x1="832" />
            <wire x2="992" y1="3088" y2="3088" x1="832" />
        </branch>
        <branch name="vga_CLK">
            <wire x2="544" y1="640" y2="960" x1="544" />
            <wire x2="1504" y1="960" y2="960" x1="544" />
            <wire x2="2896" y1="960" y2="960" x1="1504" />
            <wire x2="4624" y1="960" y2="960" x1="2896" />
            <wire x2="4624" y1="960" y2="1376" x1="4624" />
            <wire x2="4624" y1="1376" y2="2544" x1="4624" />
            <wire x2="4624" y1="2544" y2="3104" x1="4624" />
            <wire x2="5520" y1="3104" y2="3104" x1="4624" />
            <wire x2="5584" y1="1376" y2="1376" x1="4624" />
            <wire x2="2896" y1="960" y2="1472" x1="2896" />
            <wire x2="4096" y1="1472" y2="1472" x1="2896" />
            <wire x2="1504" y1="960" y2="1440" x1="1504" />
            <wire x2="2320" y1="1440" y2="1440" x1="1504" />
            <wire x2="544" y1="960" y2="1408" x1="544" />
            <wire x2="1008" y1="1408" y2="1408" x1="544" />
            <wire x2="2384" y1="2544" y2="2544" x1="800" />
            <wire x2="3856" y1="2544" y2="2544" x1="2384" />
            <wire x2="4624" y1="2544" y2="2544" x1="3856" />
            <wire x2="3856" y1="2544" y2="3120" x1="3856" />
            <wire x2="4016" y1="3120" y2="3120" x1="3856" />
            <wire x2="2384" y1="2544" y2="3136" x1="2384" />
            <wire x2="2544" y1="3136" y2="3136" x1="2384" />
            <wire x2="800" y1="2544" y2="3152" x1="800" />
            <wire x2="992" y1="3152" y2="3152" x1="800" />
        </branch>
        <branch name="vram_A(13:0)">
            <wire x2="480" y1="640" y2="896" x1="480" />
            <wire x2="1568" y1="896" y2="896" x1="480" />
            <wire x2="2848" y1="896" y2="896" x1="1568" />
            <wire x2="4608" y1="896" y2="896" x1="2848" />
            <wire x2="4608" y1="896" y2="1184" x1="4608" />
            <wire x2="4608" y1="1184" y2="2464" x1="4608" />
            <wire x2="4608" y1="2464" y2="2912" x1="4608" />
            <wire x2="5520" y1="2912" y2="2912" x1="4608" />
            <wire x2="5584" y1="1184" y2="1184" x1="4608" />
            <wire x2="2848" y1="896" y2="1280" x1="2848" />
            <wire x2="4096" y1="1280" y2="1280" x1="2848" />
            <wire x2="1568" y1="896" y2="1248" x1="1568" />
            <wire x2="2320" y1="1248" y2="1248" x1="1568" />
            <wire x2="480" y1="896" y2="1216" x1="480" />
            <wire x2="1008" y1="1216" y2="1216" x1="480" />
            <wire x2="2352" y1="2464" y2="2464" x1="736" />
            <wire x2="3840" y1="2464" y2="2464" x1="2352" />
            <wire x2="4608" y1="2464" y2="2464" x1="3840" />
            <wire x2="3840" y1="2464" y2="2928" x1="3840" />
            <wire x2="4016" y1="2928" y2="2928" x1="3840" />
            <wire x2="2352" y1="2464" y2="2944" x1="2352" />
            <wire x2="2544" y1="2944" y2="2944" x1="2352" />
            <wire x2="736" y1="2464" y2="2960" x1="736" />
            <wire x2="992" y1="2960" y2="2960" x1="736" />
        </branch>
        <branch name="vga_A(13:0)">
            <wire x2="352" y1="640" y2="832" x1="352" />
            <wire x2="1536" y1="832" y2="832" x1="352" />
            <wire x2="2912" y1="832" y2="832" x1="1536" />
            <wire x2="4592" y1="832" y2="832" x1="2912" />
            <wire x2="4592" y1="832" y2="1248" x1="4592" />
            <wire x2="4592" y1="1248" y2="2400" x1="4592" />
            <wire x2="4592" y1="2400" y2="2976" x1="4592" />
            <wire x2="5520" y1="2976" y2="2976" x1="4592" />
            <wire x2="5584" y1="1248" y2="1248" x1="4592" />
            <wire x2="2912" y1="832" y2="1344" x1="2912" />
            <wire x2="4096" y1="1344" y2="1344" x1="2912" />
            <wire x2="1536" y1="832" y2="1312" x1="1536" />
            <wire x2="2320" y1="1312" y2="1312" x1="1536" />
            <wire x2="352" y1="832" y2="1280" x1="352" />
            <wire x2="1008" y1="1280" y2="1280" x1="352" />
            <wire x2="2320" y1="2400" y2="2400" x1="768" />
            <wire x2="3728" y1="2400" y2="2400" x1="2320" />
            <wire x2="4592" y1="2400" y2="2400" x1="3728" />
            <wire x2="3728" y1="2400" y2="2992" x1="3728" />
            <wire x2="4016" y1="2992" y2="2992" x1="3728" />
            <wire x2="2320" y1="2400" y2="3008" x1="2320" />
            <wire x2="2544" y1="3008" y2="3008" x1="2320" />
            <wire x2="768" y1="2400" y2="3024" x1="768" />
            <wire x2="992" y1="3024" y2="3024" x1="768" />
        </branch>
        <branch name="vram_W">
            <wire x2="800" y1="656" y2="1072" x1="800" />
            <wire x2="800" y1="1072" y2="1248" x1="800" />
            <wire x2="928" y1="1248" y2="1248" x1="800" />
            <wire x2="928" y1="1248" y2="1472" x1="928" />
            <wire x2="1008" y1="1472" y2="1472" x1="928" />
            <wire x2="1488" y1="1072" y2="1072" x1="800" />
            <wire x2="2816" y1="1072" y2="1072" x1="1488" />
            <wire x2="4112" y1="1072" y2="1072" x1="2816" />
            <wire x2="4976" y1="1072" y2="1072" x1="4112" />
            <wire x2="4976" y1="1072" y2="1440" x1="4976" />
            <wire x2="5584" y1="1440" y2="1440" x1="4976" />
            <wire x2="2816" y1="1072" y2="1536" x1="2816" />
            <wire x2="4096" y1="1536" y2="1536" x1="2816" />
            <wire x2="1488" y1="1072" y2="1504" x1="1488" />
            <wire x2="2320" y1="1504" y2="1504" x1="1488" />
            <wire x2="816" y1="3216" y2="4128" x1="816" />
            <wire x2="2368" y1="4128" y2="4128" x1="816" />
            <wire x2="992" y1="3216" y2="3216" x1="816" />
            <wire x2="3056" y1="2720" y2="2720" x1="2368" />
            <wire x2="3056" y1="2720" y2="2848" x1="3056" />
            <wire x2="3792" y1="2848" y2="2848" x1="3056" />
            <wire x2="3792" y1="2848" y2="3184" x1="3792" />
            <wire x2="3792" y1="3184" y2="3808" x1="3792" />
            <wire x2="4656" y1="3808" y2="3808" x1="3792" />
            <wire x2="4016" y1="3184" y2="3184" x1="3792" />
            <wire x2="2368" y1="2720" y2="3200" x1="2368" />
            <wire x2="2368" y1="3200" y2="4128" x1="2368" />
            <wire x2="2544" y1="3200" y2="3200" x1="2368" />
            <wire x2="4112" y1="992" y2="1072" x1="4112" />
            <wire x2="4656" y1="992" y2="992" x1="4112" />
            <wire x2="4656" y1="992" y2="3168" x1="4656" />
            <wire x2="4656" y1="3168" y2="3808" x1="4656" />
            <wire x2="5520" y1="3168" y2="3168" x1="4656" />
        </branch>
        <branch name="vram_D(7:0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="416" y="1040" type="branch" />
            <wire x2="416" y1="640" y2="1040" x1="416" />
        </branch>
        <branch name="vga_D(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="688" type="branch" />
            <wire x2="1248" y1="688" y2="688" x1="1008" />
        </branch>
        <branch name="vram_D(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="800" y="1568" type="branch" />
            <wire x2="864" y1="1568" y2="1568" x1="800" />
            <wire x2="1008" y1="1536" y2="1536" x1="864" />
            <wire x2="864" y1="1536" y2="1568" x1="864" />
        </branch>
        <branch name="vga_D(0)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1488" y="2064" type="branch" />
            <wire x2="1488" y1="1600" y2="1600" x1="1392" />
            <wire x2="1488" y1="1600" y2="2064" x1="1488" />
        </branch>
        <branch name="vga_D(1)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="2832" y="2064" type="branch" />
            <wire x2="2832" y1="1632" y2="1632" x1="2704" />
            <wire x2="2832" y1="1632" y2="2064" x1="2832" />
        </branch>
        <branch name="vga_D(2)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="4672" y="2112" type="branch" />
            <wire x2="4672" y1="1664" y2="1664" x1="4480" />
            <wire x2="4672" y1="1664" y2="2112" x1="4672" />
        </branch>
        <branch name="vram_D(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5376" y="1504" type="branch" />
            <wire x2="5584" y1="1504" y2="1504" x1="5376" />
        </branch>
        <branch name="vga_D(3)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="6096" y="2016" type="branch" />
            <wire x2="6096" y1="1568" y2="1568" x1="5968" />
            <wire x2="6096" y1="1568" y2="2016" x1="6096" />
        </branch>
        <branch name="vga_D(4)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="6096" y="3712" type="branch" />
            <wire x2="6096" y1="3296" y2="3296" x1="5904" />
            <wire x2="6096" y1="3296" y2="3712" x1="6096" />
        </branch>
        <branch name="vga_D(5)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="4528" y="3664" type="branch" />
            <wire x2="4528" y1="3312" y2="3312" x1="4400" />
            <wire x2="4528" y1="3312" y2="3664" x1="4528" />
        </branch>
        <branch name="vga_D(6)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="3120" y="3648" type="branch" />
            <wire x2="3120" y1="3328" y2="3328" x1="2928" />
            <wire x2="3120" y1="3328" y2="3648" x1="3120" />
        </branch>
        <branch name="vga_D(7)">
            <attrtext style="alignment:SOFT-VRIGHT" attrname="Name" x="1536" y="3648" type="branch" />
            <wire x2="1536" y1="3344" y2="3344" x1="1376" />
            <wire x2="1536" y1="3344" y2="3648" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="544" y="640" name="vga_CLK" orien="R270" />
        <iomarker fontsize="28" x="608" y="640" name="vram_CLK" orien="R270" />
        <iomarker fontsize="28" x="800" y="656" name="vram_W" orien="R270" />
        <iomarker fontsize="28" x="480" y="640" name="vram_A(13:0)" orien="R270" />
        <iomarker fontsize="28" x="352" y="640" name="vga_A(13:0)" orien="R270" />
        <iomarker fontsize="28" x="416" y="640" name="vram_D(7:0)" orien="R270" />
        <iomarker fontsize="28" x="1248" y="688" name="vga_D(7:0)" orien="R0" />
        <instance x="1008" y="1568" name="XLXI_30" orien="R0">
        </instance>
        <instance x="2320" y="1600" name="XLXI_31" orien="R0">
        </instance>
        <branch name="vram_D(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2112" y="1568" type="branch" />
            <wire x2="2320" y1="1568" y2="1568" x1="2112" />
        </branch>
        <instance x="4096" y="1632" name="XLXI_32" orien="R0">
        </instance>
        <branch name="vram_D(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="1600" type="branch" />
            <wire x2="4096" y1="1600" y2="1600" x1="3952" />
        </branch>
        <instance x="5584" y="1536" name="XLXI_33" orien="R0">
        </instance>
        <instance x="5520" y="3264" name="XLXI_34" orien="R0">
        </instance>
        <branch name="vram_D(4)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5440" y="3232" type="branch" />
            <wire x2="5520" y1="3232" y2="3232" x1="5440" />
        </branch>
        <instance x="4016" y="3280" name="XLXI_35" orien="R0">
        </instance>
        <branch name="vram_D(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3968" y="3248" type="branch" />
            <wire x2="4016" y1="3248" y2="3248" x1="3968" />
        </branch>
        <instance x="2544" y="3296" name="XLXI_36" orien="R0">
        </instance>
        <branch name="vram_D(6)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="3264" type="branch" />
            <wire x2="2544" y1="3264" y2="3264" x1="2448" />
        </branch>
        <instance x="992" y="3312" name="XLXI_37" orien="R0">
        </instance>
        <branch name="vram_D(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="912" y="3280" type="branch" />
            <wire x2="992" y1="3280" y2="3280" x1="912" />
        </branch>
    </sheet>
</drawing>