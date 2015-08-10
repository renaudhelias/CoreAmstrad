library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- MemoryDoubler : piloter une RAM16 comme si c'était une RAM8
entity MemoryDoubler is
	Generic (
		MEMORY16_SIZE : integer:=23
	);
    Port ( A : in  STD_LOGIC_VECTOR (MEMORY16_SIZE+1-1 downto 0);
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           OE : in STD_LOGIC; -- not exactly same thing than ram_W
           w : in STD_LOGIC;
           ram_W : out STD_LOGIC;
           ram_A : out  STD_LOGIC_VECTOR (MEMORY16_SIZE-1 downto 0);
           ram_D_Upper : inout  STD_LOGIC_VECTOR (7 downto 0);
           ram_D_Lower : inout  STD_LOGIC_VECTOR (7 downto 0);
           ram_EnableUpper : out STD_LOGIC;
           ram_EnableLower : out STD_LOGIC);
end MemoryDoubler;

architecture Behavioral of MemoryDoubler is
	signal Amax:STD_LOGIC;
begin
	ram_W<=w when OE='0' else '0';
	
	Amax<=A(MEMORY16_SIZE+1-1);
	
	ram_A(MEMORY16_SIZE-1 downto 0)<=A(MEMORY16_SIZE-1 downto 0);
	
	Dout<=(others=>'1') when OE='0' else ram_D_Upper when Amax='1' else ram_D_Lower;
	ram_EnableLower<='1' when Amax='0' else '0';
	ram_EnableUpper<='1' when Amax='1' else '0';

	ram_D_Lower<=Din when OE='0' and Amax='0' else (others=>'0') when OE='0' else (others=>'Z');
	ram_D_Upper<=Din when OE='0' and Amax='1' else (others=>'0') when OE='0' else (others=>'Z');
end Behavioral;

