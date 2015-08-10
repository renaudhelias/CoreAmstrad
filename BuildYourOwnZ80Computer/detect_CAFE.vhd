----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:21 12/14/2014 
-- Design Name: 
-- Module Name:    detect_CAFE - Behavioral 
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

entity detect_CAFE is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           cafe : out  STD_LOGIC
			  --cafePifHercule : out STD_LOGIC
			  );
end detect_CAFE;

architecture Behavioral of detect_CAFE is

begin
	cafe <='1' when A=x"CAFE" else '0';
	--cafePifHercule <='1' when A=x"C4F3" else '0';
end Behavioral;

