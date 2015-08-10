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

entity NEXUS_simpleRGB is
    Port ( RED_FF : in  STD_LOGIC;
           GREEN_FF : in  STD_LOGIC;
           BLUE_FF : in  STD_LOGIC;
           RED3 : out  STD_LOGIC_VECTOR (2 downto 0);
           GREEN3 : out  STD_LOGIC_VECTOR (2 downto 0);
           BLUE2 : out  STD_LOGIC_VECTOR (1 downto 0));
end NEXUS_simpleRGB;

architecture Behavioral of NEXUS_simpleRGB is

begin
RED3<= RED_FF & RED_FF & RED_FF;
GREEN3<= GREEN_FF & GREEN_FF & GREEN_FF ;
BLUE2<= BLUE_FF & BLUE_FF;
end Behavioral;

