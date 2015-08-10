----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:48:44 05/01/2011 
-- Design Name: 
-- Module Name:    A15_14_8_mapping - Behavioral 
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

entity A15_14_9_8_mapping is
    Port ( A15_14_9_8_in : in  STD_LOGIC_VECTOR (3 downto 0);
           A15_14_9_8_out : out  STD_LOGIC_VECTOR (3 downto 0));
end A15_14_9_8_mapping;

architecture Behavioral of A15_14_9_8_mapping is

begin
A15_14_9_8_out<=A15_14_9_8_in;

end Behavioral;

