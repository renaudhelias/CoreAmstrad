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

entity MIST_RGB is
    Port ( RED_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           GREEN_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           BLUE_FF : in  STD_LOGIC_VECTOR (1 downto 0);
			  HSYNC_FF : in STD_logic;
			  VSYNC_FF : in STD_logic;
           RED6 : out  STD_LOGIC_VECTOR (5 downto 0);
           GREEN6 : out  STD_LOGIC_VECTOR (5 downto 0);
           BLUE6 : out  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC6 : out STD_logic;
			  VSYNC6 : out STD_logic
			  );
end MIST_RGB;

architecture Behavioral of MIST_RGB is

begin
RED6<= RED_FF & "0000";
GREEN6<= GREEN_FF & "0000";
BLUE6<= BLUE_FF & "0000";
HSYNC6<=HSYNC_FF;
VSYNC6<=VSYNC_FF;
end Behavioral;

