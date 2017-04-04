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
-- FPGAmstrad_*.vhd : Auto-generated code from FGPAmstrad 3 main schematics
-- This type of component is only used on my main schematic.
-- As it is about auto-generated code, you'll find no comments by here
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : bootloader_sd.vhf
-- /___/   /\     Timestamp : 03/14/2015 16:20:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl bootloader_sd.vhf -w C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/bootloader_sd.sch
--Design Name: bootloader_sd
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity FPGAmstrad_bootloader_sd is
   port ( CLK8MHz     : in    std_logic; 
         dump        : in    std_logic_vector (1 downto 0); -- plug to buttons(1:0)...
          --FDC_input   : in    std_logic_vector (6 downto 0); 
          --file_change : in    std_logic; 
          --FILE_SELECT : in    std_logic_vector (7 downto 0); 
          key_reset   : in    std_logic_vector(1 downto 0); -- key_reset : 1, key_reset_space : 0
          --leds_select : in    std_logic_vector (4 downto 0):="00000"; 
          MISO        : in    std_logic; 
          nCLK8MHz    : in    std_logic; 
          ram_Din     : in    std_logic_vector (7 downto 0); 
			 reset : in std_logic;
          --FDC_output  : out   std_logic_vector (5 downto 0); 
          FILE_LOADED : out   std_logic; 
          --LEDS        : out   std_logic_vector (7 downto 0);
			 MOSI        : out   std_logic; 
          ram_A       : out   std_logic_vector (22 downto 0); 
          ram_Dout    : out   std_logic_vector (7 downto 0); 
          ram_R_n     : out   std_logic; 
          ram_W_n     : out   std_logic; 
          SCLK        : out   std_logic; 
          --SS_n        : out   std_logic;
          dir_entry_ack         : in    std_logic; 
          dir_entry_downloading : in    std_logic; 
          dir_entry_clk         : out   std_logic; 
          dir_entry_d           : in   std_logic_vector (7 downto 0); 
          dir_entry_r        : out   std_logic;
			 init_RAM: out std_logic;
			 --debug_crc_r:out std_logic_vector(15 downto 0):=(others=>'0');
			 --debug_crc_c:out std_logic_vector(15 downto 0):=(others=>'0');
			 is_dskReady:out std_logic_vector(1 downto 0);
			 
			 
			 -- simpleDSK interface
			  megashark_CHRNresult : out STD_LOGIC_VECTOR(4*8-1 downto 0); -- chr+1 quand W/R, chrn quand goto0
			  megashark_doGOTO : in std_logic_vector(2 downto 0); -- not a W/R operation finally
			  megashark_CHRN : in STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : in std_logic_vector(8 downto 0); -- sector byte selection
			  megashark_Din : out std_logic_vector(7 downto 0);
			  megashark_Dout : in std_logic_vector(7 downto 0);
			  megashark_doREAD : in std_logic_vector(2 downto 0);
			  megashark_doWRITE : in std_logic;
			  megashark_done : out std_logic;
			  megashark_select : in std_logic;
			  megashark_face : in std_logic;
			  megashark_INFO_2SIDES : out std_logic;
			  megashark_INFO_ST1 : out std_logic_vector(7 downto 0);
			  megashark_INFO_ST2 : out std_logic_vector(7 downto 0)
			 );
end FPGAmstrad_bootloader_sd;

architecture BEHAVIORAL of FPGAmstrad_bootloader_sd is
   attribute BOX_TYPE   : string ;
   --signal DO_STOP           : std_logic;
   signal INIT_DONE         : std_logic;
   signal ram_W             : std_logic;
   signal XLXN_52           : std_logic_vector (7 downto 0);
   signal XLXN_55           : std_logic_vector (31 downto 0);
	signal XLXN_55b          : std_logic_vector (8 downto 0);
   --signal XLXN_76           : std_logic;
   signal XLXN_89           : std_logic;
   --signal XLXN_91           : std_logic;
   signal XLXN_94           : std_logic;
   signal XLXN_98           : std_logic;
   signal XLXN_99           : std_logic;
   signal XLXN_100          : std_logic;
   signal XLXN_101          : std_logic;
   signal XLXN_103          : std_logic_vector (7 downto 0);
   --signal XLXN_107          : std_logic_vector (7 downto 0);
   --signal XLXN_114          : std_logic_vector (7 downto 0);
   signal XLXN_126          : std_logic;
   signal XLXN_127          : std_logic;
   signal XLXN_128          : std_logic;
   signal XLXN_129          : std_logic;
   signal FILE_LOADED_DUMMY : std_logic;
   component SDRAM_SPIMASTER
      port ( reset         : in    std_logic; 
             SCLK          : in    std_logic; 
             MISO          : in    std_logic; 
             CD_n          : in    std_logic; 
             spi_R         : in    std_logic; 
             spi_W         : in    std_logic; 
             spi_Wblock    : in    std_logic; 
             --special_W     : in    std_logic; 
             --leds_select   : in    std_logic; 
             address       : in    std_logic_vector (31 downto 0); 
				 address_block : in    std_logic_vector (8 downto 0); 
             data_in       : in    std_logic_vector (7 downto 0); 
             MOSI          : out   std_logic; 
             SS_n          : out   std_logic; 
             spi_Rdone     : out   std_logic; 
             spi_Wdone     : out   std_logic; 
             spi_init_done : out   std_logic; 
             data_out      : out   std_logic_vector (7 downto 0)
				 --debug_crc_r:out std_logic_vector(15 downto 0):=(others=>'0');
			    --debug_crc_c:out std_logic_vector(15 downto 0):=(others=>'0');
             --leds          : out   std_logic_vector (7 downto 0)
				 );
   end component;
   
   component SDRAM_FAT32_LOADER
      port ( CLK            : in    std_logic; 
             spi_Rdone      : in    std_logic; 
             spi_Wdone      : in    std_logic; 
             spi_init_done  : in    std_logic; 
             dump_button    : in    std_logic; 
             --stop           : in    std_logic; 
             key_reset      : in    std_logic_vector(1 downto 0); 
             --changeDSK      : in    std_logic; 
             --file_select    : in    std_logic_vector (7 downto 0); 
             spi_Din        : in    std_logic_vector (7 downto 0); 
             --leds_select    : in    std_logic_vector (2 downto 0); 
             --FDC_input      : in    std_logic_vector (6 downto 0); 
             ram_W          : out   std_logic; 
             ram_R          : out   std_logic; 
             spi_Rdo        : out   std_logic; 
             spi_Wdo        : out   std_logic; 
             spi_Wblock     : out   std_logic; 
             load_init_done : out   std_logic; 
				 is_dskReady    : out   std_logic_vector (1 downto 0);
             ram_A          : out   std_logic_vector (22 downto 0); 
             spi_A          : out   std_logic_vector (31 downto 0); 
				 spi_A_block    : out   std_logic_vector (8 downto 0); 
             spi_Dout       : out   std_logic_vector (7 downto 0); 
             --leds           : out   std_logic_vector (7 downto 0);
             --FDC_output     : out   std_logic_vector (5 downto 0); 
             ram_Din        : in    std_logic_vector (7 downto 0); 
             ram_Dout       : out   std_logic_vector (7 downto 0);
             dir_entry_ack         : in    std_logic; 
             dir_entry_downloading : in    std_logic; 
             dir_entry_clk         : out   std_logic; 
             dir_entry_r           : out   std_logic; 
             dir_entry_d           : in   std_logic_vector (7 downto 0);
				 init_RAM: out std_logic;
-- simpleDSK interface
			  megashark_CHRNresult : out STD_LOGIC_VECTOR(4*8-1 downto 0); -- chr+1 quand W/R, chrn quand goto0
			  megashark_doGOTO : in std_logic_vector(2 downto 0); -- not a W/R operation finally
			  megashark_CHRN : in STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : in std_logic_vector(8 downto 0); -- sector byte selection
			  megashark_Din : out std_logic_vector(7 downto 0);
			  megashark_Dout : in std_logic_vector(7 downto 0);
			  megashark_doREAD : in std_logic_vector(2 downto 0);
			  megashark_doWRITE : in std_logic;
			  megashark_done : out std_logic;
			  megashark_select : in std_logic;
			  megashark_face : in std_logic;
			  megashark_INFO_2SIDES : out std_logic;
			  megashark_INFO_ST1 : out std_logic_vector(7 downto 0);
			  megashark_INFO_ST2 : out std_logic_vector(7 downto 0));
   end component;
   
	signal dump_button : std_logic:='0';
begin
   FILE_LOADED <= FILE_LOADED_DUMMY;
   XLXI_1 : SDRAM_SPIMASTER
      port map (reset=>reset,
					 address(31 downto 0)=>XLXN_55(31 downto 0),
					 address_block(8 downto 0)=>XLXN_55b(8 downto 0),
                CD_n=>XLXN_89,
                data_in(7 downto 0)=>XLXN_103(7 downto 0),
                --leds_select=>leds_select(4),
                MISO=>MISO,
                SCLK=>nCLK8MHz,
                --special_W=>XLXN_91,
                spi_R=>XLXN_100,
                spi_W=>XLXN_101,
                spi_Wblock=>XLXN_129,
                data_out(7 downto 0)=>XLXN_52(7 downto 0),
                --leds(7 downto 0)=>XLXN_107(7 downto 0),
                MOSI=>MOSI,
                spi_init_done=>INIT_DONE,
                spi_Rdone=>XLXN_98,
                spi_Wdone=>XLXN_99,
					 --debug_crc_r=>debug_crc_r,
					 --debug_crc_c=>debug_crc_c,
                SS_n=>open);
   
	dump_button <= dump(0) and dump(1); -- do press the 2 buttons at the same time to create a RAM dump.
   XLXI_7 : SDRAM_FAT32_LOADER
      port map (--changeDSK=>'1',
                CLK=>CLK8MHz,
                dump_button=>dump_button,
                key_reset=>key_reset,
                ram_Din(7 downto 0)=>ram_Din(7 downto 0),
                spi_Din(7 downto 0)=>XLXN_52(7 downto 0),
                spi_init_done=>INIT_DONE,
                spi_Rdone=>XLXN_98,
                spi_Wdone=>XLXN_99,
                is_dskReady=>is_dskReady,
                load_init_done=>FILE_LOADED_DUMMY,
                ram_A(22 downto 0)=>ram_A(22 downto 0),
                ram_Dout(7 downto 0)=>ram_Dout(7 downto 0),
                ram_R=>XLXN_126,
                ram_W=>ram_W,
                spi_A(31 downto 0)=>XLXN_55(31 downto 0),
                spi_A_block(8 downto 0)=>XLXN_55b(8 downto 0),
                spi_Dout(7 downto 0)=>XLXN_103(7 downto 0),
                spi_Rdo=>XLXN_100,
                spi_Wblock=>XLXN_129,
                spi_Wdo=>XLXN_101,
                dir_entry_ack=>dir_entry_ack,
                dir_entry_downloading=>dir_entry_downloading,
                dir_entry_clk=>dir_entry_clk,
                dir_entry_r=>dir_entry_r,
                dir_entry_d=>dir_entry_d,
                init_RAM=>init_RAM,
			  -- simpleDSK interface
			  megashark_CHRNresult=>megashark_CHRNresult,
			  megashark_doGOTO=>megashark_doGOTO,
			  megashark_CHRN=>megashark_CHRN,
			  megashark_A=>megashark_A,
			  megashark_Din=>megashark_Din,
			  megashark_Dout=>megashark_Dout,
			  megashark_doREAD=>megashark_doREAD,
			  megashark_doWRITE=>megashark_doWRITE,
			  megashark_done=>megashark_done,
			  megashark_select=>megashark_select,
			  megashark_face=>megashark_face,
			  megashark_INFO_2SIDES=>megashark_INFO_2SIDES,
			  megashark_INFO_ST1=>megashark_INFO_ST1,
			  megashark_INFO_ST2=>megashark_INFO_ST2
					 );
   
ram_W_n<=not(XLXN_94);
SCLK<=CLK8MHz;
XLXN_89<='0';
XLXN_94<=XLXN_127 and ram_W;
XLXN_127<=not(FILE_LOADED_DUMMY);
XLXN_128<=XLXN_126 and XLXN_127;
ram_R_n<=not(XLXN_128);
   
end BEHAVIORAL;


