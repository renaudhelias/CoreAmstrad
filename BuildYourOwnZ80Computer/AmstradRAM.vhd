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
-- FPGAmstrad_amstrad_motherboard.AmstradRAM
-- Detect if I am on a RAM part matching with VRAM part candidate
-- see AmstradRAMROM.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AmstradRAM is
    Port ( reset:in  STD_LOGIC;
			  
			  init_done : in std_logic; -- under time constraint test
			  init_A : in  STD_LOGIC_VECTOR (22 downto 0);
			  init_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  init_Dout: out  STD_LOGIC_VECTOR (7 downto 0);
			  init_W_n : in STD_LOGIC;
			  init_R_n : in STD_LOGIC;
           
			  A : in  STD_LOGIC_VECTOR (22 downto 0);
           rd:in STD_LOGIC; -- Z80 MEM_RD
			  wr:in STD_LOGIC; -- Z80 MEM_WR
			  Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  Dout : out  STD_LOGIC_VECTOR (7 downto 0):= (others=>'1'); -- against I82C55.IO_DATA
			  
			  ram_A : out  STD_LOGIC_VECTOR (22 downto 0);
			  ram_W : out  STD_LOGIC:='0';
           ram_R : out  STD_LOGIC:='0';
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  ram_Dout : out STD_LOGIC_VECTOR (7 downto 0)
			  
			  --vram_A:out STD_LOGIC_VECTOR (15 downto 0);
			  --vram_A_isValid:out std_logic
			  );
end AmstradRAM;

architecture Behavioral of AmstradRAM is

begin

	--vram_A(15 downto 0)<=A(15 downto 0);
	--vram_A_isValid<= init_done and not(A(22)) and not(A(21)) and not(A(20)) and not(A(19)) and not(A(18)) and A(17) and not(A(16));

	ram_A(19 downto 0)<= init_A(19 downto 0) when init_done='0' else A(19 downto 0); -- address is solving
	ram_A(22 downto 20)<=init_A(22 downto 20) when init_done='0' else A(22 downto 20);
	
	ram_W<= (not(init_done) and not(init_W_n)) or (init_done and not(reset) and (wr and not(rd)));
	ram_R<= (not(init_done) and not(init_R_n)) or (init_done and not(reset) and (rd and not(wr)));

	ram_Dout<= init_Din when init_done='0' else Din when (wr='1' and rd='0') else (others=>'0');
	init_Dout <= ram_Din when init_done='0' else (others=>'0');
	Dout<=(others=>'1') when init_done='0' or reset='1' else ram_Din when (rd='1' and wr='0') else (others=>'1');

end Behavioral;
