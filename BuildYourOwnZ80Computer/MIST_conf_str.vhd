library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MIST_conf_str is
    Port ( CONF_STR : out  STD_LOGIC_VECTOR (143*8-1 downto 0)
			);
end MIST_conf_str;

architecture Behavioral of MIST_conf_str is
  --constant CONF_STRING : string := "Amstrad;DSK;O1,Bootloader,0XXXX,1XXXX;O2,Bootloader,X0XXX,X1XXX;O3,Bootloader,XX0XX,XX1XX;O4,Bootloader,XXX0X,XXX1X;O5,Bootloader,XXXX0,XXXX1;";
  --constant CONF_STRING : string := "AMSTRAD;DSK;O1,LowerVRAM,1X,0X;O2,LowerVRAM,X0,X1;O3,UpperVRAM,1X,0X;O4,UpperVRAM,1X,0X;";
  constant CONF_STRING : string := "AMSTRAD;DSK;O1,LowerVRAM,1X,0X;O2,LowerVRAM,X0,X1;O3,UpperVRAM,1X,0X;O4,UpperVRAM,1X,0X;O5,Brand name,Schneider,Amstrad;O6,Frequency,50Hz,60Hz;";

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

