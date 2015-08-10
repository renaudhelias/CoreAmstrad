----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:35 05/18/2011 
-- Design Name: 
-- Module Name:    Z80fx2bb - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Z80fx2bb is
port(
		RESET_n		: in std_logic;
		CLK_n		: in std_logic;
		CLKEN		: in std_logic;
		WAIT_n		: in std_logic;
		INT_n		: in std_logic;
		NMI_n		: in std_logic;
		BUSRQ_n		: in std_logic;
		M1_n		: out std_logic;
		MREQ_n		: out std_logic;
		IORQ_n		: out std_logic;
		RD_n		: out std_logic;
		WR_n		: out std_logic;
		RFSH_n		: out std_logic;
		HALT_n		: out std_logic;
		BUSAK_n		: out std_logic;
		A			: out std_logic_vector(15 downto 0);
		DI			: in std_logic_vector(7 downto 0);
		DO			: out std_logic_vector(7 downto 0);
		FX2BB : inout std_logic_vector(40 downto 1)
	);
end Z80fx2bb;

architecture Behavioral of Z80fx2bb is
	signal is_data_in:std_logic;
	signal is_data_out:std_logic;
begin
	-- selon http://www.zilog.com/docs/z80/um0080.pdf page 27 Z80 I/O Pin configuration
	-- system control
	FX2BB(27)<='Z' when RESET_n='1' else '0';						--PULLUP
	MREQ_n<=FX2BB(19);FX2BB(19)<='Z';
	IORQ_n<=FX2BB(20);FX2BB(20)<='Z';
	RD_n<=FX2BB(21);FX2BB(21)<='Z';
	WR_n<=FX2BB(22);FX2BB(22)<='Z';
	RFSH_n<=FX2BB(22);FX2BB(22)<='Z';	-- X
	-- CPU control
	HALT_n<=FX2BB(18);FX2BB(18)<='Z';	-- X
	FX2BB(24)<=WAIT_n;						-- 5v
	FX2BB(16)<='Z' when INT_n='1' else '0';							--PULLUP
	FX2BB(17)<=NMI_n;							-- 5v
	FX2BB(26)<='Z' when RESET_n='1' else '0';						--PULLUP
	-- CPU bus control
	FX2BB(25)<=BUSRQ_n;						-- 5v
	BUSAK_n<=FX2BB(23);FX2BB(23)<='Z';	-- X

FX2BB(6)<='Z' when CLK_n='1' else '0';							--PULLUP
--FX2BB(6)<='Z' when CLK_n='0' else '0';							--PULLUP
	FX2BB(11)<='1'; -- +5V					-- 5v
	FX2BB(29)<='0'; -- GND					-- GND
	-- address bus
	A(0)<=FX2BB(30);FX2BB(30)<='Z';
	A(1)<=FX2BB(31);FX2BB(31)<='Z';
	A(2)<=FX2BB(32);FX2BB(32)<='Z';
	A(3)<=FX2BB(33);FX2BB(33)<='Z';
	A(4)<=FX2BB(34);FX2BB(34)<='Z';
	A(5)<=FX2BB(35);FX2BB(35)<='Z';
	A(6)<=FX2BB(36);FX2BB(36)<='Z';
	A(7)<=FX2BB(37);FX2BB(37)<='Z';
	A(8)<=FX2BB(38);FX2BB(38)<='Z';
	A(9)<=FX2BB(39);FX2BB(39)<='Z';
	A(10)<=FX2BB(40);FX2BB(40)<='Z';
	A(11)<=FX2BB(1);FX2BB(1)<='Z';
	A(12)<=FX2BB(2);FX2BB(2)<='Z';
	A(13)<=FX2BB(3);FX2BB(3)<='Z';
	A(14)<=FX2BB(4);FX2BB(4)<='Z';
	A(15)<=FX2BB(5);FX2BB(5)<='Z';
	-- data bus (un peu paranoiaque mais bon) théoriquement FX2BB(14)<=DI(0);DO(0)<=FX2BB(14); devrait largement suffire
	is_data_in<=not(FX2BB(21)); -- not(RD_n)
	is_data_out<=not(FX2BB(22)); -- not(WR_n)
	FX2BB(14)<='0' when DI(0)='0' and is_data_in='1' else 'Z';DO(0)<=FX2BB(14) when is_data_out='1' else '0';	--PULLUP
	FX2BB(15)<='0' when DI(1)='0' and is_data_in='1' else 'Z';DO(1)<=FX2BB(15) when is_data_out='1' else '0';	--PULLUP
	FX2BB(12)<='0' when DI(2)='0' and is_data_in='1' else 'Z';DO(2)<=FX2BB(12) when is_data_out='1' else '0';	--PULLUP
	FX2BB(8)<='0' when DI(3)='0' and is_data_in='1' else 'Z';DO(3)<=FX2BB(8) when is_data_out='1' else '0';		--PULLUP
	FX2BB(7)<='0' when DI(4)='0' and is_data_in='1' else 'Z';DO(4)<=FX2BB(7) when is_data_out='1' else '0';		--PULLUP
	FX2BB(9)<='0' when DI(5)='0' and is_data_in='1' else 'Z';DO(5)<=FX2BB(9) when is_data_out='1' else '0';		--PULLUP
	FX2BB(10)<='0' when DI(6)='0' and is_data_in='1' else 'Z';DO(6)<=FX2BB(10) when is_data_out='1' else '0';	--PULLUP
	FX2BB(13)<='0' when DI(7)='0' and is_data_in='1' else 'Z';DO(7)<=FX2BB(13) when is_data_out='1' else '0';	--PULLUP

-- on a 4+8= 12 PULLUP, soit 12 résitances à placer sur la place d'essai
-- 1. relier les 5v
-- 2. relier GND
-- 3. relier les PULLUP (résistance entre la patte et 5v)
-- ==>tester les contacts (toucher directement les pattes de la puce z80, utiliser une led avec un long fil par exemple)
-- 4. relier le reste au FPGA
-- 5. relier les pattes du z80 ayant un pullup au FPGA
end Behavioral;

