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
-- MIST_*.vhd : MiST-board simple adapter (glue-code)
-- This type of components is only used on my main schematic.
-- Policy here is generating all clocks from one component only, this way you can apply "Time Constraints" more easily.
-- Policy here is not setting a "not(CLK)" outside of here. It's a true clock factory component.
-- nCLK4MHz does feed Z80 slave components... that shall be under "Time Constraints", in order to debug/optimize them easily.
-- CLK4MHz does feed Z80 component, in what I thrust completely, not needing then to being under "Time Constraints" law.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

LIBRARY altera_mf;
USE altera_mf.all;

entity MIST_clocks is
    Port ( CLOCK_27 : in  STD_LOGIC_VECTOR (1 downto 0); --CLOCK_27(0)
           reset : in std_logic:='0'; -- '0'
           --SPI_SCK : in  STD_LOGIC; -- useless here ? 24MHz
           ps2_clk : out  STD_LOGIC; -- 12-16khz provided by core
			  CLK4MHz : out  STD_LOGIC; -- Z80 (don't care about Time Constraints)
			  nCLK4MHz : out  STD_LOGIC; -- not Z80 (under Time Constraints)
           CLK8MHz : out  STD_LOGIC; -- Bootloader (nCLK4MHz)
           nCLK8MHz : out  STD_LOGIC; -- Bootloader (CLK4MHz)
			  CLK25MHz : out  STD_LOGIC; -- VGA
			  nCLK25MHz : out  STD_LOGIC;
			  pclk : out STD_LOGIC; -- CLK25MHz (VGA)
			  palette_CLK : out  STD_LOGIC; --nCLK4MHz
			  vram_CLK : out  STD_LOGIC; --nCLK4MHz
			  SDRAM_CLK : out  STD_LOGIC;
			  sdram_v_clk : out STD_LOGIC;
			  sdram_v_clkref : out STD_LOGIC;
			  --sdram_v_init : out STD_LOGIC;
			  CLK_PWM: out STD_lOGIC;
			  CLK16MHz : out STD_LOGIC -- TV mode
           );
end MIST_clocks;

architecture Behavioral of MIST_clocks is

	-- from OneChipMSX-master/Board/mist/PLL4X2.vhd
	--c0:4.007067MHz
	--c1:25.2MHz
	--c2:114.428571MHz
	--c3:16.020000MHz
	signal c0 : std_logic;--27MHz 20/135 =4MHz     Z80/bootloader
	signal c1 : std_logic;--27MHz 125/135=25MHz    VGA
	signal c2 : std_logic;--27MHz 572/135=114.4MHz SDRAM
	signal c3 : std_logic;--27MHz 1/2250 =12kHz    TV mode 16MHz - (not keyboard finally)
	signal pll_locked : std_logic;
	
	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL inclk0	: STD_LOGIC_VECTOR (1 DOWNTO 0);

	COMPONENT altpll
	GENERIC (
		bandwidth_type		: STRING;
		clk0_divide_by		: NATURAL;
		clk0_duty_cycle		: NATURAL;
		clk0_multiply_by		: NATURAL;
		clk0_phase_shift		: STRING;
		clk1_divide_by		: NATURAL;
		clk1_duty_cycle		: NATURAL;
		clk1_multiply_by		: NATURAL;
		clk1_phase_shift		: STRING;
		clk2_divide_by		: NATURAL;
		clk2_duty_cycle		: NATURAL;
		clk2_multiply_by		: NATURAL;
		clk2_phase_shift		: STRING;
		clk3_divide_by		: NATURAL;
		clk3_duty_cycle		: NATURAL;
		clk3_multiply_by		: NATURAL;
		clk3_phase_shift		: STRING;
		compensate_clock		: STRING;
		inclk0_input_frequency		: NATURAL;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		operation_mode		: STRING;
		pll_type		: STRING;
		port_activeclock		: STRING;
		port_areset		: STRING;
		port_clkbad0		: STRING;
		port_clkbad1		: STRING;
		port_clkloss		: STRING;
		port_clkswitch		: STRING;
		port_configupdate		: STRING;
		port_fbin		: STRING;
		port_inclk0		: STRING;
		port_inclk1		: STRING;
		port_locked		: STRING;
		port_pfdena		: STRING;
		port_phasecounterselect		: STRING;
		port_phasedone		: STRING;
		port_phasestep		: STRING;
		port_phaseupdown		: STRING;
		port_pllena		: STRING;
		port_scanaclr		: STRING;
		port_scanclk		: STRING;
		port_scanclkena		: STRING;
		port_scandata		: STRING;
		port_scandataout		: STRING;
		port_scandone		: STRING;
		port_scanread		: STRING;
		port_scanwrite		: STRING;
		port_clk0		: STRING;
		port_clk1		: STRING;
		port_clk2		: STRING;
		port_clk3		: STRING;
		port_clk4		: STRING;
		port_clk5		: STRING;
		port_clkena0		: STRING;
		port_clkena1		: STRING;
		port_clkena2		: STRING;
		port_clkena3		: STRING;
		port_clkena4		: STRING;
		port_clkena5		: STRING;
		port_extclk0		: STRING;
		port_extclk1		: STRING;
		port_extclk2		: STRING;
		port_extclk3		: STRING;
		self_reset_on_loss_lock		: STRING;
		width_clock		: NATURAL
	);
	PORT (
			areset	: IN STD_LOGIC ;
			clk	: OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
			inclk	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			locked	: OUT STD_LOGIC 
	);
	END COMPONENT;

begin

	c0    <= sub_wire0(0);--27MHz 20/135 =4MHz     Z80/bootloader
	c1    <= sub_wire0(1);--27MHz 125/135=25MHz    VGA
	c2    <= sub_wire0(2);--27MHz 572/135=114.4MHz SDRAM
	c3    <= sub_wire0(3);--27MHz 1/2250 =12kHz    TV mode 16MHz - (not keyboard finally)
	inclk0(1) <= '0';
	inclk0(0) <= CLOCK_27(0);

	
	--c0 4MHz
	--ps2_clk	12-16kHz ratio 256 ok !
	process (c0)
		variable n:integer range 0 to 256-1;
	begin
		if rising_edge(c0) then
			n:=(n+1) mod 256;
			if n>=128 then
				ps2_clk<='1';
			else
				ps2_clk<='0';
			end if;
		end if;
	end process;
	--ps2_clk <=c3;
	CLK16MHz <=c3;
	
	CLK4MHz<=not(c0);
	nCLK4MHz<=c0; -- not Z80 (under Time Contraints) / synchro 25MHz
   CLK8MHz<=c0; -- Bootloader (nCLK4MHz)
   nCLK8MHz<=not(c0); -- Bootloader (CLK4MHz)
	CLK25MHz<=c1; -- VGA
	nCLK25MHz<=not(c1);
	pclk<=c1; -- CLK25MHz (VGA)
	palette_CLK<=c0; --nCLK4MHz
	vram_CLK<=c0; --nCLK4MHz
	SDRAM_CLK<=c2;
	sdram_v_clk<=c2;
	sdram_v_clkref<=c0; -- esclave Z80, executant de bootloader
	--sdram_v_init<=not(pll_locked); -- si 1 alors reset sdram.
	CLK_PWM<=c1; --CLK25MHz --c0; --nCLK4MHz 
	
-- c0 27MHz 89/600=4.005 Z80
-- c1 27MHz 89/96=25,03125MHz VGA
-- c2 27MHz 89/21=114,42857142857142857142857142857MHz SDRAM
--	Warning (15559): Can't achieve requested value multiplication of 125 for clock output MIST_clocks:inst13|altpll:altpll_component|altpll_bhv2:auto_generated|clk[1] of parameter multiplication factor -- achieved value of multiplication of 89
--	Warning (15559): Can't achieve requested value division of 135 for clock output MIST_clocks:inst13|altpll:altpll_component|altpll_bhv2:auto_generated|clk[1] of parameter division factor -- achieved value of division of 96
--	Warning (15559): Can't achieve requested value multiplication of 572 for clock output MIST_clocks:inst13|altpll:altpll_component|altpll_bhv2:auto_generated|clk[2] of parameter multiplication factor -- achieved value of multiplication of 89
--	Warning (15559): Can't achieve requested value division of 135 for clock output MIST_clocks:inst13|altpll:altpll_component|altpll_bhv2:auto_generated|clk[2] of parameter division factor -- achieved value of division of 21
	
	--signal c0 : std_logic;--27MHz 20/135 =4MHz     Z80/bootloader
	--signal c1 : std_logic;--27MHz 125/135=25MHz    VGA
	--signal c2 : std_logic;--27MHz 572/135=114.4MHz SDRAM
	--signal c3 : std_logic;--27MHz 1/2250 =12kHz    keyboard
	altpll_component : altpll
	GENERIC MAP (
		bandwidth_type => "AUTO",
		clk0_divide_by => 600,
		clk0_duty_cycle => 50,
		clk0_multiply_by => 89,
		clk0_phase_shift => "0",
		clk1_divide_by => 96,
		clk1_duty_cycle => 50,
		clk1_multiply_by => 89,
		clk1_phase_shift => "0",
		clk2_divide_by => 21,
		clk2_duty_cycle => 50,
		clk2_multiply_by => 89,
		clk2_phase_shift => "0",
		clk3_divide_by => 150,
		clk3_duty_cycle => 50,
		clk3_multiply_by => 89,
		clk3_phase_shift => "0",
		compensate_clock => "CLK0",
		inclk0_input_frequency => 37037, -- I'm lying here, so that I can use lower frequencies equation, it's great :)
		intended_device_family => "Cyclone III",
		lpm_type => "altpll",
		operation_mode => "NORMAL",
		pll_type => "AUTO",
		port_activeclock => "PORT_UNUSED",
		port_areset => "PORT_USED",
		port_clkbad0 => "PORT_UNUSED",
		port_clkbad1 => "PORT_UNUSED",
		port_clkloss => "PORT_UNUSED",
		port_clkswitch => "PORT_UNUSED",
		port_configupdate => "PORT_UNUSED",
		port_fbin => "PORT_UNUSED",
		port_inclk0 => "PORT_USED",
		port_inclk1 => "PORT_UNUSED",
		port_locked => "PORT_USED",
		port_pfdena => "PORT_UNUSED",
		port_phasecounterselect => "PORT_UNUSED",
		port_phasedone => "PORT_UNUSED",
		port_phasestep => "PORT_UNUSED",
		port_phaseupdown => "PORT_UNUSED",
		port_pllena => "PORT_UNUSED",
		port_scanaclr => "PORT_UNUSED",
		port_scanclk => "PORT_UNUSED",
		port_scanclkena => "PORT_UNUSED",
		port_scandata => "PORT_UNUSED",
		port_scandataout => "PORT_UNUSED",
		port_scandone => "PORT_UNUSED",
		port_scanread => "PORT_UNUSED",
		port_scanwrite => "PORT_UNUSED",
		port_clk0 => "PORT_USED",
		port_clk1 => "PORT_USED",
		port_clk2 => "PORT_USED",
		port_clk3 => "PORT_USED",
		port_clk4 => "PORT_UNUSED",
		port_clk5 => "PORT_UNUSED",
		port_clkena0 => "PORT_UNUSED",
		port_clkena1 => "PORT_UNUSED",
		port_clkena2 => "PORT_UNUSED",
		port_clkena3 => "PORT_UNUSED",
		port_clkena4 => "PORT_UNUSED",
		port_clkena5 => "PORT_UNUSED",
		port_extclk0 => "PORT_UNUSED",
		port_extclk1 => "PORT_UNUSED",
		port_extclk2 => "PORT_UNUSED",
		port_extclk3 => "PORT_UNUSED",
		self_reset_on_loss_lock => "OFF",
		width_clock => 5
	)
	PORT MAP (
		areset => '0',
		inclk => inclk0,
		clk => sub_wire0,
		locked => OPEN --pll_locked
	);

end Behavioral;

