----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:33:56 10/12/2014 
-- Design Name: 
-- Module Name:    CLK8_sequencer - Behavioral 
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

entity CLK8_sequencer is
    Port ( CLK4MHz : in  STD_LOGIC;
           CLK8MHz : in  STD_LOGIC;
           --CLK16MHz : in  STD_LOGIC;
           CLK4 : out  STD_LOGIC_VECTOR (1 downto 0));
end CLK8_sequencer;

architecture Behavioral of CLK8_sequencer is

begin
CLK4(0)<=CLK8MHz;
CLK4(1)<=CLK4MHz;
end Behavioral;

