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
-- FPGAmstrad_bootloader_sd.SDRAM_FAT32_LOADER
-- Fill RAM with content, at boot.
-- FAT32 protocol
-- see SDRAM_SPIMASTER.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;

-- Address wire between fat32_loader and spi_master is done in bytes, so we are limited to 4GB
-- There is no data buffer on fat32_loader, the buffer does exist on spi_master
entity SDRAM_FAT32_LOADER is
	Generic (
		-- SPI seems speak only with 512 byte blocks
		-- Windows do not format in 512 block
		BLOCK_SIZE_MAXIMUM:integer:=65536; --4096; -- bytes
		BLOCK_SQRT:integer:=9; -- 2^BLOCK_SQRT=BLOCK_SIZE_MAXIMUM (=512 :P)
		SDRAM_ASYNC_DELTA:integer:=0; -- 0 or more : go more and more slower with SDRAM_ASYNC access delays. More a problem of AUTO-REFRESH I think...
		--FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400C00" -- in byte
		--FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400000" -- in byte
		-- CLK : @4MHz
		RAM_INIT_PERIOD:integer:=16; -- wait 1ms (32 8Mhz cycles) after FPGA config is done before going
		RAM_REFRESH_PERIOD:integer:=16 -- into normal operation. Initialize the ram in the last 16 reset cycles (cycles 15-0)

	);
    Port ( CLK:in STD_LOGIC;
           --file_select:in std_logic_vector(7 downto 0);
           ram_A : out  STD_LOGIC_VECTOR (22 downto 0):=(others=>'0');
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  ram_Dout : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
           ram_W : out  STD_LOGIC:='0';
		   ram_R : out  STD_LOGIC:='0';
           spi_A : out  STD_LOGIC_VECTOR (31 downto 0);
			  spi_A_block : out  STD_LOGIC_VECTOR (8 downto 0);
           spi_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  spi_Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           spi_Rdo : out  STD_LOGIC;
           spi_Rdone : in  STD_LOGIC;
           spi_Wdo : out  STD_LOGIC;
			  spi_Wblock : out  STD_LOGIC;
           spi_Wdone : in  STD_LOGIC;
			  spi_init_done : in STD_LOGIC;
			  dump_button: in std_logic:='0';
			  load_init_done:out std_logic;
			  --is_dskReady:out std_logic_vector(1 downto 0):="00";
			  key_reset:in std_logic_vector(1 downto 0); -- key_reset : 1, key_reset_space : 0
			  --changeDSK : in std_logic;
			  
			  -- MiST OSD dir_entry (file selected)
			  dir_entry_clk:out std_logic;
			  dir_entry_d: in std_logic_vector(7 downto 0);
			  dir_entry_r:out std_logic;
			  dir_entry_ack:in std_logic;
			  dir_entry_downloading:in std_logic;-- falling_edge
			  
			  init_RAM: out std_logic; -- '1' init_RAM, '0' refresh_RAM
			  
			  -- simpleCDT interface
			  jacquie_phase : out STD_LOGIC_VECTOR(2 downto 0);
			  jacquie_length : out STD_LOGIC_VECTOR(8*2-1 downto 0); -- data_length or pulse_length or pause_length
			  jacquie_count : out STD_LOGIC_VECTOR(8*2-1 downto 0); -- pulse count
			  jacquie_byte : out STD_LOGIC_VECTOR(8-1 downto 0); -- data byte
			  jacquie_do : out STD_LOGIC:='0';
			  jacquie_done : in STD_LOGIC;
			  jacquie_no_block : out STD_LOGIC_VECTOR(15 downto 0);
			  
			  leds8_debug : out STD_LOGIC_VECTOR (19 downto 0)
			  );
			  	--attribute keep : string;
				--attribute keep of file_select : signal is "TRUE";

			  
end SDRAM_FAT32_LOADER;

architecture Behavioral of SDRAM_FAT32_LOADER is

	constant IS_ARNOLDEMU_TESTBENCH:boolean:=false; -- do not corrupt fdctest.dsk file, FDCTEST.ASM &41 41FAIL06

	constant PREFIX:std_logic_vector(8 downto 0):="0" & x"00";

	--constant sampleSector : STD_LOGIC_VECTOR(8*16*2-1 downto 0) := x"004441525453313830A020200000004902030405060708090A0B000000000000";

	constant ATTR_ARCHIVE:std_logic_vector(7 downto 0):=x"20";
	constant file_dsk_extention:std_logic_vector((4)*8-1 downto 0):=x"434454" & ATTR_ARCHIVE; -- CDT & ATTR_ARCHIVE
	constant file_ezz_extention:std_logic_vector((4)*8-1 downto 0):=x"455A5A" & ATTR_ARCHIVE; -- RZZ & ATTR_ARCHIVE
	subtype name_type is std_logic_vector(11*8-1 downto 0);
	subtype address_type is std_logic_vector(31 downto 0);
	
	constant file_dump_name: name_type := x"44554D5020202020444D50"; -- DUMP.DMP
	constant file_dump_size: address_type := x"00200000"; -- ram_A(20:0) -- 20sec
	
	-- following English Wiki : file allocation table
	constant BPB_RsvdSecCnt_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"0000000e";
	constant BPB_NumFATs_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"00000010";
	constant BPB_FATSz32_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"00000024";
	constant BPB_SecPerClus_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"0000000d";
	constant BPB_RootClus_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"0000002c"; 
	constant BPB_TotSec32_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"00000020";
	constant BPB_BytsPerSec_addr:STD_LOGIC_VECTOR(40 downto 0):=PREFIX & x"0000000B";
	
	signal data_reader1:STD_LOGIC_VECTOR(7 downto 0);
	signal data_reader2:STD_LOGIC_VECTOR(15 downto 0);
	signal data_reader4:STD_LOGIC_VECTOR(31 downto 0);
	--signal data_writer1:STD_LOGIC_VECTOR(7 downto 0);
	signal data_writer2:STD_LOGIC_VECTOR(15 downto 0);
	signal data_writer4:STD_LOGIC_VECTOR(31 downto 0);
	
	signal data_Rdo:boolean:=false;
	signal data_Wdo:boolean:=false;
	signal data_addr:STD_LOGIC_VECTOR(40 downto 0); -- data is used in order to load BR values
	signal data_length:integer range 1 to 5:=1;
	signal data_RWdone:boolean:=true;
	signal data_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal data_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'0');
	signal data_spi_Rdo:std_logic:='0';
	signal data_spi_Wdo:std_logic:='0';
	
	signal compare_to12:STD_LOGIC_VECTOR(8*12-1 downto 0);
	signal compare_extention :boolean;
	signal compare_extentionEZZorEFF :boolean;
	
	signal compare_length : integer range 3 to 12:=3;
	signal compare_result :boolean;
	signal compare_resultEZZ :boolean;
	signal compare_resultDSK :boolean;
	signal compare_resultFF :STD_LOGIC_VECTOR(7 downto 0);
	signal compare_address:STD_LOGIC_VECTOR(40 downto 0);
	signal compare_do :boolean:=false;
	signal compare_done :boolean:=true;
	signal compare_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal compare_spi_Rdo:std_logic:='0';

	signal transmit_address_from:STD_LOGIC_VECTOR(40 downto 0);
	signal transmit_address_to:STD_LOGIC_VECTOR(40 downto 0);
	signal transmit_length:integer range 0 to BLOCK_SIZE_MAXIMUM;
	signal transmit_do:boolean:=false;
	signal transmit_done:boolean:=true;
	signal transmit_doRAMinit:boolean:=false;
	signal transmit_doRAMfill:boolean:=false;
	signal transmit_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal transmit_spi_Rdo:std_logic:='0';

	signal dump_address_from:STD_LOGIC_VECTOR(40 downto 0);
	signal dump_address_to:STD_LOGIC_VECTOR(40 downto 0);
	signal dump_length:integer range 0 to BLOCK_SIZE_MAXIMUM;
	signal dump_do:boolean:=false;
	signal dump_done:boolean:=true;
	signal dump_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal dump_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'0');
	signal dump_spi_Wdo:std_logic:='0';
	signal dump_spi_Wblock:std_logic:='0';
	
	constant SWITCH_NONE:integer:=0;
	constant SWITCH_TRANSMIT:integer:=1;
	constant SWITCH_DUMP:integer:=2;
	constant SWITCH_COMPARE:integer:=3;
	constant SWITCH_BR:integer:=4;
	constant SWITCH_jacquie:integer:=5;
	
	
	signal switch_br_compare_transmit_dump_jacquie:integer range 0 to 5:=SWITCH_NONE;
	
	signal switch_transmit_dump:integer range 0 to 2:=SWITCH_NONE;

	signal dump_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal dump_ram_R:std_logic:='0';
	signal transmit_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal transmit_ram_D:std_logic_vector(ram_Din'range):=(others=>'0');
	signal transmit_ram_W:std_logic:='0';
	
	signal jacquie_changeCDT_do:boolean:=false;
	signal jacquie_changeCDT_done:boolean:=true;
	signal jacquie_addr:std_logic_vector(40 downto 0):=(others=>'0');
	signal meca_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal meca_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'0');
	signal meca_spi_Rdo:std_logic:='0';
	signal meca_spi_Wdo:std_logic:='0';
	signal meca_spi_Wblock:std_logic:='0';
	signal jacquie_do_s:std_logic:='0';
	
	constant JACQUIE_PHASE_PILOT:integer:=0;
	constant JACQUIE_PHASE_PULSE:integer:=1; -- SYNC1 or SYNC2 or several distinct PULSE
	constant JACQUIE_PHASE_BIT0 :integer:=2;
	constant JACQUIE_PHASE_BIT1 :integer:=3;
	constant JACQUIE_PHASE_BLOCK:integer:=4;
	constant JACQUIE_PHASE_BLOCK_CONTINUE:integer:=5;
	constant JACQUIE_PHASE_PAUSE:integer:=6;
	
	
	signal key_reset_space:std_logic:='0';
begin

	-- MiST dir entry (menu select)
	dir_entry_clk<=CLK;

	jacquie_do<=jacquie_do_s;

	ram_A<= transmit_ram_A when switch_transmit_dump=SWITCH_TRANSMIT else dump_ram_A when switch_transmit_dump=SWITCH_DUMP else (others=>'0');
	ram_Dout<= transmit_ram_D when switch_transmit_dump=SWITCH_TRANSMIT else (others=>'0');
	ram_W<= transmit_ram_W when switch_transmit_dump=SWITCH_TRANSMIT else '0';
	ram_R<= dump_ram_R when switch_transmit_dump=SWITCH_DUMP else '0';
	
	
	spi_A(31 downto 0)<=data_spi_A(40 downto 9) when switch_br_compare_transmit_dump_jacquie=SWITCH_BR
		else compare_spi_A(40 downto 9) when switch_br_compare_transmit_dump_jacquie=SWITCH_COMPARE
		else transmit_spi_A(40 downto 9) when switch_br_compare_transmit_dump_jacquie=SWITCH_TRANSMIT
		else dump_spi_A(40 downto 9) when switch_br_compare_transmit_dump_jacquie=SWITCH_DUMP
		else meca_spi_A(40 downto 9) when switch_br_compare_transmit_dump_jacquie=SWITCH_jacquie
		else (others=>'0');
	spi_A_block(8 downto 0)<=data_spi_A(8 downto 0) when switch_br_compare_transmit_dump_jacquie=SWITCH_BR
		else compare_spi_A(8 downto 0) when switch_br_compare_transmit_dump_jacquie=SWITCH_COMPARE
		else transmit_spi_A(8 downto 0) when switch_br_compare_transmit_dump_jacquie=SWITCH_TRANSMIT
		else dump_spi_A(8 downto 0) when switch_br_compare_transmit_dump_jacquie=SWITCH_DUMP
		else meca_spi_A(8 downto 0) when switch_br_compare_transmit_dump_jacquie=SWITCH_jacquie
		else (others=>'0');

	spi_Rdo<=data_spi_Rdo when switch_br_compare_transmit_dump_jacquie=SWITCH_BR
		else compare_spi_Rdo when switch_br_compare_transmit_dump_jacquie=SWITCH_COMPARE
		else transmit_spi_Rdo when switch_br_compare_transmit_dump_jacquie=SWITCH_TRANSMIT
		else meca_spi_Rdo when switch_br_compare_transmit_dump_jacquie=SWITCH_jacquie
		else '0';
	spi_Wdo<=data_spi_Wdo when switch_br_compare_transmit_dump_jacquie=SWITCH_BR
		else dump_spi_Wdo when switch_br_compare_transmit_dump_jacquie=SWITCH_DUMP
		else meca_spi_Wdo when switch_br_compare_transmit_dump_jacquie=SWITCH_jacquie
		else '0';
		
	spi_Wblock<=dump_spi_Wblock when switch_br_compare_transmit_dump_jacquie=SWITCH_DUMP
		else meca_spi_Wblock when switch_br_compare_transmit_dump_jacquie=SWITCH_jacquie
		else '0';
		
	spi_Dout<=dump_spi_Dout when switch_br_compare_transmit_dump_jacquie=SWITCH_DUMP
		else data_spi_Dout when switch_br_compare_transmit_dump_jacquie=SWITCH_BR
		else meca_spi_Dout when switch_br_compare_transmit_dump_jacquie=SWITCH_jacquie
		else (others=>'0');

	-- Permit to load BR values, and also some others variables
	spi_to_loader: process(CLK) is
		variable data_step:integer range 0 to 15:=0;
		variable data_cursor:integer range 0 to 31:=0;
		variable data_reader1_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable data_reader2_mem:std_logic_vector(15 downto 0):=(others=>'0');
		variable data_reader4_mem:std_logic_vector(31 downto 0):=(others=>'0');
		--variable data_writer1_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable data_writer2_mem:std_logic_vector(15 downto 0):=(others=>'0');
		variable data_writer4_mem:std_logic_vector(31 downto 0):=(others=>'0');
		
	begin
		if rising_edge(CLK) then
			data_reader1<=data_reader1_mem;
			data_reader2<=data_reader2_mem;
			data_reader4<=data_reader4_mem;
			
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
			
			data_spi_Rdo<='0';
			data_spi_Wdo<='0';
			
			if not data_RWdone then
				if not(data_spi_Wdo='1') and spi_Wdone='1' and not(data_spi_Rdo='1') and spi_Rdone='1'  then
						
					case data_step is
						when 0=>
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
						when 5 => -- variable transfer completed
							data_spi_Dout<=(others=>'0'); -- relax
							data_RWdone<=true;
							data_step:=11;
						when 6=>NULL; -- over run
						when 7 => -- write
							data_cursor:=0;
							data_spi_A<=data_addr +data_cursor;
							case data_length is
								when 1 => NULL; -- 1 byte
									--data_writer1_mem:=data_writer1;
									--data_spi_Dout(7 downto 0)<=data_writer1_mem(7 downto 0);
									--data_spi_Wdo<='1';
									--data_step:=5;
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

		-- check if it is ascii DSK
		function checkCDT(ff : std_logic_vector(23 downto 0)) return boolean is
		begin
			if ff=x"434454" then --if ff=x"44534B" then
				return true;
			else
				return false;
			end if;
		end function;
		
		-- check if it is ascii RZZ (lower ROM)
		function checkEZZ(ff : std_logic_vector(23 downto 0)) return boolean is
		begin
			if ff=x"455A5A" then
				return true;
			else
				return false;
			end if;
		end function;

		
		-- check if it is ascii EFF (upper ROM)
		function checkEFF(ff : std_logic_vector(23 downto 0); space : std_logic) return boolean is
		begin
			--  0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
			-- 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46
			if space='0' and ff(23 downto 16) /= x"45" then return false; end if;
			if space='1' and ff(23 downto 16) /= x"46" then return false; end if;
			if ff(15 downto 8) > x"39" and ff(15 downto 8) < x"41" then return false; end if;
			if ff(7 downto 0)  > x"39" and ff(7 downto 0)  < x"41" then return false; end if;
			if ff(15 downto 8) < x"30" then return false; end if;
			if ff(7 downto 0)  < x"30" then return false; end if;
			if ff(15 downto 8) > x"46" then return false; end if;
			if ff(7 downto 0)  > x"46" then return false; end if;
			return true;
		end function;
		
		
		
		-- convert ascii EFF into hexa FF
		function extractEFF(ff : std_logic_vector(23 downto 0)) return std_logic_vector is
			variable comput:std_logic_vector(7 downto 0);
			variable result:std_logic_vector(7 downto 0);
		begin
			comput:=ff(15 downto 8);
			comput:=comput - x"30";
			if comput>x"09" then
				comput:=comput - x"07";
			end if;
			result(7 downto 4):=comput(3 downto 0);
			comput:=ff(7 downto 0);
			comput:=comput - x"30";
			if comput>x"09" then
				comput:=comput - x"07";
			end if;
			result(3 downto 0):=comput(3 downto 0);
			return result;
		end function;
		variable extFifo:std_logic_vector(3*8-1 downto 0);
		variable key_reset_space_mem : std_logic :='0';
		variable compare_resultFF_mem:std_logic_vector(7 downto 0);
	begin
		if rising_edge(CLK) then
			compare_spi_Rdo<='0';
			if compare_do then
				compare_done<=false;
				if not compare_done then
					compare_step:=2;-- overrun
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
							key_reset_space_mem:=key_reset_space;
						when 1=>
							if cursor=compare_length-1 then
								if compare_extention then
									-- volume_label     directory
									if spi_Din(3)='0' and spi_Din(4)='0' then
										if compare_extentionEZZorEFF and checkCDT(extFifo) then
											compare_resultDSK<=true;
											compare_resultEZZ<=false;
											compare_result<=true;
										elsif compare_extentionEZZorEFF and checkEZZ(extFifo) then
											compare_resultDSK<=false;
											compare_resultEZZ<=true;
											compare_result<=true;
										elsif compare_extentionEZZorEFF and checkEFF(extFifo,key_reset_space_mem) then
											compare_resultFF_mem:=extractEFF(extFifo);
											compare_resultFF<=compare_resultFF_mem;
											compare_resultDSK<=false;
											compare_resultEZZ<=false;
											compare_result<=true;
										elsif not(compare_extentionEZZorEFF) then
											compare_result<=true;
										else
											compare_result<=false;
										end if;
									else
										compare_result<=false;
									end if;
								elsif compare_to12((12-cursor)*8-1 downto (12-cursor-1)*8) /= spi_Din then
									compare_result<=false;
								else
									compare_result<=true;
								end if;
								compare_done<=true;
								compare_step:=3;
							elsif compare_extentionEZZorEFF and cursor>=compare_length-4 then
								-- ignore compare and build extFifo
								extFifo:=extFifo(2*8-1 downto 0) & spi_Din;
								cursor:=cursor+1;
								compare_spi_Rdo<='1';
								compare_spi_A<=compare_address+cursor;
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
	
	-- Filling RAM
	transmiter:process(CLK) is
		variable cursor:integer range 0 to BLOCK_SIZE_MAXIMUM;
		variable transmit_step:integer range 0 to 10;
		variable data_mem:std_logic_vector(7 downto 0);
		variable address_mem:std_logic_vector(ram_A'range);
		variable transmit_sdram_wait: integer range 0 to SDRAM_ASYNC_DELTA;
		variable ram_init_period_counter : integer range 0 to RAM_INIT_PERIOD;
		variable ram_refresh_period_counter : integer range 0 to RAM_REFRESH_PERIOD;
		-- Fill init_A(17:0) with uns, see AmstradRAMDSK.vhd : it's R0M and RAM part normaly (not dsk part)
		-- bug : some RAM here seems at ROM localisation, so not initializing them with zero make diff on "tomorrow start up"
		-- "tomorrow start up" : it I start today, RAM is boot filled with 0x"33CC" (and somes xE5), if I start it tomorrow, it is boot filled with random values.
		variable ram_fillUn_period_counter : std_logic_vector(22 downto 0);
	begin
		if rising_edge(CLK) then
			if transmit_do then
				transmit_done<=false;
				cursor:=0;
				if not transmit_done then
					transmit_step:=4;--overrun
				elsif transmit_doRAMinit then
					-- do init RAM and perhaps also fill RAM with uns
					ram_init_period_counter:=0;
					ram_refresh_period_counter:=0;
					ram_fillUn_period_counter:="1000000" & x"00" & x"00";
					transmit_step:=6;
				elsif transmit_doRAMfill then
					-- do fill RAM with uns
					ram_fillUn_period_counter:="1000000" & x"00" & x"00";
					transmit_step:=8;
				else
					transmit_step:=0;
				end if;
			end if;
			transmit_spi_Rdo<='0';
			transmit_ram_W<='0';
			init_RAM<='0';
			if not transmit_done then
				-- read byte
				-- write byte
				transmit_spi_A<=transmit_address_from+cursor;
				transmit_ram_A<=transmit_address_to(ram_A'range)+cursor;
				case transmit_step is
					when 0=>
						if not(transmit_spi_Rdo='1') and spi_Rdone='1' then
							transmit_spi_Rdo<='1';
							transmit_step:=1;
						end if;
					when 1=>
						if not(transmit_spi_Rdo='1') and spi_Rdone='1' then
							data_mem:=spi_Din;
							transmit_ram_D<=data_mem;
							transmit_ram_W<='1';
							transmit_sdram_wait:=0;
							if transmit_sdram_wait = SDRAM_ASYNC_DELTA then
								transmit_step:=2;
							else
								transmit_sdram_wait:=transmit_sdram_wait+1;
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
						transmit_ram_W<='0';
						transmit_step:=0;
						cursor:=cursor+1;
						if cursor>=transmit_length then
							transmit_ram_D<=(others=>'0');
							transmit_done<=true;
							transmit_step:=3;
						end if;
					when 3=>NULL; -- transmit SPI to RAM done
					when 4=>NULL; -- over run
					when 6=> -- RAM init phase INIT : reset RAM
						init_RAM<='1';
						if ram_init_period_counter = RAM_INIT_PERIOD then
							transmit_step:=7;
						else
							ram_init_period_counter:=ram_init_period_counter+1;
						end if;
					when 7=> -- RAM init	phase REFRESH : just wait RAM is ready
						init_RAM<='0';
						if ram_refresh_period_counter = RAM_REFRESH_PERIOD then
							if transmit_doRAMfill then
								transmit_step:=8;
							else
								transmit_step:=0;
							end if;
						else
							ram_refresh_period_counter:=ram_refresh_period_counter+1;
						end if;
					when 8=> -- RAM init phase fill with 1
						transmit_ram_A<=ram_fillUn_period_counter;
						transmit_ram_W<='1';
						transmit_ram_D<=(others=>'1');
						transmit_sdram_wait:=0;
						if transmit_sdram_wait = SDRAM_ASYNC_DELTA then
							transmit_step:=10;
						else
							transmit_sdram_wait:=transmit_sdram_wait+1;
							transmit_step:=9;
						end if;
					when 9=>
						transmit_ram_W<='1';
						if transmit_sdram_wait = SDRAM_ASYNC_DELTA then
							transmit_step:=10;
						else
							transmit_sdram_wait:=transmit_sdram_wait+1;
						end if;
					when 10=>
						if ram_fillUn_period_counter="1111111" & x"FF" & x"FF" then
							transmit_step:=0;
						else
							ram_fillUn_period_counter:=ram_fillUn_period_counter+1;
							transmit_step:=8;
						end if;
				end case;
			end if;
		end if;
	end process;
	
	-- Filling SDCARD
	dumper:process(CLK) is
		variable cursor:integer range 0 to BLOCK_SIZE_MAXIMUM;
		variable dump_step:integer range 0 to 6;
		variable data_mem_RAM:std_logic_vector(7 downto 0);
		variable address_mem_RAM:std_logic_vector(ram_A'range);
		variable address_mem_SPI:std_logic_vector(dump_spi_A'range);
		variable dump_sdram_wait: integer range 0 to SDRAM_ASYNC_DELTA;
	begin
		if rising_edge(CLK) then
			if dump_do then
				dump_done<=false;
				cursor:=0;
				address_mem_RAM:=dump_address_from(ram_A'range)+cursor;
				dump_ram_A<=address_mem_RAM;
				address_mem_SPI:=dump_address_to+cursor;
				dump_spi_A<=address_mem_SPI;
				
				if not dump_done then
					dump_step:=5;--overrun
				else
					dump_step:=0;
				end if;
			end if;
			dump_ram_R<='0';
			dump_spi_Wblock<='0';
			dump_spi_Wdo<='0';
			if not dump_done and not(dump_spi_Wblock='1' or dump_spi_Wdo='1') and spi_Wdone='1' then
				-- read byte
				-- write byte
				case dump_step is
					when 0=>
						dump_ram_R<='1';
						dump_sdram_wait:=0;
						if dump_sdram_wait=SDRAM_ASYNC_DELTA then
							dump_step:=1;
						else
							dump_step:=6;
						end if;
					when 6=>
						dump_ram_R<='1';
						if dump_sdram_wait=SDRAM_ASYNC_DELTA then
							dump_step:=1;
						else
							dump_sdram_wait:=dump_sdram_wait+1;
						end if;
					when 1=>
						data_mem_RAM:=ram_Din;
						dump_spi_Dout<=data_mem_RAM;
						dump_ram_R<='0';
						dump_step:=2;
					when 2=>
						if cursor+1=dump_length or cursor mod 512 = 511 then
							dump_spi_Wdo<='1';
							dump_spi_Wblock<='0';
						else
							dump_spi_Wdo<='0';
							dump_spi_Wblock<='1';
						end if;
						dump_step:=3;
					when 3=>
						dump_step:=0;
						cursor:=cursor+1;
						if cursor>=dump_length then
							dump_spi_Dout<=(others=>'0');
							dump_done<=true;
							dump_step:=4;
						end if;
						dump_spi_Dout<=(others=>'0'); --unbind D vs D_mem
						address_mem_RAM:=dump_address_from(ram_A'range)+cursor;
						dump_ram_A<=address_mem_RAM;
						address_mem_SPI:=dump_address_to+cursor;
						dump_spi_A<=address_mem_SPI;
					when 4=>NULL; -- transmit SPI to RAM done
					when 5=>NULL; -- over run
				end case;
			end if;
		end if;
	end process;
	

	--tortue_geniale : the main process, using FAT32 protocol
	tortue_geniale:process (CLK) is
	   variable FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (40 downto 0):=PREFIX & x"00400000"; -- in byte
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
		
-- The 1st parameter is just here to check variable size before synthesis
procedure get_var1(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=1;
	data_addr<=PREFIX & var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure get_var1b(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=1;
	data_addr<=var_addr_b;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure get_var2(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=2;
	data_addr<=PREFIX & var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure get_var2b(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr_b;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure get_var4(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=4;
	data_addr<=PREFIX & var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure get_var4b(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr_b;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;

--procedure set_var1b(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
--begin
--	data_length<=1;
--	data_addr<=var_addr_b;
--	data_writer1<=var_name;
--	data_Wdo<=true;
--	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
--end;
procedure set_var2b(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr_b;
	data_writer2<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure set_var4b(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr_b;
	data_writer4<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure fillSDCARD_32BytesWithZeros(var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=3; --strange case
	data_addr<=var_addr_b;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;
procedure set_var12b(var_name:std_logic_vector(8*12-1 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=5; --strange case
	data_addr<=var_addr_b;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_BR;
end;

function fix_big_endian1(var_name: in STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
begin
	return var_name;
end;
function fix_big_endian2(var_name: in STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(15 downto 0); -- protect a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8);
	return cache;
end;
function fix_big_endian4(var_name: in STD_LOGIC_VECTOR(31 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(31 downto 0); -- protect a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8) & var_name(23 downto 16) & var_name(31 downto 24);
	return cache;
end;

procedure compare12(name:std_logic_vector(8*12-1 downto 0);address:std_logic_vector(40 downto 0);extention:boolean) is
begin
	compare_address<=address;
	compare_to12<=name;
	compare_extention<=extention;
	compare_extentionEZZorEFF<=false;
	compare_length<=12;
	compare_do<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_COMPARE;
end procedure;
procedure compare4(name:std_logic_vector(8*4-1 downto 0);address:std_logic_vector(40 downto 0);rom:boolean) is
begin
	compare_address<=address;
	compare_to12<=name & x"0000000000000000";
	compare_extention<=true;
	compare_extentionEZZorEFF<=rom;
	compare_length<=4;
	compare_do<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_COMPARE;
end procedure;

-- RAM init
variable transmit_doRAMinit_mem:boolean:=true;
variable transmit_doRAMfill_mem:boolean:=true;

procedure fillRAM(address_from:std_logic_vector(40 downto 0);address_to:std_logic_vector(40 downto 0);size:integer) is
begin
	transmit_address_from<=address_from;
	transmit_address_to<=address_to;
	transmit_length<=size;
	transmit_do<=true;
	transmit_doRAMinit <= transmit_doRAMinit_mem;
	transmit_doRAMinit_mem:=false; -- impure ?
	transmit_doRAMfill <= transmit_doRAMfill_mem;
	transmit_doRAMfill_mem:=false; -- impure ?
	switch_br_compare_transmit_dump_jacquie<=SWITCH_TRANSMIT;
end;

procedure loadCDT(address_dsk:std_logic_vector(40 downto 0)) is
begin
	jacquie_addr<=address_dsk;
	jacquie_changeCDT_do<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_jacquie;
end;

procedure fillSDCARD(address_from:std_logic_vector(40 downto 0);address_to:std_logic_vector(40 downto 0);size:integer) is
begin
	dump_address_from<=address_from;
	dump_address_to<=address_to;
	dump_length<=size;
	dump_do<=true;
	switch_br_compare_transmit_dump_jacquie<=SWITCH_DUMP;
end;


-- return : memory address targeting sector start
subtype address_type is std_logic_vector(40 downto 0);
impure function getSector(cluster:std_logic_vector(31 downto 0)) return address_type is
	variable cluster41:std_logic_vector(40 downto 0):=(others=>'0');
	variable deux41:std_logic_vector(40 downto 0):=(others=>'0');
	variable BPB_SecPerClus41:std_logic_vector(40 downto 0):=(others=>'0');
	variable FirstDataSector41:std_logic_vector(40 downto 0):=(others=>'0');
	variable BPB_BytsPerSec41:std_logic_vector(40 downto 0):=(others=>'0');
	variable tmp_result:std_logic_vector(122 downto 0);
begin
	BPB_SecPerClus41(BPB_SecPerClus'range):=BPB_SecPerClus;
	FirstDataSector41:=conv_std_logic_vector(FirstDataSector,41);
	BPB_BytsPerSec41(BPB_BytsPerSec'range):=BPB_BytsPerSec;
	deux41:=conv_std_logic_vector(2,41);
	cluster41(31 downto 0):=cluster(31 downto 0);
	tmp_result:=((((cluster41-deux41)*BPB_SecPerClus41)+FirstDataSector41)*BPB_BytsPerSec41+FAT32_SECTOR0_OFFSET);
	return tmp_result(40 downto 0);
	-- lost of precision conv_integer (32bits vs 41bits)
	--return (conv_std_logic_vector((((conv_integer(cluster(31 downto 0))-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec),41)+FAT32_SECTOR0_OFFSET);
end function;
-- return : memory address targeting next cluster start
impure function getFAT(cluster:std_logic_vector(31 downto 0)) return address_type is
	variable cluster41:std_logic_vector(40 downto 0):=(others=>'0');
	variable quatre41:std_logic_vector(40 downto 0):=(others=>'0');
	variable BPB_RsvdSecCnt41:std_logic_vector(40 downto 0):=(others=>'0');
	variable BPB_BytsPerSec41:std_logic_vector(40 downto 0):=(others=>'0');
	variable tmp_result:std_logic_vector(81 downto 0);
begin
	cluster41(31 downto 0):=cluster(31 downto 0);
	quatre41:=conv_std_logic_vector(4,41);
	BPB_RsvdSecCnt41(BPB_RsvdSecCnt'range):=BPB_RsvdSecCnt;
	BPB_BytsPerSec41(BPB_BytsPerSec'range):=BPB_BytsPerSec;
	tmp_result:=BPB_RsvdSecCnt41*BPB_BytsPerSec41+cluster41*quatre41+FAT32_SECTOR0_OFFSET;
	return tmp_result(40 downto 0);
	-- lost of precision conv_integer (32bits vs 41bits)
	--each cluster has 4 bytes
	--return conv_std_logic_vector(conv_integer(BPB_RsvdSecCnt)*conv_integer(BPB_BytsPerSec)+conv_integer(cluster(31 downto 0))*4,41)+FAT32_SECTOR0_OFFSET;
end function;

-- Cluster values http://en.wikipedia.org/wiki/Design_of_the_FAT_file_system
-- 0x?XXXXXXX Despite its name FAT32 uses only 28 bits of the 32 possible bits...must not rely on the upper 4 bits to be zero and it must strip them off before evaluating the cluster number

-- free cluster (root folder "..")
function fc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster(27 downto 0) = x"0000000";
end function;

-- reserved cluster -- If this value occurs in on-disk cluster chains, file system implementations should treat this like an end-of-chain marker.
-- only seen on disk if there is a crash or power failure in the middle of this process
function rc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
    -- What are the two reserved clusters at the start of the FAT for? (00000000 and 00000001)
	return cluster(27 downto 0) = x"0000001";
end function;

-- FFFFFF0 - FFFFFF5 the file system must treat them as normal data clusters in cluster-chains 
-- FFFFFF6 if this value occurs in existing volumes, the file system must treat it as normal data cluster in cluster-chains
-- FFFFFF7 Bad sector can be part of a valid cluster chain
function rc2(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return (cluster(27 downto 0) >= x"FFFFFF0" and cluster(27 downto 0) <= x"FFFFFF5") or cluster(27 downto 0) = x"FFFFFF6" or cluster(27 downto 0) = x"FFFFFF7";
end function;

-- end of cluster
function eoc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	--} else if (FATType == FAT32) {
	--If(FATContent >= 0x0FFFFFF8)
	--IsEOF = TRUE;
	--}
	return (cluster(27 downto 0) >= x"FFFFFF8" and cluster(27 downto 0) <= x"FFFFFFF") or fc(cluster) or rc(cluster);
end function;

-- out of range cluster (not in standard range)
function oc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
    -- see eoc()
	return (cluster(27 downto 0) <= x"0000002" and cluster(27 downto 0) > x"FFFFFEF") or rc2(cluster);
end function;

-- general bad/useless cluster : not physical sectors by here
function bc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return eoc(cluster) or oc(cluster);
end function;

		variable step_var:integer range 0 to 63:=0;
		variable load_done:std_logic:='0';
		variable dump_button_mem:std_logic:='1';
		
		variable search_cluster: integer;
		variable cluster_search:std_logic_vector(31 downto 0);
		
		variable folder_cluster_pointer:std_logic_vector(31 downto 0); -- number
		variable previous_folder_cluster_pointer:std_logic_vector(31 downto 0);
		variable file_cluster_pointer:std_logic_vector(31 downto 0); -- number
		variable previous_file_cluster_pointer:std_logic_vector(31 downto 0);
		variable file_cluster_pointer_H:std_logic_vector(15 downto 0);
		variable file_cluster_pointer_L:std_logic_vector(15 downto 0);
		variable folder_sector_pointer:std_logic_vector(40 downto 0);
		variable file_sector_pointer:std_logic_vector(40 downto 0);
		
		--variable dsk_number:std_logic_vector(7 downto 0):=(others=>'0');
		
		variable file_address:std_logic_vector(40 downto 0);
		variable folder_DirStruct_number:integer;
		
		variable file_size:std_logic_vector(31 downto 0);
		
	--files_loaded(0) : dsk loaded (dskIsReady(0)) in face A
	--files_loaded(1) : dsk loaded (dskIsReady(1)) in face B
	--files_loaded(2) : lowerROM loaded
	--files_loaded(3) : dump loaded
	variable files_loaded:std_logic_vector(3 downto 0):="0000";

	constant DUMP_COUNT_BEFORE_RESET_MAX : integer := 15;
	variable dump_counter_before_reset : integer range 0 to DUMP_COUNT_BEFORE_RESET_MAX:=0;
	variable changeDSK_mem : std_logic :='0'; -- do change disk at next key_reset.
	variable key_reset_space_mem : std_logic :='0';





	
	-- MiST OSD menu select file
	variable old_downloading:std_logic:='1';
	variable dsk_mist:boolean:=false;
	--variable file_name:name_type:=x"4946455F44454D4F44534B"; --IFE_DEMODSK; -- 11*8-1..0
	variable dir_entry_counter:integer range 0 to 32-1:=0;
	variable file_size_mist:std_logic_vector(31 downto 0):=(others=>'0');
	variable file_cluster_pointer_mist:std_logic_vector(31 downto 0):=(others=>'0');
	
	variable doDSK:boolean:=false;
	--variable dskB:boolean:=false;
	
	begin
		load_init_done<=load_done;
		
		-- warning : jacquie_changeCDT_done is also generated via simple_DSK...
		-- so we cannot protect this signal simply using "and not(jacquie_changeCDT_do) and jacquie_changeCDT_done"
		--is_dskReady(0)<=files_loaded(0);
		--is_dskReady(1)<=files_loaded(1);
		
		if rising_edge(CLK) then
		
			if spi_init_done='1' then
			
				data_Rdo<=false;
				data_Wdo<=false;
				compare_do<=false;
				transmit_do<=false;
				dump_do<=false;
				jacquie_changeCDT_do<=false;
				
				key_reset_space<=key_reset_space_mem;
				
				--leds8_debug(11 downto 0)<=conv_std_logic_vector(step_var,12);
				
if not(data_Rdo) and not(data_Wdo) and data_RWdone and not(transmit_do) and transmit_done and not(compare_do) and compare_done and not(dump_do) and dump_done and not(jacquie_changeCDT_do) and jacquie_changeCDT_done then
				
				
				
				case step_var is
					when 0 =>
						--============================================
						--==  MBR : isFAT32 + FAT32_SECTOR0_OFFSET  ==
						--============================================
						get_var1(data_reader1,x"000001FE");
						--get_var1(data_reader1,x"00000000"); -- same result for SD and SDHC, x"BA"
						step_var:=32;
					when 32 =>
						-- check data(1FE)=55 (fixed value)
						if data_reader1 = x"55" then
							step_var:=33;
							get_var1(data_reader1,x"000001FF");
							--get_var1(data_reader1,x"00400003"); -- 4D
						end if;
					when 33 =>
						-- check data(1FF)=AA (fixed value)
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
							get_var4(data_reader4,x"000001C6");
						end if;
					when 35 =>
						-- load data4Bytes(1BE+8) little endian, x512(=200h) = FAT32_SECTOR0_OFFSET
						-- * 512 (=200h)
					   FAT32_SECTOR0_OFFSET:=fix_big_endian4(data_reader4) & "0" & x"00";
						--=======================
						--==  FAT32 VARIABLES  ==
						--=======================
						get_var4b(BPB_FATSz32,BPB_FATSz32_addr+FAT32_SECTOR0_OFFSET);
						step_var:=1;
					when 1 =>
						BPB_FATSz32:=fix_big_endian4(data_reader4);
--						if BPB_FATSz32=x"00003AA9" then --x"000003B0" then -- debug
							get_var4b(BPB_TotSec32,BPB_TotSec32_addr+FAT32_SECTOR0_OFFSET);
							step_var:=2;
--						end if;
					when 2=>
						BPB_TotSec32:=fix_big_endian4(data_reader4);
--						if BPB_TotSec32=x"0075D000" then --x"00760000" then --debug
							get_var1b(BPB_SecPerClus,BPB_SecPerClus_addr+FAT32_SECTOR0_OFFSET);
							step_var:=3;
--						end if;
					when 3=>
						BPB_SecPerClus:=fix_big_endian1(data_reader1);
--						if BPB_SecPerClus=x"04" then--x"40" then --debug
							get_var4b(BPB_RootClus,BPB_RootClus_addr+FAT32_SECTOR0_OFFSET);
							step_var:=4;
--						end if;
					when 4=>
						BPB_RootClus:=fix_big_endian4(data_reader4);
--						if BPB_RootClus=x"00000002" then --x"00000002" then --debug
							get_var2b(BPB_RsvdSecCnt,BPB_RsvdSecCnt_addr+FAT32_SECTOR0_OFFSET);
							step_var:=5;
--						end if;
					when 5=>
						BPB_RsvdSecCnt:=fix_big_endian2(data_reader2);
--						if BPB_RsvdSecCnt=x"0AAE" then--x"18A0" then --debug
							get_var1b(BPB_NumFATs,BPB_NumFATs_addr+FAT32_SECTOR0_OFFSET);
							step_var:=6;
--						end if;
					when 6=>
						BPB_NumFATs:=fix_big_endian1(data_reader1);
--						if BPB_NumFATs=x"02" then--x"02" then -- debug
							get_var2b(BPB_BytsPerSec,BPB_BytsPerSec_addr+FAT32_SECTOR0_OFFSET);
							step_var:=7;
--						end if;
					when 7=>
						--=========================================
						--== END OF BR VARIABLES LOADING PROCESS ==
						--=========================================
						BPB_BytsPerSec:=fix_big_endian2(data_reader2);
						FATSz := conv_integer(BPB_FATSz32); -- 15017 --944
						TotSec := conv_integer(BPB_TotSec32); -- 7720960 --7733248
						FirstDataSector:=conv_integer(BPB_RsvdSecCnt)+(conv_integer(BPB_NumFATs)*FATSz) + 0;
						folder_cluster_pointer:=BPB_RootClus; --2
						step_var:=25;
					when 25=> -- impure variable setted, so impure function are now usable...
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						if bc(folder_cluster_pointer) then
							-- no more next FileEntry... so. (root case)
							step_var:=27;
						else
							step_var:=8;
							folder_DirStruct_number:=0;
						end if;
					when 8=> -- stepping DIRStruct
						--========================================================
						--== STEPING DIRSTRUCT LIST OF A FOLDER_SECTOR_POINTER ==
						--========================================================
						if folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32) then
							-- last DataStruct of all sectors of current cluster done
							step_var:=9;
						else
							folder_DirStruct_number:=folder_DirStruct_number+1;
							step_var:=30;
						end if;
					when 9=>
						--=========================
						--== NEXT FOLDER CLUSTER ==
						--=========================
						get_var4b(folder_cluster_pointer,getFAT(folder_cluster_pointer));
						step_var:=12;
					when 30=>
						--================================
						--== END OF DIRSTRUCT DETECTION ==
						--================================
						compare12(x"000000000000000000000000",folder_sector_pointer+(folder_DirStruct_number-1)*32,false);
						step_var:=31;
					when 31=>
						if compare_result then
							-- true real nicely hidden file ?
							compare12(x"000000000000000000000000",10+folder_sector_pointer+(folder_DirStruct_number-1)*32,false);
							step_var:=63;
						else
							--if file_select=x"FF" then
							--	step_var:=55;
							--else
							step_var:=10;
							--end if;
						end if;
					when 63=>
						if compare_result then
							-- true real nicely hidden file ?
							compare12(x"000000000000000000000000",20+folder_sector_pointer+(folder_DirStruct_number-1)*32,false);
							step_var:=28;
						else
							-- strange, perhaps a nice hidden file, go to next file then...
							step_var:=8;
						end if;
					when 28=>
						if compare_result then
							step_var:=26; --end of DIRSTRUCT stepping
						else
							-- strange, perhaps a nice hidden file, go to next file then...
							step_var:=8;
						end if;
						
					when 10=>
						--=======================--=======================
						--== LOOKING ABOUT ROM ==--== LOOKING ABOUT DSK ==
						--=======================--=======================
						switch_transmit_dump<=SWITCH_TRANSMIT;
						compare4(file_ezz_extention,folder_sector_pointer+(folder_DirStruct_number-1)*32+8,true);
						step_var:=13;
					when 11=>NULL; -- DEPRECATED
					when 12=> -- next folder cluster
						previous_folder_cluster_pointer:=folder_cluster_pointer;
						folder_cluster_pointer:=fix_big_endian4(data_reader4);
						step_var:=23;
					when 23=>
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						if bc(folder_cluster_pointer) then
							-- last FAT pointer : no more next FileEntry. (case root for me)
							-- end of DIRSTRUCT stepping
							step_var:=26;
						else
							folder_DirStruct_number:=0;
							step_var:=8;
						end if;
					when 13=> -- search ROM
						if compare_result then
							-- same file extension found
							get_var1b(data_reader1,folder_sector_pointer+(folder_DirStruct_number-1)*32);
							step_var:=62;
						else
							step_var:=8;
						end if;
					when 62=> -- check if not a deleted ROM file
						if data_reader1 = x"E5" then
							-- this is a deleted file entry
							step_var:=8;
						elsif compare_resultDSK then
							doDSK:=true;
							if files_loaded(0)='1' then
								step_var:=8;
							else
								-- same file name/extension founded
								--if dsk_number>=file_select then
									
								get_var4b(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
								step_var:=14;
								--else
								--	dsk_number:=dsk_number+1;
								--	step_var:=8;
								--end if;
							end if;
						else
							doDSK:=false;
							if compare_resultEZZ then
								-- its a lowerROM !
								files_loaded(2):='1';
								file_address:=PREFIX & x"00000000";
							else
								-- its a EFF
								file_address:=PREFIX & x"00" & "01" & compare_resultFF & "000000" & x"00";
							end if;
							get_var4b(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
							step_var:=14;
						end if;
					--when 60=>NULL; -- DEPRECATED -- search MiST DSK
--						if compare_result then
--							-- same file name/extension founded
--							get_var1b(data_reader1,folder_sector_pointer+(folder_DirStruct_number-1)*32);
--							step_var:=61;
--						else
--							step_var:=8;
--						end if;
					when 61=>NULL; -- DEPRECATED -- check if not a deleted MiST file
--						if data_reader1 = x"E5" then
--							-- this is a deleted file entry
--							step_var:=8;
--						else
--							if dskB='0' then
--								files_loaded(0):='1';
--							else
--								files_loaded(1):='1';
--							end if;
--							get_var4b(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
--							step_var:=14;
--						end if;
					when 14=>
						file_size:=fix_big_endian4(data_reader4);
						get_var2b(file_cluster_pointer_H,folder_sector_pointer+(folder_DirStruct_number-1)*32+20);
						step_var:=15;
					when 15=>
						file_cluster_pointer_H:=fix_big_endian2(data_reader2);
						get_var2b(file_cluster_pointer_L,folder_sector_pointer+(folder_DirStruct_number-1)*32+26);
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
						-- transmit in progress
						if doDSK then
							loadCDT(file_sector_pointer); -- can be a CAFE or else first root disk
							step_var:=60;
						else
							if file_size>conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32) then
								fillRAM(file_sector_pointer,file_address,conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec));
								file_size:=file_size-conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
								step_var:=19;
							else
								fillRAM(file_sector_pointer,file_address,conv_integer(file_size));
								step_var:=18;
								-- that's all folk
							end if;
						end if;
					when 60=>
						-- that's all folk
						files_loaded(0):='1';
						step_var:=18;
					when 18=>
						-- that's all folk
						switch_transmit_dump<=SWITCH_NONE;
						step_var:=8; -- next DIRStruct
					when 19=>
						get_var4b(file_cluster_pointer,getFAT(file_cluster_pointer));
						step_var:=20;
					when 20=>
						file_cluster_pointer:=fix_big_endian4(data_reader4);
						step_var:=22;
					when 22=>
						file_sector_pointer:=getSector(file_cluster_pointer);
						file_address:=file_address+conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),41);
						if bc(file_cluster_pointer) then
							step_var:=18; -- that's all folk
						else
							step_var:=17; -- transmit next block to RAM
						end if;
					when 58=>NULL; -- DEPRECATED
					when 27=>NULL; -- bad root folder cluster / impossible case (new DIRSTRUCT/bad folder_cluster_pointer)
					when 29=>NULL; -- bad file cluster
					when 26=>
						-- empty dsk is not a drama, be cool in case no disk is selected in menu.
						if files_loaded(2)='1' or files_loaded(3)='1' then
							step_var:=36; -- ok goto "Ready for DUMP !"
						end if;
					when 36=> -- Ready for DUMP !
						-- do enable simpleDSK
						switch_br_compare_transmit_dump_jacquie<=SWITCH_jacquie;
						--waiting button press for DUMP !
						if dump_button_mem='1' then
							--permit a START-DUMP
							if dump_counter_before_reset = DUMP_COUNT_BEFORE_RESET_MAX then
								if dump_button='0' then
									-- on est calme
									if changeDSK_mem='0' then
										-- that's all folks, turn on Z80 :)
										load_done:='1';
										dump_button_mem:='0';
									else
										-- goto load another disk (cas key reset)
										if not(dsk_mist) then
											files_loaded(0):='0';
										end if;
										files_loaded(3):='0'; -- ce n'est plus une lecture de dump
										files_loaded(2):='0'; -- reload also ROM
										--dsk_number:=(others=>'0');
										changeDSK_mem:='0';
										dump_button_mem:='1';
										dump_counter_before_reset:=0;
										load_done:='0';
										transmit_doRAMinit_mem:=true;
										transmit_doRAMfill_mem:=true;
										step_var:=0;
										--dsk_mist:=false; not determinist, prefer using OSD menu dsk selection here.
									end if;
								end if;
							else
								dump_counter_before_reset:=dump_counter_before_reset+1;
							end if;
						elsif key_reset(1)='1' then
							--if changeDSK='1' then -- always true
							changeDSK_mem:='1';
							key_reset_space_mem:=key_reset(0);
							--end if;
							load_done:='0';
							dump_counter_before_reset:=0;
							dump_button_mem:='1';
						elsif dump_button='1' then
							dump_button_mem:='1';
							files_loaded(3):='0';
							load_done:='0';
							dump_counter_before_reset:=0;
							if bc(folder_cluster_pointer) then
							   -- do use previous_folder_cluster_pointer...
								-- do create FAT Entry + FileEntry + FAT list
								step_var:=37;
							else
								-- do create             FileEntry + FAT list
								step_var:=42; -- to check
							end if;
						elsif old_downloading = '0' and dir_entry_downloading='1' then
							-- MiST OSD dir_entry (file selected)
							--if michel_select='1' then
							--	dskB:=true;
							--else
							--	dskB:=false;
							dsk_mist:=true; -- no more coffee
							--end if;
							dir_entry_r<='1';
							step_var:=59;
							dir_entry_counter:=0;
						end if;
						
					when 59=>
						--======================================
						--== Loading a dsk from MiST OSD menu ==
						--======================================
						if dir_entry_ack='1' then
							case dir_entry_counter is
--								when 0=> file_name(87 downto 80):=dir_entry_d(7 downto 0);
--								when 1=> file_name(79 downto 72):=dir_entry_d(7 downto 0);
--								when 2=> file_name(71 downto 64):=dir_entry_d(7 downto 0);
--								when 3=> file_name(63 downto 56):=dir_entry_d(7 downto 0);
--								when 4=> file_name(55 downto 48):=dir_entry_d(7 downto 0);
--								when 5=> file_name(47 downto 40):=dir_entry_d(7 downto 0);
--								when 6=> file_name(39 downto 32):=dir_entry_d(7 downto 0);
--								when 7=> file_name(31 downto 24):=dir_entry_d(7 downto 0);
--								when 8=> file_name(23 downto 16):=dir_entry_d(7 downto 0);
--								when 9=> file_name(15 downto 8):=dir_entry_d(7 downto 0);
--								when 10=> file_name(7 downto 0):=dir_entry_d(7 downto 0);
							
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
								--if dskB then
								--	files_loaded(1):='0';
								--else
									files_loaded(0):='0';
								--end if;
								
								if bc(file_cluster_pointer_mist) then
									step_var:=26;
								else
									file_address:=(others=>'0');
									file_size:=file_size_mist;
									file_cluster_pointer:=file_cluster_pointer_mist;
									file_sector_pointer:=getSector(file_cluster_pointer_mist);
									step_var:=57;
								end if;
								dir_entry_r<='0';
							else
								dir_entry_counter:=dir_entry_counter+1;
								dir_entry_r<='1';
							end if;
						end if;
						
					when 57=>
						-- direct load a new MiST dsk (from OSD select)
						loadCDT(file_sector_pointer);
						step_var:=21;
					when 21=>
						--if dskB then
						--	-- launch signal
						--	files_loaded(1):='1';
						--else
						--	-- launch signal
							files_loaded(0):='1';
						--end if;
						step_var:=26;
					when 37=> --FAT Entry just for new DIRStruct
						search_cluster:=0;
						step_var:=38;
					when 38=>
						get_var4b(cluster_search,getFAT(previous_folder_cluster_pointer+search_cluster));
						step_var:=39;
					when 39=>
						cluster_search:=fix_big_endian4(data_reader4);
						if cluster_search = x"00000000" then
							--yeah !
							folder_cluster_pointer:=previous_folder_cluster_pointer+search_cluster;
							set_var4b(x"FFFFFFFF",getFAT(folder_cluster_pointer));
							step_var:=40;
						else
							--continue
							search_cluster:=search_cluster+1;
							step_var:=38;
						end if;
					when 40=>
						set_var4b(folder_cluster_pointer,getFAT(previous_folder_cluster_pointer));
						step_var:=41;
					when 41=>
						--new folder_sector_pointer
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						folder_DirStruct_number:=0+1;
						step_var:=42;
					when 42=>
						--============================
						--== Creating DUMP.DMP file ==
						--============================
						fillSDCARD_32BytesWithZeros(folder_sector_pointer+(folder_DirStruct_number-1)*32);
						if folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32) then
							-- last DataStruct about all sectors of current cluster done
							step_var:=44;
						else
							step_var:=43;
						end if;
					when 43=>
						-- cleaning entry located just after DUMP.DMP FileEntry
						fillSDCARD_32BytesWithZeros(folder_sector_pointer+(folder_DirStruct_number-1+1)*32);
						step_var:=44;
					when 44=>
						-- Writing FileEntry DUMP.DMP
						set_var12b(file_dump_name & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
						step_var:=45;
					when 45=>
						set_var4b(fix_big_endian4(file_dump_size),folder_sector_pointer+(folder_DirStruct_number-1)*32 + (32-4));
						step_var:=46;
					when 46=> -- Creating file_cluster_pointer
						file_cluster_pointer:=folder_cluster_pointer;
						get_var4b(cluster_search,getFAT(file_cluster_pointer));
						step_var:=47;
					when 47=>
						cluster_search:=fix_big_endian4(data_reader4);
						if cluster_search = x"00000000" then
							--yeah !
							set_var4b(x"FFFFFFFF",getFAT(file_cluster_pointer));
							step_var:=48;
						else
							--continue
							file_cluster_pointer:=file_cluster_pointer+1;
							get_var4b(cluster_search,getFAT(file_cluster_pointer));
							step_var:=47;
						end if;
					when 48=>
						-- saving file_cluster_pointer into FileEntry
						file_cluster_pointer_H:=fix_big_endian2(file_cluster_pointer(31 downto 16));
						file_cluster_pointer_L:=fix_big_endian2(file_cluster_pointer(15 downto 0));
						set_var2b(file_cluster_pointer_H,folder_sector_pointer+(folder_DirStruct_number-1)*32+20);
						step_var:=49;
					when 49=>
						set_var2b(file_cluster_pointer_L,folder_sector_pointer+(folder_DirStruct_number-1)*32+26);
						step_var:=50;
					when 50=>
						--=================================================
						--== Creating free FAT area for DUMP.DMP storage ==
						--=================================================
						file_size:=file_dump_size;
						file_address:=PREFIX & x"00000000";
						file_sector_pointer:=getSector(file_cluster_pointer);
						switch_transmit_dump<=SWITCH_DUMP;
						step_var:=51;
					when 51=>
						-- transmit in progress
						if file_size>conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32) then
							fillSDCARD(file_address,file_sector_pointer,conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec));
							file_size:=file_size-conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
							step_var:=52;
						else
							fillSDCARD(file_address,file_sector_pointer,conv_integer(file_size));
							step_var:=54;
							-- that's all folk
						end if;
					when 52=> -- we write on FAT and do next step (not an anarchic one !)
						previous_file_cluster_pointer:=file_cluster_pointer;
						file_cluster_pointer:=file_cluster_pointer+1;
						get_var4b(cluster_search,getFAT(file_cluster_pointer));
						step_var:=53;
					when 53=>
						cluster_search:=fix_big_endian4(data_reader4);
						if cluster_search = x"00000000" then
							-- yeah !
							set_var4b(fix_big_endian4(file_cluster_pointer),getFAT(previous_file_cluster_pointer));
							file_sector_pointer:=getSector(file_cluster_pointer);
							file_address:=file_address+conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),41);
							step_var:=51;
						else
							file_cluster_pointer:=file_cluster_pointer+1;
							get_var4b(cluster_search,getFAT(file_cluster_pointer));
							step_var:=53;
						end if;
					when 54=> -- closing file.
						set_var4b(fix_big_endian4(x"FFFFFFFF"),getFAT(file_cluster_pointer));
						-- that's all folk
						switch_transmit_dump<=SWITCH_NONE;
						files_loaded(3):='1'; -- beware about re-reading file another time for nothing.
						--dump_button_mem:='0';
						-- same player play again
						if bc(folder_cluster_pointer) then
							-- anomaly
							step_var:=27;
						else
							-- I was under a not ended DIRSTRUCT, or else I created a new DIRSTRUCT for my new DUMP.DMP file
							step_var:=8;
						end if;
						
						
						
					when 55=>NULL;
--						--========================================
--						--== LOOKING AFTER A EXISTING DUMP FILE ==
--						--========================================
--						switch_transmit_dump<=SWITCH_TRANSMIT;
--						if files_loaded(3)='1' then
--							switch_transmit_dump<=SWITCH_NONE;
--							step_var:=8; -- next DIRStruct
--						else
--							file_address:=PREFIX & x"00000000";
--							compare12(file_dump_name & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32,true);
--							step_var:=56;
--						end if;
					when 56=>NULL; -- search DUMP
--						if compare_result then
--							-- same name/extension file
--							files_loaded(3):='1';
--							get_var4b(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
--							step_var:=14;
--						else
--							step_var:=8; -- next DIRStruct
--						end if;
				end case;
				
				old_downloading:=dir_entry_downloading;
end if;
			end if;
		end if;
		
	end process tortue_geniale;
	
	jacquie:process(CLK) is
		variable jacquie_step:integer range 0 to 31:=0;
		variable is_overrun:boolean:=false;
		variable jacquie_addr_memTape:std_logic_vector(jacquie_addr'range):=(others=>'0');
		variable TZXHeader_A:std_logic_vector(jacquie_addr'range):=(others=>'0');
		variable TZXBlock_A:std_logic_vector(jacquie_addr'range):=(others=>'0');
		
		variable id : std_logic_vector(7 downto 0):=x"00";
		variable params_length:integer;
		variable params_zap:integer;
		variable params:std_logic_vector(17*8-1 downto 0);
		--constant params_length_more_than_max:integer:=17*8;
		variable params_n:integer;
		variable has_BYTE_N:boolean:=false;
		variable has_WORD_N:boolean:=false;
		
		-- ID 11 - Turbo Speed Data Block
		variable sb_pilot:integer;
		variable sb_sync1:integer;
		variable sb_sync2:integer;
		variable sb_bit0:integer;
		variable sb_bit1:integer;
		variable pilot:integer;
		variable lastbyte:std_logic_vector(8-1 downto 0):=x"08";
		variable pause:integer;
		variable datalen:integer;
		
		variable debug_no_block:integer:=0;
	begin
		if rising_edge(CLK) then
		
			if jacquie_changeCDT_do then
				jacquie_changeCDT_done<=false;
				jacquie_do_s<='0'; -- unbind (slave (sur simple_DSK c'était un unbind master))
				jacquie_step:=0;
				debug_no_block:=0;
				is_overrun:=false;
			end if;
			
			if not(jacquie_do_s='1') and not(jacquie_changeCDT_done) then
				--overrun
				is_overrun:=true;
			end if;
			
			meca_spi_Rdo<='0';
			meca_spi_Wdo<='0';
			meca_spi_Wblock<='0';
			
			--leds8_debug(39 downto 20)<=conv_std_logic_vector(jacquie_step,20);
			leds8_debug(19 downto 16)<=conv_std_logic_vector(debug_no_block,4);
			leds8_debug(15 downto 8)<=conv_std_logic_vector(jacquie_step,8);
			leds8_debug(7 downto 0)<=id;
			-- http://www.cpcwiki.eu/index.php/Format:CDT_tape_image_file_format
			-- https://www.worldofspectrum.org/TZXformat.html
			-- CDT2WAV.java
			jacquie_do_s<='0'; -- je suis master (je n'attend rien du CPC pour démarrer ma cassette, c'est quand j'ouvre un fichier que ça se lance)
			if not(jacquie_changeCDT_done) and (not(jacquie_do_s='1') and jacquie_done='1') then
				if not(meca_spi_Rdo='1') and spi_Rdone='1'  then
					case jacquie_step is
						when 0=> -- 0x00 "ZXTape!"
							jacquie_addr_memTape:=jacquie_addr; -- goto x07
							TZXHeader_A:=jacquie_addr_memTape+(PREFIX & x"00000007"); -- goto x07
							meca_spi_A<=TZXHeader_A;
							meca_spi_Rdo<='1';
							jacquie_step:=1;
						when 1=>
							if spi_Din=x"1A" then
								TZXBlock_A:=TZXHeader_A+(PREFIX & x"00000003"); -- goto x0A
								meca_spi_A<=TZXBlock_A;
								meca_spi_Rdo<='1';
								jacquie_step:=2;
							end if;
						when 2=> -- TZX Block ID
							-- countBlocks()
							debug_no_block:=debug_no_block+1;
							id:=spi_Din;
							-- tous une taille spécifique.
							--mais un objectif commun, envoyer des trucs qui font du son.
							--et principalement des blocks (et leur parmetre avant)
							has_BYTE_N:=false;
							has_WORD_N:=false;
							if id=x"10" then
								params_length:=4+1; -- 2 words, then BYTE[N] (+1 : with first byte of data block)
								has_BYTE_N:=true;
							elsif id=x"11" then
								params_length:=18; -- words,byte,word,byte[3], then BYTE[N]
								has_BYTE_N:=true;
								
								--params_length:=params_length'high;
								--jacquie_step:=17;
								
							elsif id=x"12" then
								params_length:=4; -- 2 words
							elsif id=x"13" then
								params_length:=1; -- 1 byte, then WORD[N]
								has_WORD_N:=true;
							elsif id=x"14" then
								params_length:=10; -- word,word,byte,word,byte[3], then BYTE[N]
								has_BYTE_N:=true;
							elsif id=x"15" then -- EAR
								params_length:=8; -- word,word,byte,byte[3], then BYTE[N]
								has_BYTE_N:=true;
							elsif id=x"20" then
								params_length:=2; -- word
							elsif id=x"21" then -- to skip
								params_length:=1; -- byte, then BYTE[L] (chars)
								has_BYTE_N:=true;
							elsif id=x"22" then -- to skip
								params_length:=0;
							elsif id=x"23" then -- to skip
								params_length:=2; -- word
							elsif id=x"24" then -- to skip
								params_length:=2; -- word
							elsif id=x"25" then -- to skip
								params_length:=0;
							elsif id=x"26" then -- to skip
								params_length:=2; -- word, then WORD[N]
								has_WORD_N:=true; -- skipped
							elsif id=x"27" then -- to skip
								params_length:=0;
							elsif id=x"2A" then -- to skip (not implemented in Caprice32)
								params_length:=4; -- dword
							elsif id=x"30" then -- to skip
								params_length:=1; -- byte, then BYTE[N] (chars)
								has_BYTE_N:=true;
							elsif id=x"31" then -- to skip
								params_length:=2; -- byte,byte, then BYTE[N] (chars)
								has_BYTE_N:=true;
							elsif id=x"32" then -- to skip
								params_length:=3; -- word,byte, then TEXT[N] (structure...)
							elsif id=x"33" then -- to skip
								params_length:=1; -- byte, then HWINFO[N] (3 bytes structure)
							elsif id=x"34" then -- to ignore
								params_length:=9; -- ??? Emulator-info
							elsif id=x"35" then -- to skip
								params_length:=14; -- byte[10](chars),dword, then BYTE[L]
								has_BYTE_N:=true;
							elsif id=x"40" then -- to skip
								params_length:=4;
								has_BYTE_N:=true;
							elsif id=x"5A" then
								params_length:=9; -- byte[9]
							else
								 -- arret brutal de la lecture de la cassette
								jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PAUSE,jacquie_phase'length);
								jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
								jacquie_length<=x"00FF";
								jacquie_do_s<='1';
								jacquie_changeCDT_done<=true; -- BOUM ! (ou fin de cassette à la râche (pas de détection de EOF))
								params_length:=params_length'high;
							end if;
							
							if params_length=params_length'high then
							--if params_length=params_length_more_than_max then
								-- evil
							elsif params_length=0 then
								jacquie_step:=4;
							else
								params_n:=0;
								meca_spi_A<=TZXBlock_A+1+params_n;
								meca_spi_Rdo<='1';
								jacquie_step:=3;
							end if;
						when 3=>
							params((params_n+1)*8-1 downto params_n*8):= spi_Din;
							if params_length=params_n+1 then
								jacquie_step:=4;
							else
								params_n:=params_n+1;
								meca_spi_A<=TZXBlock_A+1+params_n;
								meca_spi_Rdo<='1';
							end if;
						when 4=>
							pilot:=0;
							params_zap:=0;
							if id=x"10" then
								--ID:10 - Standard speed data block
								--This block MUST be supported and CAN exist in a CDT. Emulators should use standard Spectrum ROM timings for playback.
								-- ZX : sequence of 8063 (header) or 3223 (data) pulses, each of length 2168 T-states.
								--pause = get2(inpbuf, data);
								pause:=conv_integer(params(8*2-1 downto 0));
								--datalen = get2(inpbuf, data + 2);
								datalen:=conv_integer(params(8*4-1 downto 8*2));
								--data += 4;
								--if (inpbuf[data] == 0x00) {
								if params(8*5-1 downto 8*4) = x"00" then
								--pilot = 8064; -- count : in pulses (half of sinus)
									pilot:=8064;
								--} else {
								else
								--pilot = 3220;
									pilot:=3220;
								--}
								end if;
								--sb_pilot = output.samples(2168); -- length : 2168 T-State
								sb_pilot:=2168;
								--sb_sync1 = output.samples(667);
								sb_sync1:=667;
								--sb_sync2 = output.samples(735);
								sb_sync2:=735;
								--sb_bit0 = output.samples(885);
								sb_bit0:=885;
								--sb_bit1 = output.samples(1710);
								sb_bit1:=1710;
								--lastbyte = 8; -- after end of block, do send this.
								lastbyte:=x"08";
							elsif id=x"11" then
								--ID:11 - Turbo Loading Data Block
								--This block MUST be supported and CAN exist in a CDT.
								--
								--The timings for playback are stored in the block header.
								--
								--Details and functionality of this block are the same as described in the official TZX/CDT specification.
								--pos += get3(inpbuf, pos + 0x0F) + 0x12;
								-- Fruity_Frank.cdt
								-- 07 01 00 => 000107h length
								-- 00 CD 43 FF FF FF FF 11 << ID 11 once time again.
								-- 11
								-- 13 07 00 => 000713h length
								-- 11
								-- 07 01 00 => 000107h length
								-- 11
								-- 15 08 00 => 000815h length
								-- 11
								-- 07 01 00 => 000107h length
								-- 11
								-- 15 08 00 => 000815h length
								-- 11
								-- 07 01 00
								-- 11
								-- 15 08 00 => 000815h length
								
								--jacquie_addr_memTape:=TZXBlock_A+(PREFIX & x"00000001"); -- goto Block content
								--meca_spi_A<=jacquie_addr_memTape;
								--meca_spi_Rdo<='1';
								--jacquie_step:=3;
								
								--sb_pilot = output.samples(get2(inpbuf, data + 0));
								sb_pilot:=CONV_INTEGER(params(8*2-1 downto 0));
								--sb_sync1 = output.samples(get2(inpbuf, data + 2));
								sb_sync1:=CONV_INTEGER(params(8*4-1 downto 8*2));
								--sb_sync2 = output.samples(get2(inpbuf, data + 4));
								sb_sync2:=CONV_INTEGER(params(8*6-1 downto 8*4));
								--sb_bit0 = output.samples(get2(inpbuf, data + 6));
								sb_bit0:=CONV_INTEGER(params(8*8-1 downto 8*6));
								--sb_bit1 = output.samples(get2(inpbuf, data + 8));
								sb_bit1:=CONV_INTEGER(params(8*10-1 downto 8*8));
								--pilot = get2(inpbuf, data + 10);
								pilot:=CONV_INTEGER(params(8*12-1 downto 8*10));
								
								--params_length:=params_length'high;
								--jacquie_step:=18;
								
								--lastbyte = (int) inpbuf[data + 12];
								lastbyte:=params(8*13-1 downto 8*12);
								--pause = get2(inpbuf, data + 13);
								pause:=CONV_INTEGER(params(8*15-1 downto 8*13));
								--datalen = get3(inpbuf, data + 15);
								datalen:=CONV_INTEGER(params(8*17-1 downto 8*15));
							elsif id=x"12" then	
								--case 0x12: // pure tone (length of tone=number of pulses)
								--sb_pilot = output.samples(get2(inpbuf, data + 0));
								sb_pilot:=CONV_INTEGER(params(8*2-1 downto 0));
								--pilot = get2(inpbuf, data + 2);
								pilot:=CONV_INTEGER(params(8*4-1 downto 8*2));
							elsif id=x"13" then
								--ID:13 - Sequence of pulses of different length
								--This block MUST be supported and CAN exist in a CDT.
								--
								--The timings for playback are stored in the block header.
								--
								--Details and functionality of this block are the same as described in the official TZX/CDT specification.
								
								--pilot = (int) inpbuf[data + 0];
								datalen:=CONV_INTEGER(params(8*2-1 downto 0));
							elsif id=x"14" then
								--ID:14 - Pure Data Block
								--This block MUST be supported and CAN exist in a CDT.
								--
								--The timings for playback are stored in the block header.
								--
								--Details and functionality of this block are the same as described in the official TZX/CDT specification.
								
								--sb_pilot = pilot = sb_sync1 = sb_sync2 = 0;
								sb_pilot:=0;
								pilot:=0;
								sb_sync1:=0;
								sb_sync2:=0;
								--sb_bit0 = output.samples(get2(inpbuf, data + 0));
								sb_bit0:=CONV_INTEGER(params(8*2-1 downto 0));
								--sb_bit1 = output.samples(get2(inpbuf, data + 2));
								sb_bit1:=CONV_INTEGER(params(8*4-1 downto 8*2));
								--lastbyte = (int) inpbuf[data + 4];
								lastbyte:=params(8*5-1 downto 8*4);
								--pause = get2(inpbuf, data + 5);
								pause:=CONV_INTEGER(params(8*7-1 downto 8*5));
								--datalen = get3(inpbuf, data + 7);
								datalen:=CONV_INTEGER(params(8*9-1 downto 8*7));
							elsif id=x"15" then
								--ID:15 - Direct Recording
								--This block MUST be supported but SHOULD be avoided when creating a CDT by a sample-to-CDT converter. This block can be used by emulators to support writing to CDTs.
								--
								--The timings for playback are stored in the block header.
								--
								--Details and functionality of this block are the same as described in the official TZX/CDT specification.
								-- This block is used for tapes which have some parts in a format such that the turbo loader block cannot be used. This is not like a VOC file, since the information is much more compact. Each sample value is represented by one bit only (0 for low, 1 for high) which means that the block will be at most 1/8 the size of the equivalent VOC.
								-- The preferred sampling frequencies are 22050 or 44100 Hz (158 or 79 T-states/sample). Please, if you can, don't use other sampling frequencies.
								
								--FIXME : il est où le bout de code ici ? (finalement c'est pas un enregistrement, mais une voie enregistrée)
								-- Number of T-states per sample (bit of data)
								pilot:=CONV_INTEGER(params(8*2-1 downto 0));
								--pause = get2(inpbuf, data + 2);
								pause:=CONV_INTEGER(params(8*4-1 downto 8*2));
								-- Used bits (samples) in last byte of data (1-8)
								-- (e.g. if this is 2, only first two samples of the last byte will be played)
								--lastbyte = (int) inpbuf[data + 4];
								lastbyte:=params(8*5-1 downto 8*4);
								--Length of samples' data
								--datalen = get3(inpbuf, data + 5);
								datalen:=CONV_INTEGER(params(8*7-1 downto 8*5));
								-- Samples data. Each bit represents a state on the EAR port (i.e. one sample).
								-- MSb is played first.
							elsif id=x"20" then
								-- skip : OK
								pause:=CONV_INTEGER(params(8*2-1 downto 0));
								
							elsif id=x"21" then
								-- skip the block : OK
								params_zap:=conv_integer(params(8-1 downto 0));
								has_BYTE_N:=false;
							elsif id=x"22" then
								-- skip : OK
							elsif id=x"23" then
								-- skip : OK
							elsif id=x"24" then
								-- skip : OK
							elsif id=x"25" then
								-- skip : OK
							elsif id=x"26" then
								-- skip the WORD[N] block : OK
								params_zap:=conv_integer(params(8*2-1 downto 0))+conv_integer(params(8*2-1 downto 0));
								has_WORD_N:=false;
							elsif id=x"27" then
								-- skip : OK
							elsif id=x"2A" then
								-- not implemetend in caprice32 tape.c
								-- skip : OK
							elsif id=x"30" then
								-- skip the block : OK
								params_zap:=conv_integer(params(8*2-1 downto 8));
								has_BYTE_N:=false;
							elsif id=x"31" then
								-- skip the block : OK
								params_zap:=conv_integer(params(8*2-1 downto 8));
								has_BYTE_N:=false;
							elsif id=x"32" then
								-- skip the block : OK
								params_zap:=conv_integer(params(8*2-1 downto 0));
							elsif id=x"33" then
								-- skip the HWINFO[N] block : OK
								params_zap:=conv_integer(params(8-1 downto 0))+conv_integer(params(8-1 downto 0))+conv_integer(params(8-1 downto 0));
							elsif id=x"34" then
								-- skip : OK
							elsif id=x"35" then
								-- skip the block of BYTE[L] : OK
								params_zap:=conv_integer(params(8*12-1 downto 8*10));
								has_BYTE_N:=false;
							elsif id=x"40" then
								--This block MUST not be added to a new CDT. Amstrad emulator's MUST ignore this block.
								-- skip the block : OK
								params_zap:=conv_integer(params(8*4-1 downto 0)); -- a dword address
								has_BYTE_N:=false;
							elsif id=x"5A" then
								-- skip : OK
							end if;
							
							TZXBlock_A:=TZXBlock_A + 1 + params_length + params_zap; -- jump next block of begin of BLOCK content
							--if has_BYTE_N then
							--	jacquie_step:=5;
							--elsif has_WORD_N then
							--	jacquie_step:=6;
							--else
							--	jacquie_step:=2; -- next block (END OF FILE ???)
							--end if;
							
							--if params_length=params_length_more_than_max then
							if params_length=params_length'high then
								-- evil
							elsif has_WORD_N then -- certainement id=x"13"
								meca_spi_A<=TZXBlock_A;
								meca_spi_Rdo<='1';
								jacquie_step:=13;
							elsif pilot>0 then
								--jacquie_step:=16;
								jacquie_step:=5;
							elsif pause>0 then
								jacquie_step:=12;
							else
								meca_spi_A<=TZXBlock_A;
								meca_spi_Rdo<='1';
								--jacquie_step:=15;
								jacquie_step:=2; -- next block
							end if;
						when 5=>
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_BIT0,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(sb_bit0,jacquie_length'length);
							jacquie_step:=6;
							jacquie_do_s<='1';
						when 6=>
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_BIT1,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(sb_bit1,jacquie_length'length);
							jacquie_step:=7;
							--jacquie_step:=19;
							jacquie_do_s<='1';
						when 7=> --while (pilot > 0) {
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PILOT,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(sb_pilot,jacquie_length'length);
							jacquie_count<=conv_std_logic_vector(pilot,jacquie_count'length);
							if has_BYTE_N then -- c'est un vrai pilot
								jacquie_step:=8;
							else
								-- certainement id=x"12"
								jacquie_step:=2; -- next block ID
							end if;
							jacquie_do_s<='1';
						when 8=> --if (sb_sync1 > 0) {
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PULSE,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(sb_sync1,jacquie_length'length);
							jacquie_step:=9;
							jacquie_do_s<='1';
						when 9=> --if (sb_sync2 > 0) {
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PULSE,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(sb_sync2,jacquie_length'length);
							jacquie_step:=10;
							meca_spi_A<=TZXBlock_A;
							meca_spi_Rdo<='1';
							jacquie_do_s<='1';
						when 10=> -- block
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_BLOCK,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_count<=x"00" & lastbyte;-- conv_std_logic_vector(lastbyte,jacquie_count'length);
							-- first one byte readen, and sent to JACQUIE_PHASE_BLOCK, data_length=512
							jacquie_byte<=spi_Din;
							jacquie_length<=conv_std_logic_vector(datalen,jacquie_length'length);
							-- data_length for next step is sure 511
							datalen:=datalen-1;
							jacquie_step:=11;
							TZXBlock_A:=TZXBlock_A+1;
							meca_spi_A<=TZXBlock_A;
							meca_spi_Rdo<='1';
							jacquie_do_s<='1';
--							--11
--							--15 08 00
--							if debug_no_block=3 then
--								if datalen/=2069-1 then
--									jacquie_step:=20;
--								elsif spi_Din/=x"16" then
--									jacquie_step:=21;
--								end if;
--							end if;
						when 11=>  -- then BYTE[N]
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_BLOCK_CONTINUE,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							datalen:=datalen-1;
							-- second byte readen, and sent to JACQUIE_PHASE_BLOCK_CONTINUE, data_length=511=>510
							jacquie_byte<=spi_Din;
							if datalen=0 then
								if pause>0 then
									-- goto end-of-block signal + pause
									jacquie_step:=31;
								else
									-- but sure got to move because i'm currently face to a data byte.
									TZXBlock_A:=TZXBlock_A+1;
									meca_spi_A<=TZXBlock_A;
									meca_spi_Rdo<='1';
									jacquie_step:=2; -- next block ID
								end if;
							else
								TZXBlock_A:=TZXBlock_A+1;
								meca_spi_A<=TZXBlock_A;
								meca_spi_Rdo<='1';
							end if;
							jacquie_do_s<='1';
							
--							--11
--							--07 01 00
--							
--							--11
--							--15 08 00
--							if debug_no_block=3 and datalen=2069-256-1 and spi_Din/=x"49" then
--								-- datalen min is 1, and two datalen-- before, so -1
--								jacquie_step:=22;
--							end if;
--							--11
--							--07 01 00
--							if debug_no_block=4 and datalen=263-1 and spi_Din/=x"41" then
--								jacquie_step:=23;
--							end if;
--							--11
--							--07 01 00
--							if debug_no_block=5 and datalen=263-5-1 and spi_Din/=x"2A" then
--								jacquie_step:=24;
--							end if;
--							if debug_no_block=5 and datalen=263-262-1 and spi_Din/=x"FF" then
--								jacquie_step:=25;
--							end if;
--							if debug_no_block=5 and datalen=263-262-1 and spi_Din=x"FF" then
--								jacquie_step:=26;
--							end if;
						when 31=>
							-- end of block : one pulse only, of 1ms.
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PULSE,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							-- 1ms @ 4MHz : 4000 or x"0FA0"
							jacquie_length<=x"0FA0"; -- 1ms
							jacquie_do_s<='1';
							-- but sure got to move because i'm currently face to a data byte.
							TZXBlock_A:=TZXBlock_A+1;
							-- goto pause
							jacquie_step:=12;
						when 12=>
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PAUSE,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(pause,8*2);
							-- inconsistent pause : so no A++ by here.
							meca_spi_A<=TZXBlock_A;
							meca_spi_Rdo<='1';
							jacquie_step:=2; -- next block ID
							jacquie_do_s<='1';
						when 13=> -- then WORD[N] -- cas x"13"
							params(8*2-1 downto 8):=spi_Din;
							TZXBlock_A:=TZXBlock_A+1;
							meca_spi_A<=TZXBlock_A;
							meca_spi_Rdo<='1';
							jacquie_step:=14;
						when 14=>
							params(8-1 downto 0):=spi_Din;
							sb_pilot:=conv_integer(params(8*2-1 downto 0));
							jacquie_phase<=conv_std_logic_vector(JACQUIE_PHASE_PULSE,jacquie_phase'length);
							jacquie_no_block<=conv_std_logic_vector(debug_no_block,jacquie_no_block'length);
							jacquie_length<=conv_std_logic_vector(sb_pilot,jacquie_length'length);
							jacquie_do_s<='1';
							datalen:=datalen-1;
							if datalen=0 then
								TZXBlock_A:=TZXBlock_A+1;
								meca_spi_Rdo<='1';
								jacquie_step:=2; -- next block ID
							else
								TZXBlock_A:=TZXBlock_A+1;
								meca_spi_A<=TZXBlock_A;
								meca_spi_Rdo<='1';
								jacquie_step:=13;
							end if;
						when 15=> id:=spi_Din; -- fuck 15
						when 16=> id:=conv_std_logic_vector(pilot,16)(7 downto 0); -- fuck 16
						when 17=> NULL; -- fuck 17
						when 18=> NULL; -- fuck 18
						when 19=> id:=conv_std_logic_vector(sb_bit1,16)(15 downto 8); -- fuck 19
						when 20=> -- fuck 20 block 3 debut datalen KO
						id:=conv_std_logic_vector(datalen,16)(15 downto 8);
						when 21=> NULL; -- fuck 21 block 3 debut byte KO
						when 22=> NULL; -- fuck 22 block 3 KO
						when 23=> NULL; -- fuck 23 block 4 2ème byte KO
						when 24=> NULL; -- fuck 24 block 5 KO
						when 25=> NULL; -- fuck 25 block 5 fin KO
						when 26=> NULL; -- fuck 26 block 5 fin OK
						when 27=> NULL; -- fuck 27
						when 28=> NULL; -- fuck 28
						when 29=> NULL; -- fuck 29
						when 30=> NULL; -- fuck 30
					end case;
				end if;
			end if;
		end if;
	end process jacquie;

end Behavioral;