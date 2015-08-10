library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity please_wait is
    Port ( CLK_n : in  STD_LOGIC;
				--CLK8 : in  STD_LOGIC_VECTOR (2 downto 0);
           WAIT_n : in  STD_LOGIC;
           CLK_WAIT_n : out  STD_LOGIC);
end please_wait;

architecture Behavioral of please_wait is
begin
CLK_WAIT_n<=CLK_n or not(WAIT_n);
end Behavioral;

