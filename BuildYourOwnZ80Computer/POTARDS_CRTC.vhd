----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:56:37 04/21/2011 
-- Design Name: 
-- Module Name:    POTARDS_CRTC - Behavioral 
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

entity POTARDS_CRTC is
    Port ( POTARDS : out  STD_LOGIC_VECTOR (7 downto 0));
end POTARDS_CRTC;

architecture Behavioral of POTARDS_CRTC is

begin
POTARDS<=(others=>'0');

end Behavioral;

