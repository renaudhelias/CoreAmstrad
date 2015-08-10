-- Vhdl test bench created from schematic E:\BuildYourOwnZ80Computer\amstrad_switch_z80_vga_sd.sch - Fri Apr 29 17:05:29 2011
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY amstrad_switch_z80_vga_sd_amstrad_switch_z80_vga_sd_sch_tb IS
END amstrad_switch_z80_vga_sd_amstrad_switch_z80_vga_sd_sch_tb;
ARCHITECTURE behavioral OF 
      amstrad_switch_z80_vga_sd_amstrad_switch_z80_vga_sd_sch_tb IS 

   COMPONENT amstrad_switch_z80_vga_sd
   PORT( ram_D	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          CLK50MHz	:	IN	STD_LOGIC; 
          VSYNC	:	OUT	STD_LOGIC; 
          HSYNC	:	OUT	STD_LOGIC; 
          ram_W_n	:	OUT	STD_LOGIC; 
          OE1_n	:	OUT	STD_LOGIC; 
          audio	:	OUT	STD_LOGIC; 
          RED3	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          GREEN3	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          BLUE2	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          ADV1_n	:	OUT	STD_LOGIC; 
          CLK1	:	OUT	STD_LOGIC; 
          CRE1	:	OUT	STD_LOGIC; 
          ram_D_U	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          ram_A	:	OUT	STD_LOGIC_VECTOR (22 DOWNTO 0); 
          CD_n	:	IN	STD_LOGIC; 
          MISO	:	IN	STD_LOGIC; 
          FILE_SELECT	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          MOSI	:	OUT	STD_LOGIC; 
          SCLK	:	OUT	STD_LOGIC; 
          SS_n	:	OUT	STD_LOGIC; 
          LEDS	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          UB1_n	:	OUT	STD_LOGIC; 
          LB1_n	:	OUT	STD_LOGIC; 
          CE1_n	:	OUT	STD_LOGIC; 
          PS2_CLK	:	IN	STD_LOGIC; 
          PS2_DATA	:	IN	STD_LOGIC; 
          JOYSTICK1	:	INOUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
          JOYSTICK2	:	INOUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
          JOYSTICK1_COMMON	:	OUT	STD_LOGIC; 
          JOYSTICK2_COMMON	:	OUT	STD_LOGIC; 
          DISABLE_INK	:	IN	STD_LOGIC; 
          TOUCHE_A	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL ram_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL CLK50MHz	:	STD_LOGIC;
   SIGNAL VSYNC	:	STD_LOGIC;
   SIGNAL HSYNC	:	STD_LOGIC;
   SIGNAL ram_W_n	:	STD_LOGIC;
   SIGNAL OE1_n	:	STD_LOGIC;
   SIGNAL audio	:	STD_LOGIC;
   SIGNAL RED3	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL GREEN3	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL BLUE2	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL ADV1_n	:	STD_LOGIC;
   SIGNAL CLK1	:	STD_LOGIC;
   SIGNAL CRE1	:	STD_LOGIC;
   SIGNAL ram_D_U	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_A	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
   SIGNAL CD_n	:	STD_LOGIC;
   SIGNAL MISO	:	STD_LOGIC;
   SIGNAL FILE_SELECT	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL MOSI	:	STD_LOGIC;
   SIGNAL SCLK	:	STD_LOGIC;
   SIGNAL SS_n	:	STD_LOGIC;
   SIGNAL LEDS	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL UB1_n	:	STD_LOGIC;
   SIGNAL LB1_n	:	STD_LOGIC;
   SIGNAL CE1_n	:	STD_LOGIC;
   SIGNAL PS2_CLK	:	STD_LOGIC;
   SIGNAL PS2_DATA	:	STD_LOGIC;
   SIGNAL JOYSTICK1	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL JOYSTICK2	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL JOYSTICK1_COMMON	:	STD_LOGIC;
   SIGNAL JOYSTICK2_COMMON	:	STD_LOGIC;
   SIGNAL DISABLE_INK	:	STD_LOGIC;
   SIGNAL TOUCHE_A	:	STD_LOGIC;

BEGIN

   UUT: amstrad_switch_z80_vga_sd PORT MAP(
		ram_D => ram_D, 
		CLK50MHz => CLK50MHz, 
		VSYNC => VSYNC, 
		HSYNC => HSYNC, 
		ram_W_n => ram_W_n, 
		OE1_n => OE1_n, 
		audio => audio, 
		RED3 => RED3, 
		GREEN3 => GREEN3, 
		BLUE2 => BLUE2, 
		ADV1_n => ADV1_n, 
		CLK1 => CLK1, 
		CRE1 => CRE1, 
		ram_D_U => ram_D_U, 
		ram_A => ram_A, 
		CD_n => CD_n, 
		MISO => MISO, 
		FILE_SELECT => FILE_SELECT, 
		MOSI => MOSI, 
		SCLK => SCLK, 
		SS_n => SS_n, 
		LEDS => LEDS, 
		UB1_n => UB1_n, 
		LB1_n => LB1_n, 
		CE1_n => CE1_n, 
		PS2_CLK => PS2_CLK, 
		PS2_DATA => PS2_DATA, 
		JOYSTICK1 => JOYSTICK1, 
		JOYSTICK2 => JOYSTICK2, 
		JOYSTICK1_COMMON => JOYSTICK1_COMMON, 
		JOYSTICK2_COMMON => JOYSTICK2_COMMON, 
		DISABLE_INK => DISABLE_INK, 
		TOUCHE_A => TOUCHE_A
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
