----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:18:06 11/13/2010 
-- Design Name: 
-- Module Name:    OR16_16 - Behavioral 
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

entity OR16_16 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end OR16_16;

architecture Behavioral of OR16_16 is

begin
	C(0)<=A(0) or B(0);
	C(1)<=A(1) or B(1);
	C(2)<=A(2) or B(2);
	C(3)<=A(3) or B(3);
	C(4)<=A(4) or B(4);
	C(5)<=A(5) or B(5);
	C(6)<=A(6) or B(6);
	C(7)<=A(7) or B(7);
	C(8)<=A(8) or B(8);
	C(9)<=A(9) or B(9);
	C(10)<=A(10) or B(10);
	C(11)<=A(11) or B(11);
	C(12)<=A(12) or B(12);
	C(13)<=A(13) or B(13);
	C(14)<=A(14) or B(14);
	C(15)<=A(15) or B(15);

end Behavioral;

