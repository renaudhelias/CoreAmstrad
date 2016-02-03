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
-- see MIST_status.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MIST_conf_str is
    Port ( CONF_STR : out  STD_LOGIC_VECTOR (149*8-1 downto 0)
			);
end MIST_conf_str;

architecture Behavioral of MIST_conf_str is
  --constant CONF_STRING : string := "AMSTRAD;DSK;O1,LowerVRAM,1X,0X;O2,LowerVRAM,X0,X1;O3,UpperVRAM,1X,0X;O4,UpperVRAM,1X,0X;O5,Brand name,Schneider,Amstrad;O6,Drive,A,B;O7,Output,VGA,TV";
  constant CONF_STRING : string := "AMSTRAD;DSK;O1,LowerVRAM,1X,0X;O2,LowerVRAM,X0,X1;O3,UpperVRAM,1X,0X;O4,UpperVRAM,X1,X0;O5,Brand name,Schneider,Amstrad;O6,Drive,A,B;O7,Output,VGA,TV";

 function to_slv(s: string) return std_logic_vector is 
    constant ss: string(1 to s'length) := s; 
    variable rval: std_logic_vector(1 to 8 * s'length); 
    variable p: integer; 
    variable c: integer; 
  
  begin 
    for i in ss'range loop
      p := 8 * i;
      c := character'pos(ss(i));
      rval(p - 7 to p) := std_logic_vector(to_unsigned(c,8)); 
    end loop; 
    return rval; 

  end function; 

begin

	CONF_STR<=to_slv(CONF_STRING);
	
end Behavioral;

