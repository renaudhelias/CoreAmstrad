----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:20 02/24/2015 
-- Design Name: 
-- Module Name:    NEXYS4_SDRAM - Behavioral 
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

entity NEXYS4_SDRAM is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           w : in  STD_LOGIC;
           r : in  STD_LOGIC;
           MemDB : inout  STD_LOGIC_VECTOR (7 downto 0);
           MemAdr : out  STD_LOGIC_VECTOR (22 downto 0);
           RamWEn : out  STD_LOGIC;
           RamOEn : out  STD_LOGIC;
           -- constants :			  
           RamLBn : out  STD_LOGIC;
           RamUBn : out  STD_LOGIC;
           RamCEn : out  STD_LOGIC;
           RamADVn : out  STD_LOGIC;
           RamCLK : out  STD_LOGIC;
           RamCRE : out  STD_LOGIC;
           MemDB_U : inout  STD_LOGIC_VECTOR (7 downto 0)
			  );
end NEXYS4_SDRAM;

architecture Behavioral of NEXYS4_SDRAM is

begin
	MemAdr<=A;
	RamWEn<=not(w);
	RamOEn<=not(r);
	Dout<=MemDB when r='1' else (others=>'0');
	MemDB<= Din when w='1' else (others=>'Z');
	
	-- constants :
	RamLBn<='0';
	RamUBn<='0';
	RamCEn<='0';
	RamADVn<='0';
	RamCLK<='0';
	RamCRE<='0';
	
	MemDB_U<=(others=>'L');
	
end Behavioral;

