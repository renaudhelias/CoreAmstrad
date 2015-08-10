----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:01 02/10/2011 
-- Design Name: 
-- Module Name:    NEXUS_RGB - Behavioral 
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

entity NEXUS_RGB is
    Port ( RED_FF : in  STD_LOGIC_VECTOR(1 downto 0);
           GREEN_FFF : in  STD_LOGIC_VECTOR(2 downto 0);
           BLUE_FF : in  STD_LOGIC_VECTOR(1 downto 0);
           RED3 : out  STD_LOGIC_VECTOR (2 downto 0);
           GREEN3 : out  STD_LOGIC_VECTOR (2 downto 0);
           BLUE2 : out  STD_LOGIC_VECTOR (1 downto 0));
end NEXUS_RGB;

architecture Behavioral of NEXUS_RGB is

begin
RED3<= RED_FF & "1" when RED_FF>"00" else "000";
--GREEN3<= GREEN_FF & "1" when GREEN_FF>"00" else "000";
GREEN3<= GREEN_FFF;
BLUE2<= BLUE_FF;
end Behavioral;

