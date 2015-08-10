----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:01 01/26/2011 
-- Design Name: 
-- Module Name:    TchouTchou - Behavioral 
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

entity TchouTchou is
    Port ( ram_Din : in  STD_LOGIC_VECTOR (7 downto 0);
           ram_Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           ram_LB : in  STD_LOGIC;
           ram_UB : in  STD_LOGIC;
           ram_D_L : inout  STD_LOGIC_VECTOR (7 downto 0);
           ram_D_U : inout  STD_LOGIC_VECTOR (7 downto 0);
			  DO_READ:in STD_LOGIC;
			  DO_FILL:in STD_LOGIC
			  );
end TchouTchou;

architecture Behavioral of TchouTchou is

begin
--ram_D_L<=ram_Din when ram_LB='1' and (DO_FILL='1' and DO_READ='0') else (others=>'Z');
ram_D_L<=ram_Din when (DO_FILL='1' and DO_READ='0') else (others=>'Z');
--ram_D_U<=ram_Din when ram_UB='1' and (DO_FILL='1' and DO_READ='0') else (others=>'Z');
ram_D_U<=(others=>'L');
ram_Dout<=ram_D_L when (DO_FILL='0' or DO_READ='1') else (others=>'0');
end Behavioral;

