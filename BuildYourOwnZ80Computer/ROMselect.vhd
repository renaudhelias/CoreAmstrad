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
-- FPGAmstrad_amstrad_motherboard.ROMselect
-- ROM bank
-- see AmstradRAMROM.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROMselect is
    Port ( CLK:in STD_LOGIC;
			  reset: in STD_LOGIC;
			  A13 : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           IO_WR : in  STD_LOGIC;
           ROMbank : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0'));
end ROMselect;

architecture Behavioral of ROMselect is
begin
	process(reset,CLK) is
		variable ROMbank_mem: STD_LOGIC_VECTOR (7 downto 0);
	begin
		if reset='1' then
			ROMbank<=(others=>'0');
		elsif rising_edge(CLK) then
			if IO_WR='1' and A13='0' then
				ROMbank_mem(7 downto 0):=D(7 downto 0);
				ROMbank<=ROMbank_mem;
			end if;
		end if;
	end process;
end Behavioral;

