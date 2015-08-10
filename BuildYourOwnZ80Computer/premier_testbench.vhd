-- Vhdl test bench created from schematic C:\Users\freemac\BuildYourOwnZ80Computer\amstrad_switch_z80_vga.sch - Thu Jan 13 16:08:31 2011
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
ENTITY amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb IS
END amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb;
ARCHITECTURE behavioral OF 
      amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb IS 

   COMPONENT amstrad_switch_z80_vga
   PORT( ram_D	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          CE1	:	OUT	STD_LOGIC; 
          UB1	:	OUT	STD_LOGIC; 
          LB1	:	OUT	STD_LOGIC; 
          OE1	:	OUT	STD_LOGIC; 
          LED1	:	OUT	STD_LOGIC; 
          LED2	:	OUT	STD_LOGIC; 
          ram_A	:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0); 
          ram_W	:	OUT	STD_LOGIC; 
          CLK50MHz	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL ram_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL CE1	:	STD_LOGIC;
   SIGNAL UB1	:	STD_LOGIC;
   SIGNAL LB1	:	STD_LOGIC;
   SIGNAL OE1	:	STD_LOGIC;
   SIGNAL LED1	:	STD_LOGIC;
   SIGNAL LED2	:	STD_LOGIC;
   SIGNAL ram_A	:	STD_LOGIC_VECTOR (17 DOWNTO 0);
   SIGNAL ram_W	:	STD_LOGIC;
   SIGNAL CLK50MHz	:	STD_LOGIC;

BEGIN

   UUT: amstrad_switch_z80_vga PORT MAP(
		ram_D => ram_D, 
		CE1 => CE1, 
		UB1 => UB1, 
		LB1 => LB1, 
		OE1 => OE1, 
		LED1 => LED1, 
		LED2 => LED2, 
		ram_A => ram_A, 
		ram_W => ram_W, 
		CLK50MHz => CLK50MHz
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
	
	horloge:process
	begin
		CLK50MHz<='1';
		loop
			wait for 20ns;
			CLK50MHz<= not CLK50MHz;
		end loop;
	end process;
	
-- *** End Test Bench - User Defined Section ***

END;
