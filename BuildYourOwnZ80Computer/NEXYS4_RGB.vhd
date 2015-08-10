----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:19 10/11/2014 
-- Design Name: 
-- Module Name:    NEXYS4_RGB - Behavioral 
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

entity NEXYS4_RGB is
    Port ( RED_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           GREEN_FFF : in  STD_LOGIC_VECTOR (2 downto 0);
           BLUE_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           RED4 : out  STD_LOGIC_VECTOR (3 downto 0);
           GREEN4 : out  STD_LOGIC_VECTOR (3 downto 0);
           BLUE4 : out  STD_LOGIC_VECTOR (3 downto 0));
end NEXYS4_RGB;

architecture Behavioral of NEXYS4_RGB is

begin
RED4<= RED_FF & "11" when RED_FF>"00" else "0000";
--GREEN3<= GREEN_FF & "1" when GREEN_FF>"00" else "000";
GREEN4<= GREEN_FFF & "1" when GREEN_FFF>"000" else "0000";
BLUE4<= BLUE_FF & "11" when BLUE_FF>"00" else "0000";
end Behavioral;

