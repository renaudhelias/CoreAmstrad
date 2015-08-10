----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:11:17 05/05/2011 
-- Design Name: 
-- Module Name:    T80_timing_log - Behavioral 
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
USE IEEE.STD_LOGIC_TEXTIO.ALL;
use ieee.std_logic_arith.all; -- conv
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- conv integer unsigned
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity T80_timing_log is
    Port ( clk:in std_logic;
				mem_rd : in  STD_LOGIC;
           D : out  STD_LOGIC_VECTOR (7 downto 0):=x"00";
           m1 : in  STD_LOGIC;
			  reset_n:out std_logic:='1';
			  wait_n:in std_logic
			  );
end T80_timing_log;

architecture Behavioral of T80_timing_log is



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


	T80_log:process(clk)
		variable log_state:integer range 0 to 7:=0;
		variable instruction:std_logic_vector(7 downto 0):=x"00";
		variable instructionED:boolean:=false;
		variable is_param:boolean:=false;
		variable is_ED:boolean:=false;
		
		variable was_m1_1:boolean:=true;
		variable was_mem_rd_0:boolean:=true;
		variable instruction_clk_count:integer:=0;
		variable was_wait_1:boolean:=true;
		variable wait_count:integer:=0;
		
		FILE reportfile : text OPEN WRITE_MODE IS "T80_timing.txt";
		VARIABLE befehl: line;
		
	begin
		-- pour chaque instruction
		-- si io_wr 
		
		if falling_edge(clk) then
			reset_n<='1';
		
			D<=x"00"; -- NOP or null argument
			if mem_rd='1' and was_mem_rd_0 then
				if is_param then
					D<=x"00";
				elsif instructionED and not(is_ED) then
					is_ED:=true;
					D<=x"CB";
				else
					D<=instruction;
					is_param:=true;
				end if;
			end if;
			
			if was_wait_1 and wait_n='0' then
				wait_count:=0;
			elsif not(was_wait_1) and wait_n='1' then
				if instructionED then
					write(befehl,string'("T80_ED_time_wait[0x"));
				else
					write(befehl,string'("T80_time_wait[0x"));
				end if;
				hwrite(befehl,instruction);
				write(befehl,string'("]="));
				write(befehl,wait_count);
				write(befehl,string'(";"));
writeline(reportfile,befehl);
			end if;
			if wait_n='0' then
				wait_count:=wait_count+1;
			end if;
			
			if was_m1_1 and m1='0' then
				if log_state/=3 and log_state/=7 then
					if instructionED then
						log_state:=6;
					else
						log_state:=1;
					end if;
				end if;
			end if;
			case log_state is
				when 0=> -- waiting processor reaction
					NULL;
				when 1=> -- m1
					if instruction_clk_count>0 then
						--report("instruction taken");
						write(befehl,string'("T80_time[0x"));
						hwrite(befehl,instruction);
						write(befehl,string'("]="));
						write(befehl,instruction_clk_count);
						write(befehl,string'(";"));
writeline(reportfile,befehl);
						write(befehl,now);
						write(befehl,string'("instruction numero "));
						hwrite(befehl,instruction);
						write(befehl,string'(" taken "));
						write(befehl,instruction_clk_count);
						write(befehl,string'(" clock !"));
writeline(OUTPUT,befehl); -- writes to std_output
						if instruction=x"FF" then
							log_state:=3;
						else
							instruction_clk_count:=1;
							instruction:=instruction+1;
							if instruction=x"76" then -- l'instruction halt prend en fait 4 clock, puis envoye des NOP
								instruction:=x"77";
							end if;
							log_state:=2;
						end if;
					else
						instruction_clk_count:=1;
						log_state:=2;
					end if;
					is_param:=false;
					
				when 2=> -- instruction running so so
					instruction_clk_count:=instruction_clk_count+1;
					if instruction_clk_count>100 then
						log_state:=4;
					end if;
				when 3=> -- bon bin les ED maintenant
					instructionED:=true;
					instruction_clk_count:=0;
					log_state:=0;
					instruction:=x"00";
				when 4=> -- fail
					report("instruction suck");
					write(befehl,now);
					write(befehl,string'("instruction "));
					hwrite(befehl,instruction);
					write(befehl,string'(" really suck !"));
					writeline(OUTPUT,befehl); -- writes to std_output
					log_state:=5;
				when 5=> -- failed
					reset_n<='0';
					log_state:=0;
					instruction:=instruction+1; -- on zap l'instruction qui bug
					instruction_clk_count:=0;
					-- heu is_param ? is_ED ?
					is_param:=true;
					is_ED:=true;
				when 6=> -- m1 ED
					if instruction_clk_count>0 then
						--report("instruction taken");
						write(befehl,string'("T80_time_ED[0x"));
						hwrite(befehl,instruction);
						write(befehl,string'("]="));
						write(befehl,instruction_clk_count);
						write(befehl,string'(";"));
writeline(reportfile,befehl);
						write(befehl,now);
						write(befehl,string'("instructionED numero "));
						hwrite(befehl,instruction);
						write(befehl,string'(" taken "));
						write(befehl,instruction_clk_count);
						write(befehl,string'(" clock !"));
writeline(OUTPUT,befehl); -- writes to std_output
						if instruction=x"FF" then
							log_state:=7;
						else
							instruction_clk_count:=1;
							instruction:=instruction+1;
							log_state:=2;
						end if;
					else
						instruction_clk_count:=1;
						log_state:=2;
					end if;
					is_param:=false;
					is_ED:=false;
				when 7=> --wata
					NULL;
			end case;
			
			if m1='1' then
				was_m1_1:=true;
			else
				was_m1_1:=false;
			end if;
			if mem_rd='0' then
				was_mem_rd_0:=true;
			else
				was_mem_rd_0:=false;
			end if;
			if wait_n='1' then
				was_wait_1:=true;
			else
				was_wait_1:=false;
			end if;
		end if;
	end process;

end Behavioral;


configuration test1 of T80se is
		--for BEHAVIORAL --je sait que c'est ce nom car j'ai compilé le schéma en vhdl...
			--for AmstradT80:T80se
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
				--end for;
			--end for;
		end for;
end configuration;


