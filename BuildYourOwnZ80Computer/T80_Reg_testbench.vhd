----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:29 01/18/2011 
-- Design Name: 
-- Module Name:    T80_Reg_testbench - Behavioral 
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
architecture testbench of T80_Reg is

	component fake_RAM16X1D
		port(
			DPO		: out std_ulogic;
			SPO		: out std_ulogic;
			A0		: in std_ulogic;
			A1		: in std_ulogic;
			A2		: in std_ulogic;
			A3		: in std_ulogic;        
			D		: in std_ulogic;
			DPRA0	: in std_ulogic;
			DPRA1	: in std_ulogic;
			DPRA2	: in std_ulogic;
			DPRA3	: in std_ulogic;
			WCLK	: in std_ulogic;        
			WE		: in std_ulogic);
	end component;

	signal	ENH		: std_logic;
	signal	ENL		: std_logic;

begin

	ENH <= CEN and WEH;
	ENL <= CEN and WEL;

	bG1: for I in 0 to 7 generate
	begin
		Reg1H : fake_RAM16X1D
			port map(
			DPO => DOBH(i),
			SPO => DOAH(i),
			A0 => AddrA(0),
			A1 => AddrA(1),
			A2 => AddrA(2),
			A3 => '0',
			D => DIH(i),
			DPRA0 => AddrB(0),
			DPRA1 => AddrB(1),
			DPRA2 => AddrB(2),
			DPRA3 => '0',
			WCLK => Clk,
			WE => ENH);
		Reg1L : fake_RAM16X1D
			port map(
			DPO => DOBL(i),
			SPO => DOAL(i),
			A0 => AddrA(0),
			A1 => AddrA(1),
			A2 => AddrA(2),
			A3 => '0',
			D => DIL(i),
			DPRA0 => AddrB(0),
			DPRA1 => AddrB(1),
			DPRA2 => AddrB(2),
			DPRA3 => '0',
			WCLK => Clk,
			WE => ENL);
		Reg2H : fake_RAM16X1D
			port map(
			DPO => DOCH(i),
			SPO => open,
			A0 => AddrA(0),
			A1 => AddrA(1),
			A2 => AddrA(2),
			A3 => '0',
			D => DIH(i),
			DPRA0 => AddrC(0),
			DPRA1 => AddrC(1),
			DPRA2 => AddrC(2),
			DPRA3 => '0',
			WCLK => Clk,
			WE => ENH);
		Reg2L : fake_RAM16X1D
			port map(
			DPO => DOCL(i),
			SPO => open,
			A0 => AddrA(0),
			A1 => AddrA(1),
			A2 => AddrA(2),
			A3 => '0',
			D => DIL(i),
			DPRA0 => AddrC(0),
			DPRA1 => AddrC(1),
			DPRA2 => AddrC(2),
			DPRA3 => '0',
			WCLK => Clk,
			WE => ENL);
	end generate;

end;