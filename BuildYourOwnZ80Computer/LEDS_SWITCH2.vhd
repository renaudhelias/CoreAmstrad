----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:47 11/09/2014 
-- Design Name: 
-- Module Name:    LEDS_SWITCH2 - Behavioral 
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

entity LEDS_SWITCH2 is
    Port ( leds1 : in  STD_LOGIC_VECTOR (7 downto 0);
           leds2 : in  STD_LOGIC_VECTOR (7 downto 0);
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           select_leds : in  STD_LOGIC);
end LEDS_SWITCH2;

architecture Behavioral of LEDS_SWITCH2 is

begin

	leds <= leds1 when select_leds='1' else leds2;

end Behavioral;

