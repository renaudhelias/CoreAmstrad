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
-- FPGAmstrad_amstrad_motherboard.simple_DSK
-- Mecashark version : direct read/write access to sdcard.
--
-- State machine : PHASE_* (one-to-one with FDC "state" responses to Z80)
-- Crossing state machine : etat_*
-- Global state : etat_wait '1:busy' : goto PHASE_*_WAIT, '0:not busy' : do leave PHASE_*_WAIT (one-to-one with FDC "ST0/ST1/ST2/ST3" responses to Z80)
-- Bonus : is_dskReady(current_face), at '1' when a dsk is selected/inserted
--
-- see SDRAM_FAT32_LOADER.vhd mecashark
-- TODO : do fix PARADOS.ROM second drive ?
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Garbage research notes (it's a doc copy/paste)
--
--Before accessing a disk you should first "Recalibrate" the drive, that moves the head backwards until it reaches Track 0. (The Track 0 signal from the drive is sensed by the FDC and it initializes it's internal track counter for that drive to 0).
--On a 80 track drive you may need to repeat that twice because some models of the FDC stop after 77 steps and if your recalibrating from track 80 it will not recalibrate fully.
--Now if you want to format, read or write a sector on a specific track you must first Seek that track (command 0Fh). That'll move the read/write head to the physical track number. If you don't do that, then the FDC will attempt to read/write data to/from the current physical track, independenly of the specified logical Track-ID.
--The Track-, Sector-, and Head-IDs are logical IDs only. These logical IDs are defined when formatting the disk, and aren't required to be identical to the physical Track, Sector, or Head numbers. However, when reading or writing a sector you must specify the same IDs that have been used during formatting.
--Despite the confusing name, a sector with a "Deleted Data Address Mark" (DAM) is not deleted. The DAM-flag is just another ID-bit, and (if that ID-bit is specified correctly in the command) it can be read/written like normal data sectors.
--At the end of a successful read/write command, the program should send a Terminal Count (TC) signal to the FDC. However, in the CPC the TC pin isn't connected to the I/O bus, making it impossible for the program to confirm a correct operation. For that reason, the FDC will assume that the command has failed, and it'll return both Bit 6 in Status Register 0 and Bit 7 in Status Register 1 set. The program should ignore this error message.
--The CPC doesn't support floppy DMA transfers, and the FDCs Interrupt signal isn't used in the CPC also.
--Usually single sided 40 Track 3" disk drives are used in CPCs, whereas 40 tracks is the official specification, practically 42 tracks could be used (the limit is specific to the FDD, some support more tracks. 42 is a good maximum). The FDC controller can be used to control 80 tracks, and/or double sided drives also, even though AMSDOS isn't supporting such formats. AMSDOS is supporting a maximum of two disk drives only. 

entity simple_DSK is
    Port ( nCLK4_1 : in  STD_LOGIC;
           reset : in STD_LOGIC;
           A10_A8_A7 : in  STD_LOGIC_VECTOR (2 downto 0); -- chip select
           A0 : in  STD_LOGIC;-- data/status reg select
           IO_RD : in  STD_LOGIC;
           IO_WR : in  STD_LOGIC;
           D_command : in  STD_LOGIC_VECTOR (7 downto 0);
           D_result : out  STD_LOGIC_VECTOR (7 downto 0) := (others=>'1');

			 

			  is_dskReady : in std_logic_vector(1 downto 0);
			  
			  megashark_CHRNresult : in STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_doGOTO : out STD_LOGIC_VECTOR(1 downto 0); -- not a W/R operation finally
			  megashark_CHRN : out STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : out std_logic_vector(9 downto 0); -- sector byte selection : 512B block
			  megashark_Din : in std_logic_vector(7 downto 0);
			  megashark_Dout : out std_logic_vector(7 downto 0);
			  megashark_doREAD : out STD_LOGIC_VECTOR(3 downto 0);
			  megashark_doWRITE : out STD_LOGIC_VECTOR(2 downto 0);
			  megashark_done : in std_logic;
			  megashark_face : out std_logic:='0';
			  megashark_INFO_2SIDES : in std_logic;
			  megashark_INFO_ST1 : in std_logic_vector(7 downto 0); -- contains also ST1_END_CYL and ST1_NO_DATA
			  megashark_INFO_ST2 : in std_logic_vector(7 downto 0)
			  );
end simple_DSK;

architecture Behavioral of simple_DSK is

	constant SECTOR_SIZE:integer:=512; -- some protected format seen with SECTOR_SIZES(6) value
	constant SECTOR_SIZE_MT:integer:=1024;
	constant SECTOR_FOUND:std_logic_vector(7 downto 0):=x"01";
	--constant sampleSector : STD_LOGIC_VECTOR(8*16*2-1 downto 0) := x"004441525453313830A020200000004902030405060708090A0B000000000000";

	constant REQ_MASTER : STD_LOGIC_VECTOR (7 downto 0):=x"80";
	constant DATA_IN_OUT : STD_LOGIC_VECTOR (7 downto 0):=x"40";
	constant EXEC_MODE : STD_LOGIC_VECTOR (7 downto 0):=x"20";
	constant COMMAND_BUSY : STD_LOGIC_VECTOR (7 downto 0):=x"10";
	--constant FDD_BUSY : STD_LOGIC_VECTOR (7 downto 0):=x"0F";

	signal status:STD_LOGIC_VECTOR (7 downto 0):=REQ_MASTER;
	
	--constant ST0_NORMAL : std_logic_vector(7 downto 0):=x"00";
	constant ST0_ABNORMAL : std_logic_vector(7 downto 0):=x"40";
	constant ST0_INVALID : std_logic_vector(7 downto 0):=x"80";
	--constant ST0_READY_CHANGE : std_logic_vector(7 downto 0):=x"C0"; --FIXME
	constant ST0_NOT_READY : std_logic_vector(7 downto 0):=x"08";
	constant ST0_HEAD_ADDR : std_logic_vector(7 downto 0):=x"04";
	constant ST0_EQUIP_CHECK : std_logic_vector(7 downto 0):=x"10"; -- RECALIBRATE (SEEK 0) cmd fail
	constant ST0_SEEK_END : std_logic_vector(7 downto 0):=x"20";
	-- + actualDrive
	
	constant ST1_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01"; -- protected dsk
	constant ST1_NOT_WRITABLE : std_logic_vector(7 downto 0):=x"02";
	constant ST1_NO_DATA : std_logic_vector(7 downto 0):=x"04";
	--constant ST1_OVERRUN : std_logic_vector(7 downto 0):=x"10"; -- protected dsk
	constant ST1_DATA_ERROR : std_logic_vector(7 downto 0):=x"20"; -- protected dsk
	constant ST1_END_CYL : std_logic_vector(7 downto 0):=x"80";
	
	--constant ST2_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01"; -- protected dsk
	--constant ST2_BAD_CYLINDER : std_logic_vector(7 downto 0):=x"02";
	constant ST2_SCAN_NOT_SATISFIED : std_logic_vector(7 downto 0):=x"04";
	constant ST2_SCAN_EQUAL_HIT : std_logic_vector(7 downto 0):=x"08";
	--constant ST2_WRONG_CYL : std_logic_vector(7 downto 0):=x"10";
	--constant ST2_DATA_ERROR : std_logic_vector(7 downto 0):=x"20";
	--constant ST2_CONTROL_MARK : std_logic_vector(7 downto 0):=x"40";
	
	--constant ST3_HEAD_ADDR : std_logic_vector(7 downto 0):=x"04";
	constant ST3_TWO_SIDE : std_logic_vector(7 downto 0):=x"08";
	constant ST3_TRACK_0 : std_logic_vector(7 downto 0):=x"10";
	constant ST3_READY : std_logic_vector(7 downto 0):=x"20";
	constant ST3_WRITE_PROT : std_logic_vector(7 downto 0):=x"40";
	--constant ST3_FAULT : std_logic_vector(7 downto 0):=x"80";
	-- + actualDrive
	
	constant ACTION_POLL:integer range 0 to 8:=0;
	--constant ETAT_READ_DIAGNOSTIC:integer range 0 to 9:=1;
	constant ACTION_READ:integer range 0 to 8:=1;
	constant ACTION_SEEK:integer range 0 to 8:=2;
	constant ACTION_WRITE:integer range 0 to 8:=3;
	constant ETAT_RECALIBRATE:integer range 0 to 8:=4;
	constant ACTION_READ_ID:integer range 0 to 8:=5;
	constant ETAT_SENSE_DRIVE_STATUS:integer range 0 to 8:=6;
	constant ETAT_SENSE_INTERRUPT_STATUS:integer range 0 to 8:=7;
	constant ACTION_SCAN:integer range 0 to 8:=8;
	
	constant PHASE_ATTENTE_COMMANDE:integer range 0 to 9:=0;
	constant PHASE_COMMAND:integer range 0 to 9:=1;
	constant PHASE_WAIT_EXECUTION_READ:integer range 0 to 9:=2;
	constant PHASE_WAIT_EXECUTION_WRITE:integer range 0 to 9:=3;
	constant PHASE_EXECUTION_READ:integer range 0 to 9:=4;
	constant PHASE_EXECUTION_WRITE:integer range 0 to 9:=5;
	constant PHASE_AFTER_EXECUTION_WRITE:integer range 0 to 9:=6;
	constant PHASE_WAIT_RESULT:integer range 0 to 9:=7;
	constant PHASE_RESULT:integer range 0 to 9:=8;
	constant PHASE_WAIT_ATTENTE_COMMANDE:integer range 0 to 9:=9;

	signal phase:integer range 0 to 9:=PHASE_ATTENTE_COMMANDE;
	
	
	constant NB_SECTOR_PER_PISTE:integer:=15;
	constant NB_PISTE_PER_FACE:integer:=80;
	constant NB_FACE:integer:=2;
	
	component altera_syncram is
	  generic (abits : integer := 9; dbits : integer := 32 );
	  port (
	    clk      : in std_ulogic;
	    address  : in std_logic_vector((abits -1) downto 0);
	    datain   : in std_logic_vector((dbits -1) downto 0);
	    dataout  : out std_logic_vector((dbits -1) downto 0);
	    enable   : in std_ulogic;
	    write    : in std_ulogic); 
	end component;
	
	signal memshark_chrn:STD_LOGIC_VECTOR(4*8-1 downto 0):=(others=>'0');
	signal memshark_doGOTO:boolean:=false;
	signal memshark_doGOTO_T:boolean:=false;
	signal memshark_doREAD:boolean:=false;
	signal memshark_doREAD_DEL:boolean:=false;
	signal memshark_doREAD_SK:boolean:=false;
	signal memshark_doREAD_MT:boolean:=false;
	signal memshark_doWRITE:boolean:=false;
	signal memshark_doWRITE_DEL:boolean:=false;
	signal memshark_doWRITE_MT:boolean:=false;
	signal memshark_DTL:integer range 0 to SECTOR_SIZE-1:=0;
	signal memshark_is_DTL:boolean:=false;
	signal memshark_done:boolean:=true;
	
	signal block_Din:std_logic_vector(7 downto 0);
	signal block_Din_megashark:std_logic_vector(7 downto 0);
	signal block_Din_cortex:std_logic_vector(7 downto 0);
	signal block_Dout:std_logic_vector(7 downto 0);
	signal block_A:std_logic_vector(9 downto 0);
	signal block_A_megashark:std_logic_vector(9 downto 0);
	signal block_A_cortex:std_logic_vector(9 downto 0);
	signal block_W:std_ulogic;
	signal block_W_megashark:std_ulogic:='0';
	signal block_W_cortex:std_ulogic:='0';

	signal megashark_doGOTO_s:std_logic_vector(1 downto 0):="00";
	signal megashark_doREAD_s:std_logic_vector(3 downto 0):="0000";
	signal megashark_doWRITE_s:std_logic_vector(2 downto 0):="000";
	
begin

megashark_doGOTO<=megashark_doGOTO_s;
megashark_doREAD<=megashark_doREAD_s;
megashark_doWRITE<=megashark_doWRITE_s;

--The Main Status register can be always read through Port FB7E. The other four Status Registers cannot be read directly, instead they are returned through the data register as result bytes in response to specific commands.
--
--Main Status Register (Port FB7E)
--
-- b0..3  DB  FDD0..3 Busy (seek/recalib active, until succesful sense intstat)
-- b4     CB  FDC Busy (still in command-, execution- or result-phase)
-- b5     EXM Execution Mode (still in execution-phase, non_DMA_only)
-- b6     DIO Data Input/Output (0=CPU->FDC, 1=FDC->CPU) (see b7)
-- b7     RQM Request For Master (1=ready for next byte) (see b6 for direction)


--     if (buffer != null) {
--      if (direction == READ)
--        status = (status & ~REQ_MASTER) | DATA_IN_OUT | EXEC_MODE;
--      else
--        status = (status & ~DATA_IN_OUT) | REQ_MASTER | EXEC_MODE;  // ??? Is RQM high immediately?
--    }
--    else {
--      status |= DATA_IN_OUT;
--    }


-- "Because of this multibyte interchange of information between the uPD765A/uPD765B and the processor, it is convenient to consider each command as consisting of three phases"
	-- JavaCPC comparison in comments : checked OK
	-- writePort: if REQ_MASTER and then not(COMMAND_BUSY) then can start a command
status <= REQ_MASTER when phase = PHASE_ATTENTE_COMMANDE
   -- writePort: if REQ_MASTER and COMMAND_BUSY then command is started : push param[]
	else REQ_MASTER or COMMAND_BUSY when phase = PHASE_COMMAND
	-- readPort:reads : if REQ_MASTER then do slow remove REQ_MASTER
	-- getNextSector:read : add DATA_IN_OUT and EXEC_MODE, do remove REQ_MASTER
	else               COMMAND_BUSY or EXEC_MODE or DATA_IN_OUT when phase = PHASE_WAIT_EXECUTION_READ
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE or DATA_IN_OUT when phase = PHASE_EXECUTION_READ
	-- getNextSector:write : do remove DATA_IN_OUT, add REQ_MASTER and EXEC_MODE
	else               COMMAND_BUSY or EXEC_MODE when phase = PHASE_WAIT_EXECUTION_WRITE
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE when phase = PHASE_EXECUTION_WRITE
	else               COMMAND_BUSY or EXEC_MODE when phase = PHASE_AFTER_EXECUTION_WRITE
	-- readPort:result : if REQ_MASTER then pop result[],
	--                         if last pop then remove COMMAND_BUSY and DATA_IN_OUT
	else               COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_WAIT_RESULT
	else REQ_MASTER or COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_RESULT
	else               COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_WAIT_ATTENTE_COMMANDE
	else REQ_MASTER;



 RAMB16_S9_inst : altera_syncram
 generic map (
   abits =>10,
	dbits =>8
 )
 port map (
	clk=>nCLK4_1,
	address=>block_A,
	datain=>block_Din,
	dataout=>block_Dout,
	enable=>'1',
	write=>block_W
	);
block_Din<=block_Din_megashark when not(memshark_done) else block_Din_cortex;
block_A<=block_A_megashark when not(memshark_done) else block_A_cortex;
block_W<=block_W_megashark when not(memshark_done) else block_W_cortex;
megashark:process(reset,nCLK4_1)
	--variable newDskInserted : boolean := true;
	variable chrn_mem:STD_LOGIC_VECTOR(4*8-1 downto 0):=(others=>'0');
	variable memshark_counter:integer range 0 to SECTOR_SIZE_MT-1; --std_logic_vector(8 downto 0):=(others=>'0');
	variable memshark_step:integer range 0 to 9;
	variable block_A_megashark_mem:std_logic_vector(block_A_megashark'range):=(others=>'0');
	variable block_Din_megashark_mem:std_logic_vector(block_Din_megashark'range):=(others=>'0');
	variable block_W_megashark_mem:std_logic:='0';
	variable megashark_A_mem:std_logic_vector(megashark_A'range):=(others=>'0');
	variable megashark_Dout_mem:std_logic_vector(megashark_Dout'range):=(others=>'0');
	variable doGOTO_mem:std_logic_vector(1 downto 0):="00";
	variable doREAD_mem:std_logic_vector(3 downto 0):="0000";
	variable doWRITE_mem:std_logic_vector(2 downto 0):="000";
begin
	if reset='1' then
	elsif rising_edge(nCLK4_1) then --CLK4
		--if not(is_dskReady(0)='1' and is_dskReady(1)='1') then
		--	memshark_done<=true; -- unbind
		--	megashark_doGOTO_s<='0'; -- unbind
		--	megashark_doREAD_s<='0'; -- unbind
		--	megashark_doWRITE_s<='0'; -- unbind
		--end if;
		
		if memshark_doGOTO then
			-- GOTO CHRN : here R is current_sector (0 or +)
			memshark_done<=false;
			doGOTO_mem:="01";
			if memshark_doGOTO_T then
				doGOTO_mem(1):='1';
			end if;
			memshark_step:=0;
		elsif memshark_doREAD then
			-- READ CHRN : here R is sector id (x"C1"...), READ_DIAGNOSTIC do use EOT parameter, that is a sector id, so I doREAD when READ_DIAGNOSTIC command is called, instead of launching doGOTO.
			memshark_done<=false;
			doREAD_mem:="0001";
			if memshark_doREAD_DEL then
				doREAD_mem(1):='1';
			end if;
			if memshark_doREAD_SK then
				doREAD_mem(2):='1';
			end if;
			if memshark_doREAD_MT then
				doREAD_mem(3):='1';
			end if;
			memshark_step:=3;
		elsif memshark_doWRITE then
			memshark_done<=false;
			doWRITE_mem:="001";
			if memshark_doWRITE_DEL then
				doWRITE_mem(1):='1';
			end if;
			if memshark_doWRITE_MT then
				doWRITE_mem(2):='1';
			end if;
			memshark_step:=6;
		end if;
		
		megashark_doGOTO_s<="00";
		megashark_doREAD_s<="0000";
		megashark_doWRITE_s<="000";
		
		block_W_megashark_mem:='0'; -- we write only one time
		if not(memshark_done) then
			if megashark_done='1' and megashark_doGOTO_s(0)='0' and megashark_doREAD_s(0)='0' and megashark_doWRITE_s(0)='0' then
				case memshark_step is
					when 0=> -- GOTO memshark_chrn
						chrn_mem:=memshark_chrn;
						megashark_CHRN<=chrn_mem;
						megashark_doGOTO_s<=doGOTO_mem;
						memshark_step:=1;
					when 1=>
						chrn_mem:=megashark_CHRNresult;
						memshark_step:=2;
					when 2=> -- CHRN OK
						memshark_done<=true;
						
					when 3=> -- READ memshark_chrn
						chrn_mem:=memshark_chrn;
						megashark_CHRN<=chrn_mem;
						memshark_counter:=0;
						megashark_A<=conv_std_logic_vector(memshark_counter,10);
						megashark_doREAD_s<=doREAD_mem;
						memshark_step:=4;
					when 4=>
						block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,10);
						block_Din_megashark_mem:=megashark_Din;
						--if memshark_counter<16*2 then
						--	block_Din_megashark_mem:=sampleSector((16*2-memshark_counter)*8-1 downto (16*2-memshark_counter-1)*8);
						--else
						--	block_Din_megashark_mem:=x"E5";
						--end if;
						block_W_megashark_mem:='1';
						if (doREAD_mem(3)='1' and memshark_counter = SECTOR_SIZE_MT-1)
							or (doREAD_mem(3)='0' and memshark_counter = SECTOR_SIZE-1) then
							memshark_step:=5;
						else
							megashark_CHRN<=chrn_mem;
							memshark_counter:=memshark_counter+1;
							megashark_A<=conv_std_logic_vector(memshark_counter,10);
							megashark_doREAD_s<=doREAD_mem;
						end if;
					when 5=>
						chrn_mem:=megashark_CHRNresult;
						memshark_step:=2;
						
					when 6=> -- WRITE memshark_chrn
						-- just wait one tic that I can read block_A_megashark_mem
						chrn_mem:=memshark_chrn;
						megashark_CHRN<=chrn_mem;
						memshark_counter:=0;
						block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,10);
						block_W_megashark_mem:='0';
						memshark_step:=9;
					when 9=>
						chrn_mem:=memshark_chrn;
						megashark_CHRN<=chrn_mem;
							-- just wait MORE THAN one tic that I can read block_A_megashark_mem
							megashark_Dout_mem:=block_Dout;
							megashark_Dout<=megashark_Dout_mem;
							megashark_A_mem:=conv_std_logic_vector(memshark_counter,10);
							megashark_A<=megashark_A_mem;
							megashark_doWRITE_s<=doWRITE_mem;
						memshark_counter:=0;
						block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,10);
						block_W_megashark_mem:='0';
						memshark_step:=7;
					when 7=>
						if (doWRITE_mem(2)='1' and not(memshark_is_DTL) and memshark_counter = SECTOR_SIZE_MT-1)
							or (doWRITE_mem(2)='0' and not(memshark_is_DTL) and memshark_counter = SECTOR_SIZE-1) then
							-- fin de non DTL
							megashark_CHRN<=chrn_mem;
							megashark_Dout_mem:=block_Dout;
							megashark_Dout<=megashark_Dout_mem;
							megashark_A_mem:=conv_std_logic_vector(memshark_counter,10);
							megashark_A<=megashark_A_mem;
							megashark_doWRITE_s<=doWRITE_mem;
							memshark_step:=8;
						else
							megashark_CHRN<=chrn_mem;
							megashark_Dout_mem:=block_Dout;
							megashark_Dout<=megashark_Dout_mem;
							megashark_A_mem:=conv_std_logic_vector(memshark_counter,10);
							megashark_A<=megashark_A_mem;
							megashark_doWRITE_s<=doWRITE_mem;
							memshark_counter:=memshark_counter+1;
							if memshark_is_DTL and memshark_counter = memshark_DTL then
								-- fin de DTL...
								memshark_step:=8;
							else
								block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,10);
								block_W_megashark_mem:='0';
							end if;
						end if;
					when 8=>
						chrn_mem:=megashark_CHRNresult;
						memshark_step:=2;
				end case;
			end if;
		end if;
		block_Din_megashark<=block_Din_megashark_mem;
		block_A_megashark<=block_A_megashark_mem;
		block_W_megashark<=block_W_megashark_mem;
	end if;
end process megashark;





cortex:process(reset,nCLK4_1)
	variable current_byte:integer range 0 to SECTOR_SIZE_MT-1;
	--type sector_size_type is array(0 to 4) of integer;
	--constant SECTOR_SIZES:sector_size_type:=(128,256,512,1024,2048);--(x"80",x"100",x"200",x"400",x"800",x"1000",x"1800");
	--variable dtl:integer range 0 to SECTOR_SIZE-1:=0; -- against Drive <drive>: disc changed, closing <filename>	The user has changed the disc while files were still open on it.
	
	type params_type is array(0 to 7) of std_logic_vector(7 downto 0);
	type results_type is array(0 to 6) of std_logic_vector(7 downto 0);
	variable pcount:integer range 0 to 8:=0;
	variable params:params_type:=(others=>(others=>'0')); -- stack of params
	variable exec_restant:integer range 0 to SECTOR_SIZE_MT:=0;
	variable exec_restant_write:integer range 0 to SECTOR_SIZE_MT:=0;
	variable rcount:integer range 0 to 7:=0;
	variable result:results_type:=(others=>(others=>'0')); -- stack of result
	type chrn_type is array(3 downto 0) of std_logic_vector(7 downto 0);
	variable chrn:chrn_type:=(others=>(others=>'0'));
	variable status_mem:std_logic_vector(7 downto 0);

	function getCHRN(chrn : in STD_LOGIC_VECTOR(4*8-1 downto 0)) return chrn_type is
		variable chrn_interne:chrn_type;
	begin
		chrn_interne(3):=chrn(31 downto 24);
		chrn_interne(2):=chrn(23 downto 16);
		chrn_interne(1):=chrn(15 downto 8);
		chrn_interne(0):=chrn(7 downto 0);
		return chrn_interne;
	end function;

	function setCHRN(chrn : in chrn_type) return STD_LOGIC_VECTOR is
	begin
		return chrn(3) & chrn(2) & chrn(1) & chrn(0);
	end function;

	variable action:integer range 0 to 8;
	variable check_dsk_face:boolean:=false;
	variable etat_wait:boolean:=false; -- memshark is busy or out of synchro (work in progress, do generate a ST0/ST1 failing for this round)
	variable etat_zap:boolean:=false;
	variable command:std_logic_vector(7 downto 0);
	variable is_multitrack:boolean:=false;
	
	variable is_del:boolean:=false;
	variable is_sk:boolean:=false;
	
	variable data:std_logic_vector(7 downto 0);
	variable do_update:boolean;

	variable wasIO_RD:std_logic:='0';
	variable wasIO_WR:std_logic:='0';
	
--Status Register 0
--
-- b0,1   US  Unit Select (driveno during interrupt)
-- b2     HD  Head Adress (head during interrupt)
-- b3     NR  Not Ready (drive not ready or non-existing 2nd head selected)
-- b4     EC  Equipment Check (drive failure or recalibrate failed (retry))
-- b5     SE  Seek End (Set if seek-command completed)
-- b6,7   IC  Interrupt Code (0=OK, 1=aborted:readfail/OK if EN, 2=unknown cmd
--            or senseint with no int occured, 3=aborted:disc removed etc.)
--
--Status Register 1
--
-- b0     MA  Missing Adress Mark (Sector_ID or DAM not found)
-- b1     NW  Not Writeable (tried to write/format disc with wprot_tab=on)
-- b2     ND  No Data (Sector_ID not found, CRC fail in ID_field)
-- b3,6   0   Not used
-- b4     OR  Over Run (CPU too slow in execution-phase (ca. 26us/Byte))
-- b5     DE  Data Error (CRC-fail in ID- or Data-Field)
-- b7     EN  End of Track (set past most read/write commands) (see IC)
--
--Status Register 2
--
-- b0     MD  Missing Address Mark in Data Field (DAM not found)
-- b1     BC  Bad Cylinder (read/programmed track-ID different and read-ID = FF)
-- b2     SN  Scan Not Satisfied (no fitting sector found)
-- b3     SH  Scan Equal Hit (equal)
-- b4     WC  Wrong Cylinder (read/programmed track-ID different) (see b1)
-- b5     DD  Data Error in Data Field (CRC-fail in data-field)
-- b6     CM  Control Mark (read/scan command found sector with deleted DAM)
-- b7     0   Not Used
--
--Status Register 3
--
-- b0,1   US  Unit Select (pin 28,29 of FDC)
-- b2     HD  Head Address (pin 27 of FDC)
-- b3     TS  Two Side (0=yes, 1=no (!))
-- b4     T0  Track 0 (on track 0 we are)
-- b5     RY  Ready (drive ready signal)
-- b6     WP  Write Protected (write protected)
-- b7     FT  Fault (if supported: 1=Drive failure)
	variable ST0:std_logic_vector(7 downto 0):=(others=>'0');
	variable actualDrive:std_logic_vector(7 downto 0):=(others=>'0'); -- H + US + US
	variable ST1:std_logic_vector(7 downto 0):=(others=>'0');
	variable ST2:std_logic_vector(7 downto 0):=(others=>'0');
	variable ST3:std_logic_vector(7 downto 0):=(others=>'0');
	-- BLOCK_SIZE : N stands for the number of data bytes written in a (Number) sector
	constant BLOCK_SIZE:std_logic_vector(7 downto 0):=x"02";
	constant TRACK_00:std_logic_vector(7 downto 0):=x"00";
	variable EOT:std_logic_vector(7 downto 0):=(others=>'0');
	variable EOT_DTL:integer range 0 to SECTOR_SIZE-1:=0;
	variable is_EOT_DTL:boolean:=false; -- FIXME
	variable BOT:std_logic_vector(7 downto 0):=(others=>'0');
	variable block_A_cortex_mem:std_logic_vector(block_A_cortex'range):=(others=>'0');
	variable block_Din_cortex_mem:std_logic_vector(block_Din_cortex'range):=(others=>'0');
	variable block_W_cortex_mem:std_logic:='0';
	
	--variable current_face:std_logic:='0';
	variable current_face_notReady:boolean:=true;
	
	variable compare_low_or_equal:boolean:=false;
	variable compare_high_or_equal:boolean:=false;
	variable compare_OK:boolean:=false;
	
	variable is_seeking_FACE_A:boolean:=false;
	variable is_seeking_FACE_B:boolean:=false;
	variable is_issue:boolean:=false; -- not is_seeking but bad command result
begin

	if reset='1' then
		D_result<=(others=>'1');

		current_byte:=0;
		pcount:=0;
		exec_restant:=0;
		rcount:=0;
		action:=ACTION_POLL;
		data:=(others=>'0');
		
		do_update:=false;
		phase<=PHASE_ATTENTE_COMMANDE;
		etat_wait:=false;
	elsif rising_edge(nCLK4_1) then --CLK4
	
			memshark_doGOTO<=false;
			memshark_doGOTO_T<=false;
			memshark_doREAD<=false;
			memshark_doREAD_DEL<=false;
			memshark_doREAD_SK<=false;
			memshark_doREAD_MT<=false;
			memshark_doWRITE<=false;
			memshark_doWRITE_DEL<=false;
			memshark_doWRITE_MT<=false;
			
			if actualDrive(1)='1' then
				current_face_notReady:=false;
			elsif actualDrive(0)='0' and is_dskReady(0) = '1' then
				current_face_notReady:=false;
			elsif actualDrive(0)='1' and is_dskReady(1) = '1' then
				current_face_notReady:=false;
			else
				current_face_notReady:=true;
			end if;
			--if is_dskReady(0)='1' then
			--	current_face_notReady:=false;
			--else
			--	current_face_notReady:=true;
			--end if;
			
			block_W_cortex_mem:='0';
			
			if etat_wait then
				if phase = PHASE_WAIT_ATTENTE_COMMANDE and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					actualDrive(2):=megashark_CHRNresult(16); -- side (one side only ?)
					chrn:=getCHRN(megashark_CHRNresult); -- C (from SEEK command ask)
					-- ST1_NO_DATA or ST1_MISSING_ADDR
					etat_wait:=false;
					phase <= PHASE_ATTENTE_COMMANDE;
				elsif phase = PHASE_WAIT_EXECUTION_READ and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					actualDrive(2):=megashark_CHRNresult(16); -- side (one side only ?)
					etat_wait:=false;
					if (megashark_INFO_ST1 and ST1_MISSING_ADDR) = x"00" then
						phase <= PHASE_EXECUTION_READ;
					else
						-- no bytes to read
						exec_restant:=0;
						BOT:=EOT;
						phase <= PHASE_RESULT;
						rcount:=7;
					end if;
				elsif phase = PHASE_WAIT_EXECUTION_WRITE and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					actualDrive(2):=megashark_CHRNresult(16); -- side (one side only ?)
					etat_wait:=false;
					phase <= PHASE_EXECUTION_WRITE;
				elsif phase = PHASE_WAIT_RESULT and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					actualDrive(2):=megashark_CHRNresult(16); -- side (one side only ?)
					etat_wait:=false;
					phase <= PHASE_RESULT;
				end if;
			end if;
	
	
			if current_face_notReady or etat_wait then
				--The following bits are used from NEC765 status register 1:
				--b7 EN (End of Cylinder)
				--b5 DE (Data Error)
				--b2 ND (No Data)
				--b0 MA (Missing Address Mark)
				--The following bits are used from NEC765 status register 2:
				--b5 CM (Control Mark)
				--b5 DD (Data Error in Data field)
				--b0 MD (Missing address Mark in Data field)
			
				-- DSK NOT READY MESSAGE
				ST0:=ST0_ABNORMAL or ST0_NOT_READY or actualDrive; -- do press retry to test :/
				ST1:=x"00";
				ST2:=x"00";
				ST3:=x"00" or actualDrive;
			else
				ST1:=megashark_INFO_ST1;
				ST2:=megashark_INFO_ST2;
				-- TEST : |a |b |a using ss40t in drive A: and ds80t DOS D2 in drive B:
				-- RESULT : crash due to ST0_ABNORMAL returned in a simple READ_ID cmd...
				if (megashark_INFO_ST1 and ST1_MISSING_ADDR)=ST1_MISSING_ADDR then
					ST0:=ST0_ABNORMAL or actualDrive;
				else
					ST0:=actualDrive;
				end if;
				ST3:=ST3_READY or actualDrive;
			end if;
			
			if megashark_INFO_2SIDES='1' then
				-- JavaCPC : 2T is at '1' if it is a double sided dsk...
				-- Batman in one disk not running correctly
				-- RTypes128K doesn't matter ST3_TWO_SIDE.
				ST3:=ST3 or ST3_TWO_SIDE;
			end if;
			--JavaCPC
			--if megashark_INFO_2SIDES='0' and actualDrive(2)='1' then
			--	--When the FDD IS in the not-ready state and (Not Ready) a Read or Write command IS Issued, this flag IS set 
			--	--If a Read or Write command isissued to side 1 of a single-sided drive,then this flag IS set
			--	ST0:=ST0 or ST0_NOT_READY;
			--end if;
				
	
			if ((wasIO_RD='0' and IO_RD='1') or (wasIO_WR='0' and IO_WR='1')) and A10_A8_A7=b"010"  then
				-- I am concerned
				do_update:=true;
			elsif ((wasIO_RD='1' and IO_RD='1') or (wasIO_WR='1' and IO_WR='1')) and A10_A8_A7=b"010"  then
				-- dodo
				do_update:=false;
			else
				-- I am not concerned : unbind
				
				
				D_result<=(others=>'1');
				
				do_update:=false;
			end if;
			
--		 FDC Command Table
--
--Command     Parameters              Exm Result               Description
--02+MF+SK    HU TR HD ?? SZ NM GP SL <R> S0 S1 S2 TR HD NM SZ read track
--03          XX YY                    -                       specify spd/dma
--04          HU                       -  S3                   sense drive state
--05+MT+MF    HU TR HD SC SZ LS GP SL <W> S0 S1 S2 TR HD LS SZ write sector(s)
--06+MT+MF+SK HU TR HD SC SZ LS GP SL <R> S0 S1 S2 TR HD LS SZ read sector(s)
--07          HU                       -                       recalib.seek TP=0
--08          -                        -  S0 TP                sense int.state
--09+MT+MF    HU TR HD SC SZ LS GP SL <W> S0 S1 S2 TR HD LS SZ wr deleted sec(s)
--0A+MF       HU                       -  S0 S1 S2 TR HD LS SZ read ID
--0C+MT+MF+SK HU TR HD SC SZ LS GP SL <R> S0 S1 S2 TR HD LS SZ rd deleted sec(s)
--0D+MF       HU SZ NM GP FB          <W> S0 S1 S2 TR HD LS SZ format track
--0F          HU TP                    -                       seek track n
--11+MT+MF+SK HU TR HD SC SZ LS GP SL <W> S0 S1 S2 TR HD LS SZ scan equal
--19+MT+MF+SK HU TR HD SC SZ LS GP SL <W> S0 S1 S2 TR HD LS SZ scan low or equal
--1D+MT+MF+SK HU TR HD SC SZ LS GP SL <W> S0 S1 S2 TR HD LS SZ scan high or eq.
--
--Parameter bits that can be specified in some Command Bytes are:
--
-- MT  Bit7  Multi Track (continue multi-sector-function on other head)
-- MF  Bit6  MFM-Mode-Bit (Default 1=Double Density)
-- SK  Bit5  Skip-Bit (set if secs with deleted DAM shall be skipped)
--
--Parameter/Result bytes are:
--
-- HU  b0,1=Unit/Drive Number, b2=Physical Head Number, other bits zero
-- TP  Physical Track Number
-- TR  Track-ID (usually same value as TP)
-- HD  Head-ID
-- SC  First Sector-ID (sector you want to read)
-- SZ  Sector Size (80h shl n) (default=02h for 200h bytes)
-- LS  Last Sector-ID (should be same as SC when reading a single sector)
-- GP  Gap (default=2Ah except command 0D: default=52h)
-- SL  Sectorlen if SZ=0 (default=FFh)
-- Sn  Status Register 0..3
-- FB  Fillbyte (for the sector data areas) (default=E5h)
-- NM  Number of Sectors (default=09h)
-- XX  b0..3=headunload n*32ms (8" only), b4..7=steprate (16-n)*2ms
-- YY  b0=DMA_disable, b1-7=headload n*4ms (8" only)
			if do_update then
				--if CLK4(1)='1' then
					-- z80 is solved
					D_result<=(others=>'1');
					if (IO_RD='1' and A10_A8_A7=b"010" and A0='0') then
						-- read status
						-- read status
						status_mem:=status;
						if is_seeking_FACE_A then
							status_mem(0):='1';
						end if;
						if is_seeking_FACE_B then
							status_mem(1):='1';
						end if;
						D_result<=status_mem;
					elsif (IO_RD='1' and A10_A8_A7=b"010" and A0='1') then
						-- read data
						if phase=PHASE_EXECUTION_READ then
							if exec_restant>0 then
								exec_restant:=exec_restant-1;
							end if;
							if action=ACTION_READ then
								chrn:=getCHRN(megashark_CHRNresult);
								if not(etat_wait) and not(etat_zap) then
									data:=block_Dout;
									D_result<=data;
									--if current_byte<16*2 then
									--	D_result<=sampleSector((16*2-current_byte)*8-1 downto (16*2-current_byte-1)*8);
									--else
									--	D_result<=x"E5";
									--end if;
								else
									D_result<=(others=>'1');
								end if;
								if is_multitrack and current_byte=SECTOR_SIZE_MT-1 then
									-- bug overflow !
									current_byte:=0;
								elsif not(is_multitrack) and current_byte=SECTOR_SIZE-1 then
									-- bug overflow !
									current_byte:=0;
								else
									current_byte:=current_byte+1;
								end if;
								if not(etat_wait) and not(etat_zap) then
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,10);
									block_W_cortex_mem:='0';
								end if;

								
								if exec_restant=0 then
									if EOT=BOT or etat_zap then
										if etat_wait then
											phase<=PHASE_WAIT_RESULT;
										else
											phase<=PHASE_RESULT;
										end if;
										rcount:=7;
										--result(6):=ST0; -- ST0
										--result(5):=ST1 or ST1_END_CYL; -- ST1
										--result(4):=ST2; -- ST2
										--result(3):=chrn(3); -- params(6); -- C
										--result(2):=chrn(2); -- params(5); -- H
										--result(1):=SECTOR_FOUND; --chrn(1); -- R (BOT=EOT)
										--result(0):=chrn(0); -- N (BLOCK_SIZE)
									else
										BOT:=BOT+x"01"; -- no brain
										chrn(1):=BOT;
										if EOT=BOT and is_EOT_DTL then
											exec_restant:=EOT_DTL;
										else
											exec_restant:=SECTOR_SIZE;
										end if;
										memshark_is_DTL<=false;
										etat_wait := true;
										etat_zap := false;
										phase<=PHASE_WAIT_EXECUTION_READ;
										if memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
											-- on lance une tentative de lecture du block en parallele
											memshark_chrn<=setCHRN(chrn);
											memshark_doREAD<=true;
											memshark_doREAD_DEL<=is_del;
											memshark_doREAD_SK<=is_sk;
											memshark_doREAD_MT<=is_multitrack;
										end if;
									end if;
								end if;
								
							else
								-- HELL
							end if;
							
							
							
							
						
						elsif phase=PHASE_RESULT then
							if action=ACTION_READ and rcount=7 then
								action:=ACTION_POLL;
								chrn:=getCHRN(megashark_CHRNresult);
								result(6):=ST0; -- ST0
								if (ST0 and ST0_ABNORMAL)=ST0_ABNORMAL then
									result(5):=ST1;
								else
									result(5):=ST1 or ST1_END_CYL; -- ST1
								end if;
								result(4):=ST2; -- ST2
								result(3):=chrn(3); -- params(6); -- C
								result(2):=chrn(2); -- params(5); -- H
								result(1):=SECTOR_FOUND; --chrn(1); -- R (BOT=EOT)
								result(0):=chrn(0); -- N (BLOCK_SIZE)
							elsif action=ACTION_READ_ID and rcount=7 then-- PARADOS second drive seem have serious problem (with same data and fixed sector id here, size of disk/file is different), perhaps more FDC instructions runs
								action:=ACTION_POLL;
								chrn:=getCHRN(megashark_CHRNresult);
								result(6):=ST0;
								result(5):=ST1; -- ST1 (I'm always fine)
								result(4):=ST2; -- ST2
								result(3):=chrn(3); -- C
								result(2):=chrn(2); -- H
								result(1):=chrn(1); -- R (READ_ID sector ID)
								result(0):=chrn(0); -- N (BLOCK_SIZE)
							elsif action=ETAT_SENSE_DRIVE_STATUS and rcount=1 then
								action:=ACTION_POLL;
								chrn:=getCHRN(megashark_CHRNresult);
								if chrn(3)=0 then
									result(0):=ST3 or ST3_TRACK_0;
								else
									result(0):=ST3;
								end if;
--							elsif action=ETAT_READ_DIAGNOSTIC and rcount=7 then
--								action:=ACTION_POLL;
--								chrn:=getCHRN(megashark_CHRNresult);
--								result(6):=ST0;
--								result(5):=ST1; -- ST1 (I'm always fine : asynchronous/PHASE_WAIT_ATTENTE_COMMANDE, OK)
--								result(4):=ST2; -- ST2
--								result(3):=chrn(3);
--								result(2):=chrn(2);
--								result(1):=chrn(1);
--								result(0):=chrn(0);
							elsif action=ETAT_SENSE_INTERRUPT_STATUS  and rcount=3 then
								action:=ACTION_POLL;
								--chrn:=getCHRN(megashark_CHRNresult); -- result of a previous seek/recalibrate
								if is_issue then
									 -- generaly just after a failing "read command"
									is_issue:=false;
									is_seeking_FACE_A:=false;
									is_seeking_FACE_B:=false;
									-- JavaCPC result[rindex = 0] = ST0_INVALID;
									result(0):=ST0; -- or ST0_INVALID;
									-- JavaCPC rcount = 1;
									rcount:=1;
								elsif actualDrive(1 downto 0)="00" and is_seeking_FACE_A then
									rcount:=2;
									result(1):=ST0 or ST0_SEEK_END; -- generaly just after a "recalibrate command" ST0_SEEK_END
									result(0):=chrn(3); -- C -- PCN : Present Cylinder Number
									is_seeking_FACE_A:=false;
								elsif actualDrive(1 downto 0)="01" and is_seeking_FACE_B then
									rcount:=2;
									result(1):=ST0 or ST0_SEEK_END; -- generaly just after a "recalibrate command" ST0_SEEK_END
									--end if;
									result(0):=chrn(3); -- C -- PCN : Present Cylinder Number
									is_seeking_FACE_B:=false;
								else
									-- Cpc Aventure : "Please insert disk 2" message ?
									rcount:=1;
									result(0):=ST0 or ST0_INVALID; -- FDCTEST.ASM &0D sense_intr1
								end if;
							end if;
							
							if rcount>0 then
							
								rcount:=rcount-1;
								
								data:=result(rcount);
								D_result<=data;
								
								if rcount=0 then
									if etat_wait then
										phase<=PHASE_WAIT_ATTENTE_COMMANDE;
									else
										phase<=PHASE_ATTENTE_COMMANDE;
									end if;
									action:=ACTION_POLL;
								end if;
							else
								-- HELL
							end if;
						end if;
							
							
							
					
					elsif (IO_WR='1' and A10_A8_A7=b"010" and A0='0') then
						-- HELL
					elsif (IO_WR='1' and A10_A8_A7=b"010" and A0='1') then
						-- write data
						
						if phase=PHASE_EXECUTION_WRITE then
							if exec_restant_write>0 then
								exec_restant_write:=exec_restant_write-1;
							end if;
							if action=ACTION_WRITE then
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								data:=D_command;
								if not(etat_wait) and not(etat_zap) then
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,10);
									-- OK if current_byte=0 then
									-- OK 	block_A_cortex_mem:=conv_std_logic_vector(1,9);
									-- OK 	block_Din_cortex_mem:=data;
									-- OK elsif	current_byte=1 then
									-- OK 	block_A_cortex_mem:=conv_std_logic_vector(0,9);
									-- OK 	block_Din_cortex_mem:=x"77";
									-- OK else
										block_Din_cortex_mem:=data;
									-- OK end if;
									block_W_cortex_mem:='1';
								end if;
								if is_multitrack and current_byte=SECTOR_SIZE_MT-1 then
									--overrun
									current_byte:=0;
								elsif not(is_multitrack) and current_byte=SECTOR_SIZE-1 then
									--overrun
									current_byte:=0;
								else
									current_byte:=current_byte+1;
								end if;
								if exec_restant_write=0 then
									if etat_zap then
										phase<=PHASE_RESULT;
									elsif etat_wait then
										phase<=PHASE_WAIT_RESULT;
									else
										phase<=PHASE_AFTER_EXECUTION_WRITE;
										etat_wait:=true;
									end if;
									rcount:=7;
									result(6):=ST0; -- ST0
									result(5):=ST1 or ST1_END_CYL; -- ST1
									result(4):=ST2; -- ST2
									result(3):=params(6); -- C
									result(2):=params(5); -- H
									result(1):=SECTOR_FOUND; --params(2); -- R (EOT)
									result(0):=chrn(0); -- N (BLOCK_SIZE)
								end if;
							elsif action=ACTION_SCAN then
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								data:=D_command;
								if not(etat_wait) and not(etat_zap) then
									if compare_OK then
										if block_Dout=data then
											-- cool
										elsif compare_low_or_equal and block_Dout<=data then
											-- cool
										elsif compare_high_or_equal and block_Dout>=data then
											-- cool
										else
											compare_OK:=false;
										end if;
									end if;
								end if;
								if is_multitrack and current_byte=SECTOR_SIZE_MT-1 then
									--overrun
									current_byte:=0;
								elsif not(is_multitrack) and current_byte=SECTOR_SIZE-1 then
									--overrun
									current_byte:=0;
								else
									current_byte:=current_byte+1;
								end if;
								
								if not(etat_wait) and not(etat_zap) then
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,10);
									block_W_cortex_mem:='0';
								end if;
								
								if exec_restant_write=0 then
									if EOT=BOT then
										if etat_zap then
											phase<=PHASE_RESULT;
										elsif etat_wait then
											phase<=PHASE_WAIT_RESULT;
										else
											phase<=PHASE_RESULT;
										end if;
										rcount:=7;
										result(6):=ST0; -- ST0
										result(5):=ST1 or ST1_END_CYL; -- ST1
										if compare_OK then
											result(4):=ST2 or ST2_SCAN_EQUAL_HIT; -- ST2
										else
											result(4):=ST2 or ST2_SCAN_NOT_SATISFIED; -- ST2
										end if;
										result(3):=params(6); -- C
										result(2):=params(5); -- H
										result(1):=SECTOR_FOUND; --params(2); -- R (EOT)
										result(0):=chrn(0); -- N (BLOCK_SIZE)
									else
										BOT:=BOT+x"01";
										chrn(1):=BOT;
										if EOT=BOT and is_EOT_DTL then
											exec_restant_write:=EOT_DTL;
											memshark_is_DTL<=true;
										else
											exec_restant_write:=SECTOR_SIZE;
											memshark_is_DTL<=false;
										end if;
										etat_wait := true;
										etat_zap := false;
										phase<=PHASE_WAIT_EXECUTION_WRITE;
										if memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
											-- on lance une tentative de lecture du block en parallele
											memshark_chrn<=setCHRN(chrn);
											memshark_doREAD<=true;
											memshark_doREAD_DEL<=is_del;
											memshark_doREAD_SK<=is_sk;
											memshark_doREAD_MT<=is_multitrack;
											-- pointer charger le premier octet (tout de suite ou apres la sortie d'un PHASE_WAIT_*)
											block_A_cortex_mem:=conv_std_logic_vector(current_byte,10);
											block_W_cortex_mem:='0';
										end if;
									end if;
								end if;
							else
								-- HELL
							end if;
						elsif phase=PHASE_ATTENTE_COMMANDE or phase=PHASE_RESULT then
							if phase=PHASE_RESULT then
								--leaving normal state machine : command issue
								is_issue:=true;
								rcount:=1;
								result(0):=ST0 or ST0_INVALID;
								--FDCTEST.ASM &0F read_data_c
								-- ;; 41,80,00,0b,00,c1,02
							else
								--back to normal state machine
								is_issue:=false;
							end if;
							
							-- result is facultative.
							phase<=PHASE_ATTENTE_COMMANDE;
							pcount:=0;
							exec_restant:=0;
							exec_restant_write:=0;
							rcount:=0;
							action:=ACTION_POLL;
							-- MT MF et SK (we don't care about theses 3 first bits)
							command:=D_command and x"1f";
							is_multitrack:=(D_command(7)='1');
							is_del:=false;
							is_sk:=(D_command(5)='1');

							compare_OK:=false;
							case command is
								when x"02" => -- read track
									is_multitrack:=false; -- READ_DIAGNOSTIC : pas de MT ici
									action:=ACTION_READ; -- getNextSector(READ) with resetSector() : sector=0
									phase<=PHASE_COMMAND;
									pcount:=8;
									check_dsk_face:=true;
								when x"03" => -- specify
									pcount:=2;
									phase<=PHASE_COMMAND;
								when x"04" => -- SENSE DRIVE STATUS
									pcount:=1;
									action:=ETAT_SENSE_DRIVE_STATUS;
									check_dsk_face:=true;
									phase<=PHASE_COMMAND;
								when x"05" => -- write data
									pcount:=8;
									phase<=PHASE_COMMAND;
									action:=ACTION_WRITE;
									check_dsk_face:=true;
								when x"06" => -- read
									pcount:=8;
									action:=ACTION_READ; -- getNextSector(READ) : sector=0
									phase<=PHASE_COMMAND;
									check_dsk_face:=true;
								when x"07" => -- recalibrate (==SEEK at C=0, 77 fois max)
									pcount:=1;
									action:=ETAT_RECALIBRATE;
									phase<=PHASE_COMMAND;
									check_dsk_face:=true;
								when x"08" => -- sense interrupt status : status information about the FDC at the end of operation
									rcount:=3;
									if etat_wait then
										phase<=PHASE_WAIT_RESULT;
									else
										phase<=PHASE_RESULT;
									end if;
									action:=ETAT_SENSE_INTERRUPT_STATUS;
								when x"09" => -- write DELETED DATA
									pcount:=8;
									phase<=PHASE_COMMAND;
									action:=ACTION_WRITE;
									-- is_del:=true
									check_dsk_face:=true;
								when x"0a" => -- read id
									pcount:=1; -- select drive/side
									action:=ACTION_READ_ID;
									check_dsk_face:=true;
									phase<=PHASE_COMMAND;
								when x"0C" => -- read DELETED DATA
									pcount:=8;
									action:=ACTION_READ;
									phase<=PHASE_COMMAND;
									is_del:=true; -- skip [not] set? if (isDeletedData()) {result[2] |= 0x040;}
									check_dsk_face:=true;
								when x"0f" => -- seek : changing track C
									phase<=PHASE_COMMAND;
									pcount:=2;
									action:=ACTION_SEEK;
									check_dsk_face:=true;
								when x"11" => -- SCAN EQUAL
									pcount:=8;
									phase<=PHASE_COMMAND;
									action:=ACTION_SCAN;
									compare_low_or_equal:=false;
									compare_high_or_equal:=false;
									check_dsk_face:=true;
								when x"19" => -- SCAN LOW OR EQUAL
									pcount:=8;
									phase<=PHASE_COMMAND;
									action:=ACTION_SCAN;
									compare_low_or_equal:=true;
									compare_high_or_equal:=false;
									check_dsk_face:=true;
								when x"1D" => -- SCAN HIGH OR EQUAL
									pcount:=8;
									phase<=PHASE_COMMAND;
									action:=ACTION_SCAN;
									compare_low_or_equal:=false;
									compare_high_or_equal:=true;
									check_dsk_face:=true;
									
								when x"10" => -- VERSION
									rcount:=1;
									result(0):=ST0 or x"80"; -- 80H indicates 765A/A-2 as JavaCPC
									--result(0):=ST0 or x"90"; --90h indicates 765B
									if etat_wait then
										phase<=PHASE_WAIT_RESULT;
									else
										phase<=PHASE_RESULT;
									end if;
								when others => --INVALID
									--go to standby state
									rcount:=1;
									result(0):=ST0 or ST0_INVALID; -- 80h
									if etat_wait then
										phase<=PHASE_WAIT_RESULT;
									else
										phase<=PHASE_RESULT;
									end if;
							end case;
						elsif phase=PHASE_COMMAND then
							if pcount>0 then
								pcount:=pcount-1;
								params(pcount):=D_command;
								if check_dsk_face then
									check_dsk_face:=false;
									-- HD : physical HEAD
									actualDrive(2 downto 0):=D_command(2 downto 0); -- HD US1 US0
									megashark_face<=actualDrive(0);
								end if;
							end if;
							if pcount=0 then
								if action=ETAT_RECALIBRATE then -- no result
									-- goto track 0 side 0
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										if actualDrive(1 downto 0)="00" then
											is_seeking_FACE_A:=true;
										elsif actualDrive(1 downto 0)="01" then
											is_seeking_FACE_B:=true;
										end if;
										actualDrive(2):='0';
										memshark_chrn<=x"00000002";
										memshark_doGOTO<=true;
										memshark_doGOTO_T<=true;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
								elsif action=ACTION_READ_ID then
									rcount:=7;
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										chrn(2):="0000000" & actualDrive(2); -- H
										chrn(0):=BLOCK_SIZE;
										memshark_chrn<=setCHRN(chrn);
										memshark_doGOTO<=true;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
--								elsif action=ETAT_READ_DIAGNOSTIC then
--									-- TODO : do read from index to end of track ?
--									BOT:=params(4);
--									EOT:=params(2); -- EOT = R
--									chrn(3):=params(6); -- C
--									chrn(2):=params(5); -- H
--									chrn(1):=params(4); -- R
--									chrn(0):=BLOCK_SIZE; --params(3); -- N
--									-- params select C H R N EOT GPL DTL
--									if params(3)>0 then -- N
--										EOT_DTL:=SECTOR_SIZE;
--										exec_restant:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
--										dtl:=SECTOR_SIZE;
--										memshark_DTL<=dtl;
--									else
--										EOT_DTL:=conv_integer(params(0))+1; -- DTL
--										if BOT/=EOT then
--											exec_restant:=SECTOR_SIZE;
--										else
--											exec_restant:=EOT_DTL; -- DTL
--										end if;
--										--dtl:=conv_integer(params(0))+1; -- we don't call write cmd for nothing, so dtl=0 is for something : 1 byte, and FF is for 512 bytes
--										dtl:=SECTOR_SIZE;
--										memshark_DTL<=dtl;
--									end if;
--									-- params select C H R N EOT GPL DTL
--								
--									rcount:=7;
--									
--									if current_face_notReady then
--										-- disk not inserted
--										etat_zap := true;
--									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
--										-- let's go
--										dtl:=SECTOR_SIZE;
--										memshark_DTL<=dtl;
--										memshark_chrn<=setCHRN(chrn);
--										memshark_doREAD<=true; -- special : EOT is a sector id here
--										etat_wait := true;
--										etat_zap := false;
--									else
--										-- system not ready
--										etat_wait := true;
--										etat_zap := false;
--									end if;
--									
								elsif action=ACTION_SCAN then
									BOT:=params(4);
									EOT:=params(2); -- EOT = R
									chrn(3):=params(6); -- C
									chrn(2):=params(5); -- H
									chrn(1):=params(4); -- R
									chrn(0):=BLOCK_SIZE; -- N
									-- params select C H R N EOT GPL DTL
									if params(3)>x"00" then -- N
										is_EOT_DTL:=false;
										if is_multitrack then
											exec_restant_write:=SECTOR_SIZE_MT;
										else
											exec_restant_write:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
										end if;
									else
										is_EOT_DTL:=true;
										EOT_DTL:=conv_integer(params(0)); -- DTL
										if BOT=EOT then
											exec_restant_write:=EOT_DTL; -- DTL
											--memshark_DTL<=EOT_DTL;
										elsif is_multitrack then
											exec_restant_write:=SECTOR_SIZE_MT;
										else
											exec_restant_write:=SECTOR_SIZE;
											--memshark_DTL<=EOT_DTL;
										end if;
										--dtl:=conv_integer(params(0))+1; -- we don't call write cmd for nothing, so dtl=0 is for something : 1 byte, and FF is for 512 bytes
									end if;
									current_byte:=0;
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- on lance une tentative de lecture du block en parallele
										memshark_chrn<=setCHRN(chrn);
										memshark_doREAD<=true;
										memshark_doREAD_DEL<=is_del;
										memshark_doREAD_SK<=is_sk;
										memshark_doREAD_MT<=is_multitrack;
										etat_wait := true;
										etat_zap := false;
										compare_OK:=true;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
									-- pointer charger le premier octet (tout de suite ou apres la sortie d'un PHASE_WAIT_*)
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,10);
									block_W_cortex_mem:='0';
								elsif action=ACTION_READ then
									BOT:=params(4);
									EOT:=params(2); -- EOT = R
									chrn(3):=params(6); -- C
									chrn(2):=params(5); -- H
									chrn(1):=params(4); -- R
									chrn(0):=BLOCK_SIZE; -- N
									-- params select C H R N EOT GPL DTL
									if params(3)>x"00" then -- N
										is_EOT_DTL:=false;
										if is_multitrack then
											exec_restant:=SECTOR_SIZE_MT;
										else
											exec_restant:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
										end if;
									else
										is_EOT_DTL:=true;
										EOT_DTL:=conv_integer(params(0));
										if BOT=EOT then
											exec_restant:=EOT_DTL; -- DTL
											--memshark_DTL<=EOT_DTL;
										elsif is_multitrack then
											exec_restant:=SECTOR_SIZE_MT;
										else
											exec_restant:=SECTOR_SIZE;
											--memshark_DTL<=0;
										end if;
										--dtl:=conv_integer(params(0))+1; -- we don't call write cmd for nothing, so dtl=0 is for something : 1 byte, and FF is for 512 bytes
									end if;
									current_byte:=0;
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- on lance une tentative de lecture du block en parallele
										memshark_chrn<=setCHRN(chrn);
										memshark_doREAD<=true;
										memshark_doREAD_DEL<=is_del;
										memshark_doREAD_SK<=is_sk;
										memshark_doREAD_MT<=is_multitrack;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
									-- pointer charger le premier octet (tout de suite ou apres la sortie d'un PHASE_WAIT_*)
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,10);
									block_W_cortex_mem:='0';
								elsif action=ACTION_SEEK then -- no result
									-- params select NCN
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										if actualDrive(1 downto 0)="00" then
											is_seeking_FACE_A:=true;
										elsif actualDrive(1 downto 0)="01" then
											is_seeking_FACE_B:=true;
										end if;
										chrn(3):=params(0); -- C = param NCN
										chrn(2):="0000000" & actualDrive(2); -- H
										chrn(1):=TRACK_00; -- R
										chrn(0):=BLOCK_SIZE; -- N
										memshark_chrn<=setCHRN(chrn);
										memshark_doGOTO<=true;
										memshark_doGOTO_T<=true;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
								elsif action=ETAT_SENSE_DRIVE_STATUS then
									rcount:=1;
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										chrn(2):="0000000" & actualDrive(2); -- H
										chrn(0):=BLOCK_SIZE;
										memshark_chrn<=setCHRN(chrn);
										memshark_doGOTO<=true;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
								elsif action=ACTION_WRITE then
									BOT:=params(4);
									EOT:=params(2); -- R (EOT)
									chrn(3):=params(6); -- C
									chrn(2):=params(5); -- H
									chrn(1):=params(4); -- R
									chrn(0):=BLOCK_SIZE; -- N
									-- params select C H R N EOT GPL DTL
									if params(3)>x"00" then -- N
										is_EOT_DTL:=false;
										if is_multitrack then
											exec_restant_write:=SECTOR_SIZE_MT;
										else
											exec_restant_write:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
										end if;
									else
										is_EOT_DTL:=true;
										EOT_DTL:=conv_integer(params(0)); -- DTL
										if BOT=EOT then
											exec_restant_write:=EOT_DTL; -- DTL
											--memshark_DTL<=EOT_DTL;
										elsif is_multitrack then
											exec_restant_write:=SECTOR_SIZE_MT;
										else
											exec_restant_write:=SECTOR_SIZE;
											--memshark_DTL<=EOT_DTL;
										end if;
									end if;
									current_byte:=0;
									
									if current_face_notReady then
										-- disk not inserted
										exec_restant:=0;
										rcount:=7;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										etat_wait := false; -- cool, no action at this step, goto next step.
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
								end if;
								if exec_restant>0 then
									if etat_wait then
										phase<=PHASE_WAIT_EXECUTION_READ; -- we switch into execution_read
									else
										phase<=PHASE_EXECUTION_READ;
									end if;
								elsif exec_restant_write>0 then
									if etat_wait then
										phase<=PHASE_WAIT_EXECUTION_WRITE;
									else
										phase<=PHASE_EXECUTION_WRITE;
									end if;
								elsif rcount>0 then
									if etat_wait then
										phase<=PHASE_WAIT_RESULT; -- we switch into RESULT
									else
										phase<=PHASE_RESULT;
									end if;
								else
									if etat_wait then
										-- This case does really exists, proof : action=ACTION_POLL, command recalibrate()
										phase<=PHASE_WAIT_ATTENTE_COMMANDE;
									else
										phase<=PHASE_ATTENTE_COMMANDE;
									end if;
								end if;
							end if;
						end if;
					end if;

			end if; --do_update

			if phase=PHASE_AFTER_EXECUTION_WRITE then
				-- special
				if current_face_notReady then
					-- disk not inserted
					exec_restant:=0;
					rcount:=7;
					phase<=PHASE_RESULT;
				elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					if EOT=BOT and is_EOT_DTL and EOT_DTL=0 then
						-- nothing to write here...
						etat_wait:=false;
						etat_zap := false;
						phase<=PHASE_RESULT;
					elsif EOT=BOT then
						if is_EOT_DTL then
							memshark_is_DTL<=true;
						else
							memshark_is_DTL<=false;
						end if;
						memshark_chrn<=setCHRN(chrn);
						memshark_doWRITE<=true;
						memshark_doWRITE_DEL<=is_del;
						memshark_doWRITE_MT<=is_multitrack;
						etat_wait:=true;
						etat_zap := false;
						phase<=PHASE_WAIT_RESULT;
					else
						-- one more time :)
						memshark_is_DTL<=false;
						memshark_chrn<=setCHRN(chrn);
						memshark_doWRITE<=true;
						memshark_doWRITE_DEL<=is_del;
						memshark_doWRITE_MT<=is_multitrack;
						BOT:=BOT+1;
						if EOT=BOT and is_EOT_DTL then
							exec_restant_write:=EOT_DTL;
						elsif is_multitrack then
							exec_restant_write:=SECTOR_SIZE_MT;
						else
							exec_restant_write:=SECTOR_SIZE;
						end if;
						chrn(1):=BOT; -- later.
						etat_wait:=true;
						etat_zap := false;
						phase<=PHASE_WAIT_EXECUTION_WRITE;
						current_byte:=0;
					end if;
				else
					-- system not ready
					etat_wait := true;
					etat_zap := false;
					phase<=PHASE_WAIT_RESULT;
				end if;
			end if;
			
			wasIO_RD:=IO_RD;
			wasIO_WR:=IO_WR;
			
			memshark_DTL<=EOT_DTL;
			
			block_A_cortex<=block_A_cortex_mem;
			block_Din_cortex<=block_Din_cortex_mem;
			block_W_cortex<=block_W_cortex_mem;
			
		
	end if;
end process cortex;


end Behavioral;
