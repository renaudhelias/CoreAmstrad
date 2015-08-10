--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:47:57 04/23/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/ctrex_crtc.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: crtcV
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
 
ENTITY ctrex_crtc IS
END ctrex_crtc;
 
ARCHITECTURE behavior OF ctrex_crtc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT crtcV
    PORT(
         MA : OUT  std_logic_vector(13 downto 0);
         RA : OUT  std_logic_vector(4 downto 0);
         HSYNC : OUT  std_logic;
         VSYNC : OUT  std_logic;
         DISP : OUT  std_logic;
         CPCHSYNC : OUT  std_logic;
         CPCVSYNC : OUT  std_logic;
         CPCDISP : OUT  std_logic;
         CPCBLACK : OUT  std_logic;
         IOCLK : IN  std_logic; --cpuclk pour les registres 4MHz
         RS : IN  std_logic;
         CS : IN  std_logic;
         RW : IN  std_logic;
         Din : IN  std_logic_vector(7 downto 0);
         RESET : IN  std_logic;
         CLK : IN  std_logic -- 1MHz
        );
    END COMPONENT;
    

   --Inputs
   signal IOCLK : std_logic := '0';
   signal RS : std_logic := '0';
   signal CS : std_logic := '0';
   signal RW : std_logic := '0';
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal MA : std_logic_vector(13 downto 0);
   signal RA : std_logic_vector(4 downto 0);
   signal HSYNC : std_logic;
   signal VSYNC : std_logic;
   signal DISP : std_logic;
   signal CPCHSYNC : std_logic;
   signal CPCVSYNC : std_logic;
   signal CPCDISP : std_logic;
   signal CPCBLACK : std_logic;

   -- Clock period definitions
   constant IOCLK_period : time := 10 ns;
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: crtcV PORT MAP (
          MA => MA,
          RA => RA,
          HSYNC => HSYNC,
          VSYNC => VSYNC,
          DISP => DISP,
          CPCHSYNC => CPCHSYNC,
          CPCVSYNC => CPCVSYNC,
          CPCDISP => CPCDISP,
          CPCBLACK => CPCBLACK,
          IOCLK => IOCLK,
          RS => RS,
          CS => CS,
          RW => RW,
          Din => Din,
          RESET => RESET,
          CLK => CLK
        );

   -- Clock process definitions
   IOCLK_process :process
   begin
		IOCLK <= '0';
		wait for IOCLK_period/2;
		IOCLK <= '1';
		wait for IOCLK_period/2;
   end process;
 
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for IOCLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
