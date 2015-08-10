----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:01 01/16/2011 
-- Design Name: 
-- Module Name:    IO_driver - Behavioral 
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

entity IO_driver is
    Port ( rd : in  STD_LOGIC;
           CLK4 : in  STD_LOGIC_VECTOR (1 downto 0);
           Dout : inout  STD_LOGIC_VECTOR (7 downto 0);
			  Dppi : inout STD_LOGIC_VECTOR (7 downto 0)
    );
end IO_driver;

architecture Behavioral of IO_driver is

begin

	process(CLK4) is
	begin
		if CLK4=b"10" then
		elsif CLK4=b"11" then
			Dout<=(others=>'Z');
		elsif CLK4=b"00" then
			if rd='1' then
				Dout<=Dppi; -- à peu près
			end if;
		else
		end if;
	end process;


end Behavioral;


