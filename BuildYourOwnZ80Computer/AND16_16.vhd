----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:39:29 11/12/2010 
-- Design Name: 
-- Module Name:    AND16_16 - Behavioral 
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
entity AND16_16 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end AND16_16;

architecture Behavioral of AND16_16 is

begin
	C(0)<=A(0) and B(0);
	C(1)<=A(1) and B(1);
	C(2)<=A(2) and B(2);
	C(3)<=A(3) and B(3);
	C(4)<=A(4) and B(4);
	C(5)<=A(5) and B(5);
	C(6)<=A(6) and B(6);
	C(7)<=A(7) and B(7);
	C(8)<=A(8) and B(8);
	C(9)<=A(9) and B(9);
	C(10)<=A(10) and B(10);
	C(11)<=A(11) and B(11);
	C(12)<=A(12) and B(12);
	C(13)<=A(13) and B(13);
	C(14)<=A(14) and B(14);
	C(15)<=A(15) and B(15);


end Behavioral;

