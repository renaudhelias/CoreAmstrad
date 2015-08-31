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
-- FPGAmstrad_amstrad_motherboard.detect_CAFE
-- out &cafe,3 -- followed by reboot key ("page up" key) does insert third disk
-- does insert dsk existing in root folder of sdcard, without using OSD.
-- Using OSD dsk select does turn off this possibility.
-- for debug purpose (on others platforms)
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detect_CAFE is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           cafe : out  STD_LOGIC
			  );
end detect_CAFE;

architecture Behavioral of detect_CAFE is

begin
	cafe <='1' when A=x"CAFE" else '0';
end Behavioral;

