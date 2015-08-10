--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:33:20 10/02/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/USB_ps3_test.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: USB_ps3
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY USB_ps3_test IS
END USB_ps3_test;
 
ARCHITECTURE behavior OF USB_ps3_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT USB_ps3
    PORT(
         CLK60MHz : IN  std_logic;
         USB_DATA : INOUT  std_logic_vector(1 downto 0);
         LEDS : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK60MHz : std_logic := '0';

	--BiDirs
   signal USB_DATA : std_logic_vector(1 downto 0);

 	--Outputs
   signal LEDS : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK60MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: USB_ps3 PORT MAP (
          CLK60MHz => CLK60MHz,
          USB_DATA => USB_DATA,
          LEDS => LEDS
        );

   -- Clock process definitions
   CLK60MHz_process :process
   begin
		CLK60MHz <= '0';
		wait for CLK60MHz_period/2;
		CLK60MHz <= '1';
		wait for CLK60MHz_period/2;
   end process;
 

   

END;
