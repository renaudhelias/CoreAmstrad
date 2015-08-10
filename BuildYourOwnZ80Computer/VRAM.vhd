----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:41 01/16/2011 
-- Design Name: 
-- Module Name:    VRAM - Behavioral 
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

entity VRAM is
    Port ( vram_A : in  STD_LOGIC_VECTOR (13 downto 0);
           vram_D : in  STD_LOGIC_VECTOR (7 downto 0);
           vram_W : in  STD_LOGIC;
           vram_CLK : in  STD_LOGIC;
           vga_CLK : in  STD_LOGIC;
           vga_A : in  STD_LOGIC_VECTOR (13 downto 0);
           vga_D : out  STD_LOGIC_VECTOR (7 downto 0);
           vga_R : in  STD_LOGIC);
end VRAM;

architecture Behavioral of VRAM is

begin


end Behavioral;

