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
    Port ( CONF_STR : out  STD_LOGIC_VECTOR (137*8-1 downto 0)
			);
end MIST_conf_str;

architecture Behavioral of MIST_conf_str is
	--constant CONF_STRING : string := "AMSTRAD;DSK;O1,Brand name,Schneider,Amstrad;O2,Screen,color,green;O3,Scanlines,off,on;O4,Drive,A,B";
	--constant CONF_STRING : string := "AMSTRAD;DSK;O1,Brand name,Schneider,Amstrad;O2,CRTC,1,0;O3,MEM_wr,quick,slow;O4,Screen,color,green;O5,Scanlines,off,on;O6,Drive,A,B";
	constant CONF_STRING : string := "AMSTRAD;DSK;O1,Brand name,Schneider,Amstrad;O2,CRTC,1,0;O3,VGA,vram72Hz,scandb50Hz;O4,Screen,color,green;O5,Scanlines,off,on;O6,Drive,A,B";

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

