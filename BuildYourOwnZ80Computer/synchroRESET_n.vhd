----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:09:38 10/19/2014 
-- Design Name: 
-- Module Name:    synchroRESET_n - Behavioral 
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

entity synchroRESET_n is
    Port ( CLK16MHz : in  STD_LOGIC;
           CLK8MHz : in  STD_LOGIC;
           CLK4MHz : in  STD_LOGIC;
           init_done : in  STD_LOGIC;
           RESET_n : out  STD_LOGIC:='0');
end synchroRESET_n;

architecture Behavioral of synchroRESET_n is

begin
RESET_n<=init_done when rising_edge(CLK4MHz);

end Behavioral;

