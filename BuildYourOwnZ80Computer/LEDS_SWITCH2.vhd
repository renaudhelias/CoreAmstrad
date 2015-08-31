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
-- FPGAmstrad_bootloader_sd.SDRAM_FAT32_LOADER
-- glue-code, debug
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LEDS_SWITCH2 is
    Port ( leds1 : in  STD_LOGIC_VECTOR (7 downto 0);
           leds2 : in  STD_LOGIC_VECTOR (7 downto 0);
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           select_leds : in  STD_LOGIC);
end LEDS_SWITCH2;

architecture Behavioral of LEDS_SWITCH2 is

begin

	leds <= leds1 when select_leds='1' else leds2;

end Behavioral;

