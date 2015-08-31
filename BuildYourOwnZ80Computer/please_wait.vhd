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
-- FPGAmstrad_amstrad_motherboard.please_wait
-- Z80.WAIT_n little patch (because Z80.WAIT_n has actually a bug)
-- see T80se_p.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity please_wait is
    Port ( CLK_n : in  STD_LOGIC;
           WAIT_n : in  STD_LOGIC;
           CLK_WAIT_n : out  STD_LOGIC);
end please_wait;

architecture Behavioral of please_wait is
begin
CLK_WAIT_n<=CLK_n or not(WAIT_n);
end Behavioral;

