--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:57:47 04/23/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/ctrex_gatearray.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ioblock
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
--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ctrex_gatearray IS
END ctrex_gatearray;
 
ARCHITECTURE behavior OF ctrex_gatearray IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ioblock
    PORT(
         z16MHz : IN  std_logic;
         cpuclk : IN  std_logic;
         expint : IN  std_logic;
         count : IN  std_logic_vector(3 downto 0);
         video : OUT  std_logic_vector(15 downto 0);
--         VSYNC : OUT  std_logic;
--         DIVSYNC : OUT  std_logic;
--         HSYNC : OUT  std_logic;
--         DIHSYNC : OUT  std_logic;
         vadr : OUT  std_logic_vector(22 downto 0);
         vack : OUT  std_logic;
         OUT_B : OUT  std_logic_vector(7 downto 0);
         IO_Adr : IN  std_logic_vector(7 downto 0);
         IO_Data : IN  std_logic_vector(7 downto 0);
         IOWR : IN  std_logic;
         ROMENA : OUT  std_logic_vector(1 downto 0);
         reset : IN  std_logic;
         vdatain : IN  std_logic_vector(7 downto 0);
         riscview : IN  std_logic;
         disp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal z16MHz : std_logic := '0'; -- seulement pour rview (qui est off)
   signal cpuclk : std_logic := '0';
   signal expint : std_logic := '0'; -- non utilisé
   signal count : std_logic_vector(3 downto 0) := (others => '0');
   signal IO_Adr : std_logic_vector(7 downto 0) := (others => '0');
   signal IO_Data : std_logic_vector(7 downto 0) := (others => '0');
   signal IOWR : std_logic := '1'; -- off
   signal reset : std_logic := '1'; -- off
   signal vdatain : std_logic_vector(7 downto 0) := (others => '0');
   signal riscview : std_logic := '0'; -- rview off (je veux crtc)

 	--Outputs
   signal video : std_logic_vector(15 downto 0);
--   signal VSYNC : std_logic;
--   signal DIVSYNC : std_logic;
--   signal HSYNC : std_logic;
--   signal DIHSYNC : std_logic;
   signal vadr : std_logic_vector(22 downto 0);
   signal vack : std_logic;
   signal OUT_B : std_logic_vector(7 downto 0);
   signal ROMENA : std_logic_vector(1 downto 0);
   signal disp : std_logic;

   -- Clock period definitions
   constant cpuclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ioblock PORT MAP (
          z16MHz => z16MHz,
          cpuclk => cpuclk,
          expint => expint,
          count => count,
          video => video,
--          VSYNC => VSYNC,
--          DIVSYNC => DIVSYNC,
--          HSYNC => HSYNC,
--          DIHSYNC => DIHSYNC,
          vadr => vadr,
          vack => vack,
          OUT_B => OUT_B,
          IO_Adr => IO_Adr,
          IO_Data => IO_Data,
          IOWR => IOWR,
          ROMENA => ROMENA,
          reset => reset,
          vdatain => vdatain,
          riscview => riscview,
          disp => disp
        );

   -- Clock process definitions
   cpuclk_process :process
   begin
		count<=count+1;
		wait for cpuclk_period;
--		cpuclk <= '0';
--		wait for cpuclk_period/2;
--		cpuclk <= '1';
--		wait for cpuclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for cpuclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
