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
-- osd.OSD_7SEG
-- debug is more fun like this ;)
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OSD_7SEG is
    Port ( segment : in  STD_LOGIC_VECTOR (6 downto 0);
			  h : in std_logic_vector(1 downto 0);
			  v : in std_logic_vector(2 downto 0);
           pixel : out std_logic
			 );
end OSD_7SEG;

architecture Behavioral of OSD_7SEG is
	type matrice_type is array(7 downto 0) of STD_LOGIC_VECTOR(3 downto 0);
	signal matrice:matrice_type;
begin
matrice<=(
	"0000",
	'0' & segment(6) & segment(6) & '0', -- .--.             .66.
	segment(5) & '0' & '0' & segment(4), -- |  |  7 SEGMENTS 5  4
	segment(5) & '0' & '0' & segment(4), -- |  |             5  4
	'0' & segment(3) & segment(3) & '0', -- .--.             .33.
	segment(2) & '0' & '0' & segment(1), -- |  |             2  1
	segment(2) & '0' & '0' & segment(1), -- |  |             2  1
	'0' & segment(0) & segment(0) & '0'  -- '--'             '00'
			);
pixel<=matrice(conv_integer(v))(conv_integer(h));
end Behavioral;

