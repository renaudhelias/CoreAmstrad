--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:08:40 05/20/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/crtc6845_testbench.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: crtc6845
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
 
ENTITY crtc6845_testbench IS
END crtc6845_testbench;
 
ARCHITECTURE behavior OF crtc6845_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT crtc6845
    PORT(
         MA : OUT  std_logic_vector(13 downto 0);
         RA : OUT  std_logic_vector(4 downto 0);
         HSYNC : OUT  std_logic;
         VSYNC : OUT  std_logic;
         DE : OUT  std_logic;
         CURSOR : OUT  std_logic;
         LPSTBn : IN  std_logic;
         E : IN  std_logic;
         RS : IN  std_logic;
         CSn : IN  std_logic;
         RW : IN  std_logic;
         D : INOUT  std_logic_vector(7 downto 0);
         RESETn : IN  std_logic;
         CLK : IN  std_logic;
         REG_INIT : IN  std_logic
--         Hend : INOUT  std_logic;
--         HS : INOUT  std_logic;
--         CHROW_CLK : INOUT  std_logic;
--         Vend : INOUT  std_logic;
--         SLadj : INOUT  std_logic;
--         H : INOUT  std_logic;
--         V : INOUT  std_logic;
--         CURSOR_ACTIVE : INOUT  std_logic;
--         VERT_RST : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LPSTBn : std_logic := '0';
   signal E : std_logic := '0';
   signal RS : std_logic := '0';
   signal CSn : std_logic := '0';
   signal RW : std_logic := '0';
   signal RESETn : std_logic := '0';
   signal CLK : std_logic := '0';
   signal REG_INIT : std_logic := '0';

	--BiDirs
   signal D : std_logic_vector(7 downto 0);
--   signal Hend : std_logic;
--   signal HS : std_logic;
--   signal CHROW_CLK : std_logic;
--   signal Vend : std_logic;
--   signal SLadj : std_logic;
--   signal H : std_logic;
--   signal V : std_logic;
--   signal CURSOR_ACTIVE : std_logic;
--   signal VERT_RST : std_logic;

 	--Outputs
   signal MA : std_logic_vector(13 downto 0);
   signal RA : std_logic_vector(4 downto 0);
   signal HSYNC : std_logic;
   signal VSYNC : std_logic;
   signal DE : std_logic;
   signal CURSOR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant CHROW_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: crtc6845 PORT MAP (
          MA => MA,
          RA => RA,
          HSYNC => HSYNC,
          VSYNC => VSYNC,
          DE => DE,
          CURSOR => CURSOR,
          LPSTBn => LPSTBn,
          E => E,
          RS => RS,
          CSn => CSn,
          RW => RW,
          D => D,
          RESETn => RESETn,
          CLK => CLK,
          REG_INIT => REG_INIT
--          Hend => Hend,
--          HS => HS,
--          CHROW_CLK => CHROW_CLK,
--          Vend => Vend,
--          SLadj => SLadj,
--          H => H,
--          V => V,
--          CURSOR_ACTIVE => CURSOR_ACTIVE,
--          VERT_RST => VERT_RST
        );

   -- Clock process definitions
   CLK_process :process
   begin
		RESETn<='0';
		REG_INIT<='1';
		E<='0';--E<='1';
		CLK <= '0';
		wait for CLK_period/2;
		E<='1';--E<='0'; -- falling_edge(E) provoque lecture lorsque REG_INIT='1'
		CLK <= '1';
		wait for CLK_period/2;
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
		RESETn<='1';
		REG_INIT<='0';
		loop
			CLK <= '0';
			wait for CLK_period/2;
			CLK <= '1';
			wait for CLK_period/2;
		end loop;
   end process;
 
--   CHROW_CLK_process :process
--   begin
--		CHROW_CLK <= '0';
--		wait for CHROW_CLK_period/2;
--		CHROW_CLK <= '1';
--		wait for CHROW_CLK_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
