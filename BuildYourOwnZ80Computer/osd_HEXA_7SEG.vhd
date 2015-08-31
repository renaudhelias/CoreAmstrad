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
-- osd.OSD_HEXA_7SEG
-- debug is more fun like this ;)
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OSD_HEXA_7SEG is
    Port ( halfByte : in std_logic_vector(3 downto 0);
				segment : out  STD_LOGIC_VECTOR (6 downto 0)
			 );
end OSD_HEXA_7SEG;

architecture Behavioral of OSD_HEXA_7SEG is
type segment_decode_type is array(15 downto 0) of STD_LOGIC_VECTOR(6 downto 0);
	constant segment_decode:segment_decode_type:=(
	"0011011", -- F
	"1011011", -- E
	"1111100", -- d
	"1010011", -- C
	"1111010", -- b
	"0111111", -- A
	"1101111", -- 9
	"1111111", -- 8
	"0100101", -- 7
	"1111011", -- 6
	"1101011", -- 5
	"0101110", -- 4
	"1101101", -- 3
	"1011101", -- 2
	"0100100", -- 1
	"1110111" -- 0
			);
begin
segment<=segment_decode(conv_integer(halfByte));
end Behavioral;

