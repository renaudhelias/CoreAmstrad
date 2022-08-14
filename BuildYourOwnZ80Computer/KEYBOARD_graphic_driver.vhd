--    {@{@{@{@{@{@
--  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r004
--  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
--  {@{@{@{@{@{@{@{@
--  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
--  {@{@        {@{@   Contact : renaudhelias@gmail.com
--  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
--    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
--
--
--------------------------------------------------------------------------------
-- FPGAmstrad_amstrad_motherboard.KEYBOARD_driver
-- see KEYBOARD_controller.vhd
-- see KEYBOARD_driver.vhd
-- see Keyboard.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KEYBOARD_graphic_driver is
    Port ( CLK : in  STD_LOGIC;
			  press : in STD_LOGIC;
			  unpress : in STD_LOGIC;
           keycode : in  STD_LOGIC_VECTOR (9 downto 0); -- e0 & e1 & scancode
           alrud : out  STD_LOGIC_VECTOR (4 downto 0)
			  );
end KEYBOARD_graphic_driver;

architecture Behavioral of KEYBOARD_graphic_driver is
		signal a,l,r,u,d:std_logic;
begin
	alrud <= a & l & r & u & d;
	keybscan : process(CLK)
		variable a_mem:std_logic:='0';
		variable l_mem:std_logic:='0';
		variable r_mem:std_logic:='0';
		variable u_mem:std_logic:='0';
		variable d_mem:std_logic:='0';
	begin
		if rising_edge(CLK) then
			if (press or unpress)='1' then
				case keycode(7 downto 0) is
					when x"11" =>
						-- alt
						a_mem:=press;
					when x"6B" =>
						-- left
						if a_mem='1' then
							l_mem:=press;
						end if;
					when x"74" =>
						-- right
						if a_mem='1' then
							r_mem:=press;
						end if;
					when x"75" =>
						-- up
						if a_mem='1' then
							u_mem:=press;
						end if;
					when x"72" =>
						-- down
						if a_mem='1' then
							d_mem:=press;
						end if;
					when others =>NULL;
				end case;
			end if;
			a<=a_mem and not(l_mem or r_mem or u_mem or d_mem);
			l<=l_mem;
			r<=r_mem;
			u<=u_mem;
			d<=d_mem;
		end if;
	end process;
	
end Behavioral;