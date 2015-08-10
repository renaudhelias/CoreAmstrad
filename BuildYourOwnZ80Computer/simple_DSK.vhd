library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Notes
--
--Before accessing a disk you should first "Recalibrate" the drive, that moves the head backwards until it reaches Track 0. (The Track 0 signal from the drive is sensed by the FDC and it initializes it's internal track counter for that drive to 0).
--
--On a 80 track drive you may need to repeat that twice because some models of the FDC stop after 77 steps and if your recalibrating from track 80 it will not recalibrate fully.
--
--Now if you want to format, read or write a sector on a specific track you must first Seek that track (command 0Fh). That'll move the read/write head to the physical track number. If you don't do that, then the FDC will attempt to read/write data to/from the current physical track, independenly of the specified logical Track-ID.
--
--The Track-, Sector-, and Head-IDs are logical IDs only. These logical IDs are defined when formatting the disk, and aren't required to be identical to the physical Track, Sector, or Head numbers. However, when reading or writing a sector you must specify the same IDs that have been used during formatting.
--
--Despite the confusing name, a sector with a "Deleted Data Address Mark" (DAM) is not deleted. The DAM-flag is just another ID-bit, and (if that ID-bit is specified correctly in the command) it can be read/written like normal data sectors.
--
--At the end of a successful read/write command, the program should send a Terminal Count (TC) signal to the FDC. However, in the CPC the TC pin isn't connected to the I/O bus, making it impossible for the program to confirm a correct operation. For that reason, the FDC will assume that the command has failed, and it'll return both Bit 6 in Status Register 0 and Bit 7 in Status Register 1 set. The program should ignore this error message.
--
--The CPC doesn't support floppy DMA transfers, and the FDCs Interrupt signal isn't used in the CPC also.
--
--Usually single sided 40 Track 3" disk drives are used in CPCs, whereas 40 tracks is the official specification, practically 42 tracks could be used (the limit is specific to the FDD, some support more tracks. 42 is a good maximum). The FDC controller can be used to control 80 tracks, and/or double sided drives also, even though AMSDOS isn't supporting such formats. AMSDOS is supporting a maximum of two disk drives only. 

entity simple_DSK is
	Generic (
		MAX_SECTORS:integer:=9;
		MAX_TRACKS:integer:=40; -- 40 par face 79+1
		PIF_SPEEDUP:boolean:=true
	);
    Port ( nCLK4_1 : in  STD_LOGIC;
           reset : in STD_LOGIC;
           A10_A8_A7 : in  STD_LOGIC_VECTOR (2 downto 0); -- chip select
           A0 : in  STD_LOGIC;-- data/status reg select
           IO_RD : in  STD_LOGIC;
           IO_WR : in  STD_LOGIC;
           D_command : in  STD_LOGIC_VECTOR (7 downto 0);
           D_result : inout  STD_LOGIC_VECTOR (7 downto 0);

			  cafe:in std_logic;
			  DSK_select : out STD_LOGIC_VECTOR (7 downto 0) := (others=>'0');
			  change : out std_logic := '1';

           dsk_A : out  STD_LOGIC_VECTOR (19 downto 0);
           dsk_W : out  STD_LOGIC;
           dsk_R : out  STD_LOGIC;
			  transmit : out STD_LOGIC; -- direct transmission between DSK and Z80 following dsk_A/dsk_R/dsk_W
			  is_dskReady : in std_logic;
			  is_ucpm : in std_logic
			  );
end simple_DSK;

architecture Behavioral of simple_DSK is
	constant REQ_MASTER : STD_LOGIC_VECTOR (7 downto 0):=x"80";
	constant DATA_IN_OUT : STD_LOGIC_VECTOR (7 downto 0):=x"40";
	constant COMMAND_BUSY : STD_LOGIC_VECTOR (7 downto 0):=x"10";
	constant EXEC_MODE : STD_LOGIC_VECTOR (7 downto 0):=x"20";

	signal status:STD_LOGIC_VECTOR (7 downto 0):=REQ_MASTER;
	
	constant ST0_SEEK_END : std_logic_vector(7 downto 0):=x"20";

	constant ST0_ABNORMAL : std_logic_vector(7 downto 0):=x"40";
	constant ST0_NOT_READY : std_logic_vector(7 downto 0):=x"08";
	constant ST1_NO_DATA : std_logic_vector(7 downto 0):=x"04";
	constant ST1_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01";
	
	constant ETAT_OSEF:integer range 0 to 4:=0;
	constant ETAT_READ_DIAGNOSTIC:integer range 0 to 4:=1;
	constant ETAT_READ:integer range 0 to 4:=2;
	constant ETAT_SEEK:integer range 0 to 4:=3;
	constant ETAT_WRITE:integer range 0 to 4:=4;
	
	constant PHASE_ATTENTE_COMMANDE:integer range 0 to 4:=0;
	constant PHASE_COMMAND:integer range 0 to 4:=1;
	constant PHASE_EXECUTION_READ:integer range 0 to 4:=2;
	constant PHASE_EXECUTION_WRITE:integer range 0 to 4:=3;
	constant PHASE_RESULT:integer range 0 to 4:=4;

	signal phase:integer range 0 to 4:=PHASE_ATTENTE_COMMANDE;
	
	constant NB_SECTOR_PER_PISTE:integer:=15; -- donc on n'en �crit pas plus entre deux INDEX
	constant NB_PISTE_PER_FACE:integer:=80;
	constant NB_FACE:integer:=2;
	
	
begin

--The Main Status register can be always read through Port FB7E. The other four Status Registers cannot be read directly, instead they are returned through the data register as result bytes in response to specific commands.
--
--Main Status Register (Port FB7E)
--
-- b0..3  DB  FDD0..3 Busy (seek/recalib active, until succesful sense intstat)
-- b4     CB  FDC Busy (still in command-, execution- or result-phase)
-- b5     EXM Execution Mode (still in execution-phase, non_DMA_only)
-- b6     DIO Data Input/Output (0=CPU->FDC, 1=FDC->CPU) (see b7)
-- b7     RQM Request For Master (1=ready for next byte) (see b6 for direction)

status <= REQ_MASTER when phase = PHASE_ATTENTE_COMMANDE
	else REQ_MASTER or COMMAND_BUSY when phase = PHASE_COMMAND
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE when phase = PHASE_EXECUTION_READ
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE or DATA_IN_OUT when phase = PHASE_EXECUTION_WRITE
	else REQ_MASTER or COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_RESULT
	else REQ_MASTER;

change<='1';-- when change_state='1' else '0';


-- vue qu'on doit prendre en compte directement les commandes demand�s par le z80
-- il va faloir g�rer la RAM directement
cortex:process(nCLK4_1,reset)
	variable current_track:integer range 0 to MAX_TRACKS;
	variable current_sector:integer range 0 to MAX_SECTORS;
	variable current_byte:integer;
	--type sector_size_type is array(0 to 4) of integer;
	--constant SECTOR_SIZES:sector_size_type:=(128,256,512,1024,2048);--(x"80",x"100",x"200",x"400",x"800",x"1000",x"1800");
	constant SECTOR_SIZE:integer:=512; -- les formats prot�g�s sont SECTOR_SIZES(6)
	
	type params_type is array(0 to 7) of std_logic_vector(7 downto 0);
	type results_type is array(0 to 6) of std_logic_vector(7 downto 0);
	variable command_restant:integer range 0 to 8;
	variable params:params_type; -- � empiler params(command_restant)
	variable exec_restant:integer;
	variable exec_restant_write:integer;
	variable result_restant:integer range 0 to 7;
	variable results:results_type; -- � d�piler results(result_restant)
	type chrn_type is array(0 to 3) of std_logic_vector(7 downto 0);
	variable chrn:chrn_type;
	-- track 0 ou +
	-- sector 0 ou +
	-- return [sectTrack,sectSize,sectId,sectSize]
	function getCHRN (track: in integer range 0 to MAX_TRACKS-1;sector: in integer range 0 to MAX_SECTORS-1;ucpm:std_logic) return chrn_type is
		variable chrn:chrn_type;
	begin
		--return (track_id(track),x"00",sector_ids_of_tracks(track,sector),sector_sizes_of_tracks(track,sector));
-- "C:/Users/freemac/BuildYourOwnZ80Computer/simple_DSK.vhd" line 170: Index value(s) does not match array range, simulation mismatch.
		if ucpm='1' then
			chrn:=(conv_std_logic_vector(track,8),x"00",conv_std_logic_vector(sector,8)+x"41",x"02");
		else
			chrn:=(conv_std_logic_vector(track,8),x"00",conv_std_logic_vector(sector,8)+x"C1",x"02");
		end if;
		return chrn;
	end getCHRN;
	-- retourne le pointeur dans memory
	function getData(chrn: in chrn_type) return std_logic_vector is
		variable address:std_logic_vector(19 downto 0); -- simulator Cannot access 'dsk_a' from inside pure function 'getdata'. --dsk_A'range);
		variable pff:std_logic_vector(7 downto 0);
	begin
		pff:="0000" & chrn(2)(3 downto 0);
		pff:=pff-1;
		address:=chrn(0)(5 downto 0) & chrn(1)(0) & pff(3 downto 0) & "0" & x"00";
		return address;
	end getData;
	variable etat:integer range 0 to 4;
	variable command:std_logic_vector(7 downto 0);
	variable dsk_A_mem:STD_LOGIC_VECTOR (dsk_A'range);
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
	variable ST0:std_logic_vector(7 downto 0):=ST0_SEEK_END;
	variable ST1:std_logic_vector(7 downto 0):=(others=>'0');
	variable ST2:std_logic_vector(7 downto 0):=(others=>'0');
	variable ST3:std_logic_vector(7 downto 0):=(others=>'0');
begin

	if reset='1' then
		D_result<=(others=>'Z');
		dsk_A<=(others=>'0');
		current_track:=0;
		current_sector:=0;
		current_byte:=0;
		command_restant:=0;
		exec_restant:=0;
		result_restant:=0;
		etat:=ETAT_OSEF;
		transmit<='0';
		dsk_R<='0';
		dsk_W<='0';
		data:=(others=>'0');
		
		was_concerned:=false;
		do_update:=false;
	elsif rising_edge(nCLK4_1) then --CLK4
	
			if is_dskReady='1' then
				ST0:=ST0_SEEK_END;
				ST1:=(others=>'0');
			else
				-- DSK NOT READY
				ST0:=ST0_SEEK_END or ST0_ABNORMAL or ST0_NOT_READY;
				ST1:=ST1_NO_DATA or ST1_MISSING_ADDR;
			end if;
	
			if cafe='1' and (wasIO_WR='0' and IO_WR='1') then
				-- out &cafe,dskNumber
				DSK_select_mem:=D_command;
				DSK_select<=DSK_select_mem;
			end if;
			if ((wasIO_RD='0' and IO_RD='1') or (wasIO_WR='0' and IO_WR='1')) and A10_A8_A7=b"010"  then
				
				do_update:=true;
--				-- I am concerned
--				if was_concerned then --and M1_n='1'
--					-- on touche surtout � rien
--					do_update:=false;
--					was_concerned:=true;
--				else
--					-- nouveau
--					do_update:=true;
--					was_concerned:=true;
--				end if;
			elsif ((wasIO_RD='1' and IO_RD='1') or (wasIO_WR='1' and IO_WR='1')) and A10_A8_A7=b"010"  then
				-- dodo
--				was_concerned:=false;
--				do_update:=false;
				do_update:=false;
			else
				-- I am not concerned : liberation entr�e/sorties
				dsk_R<='0';
				dsk_W<='0';
				transmit<='0';
				
				if cafe='1' and (IO_RD='1') then --wasIO_RD='0' and 
					-- print INP(&cafe)
					D_result<= DSK_select_mem;--"0000" & "000" & change_state;
				else
					D_result<=(others=>'Z');
				end if;
				
--				was_concerned:=false;
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
					transmit<='0';
					dsk_R<='0';
					dsk_W<='0';
					D_result<=(others=>'Z');
					if (IO_RD='1' and A10_A8_A7=b"010" and A0='0') then
						-- read status
						-- read status
						D_result<=status;
						transmit<='0';
					elsif (IO_RD='1' and A10_A8_A7=b"010" and A0='1') then
						-- read data
						if phase=PHASE_EXECUTION_READ then
							if exec_restant>0 then
								exec_restant:=exec_restant-1;
							end if;
							if etat=ETAT_READ then
								--transmit<='1';
								chrn:=getCHRN(current_track,current_sector,is_ucpm);
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								if current_byte>=SECTOR_SIZE then
									current_sector:=current_sector+1;
									--if sector_count_of_tracks(current_track)>=current_sector then
									if MAX_SECTORS=current_sector then
										current_sector:=0;
										current_track:=current_track+1;
										if MAX_TRACKS=current_track then
											current_track:=0; -- rotate XD
										end if;
									end if;
									current_byte:=0;
									chrn:=getCHRN(current_track,current_sector,is_ucpm);
								end if;
								dsk_A_mem:=getData(chrn)+current_byte;
								dsk_A<=dsk_A_mem;
								dsk_R<='1';
								transmit<='1';
								current_byte:=current_byte+1;
								
								
								
								if exec_restant=0 then
									phase<=PHASE_RESULT;
									result_restant:=7;
									results(6):=ST0; -- ST0
									results(5):=ST1; -- ST1
									results(4):=ST2; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5); -- H
									results(1):=params(4); -- R
									results(0):=params(3); -- N
								end if;
								
							else
								-- BIZARRE
							end if;
							
							
							
							
							
						
						elsif phase=PHASE_RESULT then
							if result_restant>0 then
								result_restant:=result_restant-1;
								data:=results(result_restant); -- d�pile
								D_result<=data;
								transmit<='0';
								if result_restant=0 then
									phase<=PHASE_ATTENTE_COMMANDE;
									etat:=ETAT_OSEF;
								end if;
							else
								-- BIZARRE
							end if;
						end if;
							
							
							
					
					elsif (IO_WR='1' and A10_A8_A7=b"010" and A0='0') then
						-- BIZARRE
					elsif (IO_WR='1' and A10_A8_A7=b"010" and A0='1') then
						-- write data
						
						if phase=PHASE_EXECUTION_WRITE then
							if exec_restant_write>0 then
								exec_restant_write:=exec_restant_write-1;
							end if;
							if etat=ETAT_WRITE then
								chrn:=getCHRN(current_track,current_sector,is_ucpm);
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								if current_byte>=SECTOR_SIZE then
									current_sector:=current_sector+1;
									--if sector_count_of_tracks(current_track)>=current_sector then
									if MAX_SECTORS=current_sector then
										current_sector:=0;
										current_track:=current_track+1;
										if MAX_TRACKS=current_track then
											current_track:=0; -- rotate XD
										end if;
									end if;
									current_byte:=0;
									chrn:=getCHRN(current_track,current_sector,is_ucpm);
								end if;
								dsk_A_mem:=getData(chrn)+current_byte;
								dsk_A<=dsk_A_mem;
								dsk_W<='1';
								data:=D_command;
								--dsk_info_D<=data;
								transmit<='1';
								current_byte:=current_byte+1;
							else
								-- BIZARRE
							end if;
						end if;
						-- au second tick
						
						-- write data
						if phase=PHASE_EXECUTION_WRITE then
							-- not implemented
							if etat=ETAT_WRITE then
								--transmit<='0';
								--dsk_W<='0';
								--dsk_info_D<=(others=>'Z');
								if exec_restant_write=0 then
									phase<=PHASE_RESULT;
									result_restant:=7;
									results(6):=ST0; -- ST0
									results(5):=ST1; -- ST1
									results(4):=ST2; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5); -- H
									results(1):=params(2); --params(4); -- R EOT
									results(0):=params(3); -- N
								end if;
							end if;
						elsif phase=PHASE_ATTENTE_COMMANDE then
							command_restant:=0;
							exec_restant:=0;
							exec_restant_write:=0;
							result_restant:=0;
							etat:=ETAT_OSEF;
							phase<=PHASE_ATTENTE_COMMANDE;
							-- MT MF et SK (les trois premiers bits de D on s'en fou)
							command:=D_command and x"1f";
							case command is
								when x"03" => -- specify
									command_restant:=2;
									phase<=PHASE_COMMAND;
								when x"07" => -- recalibrate
									command_restant:=1;
									phase<=PHASE_COMMAND;
									-- goto track 0
									current_track:=0;
									current_sector:=0;
								when x"08" => -- sense interrupt status : status information about the FDC at the end of operation
									result_restant:=2;
									phase<=PHASE_RESULT;
									results(1):=ST0;
									results(0):=conv_std_logic_vector(current_track,8); -- PCN : Present Cylinder Number
								when x"0a" => -- read id
									command_restant:=1; -- select drive/side : osef
									chrn:=getCHRN(current_track,current_sector,is_ucpm);
									result_restant:=7;
									phase<=PHASE_COMMAND;
									results(6):=ST0;
									results(5):=ST1; -- ST1
									results(4):=ST2; -- ST2
									results(3):=chrn(0);
									results(2):=chrn(1);
									results(1):=chrn(2);
									results(0):=chrn(3);
								when x"04" => -- SENSE DRIVE STATUS
									command_restant:=1; -- osef
									phase<=PHASE_COMMAND;
									result_restant:=1;
									results(0):=ST3;
								when x"02" => -- read diagnostic
									etat:=ETAT_READ_DIAGNOSTIC;
									phase<=PHASE_COMMAND;
									command_restant:=8; -- dont EOT qui d�termine jusqu'o� il faut lire buffer
								when x"06" => -- read
									command_restant:=8;
									etat:=ETAT_READ;
									phase<=PHASE_COMMAND;
								when x"0f" => -- seek : changement de track
									phase<=PHASE_COMMAND;
									command_restant:=2;
									etat:=ETAT_SEEK;


								when x"05" => -- write data
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_WRITE;
									
									
									
								when others => --INVALID
									--go to standby state
									result_restant:=1;
									-- try to undo OVERRUN locked state
									--ST0:=ST0_SEEK_END;
									results(0):=ST0;
								
							end case;
						elsif phase=PHASE_COMMAND then
							if command_restant>0 then
								command_restant:=command_restant-1;
								params(command_restant):=D_command;
							end if;
							if command_restant=0 then
								if etat=ETAT_READ_DIAGNOSTIC then
									-- params select C H R N EOT GPL DTL
									result_restant:=7;
									results(6):=ST0;
									results(5):=ST1; -- ST1
									results(4):=ST2; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5);-- H
									results(1):=params(2); -- EOT as sector_id
									current_track:=conv_integer(params(6));
									current_sector:=conv_integer(params(2)(3 downto 0))-1;
									--results(0):=sector_sizes_of_tracks(current_track,current_sector); -- N
									results(0):=x"02"; -- N
								elsif etat=ETAT_READ then
									-- params select C H R N EOT GPL DTL
									if params(3)>0 then -- N
										exec_restant:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										exec_restant:=conv_integer(params(0));
									end if;
									current_track:=conv_integer(params(6));
									current_sector:=conv_integer(params(4)(3 downto 0))-1;
									current_byte:=0;
								elsif etat=ETAT_SEEK then
									-- params select NCN
									current_track:=conv_integer(params(0)); -- NCN
									current_sector:=0;
									current_byte:=0;
								elsif etat=ETAT_WRITE then
									-- params select C H R N EOT GPL DTL
									if params(3)>0 then -- N
										exec_restant_write:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										exec_restant_write:=conv_integer(params(0)); -- DTL
									end if;
									current_track:=conv_integer(params(6));
									current_sector:=conv_integer(params(4)(3 downto 0))-1;
									current_byte:=0;
									
								end if;
								if exec_restant>0 then
									phase<=PHASE_EXECUTION_READ; -- on passe en mode execution_read
									--transmit<='1';
								elsif exec_restant_write>0 then
									phase<=PHASE_EXECUTION_WRITE;
								elsif result_restant>0 then
									phase<=PHASE_RESULT; -- on passe en mode RESULT
								else
									phase<=PHASE_ATTENTE_COMMANDE;
								end if;
							end if;
						end if;
						
						
					end if;

			end if; --do_update
			
			wasIO_RD:=IO_RD;
			wasIO_WR:=IO_WR;
	end if;
end process cortex;


end Behavioral;
