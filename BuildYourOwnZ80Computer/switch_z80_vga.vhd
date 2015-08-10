----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:48 01/10/2011 
-- Design Name: 
-- Module Name:    switch_z80_vga - Behavioral 
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

entity switch_z80_vga is
    Port ( z80_A : in  STD_LOGIC_VECTOR (17 downto 0);
           vga_A : in  STD_LOGIC_VECTOR (17 downto 0);
           ram_A : out  STD_LOGIC_VECTOR (17 downto 0);
           z80_D : in  STD_LOGIC_VECTOR (7 downto 0);
           ram_D : out  STD_LOGIC_VECTOR (7 downto 0);
			  do_display : in std_logic
			  );
end switch_z80_vga;

architecture Behavioral of switch_z80_vga is

begin
	ram_A<=vga_A when do_display = '1' else z80_A;
	ram_D<=(others=>'Z') when do_display = '1' else z80_D;
end Behavioral;

