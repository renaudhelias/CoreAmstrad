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

entity MIST_RGB is
    Port ( RED_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           GREEN_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           BLUE_FF : in  STD_LOGIC_VECTOR (1 downto 0);
           RED6 : out  STD_LOGIC_VECTOR (5 downto 0);
           GREEN6 : out  STD_LOGIC_VECTOR (5 downto 0);
           BLUE6 : out  STD_LOGIC_VECTOR (5 downto 0));
end MIST_RGB;

architecture Behavioral of MIST_RGB is

begin
RED6<= RED_FF & "0000";
GREEN6<= GREEN_FF & "0000";
BLUE6<= BLUE_FF & "0000";
end Behavioral;

