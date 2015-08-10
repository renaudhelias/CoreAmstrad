--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.2
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_switch_z80_vga.vhf
-- /___/   /\     Timestamp : 01/18/2011 14:56:44
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3 -flat -suppress -vhdl C:/Users/freemac/BuildYourOwnZ80Computer/amstrad_switch_z80_vga.vhf -w C:/Users/freemac/BuildYourOwnZ80Computer/amstrad_switch_z80_vga.sch
--Design Name: amstrad_switch_z80_vga
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FD8CE_MXILINX_amstrad_switch_z80_vga is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (7 downto 0); 
          Q   : out   std_logic_vector (7 downto 0));
end FD8CE_MXILINX_amstrad_switch_z80_vga;

architecture BEHAVIORAL of FD8CE_MXILINX_amstrad_switch_z80_vga is
   attribute BOX_TYPE   : string ;
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
begin
   I_Q0 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(0),
                Q=>Q(0));
   
   I_Q1 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(1),
                Q=>Q(1));
   
   I_Q2 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(2),
                Q=>Q(2));
   
   I_Q3 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(3),
                Q=>Q(3));
   
   I_Q4 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(4),
                Q=>Q(4));
   
   I_Q5 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(5),
                Q=>Q(5));
   
   I_Q6 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(6),
                Q=>Q(6));
   
   I_Q7 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(7),
                Q=>Q(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity VRAM_Amstrad_MUSER_amstrad_switch_z80_vga is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_MUSER_amstrad_switch_z80_vga;

architecture BEHAVIORAL of VRAM_Amstrad_MUSER_amstrad_switch_z80_vga is
   attribute INIT_00             : string ;
   attribute INIT_01             : string ;
   attribute INIT_02             : string ;
   attribute INIT_03             : string ;
   attribute INIT_04             : string ;
   attribute INIT_05             : string ;
   attribute INIT_06             : string ;
   attribute INIT_07             : string ;
   attribute INIT_08             : string ;
   attribute INIT_09             : string ;
   attribute INIT_0A             : string ;
   attribute INIT_0B             : string ;
   attribute INIT_0C             : string ;
   attribute INIT_0D             : string ;
   attribute INIT_0E             : string ;
   attribute INIT_0F             : string ;
   attribute INIT_10             : string ;
   attribute INIT_11             : string ;
   attribute INIT_12             : string ;
   attribute INIT_13             : string ;
   attribute INIT_14             : string ;
   attribute INIT_15             : string ;
   attribute INIT_16             : string ;
   attribute INIT_17             : string ;
   attribute INIT_18             : string ;
   attribute INIT_19             : string ;
   attribute INIT_1A             : string ;
   attribute INIT_1B             : string ;
   attribute INIT_1C             : string ;
   attribute INIT_1D             : string ;
   attribute INIT_1E             : string ;
   attribute INIT_1F             : string ;
   attribute INIT_20             : string ;
   attribute INIT_21             : string ;
   attribute INIT_22             : string ;
   attribute INIT_23             : string ;
   attribute INIT_24             : string ;
   attribute INIT_25             : string ;
   attribute INIT_26             : string ;
   attribute INIT_27             : string ;
   attribute INIT_28             : string ;
   attribute INIT_29             : string ;
   attribute INIT_2A             : string ;
   attribute INIT_2B             : string ;
   attribute INIT_2C             : string ;
   attribute INIT_2D             : string ;
   attribute INIT_2E             : string ;
   attribute INIT_2F             : string ;
   attribute INIT_30             : string ;
   attribute INIT_31             : string ;
   attribute INIT_32             : string ;
   attribute INIT_33             : string ;
   attribute INIT_34             : string ;
   attribute INIT_35             : string ;
   attribute INIT_36             : string ;
   attribute INIT_37             : string ;
   attribute INIT_38             : string ;
   attribute INIT_39             : string ;
   attribute INIT_3A             : string ;
   attribute INIT_3B             : string ;
   attribute INIT_3C             : string ;
   attribute INIT_3D             : string ;
   attribute INIT_3E             : string ;
   attribute INIT_3F             : string ;
   attribute SRVAL_A             : string ;
   attribute SRVAL_B             : string ;
   attribute WRITE_MODE_A        : string ;
   attribute WRITE_MODE_B        : string ;
   attribute INIT_A              : string ;
   attribute INIT_B              : string ;
   attribute SIM_COLLISION_CHECK : string ;
   attribute BOX_TYPE            : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_17  : std_logic_vector (0 downto 0);
   signal XLXN_18  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_25  : std_logic_vector (0 downto 0);
   signal XLXN_26  : std_logic;
   signal XLXN_29  : std_logic_vector (0 downto 0);
   signal XLXN_30  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_37  : std_logic_vector (0 downto 0);
   signal XLXN_38  : std_logic;
   signal XLXN_41  : std_logic_vector (0 downto 0);
   signal XLXN_42  : std_logic_vector (0 downto 0);
   signal XLXN_43  : std_logic_vector (0 downto 0);
   signal XLXN_44  : std_logic_vector (0 downto 0);
   component RAMB16_S1_S1
      -- synopsys translate_off
      generic( INIT_00 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_01 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_02 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_03 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_04 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_05 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_06 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_07 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_08 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_09 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_10 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_11 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_12 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_13 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_14 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_15 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_16 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_17 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_18 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_19 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_20 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_21 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_22 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_23 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_24 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_25 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_26 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_27 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_28 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_29 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_30 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_31 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_32 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_33 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_34 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_35 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_36 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_37 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_38 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_39 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               SRVAL_A : bit_vector :=  x"0";
               SRVAL_B : bit_vector :=  x"0";
               WRITE_MODE_A : string :=  "WRITE_FIRST";
               WRITE_MODE_B : string :=  "WRITE_FIRST";
               INIT_A : bit_vector :=  x"0";
               INIT_B : bit_vector :=  x"0";
               SIM_COLLISION_CHECK : string :=  "ALL");
      -- synopsys translate_on
      port ( ADDRA : in    std_logic_vector (13 downto 0); 
             ADDRB : in    std_logic_vector (13 downto 0); 
             CLKA  : in    std_logic; 
             CLKB  : in    std_logic; 
             DIA   : in    std_logic_vector (0 downto 0); 
             DIB   : in    std_logic_vector (0 downto 0); 
             ENA   : in    std_logic; 
             ENB   : in    std_logic; 
             SSRA  : in    std_logic; 
             SSRB  : in    std_logic; 
             WEA   : in    std_logic; 
             WEB   : in    std_logic; 
             DOA   : out   std_logic_vector (0 downto 0); 
             DOB   : out   std_logic_vector (0 downto 0));
   end component;
   attribute INIT_00 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB16_S1_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute SRVAL_A of RAMB16_S1_S1 : component is "0";
   attribute SRVAL_B of RAMB16_S1_S1 : component is "0";
   attribute WRITE_MODE_A of RAMB16_S1_S1 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of RAMB16_S1_S1 : component is "WRITE_FIRST";
   attribute INIT_A of RAMB16_S1_S1 : component is "0";
   attribute INIT_B of RAMB16_S1_S1 : component is "0";
   attribute SIM_COLLISION_CHECK of RAMB16_S1_S1 : component is "ALL";
   attribute BOX_TYPE of RAMB16_S1_S1 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(0),
                DIB(0)=>XLXN_42(0),
                ENA=>XLXN_1,
                ENB=>XLXN_1,
                SSRA=>XLXN_1,
                SSRB=>XLXN_42(0),
                WEA=>vram_W,
                WEB=>XLXN_42(0),
                DOA=>open,
                DOB(0)=>vga_D(0));
   
   XLXI_2 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(2),
                DIB(0)=>XLXN_43(0),
                ENA=>XLXN_18,
                ENB=>XLXN_18,
                SSRA=>XLXN_18,
                SSRB=>XLXN_43(0),
                WEA=>vram_W,
                WEB=>XLXN_43(0),
                DOA=>open,
                DOB(0)=>vga_D(2));
   
   XLXI_3 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(3),
                DIB(0)=>XLXN_25(0),
                ENA=>XLXN_22,
                ENB=>XLXN_22,
                SSRA=>XLXN_22,
                SSRB=>XLXN_25(0),
                WEA=>vram_W,
                WEB=>XLXN_25(0),
                DOA=>open,
                DOB(0)=>vga_D(3));
   
   XLXI_4 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(7),
                DIB(0)=>XLXN_41(0),
                ENA=>XLXN_38,
                ENB=>XLXN_38,
                SSRA=>XLXN_38,
                SSRB=>XLXN_41(0),
                WEA=>vram_W,
                WEB=>XLXN_41(0),
                DOA=>open,
                DOB(0)=>vga_D(7));
   
   XLXI_5 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(1),
                DIB(0)=>XLXN_17(0),
                ENA=>XLXN_14,
                ENB=>XLXN_14,
                SSRA=>XLXN_14,
                SSRB=>XLXN_17(0),
                WEA=>vram_W,
                WEB=>XLXN_17(0),
                DOA=>open,
                DOB(0)=>vga_D(1));
   
   XLXI_6 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(6),
                DIB(0)=>XLXN_37(0),
                ENA=>XLXN_34,
                ENB=>XLXN_34,
                SSRA=>XLXN_34,
                SSRB=>XLXN_37(0),
                WEA=>vram_W,
                WEB=>XLXN_37(0),
                DOA=>open,
                DOB(0)=>vga_D(6));
   
   XLXI_7 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(5),
                DIB(0)=>XLXN_44(0),
                ENA=>XLXN_30,
                ENB=>XLXN_30,
                SSRA=>XLXN_30,
                SSRB=>XLXN_44(0),
                WEA=>vram_W,
                WEB=>XLXN_44(0),
                DOA=>open,
                DOB(0)=>vga_D(5));
   
   XLXI_8 : RAMB16_S1_S1
      port map (ADDRA(13 downto 0)=>vram_A(13 downto 0),
                ADDRB(13 downto 0)=>vga_A(13 downto 0),
                CLKA=>vram_CLK,
                CLKB=>vga_CLK,
                DIA(0)=>vram_D(4),
                DIB(0)=>XLXN_29(0),
                ENA=>XLXN_26,
                ENB=>XLXN_26,
                SSRA=>XLXN_26,
                SSRB=>XLXN_29(0),
                WEA=>vram_W,
                WEB=>XLXN_29(0),
                DOA=>open,
                DOB(0)=>vga_D(4));
   
   XLXI_13 : VCC
      port map (P=>XLXN_1);
   
   XLXI_14 : GND
      port map (G=>XLXN_42(0));
   
   XLXI_15 : VCC
      port map (P=>XLXN_14);
   
   XLXI_16 : VCC
      port map (P=>XLXN_18);
   
   XLXI_17 : VCC
      port map (P=>XLXN_22);
   
   XLXI_18 : VCC
      port map (P=>XLXN_26);
   
   XLXI_19 : VCC
      port map (P=>XLXN_30);
   
   XLXI_20 : VCC
      port map (P=>XLXN_34);
   
   XLXI_21 : VCC
      port map (P=>XLXN_38);
   
   XLXI_22 : GND
      port map (G=>XLXN_17(0));
   
   XLXI_23 : GND
      port map (G=>XLXN_43(0));
   
   XLXI_24 : GND
      port map (G=>XLXN_25(0));
   
   XLXI_25 : GND
      port map (G=>XLXN_29(0));
   
   XLXI_26 : GND
      port map (G=>XLXN_44(0));
   
   XLXI_27 : GND
      port map (G=>XLXN_37(0));
   
   XLXI_28 : GND
      port map (G=>XLXN_41(0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FTCE_MXILINX_amstrad_switch_z80_vga is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          T   : in    std_logic; 
          Q   : out   std_logic);
end FTCE_MXILINX_amstrad_switch_z80_vga;

architecture BEHAVIORAL of FTCE_MXILINX_amstrad_switch_z80_vga is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   attribute RLOC of I_36_35 : label is "X0Y0";
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>TQ);
   
   I_36_35 : FDCE
   generic map( INIT => INIT)
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>TQ,
                Q=>Q_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CB2CE_MXILINX_amstrad_switch_z80_vga is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          TC  : out   std_logic);
end CB2CE_MXILINX_amstrad_switch_z80_vga;

architecture BEHAVIORAL of CB2CE_MXILINX_amstrad_switch_z80_vga is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal TC_DUMMY : std_logic;
   component FTCE_MXILINX_amstrad_switch_z80_vga
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of I_Q0 : label is "I_Q0_0";
   attribute HU_SET of I_Q1 : label is "I_Q1_1";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   TC <= TC_DUMMY;
   I_Q0 : FTCE_MXILINX_amstrad_switch_z80_vga
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>XLXN_1,
                Q=>Q0_DUMMY);
   
   I_Q1 : FTCE_MXILINX_amstrad_switch_z80_vga
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>Q0_DUMMY,
                Q=>Q1_DUMMY);
   
   I_36_37 : AND2
      port map (I0=>Q1_DUMMY,
                I1=>Q0_DUMMY,
                O=>TC_DUMMY);
   
   I_36_47 : VCC
      port map (P=>XLXN_1);
   
   I_36_52 : AND2
      port map (I0=>CE,
                I1=>TC_DUMMY,
                O=>CEO);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity amstrad_switch_z80_vga_exported is
   port ( CLK50MHz : in    std_logic; 
          FIRE1    : in    std_logic; 
          RESET_n  : in    std_logic; 
          A        : out   std_logic_vector (15 downto 0); 
          BLUE     : out   std_logic; 
          CE1      : out   std_logic; 
          CLK4     : out   std_logic_vector (1 downto 0); 
          D        : out   std_logic_vector (7 downto 0); 
          GREEN    : out   std_logic; 
          HSYNC    : out   std_logic; 
          IO_RD    : out   std_logic; 
          IO_WR    : out   std_logic; 
          LB1      : out   std_logic; 
          LED1     : out   std_logic; 
          LED2     : out   std_logic; 
          MEM_RD   : out   std_logic; 
          MEM_WR   : out   std_logic; 
          OE1      : out   std_logic; 
          ram_A    : out   std_logic_vector (17 downto 0); 
          ram_W    : out   std_logic; 
          RED      : out   std_logic; 
          UB1      : out   std_logic; 
          VSYNC    : out   std_logic; 
          ram_D    : inout std_logic_vector (7 downto 0));
end amstrad_switch_z80_vga_exported;

architecture BEHAVIORAL of amstrad_switch_z80_vga_exported is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal n_portC_en   : std_logic_vector (7 downto 0);
   signal portC        : std_logic_vector (7 downto 0);
   signal touche_a     : std_logic;
   signal touche_a_mem : std_logic;
   signal un           : std_logic;
   signal vga_A        : std_logic_vector (15 downto 0);
   signal vram_A       : std_logic_vector (17 downto 0);
   signal XLXN_16      : std_logic;
   signal XLXN_37      : std_logic;
   signal XLXN_38      : std_logic;
   signal XLXN_58      : std_logic;
   signal XLXN_75      : std_logic;
   signal XLXN_76      : std_logic;
   signal XLXN_86      : std_logic;
   signal XLXN_88      : std_logic;
   signal XLXN_115     : std_logic;
   signal XLXN_117     : std_logic;
   signal XLXN_118     : std_logic;
   signal XLXN_127     : std_logic;
   signal XLXN_128     : std_logic;
   signal XLXN_130     : std_logic;
   signal XLXN_131     : std_logic;
   signal XLXN_137     : std_logic;
   signal XLXN_142     : std_logic;
   signal XLXN_153     : std_logic;
   signal XLXN_155     : std_logic;
   signal XLXN_180     : std_logic;
   signal XLXN_279     : std_logic;
   signal XLXN_283     : std_logic_vector (7 downto 0);
   signal XLXN_301     : std_logic;
   signal XLXN_302     : std_logic;
   signal XLXN_303     : std_logic;
   signal XLXN_309     : std_logic;
   signal XLXN_319     : std_logic;
   signal XLXN_321     : std_logic;
   signal XLXN_327     : std_logic;
   signal XLXN_332     : std_logic;
   signal XLXN_333     : std_logic;
   signal XLXN_336     : std_logic;
   signal XLXN_337     : std_logic;
   signal XLXN_338     : std_logic;
   signal XLXN_339     : std_logic;
   signal XLXN_340     : std_logic_vector (7 downto 0);
   signal XLXN_342     : std_logic;
   signal XLXN_343     : std_logic;
   signal XLXN_344     : std_logic_vector (7 downto 0);
   signal XLXN_345     : std_logic_vector (7 downto 0);
   signal zero         : std_logic;
   signal IO_WR_DUMMY  : std_logic;
   signal A_DUMMY      : std_logic_vector (15 downto 0);
   signal D_DUMMY      : std_logic_vector (7 downto 0);
   signal IO_RD_DUMMY  : std_logic;
   signal CLK4_DUMMY   : std_logic_vector (1 downto 0);
   signal LED1_DUMMY   : std_logic;
   signal LED2_DUMMY   : std_logic;
   signal MEM_WR_DUMMY : std_logic;
   signal MEM_RD_DUMMY : std_logic;
   component T80se
      port ( RESET_n : in    std_logic; 
             CLK_n   : in    std_logic; 
             CLKEN   : in    std_logic; 
             WAIT_n  : in    std_logic; 
             INT_n   : in    std_logic; 
             NMI_n   : in    std_logic; 
             BUSRQ_n : in    std_logic; 
             DI      : in    std_logic_vector (7 downto 0); 
             M1_n    : out   std_logic; 
             MREQ_n  : out   std_logic; 
             IORQ_n  : out   std_logic; 
             RD_n    : out   std_logic; 
             WR_n    : out   std_logic; 
             RFSH_n  : out   std_logic; 
             HALT_n  : out   std_logic; 
             BUSAK_n : out   std_logic; 
             A       : out   std_logic_vector (15 downto 0); 
             DO      : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component simple_GateArray
      port ( IO_REQ_W   : in    std_logic; 
             A15_A14    : in    std_logic_vector (1 downto 0); 
             D          : in    std_logic_vector (7 downto 0); 
             lowerROMen : out   std_logic; 
             upperROMen : out   std_logic; 
             MODE       : out   std_logic_vector (1 downto 0));
   end component;
   
   component AmstradRAMROM
      port ( wr_z80     : in    std_logic; 
             wr_io_z80  : in    std_logic; 
             lowerROMen : in    std_logic; 
             upperROMen : in    std_logic; 
             A          : in    std_logic_vector (15 downto 0); 
             ram_A      : out   std_logic_vector (17 downto 0));
   end component;
   
   component CB2CE_MXILINX_amstrad_switch_z80_vga
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component RAM_driver
      port ( rd    : in    std_logic; 
             wr    : in    std_logic; 
             A     : in    std_logic_vector (17 downto 0); 
             CLK4  : in    std_logic_vector (1 downto 0); 
             Din   : in    std_logic_vector (7 downto 0); 
             Dout  : inout std_logic_vector (7 downto 0); 
             ram_D : inout std_logic_vector (7 downto 0); 
             ram_W : out   std_logic; 
             ram_R : out   std_logic; 
             ram_A : out   std_logic_vector (17 downto 0); 
             reset : in    std_logic);
   end component;
   
   component VRAM_Amstrad_MUSER_amstrad_switch_z80_vga
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component aZRaEL_vram2vgaAmstrad
      port ( CLK_25MHz : in    std_logic; 
             DATA      : in    std_logic_vector (7 downto 0); 
             R         : out   std_logic; 
             RED       : out   std_logic; 
             GREEN     : out   std_logic; 
             BLUE      : out   std_logic; 
             VSYNC     : out   std_logic; 
             HSYNC     : out   std_logic; 
             ADDRESS   : out   std_logic_vector (15 downto 0));
   end component;
   
   component I82C55
      port ( I_CS_L    : in    std_logic; 
             I_RD_L    : in    std_logic; 
             I_WR_L    : in    std_logic; 
             RESET     : in    std_logic; 
             ENA       : in    std_logic; 
             CLK       : in    std_logic; 
             I_ADDR    : in    std_logic_vector (1 downto 0); 
             I_DATA    : in    std_logic_vector (7 downto 0); 
             I_PA      : in    std_logic_vector (7 downto 0); 
             I_PB      : in    std_logic_vector (7 downto 0); 
             I_PC      : in    std_logic_vector (7 downto 0); 
             IO_DATA   : inout std_logic_vector (7 downto 0); 
             O_PA      : out   std_logic_vector (7 downto 0); 
             O_PA_OE_L : out   std_logic_vector (7 downto 0); 
             O_PB      : out   std_logic_vector (7 downto 0); 
             O_PB_OE_L : out   std_logic_vector (7 downto 0); 
             O_PC      : out   std_logic_vector (7 downto 0); 
             O_PC_OE_L : out   std_logic_vector (7 downto 0));
   end component;
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component LD
      generic( INIT : bit :=  '0');
      port ( D : in    std_logic; 
             G : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of LD : component is "BLACK_BOX";
   
   component FD8CE_MXILINX_amstrad_switch_z80_vga
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute HU_SET of XLXI_221 : label is "XLXI_221_2";
   attribute HU_SET of XLXI_228 : label is "XLXI_228_3";
   attribute HU_SET of XLXI_321 : label is "XLXI_321_4";
   attribute HU_SET of XLXI_324 : label is "XLXI_324_5";
begin
   A(15 downto 0) <= A_DUMMY(15 downto 0);
   CLK4(1 downto 0) <= CLK4_DUMMY(1 downto 0);
   D(7 downto 0) <= D_DUMMY(7 downto 0);
   IO_RD <= IO_RD_DUMMY;
   IO_WR <= IO_WR_DUMMY;
   LED1 <= LED1_DUMMY;
   LED2 <= LED2_DUMMY;
   MEM_RD <= MEM_RD_DUMMY;
   MEM_WR <= MEM_WR_DUMMY;
   AmstradT80 : T80se
      port map (BUSRQ_n=>XLXN_16,
                CLKEN=>XLXN_16,
                CLK_n=>CLK4_DUMMY(1),
                DI(7 downto 0)=>XLXN_283(7 downto 0),
                INT_n=>XLXN_16,
                NMI_n=>XLXN_16,
                RESET_n=>RESET_n,
                WAIT_n=>XLXN_16,
                A(15 downto 0)=>A_DUMMY(15 downto 0),
                BUSAK_n=>open,
                DO(7 downto 0)=>D_DUMMY(7 downto 0),
                HALT_n=>open,
                IORQ_n=>XLXN_75,
                MREQ_n=>XLXN_58,
                M1_n=>open,
                RD_n=>XLXN_86,
                RFSH_n=>open,
                WR_n=>XLXN_38);
   
   XLXI_163 : GND
      port map (G=>CE1);
   
   XLXI_164 : GND
      port map (G=>UB1);
   
   XLXI_165 : GND
      port map (G=>LB1);
   
   XLXI_168 : VCC
      port map (P=>XLXN_16);
   
   XLXI_170 : AND2
      port map (I0=>XLXN_37,
                I1=>XLXN_115,
                O=>MEM_WR_DUMMY);
   
   XLXI_173 : INV
      port map (I=>XLXN_38,
                O=>XLXN_37);
   
   XLXI_179 : simple_GateArray
      port map (A15_A14(1 downto 0)=>A_DUMMY(15 downto 14),
                D(7 downto 0)=>D_DUMMY(7 downto 0),
                IO_REQ_W=>IO_WR_DUMMY,
                lowerROMen=>LED1_DUMMY,
                MODE=>open,
                upperROMen=>LED2_DUMMY);
   
   XLXI_180 : AmstradRAMROM
      port map (A(15 downto 0)=>A_DUMMY(15 downto 0),
                lowerROMen=>LED1_DUMMY,
                upperROMen=>LED2_DUMMY,
                wr_io_z80=>IO_WR_DUMMY,
                wr_z80=>MEM_WR_DUMMY,
                ram_A(17 downto 0)=>vram_A(17 downto 0));
   
   XLXI_181 : INV
      port map (I=>XLXN_58,
                O=>XLXN_115);
   
   XLXI_183 : INV
      port map (I=>XLXN_75,
                O=>XLXN_76);
   
   XLXI_184 : AND2
      port map (I0=>XLXN_76,
                I1=>XLXN_37,
                O=>IO_WR_DUMMY);
   
   XLXI_186 : INV
      port map (I=>XLXN_86,
                O=>XLXN_88);
   
   XLXI_187 : AND2
      port map (I0=>XLXN_88,
                I1=>XLXN_115,
                O=>MEM_RD_DUMMY);
   
   XLXI_199 : INV
      port map (I=>XLXN_128,
                O=>OE1);
   
   XLXI_219 : AND2
      port map (I0=>XLXN_88,
                I1=>XLXN_76,
                O=>IO_RD_DUMMY);
   
   XLXI_221 : CB2CE_MXILINX_amstrad_switch_z80_vga
      port map (C=>XLXN_279,
                CE=>XLXN_117,
                CLR=>XLXN_118,
                CEO=>open,
                Q0=>CLK4_DUMMY(0),
                Q1=>CLK4_DUMMY(1),
                TC=>open);
   
   XLXI_222 : VCC
      port map (P=>XLXN_117);
   
   XLXI_223 : GND
      port map (G=>XLXN_118);
   
   XLXI_224 : RAM_driver
      port map (A(17 downto 0)=>vram_A(17 downto 0),
                CLK4(1 downto 0)=>CLK4_DUMMY(1 downto 0),
                Din(7 downto 0)=>D_DUMMY(7 downto 0),
                rd=>MEM_RD_DUMMY,
                reset=>XLXN_309,
                wr=>MEM_WR_DUMMY,
                ram_A(17 downto 0)=>ram_A(17 downto 0),
                ram_R=>XLXN_128,
                ram_W=>XLXN_127,
                Dout(7 downto 0)=>XLXN_283(7 downto 0),
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
   XLXI_226 : INV
      port map (I=>XLXN_127,
                O=>ram_W);
   
   XLXI_228 : CB2CE_MXILINX_amstrad_switch_z80_vga
      port map (C=>CLK50MHz,
                CE=>XLXN_130,
                CLR=>XLXN_131,
                CEO=>open,
                Q0=>XLXN_142,
                Q1=>XLXN_279,
                TC=>open);
   
   XLXI_229 : GND
      port map (G=>XLXN_131);
   
   XLXI_230 : VCC
      port map (P=>XLXN_130);
   
   XLXI_238 : VRAM_Amstrad_MUSER_amstrad_switch_z80_vga
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>XLXN_153,
                vram_A(13 downto 0)=>A_DUMMY(13 downto 0),
                vram_CLK=>XLXN_155,
                vram_D(7 downto 0)=>D_DUMMY(7 downto 0),
                vram_W=>XLXN_137,
                vga_D(7 downto 0)=>XLXN_340(7 downto 0));
   
   XLXI_239 : AND3
      port map (I0=>A_DUMMY(15),
                I1=>A_DUMMY(14),
                I2=>MEM_WR_DUMMY,
                O=>XLXN_137);
   
   XLXI_240 : aZRaEL_vram2vgaAmstrad
      port map (CLK_25MHz=>XLXN_337,
                DATA(7 downto 0)=>XLXN_345(7 downto 0),
                ADDRESS(15 downto 0)=>vga_A(15 downto 0),
                BLUE=>BLUE,
                GREEN=>GREEN,
                HSYNC=>HSYNC,
                R=>open,
                RED=>RED,
                VSYNC=>VSYNC);
   
   XLXI_242 : INV
      port map (I=>XLXN_142,
                O=>XLXN_153);
   
   XLXI_243 : INV
      port map (I=>CLK4_DUMMY(1),
                O=>XLXN_155);
   
   XLXI_253 : GND
      port map (G=>zero);
   
   XLXI_256 : VCC
      port map (P=>un);
   
   XLXI_257 : INV
      port map (I=>IO_RD_DUMMY,
                O=>XLXN_301);
   
   XLXI_258 : INV
      port map (I=>IO_WR_DUMMY,
                O=>XLXN_180);
   
   XLXI_297 : INV
      port map (I=>CLK4_DUMMY(1),
                O=>XLXN_302);
   
   XLXI_302 : I82C55
      port map (CLK=>XLXN_302,
                ENA=>XLXN_303,
                I_ADDR(1 downto 0)=>A_DUMMY(9 downto 8),
                I_CS_L=>A_DUMMY(11),
                I_DATA(7 downto 0)=>D_DUMMY(7 downto 0),
                I_PA(7)=>un,
                I_PA(6)=>un,
                I_PA(5)=>touche_a_mem,
                I_PA(4)=>un,
                I_PA(3)=>un,
                I_PA(2)=>un,
                I_PA(1)=>un,
                I_PA(0)=>un,
                I_PB(7)=>un,
                I_PB(6)=>un,
                I_PB(5)=>un,
                I_PB(4)=>un,
                I_PB(3)=>un,
                I_PB(2)=>zero,
                I_PB(1)=>un,
                I_PB(0)=>zero,
                I_PC(7)=>zero,
                I_PC(6)=>zero,
                I_PC(5)=>zero,
                I_PC(4)=>zero,
                I_PC(3)=>zero,
                I_PC(2)=>zero,
                I_PC(1)=>zero,
                I_PC(0)=>zero,
                I_RD_L=>XLXN_301,
                I_WR_L=>XLXN_180,
                RESET=>XLXN_309,
                O_PA=>open,
                O_PA_OE_L=>open,
                O_PB=>open,
                O_PB_OE_L=>open,
                O_PC(7 downto 0)=>portC(7 downto 0),
                O_PC_OE_L(7 downto 0)=>n_portC_en(7 downto 0),
                IO_DATA(7 downto 0)=>XLXN_283(7 downto 0));
   
   XLXI_306 : VCC
      port map (P=>XLXN_303);
   
   XLXI_307 : INV
      port map (I=>RESET_n,
                O=>XLXN_309);
   
   XLXI_308 : OR3
      port map (I0=>portC(0),
                I1=>portC(1),
                I2=>portC(2),
                O=>XLXN_319);
   
   XLXI_309 : INV
      port map (I=>XLXN_319,
                O=>XLXN_321);
   
   XLXI_311 : AND2
      port map (I0=>portC(6),
                I1=>XLXN_327,
                O=>XLXN_332);
   
   XLXI_312 : INV
      port map (I=>portC(7),
                O=>XLXN_327);
   
   XLXI_315 : AND4
      port map (I0=>XLXN_332,
                I1=>XLXN_321,
                I2=>portC(3),
                I3=>FIRE1,
                O=>XLXN_333);
   
   XLXI_316 : INV
      port map (I=>XLXN_333,
                O=>touche_a);
   
   XLXI_317 : LD
   generic map( INIT => '1')
      port map (D=>touche_a,
                G=>XLXN_336,
                Q=>touche_a_mem);
   
   XLXI_318 : INV
      port map (I=>n_portC_en(0),
                O=>XLXN_336);
   
   XLXI_320 : INV
      port map (I=>XLXN_153,
                O=>XLXN_337);
   
   XLXI_321 : FD8CE_MXILINX_amstrad_switch_z80_vga
      port map (C=>XLXN_153,
                CE=>XLXN_338,
                CLR=>XLXN_339,
                D(7 downto 0)=>XLXN_340(7 downto 0),
                Q(7 downto 0)=>XLXN_344(7 downto 0));
   
   XLXI_322 : VCC
      port map (P=>XLXN_338);
   
   XLXI_323 : GND
      port map (G=>XLXN_339);
   
   XLXI_324 : FD8CE_MXILINX_amstrad_switch_z80_vga
      port map (C=>XLXN_153,
                CE=>XLXN_343,
                CLR=>XLXN_342,
                D(7 downto 0)=>XLXN_344(7 downto 0),
                Q(7 downto 0)=>XLXN_345(7 downto 0));
   
   XLXI_325 : GND
      port map (G=>XLXN_342);
   
   XLXI_326 : VCC
      port map (P=>XLXN_343);
   
end BEHAVIORAL;

