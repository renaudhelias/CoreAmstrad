library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use ieee.std_logic_arith.all; -- conv
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- conv integer unsigned

entity USB_analyser_display is
    Port ( clk : in  STD_LOGIC;
			USB_DATA:out std_logic_vector(1 downto 0);
           display : out  STD_LOGIC_vector(7 downto 0)
           );
end USB_analyser_display;

architecture Behavioral of USB_analyser_display is
begin
results_from_javacpc:process(clk) is
		file vector_file: text open read_mode is "prococo9.txt"; --"proco11.txt";
		variable file_line: line;
		variable str_value: string(8 downto 1);
		variable std_value: std_logic_vector(7 downto 0):=(others=>'0');
		variable line_count:integer:=0;
		variable step:integer:=0;
		variable conclude:boolean:=false;
begin
	if rising_edge(clk) then
			if step=0 then
				if not endfile(vector_file) then
					readline (vector_file,file_line);
					read (file_line,str_value) ;
					 for i in str_value'range loop
						if (str_value(i) = '1') then
							 std_value(i-1) := '1';
						elsif (str_value(i) = '0') then
							 std_value(i-1) := '0';
						end if;
					 end loop;
						display<=std_value;
					 line_count:=line_count+1;
				else
					if not(conclude) then
						conclude:=true;
						report("fin de lecture");
					end if;
				end if;
			end if;
			
			 USB_DATA(1 downto 0)<=std_value(step*2+1 downto step*2);
			
			if step=3 then
				step:=0;
			else
				step:=step+1;
			end if;
		end if;
end process;
end Behavioral;


