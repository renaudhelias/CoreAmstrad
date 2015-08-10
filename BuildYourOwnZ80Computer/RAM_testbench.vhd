----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:18 01/14/2011 
-- Design Name: 
-- Module Name:    RAM_testbench - Behavioral 
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
use STD.textio.all;
use ieee.std_logic_arith.all; -- conv
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- conv integer unsigned

--at 0 ps: Note: lecture de la RAM : OK (/amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb/AmstradRAM/).
--at 0 ps: Note: lecture de la RAM : OK (/amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb/AmstradRAM/).
--at 1 ms: Note: ecriture de la RAM ? (/amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb/AmstradRAM/).
--at 1 ms(1): Note: ecriture de la RAM ... (/amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb/AmstradRAM/).
--at 1 ms(1): Note: ecriture de la RAM : OK (/amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb/AmstradRAM/).
entity RAM_testbench is
	generic(
		RAM_SIZE:integer:=128*1024+128*1024 -- 128Ko RAM & (AMSDOS BASIC OS 16Ko)  -- 64*1024+32*1024
	);
    Port ( A : in  STD_LOGIC_VECTOR (22 DOWNTO 0); --17 downto 0);
           D : inout  STD_LOGIC_VECTOR (7 downto 0);
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC;
			  RESET_n : in STD_LOGIC
			  );
end RAM_testbench;

architecture Behavioral of RAM_testbench is
		subtype ram_content_type is std_logic_vector(7 downto 0);
		type ram_type is array(0 to RAM_SIZE-1) of ram_content_type;
		signal save_all:std_logic;--:='0';
		
--		signal data:std_logic_vector(7 downto 0);
		
		
		component T80_Reg_fake is
	port(
		Clk			: in std_logic;
		CEN			: in std_logic;
		WEH			: in std_logic;
		WEL			: in std_logic;
		AddrA		: in std_logic_vector(2 downto 0);
		AddrB		: in std_logic_vector(2 downto 0);
		AddrC		: in std_logic_vector(2 downto 0);
		DIH			: in std_logic_vector(7 downto 0);
		DIL			: in std_logic_vector(7 downto 0);
		DOAH		: out std_logic_vector(7 downto 0);
		DOAL		: out std_logic_vector(7 downto 0);
		DOBH		: out std_logic_vector(7 downto 0);
		DOBL		: out std_logic_vector(7 downto 0);
		DOCH		: out std_logic_vector(7 downto 0);
		DOCL		: out std_logic_vector(7 downto 0)
	);
	end component;
		
begin


T80_Reg_fake_force_import:T80_Reg_fake PORT MAP(
		Clk=>'0',
		CEN=>'0',
		WEH=>'0',
		WEL=>'0',
		AddrA=>(others=>'0'),
		AddrB=>(others=>'0'),
		AddrC=>(others=>'0'),
		DIH=>(others=>'0'),
		DIL=>(others=>'0'),
		DOAH=>open,
		DOAL=>open,
		DOBH=>open,
		DOBL=>open,
		DOCH=>open,
		DOCL=>open
   );

ram_process:process(RESET_n,A,wr,rd,save_all) is
		file vector_file: text open read_mode is "AMSTRAD_6128_v2.txt";
		variable file_line: line;
		variable str_value: string(8 downto 1);
		variable std_value: std_logic_vector(7 downto 0):=(others=>'0');
		variable ram_values :ram_type:=(others=>(others=>'0'));
		variable line_count:integer:=0;

		file vector_file_out: text open write_mode is "AMSTRAD_ALPHA_result.txt";
		variable file_closed:boolean:=false;

begin
--http://eesun.free.fr/DOC/vhdlref/refguide/language_overview/test_benches/reading_and_writing_files_with_text_i_o.htm
		--file_open(vector_file,"fichier_binaire.txt",READ_MODE);
		if RESET_n='0' then
			while not endfile(vector_file) loop
				readline (vector_file,file_line);
				read (file_line,str_value) ;
				--report ("lecture : " & str_value);
				 for i in str_value'range loop
					if (str_value(i) = '1') then
						 std_value(i-1) := '1';
						 ram_values(line_count)(i-1) := '1';
					elsif (str_value(i) = '0') then
						 std_value(i-1) := '0';
						 ram_values(line_count)(i-1) := '0';
					end if;
				 end loop;
				 line_count:=line_count+1;
			end loop;
			report ("lecture de la RAM : OK");
		end if;
		
		if wr='1' then	
			if conv_integer(A) >= RAM_SIZE then
				-- ralenti la sim report("adresse A out of RAM range");
			else 
--				report("JACKPOT JACKPOT JACKPOT JACKPOT I write the value " & INTEGER'IMAGE(conv_integer(D)) & " at " & INTEGER'IMAGE(conv_integer(A)));
				ram_values(conv_integer(A)):=D;
			end if;
		end if;
		if rd='1' then
			if conv_integer(A) >= RAM_SIZE then
				-- ralenti la sim report("adresse A out of RAM range");
				D<=(others=>'0');
			else 
				D<=ram_values(conv_integer(A));
			end if;
		else
			D<=(others=>'Z');
		end if;

		

	if save_all='1' and not file_closed then
		report ("ecriture de la RAM ...");
	
		for c in ram_values'range loop
			for i in str_value'range loop
				if ram_values(c)(i-1) = '1' then
					str_value(i) := '1';
				elsif ram_values(c)(i-1) = '0' then
					str_value(i) := '0';
				end if;
			end loop;
			write (file_line,str_value) ;
			writeline (vector_file_out,file_line);
		end loop;
		file_close(vector_file_out);
		file_closed:=true;
		report ("ecriture de la RAM : OK");
	end if;
end process;


timeout:process is
begin
	save_all<='0';
	wait for 10us;
	save_all<='1';
	report ("ecriture de la RAM ?");
	wait;
end process;

end Behavioral;





configuration test1 of amstrad_motherboard is
		for BEHAVIORAL --je sait que c'est ce nom car j'ai compilé le schéma en vhdl...
			for AmstradT80:T80se
				for rtl
					for u0:T80
						for rtl
							for all:T80_Reg
								-- l'architecture testbench de T80_Reg est dans le fichier T80_RegX.vhdl
								-- juste avant le rtl, afin que le rtl soit pris en compte lors de la compilation finale
								use entity WORK.T80_Reg_fake(testbench);
							end for;
						end for;
					end for;
				end for;
			end for;
		end for;
end configuration;





