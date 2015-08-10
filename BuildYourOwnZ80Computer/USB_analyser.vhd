----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:18 09/22/2011 
-- Design Name: 
-- Module Name:    USB_analyser - Behavioral 
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

entity USB_analyser is
Port (
	CLK:in std_logic;
	-- 60MHz=50*6/5 MHz -- 60/5=12 MHz
	--7.5MHz=50*6/40MHz --7.5/5=1.5MHz
	USB_DATA:inout std_logic_vector(1 downto 0);
	clk_write:out std_logic;
	octet:out std_logic_vector(15 downto 0)
);
end USB_analyser;

architecture Behavioral of USB_analyser is


begin

USB_DATA<="ZZ"; -- avant s'y était pas, et il y a avait un pulldown à USB_DATA(1), mais comme ça ça marche et c'est plus dans la vision phylosophique de la spec

process(CLK) is
-- écouter "10" jusqu'à premier changement (liaison au PC)
--buffiser (DmDp)(DmDp)(DmDp)(DmDp) dans un octer
variable memoire:std_logic_vector(15 downto 0);
variable memoire2:std_logic_vector(15 downto 0);
variable step_memoire:integer range 0 to 7:=0;
variable adjime:boolean:=false;
variable stable_reset:integer range 0 to 512:=0;
begin
if rising_edge(CLK) then
	if USB_DATA="00" then
		if stable_reset<512 then
			stable_reset:=stable_reset+1;
		end if;
	else
		if stable_reset<512 then
			stable_reset:=0;
		end if;
	end if;
	if USB_DATA="10" and stable_reset=512 then
		adjime:=true;
	end if;
	if adjime then
		memoire((7-step_memoire)*2):=USB_DATA(0);
		memoire((7-step_memoire)*2+1):=USB_DATA(1);
		if step_memoire=7 then
			memoire2:=memoire; -- dans le bonne ordre déjà...
		end if;
		if step_memoire=0 then
			octet<=memoire2;
			clk_write<='1';
		else
			if step_memoire=4 then
				clk_write<='0';
			end if;
		end if;
		if step_memoire=7 then
			step_memoire:=0;
		else
			step_memoire:=step_memoire+1;
		end if;

	end if;
end if;
end process;


end Behavioral;

