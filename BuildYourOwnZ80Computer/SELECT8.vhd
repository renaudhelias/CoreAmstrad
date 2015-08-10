----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:34 11/26/2011 
-- Design Name: 
-- Module Name:    SELECT8 - Behavioral 
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

entity SELECT8 is
    Port ( DATA1 : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA2 : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA0 : out  STD_LOGIC_VECTOR (7 downto 0);
           s1 : in  STD_LOGIC);
end SELECT8;

architecture Behavioral of SELECT8 is

begin

-- when fait un changement de raille, mais prend du temps à changer de raille pour le train.

	DATA0<=DATA1 when s1='1' else DATA2;
	
--	DATA0(7)<=(DATA1(7) and s1) or (DATA2(7) and not(s1));
--	DATA0(6)<=(DATA1(6) and s1) or (DATA2(6) and not(s1));
--	DATA0(5)<=(DATA1(5) and s1) or (DATA2(5) and not(s1));
--	DATA0(4)<=(DATA1(4) and s1) or (DATA2(4) and not(s1));
--	DATA0(3)<=(DATA1(3) and s1) or (DATA2(3) and not(s1));
--	DATA0(2)<=(DATA1(2) and s1) or (DATA2(2) and not(s1));
--	DATA0(1)<=(DATA1(1) and s1) or (DATA2(1) and not(s1));
--	DATA0(0)<=(DATA1(0) and s1) or (DATA2(0) and not(s1));
	
end Behavioral;

