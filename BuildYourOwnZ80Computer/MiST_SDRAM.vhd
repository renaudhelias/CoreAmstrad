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
-- MIST_*.vhd : MiST-board simple adapter (glue-code)
-- This type of component is only used on my main schematic.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIST_SDRAM is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           w : in  STD_LOGIC;
           r : in  STD_LOGIC;
			  -- sdram.v
           sdram_din : in  STD_LOGIC_VECTOR (7 downto 0);
           sdram_addr : out  STD_LOGIC_VECTOR (24 downto 0);
           sdram_oe : out  STD_LOGIC;
           sdram_wr : out  STD_LOGIC;
           sdram_dout : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end MIST_SDRAM;

architecture Behavioral of MIST_SDRAM is

begin
	sdram_addr(22 downto 0)<=A(22 downto 0);
	sdram_addr(24 downto 23)<="00";
	
	sdram_wr<=w;
	sdram_oe<=r;
	Dout<=sdram_din when r='1' else (others=>'0');
	sdram_dout<=Din when w='1' else (others=>'0');
end Behavioral;

