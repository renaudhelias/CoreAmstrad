-- Vhdl test bench created from schematic E:\BuildYourOwnZ80Computer\amstrad_motherboard.sch - Sun May 01 20:33:06 2011
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
ENTITY amstrad_motherboard_amstrad_motherboard_sch_tb IS
END amstrad_motherboard_amstrad_motherboard_sch_tb;
ARCHITECTURE behavioral OF amstrad_motherboard_amstrad_motherboard_sch_tb IS 

   COMPONENT amstrad_motherboard
   PORT( IO_WR	:	OUT	STD_LOGIC; 
          CLK8	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          ram_W_n	:	OUT	STD_LOGIC; 
          OE1_n	:	OUT	STD_LOGIC; 
          ram_D	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          ram_A	:	OUT	STD_LOGIC_VECTOR (22 DOWNTO 0); 
          init_A	:	IN	STD_LOGIC_VECTOR (22 DOWNTO 0); 
          init_W_n	:	IN	STD_LOGIC; 
          CLK16MHz	:	IN	STD_LOGIC; 
          D	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          crtc_D	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          audio	:	OUT	STD_LOGIC; 
          is_ucpm	:	IN	STD_LOGIC; 
          PS2_CLK	:	IN	STD_LOGIC; 
          PS2_DATA	:	IN	STD_LOGIC; 
          crtc_A	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          RESET_n	:	IN	STD_LOGIC; 
          JOYSTICK1	:	INOUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
          JOYSTICK2	:	INOUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
          TOUCHE_A	:	IN	STD_LOGIC; 
          crtc_W	:	OUT	STD_LOGIC; 
          MODE	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          A15_14_8	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   SIGNAL IO_WR	:	STD_LOGIC;
   SIGNAL CLK8	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL ram_W_n	:	STD_LOGIC;
   SIGNAL OE1_n	:	STD_LOGIC;
   SIGNAL ram_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_A	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
   SIGNAL init_A	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
   SIGNAL init_W_n	:	STD_LOGIC;
   SIGNAL CLK16MHz	:	STD_LOGIC;
   SIGNAL D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL crtc_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL audio	:	STD_LOGIC;
   SIGNAL is_ucpm	:	STD_LOGIC;
   SIGNAL PS2_CLK	:	STD_LOGIC;
   SIGNAL PS2_DATA	:	STD_LOGIC;
   SIGNAL crtc_A	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL RESET_n	:	STD_LOGIC;
   SIGNAL JOYSTICK1	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL JOYSTICK2	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL TOUCHE_A	:	STD_LOGIC;
   SIGNAL crtc_W	:	STD_LOGIC;
   SIGNAL MODE	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL A15_14_8	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: amstrad_motherboard PORT MAP(
		IO_WR => IO_WR, 
		CLK8 => CLK8, 
		ram_W_n => ram_W_n, 
		OE1_n => OE1_n, 
		ram_D => ram_D, 
		ram_A => ram_A, 
		init_A => init_A, 
		init_W_n => init_W_n, 
		CLK16MHz => CLK16MHz, 
		D => D, 
		crtc_D => crtc_D, 
		audio => audio, 
		is_ucpm => is_ucpm, 
		PS2_CLK => PS2_CLK, 
		PS2_DATA => PS2_DATA, 
		crtc_A => crtc_A, 
		RESET_n => RESET_n, 
		JOYSTICK1 => JOYSTICK1, 
		JOYSTICK2 => JOYSTICK2, 
		TOUCHE_A => TOUCHE_A, 
		crtc_W => crtc_W, 
		MODE => MODE, 
		A15_14_8 => A15_14_8
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
