----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:09 10/11/2014 
-- Design Name: 
-- Module Name:    D1_to_D16 - Behavioral 
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

entity D1_to_D16 is
    Port ( Din : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (15 downto 0));
end D1_to_D16;

architecture Behavioral of D1_to_D16 is
begin
Dout <= "00000000" & "0000" & "000" & Din;


end Behavioral;

