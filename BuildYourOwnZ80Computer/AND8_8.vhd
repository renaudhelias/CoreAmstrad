----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:57 11/12/2010 
-- Design Name: 
-- Module Name:    AND8_8 - Behavioral 
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

-- imaginons que 1 and Z = 1
entity AND8_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC_VECTOR (7 downto 0));
end AND8_8;

architecture Behavioral of AND8_8 is

begin
	C(0)<=A(0) and B(0);
	C(1)<=A(1) and B(1);
	C(2)<=A(2) and B(2);
	C(3)<=A(3) and B(3);
	C(4)<=A(4) and B(4);
	C(5)<=A(5) and B(5);
	C(6)<=A(6) and B(6);
	C(7)<=A(7) and B(7);

end Behavioral;

