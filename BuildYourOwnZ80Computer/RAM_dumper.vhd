library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM_dumper is
    Port (
		-- NEXYS 2 RAM
		CLK : in  STD_LOGIC;
		CE1_n:out std_logic:='0';
		OE1_n:out std_logic:='1'; -- ram_R_n
		UB1_n:out std_logic:='0';
		LB1_n:out std_logic:='0';
		ram_W_n:out std_logic:='1';
		ADV1_n:out std_logic:='0';
		CLK1:out std_logic:='0';
		CRE1:out std_logic:='0';
		ram_A:out std_logic_vector(22 downto 0);
		ram_D_U: inout std_logic_vector(7 downto 0);
		ram_D_L: inout std_logic_vector(7 downto 0);
		
		-- SD CARD
		sd_CLK:out std_logic:='0';
		sd_ready:in std_logic;
		sd_busy:in std_logic;
		sd_A:out std_logic_vector(23 downto 0);--:=(others=>'0');
		sd_D:out std_logic_vector(7 downto 0);--:=(others=>'0');
		sd_W:out std_logic:='0';
		sd_special_W:out std_logic:='0';
		
		LEDS:out std_logic_vector(7 downto 0) --:=(others=>'0')
		
	 );
end RAM_dumper;

architecture Behavioral of RAM_dumper is
	signal ram_R_n:std_logic:='1';
begin
	OE1_n<=ram_R_n;
	ram_D_L<=(others=>'Z');
	ram_D_U<=(others=>'Z');
	
process(CLK) is
	variable address:STD_LOGIC_VECTOR (23 downto 0):=(others=>'0');
	variable step_flux:integer range 0 to 11:=0;
	variable last_busy:std_logic:='1';
	variable data:std_logic_vector(15 downto 0);
begin
	if rising_edge(CLK) then
		sd_W<='0';
		sd_special_W<='0';
		sd_CLK<='0';
	
		ram_R_n<='1';
		
		if sd_ready='1' then
			case step_flux is
				when 0=>
					if sd_busy='0' and last_busy='1' then
						ram_A<=address(23 downto 1);
						ram_R_n<='0';
						step_flux:=1;
					end if;
				when 1=>
					data:=ram_D_U & ram_D_L;
					step_flux:=2;
				when 2=>
					sd_W<='1';
					sd_CLK<='1';
					sd_A<=address;
					sd_D<=data(15 downto 8);
					address:=address+1;
					step_flux:=3;
				when 3=>
					if sd_busy='0' and last_busy='1' then
						sd_W<='1';
						sd_CLK<='1';
						sd_A<=address;
						sd_D<=data(7 downto 0);
						address:=address+1;
						step_flux:=4;
					end if;
				when 4=>
					if sd_busy='0' and last_busy='1' then
						step_flux:=5;
					end if;
				when 5=>
					ram_A<=address(23 downto 1);
					ram_R_n<='0';
					step_flux:=6;
				when 6=>
					data:=ram_D_U & ram_D_L;
					step_flux:=7;
					if address(8 downto 0)="111111110" then
						step_flux:=9;
					end if;
				when 7=>
						sd_special_W<='1';
						sd_A<=address;
						sd_D<=data(15 downto 8);
						address:=address+1;
						step_flux:=8;
				when 8=>
						sd_special_W<='1';
						sd_A<=address;
						sd_D<=data(7 downto 0);
						address:=address+1;
						step_flux:=5;
				when 9=>
					if sd_busy='0' then
						sd_W<='1';
						sd_CLK<='1';
						sd_A<=address;
						sd_D<=data(15 downto 8);
						address:=address+1;
						step_flux:=10;
					end if;
				when 10=>
					if sd_busy='0' then
						sd_W<='1';
						sd_CLK<='1';
						sd_A<=address;
						sd_D<=data(7 downto 0);
						address:=address+1;
						if conv_integer(address)=0 then
							step_flux:=11;
						else
							step_flux:=0;
						end if;
					end if;
				when 11=>
					-- c fini
					address(23 downto 16):="11000011";
			end case;
			
			LEDS<=address(23 downto 16);
			last_busy:=sd_busy;
		end if;
	end if;
end process;
	

end Behavioral;

