<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D(7:0)" />
        <signal name="A(13:0)" />
        <signal name="XLXN_98" />
        <signal name="XLXN_99" />
        <signal name="XLXN_107" />
        <signal name="XLXN_108" />
        <signal name="XLXN_109" />
        <signal name="XLXN_110" />
        <signal name="XLXN_111" />
        <signal name="XLXN_112" />
        <signal name="XLXN_113" />
        <signal name="XLXN_114" />
        <signal name="XLXN_115" />
        <signal name="XLXN_116" />
        <signal name="XLXN_117" />
        <signal name="XLXN_118" />
        <signal name="XLXN_119" />
        <signal name="XLXN_120" />
        <signal name="CLK" />
        <signal name="WE" />
        <signal name="D(0:0)" />
        <signal name="D(1:1)" />
        <signal name="D(2:2)" />
        <signal name="D(3:3)" />
        <signal name="D(4:4)" />
        <signal name="D(5:5)" />
        <signal name="D(6:6)" />
        <signal name="D(7:7)" />
        <signal name="DO(7:0)" />
        <signal name="DO(0:0)" />
        <signal name="DO(1:1)" />
        <signal name="DO(2:2)" />
        <signal name="DO(3:3)" />
        <signal name="DO(4:4)" />
        <signal name="DO(5:5)" />
        <signal name="DO(6:6)" />
        <signal name="DO(7:7)" />
        <port polarity="Input" name="D(7:0)" />
        <port polarity="Input" name="A(13:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="WE" />
        <port polarity="Output" name="DO(7:0)" />
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="ramb16_s1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="352" x="64" y="-512" height="448" />
            <rect width="64" x="0" y="-144" height="32" />
            <rect width="64" x="416" y="-304" height="32" />
            <line x2="64" y1="-256" y2="-272" x1="80" />
            <line x2="80" y1="-240" y2="-256" x1="64" />
            <rect width="64" x="0" y="-208" height="32" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="416" y1="-288" y2="-288" x1="480" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
        </blockdef>
        <blockdef name="ramb16_s1_s1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-1088" y2="-1088" x1="544" />
            <line x2="544" y1="-640" y2="-1088" x1="544" />
            <rect width="64" x="544" y="-368" height="32" />
            <rect width="64" x="544" y="-880" height="32" />
            <line x2="64" y1="-1088" y2="-640" x1="64" />
            <line x2="64" y1="-832" y2="-848" x1="80" />
            <line x2="80" y1="-816" y2="-832" x1="64" />
            <rect width="64" x="0" y="-720" height="32" />
            <rect width="64" x="0" y="-784" height="32" />
            <rect width="64" x="0" y="-208" height="32" />
            <rect width="64" x="0" y="-272" height="32" />
            <line x2="64" y1="-320" y2="-336" x1="80" />
            <line x2="80" y1="-304" y2="-320" x1="64" />
            <line x2="64" y1="-640" y2="-640" x1="128" />
            <line x2="128" y1="-576" y2="-640" x1="128" />
            <line x2="128" y1="-576" y2="-576" x1="64" />
            <line x2="64" y1="-128" y2="-576" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="544" />
            <line x2="544" y1="-576" y2="-128" x1="544" />
            <line x2="544" y1="-576" y2="-576" x1="480" />
            <line x2="480" y1="-640" y2="-576" x1="480" />
            <line x2="480" y1="-640" y2="-640" x1="544" />
            <line x2="544" y1="-352" y2="-352" x1="608" />
            <line x2="544" y1="-864" y2="-864" x1="608" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-768" y2="-768" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-832" y2="-832" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_131">
            <blockpin signalname="XLXN_98" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_130">
            <blockpin signalname="XLXN_99" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_127">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(0:0)" name="DI(0:0)" />
            <blockpin signalname="XLXN_99" name="EN" />
            <blockpin signalname="XLXN_98" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(0:0)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_140">
            <blockpin signalname="XLXN_107" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_141">
            <blockpin signalname="XLXN_108" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_142">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(1:1)" name="DI(0:0)" />
            <blockpin signalname="XLXN_108" name="EN" />
            <blockpin signalname="XLXN_107" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(1:1)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_143">
            <blockpin signalname="XLXN_109" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_144">
            <blockpin signalname="XLXN_110" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_145">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(2:2)" name="DI(0:0)" />
            <blockpin signalname="XLXN_110" name="EN" />
            <blockpin signalname="XLXN_109" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(2:2)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_146">
            <blockpin signalname="XLXN_111" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_147">
            <blockpin signalname="XLXN_112" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_148">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(3:3)" name="DI(0:0)" />
            <blockpin signalname="XLXN_112" name="EN" />
            <blockpin signalname="XLXN_111" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(3:3)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_149">
            <blockpin signalname="XLXN_113" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_150">
            <blockpin signalname="XLXN_114" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_151">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(4:4)" name="DI(0:0)" />
            <blockpin signalname="XLXN_114" name="EN" />
            <blockpin signalname="XLXN_113" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(4:4)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_152">
            <blockpin signalname="XLXN_115" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_153">
            <blockpin signalname="XLXN_116" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_154">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(5:5)" name="DI(0:0)" />
            <blockpin signalname="XLXN_116" name="EN" />
            <blockpin signalname="XLXN_115" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(5:5)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_155">
            <blockpin signalname="XLXN_117" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_156">
            <blockpin signalname="XLXN_118" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_157">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(6:6)" name="DI(0:0)" />
            <blockpin signalname="XLXN_118" name="EN" />
            <blockpin signalname="XLXN_117" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(6:6)" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_158">
            <blockpin signalname="XLXN_119" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_159">
            <blockpin signalname="XLXN_120" name="P" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_160">
            <blockpin signalname="A(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="D(7:7)" name="DI(0:0)" />
            <blockpin signalname="XLXN_120" name="EN" />
            <blockpin signalname="XLXN_119" name="SSR" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="DO(7:7)" name="DO(0:0)" />
        </block>
        <block symbolname="ramb16_s1_s1" name="XLXI_163">
            <blockpin name="ADDRA(13:0)" />
            <blockpin name="ADDRB(13:0)" />
            <blockpin name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin name="DIA(0:0)" />
            <blockpin name="DIB(0:0)" />
            <blockpin name="ENA" />
            <blockpin name="ENB" />
            <blockpin name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin name="WEA" />
            <blockpin name="WEB" />
            <blockpin name="DOA(0:0)" />
            <blockpin name="DOB(0:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="D(7:0)">
            <wire x2="320" y1="304" y2="304" x1="240" />
            <wire x2="320" y1="304" y2="768" x1="320" />
            <wire x2="320" y1="768" y2="1376" x1="320" />
            <wire x2="320" y1="1376" y2="1984" x1="320" />
            <wire x2="320" y1="1984" y2="2608" x1="320" />
            <wire x2="320" y1="2608" y2="3120" x1="320" />
            <wire x2="320" y1="3120" y2="3216" x1="320" />
            <wire x2="320" y1="3216" y2="3840" x1="320" />
            <wire x2="320" y1="3840" y2="4432" x1="320" />
            <wire x2="320" y1="4432" y2="5056" x1="320" />
        </branch>
        <iomarker fontsize="28" x="240" y="304" name="D(7:0)" orien="R180" />
        <branch name="A(13:0)">
            <wire x2="944" y1="208" y2="208" x1="240" />
            <wire x2="944" y1="208" y2="704" x1="944" />
            <wire x2="944" y1="704" y2="1312" x1="944" />
            <wire x2="944" y1="1312" y2="1920" x1="944" />
            <wire x2="944" y1="1920" y2="2544" x1="944" />
            <wire x2="944" y1="2544" y2="3104" x1="944" />
            <wire x2="944" y1="3104" y2="3152" x1="944" />
            <wire x2="944" y1="3152" y2="3776" x1="944" />
            <wire x2="944" y1="3776" y2="4368" x1="944" />
            <wire x2="944" y1="4368" y2="4992" x1="944" />
            <wire x2="1136" y1="4992" y2="4992" x1="944" />
            <wire x2="1136" y1="4368" y2="4368" x1="944" />
            <wire x2="1136" y1="3776" y2="3776" x1="944" />
            <wire x2="1136" y1="3152" y2="3152" x1="944" />
            <wire x2="1136" y1="2544" y2="2544" x1="944" />
            <wire x2="1136" y1="1920" y2="1920" x1="944" />
            <wire x2="1136" y1="1312" y2="1312" x1="944" />
            <wire x2="1136" y1="704" y2="704" x1="944" />
        </branch>
        <iomarker fontsize="28" x="240" y="208" name="A(13:0)" orien="R180" />
        <branch name="XLXN_98">
            <wire x2="1136" y1="576" y2="576" x1="720" />
        </branch>
        <branch name="XLXN_99">
            <wire x2="1136" y1="512" y2="512" x1="720" />
        </branch>
        <instance x="656" y="704" name="XLXI_131" orien="R0" />
        <instance x="656" y="512" name="XLXI_130" orien="R0" />
        <instance x="1136" y="896" name="XLXI_127" orien="R0" />
        <branch name="XLXN_107">
            <wire x2="1136" y1="1184" y2="1184" x1="720" />
        </branch>
        <branch name="XLXN_108">
            <wire x2="1136" y1="1120" y2="1120" x1="720" />
        </branch>
        <instance x="656" y="1312" name="XLXI_140" orien="R0" />
        <instance x="656" y="1120" name="XLXI_141" orien="R0" />
        <instance x="1136" y="1504" name="XLXI_142" orien="R0" />
        <branch name="XLXN_109">
            <wire x2="1136" y1="1792" y2="1792" x1="720" />
        </branch>
        <branch name="XLXN_110">
            <wire x2="1136" y1="1728" y2="1728" x1="720" />
        </branch>
        <instance x="656" y="1920" name="XLXI_143" orien="R0" />
        <instance x="656" y="1728" name="XLXI_144" orien="R0" />
        <instance x="1136" y="2112" name="XLXI_145" orien="R0" />
        <branch name="XLXN_111">
            <wire x2="1136" y1="2416" y2="2416" x1="720" />
        </branch>
        <branch name="XLXN_112">
            <wire x2="1136" y1="2352" y2="2352" x1="720" />
        </branch>
        <instance x="656" y="2544" name="XLXI_146" orien="R0" />
        <instance x="656" y="2352" name="XLXI_147" orien="R0" />
        <instance x="1136" y="2736" name="XLXI_148" orien="R0" />
        <branch name="XLXN_113">
            <wire x2="1136" y1="3024" y2="3024" x1="720" />
        </branch>
        <branch name="XLXN_114">
            <wire x2="1136" y1="2960" y2="2960" x1="720" />
        </branch>
        <instance x="656" y="3152" name="XLXI_149" orien="R0" />
        <instance x="656" y="2960" name="XLXI_150" orien="R0" />
        <instance x="1136" y="3344" name="XLXI_151" orien="R0" />
        <branch name="XLXN_115">
            <wire x2="1136" y1="3648" y2="3648" x1="720" />
        </branch>
        <branch name="XLXN_116">
            <wire x2="1136" y1="3584" y2="3584" x1="720" />
        </branch>
        <instance x="656" y="3776" name="XLXI_152" orien="R0" />
        <instance x="656" y="3584" name="XLXI_153" orien="R0" />
        <instance x="1136" y="3968" name="XLXI_154" orien="R0" />
        <branch name="XLXN_117">
            <wire x2="1136" y1="4240" y2="4240" x1="720" />
        </branch>
        <branch name="XLXN_118">
            <wire x2="1136" y1="4176" y2="4176" x1="720" />
        </branch>
        <instance x="656" y="4368" name="XLXI_155" orien="R0" />
        <instance x="656" y="4176" name="XLXI_156" orien="R0" />
        <instance x="1136" y="4560" name="XLXI_157" orien="R0" />
        <branch name="XLXN_119">
            <wire x2="1136" y1="4864" y2="4864" x1="720" />
        </branch>
        <branch name="XLXN_120">
            <wire x2="1136" y1="4800" y2="4800" x1="720" />
        </branch>
        <instance x="656" y="4992" name="XLXI_158" orien="R0" />
        <instance x="656" y="4800" name="XLXI_159" orien="R0" />
        <instance x="1136" y="5184" name="XLXI_160" orien="R0" />
        <branch name="CLK">
            <wire x2="864" y1="128" y2="128" x1="240" />
            <wire x2="864" y1="128" y2="640" x1="864" />
            <wire x2="864" y1="640" y2="1248" x1="864" />
            <wire x2="864" y1="1248" y2="1856" x1="864" />
            <wire x2="864" y1="1856" y2="2480" x1="864" />
            <wire x2="864" y1="2480" y2="3088" x1="864" />
            <wire x2="864" y1="3088" y2="3712" x1="864" />
            <wire x2="864" y1="3712" y2="4304" x1="864" />
            <wire x2="864" y1="4304" y2="4928" x1="864" />
            <wire x2="1136" y1="4928" y2="4928" x1="864" />
            <wire x2="1136" y1="4304" y2="4304" x1="864" />
            <wire x2="1136" y1="3712" y2="3712" x1="864" />
            <wire x2="1136" y1="3088" y2="3088" x1="864" />
            <wire x2="1136" y1="2480" y2="2480" x1="864" />
            <wire x2="1136" y1="1856" y2="1856" x1="864" />
            <wire x2="1136" y1="1248" y2="1248" x1="864" />
            <wire x2="1136" y1="640" y2="640" x1="864" />
        </branch>
        <branch name="WE">
            <wire x2="1024" y1="48" y2="48" x1="240" />
            <wire x2="1024" y1="48" y2="448" x1="1024" />
            <wire x2="1024" y1="448" y2="1056" x1="1024" />
            <wire x2="1024" y1="1056" y2="1664" x1="1024" />
            <wire x2="1024" y1="1664" y2="2288" x1="1024" />
            <wire x2="1024" y1="2288" y2="2896" x1="1024" />
            <wire x2="1024" y1="2896" y2="3520" x1="1024" />
            <wire x2="1024" y1="3520" y2="4112" x1="1024" />
            <wire x2="1024" y1="4112" y2="4736" x1="1024" />
            <wire x2="1136" y1="4736" y2="4736" x1="1024" />
            <wire x2="1136" y1="4112" y2="4112" x1="1024" />
            <wire x2="1136" y1="3520" y2="3520" x1="1024" />
            <wire x2="1136" y1="2896" y2="2896" x1="1024" />
            <wire x2="1136" y1="2288" y2="2288" x1="1024" />
            <wire x2="1136" y1="1664" y2="1664" x1="1024" />
            <wire x2="1136" y1="1056" y2="1056" x1="1024" />
            <wire x2="1136" y1="448" y2="448" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="240" y="48" name="WE" orien="R180" />
        <iomarker fontsize="28" x="240" y="128" name="CLK" orien="R180" />
        <branch name="D(0:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="671" y="768" type="branch" />
            <wire x2="671" y1="768" y2="768" x1="416" />
            <wire x2="1136" y1="768" y2="768" x1="671" />
        </branch>
        <branch name="D(1:1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="643" y="1376" type="branch" />
            <wire x2="643" y1="1376" y2="1376" x1="416" />
            <wire x2="1136" y1="1376" y2="1376" x1="643" />
        </branch>
        <branch name="D(2:2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="579" y="1984" type="branch" />
            <wire x2="579" y1="1984" y2="1984" x1="416" />
            <wire x2="1136" y1="1984" y2="1984" x1="579" />
        </branch>
        <branch name="D(3:3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="574" y="2608" type="branch" />
            <wire x2="574" y1="2608" y2="2608" x1="416" />
            <wire x2="1136" y1="2608" y2="2608" x1="574" />
        </branch>
        <branch name="D(4:4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="520" y="3216" type="branch" />
            <wire x2="520" y1="3216" y2="3216" x1="416" />
            <wire x2="1136" y1="3216" y2="3216" x1="520" />
        </branch>
        <branch name="D(5:5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="525" y="3840" type="branch" />
            <wire x2="525" y1="3840" y2="3840" x1="416" />
            <wire x2="1136" y1="3840" y2="3840" x1="525" />
        </branch>
        <branch name="D(6:6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="503" y="4432" type="branch" />
            <wire x2="503" y1="4432" y2="4432" x1="416" />
            <wire x2="1136" y1="4432" y2="4432" x1="503" />
        </branch>
        <branch name="D(7:7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="515" y="5056" type="branch" />
            <wire x2="515" y1="5056" y2="5056" x1="416" />
            <wire x2="1136" y1="5056" y2="5056" x1="515" />
        </branch>
        <bustap x2="416" y1="768" y2="768" x1="320" />
        <bustap x2="416" y1="1376" y2="1376" x1="320" />
        <bustap x2="416" y1="1984" y2="1984" x1="320" />
        <bustap x2="416" y1="2608" y2="2608" x1="320" />
        <bustap x2="416" y1="3216" y2="3216" x1="320" />
        <bustap x2="416" y1="3840" y2="3840" x1="320" />
        <bustap x2="416" y1="4432" y2="4432" x1="320" />
        <bustap x2="416" y1="5056" y2="5056" x1="320" />
        <branch name="DO(7:0)">
            <wire x2="1936" y1="608" y2="1216" x1="1936" />
            <wire x2="1936" y1="1216" y2="1824" x1="1936" />
            <wire x2="1936" y1="1824" y2="2448" x1="1936" />
            <wire x2="1936" y1="2448" y2="3056" x1="1936" />
            <wire x2="1936" y1="3056" y2="3680" x1="1936" />
            <wire x2="1936" y1="3680" y2="4272" x1="1936" />
            <wire x2="1936" y1="4272" y2="4896" x1="1936" />
            <wire x2="1936" y1="4896" y2="5232" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1936" y="5232" name="DO(7:0)" orien="R90" />
        <bustap x2="1840" y1="4896" y2="4896" x1="1936" />
        <bustap x2="1840" y1="4272" y2="4272" x1="1936" />
        <bustap x2="1840" y1="3680" y2="3680" x1="1936" />
        <bustap x2="1840" y1="3056" y2="3056" x1="1936" />
        <bustap x2="1840" y1="2448" y2="2448" x1="1936" />
        <bustap x2="1840" y1="1824" y2="1824" x1="1936" />
        <bustap x2="1840" y1="1216" y2="1216" x1="1936" />
        <bustap x2="1840" y1="608" y2="608" x1="1936" />
        <branch name="DO(0:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1705" y="608" type="branch" />
            <wire x2="1705" y1="608" y2="608" x1="1616" />
            <wire x2="1840" y1="608" y2="608" x1="1705" />
        </branch>
        <branch name="DO(1:1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1715" y="1216" type="branch" />
            <wire x2="1715" y1="1216" y2="1216" x1="1616" />
            <wire x2="1840" y1="1216" y2="1216" x1="1715" />
        </branch>
        <branch name="DO(2:2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1748" y="1824" type="branch" />
            <wire x2="1716" y1="1824" y2="1824" x1="1616" />
            <wire x2="1748" y1="1824" y2="1824" x1="1716" />
            <wire x2="1840" y1="1824" y2="1824" x1="1748" />
        </branch>
        <branch name="DO(3:3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1724" y="2448" type="branch" />
            <wire x2="1724" y1="2448" y2="2448" x1="1616" />
            <wire x2="1840" y1="2448" y2="2448" x1="1724" />
        </branch>
        <branch name="DO(4:4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1727" y="3056" type="branch" />
            <wire x2="1727" y1="3056" y2="3056" x1="1616" />
            <wire x2="1840" y1="3056" y2="3056" x1="1727" />
        </branch>
        <branch name="DO(5:5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1728" y="3680" type="branch" />
            <wire x2="1728" y1="3680" y2="3680" x1="1616" />
            <wire x2="1840" y1="3680" y2="3680" x1="1728" />
        </branch>
        <branch name="DO(6:6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1731" y="4272" type="branch" />
            <wire x2="1731" y1="4272" y2="4272" x1="1616" />
            <wire x2="1840" y1="4272" y2="4272" x1="1731" />
        </branch>
        <branch name="DO(7:7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1722" y="4896" type="branch" />
            <wire x2="1722" y1="4896" y2="4896" x1="1616" />
            <wire x2="1840" y1="4896" y2="4896" x1="1722" />
        </branch>
        <instance x="2896" y="1552" name="XLXI_163" orien="R0" />
    </sheet>
</drawing>