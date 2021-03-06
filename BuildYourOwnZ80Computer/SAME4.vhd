----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:29 10/11/2014 
-- Design Name: 
-- Module Name:    SAME4 - Behavioral 
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

entity SAME4 is
    Port ( Sin : in  STD_LOGIC;
           Sout : out  STD_LOGIC_VECTOR (3 downto 0));
end SAME4;

architecture Behavioral of SAME4 is

begin
Sout<= "000" & Sin;

end Behavioral;

