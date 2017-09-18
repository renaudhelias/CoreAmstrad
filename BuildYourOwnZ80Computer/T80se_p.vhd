--    {@{@{@{@{@{@
--  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r004
--  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
--  {@{@{@{@{@{@{@{@
--  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
--  {@{@        {@{@   Contact : renaudhelias@gmail.com
--  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
--    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
--
--
--------------------------------------------------------------------------------
-- FPGAmstrad_amstrad_motherboard.T80se_p
-- FIXME : WAIT_n for more than one wait period
-- see please_wait.vhd
--------------------------------------------------------------------------------
-- T80se with somes "Memory Speed Control" integrated parameters
--
-- If all constants are setted to 0/false, you obtain original T80se behaviour,
-- in order to compare old realise and new merged realise that inserted a bug in IO_RD.
--
-- If you set constant MEMORY_WAIT_IO_RD=1 and CONTINUE_IO_OP=true, IO_RD does run OK in
-- new merged realise
--
-- If you set constant TRY_MREQ_ALONE=true, adding a MREQ at T1 before MEM_WR at T2, it does
-- crash : my "if clause" is certainly bad by here.
-- Without TRY_MREQ_ALONE=true and MEMORY_WAIT_MEM_WR=1 and CONTINUE_MEM_OP=1 no way for me
-- to add TW in MEM_WR... (that is what I need for my next Amstrad evolves)
-- 
-- If you set CONTINUE_1_FETCH_INSTRUCTION=true, I gain more stability in Amstrad, without any WAIT_n added.
-- 
-- Regards,
-- Renaud (FPGAmstrad in NEXYS4/Amstrad core on MiST-board)


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.T80_Pack.all;

entity T80se_p is
	generic(
		Mode : integer := 0;    -- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
		T2Write : integer := 0;  -- 0 => WR_n active in T3, /=0 => WR_n active in T2
		IOWait : integer := 1   -- 0 => Single cycle I/O, 1 => Std I/O cycle
	);
	port(
		RESET_n         : in  std_logic;
		CLK_n           : in  std_logic;
		CLKEN           : in  std_logic;
		WAIT_n          : in  std_logic;
		INT_n           : in  std_logic;
		NMI_n           : in  std_logic;
		BUSRQ_n         : in  std_logic;
		M1_n            : out std_logic;
		MREQ_n          : out std_logic;
		IORQ_n          : out std_logic;
		RD_n            : out std_logic;
		WR_n            : out std_logic;
		RFSH_n          : out std_logic;
		HALT_n          : out std_logic;
		BUSAK_n         : out std_logic;
		A               : out std_logic_vector(15 downto 0);
		DI              : in  std_logic_vector(7 downto 0);
		DO              : out std_logic_vector(7 downto 0)
	);
end T80se_p;

architecture rtl of T80se_p is
	signal IntCycle_n   : std_logic;
	signal NoRead       : std_logic;
	signal Write        : std_logic;
	signal IORQ         : std_logic;
	signal DI_Reg       : std_logic_vector(7 downto 0);
	signal MCycle       : std_logic_vector(2 downto 0);
	signal TState       : std_logic_vector(2 downto 0);

	signal buffer_MREQ_n : std_logic;
	signal buffer_MREQ_alone_n : std_logic;
	signal buffer_IORQ_n : std_logic;
	signal buffer_RD_n : std_logic;
	signal buffer_WR_n : std_logic;
	
	signal Wait1_n : std_logic;
	signal Wait2_n : std_logic;
	
begin

	MREQ_n<=buffer_MREQ_n and buffer_MREQ_alone_n;
	IORQ_n<=buffer_IORQ_n;
	RD_n<=buffer_RD_n;
	WR_n<=buffer_WR_n;

   Wait2_n<=Wait1_n and Wait_n;

	u0 : T80
		generic map(
			Mode => Mode,
			IOWait => IOWait)
		port map(
			CEN        => CLKEN,
			M1_n       => M1_n,
			IORQ       => IORQ,
			NoRead     => NoRead,
			Write      => Write,
			RFSH_n     => RFSH_n,
			HALT_n     => HALT_n,
			WAIT_n     => Wait2_n,
			INT_n      => INT_n,
			NMI_n      => NMI_n,
			RESET_n    => RESET_n,
			BUSRQ_n    => BUSRQ_n,
			BUSAK_n    => BUSAK_n,
			CLK_n      => CLK_n,
			A          => A,
			DInst      => DI,
			DI         => DI_Reg,
			DO         => DO,
			MC         => MCycle,
			TS         => TState,
			IntCycle_n => IntCycle_n);

	process (RESET_n, CLK_n)
	


	variable oldTState:std_logic_vector(2 downto 0);
	
	begin
		if RESET_n = '0' then
			buffer_RD_n <= '1';
			buffer_WR_n <= '1';
			buffer_IORQ_n <= '1';
			buffer_MREQ_n <= '1';
			buffer_MREQ_alone_n <= '1';
			WAIT1_n <= '1';
			DI_Reg <= "00000000";
		elsif CLK_n'event and CLK_n = '1' then
			if CLKEN = '1' then
				buffer_RD_n <= '1';
				buffer_WR_n <= '1';
				buffer_IORQ_n <= '1';
				buffer_MREQ_n <= '1';
				buffer_MREQ_alone_n <= '1';
				if MCycle = "001" then
					if TState = "001" then
						if IntCycle_n='1' then
							--FETCH_INSTRUCTION
							buffer_RD_n <= '0';
							buffer_MREQ_n <= '0';
						elsif TState = "001" then
							--IO_ACK -- just 1 period here
							buffer_IORQ_n <= '0';
						end if;
					end if;
					if TState = "011" then
						buffer_MREQ_n <= '0';
					end if;
				else
					if TState = "001" and NoRead = '0' and Write = '0' then
						if IORQ='0' then
							--MEM_RD
							buffer_RD_n <= '0';
							buffer_MREQ_n <= '0';
						else
							--IO_RD
							buffer_RD_n <= '0'; -- trop tard pour l'exterieur
							buffer_IORQ_n <= '0';
						end if;
					end if;
					
					if oldTState="001" and TState = "010" and Write = '1' then
						if IORQ='0' then
							--MEM_WR
							buffer_WR_n <= '0';
							buffer_MREQ_n <= '0';
						else
							--IO_WR
							buffer_WR_n <= '0';
							buffer_IORQ_n <= '0';
						end if;
					end if;
				end if;
				
				WAIT1_n<='1';
			
				oldTState:=TState;
				
				if TState = "010" and Wait2_n = '1' then
					DI_Reg <= DI;
				end if;		
		
	
			end if;
			
		end if;
	end process;
	
end;
