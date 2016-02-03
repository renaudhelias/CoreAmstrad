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

entity MIST_SCART is
    Port ( RED_in : in  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_in : in  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_in : in  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_in : in STD_logic;
			  VSYNC_in : in STD_logic;
           RED_out : out  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_out : out  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_out : out  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_out : out STD_logic;
			  VSYNC_out : out STD_logic;
			  
			  RED_TV_in : in  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_TV_in : in  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_TV_in : in  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_TV_in : in STD_logic;
			  VSYNC_TV_in : in STD_logic;
			  
			  mode : in std_logic;
  			  pclk_in : in std_logic;
			  pclk_TV_in : in std_logic;
			  pclk_out : out std_logic

			  );
end MIST_SCART;

architecture Behavioral of MIST_SCART is

begin
RED_out<= RED_in when mode='0' else RED_TV_in;
GREEN_out<= GREEN_in when mode='0' else GREEN_TV_in;
BLUE_out<= BLUE_in when mode='0' else BLUE_TV_in;
HSYNC_out<=HSYNC_in when mode='0' else HSYNC_TV_in;
VSYNC_out<=VSYNC_in when mode='0' else VSYNC_TV_in;
pclk_out<=pclk_in when mode='0' else pclk_TV_in;
end Behavioral;

