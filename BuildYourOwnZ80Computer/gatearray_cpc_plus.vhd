library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use ieee.std_logic_arith.all; -- conv
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- conv integer unsigned

entity gatearray_cpc_plus is
    Port ( clk : in  STD_LOGIC;
           M1_n : out  STD_LOGIC;
           WAIT_n : out  STD_LOGIC;
           INT_n : out  STD_LOGIC;
           SYNC : out  STD_LOGIC
           );
end gatearray_cpc_plus;

architecture Behavioral of gatearray_cpc_plus is
begin
results_from_javacpc:process(clk) is
		file vector_file: text open read_mode is "CPCPLUS_ext_1.txt"; --CPC_PLUS.txt";
		variable file_line: line;
		variable str_value: string(8 downto 1);
		variable std_value: std_logic_vector(7 downto 0):=(others=>'0');
		variable line_count:integer:=0;
begin
	if rising_edge(clk) then
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
				 SYNC<=std_value(7);
				 M1_n<=std_value(6);
				 INT_n<=std_value(5);
				 WAIT_n<=std_value(4);
				 line_count:=line_count+1;
			end if;
		end if;
end process;
end Behavioral;


