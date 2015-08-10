library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MiST_FILESELECT is
    Port ( file_select : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end MiST_FILESELECT;

architecture Behavioral of MiST_FILESELECT is
	
begin
	file_select<=(others=>'0');
end Behavioral;

