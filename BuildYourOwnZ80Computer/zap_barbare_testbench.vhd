-- Vhdl test bench created from schematic C:\Users\freemac\BuildYourOwnZ80Computer\ZAP_barbare.sch - Thu Jan 13 16:43:43 2011
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
use ieee.std_logic_arith.all; -- conv
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
use STD.textio.all;
ENTITY ZAP_barbare_ZAP_barbare_sch_tb IS
END ZAP_barbare_ZAP_barbare_sch_tb;
ARCHITECTURE behavioral OF ZAP_barbare_ZAP_barbare_sch_tb IS 

   COMPONENT ZAP_barbare
   PORT( XLXN_56	:	OUT	STD_LOGIC; 
          XLXN_57	:	OUT	STD_LOGIC; 
          XLXN_58	:	OUT	STD_LOGIC; 
          XLXN_59	:	OUT	STD_LOGIC; 
          LEDS	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          BUTTONS	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          T9	:	IN	STD_LOGIC;
			 RESET_n : IN STD_LOGIC);
   END COMPONENT;

   SIGNAL XLXN_56	:	STD_LOGIC;
   SIGNAL XLXN_57	:	STD_LOGIC;
   SIGNAL XLXN_58	:	STD_LOGIC;
   SIGNAL XLXN_59	:	STD_LOGIC;
   SIGNAL LEDS	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL BUTTONS	:	STD_LOGIC_VECTOR (7 DOWNTO 0):=(others=>'0');
   SIGNAL T9	:	STD_LOGIC:='0';
SIGNAL RESET_n : STD_LOGIC;
BEGIN

   UUT: ZAP_barbare PORT MAP(
		XLXN_56 => XLXN_56, 
		XLXN_57 => XLXN_57, 
		XLXN_58 => XLXN_58, 
		XLXN_59 => XLXN_59, 
		LEDS => LEDS, 
		BUTTONS => BUTTONS, 
		T9 => T9,
		RESET_n => RESET_n
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***
	horloge:process
		
	begin
		
	
	BUTTONS<=(others=>'0');
		T9<='0';
		RESET_n<='0';
		wait for 20ns;
		RESET_n<='1';
		
		loop
			wait for 20ns;
			T9<=not T9;
		end loop;
	end process;
END;
