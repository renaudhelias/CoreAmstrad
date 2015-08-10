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
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bootloader_sd is
   port ( CLK8MHz               : in    std_logic; 
          dir_entry_ack         : in    std_logic; 
          dir_entry_downloading : in    std_logic; 
          dump                  : in    std_logic; 
          FDC_input             : in    std_logic_vector (6 downto 0); 
          file_change           : in    std_logic; 
          FILE_SELECT           : in    std_logic_vector (7 downto 0); 
          key_reset             : in    std_logic; 
          leds_select           : in    std_logic_vector (4 downto 0); 
          MISO                  : in    std_logic; 
          nCLK8MHz              : in    std_logic; 
          ram_Din               : in    std_logic_vector (7 downto 0); 
          dir_entry_clk         : out   std_logic; 
          dir_entry_d           : out   std_logic_vector (7 downto 0); 
          dir_entry_read        : out   std_logic; 
          FDC_output            : out   std_logic_vector (5 downto 0); 
          FILE_LOADED           : out   std_logic; 
          is_ucpm               : out   std_logic; 
          LEDS                  : out   std_logic_vector (7 downto 0); 
          MOSI                  : out   std_logic; 
          ram_A                 : out   std_logic_vector (22 downto 0); 
          ram_Dout              : out   std_logic_vector (7 downto 0); 
          ram_R_n               : out   std_logic; 
          ram_W_n               : out   std_logic; 
          SCLK                  : out   std_logic; 
          SS_n                  : out   std_logic);
end bootloader_sd;

architecture BEHAVIORAL of bootloader_sd is
   attribute BOX_TYPE   : string ;
   signal DO_STOP               : std_logic;
   signal INIT_DONE             : std_logic;
   signal ram_W                 : std_logic;
   signal XLXN_52               : std_logic_vector (7 downto 0);
   signal XLXN_55               : std_logic_vector (31 downto 0);
   signal XLXN_76               : std_logic;
   signal XLXN_89               : std_logic;
   signal XLXN_91               : std_logic;
   signal XLXN_94               : std_logic;
   signal XLXN_98               : std_logic;
   signal XLXN_99               : std_logic;
   signal XLXN_100              : std_logic;
   signal XLXN_101              : std_logic;
   signal XLXN_103              : std_logic_vector (7 downto 0);
   signal XLXN_107              : std_logic_vector (7 downto 0);
   signal XLXN_114              : std_logic_vector (7 downto 0);
   signal XLXN_126              : std_logic;
   signal XLXN_127              : std_logic;
   signal XLXN_128              : std_logic;
   signal XLXN_129              : std_logic;
   signal XLXN_130              : std_logic;
   signal FILE_LOADED_DUMMY     : std_logic;
   component SDRAM_SPIMASTER
      port ( reset         : in    std_logic; 
             SCLK          : in    std_logic; 
             MISO          : in    std_logic; 
             CD_n          : in    std_logic; 
             spi_R         : in    std_logic; 
             spi_W         : in    std_logic; 
             spi_Wblock    : in    std_logic; 
             special_W     : in    std_logic; 
             leds_select   : in    std_logic; 
             address       : in    std_logic_vector (31 downto 0); 
             data_in       : in    std_logic_vector (7 downto 0); 
             MOSI          : out   std_logic; 
             SS_n          : out   std_logic; 
             spi_Rdone     : out   std_logic; 
             spi_Wdone     : out   std_logic; 
             spi_init_done : out   std_logic; 
             data_out      : out   std_logic_vector (7 downto 0); 
             leds          : out   std_logic_vector (7 downto 0));
   end component;
   
   component SDRAM_FAT32_LOADER
      port ( CLK                   : in    std_logic; 
             spi_Rdone             : in    std_logic; 
             spi_Wdone             : in    std_logic; 
             spi_init_done         : in    std_logic; 
             dump_button           : in    std_logic; 
             stop                  : in    std_logic; 
             key_reset             : in    std_logic; 
             changeDSK             : in    std_logic; 
             file_select           : in    std_logic_vector (7 downto 0); 
             ram_Din               : in    std_logic_vector (7 downto 0); 
             spi_Din               : in    std_logic_vector (7 downto 0); 
             leds_select           : in    std_logic_vector (2 downto 0); 
             FDC_input             : in    std_logic_vector (6 downto 0); 
             ram_W                 : out   std_logic; 
             ram_R                 : out   std_logic; 
             spi_Rdo               : out   std_logic; 
             spi_Wdo               : out   std_logic; 
             spi_Wblock            : out   std_logic; 
             load_init_done        : out   std_logic; 
             is_ucpm               : out   std_logic; 
             ram_A                 : out   std_logic_vector (22 downto 0); 
             ram_Dout              : out   std_logic_vector (7 downto 0); 
             spi_A                 : out   std_logic_vector (31 downto 0); 
             spi_Dout              : out   std_logic_vector (7 downto 0); 
             leds                  : out   std_logic_vector (7 downto 0); 
             FDC_output            : out   std_logic_vector (5 downto 0); 
             dir_entry_ack         : in    std_logic; 
             dir_entry_downloading : in    std_logic; 
             dir_entry_clk         : out   std_logic; 
             dir_entry_r           : out   std_logic; 
             dir_entry_d           : out   std_logic_vector (7 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component LEDS_SWITCH2
      port ( select_leds : in    std_logic; 
             leds1       : in    std_logic_vector (7 downto 0); 
             leds2       : in    std_logic_vector (7 downto 0); 
             leds        : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   FILE_LOADED <= FILE_LOADED_DUMMY;
   XLXI_1 : SDRAM_SPIMASTER
      port map (address(31 downto 0)=>XLXN_55(31 downto 0),
                CD_n=>XLXN_89,
                data_in(7 downto 0)=>XLXN_103(7 downto 0),
                leds_select=>leds_select(4),
                MISO=>MISO,
                reset=>XLXN_130,
                SCLK=>nCLK8MHz,
                special_W=>XLXN_91,
                spi_R=>XLXN_100,
                spi_W=>XLXN_101,
                spi_Wblock=>XLXN_129,
                data_out(7 downto 0)=>XLXN_52(7 downto 0),
                leds(7 downto 0)=>XLXN_107(7 downto 0),
                MOSI=>MOSI,
                spi_init_done=>INIT_DONE,
                spi_Rdone=>XLXN_98,
                spi_Wdone=>XLXN_99,
                SS_n=>open);
   
   XLXI_7 : SDRAM_FAT32_LOADER
      port map (changeDSK=>file_change,
                CLK=>CLK8MHz,
                dir_entry_ack=>dir_entry_ack,
                dir_entry_downloading=>dir_entry_downloading,
                dump_button=>dump,
                FDC_input(6 downto 0)=>FDC_input(6 downto 0),
                file_select(7 downto 0)=>FILE_SELECT(7 downto 0),
                key_reset=>key_reset,
                leds_select(2 downto 0)=>leds_select(2 downto 0),
                ram_Din(7 downto 0)=>ram_Din(7 downto 0),
                spi_Din(7 downto 0)=>XLXN_52(7 downto 0),
                spi_init_done=>INIT_DONE,
                spi_Rdone=>XLXN_98,
                spi_Wdone=>XLXN_99,
                stop=>DO_STOP,
                dir_entry_clk=>dir_entry_clk,
                dir_entry_d(7 downto 0)=>dir_entry_d(7 downto 0),
                dir_entry_r=>dir_entry_read,
                FDC_output(5 downto 0)=>FDC_output(5 downto 0),
                is_ucpm=>is_ucpm,
                leds(7 downto 0)=>XLXN_114(7 downto 0),
                load_init_done=>FILE_LOADED_DUMMY,
                ram_A(22 downto 0)=>ram_A(22 downto 0),
                ram_Dout(7 downto 0)=>ram_Dout(7 downto 0),
                ram_R=>XLXN_126,
                ram_W=>ram_W,
                spi_A(31 downto 0)=>XLXN_55(31 downto 0),
                spi_Dout(7 downto 0)=>XLXN_103(7 downto 0),
                spi_Rdo=>XLXN_100,
                spi_Wblock=>XLXN_129,
                spi_Wdo=>XLXN_101);
   
   XLXI_26 : INV
      port map (I=>XLXN_94,
                O=>ram_W_n);
   
   XLXI_40 : INV
      port map (I=>XLXN_76,
                O=>SS_n);
   
   XLXI_41 : VCC
      port map (P=>XLXN_76);
   
   XLXI_43 : GND
      port map (G=>DO_STOP);
   
   XLXI_46 : BUF
      port map (I=>CLK8MHz,
                O=>SCLK);
   
   XLXI_52 : GND
      port map (G=>XLXN_89);
   
   XLXI_54 : GND
      port map (G=>XLXN_91);
   
   XLXI_57 : AND2
      port map (I0=>XLXN_127,
                I1=>ram_W,
                O=>XLXN_94);
   
   XLXI_59 : INV
      port map (I=>FILE_LOADED_DUMMY,
                O=>XLXN_127);
   
   XLXI_60 : LEDS_SWITCH2
      port map (leds1(7 downto 0)=>XLXN_107(7 downto 0),
                leds2(7 downto 0)=>XLXN_114(7 downto 0),
                select_leds=>leds_select(3),
                leds(7 downto 0)=>LEDS(7 downto 0));
   
   XLXI_63 : AND2
      port map (I0=>XLXN_126,
                I1=>XLXN_127,
                O=>XLXN_128);
   
   XLXI_64 : INV
      port map (I=>XLXN_128,
                O=>ram_R_n);
   
   XLXI_65 : GND
      port map (G=>XLXN_130);
   
end BEHAVIORAL;


