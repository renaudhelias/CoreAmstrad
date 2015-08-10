library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity string_to_leds is
    Port ( 
		CLK : in std_logic;
	 LEDS : out  STD_LOGIC_VECTOR (7 downto 0));
end string_to_leds;


architecture Behavioral of string_to_leds is

	subtype filename_type is string(1 to 12);
	type list_filename_type is array (natural range <>) of filename_type;
	constant list_filename_defragmented:list_filename_type(1 downto 0):=
	("OS6128  .ROM",
	 "RAM_DUMP.ROM");
	constant list_filename_fragmented:list_filename_type(1 downto 0):=
	("CHAR_ROM.BIN",
	 "TODEPLOY.BIN");
	constant list_filename_fragmented_target:list_filename_type(1 downto 0):=
	("CHAR_ROM.ROM",
	 "TODEPLOY.ROM");


begin

process(CLK) is
	constant hello:string:="OS6128  .ROM"; -- space is 40 but should be 20 by there, let's make a mask also...
	variable cursor:std_logic_vector(25 downto 0):=(others=>'0');
	constant cursor_compare:std_logic_vector(25 downto 0):=(others=>'0');
	variable a:integer:=0;
	
	
	
begin
	if rising_edge(CLK) then
		cursor:=cursor+1;
		if cursor=cursor_compare then
			a:=a+1;
			LEDS<=conv_std_logic_vector(CHARACTER'pos(list_filename_fragmented(1)(a)),8);
			if a=hello'length then
				a:=0;
			end if;
		end if;
	end if;
end process;
end Behavioral;

