--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:56:33 05/09/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/gatearray_cpc_plus_tb.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gatearray_cpc_plus
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
 
ENTITY gatearray_cpc_plus_tb IS
END gatearray_cpc_plus_tb;
 
ARCHITECTURE behavior OF gatearray_cpc_plus_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gatearray_cpc_plus
    PORT(
         clk : IN  std_logic;
         M1_n : out  STD_LOGIC;
		  WAIT_n : out  STD_LOGIC;
		  INT_n : out  STD_LOGIC;
		  SYNC : out  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal M1_n : std_logic;
   signal WAIT_n : std_logic;
   signal INT_n : std_logic;
   signal SYNC : std_logic;

   -- Clock period definitions
	--4MHz
	--4000000 tick => 1sec
	--1 tick => 0,00000025sec=0,00025 ms=0,25 us = 250 ns
   constant clk_period : time := 250 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gatearray_cpc_plus PORT MAP (
          clk => clk,
          M1_n => M1_n,
          WAIT_n => WAIT_n,
          INT_n => INT_n,
          SYNC => SYNC
			 );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
