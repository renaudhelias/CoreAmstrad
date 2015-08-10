----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:56:00 09/22/2011 
-- Design Name: 
-- Module Name:    USB_analyser_to_RAM - Behavioral 
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
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity USB_analyser_to_RAM is
    Port ( CLK : in  STD_LOGIC;
           CLK_write : in  STD_LOGIC;
			  octet : in std_logic_vector(15 downto 0);
			  LEDS:out std_logic_vector(7 downto 0):=(others=>'0');
			  
			  
				CE1_n:out std_logic:='0';
				OE1_n:out std_logic:='1'; -- ram_R_n
				UB1_n:out std_logic:='0';
				LB1_n:out std_logic:='0';
				ram_W_n:out std_logic:='1';
				ADV1_n:out std_logic:='0';
				CLK1:out std_logic:='0';
				CRE1:out std_logic:='0';
			  
           ram_A : out  STD_LOGIC_VECTOR (22 downto 0):=(others=>'0');
           ram_D : inout  STD_LOGIC_VECTOR (7 downto 0):=(others=>'1');
			  ram_D_U : inout  STD_LOGIC_VECTOR (7 downto 0):=(others=>'1'));
end USB_analyser_to_RAM;

architecture Behavioral of USB_analyser_to_RAM is

		signal ram_W : STD_LOGIC:='0';
		 signal ram_R : STD_LOGIC:='0';

begin

ram_W_n<=not(ram_W);
OE1_n<=not(ram_R);

process(CLK) is
	variable old_clk_write:std_logic:='0';
	variable address:STD_LOGIC_VECTOR (22 downto 0):=(others=>'0');
	constant FINISH:STD_LOGIC_VECTOR (22 downto 0):=(others=>'1');
	variable operations:integer:=20;
	variable octet_mem:std_logic_vector(15 downto 0):=(others=>'0');
	--variable passe2:boolean:=false;
	--variable passe3:boolean:=false;
begin
if rising_edge(CLK) then --60MHz !
	--LEDS<=address(22 downto 22-7); parasites
	
		if address=FINISH and operations=7 then
			LEDS<=(others=>'1');
		else
		
			if CLK_write='1' and old_clk_write='0' then
				operations:=0;
				octet_mem:=octet;
				ram_D<=octet_mem(7 downto 0); -- copy
				ram_D_U<=octet_mem(15 downto 8); -- copy
				address:=address+1;
				ram_A<=address;
			end if;

	-- on a un rapport de 4
	-- on a un rapport de 8

	-- 0[123456]78 []: Wr

--			if operations=1 then
--				ram_W<='1';
--			elsif operations=7 then
--				ram_W<='0';
--			end if;

			if operations=2 then
				ram_W<='1';
			elsif operations=6 then
				ram_W<='0';
			end if;


			if operations=20 then -- jamais atteind normalement
			else
				operations:=operations+1;
			end if;


			old_clk_write:=CLK_write;
		end if;
		
end if;
end process;

end Behavioral;

