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
-- FPGAmstrad_amstrad_video.SELECT8
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SELECT8 is
    Port ( DATA1 : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA2 : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA0 : out  STD_LOGIC_VECTOR (7 downto 0);
           s1 : in  STD_LOGIC);
end SELECT8;

architecture Behavioral of SELECT8 is

begin

-- brain garbage : "when" does change wagon way/track, but that takes a delta time to take effect. 

	DATA0<=DATA1 when s1='1' else DATA2;
	
end Behavioral;

