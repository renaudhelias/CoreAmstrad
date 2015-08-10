----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:16 04/26/2011 
-- Design Name: 
-- Module Name:    z80_synchronizer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity z80_synchronizer is
    Port ( CLK4MHz : in  STD_LOGIC;
           M1_n : in  STD_LOGIC;
           WAIT_n : out  STD_LOGIC:='0';
			  ALARM:out std_logic:='0'
			  );
end z80_synchronizer;

architecture Behavioral of z80_synchronizer is

begin
process(CLK4MHz)
	variable counter:integer range 0 to 3:=0;
	variable waiting:boolean:=false;
	variable starting:boolean:=true;
begin
	if falling_edge(CLK4MHz) then
		if M1_n='0' and counter=0 then
			-- M---M---M---
			-- 012301230123

			-- cool
			waiting:=false;
			WAIT_n<='1';
			--starting:=false;
		elsif waiting and counter=0 then
			waiting:=false;
			WAIT_n<='1';
		elsif waiting then
			-- quand on pose un wait, cet idiot il garde M1_n=0 le tour suivant
		elsif M1_n='0' then
			-- M--M---M---
			-- 012301230123
			-- M--MW---M---
			-- 012301230123
			
			-- M-M---M---
			-- 012301230123
			-- M-MWW---M---
			-- 012301230123
		
			-- M----M---M---
			-- 0123012301230123
			-- M----MWWW---M---
			-- 0123012301230123
		
			-- pas cool
			WAIT_n<='0';
			waiting:=true;
		elsif counter=0 and not(waiting) then
			ALARM<='1';
		end if;
		counter:=(counter+1) mod 4;
	end if;
end process;

end Behavioral;

