----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:21 10/11/2014 
-- Design Name: 
-- Module Name:    A13_to_A14 - Behavioral 
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

entity A13_to_A14 is
    Port ( Ain : in  STD_LOGIC_VECTOR (12 downto 0);
           Aout : out  STD_LOGIC_VECTOR (13 downto 0));
end A13_to_A14;

architecture Behavioral of A13_to_A14 is

begin
Aout(13 downto 13)<="0";
Aout(12 downto 0)<=Ain(12 downto 0);

end Behavioral;

