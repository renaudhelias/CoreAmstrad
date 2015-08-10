LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY gatearray_javacpc_tb IS
END gatearray_javacpc_tb;
 
ARCHITECTURE behavior OF gatearray_javacpc_tb IS 
    COMPONENT gatearray_javacpc
    PORT(
         clk : IN  std_logic;
         Hdisp : OUT  std_logic;
         Hsync : OUT  std_logic;
         Vdisp : OUT  std_logic;
         Vsync : OUT  std_logic;
         Interrupt : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal clk : std_logic := '0';
 	--Outputs
   signal Hdisp : std_logic;
   signal Hsync : std_logic;
   signal Vdisp : std_logic;
   signal Vsync : std_logic;
   signal Interrupt : std_logic;
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: gatearray_javacpc PORT MAP (
          clk => clk,
          Hdisp => Hdisp,
          Hsync => Hsync,
          Vdisp => Vdisp,
          Vsync => Vsync,
          Interrupt => Interrupt
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
