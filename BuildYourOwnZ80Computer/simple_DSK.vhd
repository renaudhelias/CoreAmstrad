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

			  cafe:in std_logic;
			  DSK_select : out STD_LOGIC_VECTOR (7 downto 0) := (others=>'0');
			  change : out std_logic := '1';

			  is_dskReady : in std_logic_vector(1 downto 0);
			  
			  megashark_CHRNresult : in STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_doGOTO : out STD_LOGIC_VECTOR(2 downto 0); -- not a W/R operation finally
			  megashark_CHRN : out STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : out std_logic_vector(8 downto 0); -- sector byte selection : 512B block
			  megashark_Din : in std_logic_vector(7 downto 0);
			  megashark_Dout : out std_logic_vector(7 downto 0);
			  megashark_doREAD : out std_logic;
			  megashark_doWRITE : out std_logic;
			  megashark_done : in std_logic;
			  megashark_face : out std_logic:='0';
			  megashark_INFO_2SIDES : in std_logic;
			  megashark_INFO_ST1 : in std_logic_vector(7 downto 0); -- contains also ST1_END_OF_CYLINDER and ST1_NO_DATA
			  megashark_INFO_ST2 : in std_logic_vector(7 downto 0)
			  );
end simple_DSK;

architecture Behavioral of simple_DSK is

	constant SECTOR_SIZE:integer:=512; -- some protected format seen with SECTOR_SIZES(6) value
	--constant sampleSector : STD_LOGIC_VECTOR(8*16*2-1 downto 0) := x"004441525453313830A020200000004902030405060708090A0B000000000000";

	constant REQ_MASTER : STD_LOGIC_VECTOR (7 downto 0):=x"80";
	constant DATA_IN_OUT : STD_LOGIC_VECTOR (7 downto 0):=x"40";
	constant COMMAND_BUSY : STD_LOGIC_VECTOR (7 downto 0):=x"10";
	constant EXEC_MODE : STD_LOGIC_VECTOR (7 downto 0):=x"20";
	constant FDD_BUSY : STD_LOGIC_VECTOR (7 downto 0):=x"0F";

	signal status:STD_LOGIC_VECTOR (7 downto 0):=REQ_MASTER;
	
	constant ST0_INVALID_COMMAND_ISSUE : std_logic_vector(7 downto 0):=x"80";
	constant ST0_ABNORMAL : std_logic_vector(7 downto 0):=x"40";
	constant ST0_SEEK_END : std_logic_vector(7 downto 0):=x"20";
	constant ST0_EQUIPMENT_CHECK : std_logic_vector(7 downto 0):=x"10"; -- RECALIBRATE (SEEK 0) cmd fail
	constant ST0_NOT_READY : std_logic_vector(7 downto 0):=x"08";
	-- + current_HUS
	
	constant ST1_END_OF_CYLINDER : std_logic_vector(7 downto 0):=x"80";
	constant ST1_DATA_ERROR : std_logic_vector(7 downto 0):=x"20"; -- protected dsk
	constant ST1_OVERRUN : std_logic_vector(7 downto 0):=x"10"; -- protected dsk
	constant ST1_NO_DATA : std_logic_vector(7 downto 0):=x"04";
	constant ST1_NOT_WRITABLE : std_logic_vector(7 downto 0):=x"02";
	constant ST1_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01"; -- protected dsk
	
	constant ST2_SCAN_EQUAL_HIT : std_logic_vector(7 downto 0):=x"08";
	constant ST2_SCAN_NOT_SATISFIED : std_logic_vector(7 downto 0):=x"04";
	constant ST2_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01"; -- protected dsk
	
	constant ST3_WRITE_PROTECTED : std_logic_vector(7 downto 0):=x"40";
	constant ST3_READY : std_logic_vector(7 downto 0):=x"20";
	constant ST3_TRACK_ZERO : std_logic_vector(7 downto 0):=x"10";
	constant ST3_2SIDES : std_logic_vector(7 downto 0):=x"08";
	-- + current_HUS
	
	constant ETAT_OSEF:integer range 0 to 8:=0;
	--constant ETAT_READ_DIAGNOSTIC:integer range 0 to 9:=1;
	constant ETAT_READ:integer range 0 to 8:=1;
	constant ETAT_SEEK:integer range 0 to 8:=2;
	constant ETAT_WRITE:integer range 0 to 8:=3;
	constant ETAT_RECALIBRATE:integer range 0 to 8:=4;
	constant ETAT_READ_ID:integer range 0 to 8:=5;
	constant ETAT_SENSE_DRIVE_STATUS:integer range 0 to 8:=6;
	constant ETAT_SENSE_INTERRUPT_STATUS:integer range 0 to 8:=7;
	constant ETAT_COMPARE:integer range 0 to 8:=8;
	
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
	signal memshark_doGOTO_MT:boolean:=false;
	signal memshark_doREAD:boolean:=false;
	signal memshark_doWRITE:boolean:=false;
	signal memshark_DTL:integer range 0 to SECTOR_SIZE-1:=0;
	signal memshark_is_DTL:boolean:=false;
	signal memshark_done:boolean:=true;
	
	signal block_Din:std_logic_vector(7 downto 0);
	signal block_Din_megashark:std_logic_vector(7 downto 0);
	signal block_Din_cortex:std_logic_vector(7 downto 0);
	signal block_Dout:std_logic_vector(7 downto 0);
	signal block_A:std_logic_vector(8 downto 0);
	signal block_A_megashark:std_logic_vector(8 downto 0);
	signal block_A_cortex:std_logic_vector(8 downto 0);
	signal block_W:std_ulogic;
	signal block_W_megashark:std_ulogic:='0';
	signal block_W_cortex:std_ulogic:='0';

	signal megashark_doGOTO_s:std_logic_vector(2 downto 0):="000";
	signal megashark_doREAD_s:std_logic:='0';
	signal megashark_doWRITE_s:std_logic:='0';
	
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
status <= REQ_MASTER when phase = PHASE_ATTENTE_COMMANDE
	else REQ_MASTER or COMMAND_BUSY when phase = PHASE_COMMAND
	else               COMMAND_BUSY or EXEC_MODE or DATA_IN_OUT when phase = PHASE_WAIT_EXECUTION_READ
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE or DATA_IN_OUT when phase = PHASE_EXECUTION_READ
	else               COMMAND_BUSY or EXEC_MODE when phase = PHASE_WAIT_EXECUTION_WRITE
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE when phase = PHASE_EXECUTION_WRITE
	else               COMMAND_BUSY or EXEC_MODE when phase = PHASE_AFTER_EXECUTION_WRITE
	else               COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_WAIT_RESULT
	else REQ_MASTER or COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_RESULT
	else               COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_WAIT_ATTENTE_COMMANDE
	else REQ_MASTER;

-- cafe purpose is about selecting a dsk in root folder without using OSD, is for development purpose.
change<='1';-- "out &cafe,3" does need reset key pressed ("page up" key)





 RAMB16_S9_inst : altera_syncram
 generic map (
   abits =>9,
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
megashark:process(nCLK4_1,reset)
	--variable newDskInserted : boolean := true;
	variable chrn_mem:STD_LOGIC_VECTOR(4*8-1 downto 0):=(others=>'0');
	variable memshark_counter:integer range 0 to 511; --std_logic_vector(8 downto 0):=(others=>'0');
	variable memshark_step:integer range 0 to 9;
	variable block_A_megashark_mem:std_logic_vector(block_A_megashark'range):=(others=>'0');
	variable block_Din_megashark_mem:std_logic_vector(block_Din_megashark'range):=(others=>'0');
	variable block_W_megashark_mem:std_logic:='0';
	variable megashark_A_mem:std_logic_vector(megashark_A'range):=(others=>'0');
	variable megashark_Dout_mem:std_logic_vector(megashark_Dout'range):=(others=>'0');
	variable doGOTO_mem:std_logic_vector(2 downto 0):="000";
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
			doGOTO_mem:="001";
			if memshark_doGOTO_T then
				doGOTO_mem(1):='1';
			elsif memshark_doGOTO_MT then
				doGOTO_mem(2):='1';
			end if;
			memshark_step:=0;
		elsif memshark_doREAD then
			-- READ CHRN : here R is sector id (x"C1"...), READ_DIAGNOSTIC do use EOT parameter, that is a sector id, so I doREAD when READ_DIAGNOSTIC command is called, instead of launching doGOTO.
			memshark_done<=false;
			memshark_step:=3;
		elsif memshark_doWRITE then
			memshark_done<=false;
			memshark_step:=6;
		end if;
		
		megashark_doGOTO_s<="000";
		megashark_doREAD_s<='0';
		megashark_doWRITE_s<='0';
		
		block_W_megashark_mem:='0'; -- we write only one time
		if not(memshark_done) then
			if megashark_done='1' and megashark_doGOTO_s(0)='0' and megashark_doREAD_s='0' and megashark_doWRITE_s='0' then
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
						megashark_A<=conv_std_logic_vector(memshark_counter,9);
						megashark_doREAD_s<='1';
						memshark_step:=4;
					when 4=>
						block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,9);
						block_Din_megashark_mem:=megashark_Din;
						--if memshark_counter<16*2 then
						--	block_Din_megashark_mem:=sampleSector((16*2-memshark_counter)*8-1 downto (16*2-memshark_counter-1)*8);
						--else
						--	block_Din_megashark_mem:=x"E5";
						--end if;
						block_W_megashark_mem:='1';
						if memshark_counter = 511 then
							memshark_step:=5;
						else
							megashark_CHRN<=chrn_mem;
							memshark_counter:=memshark_counter+1;
							megashark_A<=conv_std_logic_vector(memshark_counter,9);
							megashark_doREAD_s<='1';
						end if;
					when 5=>
						chrn_mem:=megashark_CHRNresult;
						memshark_step:=2;
						
					when 6=> -- WRITE memshark_chrn
						-- just wait one tic that I can read block_A_megashark_mem
						chrn_mem:=memshark_chrn;
						megashark_CHRN<=chrn_mem;
						memshark_counter:=0;
						block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,9);
						block_W_megashark_mem:='0';
						memshark_step:=9;
					when 9=>
						chrn_mem:=memshark_chrn;
						megashark_CHRN<=chrn_mem;
							-- just wait MORE THAN one tic that I can read block_A_megashark_mem
							megashark_Dout_mem:=block_Dout;
							megashark_Dout<=megashark_Dout_mem;
							megashark_A_mem:=conv_std_logic_vector(memshark_counter,9);
							megashark_A<=megashark_A_mem;
							megashark_doWRITE_s<='1';
						memshark_counter:=0;
						block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,9);
						block_W_megashark_mem:='0';
						memshark_step:=7;
					when 7=>
						if not(memshark_is_DTL) and memshark_counter = 511 then
							-- fin de non DTL
							megashark_CHRN<=chrn_mem;
							megashark_Dout_mem:=block_Dout;
							megashark_Dout<=megashark_Dout_mem;
							megashark_A_mem:=conv_std_logic_vector(memshark_counter,9);
							megashark_A<=megashark_A_mem;
							megashark_doWRITE_s<='1';
							memshark_step:=8;
						else
							megashark_CHRN<=chrn_mem;
							megashark_Dout_mem:=block_Dout;
							megashark_Dout<=megashark_Dout_mem;
							megashark_A_mem:=conv_std_logic_vector(memshark_counter,9);
							megashark_A<=megashark_A_mem;
							megashark_doWRITE_s<='1';
							memshark_counter:=memshark_counter+1;
							if memshark_is_DTL and memshark_counter = memshark_DTL then
								-- fin de DTL...
								memshark_step:=8;
							else
								block_A_megashark_mem:=conv_std_logic_vector(memshark_counter,9);
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





cortex:process(nCLK4_1,reset)
	variable current_byte:integer range 0 to 511;
	--type sector_size_type is array(0 to 4) of integer;
	--constant SECTOR_SIZES:sector_size_type:=(128,256,512,1024,2048);--(x"80",x"100",x"200",x"400",x"800",x"1000",x"1800");
	--variable dtl:integer range 0 to SECTOR_SIZE-1:=0; -- against Drive <drive>: disc changed, closing <filename>	The user has changed the disc while files were still open on it.
	
	type params_type is array(0 to 7) of std_logic_vector(7 downto 0);
	type results_type is array(0 to 6) of std_logic_vector(7 downto 0);
	variable command_restant:integer range 0 to 8;
	variable params:params_type; -- stack of params
	variable exec_restant:integer;
	variable exec_restant_write:integer;
	variable result_restant:integer range 0 to 7;
	variable results:results_type; -- stack of results
	type chrn_type is array(3 downto 0) of std_logic_vector(7 downto 0);
	variable chrn:chrn_type;

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

	variable etat:integer range 0 to 8;
	variable check_dsk_face:boolean:=false;
	variable etat_wait:boolean:=false; -- memshark is busy or out of synchro (work in progress, do generate a ST0/ST1 failing for this round)
	variable etat_zap:boolean:=false;
	variable command:std_logic_vector(7 downto 0);
	variable is_multitrack:boolean:=false;
	
	variable data:std_logic_vector(7 downto 0);
	variable was_concerned:boolean:=false;
	variable do_update:boolean;

	variable DSK_select_mem:std_logic_vector(7 downto 0);
	
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
	variable current_HUS:std_logic_vector(7 downto 0):=(others=>'0'); -- H + US + US
	variable ST1:std_logic_vector(7 downto 0):=(others=>'0');
	variable ST2:std_logic_vector(7 downto 0):=(others=>'0');
	variable ST3:std_logic_vector(7 downto 0):=(others=>'0');
	variable ONE_BLOCK:std_logic_vector(7 downto 0):=x"01";
	variable BLOCK_SIZE:std_logic_vector(7 downto 0):=x"02";
	variable TRACK_00:std_logic_vector(7 downto 0):=x"00";
	variable EOT:std_logic_vector(7 downto 0):=(others=>'0');
	variable EOT_DTL:integer range 0 to SECTOR_SIZE-1:=0;
	variable is_EOT_DTL:boolean:=false; -- FIXME
	variable BOT:std_logic_vector(7 downto 0):=(others=>'0');
	variable block_A_cortex_mem:std_logic_vector(block_A_cortex'range):=(others=>'0');
	variable block_Din_cortex_mem:std_logic_vector(block_Din_cortex'range):=(others=>'0');
	variable block_W_cortex_mem:std_logic:='0';
	
	--variable current_face:std_logic:='0';
	variable current_face_notReady:boolean:=true;
	
	variable compare_low:boolean:=false;
	variable compare_high:boolean:=false;
	variable compare_OK:boolean:=false;
	
	variable is_seeking_FACE_A:boolean:=false;
	variable is_seeking_FACE_B:boolean:=false;
	variable is_issue:boolean:=false; -- not is_seeking but bad command result
begin

	if reset='1' then
		D_result<=(others=>'1');

		current_byte:=0;
		command_restant:=0;
		exec_restant:=0;
		result_restant:=0;
		etat:=ETAT_OSEF;
		data:=(others=>'0');
		
		was_concerned:=false;
		do_update:=false;
		phase<=PHASE_ATTENTE_COMMANDE;
		etat_wait:=false;
	elsif rising_edge(nCLK4_1) then --CLK4
	
			memshark_doGOTO<=false;
			memshark_doGOTO_T<=false;
			memshark_doGOTO_MT<=false;
			memshark_doREAD<=false;
			memshark_doWRITE<=false;
			
	
			if current_HUS(0)='0' and is_dskReady(0) = '1' then
				current_face_notReady:=false;
			elsif current_HUS(0)='1' and is_dskReady(1) = '1' then
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
					current_HUS(2):=megashark_CHRNresult(16); -- side (one side only ?)
					chrn:=getCHRN(megashark_CHRNresult); -- C (from SEEK command ask)
					etat_wait:=false;
					phase <= PHASE_ATTENTE_COMMANDE;
				elsif phase = PHASE_WAIT_EXECUTION_READ and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					current_HUS(2):=megashark_CHRNresult(16); -- side (one side only ?)
					etat_wait:=false;
					phase <= PHASE_EXECUTION_READ;
				elsif phase = PHASE_WAIT_EXECUTION_WRITE and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					current_HUS(2):=megashark_CHRNresult(16); -- side (one side only ?)
					etat_wait:=false;
					phase <= PHASE_EXECUTION_WRITE;
				elsif phase = PHASE_WAIT_RESULT and memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
					-- that's all folks !
					current_HUS(2):=megashark_CHRNresult(16); -- side (one side only ?)
					etat_wait:=false;
					phase <= PHASE_RESULT;
				end if;
			end if;
	
			if current_face_notReady then
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
				ST0:=ST0_ABNORMAL or ST0_NOT_READY or current_HUS;
				ST1:=ST1_NO_DATA or ST1_MISSING_ADDR;-- or megashark_INFO_ST1;
				ST2:=x"00";
			elsif etat_wait then
				ST0:=ST0_ABNORMAL or ST0_NOT_READY or current_HUS; -- do press retry to test :/
				ST1:=ST1_NO_DATA or ST1_MISSING_ADDR;-- or megashark_INFO_ST1;
				ST2:=x"00";
			else
				ST1:=megashark_INFO_ST1;
				ST2:=megashark_INFO_ST2;
				-- TEST : |a |b |a using ss40t in drive A: and ds80t DOS D2 in drive B:
				-- RESULT : crash due to ST0_ABNORMAL returned in a simple READ_ID cmd...
--				if ST1(0)='1' then
--					--ST1_MISSING_ADDR
--					ST0:=ST0_ABNORMAL or current_HUS;
--				else
					ST0:=current_HUS;
--				end if;
			end if;
			if megashark_INFO_2SIDES='1' then
				ST3:=ST3_READY or current_HUS;
			else
				-- JavaCPC : 2T is at '1' if it is a simple sided dsk...
				ST3:=ST3_READY or ST3_2SIDES or current_HUS;
			end if;
	
			if cafe='1' and (wasIO_WR='0' and IO_WR='1') then
				-- out &cafe,dskNumber
				DSK_select_mem:=D_command;
				DSK_select<=DSK_select_mem;
			end if;
			if ((wasIO_RD='0' and IO_RD='1') or (wasIO_WR='0' and IO_WR='1')) and A10_A8_A7=b"010"  then
				-- I am concerned
				do_update:=true;
			elsif ((wasIO_RD='1' and IO_RD='1') or (wasIO_WR='1' and IO_WR='1')) and A10_A8_A7=b"010"  then
				-- dodo
				do_update:=false;
			else
				-- I am not concerned : unbind
				
				
				if cafe='1' and (IO_RD='1') then --wasIO_RD='0' and 
					-- print INP(&cafe)
					D_result<= DSK_select_mem;--"0000" & "000" & change_state;
				else
					D_result<=(others=>'1');
				end if;
				
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
						D_result<=status;
					elsif (IO_RD='1' and A10_A8_A7=b"010" and A0='1') then
						-- read data
						if phase=PHASE_EXECUTION_READ then
							if exec_restant>0 then
								exec_restant:=exec_restant-1;
							end if;
							if etat=ETAT_READ then
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
								if current_byte=511 then
									-- bug overflow !
									current_byte:=0;
								else
									current_byte:=current_byte+1;
								end if;
								if not(etat_wait) and not(etat_zap) then
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,9);
									block_W_cortex_mem:='0';
								end if;

								
								if exec_restant=0 then
									if EOT=BOT or etat_zap then
										if etat_wait then
											phase<=PHASE_WAIT_RESULT;
										else
											phase<=PHASE_RESULT;
										end if;
										result_restant:=7;
										results(6):=ST0; -- ST0
										results(5):=ST1; -- ST1
										results(4):=ST2; -- ST2
										results(3):=chrn(3); -- params(6); -- C
										results(2):=chrn(2); -- params(5); -- H
										results(1):=ONE_BLOCK; -- JavaCPC chrn(1); -- params(4); -- R
										results(0):=params(3); -- N (DTL applyed)
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
										end if;
									end if;
								end if;
								
							else
								-- HELL
							end if;
							
							
							
							
						
						elsif phase=PHASE_RESULT then
							if etat=ETAT_READ_ID and result_restant=7 then-- PARADOS second drive seem have serious problem (with same data and fixed sector id here, size of disk/file is different), perhaps more FDC instructions runs
								etat:=ETAT_OSEF;
								chrn:=getCHRN(megashark_CHRNresult);
								results(6):=ST0;
								results(5):=ST1; -- ST1 (I'm always fine)
								results(4):=ST2; -- ST2
								results(3):=chrn(3);
								results(2):=chrn(2);
								results(1):=chrn(1);
								results(0):=BLOCK_SIZE; --chrn(0);
							elsif etat=ETAT_SENSE_DRIVE_STATUS and result_restant=1 then
								etat:=ETAT_OSEF;
								chrn:=getCHRN(megashark_CHRNresult);
								if chrn(3)=0 then
									results(0):=ST3_TRACK_ZERO or ST3;
								else
									results(0):=ST3;
								end if;
--							elsif etat=ETAT_READ_DIAGNOSTIC and result_restant=7 then
--								etat:=ETAT_OSEF;
--								chrn:=getCHRN(megashark_CHRNresult);
--								results(6):=ST0;
--								results(5):=ST1; -- ST1 (I'm always fine : asynchronous/PHASE_WAIT_ATTENTE_COMMANDE, OK)
--								results(4):=ST2; -- ST2
--								results(3):=chrn(3);
--								results(2):=chrn(2);
--								results(1):=ONE_BLOCK; --chrn(1);
--								results(0):=chrn(0);
							elsif etat=ETAT_SENSE_INTERRUPT_STATUS  and result_restant=2 then
								etat:=ETAT_OSEF;
								--chrn:=getCHRN(megashark_CHRNresult); -- result of a previous seek/recalibrate
								if is_issue then
									results(1):=ST0 or ST0_INVALID_COMMAND_ISSUE; -- generaly just after a failing "read command"
									is_issue:=false;
									is_seeking_FACE_A:=false;
									is_seeking_FACE_B:=false;
								elsif current_HUS(0)='0' and is_seeking_FACE_A then
									results(1):=ST0 or ST0_SEEK_END; -- generaly just after a "recalibrate command" ST0_SEEK_END
									is_seeking_FACE_A:=false;
								elsif current_HUS(0)='1' and is_seeking_FACE_B then
									results(1):=ST0 or ST0_SEEK_END; -- generaly just after a "recalibrate command" ST0_SEEK_END
									is_seeking_FACE_B:=false;
								else
									results(1):=ST0;
								end if;
								results(0):=chrn(3); -- C -- PCN : Present Cylinder Number
							end if;
							
							if result_restant>0 then
							
								result_restant:=result_restant-1;
								
								data:=results(result_restant);
								D_result<=data;
								
								if result_restant=0 then
									if etat_wait then
										phase<=PHASE_WAIT_ATTENTE_COMMANDE;
									else
										phase<=PHASE_ATTENTE_COMMANDE;
									end if;
									etat:=ETAT_OSEF;
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
							if etat=ETAT_WRITE then
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								data:=D_command;
								if not(etat_wait) and not(etat_zap) then
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,9);
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
								if current_byte=511 then
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
									result_restant:=7;
									results(6):=ST0; -- ST0
									results(5):=ST1; -- ST1
									results(4):=ST2; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5); -- H
									results(1):=ONE_BLOCK; --params(2); -- R EOT
									results(0):=params(3); -- N (with DTL)
								end if;
							elsif etat=ETAT_COMPARE then
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								data:=D_command;
								if not(etat_wait) and not(etat_zap) then
									if compare_OK then
										if block_Dout=data then
											-- cool
										elsif compare_low and block_Dout<data then
											-- cool
										elsif compare_high and block_Dout>data then
											-- cool
										else
											compare_OK:=false;
										end if;
									end if;
								end if;
								if current_byte=511 then
									--overrun
									current_byte:=0;
								else
									current_byte:=current_byte+1;
								end if;
								
								if not(etat_wait) and not(etat_zap) then
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,9);
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
										result_restant:=7;
										results(6):=ST0; -- ST0
										results(5):=ST1; -- ST1
										if compare_OK then
											results(4):=ST2 or ST2_SCAN_EQUAL_HIT; -- ST2
										else
											results(4):=ST2 or ST2_SCAN_NOT_SATISFIED; -- ST2
										end if;
										results(3):=params(6); -- C
										results(2):=params(5); -- H
										results(1):=params(2); -- R EOT
										results(0):=params(3); -- N (with DTL)
									else
										BOT:=BOT+x"01";
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
											-- pointer charger le premier octet (tout de suite ou apres la sortie d'un PHASE_WAIT_*)
											block_A_cortex_mem:=conv_std_logic_vector(current_byte,9);
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
							else
								--back to normal state machine
								is_issue:=false;
							end if;
							
							-- result is facultative.
							phase<=PHASE_ATTENTE_COMMANDE;
							command_restant:=0;
							exec_restant:=0;
							exec_restant_write:=0;
							result_restant:=0;
							etat:=ETAT_OSEF;
							-- MT MF et SK (we don't care about theses 3 first bits)
							command:=D_command and x"1f";
							is_multitrack:=(D_command(7)='1');
							compare_OK:=false;
							case command is
								when x"03" => -- specify
									command_restant:=2;
									phase<=PHASE_COMMAND;
								when x"07" => -- recalibrate (==SEEK at C=0, 77 fois max)
									command_restant:=1;
									etat:=ETAT_RECALIBRATE;
									phase<=PHASE_COMMAND;
									check_dsk_face:=true;
									--is_seeking:=true;
								when x"08" => -- sense interrupt status : status information about the FDC at the end of operation
									result_restant:=2;
									if etat_wait then
										phase<=PHASE_WAIT_RESULT;
									else
										phase<=PHASE_RESULT;
									end if;
									etat:=ETAT_SENSE_INTERRUPT_STATUS;
									
								when x"0a" => -- read id
									command_restant:=1; -- select drive/side
									etat:=ETAT_READ_ID;
									check_dsk_face:=true;
									phase<=PHASE_COMMAND;
								when x"04" => -- SENSE DRIVE STATUS
									command_restant:=1;
									etat:=ETAT_SENSE_DRIVE_STATUS;
									check_dsk_face:=true;
									phase<=PHASE_COMMAND;
									
									
								when x"02" => -- read diagnostic
									etat:=ETAT_READ; --ETAT_READ_DIAGNOSTIC;
									phase<=PHASE_COMMAND;
									command_restant:=8;
									check_dsk_face:=true;
								when x"06" => -- read
									command_restant:=8;
									etat:=ETAT_READ;
									phase<=PHASE_COMMAND;
									check_dsk_face:=true;
								when x"0C" => -- read DELETED DATA
									command_restant:=8;
									etat:=ETAT_READ;
									phase<=PHASE_COMMAND;
									check_dsk_face:=true;
								when x"0f" => -- seek : changing track C
									phase<=PHASE_COMMAND;
									command_restant:=2;
									etat:=ETAT_SEEK;
									check_dsk_face:=true;
									--is_seeking:=true;
								when x"05" => -- write data
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_WRITE;
									check_dsk_face:=true;
								when x"09" => -- write DELETED DATA
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_WRITE;
									check_dsk_face:=true;
									
								when x"11" => -- SCAN EQUAL
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_COMPARE;
									compare_low:=false;
									compare_high:=false;
									check_dsk_face:=true;
								when x"19" => -- SCAN LOW OR EQUAL
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_COMPARE;
									compare_low:=true;
									compare_high:=false;
									check_dsk_face:=true;
								when x"1D" => -- SCAN HIGH OR EQUAL
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_COMPARE;
									compare_low:=false;
									compare_high:=true;
									check_dsk_face:=true;
									
								when x"10" => -- VERSION
									result_restant:=1;
									results(0):=ST0 or x"80"; -- 80H indicates 765A/A-2 as JavaCPC
									--results(0):=ST0 or x"90"; --90h indicates 765B
								when others => --INVALID
									--go to standby state
									result_restant:=1;
									results(0):=ST0 or ST0_INVALID_COMMAND_ISSUE; -- 80h
								
							end case;
						elsif phase=PHASE_COMMAND then
							if command_restant>0 then
								command_restant:=command_restant-1;
								params(command_restant):=D_command;
								if check_dsk_face then
									check_dsk_face:=false;
									-- HD : physical HEAD
									current_HUS(2 downto 0):=D_command(2 downto 0); -- HD US1 US0
									megashark_face<=current_HUS(0);
								end if;
							end if;
							if command_restant=0 then
								if etat=ETAT_RECALIBRATE then -- no results
									-- goto track 0 side 0
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										if current_HUS(0)='0' then
											is_seeking_FACE_A:=true;
										else
											is_seeking_FACE_B:=true;
										end if;
										current_HUS(2):='0';
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
								elsif etat=ETAT_READ_ID then
									result_restant:=7;
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										chrn(2):="0000000" & current_HUS(2); -- H
										chrn(0):=BLOCK_SIZE;
										memshark_chrn<=setCHRN(chrn);
										memshark_doGOTO<=true;
										memshark_doGOTO_MT<=is_multitrack;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
--								elsif etat=ETAT_READ_DIAGNOSTIC then
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
--									result_restant:=7;
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
								elsif etat=ETAT_COMPARE then
									BOT:=params(4);
									EOT:=params(2); -- EOT = R
									chrn(3):=params(6); -- C
									chrn(2):=params(5); -- H
									chrn(1):=params(4); -- R
									chrn(0):=BLOCK_SIZE; --params(3); -- N
									-- params select C H R N EOT GPL DTL
									if params(3)>x"00" then -- N
										is_EOT_DTL:=false;
										exec_restant_write:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										is_EOT_DTL:=true;
										EOT_DTL:=conv_integer(params(0)); -- DTL
										if BOT=EOT then
											exec_restant_write:=EOT_DTL; -- DTL
											--memshark_DTL<=EOT_DTL;
										else
											exec_restant_write:=SECTOR_SIZE;
											--memshark_DTL<=EOT_DTL;
										end if;
										--dtl:=conv_integer(params(0))+1; -- we don't call write cmd for nothing, so dtl=0 is for something : 1 byte, and FF is for 512 bytes
									end if;
									current_byte:=0;
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- on lance une tentative de lecture du block en parallele
										memshark_chrn<=setCHRN(chrn);
										memshark_doREAD<=true;
										etat_wait := true;
										etat_zap := false;
										compare_OK:=true;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
									-- pointer charger le premier octet (tout de suite ou apres la sortie d'un PHASE_WAIT_*)
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,9);
									block_W_cortex_mem:='0';
								elsif etat=ETAT_READ then
									BOT:=params(4);
									EOT:=params(2); -- EOT = R
									chrn(3):=params(6); -- C
									chrn(2):=params(5); -- H
									chrn(1):=params(4); -- R
									chrn(0):=BLOCK_SIZE; --params(3); -- N
									-- params select C H R N EOT GPL DTL
									if params(3)>x"00" then -- N
										is_EOT_DTL:=false;
										exec_restant:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										is_EOT_DTL:=true;
										EOT_DTL:=conv_integer(params(0));
										if BOT=EOT then
											exec_restant:=EOT_DTL; -- DTL
											--memshark_DTL<=EOT_DTL;
										else
											exec_restant:=SECTOR_SIZE;
											--memshark_DTL<=0;
										end if;
										--dtl:=conv_integer(params(0))+1; -- we don't call write cmd for nothing, so dtl=0 is for something : 1 byte, and FF is for 512 bytes
									end if;
									current_byte:=0;
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- on lance une tentative de lecture du block en parallele
										memshark_chrn<=setCHRN(chrn);
										memshark_doREAD<=true;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
									-- pointer charger le premier octet (tout de suite ou apres la sortie d'un PHASE_WAIT_*)
									block_A_cortex_mem:=conv_std_logic_vector(current_byte,9);
									block_W_cortex_mem:='0';
								elsif etat=ETAT_SEEK then -- no results
									-- params select NCN
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										if current_HUS(0)='0' then
											is_seeking_FACE_A:=true;
										else
											is_seeking_FACE_B:=true;
										end if;
										chrn(3):=params(0); -- C = param NCN
										chrn(2):="0000000" & current_HUS(2); -- H
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
								elsif etat=ETAT_SENSE_DRIVE_STATUS then
									result_restant:=1;
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
									elsif memshark_done and not (memshark_doGOTO or memshark_doREAD or memshark_doWRITE) then
										-- let's go
										chrn(2):="0000000" & current_HUS(2); -- H
										chrn(0):=BLOCK_SIZE;
										memshark_chrn<=setCHRN(chrn);
										memshark_doGOTO<=true;
										memshark_doGOTO_MT<=is_multitrack;
										etat_wait := true;
										etat_zap := false;
									else
										-- system not ready
										etat_wait := true;
										etat_zap := false;
									end if;
								elsif etat=ETAT_WRITE then
									BOT:=params(4);
									EOT:=params(2); -- R (EOT)
									chrn(3):=params(6); -- C
									chrn(2):=params(5); -- H
									chrn(1):=params(4); -- R
									chrn(0):=BLOCK_SIZE; --params(3); -- N
									-- params select C H R N EOT GPL DTL
									if params(3)>x"00" then -- N
										is_EOT_DTL:=false;
										exec_restant_write:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										is_EOT_DTL:=true;
										EOT_DTL:=conv_integer(params(0)); -- DTL
										if BOT=EOT then
											exec_restant_write:=EOT_DTL; -- DTL
											--memshark_DTL<=EOT_DTL;
										else
											exec_restant_write:=SECTOR_SIZE;
											--memshark_DTL<=EOT_DTL;
										end if;
									end if;
									current_byte:=0;
									
									if current_face_notReady then
										-- disk not inserted
										etat_zap := true;
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
								elsif result_restant>0 then
									if etat_wait then
										phase<=PHASE_WAIT_RESULT; -- we switch into RESULT
									else
										phase<=PHASE_RESULT;
									end if;
								else
									if etat_wait then
										-- This case does really exists, proof : etat=ETAT_OSEF, command recalibrate()
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
					etat_zap := true;
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
						etat_wait:=true;
						etat_zap := false;
						phase<=PHASE_WAIT_RESULT;
					else
						-- one more time :)
						memshark_is_DTL<=false;
						memshark_chrn<=setCHRN(chrn);
						memshark_doWRITE<=true;
						BOT:=BOT+1;
						if EOT=BOT and is_EOT_DTL then
							exec_restant_write:=EOT_DTL;
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
