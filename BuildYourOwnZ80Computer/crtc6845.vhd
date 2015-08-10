--===========================================================================--
--                                                                           --
--  S Y N T H E S I Z A B L E    CRTC6845   C O R E                          --
--                                                                           --
--  www.opencores.org - January 2000                                         --
--  This IP core adheres to the GNU public license.                          --
--                                                                           --
--  VHDL model of MC6845 compatible CRTC                                     --
--                                                                           --
--  This model doesn't implement interlace mode. Everything else is          --
--  (probably) according to original MC6845 data sheet (except VTOTADJ).     --
--                                                                           --
--  Implementation in Xilinx Virtex XCV50-6 runs at 50 MHz (character clock).--
--  With external pixel	generator this CRTC could handle 450MHz pixel rate   --
--  (see MC6845 datasheet for typical application).	                     --
--                                                                           --
--  Author: Damjan Lampret, lampret@opencores.org                            --
--                                                                           --
--  TO DO:                                                                   --
--                                                                           --
--   - fix REG_INIT and remove non standard signals at topl level entity.    --
--     Allow fixed registers values (now set with REG_INIT). Anyway cleanup  --
--     required.                                                             --
--                                                                           --
--   - split design in four units (horizontal sync, vertical sync, bus       --
--     interface and the rest)                                               --
--                                                                           --
--   - synthesis with Synplify pending (there are some problems with         --
--     UNSIGNED and BIT_LOGIC_VECTOR types in some units !)                  --
--                                                                           --
--   - testbench                                                             --
--                                                                           --
--   - interlace mode support, extend VSYNC for V.Total Adjust value (R5)    --
--                                                                           --
--   - verification in a real application                                    --
--                                                                           --
--===========================================================================--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.config.all;

entity crtc6845 is
    port (
	MA     : out STD_LOGIC_VECTOR (MA_WIDTH-1 downto 0);
	RA     : out STD_LOGIC_VECTOR (RA_WIDTH-1 downto 0);
	HSYNC  : out STD_LOGIC;
	VSYNC  : out STD_LOGIC;
	DE     : out STD_LOGIC;
	CURSOR : out STD_LOGIC;
	LPSTBn : in STD_LOGIC;
	E      : in STD_LOGIC;
	RS     : in STD_LOGIC;
	CSn    : in STD_LOGIC;
	RW     : in STD_LOGIC;
	D      : inout STD_LOGIC_VECTOR (DB_WIDTH-1 downto 0);
	RESETn : in STD_LOGIC;
	CLK    : in STD_LOGIC;
	-- not standard
	REG_INIT: in STD_LOGIC
	--
--	Hend: inout STD_LOGIC;
--	HS: inout STD_LOGIC;
--	CHROW_CLK: inout STD_LOGIC;
--	Vend: inout STD_LOGIC;
--	SLadj: inout STD_LOGIC;
--	H: inout STD_LOGIC;
--	V: inout STD_LOGIC;
--	CURSOR_ACTIVE: inout STD_LOGIC;
--	VERT_RST: inout STD_LOGIC
    );
end crtc6845;

architecture crtc6845_behav of crtc6845 is

-- components
component cursor_ctrl
    port (
    	RESETn : in STD_LOGIC;
	CLK    : in STD_LOGIC;
	RA     : in STD_LOGIC_VECTOR (RA_WIDTH-1 downto 0);
	CURSOR : out STD_LOGIC;
	ACTIVE : in STD_LOGIC;
        CURST  : in STD_LOGIC_VECTOR (6 downto 0);
        CUREND : in STD_LOGIC_VECTOR (4 downto 0)
    );
end component;

-- 6845 registers R0-R17
signal REG_HT		: STD_LOGIC_VECTOR (7 downto 0);
signal REG_HD		: STD_LOGIC_VECTOR (7 downto 0);
signal REG_HSP		: STD_LOGIC_VECTOR (7 downto 0);
signal REG_HSW		: STD_LOGIC_VECTOR (3 downto 0);
signal REG_VT		: STD_LOGIC_VECTOR (6 downto 0);
signal REG_ADJ		: STD_LOGIC_VECTOR (4 downto 0);
signal REG_VD		: STD_LOGIC_VECTOR (6 downto 0);
signal REG_VSP		: STD_LOGIC_VECTOR (6 downto 0);
signal REG_IM		: STD_LOGIC_VECTOR (1 downto 0);
signal REG_SL		: STD_LOGIC_VECTOR (4 downto 0);
signal REG_CURST	: STD_LOGIC_VECTOR (6 downto 0);
signal REG_CUREND	: STD_LOGIC_VECTOR (4 downto 0);
signal REG_SA_H		: STD_LOGIC_VECTOR (5 downto 0);
signal REG_SA_L		: STD_LOGIC_VECTOR (7 downto 0);
signal REG_CUR_H	: STD_LOGIC_VECTOR (5 downto 0);
signal REG_CUR_L	: STD_LOGIC_VECTOR (7 downto 0);
signal REG_LP_H		: STD_LOGIC_VECTOR (5 downto 0);
signal REG_LP_L		: STD_LOGIC_VECTOR (7 downto 0);

-- Counters
signal CTR_HORIZ	: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0'); -- patch RESETn non utilisé
signal CTR_HSW		: STD_LOGIC_VECTOR (3 downto 0);
signal CTR_SL		: STD_LOGIC_VECTOR (4 downto 0);
signal CTR_VERT		: STD_LOGIC_VECTOR (6 downto 0);
signal CTR_VSW		: STD_LOGIC_VECTOR (4 downto 0);
signal CTR_LAG		: STD_LOGIC_VECTOR (13 downto 0);

-- I/O address register
signal REGIO_AR		: STD_LOGIC_VECTOR (AR_WIDTH-1 downto 0);

-- Interconnect signals (as in MC6845 datasheet)
signal	Hend: STD_LOGIC;
signal	HS: STD_LOGIC;
signal	CHROW_CLK: STD_LOGIC;
signal	Vend: STD_LOGIC;
signal	SLadj: STD_LOGIC;
signal	H: STD_LOGIC;
signal	V: STD_LOGIC;
signal	CURSOR_ACTIVE: STD_LOGIC;
signal	VERT_RST: STD_LOGIC;

-- Shared Variables
signal Hdisp: STD_LOGIC;
signal Vdisp: STD_LOGIC;
shared variable ROWaddr: STD_LOGIC_VECTOR (13 downto 0);

begin

ext_read:
process(E)
begin
	if rising_edge(E) then
		if CSn = '0' and RW = '1' and RS = '1' then
			case REGIO_AR is
				when INDEX_CUR_H =>
					D(5 downto 0) <= REG_CUR_H;
					D(7 downto 6) <= "00";
				when INDEX_CUR_L =>
					D <= REG_CUR_L;
				when INDEX_LP_H =>
					D(5 downto 0) <= REG_LP_H;
					D(7 downto 6) <= "00";
				when INDEX_LP_L =>
					D <= REG_LP_L;
				when others =>
					D <= (others => '0');
			end case;
		else
			D <= (others => 'Z');
		end if;
	end if;
end process;

ext_write:
process(E,REG_INIT)
begin
	--if falling_edge(E) then
	if rising_edge(E) then
	if REG_INIT = '1' then
		REGIO_AR <= b"0" & x"0";
		REG_HT <= x"65";
		REG_HD <= x"50";
		REG_HSP <= x"56";
		REG_HSW <= x"9";
		REG_SL <= '0' & x"b";
		REG_VT <= b"001" & x"8"; --18
		REG_ADJ <= b"0" & x"a";
		REG_VD <= b"001" & x"8"; --18
		REG_VSP <= b"001" & x"8";--18
		REG_CURST <= b"000" & x"0";
		REG_CUREND <= b"0" & x"B";
		REG_SA_H <= b"00" & x"0";
		REG_SA_L <= x"80";
		REG_CUR_H <= b"00" & x"0";
		REG_CUR_L <= x"80";
		
		
		
			-- init values are for test bench javacpc !
REG_HT<="00111111";
REG_HD<="00101000";
REG_HSP<="00101110";
REG_HSW<="1101";-- moins un "1110";
REG_SL<="00111";
--	signal RVwidth:std_logic_vector(4 downto 0):="00100";-- shift 5 "01000";
REG_VT<="0100110";
REG_ADJ<="00000";
REG_VD<="0011001";
REG_VSP<="0011110";
REG_SA_H<="110000";
REG_SA_L<="00000000";
		
		
		
		
		
	end if;
		if CSn = '0' and RW = '0' then
			if RS = '0' then
				REGIO_AR <= D (AR_WIDTH-1 downto 0);
			else
				case REGIO_AR is
					when INDEX_HT =>
						REG_HT <= D;
					when INDEX_HD =>
						REG_HD <= D;
					when INDEX_HSP =>
						REG_HSP <= D;
					when INDEX_HSW =>
						REG_HSW <= D(3 downto 0);
					when INDEX_SL =>
						REG_SL <= D(4 downto 0);
					when INDEX_VT =>
						REG_VT <= D(6 downto 0);
					when INDEX_ADJ =>
						REG_ADJ <= D(4 downto 0);
					when INDEX_VD =>
						REG_VD <= D(6 downto 0);
					when INDEX_VSP =>
						REG_VSP <= D(6 downto 0);
					when INDEX_CURST =>
						REG_CURST <= D(6 downto 0);
					when INDEX_CUREND =>
						REG_CUREND <= D(4 downto 0);
					when INDEX_SA_H =>
						REG_SA_H <= D(5 downto 0);
					when INDEX_SA_L =>
						REG_SA_L <= D;
					when INDEX_CUR_H =>
						REG_CUR_H <= D(5 downto 0);
					when INDEX_CUR_L =>
						REG_CUR_L <= D;
					when others =>
						null;
				end case;
			end if;
		end if;
	end if;
end process;

--------------------------------------------
-- Horizontal Sync                        --
--------------------------------------------

H_p:
process(CLK, RESETn)
begin
	if RESETn = '0' then
		CTR_HORIZ <= (others => '0');
	elsif rising_edge(CLK) then
		if CTR_HORIZ = REG_HT then
			H <= '1';
			CTR_HORIZ <= (others => '0');
		else
			H <= '0';
			CTR_HORIZ <= CTR_HORIZ + 1;
		end if;
	end if;
end process;

Hend_p:
process(CTR_HORIZ, REG_HD)
begin
	if CTR_HORIZ = REG_HD then
		Hend <= '1';
	else
		Hend <= '0';
	end if;
end process;

CTR_HSW_p:
process(CLK, RESETn)
begin
	if RESETn = '0' then
		CTR_HSW <= (others => '0');
	elsif rising_edge(CLK) then
		if HS = '1' then
			CTR_HSW <= CTR_HSW + 1;
		else
			CTR_HSW <= (others => '0');
		end if;
	end if;
end process;

HS_p:
process(CTR_HORIZ, CTR_HSW, REG_HSP, REG_HSW, HS)
begin
	if CTR_HORIZ = REG_HSP then
		HS <= '1';
	elsif CTR_HSW = REG_HSW then
		HS <= '0';
	else
		HS <= HS;
	end if;
	HSYNC <= HS;
end process;


--------------------------------------------
-- Display Enable                         --
--------------------------------------------

DE_p:
process(H, Hend, V, Vend, Hdisp, Vdisp)
begin
	if H = '1' and Hend = '0' then
		Hdisp <= '1';
	elsif H = '0' and Hend = '1' then
		Hdisp <= '0';
	else
		Hdisp <= Hdisp;
	end if;
	if V = '1' and Vend = '0' then
		Vdisp <= '1';
	elsif V = '0' and Vend = '1' then
		Vdisp <= '0';
	else
		Vdisp <= Vdisp;
	end if;
end process;
DE <= Hdisp and Vdisp;

--------------------------------------------
-- Scan Line Counter                      --
--------------------------------------------

CTR_SL_p:
process(H, RESETn)
begin
	if RESETn = '0' then
		CTR_SL <= (others => '0');
	elsif rising_edge(H) then
		if CTR_SL = REG_SL then
			CHROW_CLK <= '1';
			CTR_SL <= (others => '0');
		else
			CHROW_CLK <= '0';
			CTR_SL <= CTR_SL + 1;
		end if;
	end if;
end process;
RA <= CTR_SL;

SLadj_p:
process(CTR_SL, REG_ADJ)
begin
	if CTR_SL = REG_ADJ then
		SLadj <= '1';
	else
		SLadj <= '0';
	end if;
end process;

--------------------------------------------
-- Vertical Sync (Character Row CTR)      --
--------------------------------------------

V_p:
process(CHROW_CLK, RESETn)
begin
	if RESETn = '0' then
		CTR_VERT <= (others => '0');
	elsif rising_edge(CHROW_CLK) then
		if CTR_VERT = REG_VT then
			V <= '1';
--			if SLadj = '1' then
				VERT_RST <= '1';
				CTR_VERT <= (others => '0');
--			end if;
		else
			VERT_RST <= '0';
			V <= '0';
			CTR_VERT <= CTR_VERT + 1;
		end if;
	end if;
end process;

Vend_p:
process(CTR_VERT, REG_VD)
begin
	if CTR_VERT = REG_VD then
		Vend <= '1';
	else
		Vend <= '0';
	end if;
end process;

CTR_VSW_p:
process(H, RESETn, CTR_VERT, REG_VSP, CTR_VSW)
begin
	if RESETn = '0' then
		CTR_VSW <= (others => '0');
	elsif rising_edge(H) then
		if CTR_VERT = REG_VSP then
			CTR_VSW <= (others => '0');
		end if;
		if CTR_VSW /= 16 then
			CTR_VSW <= CTR_VSW + 1;
			VSYNC <= '1';
		else
			VSYNC <= '0';
		end if;
	end if;
end process;

--------------------------------------------
-- Linear Address Generator               --
--------------------------------------------

ROWaddr_p:
process(RESETn, CHROW_CLK, VERT_RST, REG_SA_H, REG_SA_L)
begin
	if RESETn = '0' then
		ROWaddr := REG_SA_H & REG_SA_L;
	elsif rising_edge(CHROW_CLK) then
		ROWaddr := ROWaddr + REG_HD;
		if VERT_RST = '1' then
			ROWaddr := REG_SA_H & REG_SA_L;
		end if;
	end if;
end process;

LAG_p:
process(CLK, RESETn, H, REG_SA_H, REG_SA_L)
begin
	if RESETn = '0' then
		CTR_LAG <= REG_SA_H & REG_SA_L;
	elsif rising_edge(CLK) then
		CTR_LAG <= CTR_LAG + 1; -- sucker
		if H = '1' then
			CTR_LAG <= ROWaddr;
		end if;
	end if;
end process;

MA <= CTR_LAG;

--------------------------------------------
-- Light Pen Capture                      --
--------------------------------------------
LP_p:
process(CLK, LPSTBn)
begin
	if rising_edge(CLK) then
		if LPSTBn = '0' then
			REG_LP_H <= CTR_LAG(13 downto 8);
			REG_LP_L <= CTR_LAG(7 downto 0);
		end if;
	end if;
end process;

--------------------------------------------
-- Cursor Control Unit Instantiation      --
--------------------------------------------
CURSOR_p:
process(CTR_LAG, REG_CUR_H, REG_CUR_L)
begin
	if CTR_LAG = REG_CUR_H & REG_CUR_L then
		CURSOR_ACTIVE <= '1';
	else
		CURSOR_ACTIVE <= '0';
	end if;
end process;

cursor_ctrl_inst: cursor_ctrl
    port map (
    	RESETn => RESETn,
    	CLK => V,
	RA => CTR_SL,
	CURSOR => CURSOR,
	ACTIVE => CURSOR_ACTIVE,
        CURST => REG_CURST,
        CUREND => REG_CUREND
    );

end crtc6845_behav;

