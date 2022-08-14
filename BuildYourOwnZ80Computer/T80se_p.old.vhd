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
	
	signal do1Continue : boolean:=false;
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
	
-- original T80se behaviour : same behaviour as Amstrad r003.3 with simple T80 update : no more dsk (IO_RD), but started ok (IO_WR MEM_RD/MEM_WR are OK)
--	constant MEMORY_WAIT_FETCH_INSTRUCTION:integer:=0;
--	constant MEMORY_WAIT_MEM_RD:integer:=0;
--	constant MEMORY_WAIT_MEM_WR:integer:=0;
--	constant MEMORY_WAIT_IO_RD:integer:=0;
--	constant MEMORY_WAIT_IO_WR:integer:=0;
--	
--	constant CONTINUE_1_FETCH_INSTRUCTION:boolean:=false;
--	constant CONTINUE_FETCH_INSTRUCTION:boolean:=false;
--	constant CONTINUE_1_MEM_OP:boolean:=false;
--	constant CONTINUE_MEM_OP:boolean:=false;
--	constant CONTINUE_1_IO_OP:boolean:=false;
--	constant CONTINUE_IO_OP:boolean:=false;
-- 
-- constant TRY_MREQ_ALONE:boolean:=false;
	
-- ok (tested with please_wait on MEM_WR and M1) -- I think that IO_RD is now in Z80 norm : starting same time as IO_WR <3
-- constant MEMORY_WAIT_FETCH_INSTRUCTION:integer:=0;
--	constant MEMORY_WAIT_MEM_RD:integer:=0;
--	constant MEMORY_WAIT_MEM_WR:integer:=0;
--	constant MEMORY_WAIT_IO_RD:integer:=1;
--	constant MEMORY_WAIT_IO_WR:integer:=0;
--	
--	constant CONTINUE_1_FETCH_INSTRUCTION:boolean:=false;
--	constant CONTINUE_FETCH_INSTRUCTION:boolean:=false;
--	constant CONTINUE_1_MEM_OP:boolean:=false;
--	constant CONTINUE_MEM_OP:boolean:=false;
--	constant CONTINUE_1_IO_OP:boolean:=false;
--	constant CONTINUE_IO_OP:boolean:=true;
-- 
-- constant TRY_MREQ_ALONE:boolean:=false;
	
	constant MEMORY_WAIT_FETCH_INSTRUCTION:integer:=0;
	constant MEMORY_WAIT_MEM_RD:integer:=0;
	constant MEMORY_WAIT_MEM_WR:integer:=0; -- never reached as TRY_MREQ_ALONE=false
	constant MEMORY_WAIT_IO_RD:integer:=0;
	constant MEMORY_WAIT_IO_WR:integer:=0;
	
	constant CONTINUE_1_FETCH_INSTRUCTION:boolean:=true;
	constant CONTINUE_FETCH_INSTRUCTION:boolean:=true;
	constant CONTINUE_1_MEM_OP:boolean:=true;
	constant CONTINUE_MEM_OP:boolean:=true;
	constant CONTINUE_1_IO_OP:boolean:=true; -- as I already AutoWait on IO_WR/IO_RD, this setting seems useless
	constant CONTINUE_IO_OP:boolean:=true;
	
	constant TRY_MREQ_ALONE:boolean:=false; -- to check (if clause seems bad here)

	variable waitFetchInstruction:integer range 0 to MEMORY_WAIT_FETCH_INSTRUCTION:=MEMORY_WAIT_FETCH_INSTRUCTION;
	variable waitMemRd:integer range 0 to MEMORY_WAIT_MEM_RD:=MEMORY_WAIT_MEM_RD;
	variable waitMemWr:integer range 0 to MEMORY_WAIT_MEM_WR:=MEMORY_WAIT_MEM_WR;
	variable waitIoRd:integer range 0 to MEMORY_WAIT_IO_RD:=MEMORY_WAIT_IO_RD;
	variable waitIoWr:integer range 0 to MEMORY_WAIT_IO_WR:=MEMORY_WAIT_IO_WR;
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
							waitFetchInstruction:=0; -- add some waits for fetch instructions
						elsif TState = "001" then
							--IO_ACK -- just 1 period here
							buffer_IORQ_n <= '0';
						end if;
					end if;
					if ((CONTINUE_FETCH_INSTRUCTION and WAIT_n='0') or (CONTINUE_1_FETCH_INSTRUCTION and oldTState="001")) and TState = "010" then
						if buffer_MREQ_n='0' then
							-- CONTINUE 1 FETCH_INSTRUCTION
							buffer_RD_n <= '0';
							buffer_MREQ_n <= '0';
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
							waitMemRd:=0;
							do1Continue<=true;
						else
							--IO_RD
							buffer_RD_n <= '0'; -- trop tard pour l'exterieur
							buffer_IORQ_n <= '0';
							waitIoRd:=0; -- add some waits for IO_RD
							do1Continue<=true; -- as I already AutoWait on IO_RD, this instruction seems useless
						end if;
					elsif TRY_MREQ_ALONE and TState = "001" and Write = '1' then
					   -- sort of MREQ_n coming at T1 without RD_n and WR_n
						if IORQ='0' then -- no Auto_Wait for MEM_WR, so here I need that
							buffer_MREQ_alone_n<='0';
							waitMemWr:=0;
						end if;
					end if;
					
					if oldTState="001" and TState = "010" and Write = '1' then
						if IORQ='0' then
							--MEM_WR
							buffer_WR_n <= '0';
							buffer_MREQ_n <= '0';
							--do1Continue<=true; [special : MEM_WR is 1 edge only in doc]
						else
							--IO_WR
							buffer_WR_n <= '0';
							buffer_IORQ_n <= '0';
							waitIoWr:=0; -- add some waits for MEM_WR thinking about Auto_Wait (I'm already in >ait(auto) so I can insert Wait here)
							do1Continue<=true; -- as I already AutoWait on IO_WR, this instruction seems useless
						end if;
					end if;
					
					-- IO_RD is eating each others (Auto_Wait problem ?)
					if (buffer_MREQ_n='0' and ((CONTINUE_MEM_OP and Wait2_n='0') or (CONTINUE_1_MEM_OP and do1Continue)) and TState = "010")
						or (buffer_IORQ_n='0' and ((CONTINUE_IO_OP and Wait2_n='0') or (CONTINUE_1_IO_OP and do1Continue)) and TState = "010") then
						-- WAIT_n or Auto_Wait !
						-- + CONTINUE 1 MEM_RD 0 MEM_WR 1 IO_RD 1 IO_WR
						buffer_RD_n <= buffer_RD_n;
						buffer_WR_n <= buffer_WR_n;
						buffer_IORQ_n <= buffer_IORQ_n;
						buffer_MREQ_n <= buffer_MREQ_n;
					end if;
				end if;
				
				if waitFetchInstruction<MEMORY_WAIT_FETCH_INSTRUCTION then
					WAIT1_n<='0';
					waitFetchInstruction:=waitFetchInstruction+1;
				elsif waitMemRd<MEMORY_WAIT_MEM_RD then
					WAIT1_n<='0';
					waitMemRd:=waitMemRd+1;
				elsif waitMemWr<MEMORY_WAIT_MEM_WR then
					WAIT1_n<='0';
					waitMemWr:=waitMemWr+1;
				elsif waitIoRd<MEMORY_WAIT_IO_RD then
					WAIT1_n<='0';
					waitIoRd:=waitIoRd+1;
				elsif waitIoWr<MEMORY_WAIT_IO_WR then
					WAIT1_n<='0';
					waitIoWr:=waitIoWr+1;
				else
					WAIT1_n<='1';
				end if;
			
				oldTState:=TState;
				if do1Continue then
					do1Continue<=false;
				end if;
				
				if TState = "010" and Wait2_n = '1' then
					DI_Reg <= DI;
				end if;		
		
	
			end if;
			
		end if;
	end process;
	
end;
