--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:38:22 04/22/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/CRTC_testbench.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: simple_GateArrayInterrupt
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
 
ENTITY CRTC_testbench IS
END CRTC_testbench;
 
ARCHITECTURE behavior OF CRTC_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT simple_GateArrayInterrupt
    PORT(
         CLK4MHz : IN  std_logic;
         IO_REQ_W : IN  std_logic;
         A15_A14_A8 : IN  std_logic_vector(2 downto 0);
         D : IN  std_logic_vector(7 downto 0);
         crtc_VSYNC : OUT  std_logic;
         IO_ACK : IN  std_logic;
         potards : IN  std_logic_vector(7 downto 0);
         crtc_A : OUT  std_logic_vector(15 downto 0);
         crtc_R : OUT  std_logic;
         crtc_W : OUT  std_logic;
         int : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK4MHz : std_logic := '0';
   signal IO_REQ_W : std_logic := '0';
   signal A15_A14_A8 : std_logic_vector(2 downto 0) := (others => '0');
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   --signal IO_ACK : std_logic := '0';
   signal potards : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal crtc_VSYNC : std_logic;
   signal crtc_A : std_logic_vector(15 downto 0);
   signal crtc_R : std_logic;
   signal crtc_W : std_logic;
   signal int : std_logic;

   -- Clock period definitions
   constant CLK4MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: simple_GateArrayInterrupt PORT MAP (
          CLK4MHz => CLK4MHz,
          IO_REQ_W => IO_REQ_W,
          A15_A14_A8 => A15_A14_A8,
          D => D,
          crtc_VSYNC => crtc_VSYNC,
          IO_ACK => int,--IO_ACK,
          potards => potards,
          crtc_A => crtc_A,
          crtc_R => crtc_R,
          crtc_W => crtc_W,
          int => int
        );


   -- Clock process definitions
   CLK4MHz_process :process
   begin
		CLK4MHz <= '0';
		wait for CLK4MHz_period/2;
		CLK4MHz <= '1';
		wait for CLK4MHz_period/2;
		

   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK4MHz_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
