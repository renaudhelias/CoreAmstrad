----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:19 10/11/2014 
-- Design Name: 
-- Module Name:    NEXYS4_RGB - Behavioral 
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

entity MIST_DQM is
    Port ( DQM : in  STD_LOGIC_VECTOR (1 downto 0);
           DQML : out  STD_LOGIC;
           DQMH : out  STD_LOGIC
			 );
end MIST_DQM;

architecture Behavioral of MIST_DQM is

begin
DQMH<=DQM(1);
DQML<=DQM(0);
end Behavioral;

