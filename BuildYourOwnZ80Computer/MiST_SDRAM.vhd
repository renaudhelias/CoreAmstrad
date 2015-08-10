----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:20 02/24/2015 
-- Design Name: 
-- Module Name:    NEXYS4_SDRAM - Behavioral 
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

entity MIST_SDRAM is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           w : in  STD_LOGIC;
           r : in  STD_LOGIC;
			  -- sdram.v
           sdram_din : in  STD_LOGIC_VECTOR (7 downto 0);
           sdram_addr : out  STD_LOGIC_VECTOR (24 downto 0);
           sdram_oe : out  STD_LOGIC;
           sdram_wr : out  STD_LOGIC;
           sdram_dout : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end MIST_SDRAM;

architecture Behavioral of MIST_SDRAM is

begin
	sdram_addr(22 downto 0)<=A(22 downto 0);
	sdram_addr(24 downto 23)<="00";
	
	sdram_wr<=w;
	sdram_oe<=r;
	Dout<=sdram_din when r='1' else (others=>'0');
	sdram_dout<=Din when w='1' else (others=>'0');
end Behavioral;

