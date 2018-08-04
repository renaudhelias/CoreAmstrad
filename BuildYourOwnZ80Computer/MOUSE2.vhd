library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOUSE2 is
	 Generic (
           SIZE : integer:=8;
           ZOOM : integer:=2; -- 2^ZOOM= 2*2 *2*2
           POSX_MAX : integer:=255*2*2; --*2*2;
			  POSY_MAX : integer:=255*2*2; --*2*2; --63*2*2*2*2;
			  START_POSX : integer:=100*2*2; --*2*2;
			  START_POSY : integer:=30*2*2 --*2*2
	 );
    Port ( clk : in std_logic;
           ps2clk : in  std_logic;
           ps2data : in  std_logic;
			  mouse_data : out std_logic_vector(SIZE*2 downto 0)
           );
end MOUSE2;

architecture Behavioral of MOUSE2 is


signal posx : std_logic_vector(SIZE-1 downto 0);
signal posy : std_logic_vector(SIZE-1 downto 0);
signal click : std_logic;

signal ps2clk_i:std_logic;
signal ps2data_i:std_logic;

constant WATCHDOG_MAX:integer:=10;
begin

mouse_data<= click & posx & posy;

process (clk) is
begin
	if rising_edge(clk) then
		ps2clk_i<=ps2clk;
		ps2data_i<=ps2data;
	end if;
end process;

process(ps2clk_i) is
	variable char : std_logic_vector(10 downto 0);
	variable counter : integer range 0 to 10;
	variable step : integer range 0 to 2;
	variable watchdog : integer range 0 to WATCHDOG_MAX:=0;
	
	variable click_mem:std_logic;
	
	variable XS:std_logic; -- '1' negative X
	variable YS:std_logic;
	variable XV:std_logic; -- '1' overflow X
	variable YV:std_logic;
	
	variable posx_mem : std_logic_vector(ZOOM+SIZE-1 downto 0):=conv_std_logic_vector(START_POSX,ZOOM+SIZE);
   variable posy_mem : std_logic_vector(ZOOM+SIZE-1 downto 0):=conv_std_logic_vector(START_POSY,ZOOM+SIZE);
	
	variable increment_pos:std_logic_vector(ZOOM+SIZE-1 downto 0):=(others=>'0');
	variable decrement_pos:std_logic_vector(ZOOM+SIZE-1 downto 0):=(others=>'1');
begin
	if falling_edge(ps2clk_i) then
		if counter<10 then
			if counter=0 then
				if ps2data_i='0' then
					char(counter):=ps2data_i;
					if watchdog>0 and watchdog<WATCHDOG_MAX then
						watchdog:=1;
					else
						watchdog:=0;
						counter:=counter+1;
					end if;
				elsif watchdog<WATCHDOG_MAX then
					step:=0;
					watchdog:=watchdog+1; -- after WATCHDOG_MAX '1', data is safe/synchronized data.
				end if;
			else
				char(counter):=ps2data_i;
				counter:=counter+1;
			end if;
		else
			-- new complete char here
			char(counter):=ps2data_i;
			counter:=0;
			case step is
				when 0=>
					XS:=char(5);
					YS:=char(6);
					XV:=char(7);
					YV:=char(8);
					--parity char[9]...
					if char(3)='0' and char(4)='1' and char(10)='1' and XV='0' and YV='0' then
						click_mem:=char(1) or char(2);
						step:=1;
					else
						watchdog:=1;
					end if;
				when 1=>
					increment_pos(7 downto 0):=char(8 downto 1);
					decrement_pos(7 downto 0):=char(8 downto 1);
					if XS='0' then
						if conv_integer(increment_pos)+conv_integer(posx_mem)>POSX_MAX then
							--posx_mem:=conv_std_logic_vector(POSX_MAX,ZOOM+SIZE);
							posx_mem:=(others=>'0');
						else
							posx_mem:=posx_mem+increment_pos;
						end if;
					else
						if posx_mem+decrement_pos>posx_mem then
							--posx_mem:=(others=>'0');
							posx_mem:=conv_std_logic_vector(POSX_MAX,ZOOM+SIZE);
						else
							posx_mem:=posx_mem+decrement_pos;
						end if;
					end if;
					step :=2;
				when 2=>
					increment_pos(7 downto 0):=char(8 downto 1);
					decrement_pos(7 downto 0):=char(8 downto 1);
					if YS='0' then
						if conv_integer(increment_pos)+conv_integer(posy_mem)>POSY_MAX then
							--posy_mem:=conv_std_logic_vector(POSY_MAX,ZOOM+SIZE);
							posy_mem:=(others=>'0');
						else
							posy_mem:=posy_mem+increment_pos;
						end if;
					else
						if posy_mem+decrement_pos>posy_mem then
							--posy_mem:=(others=>'0');
							posy_mem:=conv_std_logic_vector(POSY_MAX,ZOOM+SIZE);
						else
							posy_mem:=posy_mem+decrement_pos;
						end if;
					end if;
					step :=0;
			end case;
		end if;
		posx<=posx_mem(ZOOM+SIZE-1 downto ZOOM);
		posy<=posy_mem(ZOOM+SIZE-1 downto ZOOM);
		click<=click_mem;
	end if;
end process;
	
end Behavioral;

