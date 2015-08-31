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
-- FPGAmstrad_amstrad_motherboard.AmstradRAMROM
-- RAM ROM mapping split
-- see simple_GateArray.vhd
-- see ROMselect.vhd
-- see AmstradRAMDSK.vhd
-- see RAM_driver.vhd
-- see asdram.v DELTA_ASYNC
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Amstrad ADDRESS SOLVER

entity AmstradRAMROM is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           wr_z80 : in STD_LOGIC;
			  wr_io_z80 : in STD_LOGIC;
           lowerROMen : in  STD_LOGIC;
           upperROMen : in  STD_LOGIC;
           ram_A : out  STD_LOGIC_VECTOR (22 downto 0);
			  RAMbank:in STD_LOGIC_VECTOR (2 downto 0);
			  RAMbank512:in STD_LOGIC_VECTOR (2 downto 0);
			  ROMbank:in STD_LOGIC_VECTOR (7 downto 0) -- upper ROM number
			  );
end AmstradRAMROM;


architecture Behavioral of AmstradRAMROM is

begin
-- please note here the wr signal... changing address in consequence.
	ram_A(22 downto 14)<=b"0000000" & b"00" when wr_z80='0' and lowerROMen='1' and (A(15)='0' and A(14)='0') -- lowerROM
		
--public class AmstradROMBank {
--	public static void main(String [] args) {
--		String hexa="0123456789ABCDEF";
--		for (int d1=0;d1<hexa.length();d1++) {
--			for (int d0=0;d0<hexa.length();d0++) {
--				String h = ""+hexa.charAt(d1)+hexa.charAt(d0);
--				int n=d1*hexa.length()+d0;
--				System.out.println("else b\"1\" & x\""+h+"\" when wr_z80='0' and upperROMen='1' and ROMbank=x\""+h+"\" and (A(15)='1' and A(14)='1') and ROMMask("+n+")='1'--upperROM"+n);
--			}
--		}
--	}
--}

else b"1" & ROMbank when wr_z80='0' and upperROMen='1' and (A(15)='1' and A(14)='1') --upperROMFF
		
		
-- "001" dsk_A(19:0) DSK_A
-- "0000000" "xx" ROMBase L U0 U7 U1
-- "0000001" "xx" ROMBase 4 5 6 7
-- "0000010" "xx" RAMBase
-- "0000011" "xx" RAMBank page 0
-- "0000111" "xx" RAMBank page 1
-- "0001111" "xx" RAMBank page 3
-- "0101111" "xx" RAMBank page 7
-- "100000000"    ROMBank 0-255

		
-- cpcWiki
-- http://www.cpcwiki.eu/index.php/Gate_Array
-- -Address-     0      1      2      3      4      5      6      7
-- 0000-3FFF   RAM_0  RAM_0  RAM_4  RAM_0  RAM_0  RAM_0  RAM_0  RAM_0
-- 4000-7FFF   RAM_1  RAM_1  RAM_5  RAM_3  RAM_4  RAM_5  RAM_6  RAM_7
-- 8000-BFFF   RAM_2  RAM_2  RAM_6  RAM_2  RAM_2  RAM_2  RAM_2  RAM_2
-- C000-FFFF   RAM_3  RAM_7  RAM_7  RAM_7  RAM_3  RAM_3  RAM_3  RAM_3
--http://www.grimware.org/doku.php/documentations/devices/gatearray
--see also Quazar legends

		-- 0 : OK
		else b"00000" & b"1000" when RAMbank="000" and (A(15)='0' and A(14)='0')
		else b"00000" & b"1001" when RAMbank="000" and (A(15)='0' and A(14)='1')
		else b"00000" & b"1010" when RAMbank="000" and (A(15)='1' and A(14)='0')
		else b"00000" & b"1011" when RAMbank="000" and (A(15)='1' and A(14)='1')
		-- 1 : OK
		else b"00000" & b"1000" when RAMbank="001" and (A(15)='0' and A(14)='0')
		else b"00000" & b"1001" when RAMbank="001" and (A(15)='0' and A(14)='1')
		else b"00000" & b"1010" when RAMbank="001" and (A(15)='1' and A(14)='0')
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1111" when RAMbank="001" and (A(15)='1' and A(14)='1')
		-- 2 : OK
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1100" when RAMbank="010" and (A(15)='0' and A(14)='0')

		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1101" when RAMbank="010" and (A(15)='0' and A(14)='1')

		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1110" when RAMbank="010" and (A(15)='1' and A(14)='0')

		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1111" when RAMbank="010" and (A(15)='1' and A(14)='1')
		-- 3 : OK
		else b"00000" & b"1000" when RAMbank="011" and (A(15)='0' and A(14)='0') --RAM_0 
		else b"00000" & b"1011" when RAMbank="011" and (A(15)='0' and A(14)='1') --RAM_3
		else b"00000" & b"1010" when RAMbank="011" and (A(15)='1' and A(14)='0') --RAM_2
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1111" when RAMbank="011" and (A(15)='1' and A(14)='1')
		
		-- 4 5 6 7 : OK
		else b"00000" & b"1000" when RAMbank="100" and (A(15)='0' and A(14)='0')
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1100" when RAMbank="100" and (A(15)='0' and A(14)='1')
		else b"00000" & b"1010" when RAMbank="100" and (A(15)='1' and A(14)='0')
		else b"00000" & b"1011" when RAMbank="100" and (A(15)='1' and A(14)='1')

		else b"00000" & b"1000" when RAMbank="101" and (A(15)='0' and A(14)='0')
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1101" when RAMbank="101" and (A(15)='0' and A(14)='1')
		else b"00000" & b"1010" when RAMbank="101" and (A(15)='1' and A(14)='0')
		else b"00000" & b"1011" when RAMbank="101" and (A(15)='1' and A(14)='1')

		else b"00000" & b"1000" when RAMbank="110" and (A(15)='0' and A(14)='0')
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1110" when RAMbank="110" and (A(15)='0' and A(14)='1')
		else b"00000" & b"1010" when RAMbank="110" and (A(15)='1' and A(14)='0')
		else b"00000" & b"1011" when RAMbank="110" and (A(15)='1' and A(14)='1')

		else b"00000" & b"1000" when RAMbank="111" and (A(15)='0' and A(14)='0')
		else b"0" & RAMbank512(2) & "0" & RAMbank512(1 downto 0) & b"1111" when RAMbank="111" and (A(15)='0' and A(14)='1')
		else b"00000" & b"1010" when RAMbank="111" and (A(15)='1' and A(14)='0')
		else b"00000" & b"1011" when RAMbank="111" and (A(15)='1' and A(14)='1');
		
	ram_A(13 downto 0)<=A(13 downto 0);
	
end Behavioral;
