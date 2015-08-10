----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:47 01/18/2011 
-- Design Name: 
-- Module Name:    fake_ram16x1d - Behavioral 
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

entity fake_ram16x1d is
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
end fake_ram16x1d;

architecture Behavioral_blackbox of fake_ram16x1d is
	signal a_wr:STD_LOGIC_VECTOR(3 downto 0);
	signal a_rd:STD_LOGIC_VECTOR(3 downto 0);
begin
a_wr<=(A0, A1, A2, A3);
a_rd<=(DPRA0, DPRA1, DPRA2, DPRA3);

	process (WCLK,a_wr,a_rd) is
		variable ram_mem:STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
	begin
		
		DPO<=ram_mem(conv_integer(a_wr));
		SPO<=ram_mem(conv_integer(a_rd));
		if rising_edge(WCLK) and WE='1' then
			if D='0' then
				ram_mem(conv_integer(a_wr)):='0';
			end if;
			if D='1' then
				ram_mem(conv_integer(a_wr)):='1';
			end if;
		end if;
	end process;
end Behavioral_blackbox;

