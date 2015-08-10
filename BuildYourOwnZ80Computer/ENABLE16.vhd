----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:20:30 11/13/2010 
-- Design Name: 
-- Module Name:    ENABLE16 - Behavioral 
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

entity ENABLE16 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           ENABLE : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end ENABLE16;

architecture Behavioral of ENABLE16 is

begin
	C(0)<=A(0) and ENABLE;
	C(1)<=A(1) and ENABLE;
	C(2)<=A(2) and ENABLE;
	C(3)<=A(3) and ENABLE;
	C(4)<=A(4) and ENABLE;
	C(5)<=A(5) and ENABLE;
	C(6)<=A(6) and ENABLE;
	C(7)<=A(7) and ENABLE;
	C(8)<=A(8) and ENABLE;
	C(9)<=A(9) and ENABLE;
	C(10)<=A(10) and ENABLE;
	C(11)<=A(11) and ENABLE;
	C(12)<=A(12) and ENABLE;
	C(13)<=A(13) and ENABLE;
	C(14)<=A(14) and ENABLE;
	C(15)<=A(15) and ENABLE;
end Behavioral;

