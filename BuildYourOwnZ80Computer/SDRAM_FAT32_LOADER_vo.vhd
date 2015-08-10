library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;

-- l'adressage entre le fat32_loader et le spi_master se fait en byte, donc on est limit� � 4Go
-- il n'y a pas de buffer de donn�e sur le fat32_loader, le buffer existe dans spi_master
entity SDRAM_FAT32_LOADER is
	Generic (
		-- le SPI mode ne fonctionne pas avec 2048 block, c'est bizarre
		-- windob ne formate pas en 512 block
		ROM_COUNT:integer:=3; -- attention ya du code en dur : "if files_loaded="11111" then"
		DSK_OFF:std_logic:='0'; -- si 1 alors ne cherche pas de disquette, si 0 alors cherche une disquette
		BLOCK_SIZE_MAXIMUM:integer:=65536; --4096; -- bytes
		BLOCK_SQRT:integer:=9; -- 2^BLOCK_SQRT=BLOCK_SIZE_MAXIMUM (=512 :P)
		SDRAM_ASYNC_DELTA:integer:=0 -- 0 or more : go more and more slower with SDRAM_ASYNC access delays. More a problem of AUTO-REFRESH I think...
		--FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400C00" -- in byte
		--FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400000" -- in byte
	);
    Port ( CLK:in STD_LOGIC;
           file_select:in std_logic_vector(7 downto 0);
           ram_A : out  STD_LOGIC_VECTOR (22 downto 0):=(others=>'0');
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0):=(others=>'Z'); -- for sim
			  ram_Dout : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'Z'); -- for sim
           ram_W : out  STD_LOGIC:='0';
		   ram_R : out  STD_LOGIC:='0';
           spi_A : out  STD_LOGIC_VECTOR (31 downto 0);
           spi_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  spi_Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           spi_Rdo : out  STD_LOGIC;
           spi_Rdone : in  STD_LOGIC;
           spi_Wdo : out  STD_LOGIC;
			  spi_Wblock : out  STD_LOGIC;
           spi_Wdone : in  STD_LOGIC;
			  spi_init_done : in STD_LOGIC;
			  dump_button: in std_logic:='0';
			  stop:in std_logic; -- stop main state machine
			  leds_select : in std_logic_vector(2 downto 0);
			  leds:out STD_LOGIC_VECTOR(7 downto 0);
			  --first_BR_leds:out STD_LOGIC_VECTOR(7 downto 0);
			  load_init_done:out std_logic;
			  is_ucpm:out std_logic:='0';
			  key_reset:in std_logic;
			  changeDSK : in std_logic;
			  --FDC_input : in STD_LOGIC_VECTOR (6 downto 0);
			 -- FDC_output : out STD_LOGIC_VECTOR (5 downto 0);
			  
			  -- MiST OSD dir_entry (file selected)
			  dir_entry_clk:out std_logic;
			  dir_entry_d: in std_logic_vector(7 downto 0);
			  dir_entry_r:out std_logic;
			  dir_entry_ack:in std_logic;
			  dir_entry_downloading:in std_logic -- falling_edge
			  
			  
			  );
			  	attribute keep : string;
				attribute keep of file_select : signal is "TRUE";

			  
end SDRAM_FAT32_LOADER;

architecture Behavioral of SDRAM_FAT32_LOADER is
	constant ATTR_ARCHIVE:std_logic_vector(7 downto 0):=x"20";
	constant file_dsk_extention:std_logic_vector((4)*8-1 downto 0):=x"44534B" & ATTR_ARCHIVE; -- DSK & ATTR_ARCHIVE
	constant file_dsk_address:std_logic_vector(31 downto 0):=x"00040000";
	subtype name_type is std_logic_vector(11*8-1 downto 0);
	type file_rom_name_type is array(ROM_COUNT-1 downto 0) of name_type;
	constant file_rom_name: file_rom_name_type:=
--		(x"4F53343634202020524F4D", -- OS464.ROM
--		x"4241534943312D30524F4D", -- BASIC1-0.ROM
--		x"414D53444F532020524F4D"); -- AMSDOS.ROM
		(x"4F53363132382020524F4D", -- OS6128.ROM
		 x"4241534943312D31453030", -- BASIC1-1.e00
		 x"414D53444F532020453037"); -- AMSDOS.e07
		--x"4D4158414D202020524F4D"); -- MAXAM.ROM
	subtype address_type is std_logic_vector(31 downto 0);
	type file_rom_address_type is array(ROM_COUNT-1 downto 0) of address_type;
	constant file_rom_address: file_rom_address_type:=
		(x"00000000",
		x"00004000",
		x"00008000");
		--x"0000C000");
	
	constant file_dump_name: name_type := x"44554D5020202020444D50"; -- DUMP.DMP
	--constant file_dump_size: address_type := x"00800000"; -- ram_A(22:0)
	constant file_dump_size: address_type := x"00200000"; -- ram_A(20:0) -- 20sec
	--constant file_dump_size: address_type := x"00010000"; -- juste les ROM (FFFF+1=size)
	--constant file_dump_size: address_type := x"00003FFF"; -- plus de 512 octets
	
	
	-- selon wiki eng : file allocation table
	constant BPB_RsvdSecCnt_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000000e";
	constant BPB_NumFATs_addr:STD_LOGIC_VECTOR(31 downto 0):=x"00000010";
	constant BPB_FATSz32_addr:STD_LOGIC_VECTOR(31 downto 0):=x"00000024";
	constant BPB_SecPerClus_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000000d";
	constant BPB_RootClus_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000002c"; 
	constant BPB_TotSec32_addr:STD_LOGIC_VECTOR(31 downto 0):=x"00000020";
	constant BPB_BytsPerSec_addr:STD_LOGIC_VECTOR(31 downto 0):=x"0000000B";
	
	signal data_reader1:STD_LOGIC_VECTOR(7 downto 0);
	signal data_reader2:STD_LOGIC_VECTOR(15 downto 0);
	signal data_reader4:STD_LOGIC_VECTOR(31 downto 0);
	signal data_writer1:STD_LOGIC_VECTOR(7 downto 0);
	signal data_writer2:STD_LOGIC_VECTOR(15 downto 0);
	signal data_writer4:STD_LOGIC_VECTOR(31 downto 0);
	
	signal data_Rdo:boolean:=false;
	signal data_Wdo:boolean:=false;
	signal data_addr:STD_LOGIC_VECTOR(31 downto 0); -- data est utilis� pour lire les variables du BR
	signal data_length:integer range 1 to 5:=1;
	signal data_RWdone:boolean:=true;
	signal data_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal data_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'Z');
	signal data_spi_Rdo:std_logic:='0';
	signal data_spi_Wdo:std_logic:='0';
	
	signal compare_to12:STD_LOGIC_VECTOR(8*12-1 downto 0);
	--signal compare_to3:STD_LOGIC_VECTOR(8*3-1 downto 0);
	
	signal compare_length : integer range 3 to 12:=3;
	signal compare_result :boolean;
	signal compare_address:STD_LOGIC_VECTOR(31 downto 0);
	signal compare_do :boolean:=false;
	signal compare_done :boolean:=true;
	signal compare_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal compare_spi_Rdo:std_logic:='0';

	signal transmit_address_from:STD_LOGIC_VECTOR(31 downto 0);
	signal transmit_address_to:STD_LOGIC_VECTOR(31 downto 0);
	signal transmit_length:integer range 0 to BLOCK_SIZE_MAXIMUM;
	signal transmit_do:boolean:=false;
	signal transmit_done:boolean:=true;
	signal transmit_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal transmit_spi_Rdo:std_logic:='0';

	signal dump_address_from:STD_LOGIC_VECTOR(31 downto 0);
	signal dump_address_to:STD_LOGIC_VECTOR(31 downto 0);
	signal dump_length:integer range 0 to BLOCK_SIZE_MAXIMUM;
	signal dump_do:boolean:=false;
	signal dump_done:boolean:=true;
	signal dump_spi_A:STD_LOGIC_VECTOR(spi_A'range);
	signal dump_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'Z');
	signal dump_spi_Wdo:std_logic:='0';
	
	constant SWITCH_NONE:integer:=0;
	constant SWITCH_TRANSMIT:integer:=1;
	constant SWITCH_DUMP:integer:=2;
	constant SWITCH_COMPARE:integer:=3;
	constant SWITCH_BR:integer:=4;
	
	
	signal switch_br_compare_transmit_dump:integer range 0 to 4:=SWITCH_NONE;
	
	constant SWITCH_GRIPSOU:integer:=3;
	signal switch_transmit_gripsou_dump:integer range 0 to 3:=SWITCH_NONE;

	signal dump_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal dump_ram_R:std_logic:='0';
	signal transmit_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal transmit_ram_D:std_logic_vector(ram_Din'range):=(others=>'Z');
	signal transmit_ram_W:std_logic:='0';
	signal gripsou_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal gripsou_ram_D:std_logic_vector(ram_Dout'range):=(others=>'Z');
	signal gripsou_ram_W:std_logic:='0';
	signal gripsou_address:std_logic_vector(ram_A'range):=(others=>'0');
	signal gripsou_data:std_logic_vector(ram_Dout'range):=(others=>'Z');
	signal gripsou_write:std_logic:='0';
	
	signal leds_monitoring:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	signal leds_lockers:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	
	signal leds_tortue_geniale:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	signal leds_gripsou:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	
	signal leds_br:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	signal leds_transmit:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	signal leds_compare:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	signal leds_dump:STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
	
--	--===================================
--	-- H  H EEE RRR   CC  U  U L    EEEE
--	-- H  H E   R  R C    U  U L    E
--	-- HHHH EE  RRR  C    U  U L    EEEE
--	-- H  H E   R R  C    U  U L    E
--	-- H  H EEE R  R  CCC  UU  LLLL EEEE interface
--	--===================================
--	signal hercule_addr:STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
--	--input
--	signal FDD_select:std_logic:='1';-- 1
--	signal FDD_motorOn:std_logic:='1';-- 1
--	signal FDD_directionSelect:std_logic:='1';-- 1 vers le bord 0 vers le milieu
--	signal FDD_step:std_logic:='1';-- negative pulse
--	signal FDD_writeGate:std_logic:='0';-- 1 poser le saphir (�a �crit en continu !)
--	signal FDD_writeData:std_logic:='1';-- negative pulse change magnetization polarisation 1 au d�but, et selon dur�e des 0 ou des 1 ou seek.
--	signal FDD_sideOneSelect:std_logic:='1';-- 0 lower side 1 upper side
--	--output
--	signal FDD_Track00:std_logic:='0';-- 1 head in track 00 (au bord)
--	signal FDD_Index:std_logic:='1';--negative pulse : start of track
--	signal FDD_readData:std_logic:='1';--negative pulse : 1 au d�but, et selon dur�e des 0 ou des 1 ou seek.
--	signal FDD_writeProtect:std_logic:='0';-- 0 unprotected
--	signal FDD_diskChange:std_logic:='0';-- 0 quand disk bien dedant et pr�s
--	signal FDD_isHD:std_logic:='0'; -- HIGH : 2DD disk, LOW : 2HD disk.
--	
--	--===================================
--	-- HERCULE internal commands (do/done)
--	signal transmit512_done:boolean:=false;
--	signal transmit512_do:boolean:=false;
--	signal transmit512_spi_Rdo : STD_LOGIC:='0';
--	signal transmit512_length:integer:=0;
--	signal herculeInsert_do : boolean:=false;
--	signal herculeInsert_done : boolean:=false;
--	signal transmit512_spi_A:STD_LOGIC_VECTOR(spi_A'range):=(others=>'0');
--	--===================================
--	
--	--======================================================
--	-- H  H EEE RRR   CC  U  U L    EEEE     55555   1  22
--	-- H  H E   R  R C    U  U L    E        5      11 2  2
--	-- HHHH EE  RRR  C    U  U L    EEEE     5555  1 1   2
--	-- H  H E   R R  C    U  U L    E            5   1  2
--	-- H  H EEE R  R  CCC  UU  LLLL EEEE     5555    1 2222 bytes :)
--	--======================================================
--	signal data_block_W:STD_LOGIC:='0';
--	signal data_block_Din:STD_LOGIC_VECTOR(7 downto 0);
--	signal data_block_Dout:STD_LOGIC_VECTOR(7 downto 0);
--	signal data_block_A:STD_LOGIC_VECTOR(BLOCK_SQRT-1 downto 0);
--	signal RAMB16_S9_address:STD_LOGIC_VECTOR(10 downto 0);
--	signal parity:std_logic_vector(0 downto 0);
	
	
	-- death code
--	component MiST_RAMB16_S9 IS
--	PORT
--	(
--		address		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
--		clock		: IN STD_LOGIC  := '1';
--		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--		wren		: IN STD_LOGIC ;
--		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--	);
--	END component;
begin

	-- MiST dir entry (menu select)
	dir_entry_clk<=CLK;




--    FDC_output<=FDD_Track00 & FDD_Index & FDD_readData & FDD_writeProtect & FDD_diskChange & FDD_isHD;
--
--	FDD_select<=FDC_input(6);
--	FDD_motorOn<=FDC_input(5);
--	FDD_directionSelect<=FDC_input(4);
--	FDD_step<=FDC_input(3);
--	FDD_writeGate<=FDC_input(2);
--	FDD_writeData<=FDC_input(1);
--	FDD_sideOneSelect<=FDC_input(0);


	leds<=leds_monitoring when leds_select="000"
	else leds_lockers when leds_select="001"
	else leds_tortue_geniale when leds_select="010"
	else leds_gripsou when leds_select="011"
	else leds_br when leds_select="100"
	else leds_compare when leds_select="101"
	else leds_transmit when leds_select="110"
	else leds_dump;

	ram_A<= gripsou_ram_A when switch_transmit_gripsou_dump=SWITCH_GRIPSOU else transmit_ram_A when switch_transmit_gripsou_dump=SWITCH_TRANSMIT else dump_ram_A when switch_transmit_gripsou_dump=SWITCH_DUMP else (others=>'0');
	ram_Dout<= gripsou_ram_D when switch_transmit_gripsou_dump=SWITCH_GRIPSOU else transmit_ram_D when switch_transmit_gripsou_dump=SWITCH_TRANSMIT else (others=>'Z');
	ram_W<= gripsou_ram_W when switch_transmit_gripsou_dump=SWITCH_GRIPSOU else transmit_ram_W when switch_transmit_gripsou_dump=SWITCH_TRANSMIT else '0';
	ram_R<= dump_ram_R when switch_transmit_gripsou_dump=SWITCH_DUMP else '0';
	
	
	spi_A<=data_spi_A when switch_br_compare_transmit_dump=SWITCH_BR
		else compare_spi_A when switch_br_compare_transmit_dump=SWITCH_COMPARE
		else transmit_spi_A when switch_br_compare_transmit_dump=SWITCH_TRANSMIT
		else dump_spi_A when switch_br_compare_transmit_dump=SWITCH_DUMP
		else (others=>'0');

	spi_Rdo<=data_spi_Rdo when switch_br_compare_transmit_dump=SWITCH_BR
		else compare_spi_Rdo when switch_br_compare_transmit_dump=SWITCH_COMPARE
		else transmit_spi_Rdo when switch_br_compare_transmit_dump=SWITCH_TRANSMIT
		else '0';
	spi_Wdo<=data_spi_Wdo when switch_br_compare_transmit_dump=SWITCH_BR
		else dump_spi_Wdo when switch_br_compare_transmit_dump=SWITCH_DUMP
		else '0';
		
	spi_Dout<=dump_spi_Dout when switch_br_compare_transmit_dump=SWITCH_DUMP
		else data_spi_Dout when switch_br_compare_transmit_dump=SWITCH_BR
		else (others=>'0');

	-- permet de charger les variable BR, et les autres variables en g�n�ral
	spi_to_loader: process(CLK) is
		variable data_step:integer range 0 to 15:=0;
		variable data_cursor:integer range 0 to 31:=0;
		variable data_reader1_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable data_reader2_mem:std_logic_vector(15 downto 0):=(others=>'0');
		variable data_reader4_mem:std_logic_vector(31 downto 0):=(others=>'0');
		variable data_writer1_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable data_writer2_mem:std_logic_vector(15 downto 0):=(others=>'0');
		variable data_writer4_mem:std_logic_vector(31 downto 0):=(others=>'0');

		variable leds_mem:std_logic_vector(7 downto 0):=(others=>'0');
		
	begin
		--leds<=leds_mem;
		if rising_edge(CLK) then
			data_reader1<=data_reader1_mem;
			data_reader2<=data_reader2_mem;
			data_reader4<=data_reader4_mem;
			
			leds_br<=conv_std_logic_vector(data_step,8);
			
			if data_Rdo or data_Wdo then
				data_RWdone<=false;
				data_step:=0;
				if data_Wdo then
					data_step:=7;
					if data_length=3 then
						data_step:=12;
					end if;
					if data_length=5 then
						data_step:=14;
					end if;
				end if;
				if not (data_RWdone) or (data_Rdo and data_Wdo) then
					data_step:=6; -- over run
				end if;
			end if;
			
			data_spi_Rdo<='0'; -- heu c'est quoi �a d�j� ? un sorte de data_Rdo
			data_spi_Wdo<='0';
			
			if data_RWdone then
				leds_mem(0):='0';
			else
				leds_mem(0):='1';
			end if;
			
			if not data_RWdone then
				if not(data_spi_Wdo='1') and spi_Wdone='1' and not(data_spi_Rdo='1') and spi_Rdone='1'  then
						
					case data_step is
						when 0=>
							leds_mem(1):='0';
							leds_mem(2):='1';
							leds_mem(1):='1';
							leds_mem(2):='0';
							data_cursor:=0;
							data_spi_A<=data_addr +data_cursor;
							data_step:=1;
							data_spi_Rdo<='1';
						when 1=>
							case data_length is
								when 1 => -- 1 byte
									data_reader1_mem(7 downto 0):=spi_Din(7 downto 0);
									data_step:=5;
								when 2 => -- 2 byte
									data_reader2_mem(15 downto 8):=spi_Din(7 downto 0);
									data_cursor:=1;
									data_spi_A<=data_addr +data_cursor;
									data_step:=2;
									data_spi_Rdo<='1';
								when 4 => -- 4 byte
									data_reader4_mem(31 downto 24):=spi_Din(7 downto 0);
									data_cursor:=1;
									data_spi_A<=data_addr +data_cursor;
									data_step:=2;
									data_spi_Rdo<='1';
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 2 =>
							case data_length is
								when 2 => -- 2 byte
									data_reader2_mem(7 downto 0):=spi_Din(7 downto 0);
									data_step:=5;
								when 4 => -- 4 byte
									data_reader4_mem(23 downto 16):=spi_Din(7 downto 0);
									data_cursor:=2;
									data_spi_A<=data_addr +data_cursor;
									data_step:=3;
									data_spi_Rdo<='1';
								when 1 => NULL;
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 3 =>
							case data_length is
								when 4 => -- 4 byte
									data_reader4_mem(15 downto 8):=spi_Din(7 downto 0);
									data_cursor:=3;
									data_spi_A<=data_addr +data_cursor;
									data_step:=4;
									data_spi_Rdo<='1';
								when 1 => NULL;
								when 2 => NULL;
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 4 =>
							case data_length is
								when 4 => -- 4 byte
									data_reader4_mem(7 downto 0):=spi_Din(7 downto 0);
									data_step:=5;
								when 1 => NULL;
								when 2 => NULL;
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 5 => -- variable transfert completed
							data_spi_Dout<=(others=>'0'); -- relax
							data_RWdone<=true;
							data_step:=11;
						when 6=>NULL; -- over run
						when 7 => -- write
							leds_mem(1):='0';
							leds_mem(2):='1';
							leds_mem(1):='1';
							leds_mem(2):='0';
							data_cursor:=0;
							data_spi_A<=data_addr +data_cursor;
							case data_length is
								when 1 => -- 1 byte
									data_writer1_mem:=data_writer1;
									data_spi_Dout(7 downto 0)<=data_writer1_mem(7 downto 0);
									data_spi_Wdo<='1';
									data_step:=5;
								when 2 => -- 2 byte
									data_writer2_mem:=data_writer2;
									data_spi_Dout(7 downto 0)<=data_writer2_mem(15 downto 8);
									data_spi_Wdo<='1';
									data_step:=8;
								when 4 => -- 4 byte
									data_writer4_mem:=data_writer4;
									data_spi_Dout(7 downto 0)<=data_writer4_mem(31 downto 24);
									data_spi_Wdo<='1';
									data_step:=8;
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 8=>
							data_cursor:=1;
							data_spi_A<=data_addr +data_cursor;
							case data_length is
								when 2 => -- 2 byte
									data_spi_Dout(7 downto 0)<=data_writer2_mem(7 downto 0);
									data_spi_Wdo<='1';
									data_step:=5;
								when 4 => -- 4 byte
									data_spi_Dout(7 downto 0)<=data_writer4_mem(23 downto 16);
									data_spi_Wdo<='1';
									data_step:=9;
								when 1 => NULL; -- 1 byte
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 9=>
							data_cursor:=2;
							data_spi_A<=data_addr +data_cursor;
							case data_length is
								when 4 => -- 4 byte
									data_spi_Dout(7 downto 0)<=data_writer4_mem(15 downto 8);
									data_spi_Wdo<='1';
									data_step:=10;
								when 1 => NULL;-- 1 byte
								when 2 => NULL; -- 2 byte
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 10=>
							data_cursor:=3;
							data_spi_A<=data_addr +data_cursor;
							case data_length is
								when 4 => -- 4 byte
									data_spi_Dout(7 downto 0)<=data_writer4_mem(7 downto 0);
									data_spi_Wdo<='1';
									data_step:=5;
								when 1 => NULL; -- 1 byte
								when 2 => NULL; -- 2 byte
								when 3 => NULL;
								when 5 => NULL;
							end case;
						when 11=>NULL; -- that's all folks !
						when 12=> -- 32Bytes with x"00"
							data_cursor:=0;
							data_step:=13;
						when 13=>
							data_spi_A<=data_addr +data_cursor;
							data_spi_Dout(7 downto 0)<=(others=>'0');
							data_spi_Wdo<='1';
							if data_cursor=31 then
								data_step:=5; -- finalize last write
							else
								data_cursor:=data_cursor+1;
							end if;
						when 14=> -- write 12 constant DUMP.DMP FileEntry
							data_cursor:=0;
							data_step:=15;
						when 15=>
							data_spi_A<=data_addr +data_cursor;
							if data_cursor=11 then
								data_spi_Dout(7 downto 0)<=x"00"; -- not a dir == a file
							else
								data_spi_Dout(7 downto 0)<=file_dump_name((11-data_cursor)*8-1 downto (11-data_cursor-1)*8);
							end if;
							data_spi_Wdo<='1';
							if data_cursor=11 then
								data_step:=5; -- finalize last write
							else
								data_cursor:=data_cursor+1;
							end if;
					end case;
				end if;
			end if;
		end if;
	end process;

	-- compare 8bytes ou 3 bytes
	comparator:process(CLK) is
		variable compare_step:integer range 0 to 3:=0;
		variable cursor:integer range 0 to 12:=0;
		variable leds_mem:std_logic_vector(7 downto 0):=(others=>'0');
	begin
		--leds<=leds_mem;
		if rising_edge(CLK) then
			compare_spi_Rdo<='0';
			leds_compare<=conv_std_logic_vector(compare_step,8);
			if compare_do then
				compare_done<=false;
				--compare_result<=false;
				if not compare_done then
					compare_step:=2;-- over run (sans clignotement)
				else
					compare_step:=0;
				end if;
			end if;
			if not compare_done then
				compare_spi_A<=compare_address+cursor;
				if not(compare_spi_Rdo='1') and spi_Rdone='1' then
					case compare_step is
						when 0=>
							cursor:=0;
							compare_spi_Rdo<='1';
							compare_spi_A<=compare_address+cursor;
							compare_step:=1;
						when 1=>
							if cursor=compare_length-1 then
								-- volume_label     directory
								if spi_Din(3)='0' and spi_Din(4)='0' then
									compare_result<=true;
									compare_done<=true;
								else
									compare_result<=false;
									compare_done<=true;
								end if;
								compare_step:=3;
							elsif compare_to12((12-cursor)*8-1 downto (12-cursor-1)*8) /= spi_Din then
								compare_result<=false;
								compare_done<=true;
								compare_step:=3;
							else
								cursor:=cursor+1;
								compare_spi_Rdo<='1';
								compare_spi_A<=compare_address+cursor;
							end if;
						when 2=>NULL; -- over run
						when 3=>NULL; -- that's all folks
					end case;
				end if;
			end if;
		end if;
	end process;
	
	-- rempli la RAM
	transmiter:process(CLK) is
		variable cursor:integer range 0 to BLOCK_SIZE_MAXIMUM;
		variable transmit_step:integer range 0 to 5;
		variable leds_mem:std_logic_vector(7 downto 0);
		variable data_mem:std_logic_vector(7 downto 0);
		variable address_mem:std_logic_vector(ram_A'range);
		variable transmit_sdram_wait: integer range 0 to SDRAM_ASYNC_DELTA;
	begin
		if rising_edge(CLK) then
			--leds<=leds_mem;
			leds_transmit<=conv_std_logic_vector(transmit_step,8);
			if transmit_do then
				transmit_done<=false;
				cursor:=0;
				if not transmit_done then
					transmit_step:=4;--over run (sans clignotement)
				else
					transmit_step:=0;
				end if;
			end if;
			transmit_spi_Rdo<='0';
			transmit_ram_W<='0';gripsou_write<='0';
			if not transmit_done then
				-- read byte
				-- write byte
				transmit_spi_A<=transmit_address_from+cursor;
				leds_mem(1):='1';
				transmit_ram_A<=transmit_address_to(ram_A'range)+cursor;
				case transmit_step is
					when 0=>
						if not(transmit_spi_Rdo='1') and spi_Rdone='1' then
							leds_mem(2):='1';
							transmit_spi_Rdo<='1';
							transmit_step:=1;
						end if;
					when 1=>
						leds_mem(3):='1';
						if not(transmit_spi_Rdo='1') and spi_Rdone='1' then
							leds_mem(4):='1';
							--transmit_ram_D<=conv_std_logic_vector(cursor,8);
							data_mem:=spi_Din;
							transmit_ram_D<=data_mem;gripsou_data<=data_mem;
							address_mem:=transmit_address_to(ram_A'range)+cursor;
							gripsou_address<=address_mem;
							--leds<=conv_std_logic_vector(cursor,8);
							transmit_ram_W<='1';gripsou_write<='1';
							transmit_sdram_wait:=0;
							if transmit_sdram_wait = SDRAM_ASYNC_DELTA then
								transmit_step:=2;
							else
								transmit_step:=5;
							end if;
						end if;
					when 5=>
						transmit_ram_W<='1';
						if transmit_sdram_wait = SDRAM_ASYNC_DELTA then
							transmit_step:=2;
						else
							transmit_sdram_wait:=transmit_sdram_wait+1;
						end if;
					when 2=>
						leds_mem(5):='1';
						transmit_ram_W<='0';gripsou_write<='0';
						transmit_step:=0;
						cursor:=cursor+1;
						if cursor>=transmit_length then
							leds_mem(6):='1';
							leds_mem(7):='1';
							transmit_ram_D<=(others=>'Z');gripsou_data<=(others=>'Z');
							transmit_done<=true;
							transmit_step:=3;
						end if;
					when 3=>NULL; -- transmit SPI to RAM done
					when 4=>NULL; -- over run
				end case;
			end if;
		end if;
	end process;
	
	-- rempli la SDCARD
	dumper:process(CLK) is
		variable cursor:integer range 0 to BLOCK_SIZE_MAXIMUM;
		variable dump_step:integer range 0 to 6;
		variable leds_mem:std_logic_vector(7 downto 0);
		variable data_mem_RAM:std_logic_vector(7 downto 0);
		--variable data_mem_SPI:std_logic_vector(7 downto 0);
		variable address_mem_RAM:std_logic_vector(ram_A'range);
		variable address_mem_SPI:std_logic_vector(spi_A'range);
		variable dump_sdram_wait: integer range 0 to SDRAM_ASYNC_DELTA;
	begin
		if rising_edge(CLK) then
			--leds<=leds_mem;
			leds_dump<=conv_std_logic_vector(dump_step,8);
			if dump_do then
				dump_done<=false;
				cursor:=0;
				address_mem_RAM:=dump_address_from(ram_A'range)+cursor;
				dump_ram_A<=address_mem_RAM;
				address_mem_SPI:=dump_address_to+cursor;
				dump_spi_A<=address_mem_SPI;
				
				if not dump_done then
					dump_step:=5;--over run (sans clignotement)
				else
					dump_step:=0;
				end if;
			end if;
			dump_ram_R<='0';
			spi_Wblock<='0';
			dump_spi_Wdo<='0';
			if not dump_done and not(dump_spi_Wdo='1') and spi_Wdone='1' then
				--dump_spi_Dout<=(others=>'0');
				-- read byte
				-- write byte
				leds_mem(1):='1';
				case dump_step is
					when 0=>
						leds_mem(2):='1';
						dump_ram_R<='1';
						dump_sdram_wait:=0;
						if dump_sdram_wait=SDRAM_ASYNC_DELTA then
							dump_step:=1;
						else
							dump_step:=6;
						end if;
						--data_mem_RAM:=(others=>'0');
					when 6=>
						dump_ram_R<='1';
						if dump_sdram_wait=SDRAM_ASYNC_DELTA then
							dump_step:=1;
						else
							dump_sdram_wait:=dump_sdram_wait+1;
						end if;
					when 1=>
						--data_mem:=dump_address_to(7 downto 0)+cursor;
						data_mem_RAM:=ram_Din;
						dump_spi_Dout<=data_mem_RAM;
						--data_mem_SPI:=data_mem_RAM;
						dump_ram_R<='0';
						dump_step:=2;
					when 2=>
						leds_mem(3):='1';
						-- pas touche dump_spi_Dout<=data_mem_RAM;
						dump_spi_Wdo<='1';
						if cursor+1=dump_length or cursor mod 512 = 511 then
							spi_Wblock<='0';
						else
							spi_Wblock<='1';
							--spi_Wblock<='0';
						end if;
						dump_step:=3;
					when 3=>
						leds_mem(5):='1';
						dump_step:=0;
						cursor:=cursor+1;
						if cursor>=dump_length then
							leds_mem(6):='1';
							leds_mem(7):='1';
							dump_spi_Dout<=(others=>'0');
							dump_done<=true;
							dump_step:=4;
						end if;
						dump_spi_Dout<=(others=>'0'); --liberation D vs D_mem
						address_mem_RAM:=dump_address_from(ram_A'range)+cursor;
						dump_ram_A<=address_mem_RAM;
						address_mem_SPI:=dump_address_to+cursor;
						dump_spi_A<=address_mem_SPI;
						--data_mem_RAM:=(others=>'0');
					when 4=>NULL; -- transmit SPI to RAM done
						--data_mem_RAM:=(others=>'0');
					when 5=>NULL; -- over run
						--data_mem_RAM:=(others=>'0');
				end case;
			end if;
		end if;
	end process;
	
	-- rempli la RAM interne 512
--	transmiter512:process(CLK) is
--		variable cursor:integer range 0 to BLOCK_SIZE_MAXIMUM;
--		variable transmit512_step:integer range 0 to 4;
--		variable data_mem:std_logic_vector(7 downto 0);
--		variable address_mem:std_logic_vector(BLOCK_SQRT-1 downto 0);
--	begin
--		if rising_edge(CLK) then
--			--leds_transmit512<=conv_std_logic_vector(transmit_step,8);
--			if transmit512_do then
--				transmit512_done<=false;
--				cursor:=0;
--				if not transmit512_done then
--					transmit512_step:=4;--over run (sans clignotement)
--				else
--					transmit512_step:=0;
--				end if;
--			end if;
--			transmit512_spi_Rdo<='0';
--			data_block_W<='0';
--			if not transmit512_done then
--				-- read byte
--				-- write byte
--				transmit512_spi_A<=transmit_address_from+cursor;
--				case transmit512_step is
--					when 0=>
--						if not(transmit512_spi_Rdo='1') and spi_Rdone='1' then
--							transmit512_spi_Rdo<='1';
--							transmit512_step:=1;
--						end if;
--					when 1=>
--						if not(transmit512_spi_Rdo='1') and spi_Rdone='1' then
--							--data_block_Din<=conv_std_logic_vector(cursor,8);
--							data_mem:=spi_Din;
--							data_block_Din<=data_mem;
--							address_mem:=conv_std_logic_vector(cursor,BLOCK_SQRT);
--							data_block_A<=address_mem;
--							transmit512_step:=2;
--						end if;
--					when 2=>
--						data_block_W<='0';
--						transmit512_step:=0;
--						cursor:=cursor+1;
--						if cursor>=transmit512_length then
--							data_block_Din<=(others=>'Z');
--							data_block_A<=(others=>'Z');
--							transmit512_done<=true;
--							transmit512_step:=3;
--						end if;
--					when 3=>NULL; -- transmit SPI to RAM done
--					when 4=>NULL; -- over run
--				end case;
--			end if;
--		end if;
--	end process;

	--tortue_geniale:process (CLK,file_select) is
	tortue_geniale:process (CLK) is
	   variable FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400000"; -- in byte
		variable BPB_FATSz32:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_TotSec32:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_BytsPerSec:STD_LOGIC_VECTOR(15 downto 0);
		variable BPB_SecPerClus:STD_LOGIC_VECTOR(7 downto 0);
		variable BPB_RootClus:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_RsvdSecCnt:STD_LOGIC_VECTOR(15 downto 0);
		variable BPB_NumFATs:STD_LOGIC_VECTOR(7 downto 0);
	
		variable FATSz:integer;
		variable TotSec:integer;
		variable FirstDataSector:integer;
		variable FirstSectorofCluster:integer;
		variable FirstRootDirSecNum:integer;
		
-- le premier param permet juste de checker la taille de la variable � la compilation
procedure get_var1(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=1;
	data_addr<=var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;
procedure get_var2(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;
procedure get_var4(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;

-- le premier param permet juste de checker la taille de la variable � la compilation
procedure set_var1(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=1;
	data_addr<=var_addr;
	data_writer1<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;
procedure set_var2(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr;
	data_writer2<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;
procedure set_var4(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr;
	data_writer4<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;
procedure fillSDCARD_32BytesWithZeros(var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=3; --strange case
	data_addr<=var_addr;
	data_Wdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;
procedure set_var12(var_name:std_logic_vector(8*12-1 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=5; --strange case
	data_addr<=var_addr;
	data_Wdo<=true;
	switch_br_compare_transmit_dump<=SWITCH_BR;
end;

function fix_big_endian1(var_name: in STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
begin
	return var_name;
end;
function fix_big_endian2(var_name: in STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(15 downto 0); -- frontiere a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8);
	return cache;
end;
function fix_big_endian4(var_name: in STD_LOGIC_VECTOR(31 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(31 downto 0); -- frontiere a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8) & var_name(23 downto 16) & var_name(31 downto 24);
	return cache;
end;

procedure compare12(name:std_logic_vector(8*12-1 downto 0);address:std_logic_vector(31 downto 0)) is
	--variable compare_address_mem:std_logic_vector(31 downto 0); -- fronti�re
begin
	--compare_address_mem:=address;
	compare_address<=address;--compare_address_mem;
	compare_to12<=name;
	compare_length<=12;
	compare_do<=true;
	switch_br_compare_transmit_dump<=SWITCH_COMPARE;
end procedure;
procedure compare4(name:std_logic_vector(8*4-1 downto 0);address:std_logic_vector(31 downto 0)) is
begin
	compare_address<=address;
	compare_to12<=name & x"0000000000000000";
	compare_length<=4;
	compare_do<=true;
	switch_br_compare_transmit_dump<=SWITCH_COMPARE;
end procedure;

procedure fillRAM(address_from:std_logic_vector(31 downto 0);address_to:std_logic_vector(31 downto 0);size:integer) is
begin
	transmit_address_from<=address_from;
	transmit_address_to<=address_to;
	transmit_length<=size; -- curseur : peut d�croire.
	transmit_do<=true;
	switch_br_compare_transmit_dump<=SWITCH_TRANSMIT;
end;

procedure fillSDCARD(address_from:std_logic_vector(31 downto 0);address_to:std_logic_vector(31 downto 0);size:integer) is
begin
	dump_address_from<=address_from;
	dump_address_to<=address_to;
	dump_length<=size; -- curseur : peut d�croire.
	dump_do<=true;
	switch_br_compare_transmit_dump<=SWITCH_DUMP;
end;


-- retourne l'addresse memoire pointant vers le d�but du secteur
subtype address_type is std_logic_vector(31 downto 0);
impure function getSector(cluster:std_logic_vector(31 downto 0)) return address_type is
begin
	--return (conv_std_logic_vector(((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector,32))*BPB_BytsPerSec+FAT32_SECTOR0_OFFSET;
	return (conv_std_logic_vector((((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec),32)+FAT32_SECTOR0_OFFSET);
end function;
-- retourne l'addresse memoire pointant vers le d�but du cluster suivant dans le FAT
impure function getFAT(cluster:std_logic_vector(31 downto 0)) return address_type is
begin
	--chaque cluster 4 bytes
	return conv_std_logic_vector(conv_integer(BPB_RsvdSecCnt)*conv_integer(BPB_BytsPerSec)+conv_integer(cluster)*4,32)+FAT32_SECTOR0_OFFSET;
end function;


-- free cluster
function fc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster = x"00000000";
end function;

-- reserved cluster
function rc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
    -- What are the two reserved clusters at the start of the FAT for? (00000000 and 00000001)
	return cluster = x"00000001"; -- or (cluster>=x"0FFFFFF0" and cluster<=x"0FFFFFF7");
end function;

-- end of cluster
function eoc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	--} else if (FATType == FAT32) {
	--If(FATContent >= 0x0FFFFFF8)
	--IsEOF = TRUE;
	--}
	return cluster >= x"0FFFFFF8"; -- and cluster <= x"0FFFFFFF" ;
end function;

-- out of range cluster
function oc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
    -- voir function eoc()
	return false; --cluster > x"0FFFFFFF";
end function;

-- general bad/useless cluster
function bc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return fc(cluster) or rc(cluster) or eoc(cluster) or oc(cluster);
end function;

		variable step_var:integer range 0 to 62:=0;
		variable load_done:std_logic:='0';
		variable dump_button_mem:std_logic:='1';
		
		variable search_cluster: integer;
		variable cluster_search:std_logic_vector(31 downto 0);
		
		variable folder_cluster_pointer:std_logic_vector(31 downto 0); -- number
		variable previous_folder_cluster_pointer:std_logic_vector(31 downto 0);
		--variable folder_cluster_fat:std_logic_vector(31 downto 0); -- address
		variable file_cluster_pointer:std_logic_vector(31 downto 0); -- number
		variable previous_file_cluster_pointer:std_logic_vector(31 downto 0);
		--variable file_cluster_fat:std_logic_vector(31 downto 0); -- address
		variable file_cluster_pointer_H:std_logic_vector(15 downto 0);
		variable file_cluster_pointer_L:std_logic_vector(15 downto 0);
		variable folder_sector_pointer:std_logic_vector(31 downto 0);
		variable file_sector_pointer:std_logic_vector(31 downto 0);
		
		variable rom_number:integer range 0 to ROM_COUNT:=0;
		variable dsk_number:std_logic_vector(7 downto 0):=(others=>'0');
		
		variable file_address:std_logic_vector(31 downto 0);
		variable folder_DirStruct_number:integer;
		
		variable file_size:std_logic_vector(31 downto 0);
		
		variable leds_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable locker:std_logic_vector(3 downto 0):=(others=>'0');

		--variable file_select_mem:std_logic_vector(7 downto 0);
		--variable file_select_mem:std_logic_vector(7 downto 0);
	--files_loaded(0) : dsk loaded
	--files_loaded(1:3) : rom 1 2 3 loaded
	--files_loaded(4) :
	variable files_loaded:std_logic_vector((ROM_COUNT+1+1)-1 downto 0):='0' & DSK_OFF & "000"; -- m�chant doute(DSK_OFF,others=>'0');

	constant DUMP_COUNT_BEFORE_RESET_MAX : integer := 15;
	variable dump_counter_before_reset : integer range 0 to DUMP_COUNT_BEFORE_RESET_MAX:=0;
	variable changeDSK_mem : std_logic :='0'; -- do change disk at next key_reset.


















	--=======================================
	--h   ee rrr  cc u u l ee
	--hhh e  r   c   u u l e
	--h h ee r    cc uuu l ee FUSION !
	--=======================================
	
	--input
	-- signal FDD_select:std_logic:='1';-- 1
	-- signal FDD_motorOn:std_logic:='1';-- 1
	-- signal FDD_directionSelect:std_logic:='1';-- 1 vers le bord 0 vers le milieu
	-- signal FDD_step:std_logic:='1';-- negative pulse
	-- signal FDD_writeGate:std_logic:='0';-- 1 poser le saphir (�a �crit en continu !)
	-- signal FDD_writeData:std_logic:='1';-- negative pulse change magnetization polarisation 1 au d�but, et selon dur�e des 0 ou des 1 ou seek.
	-- signal FDD_sideOneSelect:std_logic:='1';-- 0 lower side 1 upper side
	--output
	-- signal FDD_Track00:std_logic:='0';-- 1 head in track 00 (au bord)
	-- signal FDD_Index:std_logic:='1';--negative pulse : start of track
	-- signal FDD_readData:std_logic:='1';--negative pulse : 1 au d�but, et selon dur�e des 0 ou des 1 ou seek.
	-- signal FDD_writeProtect:std_logic:='0';-- 0 unprotected
	-- signal FDD_diskChange:std_logic:='0';-- 0 quand disk bien dedant et pr�s
	-- signal FDD_isHD:std_logic:='0'; -- HIGH : 2DD disk, LOW : 2HD disk.
	variable maxTrack:integer range 0 to 80:=40;
	variable curTrack:integer range 0 to 80:=0;
	variable curSide:std_logic:='0';
	constant PREAMBLE:std_logic_vector(7 downto 0):="10010010";
	constant SYNCHRO :std_logic_vector(7 downto 0):="10101010";
	constant NEGOCIATE :std_logic_vector(15 downto 0):=PREAMBLE & SYNCHRO;
	constant curNEGOCIATE : integer range 0 to 15:=0;
	variable negociate_do:boolean:=false;
	variable negociate_done:boolean:=false;
	variable curIndex:integer range 0 to 4:=0;
	--variable index_do:boolean:=false;
	--variable index_done:boolean:=false;
	
	variable curSector:integer;
	variable curIdSectorDone:boolean:=false;
	variable hercule_step: integer range 0 to 12:=0;
	variable hercule_addr_mem:STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
	variable nbTracks:std_logic_vector(7 downto 0);
	
	variable curPatternByte:integer range 0 to 8:=0;
	variable curPatternBit:integer range 0 to 8:=0;
	
	variable herculestory_step: integer range 0 to 7:=0;
	variable storyId_done:boolean:=false;
	variable storyId_do:boolean:=false;
	variable story_do:boolean:=false;
	variable story_done:boolean:=false;
	variable storyIndex_done:boolean:=false;

	-- DSK format
	variable is_extended:boolean:=false;
	variable doubleside:boolean:=false;
	variable generalTrackSize:std_logic_vector(15 downto 0);
	variable trackBegin:std_logic_vector(31 downto 0);
	variable trackEnd:std_logic_vector(31 downto 0);
	variable trackIdPointer:std_logic_vector(31 downto 0);
	variable trackN:std_logic_vector(7 downto 0);
	variable trackS:std_logic_vector(7 downto 0);
	variable trackSectorSize:std_logic_vector(7 downto 0);
	variable trackSectorCount:std_logic_vector(7 downto 0);
	variable trackSectorGap3Length:std_logic_vector(7 downto 0);
	variable trackSectorGap3Filler:std_logic_vector(7 downto 0);
	variable sectorInfoCHRN:std_logic_vector(31 downto 0);
	variable sectorInfoBlock:std_logic_vector(31 downto 0);
	variable curSectorInfoBlock:std_logic_vector(31 downto 0);
	variable sectorData:std_logic_vector(31 downto 0);
	variable curSectorData:std_logic_vector(31 downto 0);
	variable sectorDataLength:std_logic_vector(15 downto 0);
	procedure fillRAMSector(data: in STD_LOGIC_VECTOR(31 downto 0);addr:STD_LOGIC_VECTOR(15 downto 0)) is
	begin
	end;
	
	-- MiST OSD menu select file
	variable old_downloading:std_logic:='1';
	variable dsk_mist:boolean:=false;
	variable file_name:name_type:=x"4946455F44454D4F44534B"; --IFE_DEMODSK; -- 11*8-1..0
	--variable file_name_counter:integer range 0 to 11-1:=0;
	variable dir_entry_counter:integer range 0 to 32-1:=0;
	variable file_size_mist:std_logic_vector(31 downto 0):=(others=>'0');
	variable file_cluster_pointer_mist:std_logic_vector(31 downto 0):=(others=>'0');
	
	
	
	
	begin
		load_init_done<=load_done;
		--leds<=leds_mem;
		
		if rising_edge(CLK) then
			--file_select_mem:=file_select; -- sinon l'optimisateur coupe le fil...
		   --dump_button_mem:=dump_button;
			leds_tortue_geniale<=conv_std_logic_vector(step_var,8);
			leds_monitoring<=files_loaded & "0" & dump_button_mem & load_done;
			leds_lockers<=locker & "0000";
			--leds<=dsk_number;
			--leds<=conv_std_logic_vector(folder_DirStruct_number,8);
			--leds<=files_loaded & locker & "0";
			
			if data_RWdone then
				locker(0):='0';
			else
				locker(0):='1';
			end if;
			if transmit_done then
				locker(1):='0';
			else
				locker(1):='1';
			end if;
			if compare_done then
				locker(2):='0';
			else
				locker(2):='1';
			end if;
			if dump_done then
				locker(3):='0';
			else
				locker(3):='1';
			end if;
		
			leds_mem(0):=spi_init_done;
			--(load_done='0' or (load_done='1' and (dump_button='1' or dump_button_mem='1'))) and 
			if spi_init_done='1' then
			
				data_Rdo<=false;
				data_Wdo<=false;
				compare_do<=false;
				transmit_do<=false;
				dump_do<=false;
				
if stop='0' and not(data_Rdo) and not(data_Wdo) and data_RWdone and not(transmit_do) and transmit_done and not(compare_do) and compare_done and not(dump_do) and dump_done then
				
				
				
				case step_var is
					when 0 =>
						--============================================
						--==  MBR : isFAT32 + FAT32_SECTOR0_OFFSET  ==
						--============================================
						get_var1(data_reader1,x"000001FE");
						--get_var1(data_reader1,x"00000000"); -- same result for SD and SDHC, x"BA"
						step_var:=32;
					when 32 =>
						-- check data(1FE)=55 (valeur fixe)
						if data_reader1 = x"55" then
							step_var:=33;
							get_var1(data_reader1,x"000001FF");
							--get_var1(data_reader1,x"00400003"); -- 4D
						end if;
					when 33 =>
						--first_BR_leds<=data_reader1;
						-- check data(1FF)=AA (valeur fixe)
						if data_reader1 = x"AA" then
							step_var:=34;
							--1BE+4=1C2
							get_var1(data_reader1,x"000001C2");
						end if;
					when 34 =>
						-- check data(1BE+4)=0B ou 0C (is_FAT32)
						if data_reader1 = x"0B" or data_reader1 = x"0C" then
							step_var:=35;
							-- 1BE+8=1C6
							get_var4(FAT32_SECTOR0_OFFSET,x"000001C6");
						end if;
					when 35 =>
						-- load data4Bytes(1BE+8) little endian, x512(=200h) = FAT32_SECTOR0_OFFSET
					   FAT32_SECTOR0_OFFSET:=fix_big_endian4(data_reader4);
						-- * 512 (=200h)
						FAT32_SECTOR0_OFFSET:=FAT32_SECTOR0_OFFSET((31-8-1) downto 0) & '0' & x"00";
						--=======================
						--==  FAT32 VARIABLES  ==
						--=======================
						get_var4(BPB_FATSz32,BPB_FATSz32_addr+FAT32_SECTOR0_OFFSET);
						step_var:=1;
					when 1 =>
						BPB_FATSz32:=fix_big_endian4(data_reader4);
--						if BPB_FATSz32=x"00003AA9" then --x"000003B0" then -- debug
							get_var4(BPB_TotSec32,BPB_TotSec32_addr+FAT32_SECTOR0_OFFSET);
							step_var:=2;
--						end if;
					when 2=>
						BPB_TotSec32:=fix_big_endian4(data_reader4);
--						if BPB_TotSec32=x"0075D000" then --x"00760000" then --debug
							get_var1(BPB_SecPerClus,BPB_SecPerClus_addr+FAT32_SECTOR0_OFFSET);
							step_var:=3;
--						end if;
					when 3=>
						BPB_SecPerClus:=fix_big_endian1(data_reader1);
--						if BPB_SecPerClus=x"04" then--x"40" then --debug
							get_var4(BPB_RootClus,BPB_RootClus_addr+FAT32_SECTOR0_OFFSET);
							step_var:=4;
--						end if;
					when 4=>
						BPB_RootClus:=fix_big_endian4(data_reader4);
--						if BPB_RootClus=x"00000002" then --x"00000002" then --debug
							get_var2(BPB_RsvdSecCnt,BPB_RsvdSecCnt_addr+FAT32_SECTOR0_OFFSET);
							step_var:=5;
--						end if;
					when 5=>
						BPB_RsvdSecCnt:=fix_big_endian2(data_reader2);
--						if BPB_RsvdSecCnt=x"0AAE" then--x"18A0" then --debug
							get_var1(BPB_NumFATs,BPB_NumFATs_addr+FAT32_SECTOR0_OFFSET);
							step_var:=6;
--						end if;
					when 6=>
						BPB_NumFATs:=fix_big_endian1(data_reader1);
--						if BPB_NumFATs=x"02" then--x"02" then -- debug
							get_var2(BPB_BytsPerSec,BPB_BytsPerSec_addr+FAT32_SECTOR0_OFFSET);
							step_var:=7;
--						end if;
					when 7=>
						--===========================================
						--== FIN DE CHARGEMENT DES VARIABLES DU BR ==
						--===========================================
						BPB_BytsPerSec:=fix_big_endian2(data_reader2);
--						if BPB_BytsPerSec=x"0200" then --x"0200" then -- debug
							FATSz := conv_integer(BPB_FATSz32); -- 15017 --944
							TotSec := conv_integer(BPB_TotSec32); -- 7720960 --7733248 alors que sous HsD j'en ai 7725056, bref l'�trange offset de 2000h
							-- 2734+2*15017=32768
							--FirstDataSector=32768
							-- BPB_RsvdSecCnt<2000h attention 2000h est exprim� en bloc512 (et non en BLOC_SIZE)
							-- BPB_RsvdSecCnt>400h donc comprend peut-�tre les secteurs avant l'offset 2000h (block512)
							FirstDataSector:=conv_integer(BPB_RsvdSecCnt)+(conv_integer(BPB_NumFATs)*FATSz) + 0;
							
							-- sector 0 liste : offset 2000h block512
							-- 0000h
							-- 0C00h bytes
							
							folder_cluster_pointer:=BPB_RootClus; --2
--							folder_sector_pointer:=getSector(folder_cluster_pointer);
							
							--((2-2)*4+32768)*512= 32768 block512
							-- sector 32768 ok : nom="FUCK3"
								--getCluster : 0 -- free cluster
							-- next(2)=2734*512+2*4 "FF FF FF 0F" 	Last cluster in file
							
							--On remarque que le secteur 32768 comprend une suite de DIRStruct de 32bytes �tal� sur 4096 bytes c'est � dire les 4 secteurs 512 du cluster
							
							-- arkanoid getCluster="42 01" 0142h=322
							--((322-2)*4+32768)*512= 34048 block512
								-- on a 4 secteurs � la suite comprenant le d�but hexa d'arkanoid
								-- suivit de 4 autres secteurs � la suite comprenant le d�but hexa d'arkanoid
							-- next 2734*512+322*4 ==> "43 01 00 00" 0143h=323 jackpot
							--filesize(arkanoid)="00 F9 02 00" 02F900=194816 octets : correct :)
							
							--si DIRStruct.name=00h alors il n'y a pas de fichier ici (entr�e vide)
	
--if conv_integer(folder_cluster_pointer)/=2 then
--	step_var:=32;
--elsif FirstDataSector/=32768 then
--	step_var:=33;
--
----return (conv_std_logic_vector(((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector,32))*BPB_BytsPerSec+FAT32_SECTOR0_OFFSET;
--elsif conv_integer(BPB_SecPerClus)/=4 then
--	step_var:=34;
--elsif conv_integer(BPB_BytsPerSec)/=512 then
--	step_var:=35;
--elsif conv_integer(FAT32_SECTOR0_OFFSET)/512 /=8192 then
--	step_var:=36;
----	return (conv_std_logic_vector(,32)+FAT32_SECTOR0_OFFSET);
--elsif (((conv_integer(folder_cluster_pointer)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec) /=32768*512 then
--	step_var:=37;
--
--else
							step_var:=25;
--end if;
--						end if;
					when 25=> -- impure variable setted, so impure function are now useable...
						folder_sector_pointer:=getSector(folder_cluster_pointer);
--						if conv_integer(folder_sector_pointer)/=(32768+8192)*512 then
--							step_var:=38;
--						else
							
							if bc(folder_cluster_pointer) then
								-- pas de FileEntry ensuite donc. (cas root)
								step_var:=27;
							else
								step_var:=8;
								folder_DirStruct_number:=0;
							end if;
--						end if;
						
	
					when 8=> -- parcour la liste de DIRStruct
						--========================================================
						--== PARCOUR LISTE DIRSTRUCT D'UN FOLDER_SECTOR_POINTER ==
						--========================================================
						if folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32) then
							-- dernier DataStruct de l'ensemble des secteurs du cluster totalement parcouru
							step_var:=9;
						else
							folder_DirStruct_number:=folder_DirStruct_number+1;
							rom_number:=0;
							step_var:=30;--10;
						end if;
					when 9=>
						--=========================
						--== NEXT FOLDER CLUSTER ==
						--=========================
						--if bc(folder_cluster_pointer) then
							-- that's all sucks
							-- pas de FileEntry ensuite donc.
							--load_done:='0';
							--switch_transmit_gripsou_dump<=SWITCH_NONE;
						--else
						get_var4(folder_cluster_pointer,getFAT(folder_cluster_pointer));
						step_var:=12;
						--end if;
					when 30=>
						--================================
						--== DETECTION FIN DE DIRSTRUCT ==
						--================================
						--compare11(x"0000000000000000000000",(conv_std_logic_vector(32768,32)+x"2000")*x"200");
						compare12(x"000000000000000000000000",folder_sector_pointer+(folder_DirStruct_number-1)*32);
						--ok compare11(x"4655434B33202020202020",folder_sector_pointer+(folder_DirStruct_number-1)*32);
						--compare11(x"414D53444F532020524F4D",conv_std_logic_vector((32768+8192)*512+3*32 ,32)); -- 32768 + 3*32
									 --414D53444F532020524F4D
						--compare11(x"464D53444F532020524F4D",conv_std_logic_vector((32768+8192)*512+3*32 ,32)); -- 32768 + 3*32
						
						step_var:=31;
					when 31=>
						if compare_result then
							step_var:=26; --fin de parcours DIRSTRUCT
							if dsk_mist and files_loaded(0)='0' then
								-- can have no disk in root dir.
								step_var:=11;
							end if;
						else
							if file_select=x"FF" then
								step_var:=55;
							else
								step_var:=10;
							end if;
						end if;
					
						
						
					when 10=>
						--=======================
						--== RECHERCHE DES ROM ==
						--=======================
						switch_transmit_gripsou_dump<=SWITCH_TRANSMIT;
						if rom_number=ROM_COUNT then
							switch_transmit_gripsou_dump<=SWITCH_NONE;
							step_var:=11;
						else
							if files_loaded(rom_number+1)='1' then
								rom_number:=rom_number+1;
								step_var:=10;
							else
								file_address:=file_rom_address(rom_number);
								--compare11(file_rom_name(rom_number),(conv_std_logic_vector(32768,32)+x"2000")*x"200");
								compare12(file_rom_name(rom_number) & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
								step_var:=13;
							end if;
						end if;
					when 11=>
						--=======================
						--== RECHERCHE DES DSK ==
						--=======================
						switch_transmit_gripsou_dump<=SWITCH_GRIPSOU;
						if files_loaded(0)='1' then
						   switch_transmit_gripsou_dump<=SWITCH_NONE;
							--if files_loaded(4 downto 0)="11111" then
							--	switch_transmit_gripsou_dump<=SWITCH_NONE;
							--end if;
							step_var:=8; -- next DIRStruct
						else
							if dsk_mist then
								--file_address:=file_dsk_address;
								--compare12(file_name & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
								--step_var:=60;
								
								file_address:=file_dsk_address;
								files_loaded(0):='1';
								file_size:=file_size_mist;
								file_cluster_pointer:=file_cluster_pointer_mist;
								step_var:=24;
							else
								file_address:=file_dsk_address;
								compare4(file_dsk_extention,folder_sector_pointer+(folder_DirStruct_number-1)*32+8);
								step_var:=21;
							end if;
						end if;
					when 12=> -- next folder cluster
						previous_folder_cluster_pointer:=folder_cluster_pointer;
						folder_cluster_pointer:=fix_big_endian4(data_reader4);
						step_var:=23;
					when 23=>
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						if bc(folder_cluster_pointer) then
							-- dernier FAT pointer : pas de FileEntry ensuite donc. (cas non root)
							-- fin de parcours DIRSTRUCT
							step_var:=26;
							if dsk_mist and files_loaded(0)='0' then
								-- can have no disk in root dir.
								step_var:=11;
							end if;
							
						else
							folder_DirStruct_number:=0;
							step_var:=8;
						end if;
					when 13=> -- search ROM
						if compare_result then
							-- nom et extention de fichier identique
							get_var1(data_reader1,folder_sector_pointer+(folder_DirStruct_number-1)*32);
							step_var:=62;
						else
							rom_number:=rom_number+1;
							step_var:=10;
						end if;
					when 62=> -- check if not a deleted ROM file
						if data_reader1 = x"E5" then
							-- this is a deleted file entry
							step_var:=8;
						else
							files_loaded(rom_number+1):='1';
							get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
							step_var:=14;
						end if;
					when 60=> -- search MiST DSK
						if compare_result then
							-- nom et extention de fichier identique
							--files_loaded(0):='1';
							get_var1(data_reader1,folder_sector_pointer+(folder_DirStruct_number-1)*32);
							step_var:=61;
						else
							step_var:=8;
						end if;
					when 61=> -- check if not a deleted MiST file
						if data_reader1 = x"E5" then
							-- this is a deleted file entry
							step_var:=8;
						else
							files_loaded(0):='1';
							get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
							step_var:=14;
						end if;
					when 14=>
						file_size:=fix_big_endian4(data_reader4);
						get_var2(file_cluster_pointer_H,folder_sector_pointer+(folder_DirStruct_number-1)*32+20);
						step_var:=15;
					when 15=>
						file_cluster_pointer_H:=fix_big_endian2(data_reader2);
						get_var2(file_cluster_pointer_L,folder_sector_pointer+(folder_DirStruct_number-1)*32+26);
						step_var:=16;
					when 16=>
						file_cluster_pointer_L:=fix_big_endian2(data_reader2);
						file_cluster_pointer:=file_cluster_pointer_H & file_cluster_pointer_L;
						step_var:=24;
					when 24=>
						file_sector_pointer:=getSector(file_cluster_pointer);
						if bc(file_cluster_pointer) then
							step_var:=29;
						else
							step_var:=17;
						end if;
					when 17=>
						-- transmition
						if file_size>conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32) then
							fillRAM(file_sector_pointer,file_address,conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec));
							file_size:=file_size-conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
							step_var:=19;
						else
							fillRAM(file_sector_pointer,file_address,conv_integer(file_size));
							step_var:=18;
							-- that's all folk
						end if;
					when 18=>
						-- that's all folk
--						step_var:=8; -- next DIRStruct
if files_loaded(3 downto 0)="1111" or files_loaded(4)='1' then
	--load_done:='1';
	switch_transmit_gripsou_dump<=SWITCH_NONE;
end if;
	--step_var:=26; -- load done
step_var:=8; -- next DIRStruct


--oui mais si c'�tait la derni�re disquette???
						
						
						
						
					when 19=>
						get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
						step_var:=20;
					when 20=>
						file_cluster_pointer:=fix_big_endian4(data_reader4);
						step_var:=22;
					when 22=>
						file_sector_pointer:=getSector(file_cluster_pointer);
						file_address:=file_address+conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
						if bc(file_cluster_pointer) then
							step_var:=18; -- that's all folk
						else
							step_var:=17; -- transmit next block to RAM
						end if;
					when 21=> -- search DSK
						if compare_result then
							get_var1(data_reader1,folder_sector_pointer+(folder_DirStruct_number-1)*32);
							step_var:=58;
						else
							step_var:=8;
						end if;
					when 58=> -- check if not a deleted file
						if data_reader1 = x"E5" then
							-- this is a deleted file entry
							step_var:=8;
						else
							-- nom et extention de fichier identique
							if dsk_number>=file_select then
								files_loaded(0):='1';
								get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
								step_var:=14;
							else
								dsk_number:=dsk_number+1;
								step_var:=8;
							end if;
						end if;
						
						

--when 24=>NULL;
--when 25=>NULL;
--when 22=>
--	file_size:=conv_std_logic_vector(BLOCK_SIZE_MAXIMUM*2,32);--conv_std_logic_vector(100000,32);
--	file_sector_pointer:=conv_std_logic_vector(0,32);
--	step_var:=23;
--when 23=>
--	-- transmition
--	if file_size>BLOCK_SIZE_MAXIMUM then
--		fillRAM(file_sector_pointer,file_sector_pointer,BLOCK_SIZE_MAXIMUM);
--		step_var:=25;
--	else
--		fillRAM(file_sector_pointer,file_sector_pointer,conv_integer(file_size));
--		-- that's all folk
--		step_var:=24;
--	end if;
--when 24=>
--	load_done:='1';
--	switch_transmit_gripsou_dump<=SWITCH_NONE;
--	step_var:=26;
--when 25=>
--	file_size:=file_size-BLOCK_SIZE_MAXIMUM;
--	file_sector_pointer:=file_sector_pointer+BLOCK_SIZE_MAXIMUM;
--	step_var:=23;
					--when 26=>NULL; -- load done
					when 27=>NULL; -- bad root folder cluster
					when 28=>NULL; -- bad next folder cluster
					when 29=>NULL; -- bad file cluster
					--when 32=>NULL; -- bad root cluster pointer debug
					--when 33=>NULL; -- bad firstaddress debug
					--when 34=>NULL; -- bad 4 debug
					--when 35=>NULL; -- bad 512 debug
					--when 36=>NULL; -- bad offset debug
					--when 37=>NULL; -- bad root address pointer debug
					--when 38=>NULL; -- bad root address pointer debug
					--when 40=>NULL; -- yeah !
					--when 41=>NULL; -- oh no !
					--when 42=>NULL; -- first rom name failed
					
					
					when 26=>
						--if files_loaded(4 downto 0)="11111" or files_loaded(5)='1' then
						-- empty dsk is not a drama, be cool in case no disk is selected in menu.
						if files_loaded(3 downto 1)="111" or files_loaded(4)='1' then
							step_var:=36; -- ok goto "Ready for DUMP !"
						end if;
					when 36=> -- Ready for DUMP !
						--waiting button press for DUMP !
						if dump_button_mem='1' then
							--permit a START-DUMP
							if dump_counter_before_reset = DUMP_COUNT_BEFORE_RESET_MAX then
								if dump_button='0' then
									dump_button_mem:='0';
								end if;
								if changeDSK_mem='0' then
									load_done:='1';
									dump_button_mem:='0';
								else
									-- goto load another disk
									files_loaded(0):='0';
									files_loaded(3 downto 0):="0000"; -- reload also ROM
									dsk_number:=(others=>'0');
									rom_number:=0;
									changeDSK_mem:='0';
									dump_button_mem:='1';
									dump_counter_before_reset:=0;
									load_done:='0';
									step_var:=0;
									--dsk_mist:=false; not determinist, prefer using OSD menu dsk selection here.
								end if;
							else
								dump_counter_before_reset:=dump_counter_before_reset+1;
							end if;
						elsif key_reset='1' then
							if changeDSK='1' then
								changeDSK_mem:='1';
							end if;
							load_done:='0';
							dump_counter_before_reset:=0;
							dump_button_mem:='1';
						elsif dump_button='1' then
							dump_button_mem:='1';
							--if files_loaded(5)='0' then
							files_loaded(4):='0';
							load_done:='0';
							dump_counter_before_reset:=0;
							if bc(folder_cluster_pointer) then
							   -- utiliser previous_folder_cluster_pointer...
								-- do create FAT Entry + FileEntry + FAT list
								step_var:=37;
							else
								-- do create             FileEntry + FAT list
								step_var:=42; -- to check
							end if;
						elsif old_downloading = '0' and dir_entry_downloading='1' then
							-- MiST OSD dir_entry (file selected)
							--file_name -- 11*8-1..0
							dsk_mist:=true;
							dir_entry_r<='1';
							step_var:=59;
							dir_entry_counter:=0; --file_name_counter:=0;
						end if;
						
					when 59=>
						--=====================================================
						--== Chargement de la disquette a partir de MiST OSD ==
						--=====================================================
						if dir_entry_ack='1' then
							--file_name( 8*(11-1-file_name_counter)+7 downto 8*(11-1-file_name_counter)+0):=dir_entry_d(7 downto 0);
							
							
							case dir_entry_counter is
								when 0=> file_name(87 downto 80):=dir_entry_d(7 downto 0);
								when 1=> file_name(79 downto 72):=dir_entry_d(7 downto 0);
								when 2=> file_name(71 downto 64):=dir_entry_d(7 downto 0);
								when 3=> file_name(63 downto 56):=dir_entry_d(7 downto 0);
								when 4=> file_name(55 downto 48):=dir_entry_d(7 downto 0);
								when 5=> file_name(47 downto 40):=dir_entry_d(7 downto 0);
								when 6=> file_name(39 downto 32):=dir_entry_d(7 downto 0);
								when 7=> file_name(31 downto 24):=dir_entry_d(7 downto 0);
								when 8=> file_name(23 downto 16):=dir_entry_d(7 downto 0);
								when 9=> file_name(15 downto 8):=dir_entry_d(7 downto 0);
								when 10=> file_name(7 downto 0):=dir_entry_d(7 downto 0);
							
								when 20=> --get_var2 file_cluster_pointer_H
									file_cluster_pointer_mist(23 downto 16):=dir_entry_d(7 downto 0);
								when 21=>
									file_cluster_pointer_mist(31 downto 24):=dir_entry_d(7 downto 0);
								when 26=> --get_var2 file_cluster_pointer_L
									file_cluster_pointer_mist(7 downto 0):=dir_entry_d(7 downto 0);
								when 27=>
									file_cluster_pointer_mist(15 downto 8):=dir_entry_d(7 downto 0);
								when 28=> --get_var4 file_size_mist
									file_size_mist(7 downto 0):=dir_entry_d(7 downto 0);
								when 29=>
									file_size_mist(15 downto 8):=dir_entry_d(7 downto 0);
								when 30=>
									file_size_mist(23 downto 16):=dir_entry_d(7 downto 0);
								when 31=> 
									file_size_mist(31 downto 24):=dir_entry_d(7 downto 0);
								when others=>NULL;
							end case;
							
							
							if dir_entry_counter=dir_entry_counter'RIGHT then
								-- goto load another disk
								files_loaded(0):='0';
								files_loaded(3 downto 0):="0000"; -- reload also ROM
								dsk_number:=(others=>'0');
								rom_number:=0;
								changeDSK_mem:='0';
								dump_button_mem:='1';
								dump_counter_before_reset:=0;
								load_done:='0';
								step_var:=0;
								dir_entry_r<='0';
							else
								dir_entry_counter:=dir_entry_counter+1;
								dir_entry_r<='1';
							end if;
						end if;
						
					when 37=> --FAT Entry just for new DIRStruct
						search_cluster:=0;
						step_var:=38;
					when 38=>
						get_var4(cluster_search,getFAT(previous_folder_cluster_pointer+search_cluster));
						step_var:=39;
					when 39=>
						cluster_search:=fix_big_endian4(data_reader4);
						if cluster_search = x"00000000" then
							--youpi
							folder_cluster_pointer:=previous_folder_cluster_pointer+search_cluster;
							set_var4(x"FFFFFFFF",getFAT(folder_cluster_pointer));
							step_var:=40;
						else
							--continue
							search_cluster:=search_cluster+1;
							step_var:=38;
						end if;
					when 40=>
						set_var4(folder_cluster_pointer,getFAT(previous_folder_cluster_pointer));
						--previous_folder_cluster_pointer:=folder_cluster_pointer;
						step_var:=41;
					when 41=>
						--nouveau folder_sector_pointer
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						folder_DirStruct_number:=0+1;
						step_var:=42;
					when 42=>
						--==================================
						--== Creation du fichier DUMP.DMP ==
						--==================================
						fillSDCARD_32BytesWithZeros(folder_sector_pointer+(folder_DirStruct_number-1)*32);
						if folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32) then
							-- dernier DataStruct de l'ensemble des secteurs du cluster totalement parcouru
							step_var:=44;
						else
							step_var:=43;
						end if;
					when 43=>
						-- on vide l'entr�e plac�e apr�s le FileEntry DUMP.DMP
						fillSDCARD_32BytesWithZeros(folder_sector_pointer+(folder_DirStruct_number-1+1)*32);
						step_var:=44;
					when 44=>
						-- �criture FileEntry DUMP.DMP
						set_var12(file_dump_name & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
						step_var:=45;
					when 45=>
						set_var4(fix_big_endian4(file_dump_size),folder_sector_pointer+(folder_DirStruct_number-1)*32 + (32-4));
						step_var:=46;
					when 46=> -- creation du file_cluster_pointer
						file_cluster_pointer:=folder_cluster_pointer;
						get_var4(cluster_search,getFAT(file_cluster_pointer));
						step_var:=47;
					when 47=>
						cluster_search:=fix_big_endian4(data_reader4);
						if cluster_search = x"00000000" then
							--youpi
							set_var4(x"FFFFFFFF",getFAT(file_cluster_pointer));
							step_var:=48;
						else
							--continue
							file_cluster_pointer:=file_cluster_pointer+1;
							get_var4(cluster_search,getFAT(file_cluster_pointer));
							step_var:=47;
						end if;
					when 48=>
						-- enregistrement du file_cluster_pointer dans le FileEntry
						file_cluster_pointer_H:=fix_big_endian2(file_cluster_pointer(31 downto 16));
						file_cluster_pointer_L:=fix_big_endian2(file_cluster_pointer(15 downto 0));
						set_var2(file_cluster_pointer_H,folder_sector_pointer+(folder_DirStruct_number-1)*32+20);
						step_var:=49;
					when 49=>
						set_var2(file_cluster_pointer_L,folder_sector_pointer+(folder_DirStruct_number-1)*32+26);
						step_var:=50;
					when 50=>
						--=======================================================
						--== Creation de l'espace FAT pour le fichier DUMP.DMP ==
						--=======================================================
						--folder_sector_pointer:=fix_big_endian4(data_reader4);
						file_size:=file_dump_size;
						file_address:=x"00000000";
						file_sector_pointer:=getSector(file_cluster_pointer);
						switch_transmit_gripsou_dump<=SWITCH_DUMP;
						step_var:=51;
					when 51=>
						-- transmition
						if file_size>conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32) then
							fillSDCARD(file_address,file_sector_pointer,conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec));
							
							--set_var4(x"BABACAAA",file_sector_pointer);
							
							file_size:=file_size-conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
							step_var:=52;
						else
							fillSDCARD(file_address,file_sector_pointer,conv_integer(file_size));
							
							--set_var4(x"BABACAFE",file_sector_pointer);
							
							step_var:=54;
							-- that's all folk
						end if;
					when 52=> -- on �crit le FAT et on avance (pas � la rache !)
						previous_file_cluster_pointer:=file_cluster_pointer;
						file_cluster_pointer:=file_cluster_pointer+1;
						get_var4(cluster_search,getFAT(file_cluster_pointer));
						step_var:=53;
					when 53=>
						cluster_search:=fix_big_endian4(data_reader4);
						if cluster_search = x"00000000" then
							-- youpi
							set_var4(fix_big_endian4(file_cluster_pointer),getFAT(previous_file_cluster_pointer));
							file_sector_pointer:=getSector(file_cluster_pointer);
							file_address:=file_address+conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
							step_var:=51;
						else
							file_cluster_pointer:=file_cluster_pointer+1;
							get_var4(cluster_search,getFAT(file_cluster_pointer));
							step_var:=53;
						end if;
					when 54=> -- conclusion du fichier.
						set_var4(fix_big_endian4(x"FFFFFFFF"),getFAT(file_cluster_pointer));
						-- that's all folk
						switch_transmit_gripsou_dump<=SWITCH_NONE;
						files_loaded(4):='1'; -- evitons de relire le fichier inutilement.
						--dump_button_mem:='0';
						-- meme joueur joue encore
						if bc(folder_cluster_pointer) then
							-- anomalie
							step_var:=57;
						else
							-- j'�tais dans un DIRSTRUCT non termin� ou sinon j'avais cr�� un nouveau DIRSTRUCT pour mon nouveau fichier DUMP.DMP
							--folder_DirStruct_number:=folder_DirStruct_number+1;
							step_var:=8;
						end if;
						
						
						--step_var:=26; 
						
						
						
					when 55=>
						--=======================
						--== RECHERCHE DU DUMP ==
						--=======================
						switch_transmit_gripsou_dump<=SWITCH_TRANSMIT;
						if files_loaded(4)='1' then
							switch_transmit_gripsou_dump<=SWITCH_NONE;
							step_var:=8; -- next DIRStruct
						else
							file_address:=x"00000000";
							--compare11(file_rom_name(rom_number),(conv_std_logic_vector(32768,32)+x"2000")*x"200");
							compare12(file_dump_name & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
							step_var:=56;
						end if;
					when 56=> -- search DUMP
						if compare_result then
							-- nom et extention de fichier identique
							files_loaded(4):='1';
							get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
							step_var:=14;
						else
							step_var:=8; -- next DIRStruct
						end if;
					when 57=> NULL; -- cas impossible (nouveau DIRSTRUCT/folder_cluster_pointer d�fectueux)
				end case;
				
				old_downloading:=dir_entry_downloading;
end if;
			end if;
		--end if; --if rising_edge(CLK) then
		
		
		
		
		
		
--			--=======================================
--			--h   ee rrr  cc u u l ee
--			--hhh e  r   c   u u l e
--			--h h ee r    cc uuu l ee FUSION !
--			--=======================================
--			
--			if herculeInsert_do and not(herculeInsert_done) then
--				hercule_addr_mem:=hercule_addr;
--				hercule_step:=7;
--			end if;
--		
--			-- entr�e : disk s�lectionn� (adresse du d�but + lenght)
--			-- pr�requi : disquette align�e (defrag)
--			if FDD_step ='1' then
--				if FDD_directionSelect='1' then
--					-- vers le bord / vers track00
--					hercule_step:=1;
--				else
--					-- vers le milieu
--					hercule_step:=0;
--				end if;
--			elsif negociate_do then
--				negociate_do:=false;
--			end if;
--			--elsif negociate_done and FDD_writeGate='0' and popValue then
--			
--			--end if;
--			negociate_do:=false;
--			--index_do:=false;
--			curSide :=FDD_sideOneSelect;
--			case hercule_step is
--				when 0=> -- changement de TRACK +1
--					if curTrack<maxTrack then
--						curTrack:=curTrack+1; curSector:=0;curIdSectorDone:=false;
--					end if;
--					-- do negociate
--					curIndex:=0;
--					hercule_step:=2;
--				when 1=> -- changement de TRACK -1
--					if curTrack>0 then
--						curTrack:=curTrack-1;
--					end if;
--					-- do negociate
--					curIndex:=0;
--					hercule_step:=2;
--				when 2=> -- goto INDEX
--					if curIndex=4 then
--						--index done, goto negociate (GAP during work)
--						hercule_step:=3;
--						curPatternByte:=0;
--						curPatternBit:=0;
--						storyId_done:=false;
--						story_done:=false;
--						storyId_do:=true;
--						story_do:=true;
--					else
--						curIndex:=curIndex+1;
--					end if;
--				
--				when 3=> -- NEGOCIATING
--					if curPatternByte=8 then
--						if storyId_done then
--							hercule_step:=4;
--						elsif story_done then
--							hercule_step:=5;
--						else
--							curPatternByte:=0;
--							curPatternBit:=0;
--						end if;
--					else
--						if	curPatternBit=8 then
--							curPatternBit:=0;
--							curPatternByte:=curPatternByte+1;
--						else
--							curPatternBit:=curPatternBit+1;
--						end if;
--					end if;
--				when 4=>NULL; -- unknown
--				when 5=> -- telling story Id
--				when 6=> -- telling story
--				when 7=> -- INSERT disk
--					get_var1(data_reader1,hercule_addr_mem);
--					hercule_step:=8;
--				when 8=>
--					if data_reader1=x"45" then -- E
--						is_extended:=true;
--					else 
--						is_extended:=false;
--					end if;
--					get_var1(nbTracks,hercule_addr_mem+30);
--					hercule_step:=9;
--				when 9=>
--					nbTracks:=data_reader1;
--					get_var1(data_reader1,hercule_addr_mem+31);
--					hercule_step:=10;
--				when 10=>
--					if data_reader1(0)='1' then
--						doubleSide:=true;
--					else
--						doubleSide:=false;
--					end if;
--					if is_extended then
--						get_var2(generalTrackSize,hercule_addr_mem+32);
--						hercule_step:=11;
--					else
--						hercule_step:=12;
--					end if;
--				when 11=>
--					generalTrackSize:=data_reader2;
--					hercule_step:=12;
--				when 12=>
--					curTrack:=0;
--					-- do negociate
--					curIndex:=0;
--					hercule_step:=2;
--			end case;
--			
--			if story_do and storyId_done then
--				-- building storyId (CHRN)
--				storyId_done:=false;
--				story_done:=false;
--				herculeStory_step:=1;
--			elsif story_do and not(story_done) then
--				-- building story (512Ko)
--			end if;
--			
--			if story_do and not(storyId_done) then
--				case herculeStory_step is
--					when 0=>NULL; -- thanks;
--					when 1=>
--						if is_extended then
--							-- parcourir le tableau de taille, additionner...
--						else
--							if curTrack=0 then
--								trackBegin:=x"00000100";
--							else
--								trackBegin:=trackBegin+generalTrackSize;
--							end if;
--							trackEnd:=trackBegin+generalTrackSize;
--							trackIdPointer:=trackBegin;
--							herculeStory_step:=2;
--						end if;
--					when 2=>	-- STORY STATE : saying I'm in index state
--						get_var2(data_reader2,trackIdPointer+10);
--						--next Id story
--						herculeStory_step:=3;
--					when 3=>
--						trackN:=data_reader2(15 downto 8);
--						trackS:=data_reader2(7 downto 0);
--						get_var4(data_reader4,trackIdPointer+14);
--						herculeStory_step:=4;
--					when 4=>
--						trackSectorSize:=data_reader4(31 downto 24);
--						trackSectorCount:=data_reader4(23 downto 16);
--						trackSectorGap3Length:=data_reader4(15 downto 8);
--						trackSectorGap3Filler:=data_reader4(7 downto 0);
--						sectorInfoBlock:=trackIdPointer+x"18";
--						curSectorInfoBlock:=sectorInfoBlock;
--						sectorData:=trackBegin+x"100";
--						curSectorData:=sectorData;
--						get_var4(data_reader4,curSectorInfoBlock);
--						storyIndex_done:=true;
--						herculeStory_step:=5;
--					when 5=> -- STORY STATE : reading Sector Info number curSector
--						sectorInfoCHRN:=data_reader4;
--						get_var4(data_reader4,curSectorInfoBlock+4);
--						herculeStory_step:=6;
--					when 6=>
--						if is_extended then
--							sectorDataLength:=data_reader4(15 downto 0);
--						else
--							sectorDataLength:=conv_std_logic_vector(512,16);
--						end if;
--						storyId_done:=true;
--						curSectorInfoBlock:=curSectorInfoBlock+8;
--						herculeStory_step:=7;
--					when 7=>	-- STORY STATE : reading Sector Data number curSector
--						fillRAMSector(curSectorData,sectorDataLength);
--						curSectorData:=curSectorData+sectorDataLength;
--						curSector:=curSector+1;
--						if curSector=trackSectorCount then
--							curSector:=0;
--							storyId_done:=true;
--							herculeStory_step:=2;
--						else
--							herculeStory_step:=5;
--						end if;
--				end case;
--			end if;
--			
--			if curTrack=0 then
--				FDD_Track00<='1';
--			else
--				FDD_Track00<='0';
--			end if;
--			FDD_writeProtect<='0';
--			FDD_diskChange<='0';
--			FDD_isHD<='0'; -- 750Ko
		end if;
		
	end process tortue_geniale;
	
	gripsou:process(CLK) is
		variable gripsou_step:integer range 0 to 25:=0;
		variable input_A:std_logic_vector(31 downto 0):=(others=>'0');
		variable data_mem:std_logic_vector(7 downto 0);
		variable winape_offs:std_logic_vector(31 downto 0):=(others=>'0');
		variable extended:boolean:=false;
		variable winape:boolean:=false;
		variable nb_tracks:integer range 0 to 63:=0; -- super cauldron has 42 tracks !!!
		variable no_track:integer range 0 to 63:=0; -- force simple face
		variable nb_sides:integer range 0 to 3:=1;
		variable no_side:integer range 0 to 3:=0;
		variable nb_sects:integer range 0 to 14:=9; -- super cauldron has 10 sectors !!
		--variable sectID:std_logic_vector(7 downto 0);
		variable no_sect:integer range 0 to 14;
		--type track_size_type is array(0 to 39) of std_logic_vector(15 downto 0);
		--variable track_size:track_size_type;
		variable track_size:std_logic_vector(15 downto 0);
		--variable ucpm:std_logic:='0';
		type sector_sizes_type is array(0 to 6) of std_logic_vector(15 downto 0);
		--constant SECTOR_SIZE:sector_sizes_type:=(x"0080",x"0100",x"0200",x"0400",x"0800",x"1000",x"1800");
		constant SECTOR_SIZE:std_logic_vector(15 downto 0):=x"0200";
		variable sectSize:std_logic_vector(15 downto 0);
		variable sector_countdown:integer range 0 to 9;
		variable track_countdown:integer range 0 to 40*2;
		variable gripsou_ram_A_mem:std_logic_vector(gripsou_ram_A'range);
		type sector_order_type is array(0 to 8) of integer range 0 to 8;
		variable sector_order:sector_order_type;
		--variable gripsou_sdram_wait: integer range 0 to SDRAM_ASYNC_DELTA;
	begin
		--is_ucpm<=ucpm;
		if rising_edge(CLK) then
			leds_gripsou<=conv_std_logic_vector(gripsou_step,8);
			gripsou_ram_D<=(others=>'Z');
			gripsou_ram_W<='0';
			if switch_transmit_gripsou_dump=SWITCH_NONE then
				gripsou_step:=0;
			end if;
			if gripsou_write='1' and switch_transmit_gripsou_dump=SWITCH_GRIPSOU then
				data_mem:=gripsou_data;
				case gripsou_step is
					when 0=> -- disk ID
						if input_A=x"00000000" then
							if data_mem=x"45" then
								extended:=true;
							elsif data_mem=x"4D" then
								extended:=false;
--								gripsou_step:=25; -- debug
							end if;
						end if;
--						if gripsou_address(15 downto 0)/=input_A(15 downto 0) then
--							gripsou_step:=26;
--							--leds<=input_A(7 downto 0);
--						end if;
						input_A:=input_A+1;
						if input_A>x"00000021" then
							gripsou_step:=1;
						end if;
					when 1=> -- disk creator
						if input_A=x"00000022" then
							if data_mem=x"57" then
								winape:=true;
--								gripsou_step:=26; -- debug
							else
								winape:=false;
								--leds<=data_mem;
								--gripsou_step:=22; -- debug
							end if;
						end if;
						input_A:=input_A+1;
						if input_A>x"0000002f" then
							gripsou_step:=2;
						end if;
					when 2=>
						nb_tracks:=conv_integer(data_mem);
						input_A:=input_A+1;
--						if (nb_tracks/=42) then
--							gripsou_step:=26; --debug
--						else
							gripsou_step:=3;
--						end if;
					when 3=>
						if input_A=x"00000031" then
							nb_sides:=conv_integer(data_mem);
						end if;
						input_A:=input_A+1;
						--if (nb_sides/=1) then
						--	gripsou_step:=24;
						--else
							gripsou_step:=4;
						--end if;
        			when 4=>
						if input_A=x"00000032" then
--							for i in 0 to 39 loop
								--track_size(i)(7 downto 0):=track_size(i)(15 downto 8);
								--track_size(i)(15 downto 8):=data_mem;
								track_size(7 downto 0):=data_mem;
								--track_size(7 downto 0):=track_size(15 downto 8);
							--end loop;
						elsif input_A=x"00000033" then
							track_size(15 downto 8):=data_mem;
						end if;
						input_A:=input_A+1;
						if input_A>x"00000033" then
							if extended then
								gripsou_step:=5;
								no_track:=0;
							else
								gripsou_step:=6;
							end if;
						end if;
					when 5=>
						track_size:=data_mem & x"00";
						no_track:=no_track+1;
						input_A:=input_A+1;
						if no_track>=nb_tracks then
--							if track_size/=x"1500" then
--								gripsou_step:=27;
--							else
								gripsou_step:=6;
--							end if;
						end if;
					when 6=> -- avancer jusqu'au d�but track-info
						input_A:=input_A+1;
						if input_A>x"000000FF" then --==============================================
							gripsou_step:=7;
							no_track:=0;
							input_A:=(others=>'0'); -- rembobine
							winape_offs:=(others=>'0'); -- rembobine
						end if;
					when 7=> -- pour chaque track
						input_A:=input_A+1;
						if input_A>x"0000000F" then
							gripsou_step:=10;
						end if;
					when 8=>NULL;
					when 9=>NULL;
					when 10=>
						input_A:=input_A+1;
						if input_A>x"0000000014" then
							gripsou_step:=11;
						end if;
					when 11=>
						nb_sects:=conv_integer(data_mem);
						input_A:=input_A+1;
--						if nb_sects/=10 then
--							gripsou_step:=28;
--						else
							gripsou_step:=12;
--						end if;
					when 12=>
						input_A:=input_A+1;
						if input_A>x"0000000017" then --===============================================
							gripsou_step:=13;
							--winape_offs:=winape_offs+input_A;
							--input_A:=(others=>'0');
							no_sect:=0;
						end if;
					when 13=> -- first sector info of sector info list
						-- C
						input_A:=input_A+1;
						if conv_integer(data_mem)/=no_track then -- deraillage
							gripsou_step:=25;
						else
							gripsou_step:=14;
						end if;
					when 14=>
						-- H
						no_side:=conv_integer(data_mem);
						input_A:=input_A+1;
						--if no_side/=0 then
						--	gripsou_step:=29;
						--else
							gripsou_step:=15;
						--end if;
					when 15=>
						-- R
						--sectID:=data_mem;
						sector_order(no_sect):=conv_integer(data_mem(3 downto 0))-1;
						input_A:=input_A+1;
						--if no_sect/=0 then
						--	gripsou_step:=30;
						--else
							gripsou_step:=16;
						--end if;
						if data_mem>=x"C1" then
							is_ucpm<='0';
						else
							is_ucpm<='1';
						end if;
					when 16=>
						-- N
						sectSize:=SECTOR_SIZE; --(conv_integer(data_mem)); -- must be 2 then 512
						input_A:=input_A+1;
						
						--if data_mem/=x"02" then
						--	gripsou_step:=31;
						--else
							gripsou_step:=21;	
						--end if;
					when 21=>
						input_A:=input_A+1;
						gripsou_step:=22;
					when 22=>
						input_A:=input_A+1;
						gripsou_step:=23;
					when 23=>
						input_A:=input_A+1;
						gripsou_step:=24;
					when 24=>
						input_A:=input_A+1;
						no_sect:=no_sect+1;
						if no_sect>=nb_sects then
							gripsou_step:=17;
						else
							gripsou_step:=13;
						end if;
						
						
						
					when 17=>
						input_A:=input_A+1;
						if input_A>x"000000FF" then --=============================================
							gripsou_step:=18;
							no_sect:=0;
							no_side:=0;
							--no_track:=0;
							winape_offs:=winape_offs+input_A;
							input_A:=(others=>'0');
						end if;
					when 18=> -- data transmit
						gripsou_ram_A_mem:="00" & "1" & conv_std_logic_vector(no_track,6) & conv_std_logic_vector(no_side,1) & conv_std_logic_vector(sector_order(no_sect),4) & input_A(8 downto 0);
						gripsou_ram_A<=gripsou_ram_A_mem;
						--if no_track<32 then -- 2^5=32 donc de 0 � 31, donc moins de 40 !
							gripsou_ram_W<='1';
						--end if;
						gripsou_ram_D<=data_mem;
					--	gripsou_sdram_wait:=0;
					--	if gripsou_sdram_wait = SDRAM_ASYNC_DELTA then
					--		gripsou_step:=26;
					--	else
					--		gripsou_step:=27;
					--	end if;
					--when 27=>
					--	gripsou_ram_W<='1';
					--	if gripsou_sdram_wait = SDRAM_ASYNC_DELTA then
					--		gripsou_step:=26;
					--	else
					--		gripsou_sdram_wait:=gripsou_sdram_wait+1;
					--	end if;
					--when 26 => -- async write : alterner 1 et 0...
					--	gripsou_ram_W<='0';
						--if no_track=0 and no_sect=0 and input_A=1 and data_mem/=x"47" then
						--	gripsou_step:=32;
						--elsif no_track=1 and no_sect=0 and input_A=0 and data_mem/=x"8C" then
						--	gripsou_step:=33;
						--else
							input_A:=input_A+1;
							if input_A>=sectSize then
								no_sect:=no_sect+1;
								winape_offs:=winape_offs+input_A;
								input_A:=(others=>'0');
								if	no_sect=nb_sects then
									no_track:=no_track+1;
									no_sect:=0;
									if	no_track=nb_tracks then
										gripsou_step:=20;
									else
										if winape then
											gripsou_step:=7;
										else
											--if winape_offs=track_size(no_track) then
											if winape_offs=track_size then
												winape_offs:=(others=>'0');
												gripsou_step:=7;
											else
												gripsou_step:=19;
											end if;
										end if;
									end if;
								else
									gripsou_step:=18;
								end if;
							end if;
						--end if;
					when 19=> -- not winape
						winape_offs:=winape_offs+1;
						--if winape_offs=track_size(no_track) then
						if winape_offs=track_size then
							winape_offs:=(others=>'0');
							input_A:=(others=>'0');
							gripsou_step:=7;
						end if;
					when 20=>NULL; -- fin
					when 25=>NULL; -- deraillage : no_track incorrect
				end case;
			end if;
		end if;
	end process gripsou;
	
	
	
	
-- Hercule sector loading buffer	
--RAMB16_S9_inst : RAMB16_S9
--port map (
--   DO => data_block_Dout,      -- 8-bit Data Output
--   DOP => open,    -- 1-bit parity Output
--   ADDR => RAMB16_S9_address,  -- 11-bit Address Input
--   CLK => CLK,    -- Clock
--   DI => data_block_Din,      -- 8-bit Data Input
--   DIP => parity,    -- 1-bit parity Input
--   EN => '1',      -- RAM Enable Input
--   SSR => '0',    -- Synchronous Set/Reset Input
--   WE => data_block_W       -- Write Enable Input
--);

-- Death code
--RAMB16_S9_inst : MiST_RAMB16_S9 PORT MAP (
--		address	 => RAMB16_S9_address,
--		clock	 => CLK,
--		data	 => data_block_Din,
--		wren	 => data_block_W,
--		q	 => data_block_Dout
--	);

--RAMB16_S9_address<="00" & data_block_A;
--parity(0)<=data_block_Din(0) xor data_block_Din(1) xor data_block_Din(2) xor data_block_Din(3) xor data_block_Din(4) xor data_block_Din(5) xor data_block_Din(6) xor data_block_Din(7);
	

end Behavioral;