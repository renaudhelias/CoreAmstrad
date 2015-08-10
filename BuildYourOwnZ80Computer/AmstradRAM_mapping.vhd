----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:19 12/22/2010 
-- Design Name: 
-- Module Name:    AmstradRAM_mapping - Behavioral 
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

entity AmstradRAM_mapping is
    Port ( MA : in  STD_LOGIC_VECTOR (13 downto 0);
           RA : in  STD_LOGIC_VECTOR (4 downto 0);
           CRTC_CLK : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           MIRROR_0 : out  STD_LOGIC_VECTOR (7 downto 0);
           MIRROR_1 : out  STD_LOGIC_VECTOR (7 downto 0);
           CRTC_NORMAL : out  STD_LOGIC_VECTOR (7 downto 0);
           CRTC_EXTEND : out  STD_LOGIC_VECTOR (7 downto 0));
end AmstradRAM_mapping;

architecture Behavioral of AmstradRAM_mapping is

begin
	MIRROR_0<=(A(15),A(14),A(13),A(12),A(11),A(10),A(9),A(0));
	MIRROR_1<=A(8 downto 1);
	CRTC_NORMAL<=MA(7 downto 0);
	CRTC_EXTEND<=(MA(13),MA(12),RA(2),RA(1),RA(0),MA(9),MA(8),CRTC_CLK);
end Behavioral;

