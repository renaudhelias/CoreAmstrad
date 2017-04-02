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
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0):=(others=>'Z'); -- for sim
			  ram_Dout : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'Z'); -- for sim
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
			  is_dskReady:out std_logic_vector(1 downto 0):="00";
			  key_reset:in std_logic_vector(1 downto 0); -- key_reset : 1, key_reset_space : 0
			  --changeDSK : in std_logic;
			  
			  -- MiST OSD dir_entry (file selected)
			  dir_entry_clk:out std_logic;
			  dir_entry_d: in std_logic_vector(7 downto 0);
			  dir_entry_r:out std_logic;
			  dir_entry_ack:in std_logic;
			  dir_entry_downloading:in std_logic;-- falling_edge
			  
			  init_RAM: out std_logic; -- '1' init_RAM, '0' refresh_RAM
			  
			  -- simpleDSK interface
			  megashark_CHRNresult : out STD_LOGIC_VECTOR(4*8-1 downto 0); -- chr+1 quand W/R, chrn quand goto0
			  megashark_doGOTO : in STD_LOGIC_VECTOR(2 downto 0); -- not a W/R operation finally
			  megashark_CHRN : in STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : in std_logic_vector(9 downto 0); -- sector byte selection
			  megashark_Din : out std_logic_vector(7 downto 0);
			  megashark_Dout : in std_logic_vector(7 downto 0);
			  megashark_INFO_2SIDES : out std_logic:='0';
			  megashark_INFO_ST1 : out std_logic_vector(7 downto 0);
			  megashark_INFO_ST2 : out std_logic_vector(7 downto 0);
			  megashark_doREAD : in STD_LOGIC_VECTOR(4 downto 0);
			  megashark_doWRITE : in STD_LOGIC_VECTOR(2 downto 0);
			  megashark_done : out std_logic;
			  megashark_select : in std_logic; -- from OSD
			  megashark_face : in std_logic -- from simpleDSK
			  );
			  	--attribute keep : string;
				--attribute keep of file_select : signal is "TRUE";

			  
end SDRAM_FAT32_LOADER;

architecture Behavioral of SDRAM_FAT32_LOADER is

	constant PREFIX:std_logic_vector(8 downto 0):="0" & x"00";

	--constant sampleSector : STD_LOGIC_VECTOR(8*16*2-1 downto 0) := x"004441525453313830A020200000004902030405060708090A0B000000000000";

	constant ATTR_ARCHIVE:std_logic_vector(7 downto 0):=x"20";
	constant file_dsk_extention:std_logic_vector((4)*8-1 downto 0):=x"44534B" & ATTR_ARCHIVE; -- DSK & ATTR_ARCHIVE
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
	signal data_writer1:STD_LOGIC_VECTOR(7 downto 0);
	signal data_writer2:STD_LOGIC_VECTOR(15 downto 0);
	signal data_writer4:STD_LOGIC_VECTOR(31 downto 0);
	
	signal data_Rdo:boolean:=false;
	signal data_Wdo:boolean:=false;
	signal data_addr:STD_LOGIC_VECTOR(40 downto 0); -- data is used in order to load BR values
	signal data_length:integer range 1 to 5:=1;
	signal data_RWdone:boolean:=true;
	signal data_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal data_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'Z');
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
	signal dump_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'Z');
	signal dump_spi_Wdo:std_logic:='0';
	signal dump_spi_Wblock:std_logic:='0';
	
	constant SWITCH_NONE:integer:=0;
	constant SWITCH_TRANSMIT:integer:=1;
	constant SWITCH_DUMP:integer:=2;
	constant SWITCH_COMPARE:integer:=3;
	constant SWITCH_BR:integer:=4;
	constant SWITCH_MECASHARK:integer:=5;
	
	
	signal switch_br_compare_transmit_dump_mecashark:integer range 0 to 5:=SWITCH_NONE;
	
	signal switch_transmit_dump:integer range 0 to 2:=SWITCH_NONE;

	signal dump_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal dump_ram_R:std_logic:='0';
	signal transmit_ram_A:std_logic_vector(ram_A'range):=(others=>'0');
	signal transmit_ram_D:std_logic_vector(ram_Din'range):=(others=>'Z');
	signal transmit_ram_W:std_logic:='0';
	
	signal mecashark_changeDSK_do:boolean:=false;
	signal mecashark_changeDSK_done:boolean:=true;
	signal mecashark_addr:std_logic_vector(40 downto 0):=(others=>'0');
	signal mecashark_dskB:boolean:=false;
	signal meca_spi_A:STD_LOGIC_VECTOR(40 downto 0);
	signal meca_spi_Dout:std_logic_vector(ram_Dout'range):=(others=>'Z');
	signal meca_spi_Rdo:std_logic:='0';
	signal meca_spi_Wdo:std_logic:='0';
	signal meca_spi_Wblock:std_logic:='0';
	signal megashark_done_s:std_logic:='1';
	
	signal key_reset_space:std_logic:='0';
begin

	-- MiST dir entry (menu select)
	dir_entry_clk<=CLK;

	megashark_done<=megashark_done_s;

	ram_A<= transmit_ram_A when switch_transmit_dump=SWITCH_TRANSMIT else dump_ram_A when switch_transmit_dump=SWITCH_DUMP else (others=>'0');
	ram_Dout<= transmit_ram_D when switch_transmit_dump=SWITCH_TRANSMIT else (others=>'Z');
	ram_W<= transmit_ram_W when switch_transmit_dump=SWITCH_TRANSMIT else '0';
	ram_R<= dump_ram_R when switch_transmit_dump=SWITCH_DUMP else '0';
	
	
	spi_A(31 downto 0)<=data_spi_A(40 downto 9) when switch_br_compare_transmit_dump_mecashark=SWITCH_BR
		else compare_spi_A(40 downto 9) when switch_br_compare_transmit_dump_mecashark=SWITCH_COMPARE
		else transmit_spi_A(40 downto 9) when switch_br_compare_transmit_dump_mecashark=SWITCH_TRANSMIT
		else dump_spi_A(40 downto 9) when switch_br_compare_transmit_dump_mecashark=SWITCH_DUMP
		else meca_spi_A(40 downto 9) when switch_br_compare_transmit_dump_mecashark=SWITCH_MECASHARK
		else (others=>'0');
	spi_A_block(8 downto 0)<=data_spi_A(8 downto 0) when switch_br_compare_transmit_dump_mecashark=SWITCH_BR
		else compare_spi_A(8 downto 0) when switch_br_compare_transmit_dump_mecashark=SWITCH_COMPARE
		else transmit_spi_A(8 downto 0) when switch_br_compare_transmit_dump_mecashark=SWITCH_TRANSMIT
		else dump_spi_A(8 downto 0) when switch_br_compare_transmit_dump_mecashark=SWITCH_DUMP
		else meca_spi_A(8 downto 0) when switch_br_compare_transmit_dump_mecashark=SWITCH_MECASHARK
		else (others=>'0');

	spi_Rdo<=data_spi_Rdo when switch_br_compare_transmit_dump_mecashark=SWITCH_BR
		else compare_spi_Rdo when switch_br_compare_transmit_dump_mecashark=SWITCH_COMPARE
		else transmit_spi_Rdo when switch_br_compare_transmit_dump_mecashark=SWITCH_TRANSMIT
		else meca_spi_Rdo when switch_br_compare_transmit_dump_mecashark=SWITCH_MECASHARK
		else '0';
	spi_Wdo<=data_spi_Wdo when switch_br_compare_transmit_dump_mecashark=SWITCH_BR
		else dump_spi_Wdo when switch_br_compare_transmit_dump_mecashark=SWITCH_DUMP
		else meca_spi_Wdo when switch_br_compare_transmit_dump_mecashark=SWITCH_MECASHARK
		else '0';
		
	spi_Wblock<=dump_spi_Wblock when switch_br_compare_transmit_dump_mecashark=SWITCH_DUMP
		else meca_spi_Wblock when switch_br_compare_transmit_dump_mecashark=SWITCH_MECASHARK
		else '0';
		
	spi_Dout<=dump_spi_Dout when switch_br_compare_transmit_dump_mecashark=SWITCH_DUMP
		else data_spi_Dout when switch_br_compare_transmit_dump_mecashark=SWITCH_BR
		else meca_spi_Dout when switch_br_compare_transmit_dump_mecashark=SWITCH_MECASHARK
		else (others=>'0');

	-- Permit to load BR values, and also some others variables
	spi_to_loader: process(CLK) is
		variable data_step:integer range 0 to 15:=0;
		variable data_cursor:integer range 0 to 31:=0;
		variable data_reader1_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable data_reader2_mem:std_logic_vector(15 downto 0):=(others=>'0');
		variable data_reader4_mem:std_logic_vector(31 downto 0):=(others=>'0');
		variable data_writer1_mem:std_logic_vector(7 downto 0):=(others=>'0');
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

		-- check if it is ascii DSK
		function checkDSK(ff : std_logic_vector(23 downto 0)) return boolean is
		begin
			if ff=x"44534B" then
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
										if compare_extentionEZZorEFF and checkDSK(extFifo) then
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
							transmit_ram_D<=(others=>'Z');
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
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure get_var1b(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=1;
	data_addr<=var_addr_b;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure get_var2(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=2;
	data_addr<=PREFIX & var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure get_var2b(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr_b;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure get_var4(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr:STD_LOGIC_VECTOR(31 downto 0)) is
begin
	data_length<=4;
	data_addr<=PREFIX & var_addr;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure get_var4b(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr_b;
	data_Rdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;

procedure set_var1b(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=1;
	data_addr<=var_addr_b;
	data_writer1<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure set_var2b(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=2;
	data_addr<=var_addr_b;
	data_writer2<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure set_var4b(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=4;
	data_addr<=var_addr_b;
	data_writer4<=var_name;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure fillSDCARD_32BytesWithZeros(var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=3; --strange case
	data_addr<=var_addr_b;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
end;
procedure set_var12b(var_name:std_logic_vector(8*12-1 downto 0);var_addr_b:STD_LOGIC_VECTOR(40 downto 0)) is
begin
	data_length<=5; --strange case
	data_addr<=var_addr_b;
	data_Wdo<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_BR;
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
	switch_br_compare_transmit_dump_mecashark<=SWITCH_COMPARE;
end procedure;
procedure compare4(name:std_logic_vector(8*4-1 downto 0);address:std_logic_vector(40 downto 0);rom:boolean) is
begin
	compare_address<=address;
	compare_to12<=name & x"0000000000000000";
	compare_extention<=true;
	compare_extentionEZZorEFF<=rom;
	compare_length<=4;
	compare_do<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_COMPARE;
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
	switch_br_compare_transmit_dump_mecashark<=SWITCH_TRANSMIT;
end;

procedure loadDSK(address_dsk:std_logic_vector(40 downto 0);dskB:boolean) is
begin
	mecashark_dskB<=dskB;
	mecashark_addr<=address_dsk;
	mecashark_changeDSK_do<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_MECASHARK;
end;

procedure fillSDCARD(address_from:std_logic_vector(40 downto 0);address_to:std_logic_vector(40 downto 0);size:integer) is
begin
	dump_address_from<=address_from;
	dump_address_to<=address_to;
	dump_length<=size;
	dump_do<=true;
	switch_br_compare_transmit_dump_mecashark<=SWITCH_DUMP;
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
	variable dskB:boolean:=false;
	
	begin
		load_init_done<=load_done;
		
		-- warning : mecashark_changeDSK_done is also generated via simple_DSK...
		-- so we cannot protect this signal simply using "and not(mecashark_changeDSK_do) and mecashark_changeDSK_done"
		is_dskReady(0)<=files_loaded(0);
		is_dskReady(1)<=files_loaded(1);
		
		if rising_edge(CLK) then
		
			if spi_init_done='1' then
			
				data_Rdo<=false;
				data_Wdo<=false;
				compare_do<=false;
				transmit_do<=false;
				dump_do<=false;
				mecashark_changeDSK_do<=false;
				
				key_reset_space<=key_reset_space_mem;
				
if not(data_Rdo) and not(data_Wdo) and data_RWdone and not(transmit_do) and transmit_done and not(compare_do) and compare_done and not(dump_do) and dump_done and not(mecashark_changeDSK_do) and mecashark_changeDSK_done then
				
				
				
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
							loadDSK(file_sector_pointer, false); -- can be a CAFE or else first root disk
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
						switch_br_compare_transmit_dump_mecashark<=SWITCH_MECASHARK;
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
							if megashark_select='1' then
								dskB:=true;
							else
								dskB:=false;
								dsk_mist:=true; -- no more coffee
							end if;
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
								if dskB then
									files_loaded(1):='0';
								else
									files_loaded(0):='0';
								end if;
								
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
						loadDSK(file_sector_pointer, dskB);
						step_var:=21;
					when 21=>
						if dskB then
							-- launch signal
							files_loaded(1):='1';
						else
							-- launch signal
							files_loaded(0):='1';
						end if;
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
	
	mecashark:process(CLK) is
		variable mecashark_step:integer range 0 to 31:=0;
		variable DiskInfo_A:std_logic_vector(40 downto 0):=(others=>'0');
		variable TrackInfo_A:std_logic_vector(40 downto 0):=(others=>'0');
		variable Track_A:std_logic_vector(40 downto 0):=(others=>'0');
		variable SectorInfo_A:std_logic_vector(40 downto 0):=(others=>'0');
		variable Sector_A:std_logic_vector(40 downto 0):=(others=>'0');
		variable output_A:std_logic_vector(40 downto 0):=(others=>'0');
		--variable data_mem:std_logic_vector(7 downto 0);
		type face_boolean_type is array(0 to 1) of boolean;
		variable extended:face_boolean_type:=(false,false);
		variable winape:face_boolean_type:=(false,false);
		type face_integer_type is array(0 to 1) of integer range 0 to 255;
		variable nb_tracks:face_integer_type:=(0,0); -- super cauldron has 42 tracks !!! -- Batman demo has 80 tracks
		variable no_track_current:face_integer_type:=(0,0);
		variable no_track:integer range 0 to 255:=0; -- force simple face
		variable nb_sides:face_integer_type:=(1,1); -- Batman demo one-dsk version has 2 sides
		variable no_side_current:face_integer_type:=(0,0);
		variable no_side:integer range 0 to 255:=0;
		variable nb_sects:integer range 0 to 255:=9; -- super cauldron has 10 sectors !! -- batman demo has 9 sectors (track size 13) 10 sectors (track size 15)
		variable no_sect_current:face_integer_type;
		variable no_sect:integer range 0 to 255;
		variable track_size:std_logic_vector(40 downto 0):=(others=>'0');
		--type sector_sizes_type is array(0 to 6) of std_logic_vector(15 downto 0);
		--constant SECTOR_SIZE:sector_sizes_type:=(x"0080",x"0100",x"0200",x"0400",x"0800",x"1000",x"1800");
		--constant DEFAULT_SECTOR_SIZE:std_logic_vector(15 downto 0):=x"0200";
		variable track_sector_size:std_logic_vector(40 downto 0):=PREFIX & x"00000200"; -- Mission delta has ST2=x20 (crc error) + sector_size 4 + parfois sector_size 1
		variable sector_sector_size:std_logic_vector(7 downto 0):=x"02";
		variable chrn:std_logic_vector(31 downto 0);
		variable chrn_build:std_logic_vector(31 downto 0);
		variable doWRITE:boolean:=false;
		variable doGOTO:boolean:=false;
		
		variable is_multitrack:boolean:=false;
		variable is_multitrackSecondSide:boolean:=false;
		variable is_searching_track:boolean:=false;
		variable is_searching_track77:boolean:=false;
		
		variable mecashark_addr_mem:std_logic_vector(40 downto 0); -- work
		variable mecashark_addr_memFaceA:std_logic_vector(40 downto 0); -- stock address face A
		variable mecashark_addr_memFaceB:std_logic_vector(40 downto 0); -- stock address face B
		variable megashark_Din_mem :std_logic_vector(megashark_Din'range);
		variable megashark_Dout_mem :std_logic_vector(megashark_Dout'range);
		variable megashark_A_mem : std_logic_vector(40 downto 0):=(others=>'0');-- integer range 0 to 511;
		constant FACE_A:integer range 0 to 1:=0;
		constant FACE_B:integer range 0 to 1:=1;
		variable mecashark_face:integer range 0 to 1:=FACE_A;
		variable mecashark_face_build:integer range 0 to 1:=FACE_A;
		variable mecashark_face_dskB:boolean:=false;
		variable dskIsValid:boolean:=false;
		
		variable megashark_INFO_ST1_mem:std_logic_vector(7 downto 0):=x"00";
		variable megashark_INFO_ST2_mem:std_logic_vector(7 downto 0):=x"00";
		variable is_sector_or_track_not_found:boolean:=false;
		variable is_overrun:boolean:=false;
		
		--constant ST1_END_CYL : std_logic_vector(7 downto 0):=x"80";
		constant ST1_NO_DATA : std_logic_vector(7 downto 0):=x"04";
		constant ST1_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01";
		constant ST1_OVERRUN : std_logic_vector(7 downto 0):=x"10";
		constant ST2_MISSING_ADDR : std_logic_vector(7 downto 0):=x"01";

		variable is_Del:boolean:=false; --injected via H of CHRN (operation "DELETED")
		variable is_Sk:boolean:=false; --injected via H of CHRN (SK skip)
		variable is_next:boolean:=false; -- megashark_doREAD is not targeting special sector BOT
		
	begin
		if rising_edge(CLK) then
			if mecashark_changeDSK_do then
				mecashark_changeDSK_done<=false;
				megashark_done_s<='1'; -- unbind
				mecashark_step:=0;
				is_overrun:=false;
			elsif megashark_doGOTO(0)='1' then
				is_searching_track:=(megashark_doGOTO(1)='1');
				is_searching_track77:=(megashark_doGOTO(2)='1');
				is_next:=not(is_searching_track); -- READ_ID
				is_Del:=false;
				is_Sk:=false;
				is_multitrack:=false;
				is_multitrackSecondSide:=false;
				megashark_done_s<='0';
				mecashark_step:=25;
				doGOTO:=true;
				doWRITE:=false;
			elsif megashark_doREAD(0)='1' then
				is_searching_track:=false;
				is_searching_track77:=false;
				is_next:=(megashark_doREAD(1)='1');
				is_Del:=(megashark_doREAD(2)='1');
				is_Sk:=(megashark_doREAD(3)='1');
				is_multitrack:=(megashark_doREAD(4)='1');
				is_multitrackSecondSide:=(megashark_A(9)='1');
				megashark_done_s<='0';
				doGOTO:=false;
				doWRITE:=false;
				mecashark_step:=25;
			elsif megashark_doWRITE(0)='1' then
				is_searching_track:=false;
				is_searching_track77:=false;
				is_next:=false;
				is_Del:=(megashark_doWRITE(1)='1');
				is_Sk:=false;
				is_multitrack:=(megashark_doWRITE(2)='1');
				is_multitrackSecondSide:=(megashark_A(9)='1');
				megashark_done_s<='0';
				doGOTO:=false;
				doWRITE:=true;
				mecashark_step:=25;
			end if;
			
			if not(megashark_done_s='1') and not(mecashark_changeDSK_done) then
				--overrun
				is_overrun:=true;
			end if;
			
			meca_spi_Rdo<='0';
			meca_spi_Wdo<='0';
			meca_spi_Wblock<='0';
			
			if not(mecashark_changeDSK_done) or not(megashark_done_s='1') then
				if not(meca_spi_Wblock='1' or meca_spi_Wdo='1') and spi_Wdone='1' and not(meca_spi_Rdo='1') and spi_Rdone='1'  then
					case mecashark_step is
						when 0=> -- disk ID
							if mecashark_dskB then
								mecashark_addr_memFaceB:=mecashark_addr;
								DiskInfo_A:=mecashark_addr_memFaceB;-- + (PREFIX & x"00000000");
								mecashark_face:=FACE_B;
								mecashark_face_dskB:=true;
							else
								mecashark_addr_memFaceA:=mecashark_addr;
								DiskInfo_A:=mecashark_addr_memFaceA;-- + (PREFIX & x"00000000");
								mecashark_face:=FACE_A;
								mecashark_face_dskB:=false;
							end if;
							meca_spi_A<=DiskInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=1;
						when 1=>
							if spi_Din=x"45" then
								extended(mecashark_face):=true;
							elsif spi_Din=x"4D" then
								extended(mecashark_face):=false;
							end if;
							DiskInfo_A:=DiskInfo_A+(PREFIX & x"00000022"); -- goto x22
							meca_spi_A<=DiskInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=2;
						when 2=> -- disk creator
							if spi_Din=x"57" then -- [W]in APE 32 1.0
								DiskInfo_A:=DiskInfo_A+(PREFIX & x"00000004"); -- goto x26
								meca_spi_A<=DiskInfo_A;
								meca_spi_Rdo<='1';
								mecashark_step:=31;
							else
								winape(mecashark_face):=false;
								DiskInfo_A:=DiskInfo_A+(PREFIX & x"0000000E"); -- goto x30
								meca_spi_A<=DiskInfo_A;
								meca_spi_Rdo<='1';
								mecashark_step:=3;
							end if;
						when 31=>
							if spi_Din=x"41" then -- Win [A]PE 32 1.0
								winape(mecashark_face):=true;
							else
								winape(mecashark_face):=false;
							end if;
							DiskInfo_A:=DiskInfo_A+(PREFIX & x"0000000A"); -- goto x30
							meca_spi_A<=DiskInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=3;
						when 3=>
							nb_tracks(mecashark_face):=conv_integer(spi_Din);
							DiskInfo_A:=DiskInfo_A+(PREFIX & x"00000001"); -- goto x31
							meca_spi_A<=DiskInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=7;
						when 7=>
							nb_sides(mecashark_face):=conv_integer(spi_Din);
							dskIsValid:=false; -- invalidate
							if nb_sides(mecashark_face)=1 then
								-- one side only
								megashark_INFO_2SIDES<='0';
							else
								megashark_INFO_2SIDES<='1';
							end if;
							megashark_INFO_ST1_mem:=x"00";
							megashark_INFO_ST1<=megashark_INFO_ST1_mem;
							megashark_INFO_ST2_mem:=x"00";
							megashark_INFO_ST2<=megashark_INFO_ST2_mem;
							is_sector_or_track_not_found:=false;
							is_overrun:=false;
							mecashark_step:=16;
							no_track_current(mecashark_face):=0;
							no_side_current(mecashark_face):=0;
							no_sect_current(mecashark_face):=0;
						when 16=>-- DSK is just inserted, CHRN is not loaded. TrackInfo_A is not ready (invalidated)
							mecashark_changeDSK_done<=true;

							
							
						when 25=> -- megashark_doREAD || megashark_doWRITE || megashark_doGOTO
							chrn_build:=megashark_CHRN;
							if megashark_face='1' then
								mecashark_face_build:=FACE_B;
							else
								mecashark_face_build:=FACE_A;
							end if;
							if nb_sides(mecashark_face_build)=1 then
								chrn_build(23 downto 16):=x"00"; -- one side only
							else
								if is_multitrack then
									if is_multitrackSecondSide then
										chrn_build(23 downto 16):=x"01";
									else
										chrn_build(23 downto 16):=x"00";
									end if;
								end if;
							end if;
							-- megashark_select
							if megashark_face='1' then
								if mecashark_face_dskB then
									if dskIsValid and chrn = chrn_build and not(is_next) then
										mecashark_step:=26;
									else
										mecashark_step:=17;
									end if;
								else
									mecashark_face_dskB:=true;
									mecashark_face:=FACE_B;
									mecashark_step:=17;
								end if;
							else
								if mecashark_face_dskB then
									mecashark_face_dskB:=false;
									mecashark_face:=FACE_A;
									mecashark_step:=17;
								elsif dskIsValid and chrn = chrn_build and not(is_next) then
									mecashark_step:=26;
								else
									mecashark_step:=17;
								end if;
							end if;
						when 17=>
							if mecashark_face_dskB then
								-- TrackInfo_A : at begin of Track-Info
								mecashark_addr_mem:=mecashark_addr_memFaceB;
							else
								-- TrackInfo_A : at begin of Track-Info
								mecashark_addr_mem:=mecashark_addr_memFaceA;
							end if;
							dskIsValid:=true;
							is_sector_or_track_not_found:=false;
							is_overrun:=false;
							TrackInfo_A:=mecashark_addr_mem+(PREFIX & x"00000100");
							chrn:=chrn_build;
							
							-- le side est dynamique, sauf peut-être en mode multi track (mais déjà appliqué avant dans chrn_build)
							no_side_current(mecashark_face):=conv_integer(chrn(23 downto 16));
							if is_searching_track then
								-- if is_searching_track77 viser le mauvais track lors du premier coup.
								if is_searching_track77 and no_track_current(mecashark_face)>77 then
									no_track_current(mecashark_face):=no_track_current(mecashark_face)-77;
								else
									-- changing track, so goto sector 0 (recalibrate) or seek target
									no_track_current(mecashark_face):=conv_integer(chrn(31 downto 24));
								end if;
							elsif is_next then
								--READ_ID or READ_DATA.next (not BOT)
								no_sect_current(mecashark_face):=no_sect_current(mecashark_face)+1;
								if no_sect_current(mecashark_face)>=nb_sects then
									no_sect_current(mecashark_face):=0; -- back to 0
								end if;
							end if; -- else READ|WRITE DATA : osef no_sect_current(mecashark_face)
							
							if nb_sides(mecashark_face)=1 then
								megashark_INFO_2SIDES<='0';
							else
								megashark_INFO_2SIDES<='1';
							end if;
							-- looking after track/sector from CHRN value (old mecashark_step 18)
							no_track:=0;
							no_side:=0;
							mecashark_step:=19;
						when 19=>
							-- if last track/side reached or else good track/side found then
							if no_track=no_track_current(mecashark_face) and no_side = no_side_current(mecashark_face) then
								-- TRACK FOUND
								-- need sector_size+nb_sects of the track here
								Track_A:=TrackInfo_A + (PREFIX & x"00000014");
								meca_spi_A<=Track_A;
								meca_spi_Rdo<='1';
								mecashark_step:=5;
							elsif no_track=nb_tracks(mecashark_face)-1 and no_side=nb_sides(mecashark_face)-1 then
								is_sector_or_track_not_found:=true; -- TRACK NOT FOUND
								is_overrun:=false;
								-- need sector_size+nb_sects of the track here
								Track_A:=TrackInfo_A + (PREFIX & x"00000014");
								meca_spi_A<=Track_A;
								meca_spi_Rdo<='1';
								mecashark_step:=5;
							else
								-- goto next track (TrackInfo_A++)
								mecashark_step:=28;
								if no_side = nb_sides(mecashark_face)-1 then
									no_track:=no_track+1;
									no_side:=0;
								else
									no_side:=no_side+1;
								end if;
							end if;
						when 28=> -- goto next track (TrackInfo_A++)

							if winape(mecashark_face) then
								-- need sector_size+nb_sects here
								Track_A:=TrackInfo_A + (PREFIX & x"00000014");
								meca_spi_A<=Track_A;
								meca_spi_Rdo<='1';
								mecashark_step:=6;
							else
								-- using track_size (that contains Track-Info size)
								if extended(mecashark_face) then
									-- the track/side just before, so x33 instead of x34 here.
									DiskInfo_A:=mecashark_addr_mem + (PREFIX & x"00000033") + conv_std_logic_vector(no_track*nb_sides(mecashark_face)+no_side,41);
									meca_spi_A<=DiskInfo_A;
									meca_spi_Rdo<='1';
									mecashark_step:=30;
								else
									DiskInfo_A:=mecashark_addr_mem + (PREFIX & x"00000032");
									meca_spi_A<=DiskInfo_A;
									meca_spi_Rdo<='1';
									mecashark_step:=4;
								end if;
							end if;
							
						when 4=> -- not WinApe and not Extended 1/2
							track_size(7 downto 0):=spi_Din;
							DiskInfo_A:=mecashark_addr_mem + (PREFIX & x"00000033");
							meca_spi_A<=DiskInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=9;
						when 9=> -- not WinApe and not Extended 2/2
							track_size(15 downto 8):=spi_Din;
							TrackInfo_A:=TrackInfo_A + track_size;
							mecashark_step:=19;
						when 30=> -- not WinApe and Extended : research track_size in track_size table
							track_size(15 downto 0):=spi_Din & x"00";
							TrackInfo_A:=TrackInfo_A + track_size;
							mecashark_step:=19;
						when 6=> -- WinApe : reached sector_size+nb_sects
							track_sector_size(15 downto 8):=spi_Din;
							-- need nb_sects here
							Track_A:=TrackInfo_A + (PREFIX & x"00000015");
							meca_spi_A<=Track_A;
							meca_spi_Rdo<='1';
							mecashark_step:=8;
						when 8=> -- WinApe : reached sector_size+nb_sects
							nb_sects:=conv_integer(spi_Din);
							-- using sector_size for track sizes
							TrackInfo_A:=TrackInfo_A+(PREFIX & x"00000100");
							no_sect:=0;
							mecashark_step:=20; -- do eat all sector of this track...
						when 20=> -- WinApe : zap sectors
							if no_sect/=nb_sects then
								no_sect:=no_sect+1;
								-- zap sector
								TrackInfo_A:=TrackInfo_A + track_sector_size;
							else --nb_sects zero (empty track) OK
								mecashark_step:=19;
							end if;
						when 5=>
							track_sector_size(15 downto 8):=spi_Din;
							-- need sector_size+nb_sects of the track here
							Track_A:=TrackInfo_A + (PREFIX & x"00000015");
							meca_spi_A<=Track_A;
							meca_spi_Rdo<='1';
							mecashark_step:=10;
						when 10=>
							-- can change between one sector and another
							nb_sects:=conv_integer(spi_Din);
							if nb_sects = 0 then
								is_sector_or_track_not_found:=true;
								-- anarchy...
							end if;
							mecashark_step:=21;

						when 21=> -- we are front to the nice wanted Track-Info
							no_sect:=0;is_overrun:=false;
							 -- x"18"+x"00"=x"18" : track -- C
							SectorInfo_A:=TrackInfo_A+(PREFIX & x"00000018"); -- +conv_std_logic_vector(no_sect*8,41);
							meca_spi_A<=SectorInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=11;
						when 11=>
							no_sect:=0;is_overrun:=false;
							if not(doGoto) and chrn(31 downto 24)/=spi_Din then
								-- bad track (protection : missing one track ?)
								is_sector_or_track_not_found:=true;
							end if;
							-- x"18"+x"01"=x"19" : side -- H
							SectorInfo_A:=TrackInfo_A+(PREFIX & x"00000019"); -- +conv_std_logic_vector(no_sect*8,41);
							meca_spi_A<=SectorInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=18;
						when 18=>
							no_sect:=0;is_overrun:=false;
							if not(doGoto) and no_side_current(mecashark_face)/=conv_integer(spi_Din) then
								-- bad side (protection : missing one track ?)
								is_sector_or_track_not_found:=true;
							end if;
							-- x"18"+x"02"=x"1a" : sector ID -- R
							SectorInfo_A:=TrackInfo_A+(PREFIX & x"0000001a"); -- +conv_std_logic_vector(no_sect*8,41);
							meca_spi_A<=SectorInfo_A;
							meca_spi_Rdo<='1';
							mecashark_step:=22;
						when 22=> -- x"18"+x"02"=x"1a" : sector ID -- R
							if ((doGOTO or is_next) and no_sect=no_sect_current(mecashark_face)) or is_sector_or_track_not_found then
								chrn(15 downto 8):=spi_Din;
								-- no_sect found (=0)
								mecashark_step:=12;
							elsif not(doGOTO or is_next) and chrn(15 downto 8)=spi_Din then --no_sect_current(mecashark_face)
								-- no_sect found
								no_sect_current(mecashark_face):=no_sect;
								-- if doGOTO then
									-- -- I want the new one
									-- no_sect:=no_sect+1;
									-- if no_sect>=nb_sects then
										-- -- if is_multitrack and not last track/side reached
										-- -- if is_multitrack and not(no_track=nb_tracks(mecashark_face)-1 and no_side=nb_sides(mecashark_face)-1) then
											-- -- -- looking after track/sector from CHRN value (old mecashark_step 18)
											-- -- if nb_sides(mecashark_face)=1 or chrn(23 downto 16)=x"01" then
												-- -- chrn(31 downto 24):=chrn(31 downto 24)+1;
												-- -- chrn(23 downto 16):=x"00";
												-- -- no_track:=no_track+1;
												-- -- no_side:=0;
											-- -- else
												-- -- chrn(23 downto 16):=x"01";
												-- -- no_side:=1;
											-- -- end if;
											-- -- no_sect:=0;
											-- -- -- goto next track (TrackInfo_A++)
											-- -- mecashark_step:=28;
										-- -- else
										-- no_sect:=0; -- back to sector 0 of this current track.
										-- is_sector_or_track_not_found:=true;
										-- SectorInfo_A:=TrackInfo_A+(PREFIX & x"0000001a"); -- +conv_std_logic_vector(no_sect*8,41);
										-- meca_spi_A<=SectorInfo_A;
										-- meca_spi_Rdo<='1';
										-- mecashark_step:=14;
										-- -- end if;
									-- else
										-- SectorInfo_A:=SectorInfo_A+(PREFIX & x"00000008");
										-- meca_spi_A<=SectorInfo_A;
										-- meca_spi_Rdo<='1';
										-- mecashark_step:=14;
									-- end if;
								-- else
									-- here we are :)
									mecashark_step:=12;
								-- end if;
							else
								-- on passe au suivant.
								no_sect:=no_sect+1;
								
								if no_sect>=nb_sects then
									-- if is_multitrack and not last track/side reached
									-- if is_multitrack and not(no_track=nb_tracks(mecashark_face)-1 and no_side=nb_sides(mecashark_face)-1) then
										-- if nb_sides(mecashark_face)=1 or chrn(23 downto 16)=x"01" then
											-- chrn(31 downto 24):=chrn(31 downto 24)+1;
											-- chrn(23 downto 16):=x"00";
											-- no_track:=no_track+1;
											-- no_side:=0;
										-- else
											-- chrn(23 downto 16):=x"01";
											-- no_side:=1;
										-- end if;
										-- no_sect:=0;
										-- -- goto next track (TrackInfo_A++)
										-- mecashark_step:=28;
									-- else
										-- sector not found
										--is_sector_or_track_not_found:=true;
										--no_sect := nb_sects-1;
										--chrn(15 downto 8):=spi_Din; -- R
										--mecashark_step:=12;
									if is_overrun then
										no_sect:=0; -- back to sector 0 of this current track.
										is_sector_or_track_not_found:=true;
										SectorInfo_A:=TrackInfo_A+(PREFIX & x"0000001a"); -- +conv_std_logic_vector(no_sect*8,41);
										meca_spi_A<=SectorInfo_A;
										meca_spi_Rdo<='1';
										mecashark_step:=14;
									else
										no_sect:=0; -- back to sector 0 of this current track.
										is_overrun:=true;
										SectorInfo_A:=TrackInfo_A+(PREFIX & x"0000001a"); -- +conv_std_logic_vector(no_sect*8,41);
										meca_spi_A<=SectorInfo_A;
										meca_spi_Rdo<='1';
									end if;
									-- end if;
								else
									-- goto next sector info
									-- sizeof(SectorInfo) = 8
									SectorInfo_A:=SectorInfo_A+(PREFIX & x"00000008");
									meca_spi_A<=SectorInfo_A;
									meca_spi_Rdo<='1';
								end if;
							end if;
						when 14=>-- doGOTO !is_searching_track "I want the new one"
							chrn(15 downto 8):=spi_Din;
							no_sect_current(mecashark_face):=no_sect;
							mecashark_step:=12;
						when 12=> -- sector_sector_size
							Sector_A:=SectorInfo_A+(PREFIX & x"00000001");
							meca_spi_A<=Sector_A;
							meca_spi_Rdo<='1';
							mecashark_step:=13;
						when 13=>
							-- sector_sector_size
							sector_sector_size:=spi_Din;
							-- FDC ST1
							Sector_A:=Sector_A+(PREFIX & x"00000001");
							meca_spi_A<=Sector_A;
							meca_spi_Rdo<='1';
							mecashark_step:=15;
						when 15=>
							if is_sector_or_track_not_found then
								megashark_INFO_ST1_mem:=ST1_NO_DATA or ST1_MISSING_ADDR;
							elsif is_overrun then
								megashark_INFO_ST1_mem:=ST1_OVERRUN;
							elsif is_searching_track then
								megashark_INFO_ST1_mem:=x"00"; -- seek 77
							else
								megashark_INFO_ST1_mem:=spi_Din;
							end if;
							-- FDC ST2
							Sector_A:=Sector_A+(PREFIX & x"00000001");
							meca_spi_A<=Sector_A;
							meca_spi_Rdo<='1';
							mecashark_step:=23;
						when 23=>
							if is_sector_or_track_not_found or is_overrun then
								megashark_INFO_ST2_mem:=ST2_MISSING_ADDR;
							else
								megashark_INFO_ST2_mem:=spi_Din;
								--if is_Sk and is_Del then
								--	-- FDCTEST.ASM : 1A FAIL 06 donc EOT est &40
								--els
								if is_Del then -- FDCTEST.ASM : 20 21
									megashark_INFO_ST2_mem(6):=not(megashark_INFO_ST2_mem(6));
								end if;
							end if;
							
							-- isDeletedData() : megashark_INFO_ST2_mem(6) CONTROL MASK (0x040) = '1'
							--if (is_Sk and not(is_Del) and (megashark_INFO_ST2_mem(6)='1'))
							if not(doGOTO) and (
									--FDCTEST.ASM defw read_data_noskip	;; 19 read data, no skip
									--FDCTEST.ASM defw read_del_data_skip	;; 1A read deleted data sectors with skip
									--(is_Sk  and not(is_Del) and (megashark_INFO_ST2_mem(6)='1'))
									--or 
									--(is_Del and (megashark_INFO_ST2_mem(6)='0'))
									--(is_Del and not(is_Sk ) and (megashark_INFO_ST2_mem(6)='1'))
									
									(is_Sk  and (megashark_INFO_ST2_mem(6)='1'))
									
									--(is_Sk  and not(is_Del) and (megashark_INFO_ST2_mem(6)='1')) -- FDCTEST 1F read_data_skip2
									--or
									--(is_Del and is_Sk  and (megashark_INFO_ST2_mem(6)='0')) -- FDCTEST.ASM 1A PASS
								) and not(is_overrun and is_sector_or_track_not_found)
								then
								---- SK stands for skip deleted data address mark
								---- je suis en READ+SK, et je suis sur un DATA DELETED, donc je le SKIP.
								---- je suis en READ_DELETED, et je suis sur un DATA !DELETED, donc je zap
								---- cas READ_DELETED avec SK stupide, donc ne zap pas ici.
								-- if ((command & (1 << 5)) == 0) { // skip if deleted data
								-- if ((command & (1 << 5)) != 0) { // skip if deleted data
								-- Logiquement des erreurs à gérer temporairement d'un secteur à l'autre via Skip,
								--donc on va faire sans pour le moment.
								--  ST2_DATA_ERROR
								-- Niger Mansell, Orion x46/x66 (commande read avec et sans sk)
								-- on passe au suivant.
								-- sector found by skipped
								--chrn(15 downto 8):=chrn(15 downto 8)+1; -- skip ! (in testbench EOT=BOT+4 and READ_DATA is 2)
								is_next:=true;
								no_sect:=no_sect+1; -- skip (myself)
								if no_sect>=nb_sects then
									-- normalement on fait un tour complet, et après on stop.
									-- goto next sector info
									no_sect:=0; -- back to sector 0 of this current track.
									is_overrun:=true;
									SectorInfo_A:=TrackInfo_A+(PREFIX & x"0000001a"); -- +conv_std_logic_vector(no_sect*8,41);
									meca_spi_A<=SectorInfo_A;
									meca_spi_Rdo<='1';
									mecashark_step:=22;
								else
									-- goto next sector info
									-- sizeof(SectorInfo) = 8
									SectorInfo_A:=SectorInfo_A+(PREFIX & x"00000008");
									meca_spi_A<=SectorInfo_A;
									meca_spi_Rdo<='1';
									mecashark_step:=22;
								end if;
							else
								megashark_INFO_ST1<=megashark_INFO_ST1_mem;
								megashark_INFO_ST2<=megashark_INFO_ST2_mem;
								-- go to start of sector list of this track
								Sector_A:=TrackInfo_A + (PREFIX & x"00000100");
								mecashark_step:=24;
							end if;
						when 24=>
							if no_sect>0 then
								no_sect:=no_sect-1;
								Sector_A:=Sector_A + track_sector_size;
							else
								mecashark_step:=26; -- Sector_A is just before concerned data block
							end if;
						
						when 26=> -- chrn and TrackInfo_A are great, let's go
							if doGOTO or (sector_sector_size/=x"02" and sector_sector_size/=x"01") then
								-- thanks for all, and good bye
								megashark_CHRNresult<=chrn;
								mecashark_step:=29;
							elsif doWRITE then
								megashark_A_mem(8 downto 0):=megashark_A(8 downto 0);
								megashark_Dout_mem:=megashark_Dout;
								output_A:=Sector_A + megashark_A_mem;
								meca_spi_A<=output_A;
								meca_spi_Dout<=megashark_Dout_mem;
								-- spi_Wblock (in block): just fill internal RAM
								-- spi_Wblock+spi_W (begin of block): do full read into internal and just fill internal RAM
								-- spi_W (end of block): do write internal block into SPI, writing also last byte given
								if sector_sector_size=x"01" and megashark_A_mem(8)='1' then
									-- out of range
								elsif megashark_A_mem = "0" & x"00" then
									--begin of input block
									if output_A(8 downto 0) = "1" & x"FF" then
										--unluck : end of output block...
										meca_spi_Wdo<='1';
									else
										meca_spi_Wdo<='1';
										meca_spi_Wblock<='1';
									end if;
								-- sector_sector_size(1) = 1 => x"02"
								-- sector_sector_size(1) = 0 => x"01"
								elsif megashark_A_mem = sector_sector_size(1) & x"FF" then
									-- end of action !
									meca_spi_Wdo<='1';
								elsif output_A(8 downto 0) = "1" & x"FF" then
									-- end of some output block
									meca_spi_Wdo<='1';
								elsif output_A(8 downto 0) = "0" & x"00" then
									-- begin of some output block
									meca_spi_Wdo<='1';
									meca_spi_Wblock<='1';
								else
									meca_spi_Wblock<='1';
								end if;
								megashark_CHRNresult<=chrn;
								mecashark_step:=29;
							else
								megashark_A_mem(8 downto 0):=megashark_A(8 downto 0);
								if sector_sector_size=x"01" then
									megashark_A_mem(8):='0';
								end if;
								output_A:=Sector_A + megashark_A_mem;
								meca_spi_A<=output_A;
								meca_spi_Rdo<='1';
								mecashark_step:=27;
							end if;
						when 27=> -- read byte
								megashark_Din_mem:=spi_Din;
								--if megashark_A_mem<16*2 then
								--	megashark_Din_mem:=sampleSector((16*2-conv_integer(megashark_A_mem))*8-1 downto (16*2-conv_integer(megashark_A_mem)-1)*8);
								--else
								--	megashark_Din_mem:=x"E5";
								--end if;
								megashark_Din<=megashark_Din_mem;
								megashark_CHRNresult<=chrn;
								mecashark_step:=29;
						when 29=> -- DSK command is just executed, CHRN is loaded.
							megashark_done_s<='1';
					end case;
				end if;
			end if;
		end if;
	end process mecashark;

end Behavioral;