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
   component VRAM_Amstrad_MiST
      port ( vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic; 
             vga_D    : out   std_logic);
   end component;
   
begin
   XLXI_30 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(0),
                vram_W=>vram_W,
                vga_D=>vga_D(0));
   
   XLXI_31 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(1),
                vram_W=>vram_W,
                vga_D=>vga_D(1));
   
   XLXI_32 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(2),
                vram_W=>vram_W,
                vga_D=>vga_D(2));
   
   XLXI_33 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(3),
                vram_W=>vram_W,
                vga_D=>vga_D(3));
   
   XLXI_34 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(4),
                vram_W=>vram_W,
                vga_D=>vga_D(4));
   
   XLXI_35 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(5),
                vram_W=>vram_W,
                vga_D=>vga_D(5));
   
   XLXI_36 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(6),
                vram_W=>vram_W,
                vga_D=>vga_D(6));
   
   XLXI_37 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(7),
                vram_W=>vram_W,
                vga_D=>vga_D(7));
   
end BEHAVIORAL;



--library ieee;
--use ieee.std_logic_1164.ALL;
--use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;
-- light weight memory entre 11000 et 14000 = 8000+4000
--entity VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video_LOWER_MiST is
--   port ( vga_A    : in    std_logic_vector (13 downto 0); 
--          vga_CLK  : in    std_logic; 
--          vram_A   : in    std_logic_vector (13 downto 0); 
--          vram_CLK : in    std_logic; 
--          vram_D   : in    std_logic_vector (7 downto 0); 
--          vram_W   : in    std_logic; 
--          vga_D    : out   std_logic_vector (7 downto 0));
--end VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video_LOWER_MiST;
--
--architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video_LOWER_MiST is
--  
--	
--	 component SELECT8
--      port ( s1    : in    std_logic; 
--             DATA1 : in    std_logic_vector (7 downto 0); 
--             DATA2 : in    std_logic_vector (7 downto 0); 
--             DATA0 : out   std_logic_vector (7 downto 0));
--   end component;
--	
--	  component and_then
--      port ( A : in    std_logic; 
--             B : in    std_logic; 
--             C : out   std_logic);
--   end component;
--	
--	component altera_syncram_dp is
--	  generic ( 
--		 abits : integer := 4; dbits : integer := 32
--	  );
--	  port (
--		 clk1     : in std_ulogic;
--		 address1 : in std_logic_vector((abits -1) downto 0);
--		 datain1  : in std_logic_vector((dbits -1) downto 0);
--		 dataout1 : out std_logic_vector((dbits -1) downto 0);
--		 enable1  : in std_ulogic;
--		 write1   : in std_ulogic;
--		 clk2     : in std_ulogic;
--		 address2 : in std_logic_vector((abits -1) downto 0);
--		 datain2  : in std_logic_vector((dbits -1) downto 0);
--		 dataout2 : out std_logic_vector((dbits -1) downto 0);
--		 enable2  : in std_ulogic;
--		 write2   : in std_ulogic);
--	end component;
--	
--	signal dOut8000 : std_logic_vector(7 downto 0);
--	signal dOut8000_0 : std_logic_vector(0 downto 0);
--	signal dOut8000_1 : std_logic_vector(0 downto 0);
--	signal dOut8000_2 : std_logic_vector(0 downto 0);
--	signal dOut8000_3 : std_logic_vector(0 downto 0);
--	signal dOut8000_4 : std_logic_vector(0 downto 0);
--	signal dOut8000_5 : std_logic_vector(0 downto 0);
--	signal dOut8000_6 : std_logic_vector(0 downto 0);
--	signal dOut8000_7 : std_logic_vector(0 downto 0);
--	signal w8000 : std_logic;
--	signal dOut2_8000 : std_logic_vector(7 downto 0);
--	signal dOut2_8000_0 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_1 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_2 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_3 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_4 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_5 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_6 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_7 : std_logic_vector(0 downto 0);
--	signal w2_8000 : std_logic;
--	
--	function vectorize(s: std_logic) return std_logic_vector is
--variable v: std_logic_vector(0 downto 0);
--begin
--v(0) := s;
--return v;
--end;
--	
--begin
--
--dOut8000<=dOut8000_7(0) & dOut8000_6(0) & dOut8000_5(0) & dOut8000_4(0) & dOut8000_3(0) & dOut8000_2(0) & dOut8000_1(0) & dOut8000_0(0);
--
--dOut2_8000<=dOut2_8000_7(0) & dOut2_8000_6(0) & dOut2_8000_5(0) & dOut2_8000_4(0) & dOut2_8000_3(0) & dOut2_8000_2(0) & dOut2_8000_1(0) & dOut2_8000_0(0);
--
--  inst_w8000 : and_then
--      port map (A=>not(vram_A(13)),
--                B=>vram_W,
--                C=>w8000);
--					 
--  XLXI_4 : SELECT8
--      port map (DATA1(7 downto 0)=>dOut8000,
--                DATA2(7 downto 0)=>x"00",--dOut4000,
--                s1=>not(vga_A(13)),
--                DATA0(7 downto 0)=>vga_D);
--
--
--  inst_w2_8000 : and_then
--      port map (A=>(vram_A(13)),
--                B=>vram_W,
--                C=>w2_8000);
--
--					  --8000
--   XLXI_30 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(0)),
--                write1=>w8000,
--                dataout2=>dOut8000_0,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_31 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(1)),
--                write1=>w8000,
--                dataout2=>dOut8000_1,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_32 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(2)),
--                write1=>w8000,
--                dataout2=>dOut8000_2,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_33 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(3)),
--                write1=>w8000,
--                dataout2=>dOut8000_3,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_34 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(4)),
--                write1=>w8000,
--                dataout2=>dOut8000_4,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_35 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(5)),
--                write1=>w8000,
--                dataout2=>dOut8000_5,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_36 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(6)),
--                write1=>w8000,
--                dataout2=>dOut8000_6,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_37 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(7)),
--                write1=>w8000,
--                dataout2=>dOut8000_7,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--					 
--					 
--	-- 4000
--	 XLXI_30_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(0)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_0,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_31_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(1)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_1,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_32_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(2)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_2,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_33_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(3)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_3,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_34_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(4)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_4,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_35_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(5)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_5,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_36_2_8000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(6)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_6,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_37_4000 : altera_syncram_dp
--		generic map(abits=>13,dbits=>1)
--      port map (address2(12 downto 0)=>vga_A(12 downto 0),
--                clk2=>vga_CLK,
--                address1(12 downto 0)=>vram_A(12 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(7)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_7,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--
--  
--end BEHAVIORAL;


--
--library ieee;
--use ieee.std_logic_1164.ALL;
--use ieee.numeric_std.ALL;
----library UNISIM;
----use UNISIM.Vcomponents.ALL;
---- light weight memory entre 11000 et 14000 = 8000+4000
--entity VRAM_Amstrad_NEXYS4_8Ko_MUSER_amstrad_video is
--   port ( vga_A    : in    std_logic_vector (12 downto 0); 
--          vga_CLK  : in    std_logic; 
--          vram_A   : in    std_logic_vector (12 downto 0); 
--          vram_CLK : in    std_logic; 
--          vram_D   : in    std_logic_vector (7 downto 0); 
--          vram_W   : in    std_logic; 
--          vga_D    : out   std_logic_vector (7 downto 0));
--end VRAM_Amstrad_NEXYS4_8Ko_MUSER_amstrad_video;
--
--architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_8Ko_MUSER_amstrad_video is
--  
--	
--	 component SELECT8
--      port ( s1    : in    std_logic; 
--             DATA1 : in    std_logic_vector (7 downto 0); 
--             DATA2 : in    std_logic_vector (7 downto 0); 
--             DATA0 : out   std_logic_vector (7 downto 0));
--   end component;
--	
--	  component and_then
--      port ( A : in    std_logic; 
--             B : in    std_logic; 
--             C : out   std_logic);
--   end component;
--	
--	component altera_syncram_dp is
--	  generic ( 
--		 abits : integer := 4; dbits : integer := 32
--	  );
--	  port (
--		 clk1     : in std_ulogic;
--		 address1 : in std_logic_vector((abits -1) downto 0);
--		 datain1  : in std_logic_vector((dbits -1) downto 0);
--		 dataout1 : out std_logic_vector((dbits -1) downto 0);
--		 enable1  : in std_ulogic;
--		 write1   : in std_ulogic;
--		 clk2     : in std_ulogic;
--		 address2 : in std_logic_vector((abits -1) downto 0);
--		 datain2  : in std_logic_vector((dbits -1) downto 0);
--		 dataout2 : out std_logic_vector((dbits -1) downto 0);
--		 enable2  : in std_ulogic;
--		 write2   : in std_ulogic);
--	end component;
--	
--	signal dOut8000 : std_logic_vector(7 downto 0);
--	signal dOut8000_0 : std_logic_vector(0 downto 0);
--	signal dOut8000_1 : std_logic_vector(0 downto 0);
--	signal dOut8000_2 : std_logic_vector(0 downto 0);
--	signal dOut8000_3 : std_logic_vector(0 downto 0);
--	signal dOut8000_4 : std_logic_vector(0 downto 0);
--	signal dOut8000_5 : std_logic_vector(0 downto 0);
--	signal dOut8000_6 : std_logic_vector(0 downto 0);
--	signal dOut8000_7 : std_logic_vector(0 downto 0);
--	signal w8000 : std_logic;
--	signal dOut2_8000 : std_logic_vector(7 downto 0);
--	signal dOut2_8000_0 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_1 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_2 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_3 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_4 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_5 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_6 : std_logic_vector(0 downto 0);
--	signal dOut2_8000_7 : std_logic_vector(0 downto 0);
--	signal w2_8000 : std_logic;
--	
--	function vectorize(s: std_logic) return std_logic_vector is
--variable v: std_logic_vector(0 downto 0);
--begin
--v(0) := s;
--return v;
--end;
--	
--begin
--
--dOut8000<=dOut8000_7(0) & dOut8000_6(0) & dOut8000_5(0) & dOut8000_4(0) & dOut8000_3(0) & dOut8000_2(0) & dOut8000_1(0) & dOut8000_0(0);
--
--dOut2_8000<=dOut2_8000_7(0) & dOut2_8000_6(0) & dOut2_8000_5(0) & dOut2_8000_4(0) & dOut2_8000_3(0) & dOut2_8000_2(0) & dOut2_8000_1(0) & dOut2_8000_0(0);
--
--  inst_w8000 : and_then
--      port map (A=>not(vram_A(12)),
--                B=>vram_W,
--                C=>w8000);
--					 
--  XLXI_4 : SELECT8
--      port map (DATA1(7 downto 0)=>dOut8000,
--                DATA2(7 downto 0)=>dOut2_8000,
--                s1=>not(vga_A(12)),
--                DATA0(7 downto 0)=>vga_D);
--
--
--  inst_w4000 : and_then
--      port map (A=>(vram_A(12) and not(vram_A(11))),
--                B=>vram_W,
--                C=>w2_8000);
--
--					  --8000
--   XLXI_30 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(0)),
--                write1=>w8000,
--                dataout2=>dOut8000_0,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_31 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(1)),
--                write1=>w8000,
--                dataout2=>dOut8000_1,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_32 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(2)),
--                write1=>w8000,
--                dataout2=>dOut8000_2,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_33 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(3)),
--                write1=>w8000,
--                dataout2=>dOut8000_3,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_34 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(4)),
--                write1=>w8000,
--                dataout2=>dOut8000_4,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_35 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(5)),
--                write1=>w8000,
--                dataout2=>dOut8000_5,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_36 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(6)),
--                write1=>w8000,
--                dataout2=>dOut8000_6,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_37 : altera_syncram_dp
--		generic map(abits=>12,dbits=>1)
--      port map (address2(11 downto 0)=>vga_A(11 downto 0),
--                clk2=>vga_CLK,
--                address1(11 downto 0)=>vram_A(11 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(7)),
--                write1=>w8000,
--                dataout2=>dOut8000_7,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--					 
--					 
--	-- 4000
--	 XLXI_30_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(0)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_0,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_31_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(1)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_1,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_32_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(2)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_2,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_33_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(3)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_3,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_34_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(4)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_4,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_35_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(5)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_5,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_36_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(6)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_6,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--   XLXI_37_4000 : altera_syncram_dp
--		generic map(abits=>11,dbits=>1)
--      port map (address2(10 downto 0)=>vga_A(10 downto 0),
--                clk2=>vga_CLK,
--                address1(10 downto 0)=>vram_A(10 downto 0),
--                clk1=>vram_CLK,
--                datain1=>vectorize(vram_D(7)),
--                write1=>w2_8000,
--                dataout2=>dOut2_8000_7,
--dataout1=>open,
--enable1=>'1',
--datain2=>"0",
--enable2=>'1',
--write2=>'0');
--   
--  
--  
--end BEHAVIORAL;


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
   signal XLXN_40  : std_logic_vector (7 downto 0):=(others=>'0');
   signal XLXN_46  : std_logic_vector (7 downto 0):=(others=>'1');
   component and_then
      port ( A : in    std_logic; 
             B : in    std_logic; 
             C : out   std_logic);
   end component;
   
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
   
--	component VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_video_LOWER_MiST
--      port ( vram_CLK : in    std_logic; 
--             vga_CLK  : in    std_logic; 
--             vram_A   : in    std_logic_vector (13 downto 0); 
--             vga_A    : in    std_logic_vector (13 downto 0); 
--             vram_W   : in    std_logic; 
--             vram_D   : in    std_logic_vector (7 downto 0); 
--             vga_D    : out   std_logic_vector (7 downto 0));
--   end component;
	
begin
   XLXI_2 : and_then
      port map (A=>vram_W,
                B=>XLXN_21,
                C=>XLXN_19);
   
--   XLXI_3 : INV
--      port map (I=>vram_A(14),
--                O=>XLXN_21);
XLXN_21<=not(vram_A(14));
   
   XLXI_4 : SELECT8
      port map (DATA1(7 downto 0)=>XLXN_40(7 downto 0),
                DATA2(7 downto 0)=>XLXN_46(7 downto 0),
                s1=>XLXN_23,
                DATA0(7 downto 0)=>vga_D(7 downto 0));
   
--   XLXI_5 : INV
--      port map (I=>vga_A(14),
--                O=>XLXN_23);
XLXN_23<=not(vga_A(14));
   
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
          BLUE2       : out   std_logic_vector (2 downto 0); 
          GREEN2      : out   std_logic_vector (2 downto 0); 
          HSYNC       : out   std_logic; 
          RED2        : out   std_logic_vector (2 downto 0); 
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
		generic (--VOFFSET_NEGATIF : integer:=0;
		VOFFSET_PALETTE:integer:=0);
      port ( CLK_25MHz : in    std_logic; 
             DATA      : in    std_logic_vector (7 downto 0); 
             PALETTE_D : in    std_logic_vector (7 downto 0); 
             VSYNC     : out   std_logic; 
             HSYNC     : out   std_logic; 
             ADDRESS   : out   std_logic_vector (14 downto 0); 
             PALETTE_A : out   std_logic_vector (13 downto 0); 
             RED       : out   std_logic_vector (2 downto 0); 
             GREEN     : out   std_logic_vector (2 downto 0); 
             BLUE      : out   std_logic_vector (2 downto 0));
   end component;
   
--   component VRAM_Amstrad_NEXYS4_8Ko_MUSER_amstrad_video
--      port ( vram_CLK : in    std_logic; 
--             vga_CLK  : in    std_logic; 
--             vram_A   : in    std_logic_vector (12 downto 0); 
--             vga_A    : in    std_logic_vector (12 downto 0); 
--             vram_W   : in    std_logic; 
--             vram_D   : in    std_logic_vector (7 downto 0); 
--             vga_D    : out   std_logic_vector (7 downto 0));
--   end component;

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
		generic map (--VOFFSET_NEGATIF =>0, -- MiST 0
		VOFFSET_PALETTE=>0) -- MiST 0
      port map (CLK_25MHz=>CLK25MHz,
                DATA(7 downto 0)=>XLXN_743(7 downto 0),
                PALETTE_D(7 downto 0)=>XLXN_744(7 downto 0),
                ADDRESS(14 downto 0)=>XLXN_693(14 downto 0),
                BLUE(2 downto 0)=>BLUE2(2 downto 0),
                GREEN(2 downto 0)=>GREEN2(2 downto 0),
                HSYNC=>HSYNC,
                PALETTE_A(13 downto 0)=>XLXN_694(13 downto 0),
                RED(2 downto 0)=>RED2(2 downto 0),
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
   
--   XLXI_484 : GND
--      port map (G=>XLXN_718);
XLXN_718<='0';
   
--   XLXI_485 : GND
--      port map (G=>XLXN_721);
XLXN_721<='0';
   
--   XLXI_486 : VCC
--      port map (P=>XLXN_717);
XLXN_717<='1';
   
--   XLXI_487 : VCC
--      port map (P=>XLXN_719);
XLXN_719<='1';
   
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


