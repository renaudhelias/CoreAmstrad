--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:09:36 05/05/2011
-- Design Name:   
-- Module Name:   E:/BuildYourOwnZ80Computer/T80_timing_tb.vhd
-- Project Name:  BuildYourOwnZ80Computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: T80se
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
 
ENTITY T80_timing_tb IS
END T80_timing_tb;
 
ARCHITECTURE behavior OF T80_timing_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT T80se
    PORT(
         RESET_n : IN  std_logic;
         CLK_n : IN  std_logic;
         CLKEN : IN  std_logic;
         WAIT_n : IN  std_logic;
         INT_n : IN  std_logic;
         NMI_n : IN  std_logic;
         BUSRQ_n : IN  std_logic;
         M1_n : OUT  std_logic;
         MREQ_n : OUT  std_logic;
         IORQ_n : OUT  std_logic;
         RD_n : OUT  std_logic;
         WR_n : OUT  std_logic;
         RFSH_n : OUT  std_logic;
         HALT_n : OUT  std_logic;
         BUSAK_n : OUT  std_logic;
         A : OUT  std_logic_vector(15 downto 0);
         DI : IN  std_logic_vector(7 downto 0);
         DO : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	 
	 component T80_timing_log
    Port ( clk:in std_logic;
				mem_rd : in  STD_LOGIC;
           D : out  STD_LOGIC_VECTOR (7 downto 0);
           m1 : in  STD_LOGIC;
			  reset_n:out std_logic;
			  WAIT_n:in std_logic
			  );
	 end component;

component simple_GateArrayInterrupt
    Port ( CLK4MHz : in  STD_LOGIC;
           IO_REQ_W : in  STD_LOGIC;
           A15_A14_A8 : in  STD_LOGIC_VECTOR (2 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
			  crtc_VSYNC : out STD_LOGIC:='0';
			  IO_ACK : in STD_LOGIC;
			  potards:in std_logic_vector(7 downto 0);
			  crtc_A:out STD_LOGIC_VECTOR (15 downto 0):=(others=>'0'); --sim
			  crtc_R:out STD_LOGIC:='0'; -- alternance 2MHz (deux mots) ======> donc 4MHz
			  crtc_W:out STD_LOGIC:='0'; -- alternance 2MHz déphasé     ===//
           int : out  STD_LOGIC;
			  M1_n : in  STD_LOGIC;
			  MEM_WR : in  STD_LOGIC;
			  WAIT_MEM_n : out  STD_LOGIC:='1';
           WAIT_n : out  STD_LOGIC:='1'
			  );
end component;

   --Inputs
   signal RESET_n : std_logic := '0';
   signal CLK_n : std_logic := '0';
   signal CLKEN : std_logic := '1';
   signal WAIT_n : std_logic := '1';
   signal INT_n : std_logic := '1';
   signal NMI_n : std_logic := '1';
   signal BUSRQ_n : std_logic := '1';
   signal DI : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal M1_n : std_logic;
   signal MREQ_n : std_logic;
   signal IORQ_n : std_logic;
   signal RD_n : std_logic;
   signal WR_n : std_logic;
   signal RFSH_n : std_logic;
   signal HALT_n : std_logic;
   signal BUSAK_n : std_logic;
   signal A : std_logic_vector(15 downto 0);
   signal DO : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_n_period : time := 10 ns;
 
 
	signal mem_rd:std_logic:='0';
	signal reset_n2:std_logic:='1';
	signal CLK4MHz:std_logic:='0';
	signal CLK_WAIT_n:std_logic:='0';
	signal WAIT_MEM_n:std_logic:='1';
	signal MEM_WR:std_logic:='0';
		for uut : T80se
	use configuration work.test1;

BEGIN
 
 CLK_WAIT_n<=CLK_n and (WAIT_n and WAIT_MEM_n); -- boulet ! rising_edge(clk_n)
 
 MEM_WR<=not(MREQ_n) and not(WR_n);
 
 -- attention c'est de WAIT_n à ajouter à l'instruction en cours cette fois ci et non plus à l'instruction précédente...
 mem_rd<=not(MREQ_n) and not(RD_n);
 
 CLK4MHz<=not(CLK_n);
 
	-- Instantiate the Unit Under Test (UUT)
   uut: T80se PORT MAP (
          RESET_n => RESET_n,
          CLK_n => CLK_WAIT_n, --CLK_n,
          CLKEN => CLKEN,
          WAIT_n => '1', --WAIT_n,
          INT_n => INT_n,
          NMI_n => NMI_n,
          BUSRQ_n => BUSRQ_n,
          M1_n => M1_n,
          MREQ_n => MREQ_n,
          IORQ_n => IORQ_n,
          RD_n => RD_n,
          WR_n => WR_n,
          RFSH_n => RFSH_n,
          HALT_n => HALT_n,
          BUSAK_n => BUSAK_n,
          A => A,
          DI => DI,
          DO => DO
        );

	T80_snifer:T80_timing_log port map
    ( clk=>CLK_n,
				mem_rd =>mem_rd,
           D =>DI,
           m1 =>M1_n,
			  reset_n=>reset_n2,
			  WAIT_n=>WAIT_n
			  );
GAinterrupt: simple_GateArrayInterrupt port map
     ( CLK4MHz =>CLK4MHz,
           IO_REQ_W=>'0',
           A15_A14_A8 =>"111",
           D =>x"00",
			  crtc_VSYNC =>open,
			  IO_ACK =>'0',
			  potards=>x"00",
			  crtc_A=>open,
			  crtc_R=>open,
			  crtc_W=>open,
           int =>open,
			  M1_n =>M1_n,
			  MEM_WR=>MEM_WR,
			  WAIT_MEM_n=>WAIT_MEM_n,
           WAIT_n=>WAIT_n
			  );

   -- Clock process definitions
   CLK_n_process :process
   begin
		RESET_n<='0';
		CLK_n<='0';
		wait for CLK_n_period/2; --m u n p
		RESET_n<=reset_n2;--'1';
		loop
			CLK_n <= '0';
			wait for CLK_n_period/2;
			CLK_n <= '1';
			wait for CLK_n_period/2;
		end loop;
   end process;

--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for CLK_n_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;





