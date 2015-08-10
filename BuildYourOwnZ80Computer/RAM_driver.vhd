----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:35 01/14/2011 
-- Design Name: 
-- Module Name:    RAM_driver - Behavioral 
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

entity RAM_driver is
    Port ( Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  init_done : in std_logic;
			  init_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  init_Dout: out  STD_LOGIC_VECTOR (7 downto 0);
			  init_W_n : in STD_LOGIC;
			  init_R_n : in STD_LOGIC;
           Dout : inout  STD_LOGIC_VECTOR (7 downto 0); -- against I82C55.IO_DATA
			  rd:in STD_LOGIC;
			  
			  wr:in STD_LOGIC;
			  dsk_RD:in STD_LOGIC;
			  dsk_WR:in STD_LOGIC;
			  transmit : in STD_LOGIC;
			  ram_W : out  STD_LOGIC:='0'; -- sim
           ram_R : out  STD_LOGIC:='0'; -- sim
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  ram_Dout : out STD_LOGIC_VECTOR (7 downto 0);
			  reset:in  STD_LOGIC
			  );
end RAM_driver;

architecture Behavioral of RAM_driver is
begin

ram_W<= (not(init_done) and not(init_W_n)) or (init_done and not(reset) and ((not(transmit) and wr and not(rd)) or (transmit and dsk_WR and not(dsk_RD))));
ram_R<= (not(init_done) and not(init_R_n)) or (init_done and not(reset) and ((not(transmit) and rd and not(wr)) or (transmit and dsk_RD and not(dsk_WR))));
--	ram_W <= not (init_W_n) when init_done='0' else '0' when reset ='1' else '1' when (transmit='0' and wr='1' and rd='0' and ROMarea='0') or (transmit='1' and dsk_WR='1' and dsk_RD='0') else '0';
--	ram_R<= not (init_R_n) when init_done='0' else '0' when reset ='1' else '1' when (transmit='0' and rd='1' and wr='0') or (transmit='1' and dsk_RD='1' and dsk_WR='0') else '0';
	Dout<=(others=>'L') when init_done='0' or reset='1' else ram_Din when (transmit='0' and rd='1' and wr='0') else ram_Din when (transmit='1' and dsk_RD='1' and dsk_WR='0') else (others=>'Z');



	ram_Dout<= init_Din when init_done='0' else Din when (transmit='0' and wr='1' and rd='0') else Din when (transmit='1' and dsk_WR='1' and dsk_RD='0') else (others=>'Z');
	init_Dout <= ram_Din when init_done='0' else (others=>'0');
	
	
	
	
end Behavioral;

