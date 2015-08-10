--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_motherboard.vhf
-- /___/   /\     Timestamp : 02/22/2015 11:20:30
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl amstrad_motherboard.vhf -w C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_motherboard.sch
--Design Name: amstrad_motherboard
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL CB4CE_HXILINX_amstrad_motherboard -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CE_HXILINX_amstrad_motherboard is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    Q2   : out STD_LOGIC;
    Q3   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB4CE_HXILINX_amstrad_motherboard;

architecture Behavioral of CB4CE_HXILINX_amstrad_motherboard is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q3 <= COUNT(3);
Q2 <= COUNT(2);
Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic; 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic);
end VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard is
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

entity VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard is
   component VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port ( vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic; 
             vga_D    : out   std_logic);
   end component;
   
begin
   XLXI_30 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(0),
                vram_W=>vram_W,
                vga_D=>vga_D(0));
   
   XLXI_31 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(1),
                vram_W=>vram_W,
                vga_D=>vga_D(1));
   
   XLXI_32 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(2),
                vram_W=>vram_W,
                vga_D=>vga_D(2));
   
   XLXI_33 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(3),
                vram_W=>vram_W,
                vga_D=>vga_D(3));
   
   XLXI_34 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(4),
                vram_W=>vram_W,
                vga_D=>vga_D(4));
   
   XLXI_35 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(5),
                vram_W=>vram_W,
                vga_D=>vga_D(5));
   
   XLXI_36 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(6),
                vram_W=>vram_W,
                vga_D=>vga_D(6));
   
   XLXI_37 : VRAM_Amstrad_NEXYS4_MUSER_amstrad_motherboard
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

entity VRAM32Ko_Amstrad_MUSER_amstrad_motherboard is
   port ( vga_A    : in    std_logic_vector (14 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (14 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM32Ko_Amstrad_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of VRAM32Ko_Amstrad_MUSER_amstrad_motherboard is
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
   
   component VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
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
   
   XLXI_8 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>XLXN_19,
                vga_D(7 downto 0)=>XLXN_40(7 downto 0));
   
   XLXI_9 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
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

entity joykeyb_MUSER_amstrad_motherboard is
   port ( CLK4MHz   : in    std_logic; 
          joystick1 : in    std_logic_vector (5 downto 0); 
          joystick2 : in    std_logic_vector (5 downto 0); 
          PPI_portC : in    std_logic_vector (3 downto 0); 
          PS2_CLK   : in    std_logic; 
          PS2_DATA  : in    std_logic; 
          key_reset : out   std_logic; 
          PPI_portA : out   std_logic_vector (7 downto 0));
end joykeyb_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of joykeyb_MUSER_amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   signal PPI_enable : std_logic;
   signal XLXN_27    : std_logic_vector (9 downto 0);
   signal XLXN_29    : std_logic_vector (7 downto 0);
   signal XLXN_30    : std_logic;
   signal XLXN_31    : std_logic;
   signal XLXN_56    : std_logic;
   signal XLXN_57    : std_logic;
   component KEYBOARD_driver
      port ( CLK       : in    std_logic; 
             enable    : in    std_logic; 
             press     : in    std_logic; 
             unpress   : in    std_logic; 
             portC     : in    std_logic_vector (3 downto 0); 
             joystick1 : in    std_logic_vector (5 downto 0); 
             joystick2 : in    std_logic_vector (5 downto 0); 
             keycode   : in    std_logic_vector (9 downto 0); 
             portA     : out   std_logic_vector (7 downto 0);
             key_reset : out   std_logic);
   end component;
   
   component KEYBOARD_controller
      port ( CLK         : in    std_logic; 
             fok         : in    std_logic; 
             scancode_in : in    std_logic_vector (7 downto 0); 
             press       : out   std_logic; 
             unpress     : out   std_logic; 
             keycode     : out   std_logic_vector (9 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component Keyboard
      port ( datain   : in    std_logic; 
             clkin    : in    std_logic; 
             fclk     : in    std_logic; 
             rst      : in    std_logic; 
             fok      : out   std_logic; 
             scancode : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_2 : KEYBOARD_driver
      port map (CLK=>CLK4MHz,
                enable=>PPI_enable,
                joystick1(5 downto 0)=>joystick1(5 downto 0),
                joystick2(5 downto 0)=>joystick2(5 downto 0),
                keycode(9 downto 0)=>XLXN_27(9 downto 0),
                portC(3 downto 0)=>PPI_portC(3 downto 0),
                press=>XLXN_30,
                unpress=>XLXN_31,
                key_reset=>key_reset,
                portA(7 downto 0)=>PPI_portA(7 downto 0));
   
   XLXI_3 : KEYBOARD_controller
      port map (CLK=>CLK4MHz,
                fok=>XLXN_57,
                scancode_in(7 downto 0)=>XLXN_29(7 downto 0),
                keycode(9 downto 0)=>XLXN_27(9 downto 0),
                press=>XLXN_30,
                unpress=>XLXN_31);
   
   XLXI_4 : VCC
      port map (P=>PPI_enable);
   
   XLXI_489 : Keyboard
      port map (clkin=>PS2_CLK,
                datain=>PS2_DATA,
                fclk=>CLK4MHz,
                rst=>XLXN_56,
                fok=>XLXN_57,
                scancode(7 downto 0)=>XLXN_29(7 downto 0));
   
   XLXI_490 : GND
      port map (G=>XLXN_56);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity FPGAmstrad_amstrad_motherboard is
   port ( CLK4MHz    : in    std_logic; 
          FDD_input  : in    std_logic_vector (5 downto 0); 
          init_A     : in    std_logic_vector (22 downto 0); 
          init_R_n   : in    std_logic; 
          init_W_n   : in    std_logic; 
          is_ucpm    : in    std_logic; 
          JOYSTICK1  : in    std_logic_vector (5 downto 0); 
          JOYSTICK2  : in    std_logic_vector (5 downto 0); 
          nCLK4MHz   : in    std_logic; 
          PS2_CLK    : in    std_logic; 
          PS2_DATA   : in    std_logic; 
          RESET_n    : in    std_logic; 
          audio      : out   std_logic; 
          change     : out   std_logic; 
          DSK_select : out   std_logic_vector (7 downto 0); 
          FDD_output : out   std_logic_vector (6 downto 0); 
          key_reset  : out   std_logic; 
          OE1_n      : out   std_logic; 
          palette_A  : out   std_logic_vector (13 downto 0); 
          palette_D  : out   std_logic_vector (7 downto 0); 
          palette_W  : out   std_logic; 
          RAMBank    : out   std_logic_vector (2 downto 0); 
          ram_A      : out   std_logic_vector (22 downto 0); 
          ram_W_n    : out   std_logic; 
          ROMbank    : out   std_logic_vector (3 downto 0); 
          ROMen      : out   std_logic; 
          vram_A     : out   std_logic_vector (14 downto 0); 
          vram_D     : out   std_logic_vector (7 downto 0); 
          vram_W     : out   std_logic; 
          ram_D      : inout std_logic_vector (7 downto 0));
end FPGAmstrad_amstrad_motherboard;

architecture BEHAVIORAL of FPGAmstrad_amstrad_motherboard is
   attribute KEEP_HIERARCHY : string ;
   attribute BOX_TYPE       : string ;
   attribute HU_SET         : string ;
   signal A             : std_logic_vector (15 downto 0);
   signal D             : std_logic_vector (7 downto 0);
   signal IO_RD         : std_logic;
   signal IO_REQ        : std_logic;
   signal IO_WR         : std_logic;
   signal LED1          : std_logic;
   signal LED2          : std_logic;
   signal MEM_RD        : std_logic;
   signal MEM_WR        : std_logic;
   signal n_crtc_vsync  : std_logic;
   signal portC         : std_logic_vector (7 downto 0);
   signal un            : std_logic;
   signal XLXN_16       : std_logic;
   signal XLXN_38       : std_logic;
   signal XLXN_58       : std_logic;
   signal XLXN_75       : std_logic;
   signal XLXN_86       : std_logic;
   signal XLXN_180      : std_logic;
   signal XLXN_283      : std_logic_vector (7 downto 0);
   signal XLXN_303      : std_logic;
   signal XLXN_427      : std_logic_vector (19 downto 0);
   signal XLXN_462      : std_logic_vector (7 downto 0);
   signal XLXN_464      : std_logic;
   signal XLXN_470      : std_logic;
   signal XLXN_473      : std_logic;
   signal XLXN_474      : std_logic;
   signal XLXN_475      : std_logic;
   signal XLXN_486      : std_logic_vector (7 downto 0);
   signal XLXN_498      : std_logic;
   signal XLXN_499      : std_logic;
   signal XLXN_518      : std_logic_vector (7 downto 0);
   signal XLXN_519      : std_logic_vector (7 downto 0);
   signal XLXN_551      : std_logic;
   signal XLXN_556      : std_logic;
   signal XLXN_785      : std_logic;
   signal XLXN_786      : std_logic;
   signal XLXN_787      : std_logic;
   signal XLXN_802      : std_logic;
   signal XLXN_806      : std_logic;
   signal XLXN_807      : std_logic;
   signal XLXN_814      : std_logic;
   signal XLXN_824      : std_logic;
   signal XLXN_826      : std_logic;
   signal XLXN_830      : std_logic;
   signal XLXN_835      : std_logic;
   signal XLXN_845      : std_logic;
   signal XLXN_857      : std_logic_vector (1 downto 0);
   signal XLXN_865      : std_logic;
   signal XLXN_868      : std_logic_vector (14 downto 0);
   signal XLXN_869      : std_logic_vector (7 downto 0);
   signal XLXN_872      : std_logic;
   signal XLXN_874      : std_logic_vector (14 downto 0);
   signal XLXN_879      : std_logic;
   signal XLXN_884      : std_logic;
   signal XLXN_904      : std_logic;
   signal XLXN_907      : std_logic;
   signal XLXN_908      : std_logic;
   signal XLXN_909      : std_logic;
   signal XLXN_914      : std_logic;
   signal XLXN_915      : std_logic;
   signal XLXN_916      : std_logic;
   signal XLXN_918      : std_logic;
   signal XLXN_940      : std_logic;
   signal xram_A        : std_logic_vector (17 downto 0);
   signal zero          : std_logic;
   signal ROMbank_DUMMY : std_logic_vector (3 downto 0);
   signal RAMBank_DUMMY : std_logic_vector (2 downto 0);
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
   
   component simple_GateArray
      port ( CLK        : in    std_logic; 
             reset      : in    std_logic; 
             IO_REQ_W   : in    std_logic; 
             A15_A14    : in    std_logic_vector (1 downto 0); 
             D          : in    std_logic_vector (7 downto 0); 
             lowerROMen : out   std_logic; 
             upperROMen : out   std_logic; 
             MODE       : out   std_logic_vector (1 downto 0); 
             RAMbank    : out   std_logic_vector (2 downto 0));
   end component;
   
   component simple_GateArrayInterrupt
      port ( IO_REQ_W      : in    std_logic; 
             IO_REQ_R      : in    std_logic; 
             IO_ACK        : in    std_logic; 
             M1_n          : in    std_logic; 
             MEM_WR        : in    std_logic; 
             reset         : in    std_logic; 
             A15_A14_A9_A8 : in    std_logic_vector (3 downto 0); 
             MODE_select   : in    std_logic_vector (1 downto 0); 
             D             : in    std_logic_vector (7 downto 0); 
             crtc_D        : in    std_logic_vector (7 downto 0); 
             Dout          : inout std_logic_vector (7 downto 0); 
             crtc_VSYNC    : out   std_logic; 
             bvram_W       : out   std_logic; 
             crtc_R        : out   std_logic; 
             int           : out   std_logic; 
             WAIT_MEM_n    : out   std_logic; 
             WAIT_n        : out   std_logic; 
             palette_W     : out   std_logic; 
             crtc_A        : out   std_logic_vector (14 downto 0); 
             bvram_A       : out   std_logic_vector (14 downto 0); 
             bvram_D       : out   std_logic_vector (7 downto 0); 
             palette_A     : out   std_logic_vector (13 downto 0); 
             palette_D     : out   std_logic_vector (7 downto 0); 
             nCLK4_1       : in    std_logic);
   end component;
   
   component ROMselect
      port ( CLK     : in    std_logic; 
             reset   : in    std_logic; 
             A13     : in    std_logic; 
             IO_WR   : in    std_logic; 
             D       : in    std_logic_vector (7 downto 0); 
             ROMbank : out   std_logic_vector (3 downto 0));
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
   
   component AmstradRAMROM
      port ( wr_z80     : in    std_logic; 
             wr_io_z80  : in    std_logic; 
             lowerROMen : in    std_logic; 
             upperROMen : in    std_logic; 
             A          : in    std_logic_vector (15 downto 0); 
             RAMbank    : in    std_logic_vector (2 downto 0); 
             ROMbank    : in    std_logic_vector (3 downto 0); 
             ram_A      : out   std_logic_vector (17 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component RAM_driver
      port ( rd       : in    std_logic; 
             wr       : in    std_logic; 
             reset    : in    std_logic; 
             Din      : in    std_logic_vector (7 downto 0); 
             Dout     : inout std_logic_vector (7 downto 0); 
             ram_D    : inout std_logic_vector (7 downto 0); 
             ram_W    : out   std_logic; 
             ram_R    : out   std_logic; 
             dsk_WR   : in    std_logic; 
             dsk_RD   : in    std_logic; 
             transmit : in    std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component simple_DSK
      port ( nCLK4_1        : in    std_logic; 
             reset          : in    std_logic; 
             A0             : in    std_logic; 
             IO_RD          : in    std_logic; 
             IO_WR          : in    std_logic; 
             cafe           : in    std_logic; 
             cafePifHercule : in    std_logic; 
             is_ucpm        : in    std_logic; 
             A10_A8_A7      : in    std_logic_vector (2 downto 0); 
             D_command      : in    std_logic_vector (7 downto 0); 
             FDD_input      : in    std_logic_vector (5 downto 0); 
             D_result       : inout std_logic_vector (7 downto 0); 
             change         : out   std_logic; 
             dsk_W          : out   std_logic; 
             dsk_R          : out   std_logic; 
             transmit       : out   std_logic; 
             DSK_select     : out   std_logic_vector (7 downto 0); 
             dsk_A          : out   std_logic_vector (19 downto 0); 
             FDD_output     : out   std_logic_vector (6 downto 0));
   end component;
   
   component AmstradRAMDSK
      port ( transmit       : in    std_logic; 
             init_done      : in    std_logic; 
             A              : in    std_logic_vector (17 downto 0); 
             dsk_A          : in    std_logic_vector (19 downto 0); 
             init_A         : in    std_logic_vector (22 downto 0); 
             vram_A_isValid : out   std_logic; 
             ram_A          : out   std_logic_vector (22 downto 0); 
             vram_A         : out   std_logic_vector (14 downto 0));
   end component;
   
   component YM2149
      port ( I_A9_L    : in    std_logic; 
             I_A8      : in    std_logic; 
             I_BDIR    : in    std_logic; 
             I_BC2     : in    std_logic; 
             I_BC1     : in    std_logic; 
             I_SEL_L   : in    std_logic; 
             ENA       : in    std_logic; 
             RESET_L   : in    std_logic; 
             CLK       : in    std_logic; 
             I_DA      : in    std_logic_vector (7 downto 0); 
             I_IOA     : in    std_logic_vector (7 downto 0); 
             O_DA_OE_L : out   std_logic; 
             O_DA      : out   std_logic_vector (7 downto 0); 
             O_AUDIO   : out   std_logic_vector (7 downto 0));
   end component;
   
   component PWM
      port ( clk     : in    std_logic; 
             PWM_in  : in    std_logic_vector (7 downto 0); 
             PWM_out : out   std_logic; 
             clk_ref : in    std_logic);
   end component;
   
   component CB4CE_HXILINX_amstrad_motherboard
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component joykeyb_MUSER_amstrad_motherboard
      port ( CLK4MHz   : in    std_logic; 
             PPI_portC : in    std_logic_vector (3 downto 0); 
             joystick1 : in    std_logic_vector (5 downto 0); 
             joystick2 : in    std_logic_vector (5 downto 0); 
             PS2_DATA  : in    std_logic; 
             PS2_CLK   : in    std_logic; 
             PPI_portA : out   std_logic_vector (7 downto 0); 
             key_reset : out   std_logic);
   end component;
   
   component please_wait
      port ( CLK_n      : in    std_logic; 
             WAIT_n     : in    std_logic; 
             CLK_WAIT_n : out   std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component VRAM32Ko_Amstrad_MUSER_amstrad_motherboard
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (14 downto 0); 
             vga_A    : in    std_logic_vector (14 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   component detect_CAFE
      port ( A              : in    std_logic_vector (15 downto 0); 
             cafe           : out   std_logic; 
             cafePifHercule : out   std_logic);
   end component;
   
   attribute KEEP_HIERARCHY of GA : label is "TRUE";
   attribute KEEP_HIERARCHY of GA_interrupt : label is "TRUE";
   attribute KEEP_HIERARCHY of MyROMSelect : label is "TRUE";
   attribute HU_SET of XLXI_399 : label is "XLXI_399_0";
begin
   RAMBank(2 downto 0) <= RAMBank_DUMMY(2 downto 0);
   ROMbank(3 downto 0) <= ROMbank_DUMMY(3 downto 0);
   AmstradT80 : T80se
      port map (BUSRQ_n=>XLXN_16,
                CLKEN=>XLXN_16,
                CLK_n=>XLXN_802,
                DI(7 downto 0)=>XLXN_283(7 downto 0),
                INT_n=>XLXN_814,
                NMI_n=>XLXN_16,
                RESET_n=>RESET_n,
                WAIT_n=>XLXN_16,
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>open,
                DO(7 downto 0)=>D(7 downto 0),
                HALT_n=>open,
                IORQ_n=>XLXN_75,
                MREQ_n=>XLXN_58,
                M1_n=>XLXN_845,
                RD_n=>XLXN_86,
                RFSH_n=>open,
                WR_n=>XLXN_38);
   
   GA : simple_GateArray
      port map (A15_A14(1 downto 0)=>A(15 downto 14),
                CLK=>nCLK4MHz,
                D(7 downto 0)=>D(7 downto 0),
                IO_REQ_W=>IO_WR,
                reset=>XLXN_907,
                lowerROMen=>LED1,
                MODE(1 downto 0)=>XLXN_857(1 downto 0),
                RAMbank(2 downto 0)=>RAMBank_DUMMY(2 downto 0),
                upperROMen=>LED2);
   
   GA_interrupt : simple_GateArrayInterrupt
      port map (A15_A14_A9_A8(3)=>A(15),
                A15_A14_A9_A8(2)=>A(14),
                A15_A14_A9_A8(1)=>A(9),
                A15_A14_A9_A8(0)=>A(8),
                crtc_D(7 downto 0)=>XLXN_869(7 downto 0),
                D(7 downto 0)=>D(7 downto 0),
                IO_ACK=>XLXN_826,
                IO_REQ_R=>IO_RD,
                IO_REQ_W=>IO_WR,
                MEM_WR=>MEM_WR,
                MODE_select(1 downto 0)=>XLXN_857(1 downto 0),
                M1_n=>XLXN_845,
                nCLK4_1=>nCLK4MHz,
                reset=>XLXN_907,
                bvram_A(14 downto 0)=>vram_A(14 downto 0),
                bvram_D(7 downto 0)=>vram_D(7 downto 0),
                bvram_W=>vram_W,
                crtc_A(14 downto 0)=>XLXN_868(14 downto 0),
                crtc_R=>open,
                crtc_VSYNC=>n_crtc_vsync,
                int=>XLXN_835,
                palette_A(13 downto 0)=>palette_A(13 downto 0),
                palette_D(7 downto 0)=>palette_D(7 downto 0),
                palette_W=>palette_W,
                WAIT_MEM_n=>XLXN_807,
                WAIT_n=>XLXN_806,
                Dout(7 downto 0)=>XLXN_283(7 downto 0));
   
   MyROMSelect : ROMselect
      port map (A13=>A(13),
                CLK=>nCLK4MHz,
                D(7 downto 0)=>D(7 downto 0),
                IO_WR=>IO_WR,
                reset=>XLXN_907,
                ROMbank(3 downto 0)=>ROMbank_DUMMY(3 downto 0));
   
   PPI : I82C55
      port map (CLK=>nCLK4MHz,
                ENA=>XLXN_303,
                I_ADDR(1 downto 0)=>A(9 downto 8),
                I_CS_L=>A(11),
                I_DATA(7 downto 0)=>D(7 downto 0),
                I_PA(7 downto 0)=>XLXN_519(7 downto 0),
                I_PB(7)=>zero,
                I_PB(6)=>zero,
                I_PB(5)=>zero,
                I_PB(4)=>un,
                I_PB(3)=>un,
                I_PB(2)=>un,
                I_PB(1)=>zero,
                I_PB(0)=>n_crtc_vsync,
                I_PC(7)=>zero,
                I_PC(6)=>zero,
                I_PC(5)=>zero,
                I_PC(4)=>zero,
                I_PC(3)=>zero,
                I_PC(2)=>zero,
                I_PC(1)=>zero,
                I_PC(0)=>zero,
                I_RD_L=>XLXN_180,
                I_WR_L=>XLXN_904,
                RESET=>XLXN_907,
                O_PA(7 downto 0)=>XLXN_462(7 downto 0),
                O_PA_OE_L=>open,
                O_PB=>open,
                O_PB_OE_L=>open,
                O_PC(7 downto 0)=>portC(7 downto 0),
                O_PC_OE_L=>open,
                IO_DATA(7 downto 0)=>XLXN_283(7 downto 0));
   
   XLXI_168 : VCC
      port map (P=>XLXN_16);
   
   XLXI_170 : AND2
      port map (I0=>XLXN_785,
                I1=>XLXN_786,
                O=>MEM_WR);
   
   XLXI_173 : AmstradRAMROM
      port map (A(15 downto 0)=>A(15 downto 0),
                lowerROMen=>LED1,
                RAMbank(2 downto 0)=>RAMBank_DUMMY(2 downto 0),
                ROMbank(3 downto 0)=>ROMbank_DUMMY(3 downto 0),
                upperROMen=>LED2,
                wr_io_z80=>IO_WR,
                wr_z80=>MEM_WR,
                ram_A(17 downto 0)=>xram_A(17 downto 0));
   
   XLXI_181 : INV
      port map (I=>XLXN_58,
                O=>XLXN_786);
   
   XLXI_183 : INV
      port map (I=>XLXN_75,
                O=>IO_REQ);
   
   XLXI_184 : AND2
      port map (I0=>IO_REQ,
                I1=>XLXN_785,
                O=>IO_WR);
   
   XLXI_186 : INV
      port map (I=>XLXN_86,
                O=>XLXN_787);
   
   XLXI_187 : AND2
      port map (I0=>XLXN_787,
                I1=>XLXN_786,
                O=>MEM_RD);
   
   XLXI_199 : INV
      port map (I=>XLXN_909,
                O=>XLXN_865);
   
   XLXI_219 : AND2
      port map (I0=>XLXN_787,
                I1=>IO_REQ,
                O=>IO_RD);
   
   XLXI_224 : RAM_driver
      port map (Din(7 downto 0)=>D(7 downto 0),
                dsk_RD=>XLXN_915,
                dsk_WR=>XLXN_914,
                rd=>MEM_RD,
                reset=>XLXN_907,
                transmit=>XLXN_908,
                wr=>MEM_WR,
                ram_R=>XLXN_909,
                ram_W=>XLXN_879,
                Dout(7 downto 0)=>XLXN_283(7 downto 0),
                ram_D(7 downto 0)=>ram_D(7 downto 0));
   
   XLXI_226 : INV
      port map (I=>XLXN_879,
                O=>XLXN_556);
   
   XLXI_253 : GND
      port map (G=>zero);
   
   XLXI_256 : VCC
      port map (P=>un);
   
   XLXI_257 : INV
      port map (I=>IO_RD,
                O=>XLXN_180);
   
   XLXI_258 : INV
      port map (I=>IO_WR,
                O=>XLXN_904);
   
   XLXI_306 : VCC
      port map (P=>XLXN_303);
   
   XLXI_307 : INV
      port map (I=>RESET_n,
                O=>XLXN_907);
   
   XLXI_332 : INV
      port map (I=>XLXN_835,
                O=>XLXN_814);
   
   XLXI_344 : simple_DSK
      port map (A0=>A(0),
                A10_A8_A7(2)=>A(10),
                A10_A8_A7(1)=>A(8),
                A10_A8_A7(0)=>A(7),
                cafe=>XLXN_916,
                cafePifHercule=>XLXN_918,
                D_command(7 downto 0)=>D(7 downto 0),
                FDD_input(5 downto 0)=>FDD_input(5 downto 0),
                IO_RD=>IO_RD,
                IO_WR=>IO_WR,
                is_ucpm=>is_ucpm,
                nCLK4_1=>nCLK4MHz,
                reset=>XLXN_907,
                change=>change,
                dsk_A(19 downto 0)=>XLXN_427(19 downto 0),
                dsk_R=>XLXN_915,
                DSK_select(7 downto 0)=>DSK_select(7 downto 0),
                dsk_W=>XLXN_914,
                FDD_output(6 downto 0)=>FDD_output(6 downto 0),
                transmit=>XLXN_908,
                D_result(7 downto 0)=>XLXN_283(7 downto 0));
   
   XLXI_348 : AmstradRAMDSK
      port map (A(17 downto 0)=>xram_A(17 downto 0),
                dsk_A(19 downto 0)=>XLXN_427(19 downto 0),
                init_A(22 downto 0)=>init_A(22 downto 0),
                init_done=>RESET_n,
                transmit=>XLXN_908,
                ram_A(22 downto 0)=>ram_A(22 downto 0),
                vram_A(14 downto 0)=>XLXN_874(14 downto 0),
                vram_A_isValid=>XLXN_872);
   
   XLXI_349 : YM2149
      port map (CLK=>XLXN_940,
                ENA=>XLXN_473,
                I_A8=>XLXN_464,
                I_A9_L=>XLXN_475,
                I_BC1=>portC(6),
                I_BC2=>XLXN_470,
                I_BDIR=>portC(7),
                I_DA(7 downto 0)=>XLXN_462(7 downto 0),
                I_IOA(7 downto 0)=>XLXN_518(7 downto 0),
                I_SEL_L=>XLXN_474,
                RESET_L=>RESET_n,
                O_AUDIO(7 downto 0)=>XLXN_486(7 downto 0),
                O_DA(7 downto 0)=>XLXN_519(7 downto 0),
                O_DA_OE_L=>open);
   
   XLXI_350 : VCC
      port map (P=>XLXN_464);
   
   XLXI_351 : VCC
      port map (P=>XLXN_470);
   
   XLXI_355 : GND
      port map (G=>XLXN_475);
   
   XLXI_367 : PWM
      port map (clk=>nCLK4MHz,
                clk_ref=>XLXN_940,
                PWM_in(7 downto 0)=>XLXN_486(7 downto 0),
                PWM_out=>audio);
   
   XLXI_377 : VCC
      port map (P=>XLXN_473);
   
   XLXI_383 : VCC
      port map (P=>XLXN_498);
   
   XLXI_384 : GND
      port map (G=>XLXN_499);
   
   XLXI_385 : VCC
      port map (P=>XLXN_474);
   
   XLXI_399 : CB4CE_HXILINX_amstrad_motherboard
      port map (C=>nCLK4MHz,
                CE=>XLXN_498,
                CLR=>XLXN_499,
                CEO=>open,
                Q0=>open,
                Q1=>XLXN_940,
                Q2=>open,
                Q3=>open,
                TC=>open);
   
   XLXI_475 : AND2
      port map (I0=>XLXN_824,
                I1=>IO_REQ,
                O=>XLXN_826);
   
   XLXI_476 : INV
      port map (I=>XLXN_845,
                O=>XLXN_824);
   
   XLXI_494 : joykeyb_MUSER_amstrad_motherboard
      port map (CLK4MHz=>nCLK4MHz,
                joystick1(5 downto 0)=>JOYSTICK1(5 downto 0),
                joystick2(5 downto 0)=>JOYSTICK2(5 downto 0),
                PPI_portC(3 downto 0)=>portC(3 downto 0),
                PS2_CLK=>PS2_CLK,
                PS2_DATA=>PS2_DATA,
                key_reset=>key_reset,
                PPI_portA(7 downto 0)=>XLXN_518(7 downto 0));
   
   XLXI_549 : INV
      port map (I=>XLXN_38,
                O=>XLXN_785);
   
   XLXI_568 : please_wait
      port map (CLK_n=>CLK4MHz,
                WAIT_n=>XLXN_830,
                CLK_WAIT_n=>XLXN_802);
   
   XLXI_570 : AND2
      port map (I0=>XLXN_807,
                I1=>XLXN_806,
                O=>XLXN_830);
   
   XLXI_583 : OR2
      port map (I0=>LED2,
                I1=>LED1,
                O=>ROMen);
   
   XLXI_584 : AND2
      port map (I0=>init_R_n,
                I1=>XLXN_865,
                O=>OE1_n);
   
   XLXI_589 : VRAM32Ko_Amstrad_MUSER_amstrad_motherboard
      port map (vga_A(14 downto 0)=>XLXN_868(14 downto 0),
                vga_CLK=>CLK4MHz,
                vram_A(14 downto 0)=>XLXN_874(14 downto 0),
                vram_CLK=>nCLK4MHz,
                vram_D(7 downto 0)=>ram_D(7 downto 0),
                vram_W=>XLXN_884,
                vga_D(7 downto 0)=>XLXN_869(7 downto 0));
   
   XLXI_590 : AND2
      port map (I0=>XLXN_879,
                I1=>XLXN_872,
                O=>XLXN_884);
   
   XLXI_591 : AND2
      port map (I0=>XLXN_556,
                I1=>init_W_n,
                O=>ram_W_n);
   
   XLXI_592 : detect_CAFE
      port map (A(15 downto 0)=>A(15 downto 0),
                cafe=>XLXN_916,
                cafePifHercule=>XLXN_918);
   
end BEHAVIORAL;


