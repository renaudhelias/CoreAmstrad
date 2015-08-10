----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:05 11/13/2010 
-- Design Name: 
-- Module Name:    ENABLE8 - Behavioral 
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

entity ENABLE8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (7 downto 0));
end ENABLE8;

architecture Behavioral of ENABLE8 is

begin
	C(0)<=A(0) and ENABLE;
	C(1)<=A(1) and ENABLE;
	C(2)<=A(2) and ENABLE;
	C(3)<=A(3) and ENABLE;
	C(4)<=A(4) and ENABLE;
	C(5)<=A(5) and ENABLE;
	C(6)<=A(6) and ENABLE;
	C(7)<=A(7) and ENABLE;

end Behavioral;

