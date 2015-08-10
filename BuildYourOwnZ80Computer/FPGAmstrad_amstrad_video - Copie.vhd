--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_video.vhf
-- /___/   /\     Timestamp : 02/25/2015 10:26:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_video.vhf -w C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_video.sch
--Design Name: amstrad_video
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD8CE_HXILINX_amstrad_video -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_amstrad_video is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_amstrad_video;

architecture Behavioral of FD8CE_HXILINX_amstrad_video is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity VRAM_Amstrad_NEXYS4_MUSER_amstrad_video is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic; 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic);
end VRAM_Amstrad_NEXYS4_MUSER_amstrad_video;

architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_MUSER_amstrad_video is
   attribute SIM_DEVICE                : string ;
   attribute DOA_REG                   : string ;
   attribute DOB_REG                   : string ;
   attribute INITP_00                  : string ;
   attribute INITP_01                  : string ;
   attribute INITP_02                  : string ;
   attribute INITP_03                  : string ;
   attribute INITP_04                  : string ;
   attribute INITP_05                  : string ;
   attribute INITP_06                  : string ;
   attribute INITP_07                  : string ;
   attribute INIT_00                   : string ;
   attribute INIT_01                   : string ;
   attribute INIT_02                   : string ;
   attribute INIT_03                   : string ;
   attribute INIT_04                   : string ;
   attribute INIT_05                   : string ;
   attribute INIT_06                   : string ;
   attribute INIT_07                   : string ;
   attribute INIT_08                   : string ;
   attribute INIT_09                   : string ;
   attribute INIT_0A                   : string ;
   attribute INIT_0B                   : string ;
   attribute INIT_0C                   : string ;
   attribute INIT_0D                   : string ;
   attribute INIT_0E                   : string ;
   attribute INIT_0F                   : string ;
   attribute INIT_10                   : string ;
   attribute INIT_11                   : string ;
   attribute INIT_12                   : string ;
   attribute INIT_13                   : string ;
   attribute INIT_14                   : string ;
   attribute INIT_15                   : string ;
   attribute INIT_16                   : string ;
   attribute INIT_17                   : string ;
   attribute INIT_18                   : string ;
   attribute INIT_19                   : string ;
   attribute INIT_1A                   : string ;
   attribute INIT_1B                   : string ;
   attribute INIT_1C                   : string ;
   attribute INIT_1D                   : string ;
   attribute INIT_1E                   : string ;
   attribute INIT_1F                   : string ;
   attribute INIT_20                   : string ;
   attribute INIT_21                   : string ;
   attribute INIT_22                   : string ;
   attribute INIT_23                   : string ;
   attribute INIT_24                   : string ;
   attribute INIT_25                   : string ;
   attribute INIT_26                   : string ;
   attribute INIT_27                   : string ;
   attribute INIT_28                   : string ;
   attribute INIT_29                   : string ;
   attribute INIT_2A                   : string ;
   attribute INIT_2B                   : string ;
   attribute INIT_2C                   : string ;
   attribute INIT_2D                   : string ;
   attribute INIT_2E                   : string ;
   attribute INIT_2F                   : string ;
   attribute INIT_30                   : string ;
   attribute INIT_31                   : string ;
   attribute INIT_32                   : string ;
   attribute INIT_33                   : string ;
   attribute INIT_34                   : string ;
   attribute INIT_35                   : string ;
   attribute INIT_36                   : string ;
   attribute INIT_37                   : string ;
   attribute INIT_38                   : string ;
   attribute INIT_39                   : string ;
   attribute INIT_3A                   : string ;
   attribute INIT_3B                   : string ;
   attribute INIT_3C                   : string ;
   attribute INIT_3D                   : string ;
   attribute INIT_3E                   : string ;
   attribute INIT_3F                   : string ;
   attribute INIT_A                    : string ;
   attribute INIT_B                    : string ;
   attribute INIT_FILE                 : string ;
   attribute RAM_MODE                  : string ;
   attribute RDADDR_COLLISION_HWCONFIG : string ;
   attribute READ_WIDTH_A              : string ;
   attribute READ_WIDTH_B              : string ;
   attribute RSTREG_PRIORITY_A         : string ;
   attribute RSTREG_PRIORITY_B         : string ;
   attribute SIM_COLLISION_CHECK       : string ;
   attribute SRVAL_A                   : string ;
   attribute SRVAL_B                   : string ;
   attribute WRITE_MODE_A              : string ;
   attribute WRITE_MODE_B              : string ;
   attribute WRITE_WIDTH_A             : string ;
   attribute WRITE_WIDTH_B             : string ;
   attribute BOX_TYPE                  : string ;
   signal XLXN_1                          : std_logic_vector (15 downto 0);
   signal XLXN_3                          : std_logic_vector (15 downto 0);
   signal XLXN_15                         : std_logic_vector (1 downto 0);
   signal XLXN_16                         : std_logic_vector (3 downto 0);
   signal XLXN_17                         : std_logic;
   signal XLXN_21                         : std_logic;
   signal XLXI_1_DIADI_openSignal         : std_logic_vector (15 downto 0);
   signal XLXI_1_DIPADIP_openSignal       : std_logic_vector (1 downto 0);
   signal XLXI_1_DIPBDIP_openSignal       : std_logic_vector (1 downto 0);
   signal XLXI_1_REGCEAREGCE_openSignal   : std_logic;
   signal XLXI_1_REGCEB_openSignal        : std_logic;
   signal XLXI_1_RSTRAMARSTRAM_openSignal : std_logic;
   signal XLXI_1_RSTRAMB_openSignal       : std_logic;
   signal XLXI_1_RSTREGARSTREG_openSignal : std_logic;
   signal XLXI_1_RSTREGB_openSignal       : std_logic;
   component RAMB18E1
      -- synopsys translate_off
      generic( SIM_DEVICE : string :=  "VIRTEX6";
               DOA_REG : integer :=  0;
               DOB_REG : integer :=  0;
               INITP_00 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_01 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_02 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_03 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_04 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_05 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_06 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_07 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_00 : bit_vector :=  
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
               INIT_A : bit_vector :=  x"00000";
               INIT_B : bit_vector :=  x"00000";
               INIT_FILE : string :=  "NONE";
               RAM_MODE : string :=  "TDP";
               RDADDR_COLLISION_HWCONFIG : string :=  "DELAYED_WRITE";
               READ_WIDTH_A : integer :=  0;
               READ_WIDTH_B : integer :=  0;
               RSTREG_PRIORITY_A : string :=  "RSTREG";
               RSTREG_PRIORITY_B : string :=  "RSTREG";
               SIM_COLLISION_CHECK : string :=  "ALL";
               SRVAL_A : bit_vector :=  x"00000";
               SRVAL_B : bit_vector :=  x"00000";
               WRITE_MODE_A : string :=  "WRITE_FIRST";
               WRITE_MODE_B : string :=  "WRITE_FIRST";
               WRITE_WIDTH_A : integer :=  0;
               WRITE_WIDTH_B : integer :=  0);
      -- synopsys translate_on
      port ( ADDRARDADDR   : in    std_logic_vector (13 downto 0); 
             ADDRBWRADDR   : in    std_logic_vector (13 downto 0); 
             DIADI         : in    std_logic_vector (15 downto 0); 
             DIBDI         : in    std_logic_vector (15 downto 0); 
             DIPADIP       : in    std_logic_vector (1 downto 0); 
             DIPBDIP       : in    std_logic_vector (1 downto 0); 
             WEA           : in    std_logic_vector (1 downto 0); 
             WEBWE         : in    std_logic_vector (3 downto 0); 
             CLKARDCLK     : in    std_logic; 
             CLKBWRCLK     : in    std_logic; 
             ENARDEN       : in    std_logic; 
             ENBWREN       : in    std_logic; 
             REGCEAREGCE   : in    std_logic; 
             REGCEB        : in    std_logic; 
             RSTRAMARSTRAM : in    std_logic; 
             RSTRAMB       : in    std_logic; 
             RSTREGARSTREG : in    std_logic; 
             RSTREGB       : in    std_logic; 
             DOADO         : out   std_logic_vector (15 downto 0); 
             DOBDO         : out   std_logic_vector (15 downto 0); 
             DOPADOP       : out   std_logic_vector (1 downto 0); 
             DOPBDOP       : out   std_logic_vector (1 downto 0));
   end component;
   attribute SIM_DEVICE of RAMB18E1 : component is "VIRTEX6";
   attribute DOA_REG of RAMB18E1 : component is "0";
   attribute DOB_REG of RAMB18E1 : component is "0";
   attribute INITP_00 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_01 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_02 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_03 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_04 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_05 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_06 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_07 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_00 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB18E1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_A of RAMB18E1 : component is "00000";
   attribute INIT_B of RAMB18E1 : component is "00000";
   attribute INIT_FILE of RAMB18E1 : component is "NONE";
   attribute RAM_MODE of RAMB18E1 : component is "TDP";
   attribute RDADDR_COLLISION_HWCONFIG of RAMB18E1 : component is 
         "DELAYED_WRITE";
   attribute READ_WIDTH_A of RAMB18E1 : component is "0";
   attribute READ_WIDTH_B of RAMB18E1 : component is "0";
   attribute RSTREG_PRIORITY_A of RAMB18E1 : component is "RSTREG";
   attribute RSTREG_PRIORITY_B of RAMB18E1 : component is "RSTREG";
   attribute SIM_COLLISION_CHECK of RAMB18E1 : component is "ALL";
   attribute SRVAL_A of RAMB18E1 : component is "00000";
   attribute SRVAL_B of RAMB18E1 : component is "00000";
   attribute WRITE_MODE_A of RAMB18E1 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of RAMB18E1 : component is "WRITE_FIRST";
   attribute WRITE_WIDTH_A of RAMB18E1 : component is "0";
   attribute WRITE_WIDTH_B of RAMB18E1 : component is "0";
   attribute BOX_TYPE of RAMB18E1 : component is "BLACK_BOX";
   
   component SAME2
      port ( Sin  : in    std_logic; 
             Sout : out   std_logic_vector (1 downto 0));
   end component;
   
   component SAME4
      port ( Sin  : in    std_logic; 
             Sout : out   std_logic_vector (3 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component D1_to_D16
      port ( Din  : in    std_logic; 
             Dout : out   std_logic_vector (15 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component D16_to_D1
      port ( Din  : in    std_logic_vector (15 downto 0); 
             Dout : out   std_logic);
   end component;
   
   attribute WRITE_WIDTH_A of XLXI_1 : label is "1";
   attribute READ_WIDTH_B of XLXI_1 : label is "1";
   attribute SIM_DEVICE of XLXI_1 : label is "7SERIES";
   attribute RDADDR_COLLISION_HWCONFIG of XLXI_1 : label is "PERFORMANCE";
   attribute WRITE_WIDTH_B of XLXI_1 : label is "1";
   attribute WRITE_MODE_A of XLXI_1 : label is "READ_FIRST";
   attribute READ_WIDTH_A of XLXI_1 : label is "1";
begin
   XLXI_1 : RAMB18E1
   -- synopsys translate_off
   generic map( RAM_MODE => "TDP",
            WRITE_WIDTH_A => 1,
            READ_WIDTH_B => 1,
            SIM_DEVICE => "7SERIES",
            WRITE_MODE_B => "WRITE_FIRST",
            RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
            WRITE_WIDTH_B => 1,
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_A => 1)
   -- synopsys translate_on
      port map (ADDRARDADDR(13 downto 0)=>vga_A(13 downto 0),
                ADDRBWRADDR(13 downto 0)=>vram_A(13 downto 0),
                CLKARDCLK=>vga_CLK,
                CLKBWRCLK=>vram_CLK,
                DIADI(15 downto 0)=>XLXI_1_DIADI_openSignal(15 downto 0),
                DIBDI(15 downto 0)=>XLXN_1(15 downto 0),
                DIPADIP(1 downto 0)=>XLXI_1_DIPADIP_openSignal(1 downto 0),
                DIPBDIP(1 downto 0)=>XLXI_1_DIPBDIP_openSignal(1 downto 0),
                ENARDEN=>XLXN_21,
                ENBWREN=>XLXN_21,
                REGCEAREGCE=>XLXI_1_REGCEAREGCE_openSignal,
                REGCEB=>XLXI_1_REGCEB_openSignal,
                RSTRAMARSTRAM=>XLXI_1_RSTRAMARSTRAM_openSignal,
                RSTRAMB=>XLXI_1_RSTRAMB_openSignal,
                RSTREGARSTREG=>XLXI_1_RSTREGARSTREG_openSignal,
                RSTREGB=>XLXI_1_RSTREGB_openSignal,
                WEA(1 downto 0)=>XLXN_15(1 downto 0),
                WEBWE(3 downto 0)=>XLXN_16(3 downto 0),
                DOADO(15 downto 0)=>XLXN_3(15 downto 0),
                DOBDO=>open,
                DOPADOP=>open,
                DOPBDOP=>open);
   
   XLXI_7 : SAME2
      port map (Sin=>XLXN_17,
                Sout(1 downto 0)=>XLXN_15(1 downto 0));
   
   XLXI_8 : SAME4
      port map (Sin=>vram_W,
                Sout(3 downto 0)=>XLXN_16(3 downto 0));
   
   XLXI_9 : GND
      port map (G=>XLXN_17);
   
   XLXI_11 : D1_to_D16
      port map (Din=>vram_D,
                Dout(15 downto 0)=>XLXN_1(15 downto 0));
   
   XLXI_13 : VCC
      port map (P=>XLXN_21);
   
   XLXI_14 : D16_to_D1
      port map (Din(15 downto 0)=>XLXN_3(15 downto 0),
                Dout=>vga_D);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video;

architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video is
   component VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port ( vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic; 
             vga_D    : out   std_logic);
   end component;
   
begin
   XLXI_30 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(0),
                vram_W=>vram_W,
                vga_D=>vga_D(0));
   
   XLXI_31 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(1),
                vram_W=>vram_W,
                vga_D=>vga_D(1));
   
   XLXI_32 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(2),
                vram_W=>vram_W,
                vga_D=>vga_D(2));
   
   XLXI_33 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(3),
                vram_W=>vram_W,
                vga_D=>vga_D(3));
   
   XLXI_34 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(4),
                vram_W=>vram_W,
                vga_D=>vga_D(4));
   
   XLXI_35 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(5),
                vram_W=>vram_W,
                vga_D=>vga_D(5));
   
   XLXI_36 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(6),
                vram_W=>vram_W,
                vga_D=>vga_D(6));
   
   XLXI_37 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(7),
                vram_W=>vram_W,
                vga_D=>vga_D(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity VRAM32Ko_Amstrad_MUSER_amstrad_video is
   port ( vga_A    : in    std_logic_vector (14 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (14 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM32Ko_Amstrad_MUSER_amstrad_video;

architecture BEHAVIORAL of VRAM32Ko_Amstrad_MUSER_amstrad_video is
   attribute BOX_TYPE   : string ;
   signal XLXN_19  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_40  : std_logic_vector (7 downto 0);
   signal XLXN_46  : std_logic_vector (7 downto 0);
   component and_then
      port ( A : in    std_logic; 
             B : in    std_logic; 
             C : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component SELECT8
      port ( s1    : in    std_logic; 
             DATA1 : in    std_logic_vector (7 downto 0); 
             DATA2 : in    std_logic_vector (7 downto 0); 
             DATA0 : out   std_logic_vector (7 downto 0));
   end component;
   
   component VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_2 : and_then
      port map (A=>vram_W,
                B=>XLXN_21,
                C=>XLXN_19);
   
   XLXI_3 : INV
      port map (I=>vram_A(14),
                O=>XLXN_21);
   
   XLXI_4 : SELECT8
      port map (DATA1(7 downto 0)=>XLXN_40(7 downto 0),
                DATA2(7 downto 0)=>XLXN_46(7 downto 0),
                s1=>XLXN_23,
                DATA0(7 downto 0)=>vga_D(7 downto 0));
   
   XLXI_5 : INV
      port map (I=>vga_A(14),
                O=>XLXN_23);
   
   XLXI_7 : and_then
      port map (A=>vram_W,
                B=>vram_A(14),
                C=>XLXN_31);
   
   XLXI_8 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>XLXN_19,
                vga_D(7 downto 0)=>XLXN_40(7 downto 0));
   
   XLXI_9 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>XLXN_31,
                vga_D(7 downto 0)=>XLXN_46(7 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity FPGAmstrad_amstrad_video is
   port ( CLK25MHz    : in    std_logic; 
          nCLK25MHz   : in    std_logic; 
          palette_A   : in    std_logic_vector (13 downto 0); 
          palette_CLK : in    std_logic; 
          palette_D   : in    std_logic_vector (7 downto 0); 
          palette_W   : in    std_logic; 
          vram_A      : in    std_logic_vector (14 downto 0); 
          vram_CLK    : in    std_logic; 
          vram_D      : in    std_logic_vector (7 downto 0); 
          vram_W      : in    std_logic; 
          BLUE2       : out   std_logic_vector (1 downto 0); 
          GREEN3      : out   std_logic_vector (2 downto 0); 
          HSYNC       : out   std_logic; 
          RED2        : out   std_logic_vector (1 downto 0); 
          VSYNC       : out   std_logic);
end FPGAmstrad_amstrad_video;

architecture BEHAVIORAL of FPGAmstrad_amstrad_video is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_693    : std_logic_vector (14 downto 0);
   signal XLXN_694    : std_logic_vector (13 downto 0);
   signal XLXN_713    : std_logic_vector (7 downto 0);
   signal XLXN_715    : std_logic_vector (7 downto 0);
   signal XLXN_717    : std_logic;
   signal XLXN_718    : std_logic;
   signal XLXN_719    : std_logic;
   signal XLXN_721    : std_logic;
   signal XLXN_724    : std_logic_vector (7 downto 0);
   signal XLXN_738    : std_logic_vector (7 downto 0);
   signal XLXN_743    : std_logic_vector (7 downto 0);
   signal XLXN_744    : std_logic_vector (7 downto 0);
   component VRAM32Ko_Amstrad_MUSER_amstrad_video
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (14 downto 0); 
             vga_A    : in    std_logic_vector (14 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component aZRaEL_vram2vgaAmstradMiaow
      port ( CLK_25MHz : in    std_logic; 
             DATA      : in    std_logic_vector (7 downto 0); 
             PALETTE_D : in    std_logic_vector (7 downto 0); 
             VSYNC     : out   std_logic; 
             HSYNC     : out   std_logic; 
             ADDRESS   : out   std_logic_vector (14 downto 0); 
             PALETTE_A : out   std_logic_vector (13 downto 0); 
             RED       : out   std_logic_vector (1 downto 0); 
             GREEN     : out   std_logic_vector (2 downto 0); 
             BLUE      : out   std_logic_vector (1 downto 0));
   end component;
   
   component VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component FD8CE_HXILINX_amstrad_video
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_482 : label is "XLXI_482_1";
   attribute HU_SET of XLXI_483 : label is "XLXI_483_2";
   attribute HU_SET of XLXI_488 : label is "XLXI_488_3";
   attribute HU_SET of XLXI_492 : label is "XLXI_492_4";
begin
   XLXI_474 : VRAM32Ko_Amstrad_MUSER_amstrad_video
      port map (vga_A(14 downto 0)=>XLXN_693(14 downto 0),
                vga_CLK=>nCLK25MHz,
                vram_A(14 downto 0)=>vram_A(14 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>vram_W,
                vga_D(7 downto 0)=>XLXN_713(7 downto 0));
   
   XLXI_476 : aZRaEL_vram2vgaAmstradMiaow
      port map (CLK_25MHz=>CLK25MHz,
                DATA(7 downto 0)=>XLXN_743(7 downto 0),
                PALETTE_D(7 downto 0)=>XLXN_744(7 downto 0),
                ADDRESS(14 downto 0)=>XLXN_693(14 downto 0),
                BLUE(1 downto 0)=>BLUE2(1 downto 0),
                GREEN(2 downto 0)=>GREEN3(2 downto 0),
                HSYNC=>HSYNC,
                PALETTE_A(13 downto 0)=>XLXN_694(13 downto 0),
                RED(1 downto 0)=>RED2(1 downto 0),
                VSYNC=>VSYNC);
   
   XLXI_478 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video
      port map (vga_A(13 downto 0)=>XLXN_694(13 downto 0),
                vga_CLK=>nCLK25MHz,
                vram_A(13 downto 0)=>palette_A(13 downto 0),
                vram_CLK=>palette_CLK,
                vram_D(7 downto 0)=>palette_D(7 downto 0),
                vram_W=>palette_W,
                vga_D(7 downto 0)=>XLXN_715(7 downto 0));
   
   XLXI_482 : FD8CE_HXILINX_amstrad_video
      port map (C=>CLK25MHz,
                CE=>XLXN_717,
                CLR=>XLXN_718,
                D(7 downto 0)=>XLXN_713(7 downto 0),
                Q(7 downto 0)=>XLXN_738(7 downto 0));
   
   XLXI_483 : FD8CE_HXILINX_amstrad_video
      port map (C=>CLK25MHz,
                CE=>XLXN_719,
                CLR=>XLXN_721,
                D(7 downto 0)=>XLXN_715(7 downto 0),
                Q(7 downto 0)=>XLXN_724(7 downto 0));
   
   XLXI_484 : GND
      port map (G=>XLXN_718);
   
   XLXI_485 : GND
      port map (G=>XLXN_721);
   
   XLXI_486 : VCC
      port map (P=>XLXN_717);
   
   XLXI_487 : VCC
      port map (P=>XLXN_719);
   
   XLXI_488 : FD8CE_HXILINX_amstrad_video
      port map (C=>nCLK25MHz,
                CE=>XLXN_719,
                CLR=>XLXN_721,
                D(7 downto 0)=>XLXN_724(7 downto 0),
                Q(7 downto 0)=>XLXN_744(7 downto 0));
   
   XLXI_492 : FD8CE_HXILINX_amstrad_video
      port map (C=>nCLK25MHz,
                CE=>XLXN_717,
                CLR=>XLXN_718,
                D(7 downto 0)=>XLXN_738(7 downto 0),
                Q(7 downto 0)=>XLXN_743(7 downto 0));
   
end BEHAVIORAL;


