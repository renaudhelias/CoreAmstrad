-- Vhdl test bench created from schematic C:\Users\freemac\BuildYourOwnZ80Computer\amstrad_switch_z80_vga.sch - Thu Jan 13 16:29:03 2011
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
use ieee.std_logic_arith.all; -- conv
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- conv integer unsigned

ENTITY amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb IS
END amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb;

--
--configuration test1 of amstrad_switch_z80_vga_exported is
----use work.T80_REG;
--		for BEHAVIORAL
--			for AmstradT80:T80se
--				for rtl
--					for u0:T80
--						for rtl
--							for all:T80_Reg
--								use entity WORK.T80_Reg(testbench);
--							end for;
--						end for;
--					end for;
--				end for;
--			end for;
--		end for;
--end configuration;


ARCHITECTURE behavioral OF 
      amstrad_switch_z80_vga_amstrad_switch_z80_vga_sch_tb IS 

-- COMPONENT amstrad_switch_z80_vga_sd
--   PORT( ram_D	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
--          CLK50MHz	:	IN	STD_LOGIC; 
--			 SIMULATE : IN STD_LOGIC;
--          VSYNC	:	OUT	STD_LOGIC; 
--          HSYNC	:	OUT	STD_LOGIC; 
--          ram_W_n	:	OUT	STD_LOGIC; 
--          OE1_n	:	OUT	STD_LOGIC; 
--          audio	:	OUT	STD_LOGIC; 
--          RED3	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
--          GREEN3	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
--          BLUE2	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0); 
--          ADV1_n	:	OUT	STD_LOGIC; 
--          CLK1	:	OUT	STD_LOGIC; 
--          CRE1	:	OUT	STD_LOGIC; 
--          ram_D_U	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
--          ram_A	:	OUT	STD_LOGIC_VECTOR (22 DOWNTO 0); 
--          CD_n	:	IN	STD_LOGIC; 
--          MISO	:	IN	STD_LOGIC; 
--          FILE_SELECT	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
--          MOSI	:	OUT	STD_LOGIC; 
--          SCLK	:	OUT	STD_LOGIC; 
--          SS_n	:	OUT	STD_LOGIC; 
--          LEDS	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
--          UB1_n	:	OUT	STD_LOGIC; 
--          LB1_n	:	OUT	STD_LOGIC; 
--          CE1_n	:	OUT	STD_LOGIC; 
--          PS2_CLK	:	IN	STD_LOGIC; 
--          PS2_DATA	:	IN	STD_LOGIC; 
--          JOYSTICK1	:	INOUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
--          JOYSTICK2	:	INOUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
--          DISABLE_INK	:	IN	STD_LOGIC; 
--          TOUCHE_A	:	IN	STD_LOGIC);
--   END COMPONENT;

	COMPONENT amstrad_motherboard
   PORT( IO_WR	:	OUT	STD_LOGIC; 
          CLK8	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          ram_W_n	:	OUT	STD_LOGIC; 
          OE1_n	:	OUT	STD_LOGIC; 
          ram_D	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          ram_A	:	OUT	STD_LOGIC_VECTOR (22 DOWNTO 0); 
          init_A	:	IN	STD_LOGIC_VECTOR (22 DOWNTO 0); 
          init_W_n	:	IN	STD_LOGIC; 
          CLK16MHz	:	IN	STD_LOGIC; 
          D	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          crtc_D	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          audio	:	OUT	STD_LOGIC; 
          is_ucpm	:	IN	STD_LOGIC; 
          PS2_CLK	:	IN	STD_LOGIC; 
          PS2_DATA	:	IN	STD_LOGIC; 
          crtc_A	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          RESET_n	:	IN	STD_LOGIC; 
          JOYSTICK1	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          JOYSTICK2	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          TOUCHE_A	:	IN	STD_LOGIC; 
          crtc_W	:	OUT	STD_LOGIC; 
          MODE	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          A15_14_8	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

	COMPONENT RAM_testbench
   PORT(   A : in  STD_LOGIC_VECTOR (22 downto 0);
           D : inout  STD_LOGIC_VECTOR (7 downto 0);
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC;
			  RESET_n : in STD_LOGIC
			  );
	end COMPONENT;
	
	
   SIGNAL IO_WR	:	STD_LOGIC;
   SIGNAL CLK8	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL ram_W_n	:	STD_LOGIC;
   SIGNAL OE1_n	:	STD_LOGIC;
   SIGNAL ram_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_A	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
   SIGNAL init_A	:	STD_LOGIC_VECTOR (22 DOWNTO 0):=(others=>'0');
   SIGNAL init_W_n	:	STD_LOGIC:='1';
   SIGNAL CLK16MHz	:	STD_LOGIC;
   SIGNAL D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL crtc_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL audio	:	STD_LOGIC;
   SIGNAL is_ucpm	:	STD_LOGIC:='0';
   SIGNAL PS2_CLK	:	STD_LOGIC:='1'; -- repos
   SIGNAL PS2_DATA	:	STD_LOGIC:='1'; -- repos
   SIGNAL crtc_A	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL RESET_n	:	STD_LOGIC;
   SIGNAL JOYSTICK1	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL JOYSTICK2	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL TOUCHE_A	:	STD_LOGIC:='0'; -- relachée
   SIGNAL crtc_W	:	STD_LOGIC;
   SIGNAL MODE	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL A15_14_8	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

--
--	SIGNAL ram_D	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
--   SIGNAL CLK50MHz	:	STD_LOGIC;
--	SIGNAL SIMULATE : STD_LOGIC:='1';
--   SIGNAL VSYNC	:	STD_LOGIC;
--   SIGNAL HSYNC	:	STD_LOGIC;
--   SIGNAL ram_W_n	:	STD_LOGIC;
--   SIGNAL OE1_n	:	STD_LOGIC;
--   SIGNAL audio	:	STD_LOGIC;
--   SIGNAL RED3	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
--   SIGNAL GREEN3	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
--   SIGNAL BLUE2	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
--   SIGNAL ADV1_n	:	STD_LOGIC;
--   SIGNAL CLK1	:	STD_LOGIC;
--   SIGNAL CRE1	:	STD_LOGIC;
--   SIGNAL ram_D_U	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
--   SIGNAL ram_A	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
--   SIGNAL CD_n	:	STD_LOGIC:='1'; -- carte SD non insérré
--   SIGNAL MISO	:	STD_LOGIC:='1'; -- repos
--   SIGNAL FILE_SELECT	:	STD_LOGIC_VECTOR (7 DOWNTO 0):="00000000"; -- la première disquette
--   SIGNAL MOSI	:	STD_LOGIC;
--   SIGNAL SCLK	:	STD_LOGIC;
--   SIGNAL SS_n	:	STD_LOGIC;
--   SIGNAL LEDS	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
--   SIGNAL UB1_n	:	STD_LOGIC;
--   SIGNAL LB1_n	:	STD_LOGIC;
--   SIGNAL CE1_n	:	STD_LOGIC;
--   SIGNAL PS2_CLK	:	STD_LOGIC:='1'; -- repos
--   SIGNAL PS2_DATA	:	STD_LOGIC:='1'; -- repos
--   SIGNAL JOYSTICK1	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
--   SIGNAL JOYSTICK2	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
--   SIGNAL DISABLE_INK	:	STD_LOGIC:='0'; -- ink enabled
--   SIGNAL TOUCHE_A	:	STD_LOGIC:='0'; -- relachée
--	
	
	-- Il faut fabriquer un mock bootloader...
--	signal RESET_n:std_logic;
	
	-- j'ai placé la configuration de amstrad_switch_z80_vga à la fin de
	-- RAM_testbench car amstrad_switch_z80_vga est un schéma...
	for UUT : amstrad_motherboard
	use configuration work.test1;
	
BEGIN

-- UUT: amstrad_switch_z80_vga_sd PORT MAP(
--		ram_D => ram_D, 
--		CLK50MHz => CLK50MHz, 
--		SIMULATE => RESET_n,
--		VSYNC => VSYNC, 
--		HSYNC => HSYNC, 
--		ram_W_n => ram_W_n, 
--		OE1_n => OE1_n, 
--		audio => audio, 
--		RED3 => RED3, 
--		GREEN3 => GREEN3, 
--		BLUE2 => BLUE2, 
--		ADV1_n => ADV1_n, 
--		CLK1 => CLK1, 
--		CRE1 => CRE1, 
--		ram_D_U => ram_D_U, 
--		ram_A => ram_A, 
--		CD_n => CD_n, 
--		MISO => MISO, 
--		FILE_SELECT => FILE_SELECT, 
--		MOSI => MOSI, 
--		SCLK => SCLK, 
--		SS_n => SS_n, 
--		LEDS => LEDS, 
--		UB1_n => UB1_n, 
--		LB1_n => LB1_n, 
--		CE1_n => CE1_n, 
--		PS2_CLK => PS2_CLK, 
--		PS2_DATA => PS2_DATA, 
--		JOYSTICK1 => JOYSTICK1, 
--		JOYSTICK2 => JOYSTICK2, 
--		DISABLE_INK => DISABLE_INK, 
--		TOUCHE_A => TOUCHE_A
--   );

	
	UUT: amstrad_motherboard PORT MAP(
		IO_WR => IO_WR, 
		CLK8 => CLK8, 
		ram_W_n => ram_W_n, 
		OE1_n => OE1_n, 
		ram_D => ram_D, 
		ram_A => ram_A, 
		init_A => init_A, 
		init_W_n => init_W_n, 
		CLK16MHz => CLK16MHz, 
		D => D, 
		crtc_D => crtc_D, 
		audio => audio, 
		is_ucpm => is_ucpm, 
		PS2_CLK => PS2_CLK, 
		PS2_DATA => PS2_DATA, 
		crtc_A => crtc_A, 
		RESET_n => RESET_n, 
		JOYSTICK1 => JOYSTICK1, 
		JOYSTICK2 => JOYSTICK2, 
		TOUCHE_A => TOUCHE_A, 
		crtc_W => crtc_W, 
		MODE => MODE, 
		A15_14_8 => A15_14_8
   );
	
	AmstradRAM: RAM_testbench PORT MAP(
		D => ram_D, 
		A => ram_A, 
		wr => not(ram_W_n), 
		rd => ram_W_n, --not(OE1_n),
		RESET_n => RESET_n
   );
	

	
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

	horloge:process
		constant clk_period : time := 62500 ps;
	begin
		RESET_n<='0';
		CLK16MHz<='0';
		wait for clk_period/2; --m u n p
		RESET_n<='1';
		loop
			wait for clk_period/2; 
			CLK16MHz<=not CLK16MHz;
		end loop;
	end process;
	
	
--	sniferIO:process(IO_WR,IO_RD) is
--	begin
--		if rising_edge(IO_WR) then
--			report("I write on IO A=" & INTEGER'IMAGE(conv_integer(A)) & " D="  & INTEGER'IMAGE(conv_integer(D)));
--		end if;
--		if rising_edge(IO_RD) then
--			report("I read on IO A=" & INTEGER'IMAGE(conv_integer(A)) & " some DATA");
--		end if;
--	end process;

--	sniferMEM:process(MEM_WR,MEM_RD) is
--	begin
--		if rising_edge(MEM_WR) then
--			report("I write on MEM A=" & INTEGER'IMAGE(conv_integer(A)) & " D="  & INTEGER'IMAGE(conv_integer(D)));
--		end if;
--		if rising_edge(MEM_RD) then
----			report("I read on MEM A=" & INTEGER'IMAGE(conv_integer(A)) & " some DATA");
--		end if;
--	end process;




END;

--configuration ctest1 of add32_test is   -- ctest1 configuration
--  for circuits -- of add32_test
--    for all: add32
--      use entity WORK.add32(circuits);
--      for circuits -- of add32
--        for all: fadd
--          use entity WORK.fadd(circuits);
--        end for;
--        for stage
--          for all: fadd
--            use entity WORK.fadd(circuits);
--          end for;    
--        end for;
--      end for;
--    end for;
--  end for;
--end configuration ctest1;




-- pour que ce soit valide il faut compiler fake_ram16x1d en le prenant en mode simulation>Behavioral Check Syntax
--configuration testbenchConf2 of T80_Reg is
--use work.fake_ram16x1d;
--for rtl
--for all : RAM16X1D use entity fake_ram16x1d(behavioral)
--							port map(
--								DPO=>DPO,
--								SPO=>SPO,
--								A0=>A0,
--								A1=>A1,
--								A2=>A2,
--								A3=>A3,
--								D=>D,
--								DPRA0=>DPRA0,
--								DPRA1=>DPRA1,
--								DPRA2=>DPRA2,
--								DPRA3=>DPRA3,
--								WCLK=>WCLK,
--								WE=>WE);
--						end for;
--						
--end for;
--end configuration testbenchConf2;
