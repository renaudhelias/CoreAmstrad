--------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Joerg Wolfram
--
-- Create Date:    	04.03.2007
-- Design Name:    
-- Module Name:    	luma generator
-- Project Name:  	fbas_encoder		
-- Target Device:  	
-- Tool versions:  
-- Description:		generates the luma component of the signal 
--
-- Revision:		0.31
-- License:		GPL
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity luma_gen is
    
port (
-------------------------------------------------------------------------------
--- io
-------------------------------------------------------------------------------
	lg_clock:	in std_logic;				--- clock
	lg_hsync:	in std_logic;				--- colour enable
	lg_vsync:	in std_logic;				--- pal/ntsc mode	
	lg_rgb:		in std_logic_vector(2 downto 0);	--- rgb input
	lg_out:		out std_logic_vector(4 downto 0));	--- luma out
	
end entity luma_gen;

architecture simple_lut of luma_gen is
begin
-------------------------------------------------------------------------------
--- calculate output
-------------------------------------------------------------------------------
    process(lg_clock)
    begin
	if (rising_edge(lg_clock)) then
	    if ((lg_hsync='0') or (lg_vsync='0')) then
		lg_out <= "00000";
	    else
		case lg_rgb is
		    when "001" => lg_out <= "01110";
		    when "010" => lg_out <= "10000";
		    when "011" => lg_out <= "10001";
		    when "100" => lg_out <= "10010";
		    when "101" => lg_out <= "10011";
		    when "110" => lg_out <= "10100";
		    when "111" => lg_out <= "10111";
		    when others => lg_out <= "01101";
		end case;
	    end if;
	end if;
    end process;	    

-------------------------------------------------------------------------------
--- minimale Konfiguration
-------------------------------------------------------------------------------
end architecture simple_lut;
