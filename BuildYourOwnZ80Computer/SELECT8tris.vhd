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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SELECT8tris is
    Port ( DATA1 : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  DATA3 : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA0 : out  STD_LOGIC_VECTOR (7 downto 0);
           s1 : in  STD_LOGIC;
			  s2 : in  STD_LOGIC);
end SELECT8tris;

architecture Behavioral of SELECT8tris is

begin

	DATA0<=DATA1 when s1='1' else DATA2 when s2='1' else DATA3;
	
end Behavioral;

