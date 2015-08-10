----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:00 01/12/2011 
-- Design Name: 
-- Module Name:    simple_GateArray - Behavioral 
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

entity simple_GateArray is
    Port ( CLK:in STD_LOGIC;
				reset:in STD_LOGIC;
			  IO_REQ_W : in STD_LOGIC;
			  A15_A14 : in  STD_LOGIC_VECTOR (1 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           lowerROMen : out  STD_LOGIC:='1';
           upperROMen : out  STD_LOGIC:='1';
           MODE : out  STD_LOGIC_VECTOR (1 downto 0):="00";
			  RAMbank:out STD_LOGIC_VECTOR(2 downto 0):="000"
			  );
end simple_GateArray;

architecture Behavioral of simple_GateArray is
begin
	--http://quasar.cpcscene.com/doku.php?id=iassem:interruptions
	simple_GateArray_process : process(CLK) is
		variable MODE_mem:STD_LOGIC_VECTOR (1 downto 0):=('0','0');
		variable lowerROMen_mem:STD_LOGIC:='1'; -- init ne marche pas :='1';
		variable upperROMen_mem:STD_LOGIC:='1'; --init ne marche pas :='1'; -- je suppose ^^
		variable RAMbank_mem:STD_LOGIC_VECTOR(2 downto 0):=(others=>'0');
	begin
		
		
		if reset='1' then
			RAMbank<=(others=>'0');
			lowerROMen<='1';
			upperROMen<='1';
			MODE<="00";
		elsif rising_edge(CLK) then
			if IO_REQ_W='1' and A15_A14(1) = '0' and A15_A14(0) = '1' then --7Fxx gate array --
				if D(7) ='0' then
					-- ink -- osef
				else
					--http://www.cpctech.org.uk/docs/garray.html
					if D(6) = '0' then --RMR
						lowerROMen_mem:=not(D(2));
						upperROMen_mem:=not(D(3));
						lowerROMen<=lowerROMen_mem;
						upperROMen<=upperROMen_mem;
						MODE_mem:=D(1 downto 0);
						if MODE_mem="11" then
							MODE_mem:="00";
						end if;
						MODE<=MODE_mem;
					--http://www.cpctech.org.uk/docs/mem.html
					elsif D(6) = '1' then -- MMR
						-- rambank problème repousé au composant suivant ;)
						-- cpcwiki dit osef : if D(4 downto 2)="001" or D(4 downto 2)="000" then
						RAMbank_mem:=D(2 downto 0);
						RAMbank<=RAMbank_mem;
					end if;
				end if;
			end if;
		end if;	
		
	end process simple_GateArray_process;

end Behavioral;

