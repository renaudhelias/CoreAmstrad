----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:20 01/19/2011 
-- Design Name: 
-- Module Name:    KEYBOARD_driver - Behavioral 
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

entity KEYBOARD_driver is
    Port ( CLK : in  STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in  STD_LOGIC;
			  e0 : in STD_LOGIC;
			  e1 : in STD_LOGIC;
			  press : in STD_LOGIC;
			  unpress : in STD_LOGIC;
           portC : in  STD_LOGIC_VECTOR (3 downto 0);
           ScanCode : in  STD_LOGIC_VECTOR (7 downto 0);
           portA : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end KEYBOARD_driver;

architecture Behavioral of KEYBOARD_driver is
	signal com2:STD_LOGIC;
	signal common:STD_LOGIC;
begin
	com2<='1' when (portC(3)='0' and portC(2)='1' and portC(1)='1' and portC(0)='0') else '0';
	common<='1' when (portC(3)='1' and portC(2)='0' and portC(1)='0' and portC(0)='1') else '0';
	
	process(CLK,reset)
		variable scancode_mem:STD_LOGIC_VECTOR (7 downto 0);
		
		variable scanL:integer range 0 to 15;
		variable scanH:integer range 0 to 15;
		variable inputL:integer range 0 to 15;
		constant KEY_E0:STD_LOGIC_VECTOR(1 downto 0):="01";
		constant KEY_E1:STD_LOGIC_VECTOR(1 downto 0):="10";
		constant KEY_E0_INTEGER:integer:=256;
		constant KEY_E1_INTEGER:integer:=512;
		
		constant K:STD_LOGIC_VECTOR(1 downto 0):="00";
		-- mauvais CLK pour rafraichir keyboard102_pressing, il faudrait du pseudo PS2_CLK
		variable keyboard102_pressing:STD_LOGIC_VECTOR(0 to 1024-1); -- 9:0 combinaisons
		type amstrad_decode_type is array(0 to 15,0 to 7) of STD_LOGIC_VECTOR(9 downto 0); --integer range 0 to 127;
		constant NO_KEY:STD_LOGIC_VECTOR(9 downto 0):=K & x"00"; -- il n'y a pas de touche codé 0 sur le clavier PC 102 touches
		--http://www.beyondlogic.org/keyboard/keybrd.htm
		constant amstrad_decode:amstrad_decode_type:=(
			(KEY_E0 & x"75",KEY_E0 & x"74",KEY_E0 & x"72",K & x"7D",K & x"74",K & x"7A",KEY_E0 & x"5A",K & x"71"),--  0 ligne 19 /\ -> \/ 9 6 3 Enter .
			(KEY_E0 & x"6B",NO_KEY,K & x"6C",K & x"75",K & x"73",K & x"69",K & x"72",K & x"70"), --  1 ligne 18 <= COPY 7 8 5 1 2 0
			(KEY_E0 & x"71",K & x"54",K & x"5A",K & x"5B",K & x"6B",K & x"12",K & x"5D",K & x"14"), --  2 ligne 17 CLR [ Enter ] 4 SHIFT_LEFT \ CRTL_LEFT
			(NO_KEY,K & x"4E",K & x"52",K & x"4D",K & x"55",K & x"4C",K & x"4A",K & x"49"), --  3 ligne 16 £ - @ P + : ? >
			(K & x"45",K & x"46",K & x"44",K & x"43",K & x"4B",K & x"42",K & x"3A",K & x"41"), --  4 ligne 15 0_ 9_ O I L K M <
			(K & x"3E",K & x"3D",K & x"3C",K & x"35",K & x"33",K & x"3B",K & x"31",K & x"29"), --  5 ligne 14 8_ 7_ U Y H J N SPACE
			(K & x"36",K & x"2E",K & x"2D",K & x"2C",K & x"34",K & x"2B",K & x"32",K & x"2A"), --  6 ligne 13 6_ 5_ R T G F B V
			(K & x"25",K & x"26",K & x"24",K & x"1D",K & x"1B",K & x"23",K & x"21",K & x"22"), --  7 ligne 12 4_ 3_ E W S D C X
			(K & x"16",K & x"1E",K & x"76",K & x"15",K & x"0D",K & x"1C",K & x"58",K & x"1A"), --  8 ligne 11 1_ 2_ ESC Q TAB A CAPSLOCK Z
			(NO_KEY,NO_KEY,NO_KEY,NO_KEY,NO_KEY,NO_KEY,NO_KEY,K & x"66"), --  9 ligne 2 DEL
			(others=>NO_KEY), -- 10 osef
			(others=>NO_KEY), -- 11 osef
			(others=>NO_KEY), -- 12 osef
			(others=>NO_KEY), -- 13 osef
			(others=>NO_KEY), -- 14 osef
			(others=>NO_KEY) -- 15 osef
			
			);
	begin
		if reset='1' then
			keyboard102_pressing:=(others=>'0');
		else
			if rising_edge(CLK) then
			
			
			
				portA<=(others=>'1');
				if enable='1' then
				
					-- refresh array
					if press='1' then
						if e0='1' then
							keyboard102_pressing(KEY_E0_INTEGER+conv_integer(ScanCode(6 downto 0))):='1';
						elsif e1='1' then
							keyboard102_pressing(KEY_E1_INTEGER+conv_integer(ScanCode(6 downto 0))):='1';
						else
							keyboard102_pressing(conv_integer(ScanCode(6 downto 0))):='1';
						end if;
					end if;
					if unpress='1' then
						if e0='1' then
							keyboard102_pressing(KEY_E0_INTEGER+conv_integer(ScanCode(6 downto 0))):='0';
						elsif e1='1' then
							keyboard102_pressing(KEY_E1_INTEGER+conv_integer(ScanCode(6 downto 0))):='0';
						else
							keyboard102_pressing(conv_integer(ScanCode(6 downto 0))):='0';
						end if;
					end if;
				
					for i in 7 downto 0 loop
						if keyboard102_pressing(conv_integer(amstrad_decode(conv_integer(portC),i)))='1' then
							portA(i)<='0';
						else
							portA(i)<='1';
						end if;
					end loop;
				
--				
--					scanL:=conv_integer(ScanCode(7 downto 4));
--					scanH:=conv_integer(ScanCode(3 downto 0));
--					inputL:=conv_integer(portC);
--					if scanL>7 then
--						scanL:=scanL-8;
--					end if;
--					if scanH>7 then
--						scanH:=scanH-8;
--					end if;
--					
--					if inputL= 6 then
--						--COM2 ne rien faire
--					elsif inputL=9 then
--						--COMMON ne rien faire
--					elsif inputL>9 then
--						--out of range ne rien faire
--					elsif inputL<6 then
--						if scanL=inputL then
--							-- faire
--							portA(scanH)<='0';
--						end if;
--					else
--						if scanL=inputL-1 then
--							-- faire
--							portA(scanH)<='0';
--						end if;
--					end if;
				end if;
			end if;
		end if;
	end process;



end Behavioral;

