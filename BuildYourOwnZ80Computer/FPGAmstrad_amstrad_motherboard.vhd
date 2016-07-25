--    {@{@{@{@{@{@
--  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r004
--  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
--  {@{@{@{@{@{@{@{@
--  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
--  {@{@        {@{@   Contact : renaudhelias@gmail.com
--  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
--    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
--
--
--------------------------------------------------------------------------------
-- FPGAmstrad_*.vhd : Auto-generated code from FGPAmstrad 3 main schematics
-- This type of component is only used on my main schematic.
-- As it is about auto-generated code, you'll find no comments by here
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : amstrad_motherboard.vhf
-- /___/   /\     Timestamp : 02/25/2015 10:26:04
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_motherboard.vhf -w C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_motherboard.sch
--Design Name: amstrad_motherboard
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL CB4CE_HXILINX_amstrad_motherboard -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--entity CB4CE_HXILINX_amstrad_motherboard is
--  
--port (
--    CEO  : out STD_LOGIC;
--    Q0   : out STD_LOGIC;
--    Q1   : out STD_LOGIC;
--    Q2   : out STD_LOGIC;
--    Q3   : out STD_LOGIC;
--    TC   : out STD_LOGIC;
--    C    : in STD_LOGIC;
--    CE   : in STD_LOGIC;
--    CLR  : in STD_LOGIC
--    );
--end CB4CE_HXILINX_amstrad_motherboard;
--
--architecture Behavioral of CB4CE_HXILINX_amstrad_motherboard is
--
--  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
--  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
--  
--begin
--
--process(C, CLR)
--begin
--  if (CLR='1') then
--    COUNT <= (others => '0');
--  elsif (C'event and C = '1') then
--    if (CE='1') then 
--      COUNT <= COUNT+1;
--    end if;
--  end if;
--end process;
--
--TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
--CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
--
--Q3 <= COUNT(3);
--Q2 <= COUNT(2);
--Q1 <= COUNT(1);
--Q0 <= COUNT(0);
--
--end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard is
   port ( vga_A    : in    std_logic_vector (13 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (13 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard is
   component VRAM_Amstrad_MiST
      port ( vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic; 
             vga_D    : out   std_logic);
   end component;
   
begin
   XLXI_30 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(0),
                vram_W=>vram_W,
                vga_D=>vga_D(0));
   
   XLXI_31 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(1),
                vram_W=>vram_W,
                vga_D=>vga_D(1));
   
   XLXI_32 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(2),
                vram_W=>vram_W,
                vga_D=>vga_D(2));
   
   XLXI_33 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(3),
                vram_W=>vram_W,
                vga_D=>vga_D(3));
   
   XLXI_34 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(4),
                vram_W=>vram_W,
                vga_D=>vga_D(4));
   
   XLXI_35 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(5),
                vram_W=>vram_W,
                vga_D=>vga_D(5));
   
   XLXI_36 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(6),
                vram_W=>vram_W,
                vga_D=>vga_D(6));
   
   XLXI_37 : VRAM_Amstrad_MiST
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D=>vram_D(7),
                vram_W=>vram_W,
                vga_D=>vga_D(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity VRAM32Ko_Amstrad_MUSER_amstrad_motherboard is
   port ( vga_A    : in    std_logic_vector (15 downto 0); 
          vga_CLK  : in    std_logic; 
          vram_A   : in    std_logic_vector (15 downto 0); 
          vram_CLK : in    std_logic; 
          vram_D   : in    std_logic_vector (7 downto 0); 
          vram_W   : in    std_logic;
			 lowerVRAM : in std_logic_vector(1 downto 0);
			 upperVRAM : in std_logic_vector(1 downto 0);
			 --dbBuffVRAM: in    std_logic; 
          vga_D    : out   std_logic_vector (7 downto 0));
end VRAM32Ko_Amstrad_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of VRAM32Ko_Amstrad_MUSER_amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   signal wLower  : std_logic;
   signal wUpper  : std_logic;
   signal dLower  : std_logic_vector (7 downto 0):="00000000"; 
   signal dUpper  : std_logic_vector (7 downto 0):=(others=>'0');
   component and_then
      port ( A : in    std_logic; 
             B : in    std_logic; 
             C : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component SELECT8tris
      port ( s1    : in    std_logic;
				 s2    : in    std_logic; 
             DATA1 : in    std_logic_vector (7 downto 0); 
             DATA2 : in    std_logic_vector (7 downto 0); 
             DATA3 : in    std_logic_vector (7 downto 0); 
             DATA0 : out   std_logic_vector (7 downto 0));
   end component;
   
   component VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (13 downto 0); 
             vga_A    : in    std_logic_vector (13 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0); 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
	--signal ignoreA14:std_logic:='0'; -- 0 : true
	
	--constant LOWER_LAYOUT : std_logic_vector(1 downto 0):="10"; --&8000-BFFF
	
begin


--process(vga_CLK, dbBuffVRAM)
--	variable oldBuffVRAM:std_logic:='0';
--begin
--  if rising_edge(vga_CLK) then
--	if not(oldBuffVRAM)=dbBuffVRAM then
--		oldBuffVRAM:=dbBuffVRAM;
--		ignoreA14<=oldBuffVRAM;
--		--XLXN_40<=(others=>oldBuffVRAM);
--    end if;
--  end if;
--end process;


   XLXI_2 : and_then
      port map (A=>vram_W,
                --B=>vram_A(15) and not(vram_A(14)),
					 B=>(lowerVRAM(1) xor not(vram_A(15))) and (lowerVRAM(0) xor not(vram_A(14))),
                C=>wLower);
   
--   XLXI_3 : INV
--      port map (I=>vram_A(14),
--                O=>XLXN_21);

   
   XLXI_4 : SELECT8tris
      port map (DATA1(7 downto 0)=>dUpper(7 downto 0), --&C000-FFFF
                DATA2(7 downto 0)=>dLower(7 downto 0), --&8000-BFFF ?
					 DATA3(7 downto 0)=>x"FF",
                s1=>(upperVRAM(1) xor not(vga_A(15))) and (upperVRAM(0) xor not(vga_A(14))),
                --s2=>vga_A(15) and not(vga_A(14)),
					 s2=>(lowerVRAM(1) xor not(vga_A(15))) and (lowerVRAM(0) xor not(vga_A(14))),
					 DATA0(7 downto 0)=>vga_D(7 downto 0));
   
	
	
	
--   XLXI_5 : INV
--      port map (I=>vga_A(14),
--                O=>XLXN_23);
--XLXN_23<=not(vga_A(14)); -- and ignoreA14;
   
   XLXI_7 : and_then
      port map (A=>vram_W,
                B=>(upperVRAM(1) xor not(vram_A(15))) and (upperVRAM(0) xor not(vram_A(14))), --&C000-FFFF
                C=>wUpper);
   
	--&8000-BFFF
   XLXI_8 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>wLower,
                vga_D(7 downto 0)=>dLower(7 downto 0));
   
	--&C000-FFFF
   XLXI_9 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
                vga_CLK=>vga_CLK,
                vram_A(13 downto 0)=>vram_A(13 downto 0),
                vram_CLK=>vram_CLK,
                vram_D(7 downto 0)=>vram_D(7 downto 0),
                vram_W=>wUpper,
                vga_D(7 downto 0)=>dUpper(7 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity joykeyb_MUSER_amstrad_motherboard is
   port ( CLK4MHz   : in    std_logic; 
          joystick1 : in    std_logic_vector (5 downto 0); 
          joystick2 : in    std_logic_vector (5 downto 0); 
          PPI_portC : in    std_logic_vector (3 downto 0); 
          PS2_CLK   : in    std_logic; 
          PS2_DATA  : in    std_logic; 
          key_reset : out   std_logic_vector(1 downto 0); 
          PPI_portA : out   std_logic_vector (7 downto 0));
end joykeyb_MUSER_amstrad_motherboard;

architecture BEHAVIORAL of joykeyb_MUSER_amstrad_motherboard is
   attribute BOX_TYPE   : string ;
   signal PPI_enable : std_logic;
   signal XLXN_27    : std_logic_vector (9 downto 0);
   signal XLXN_29    : std_logic_vector (7 downto 0);
   signal XLXN_30    : std_logic;
   signal XLXN_31    : std_logic;
   signal XLXN_56    : std_logic;
   signal XLXN_57    : std_logic;
   component KEYBOARD_driver
      port ( CLK       : in    std_logic; 
             enable    : in    std_logic; 
             press     : in    std_logic; 
             unpress   : in    std_logic; 
             portC     : in    std_logic_vector (3 downto 0); 
             joystick1 : in    std_logic_vector (5 downto 0); 
             joystick2 : in    std_logic_vector (5 downto 0); 
             keycode   : in    std_logic_vector (9 downto 0); 
             key_reset : out   std_logic;
				 key_reset_space : out std_logic;
             portA     : out   std_logic_vector (7 downto 0));
   end component;
   
   component KEYBOARD_controller
      port ( CLK         : in    std_logic; 
             fok         : in    std_logic; 
             scancode_in : in    std_logic_vector (7 downto 0); 
             press       : out   std_logic; 
             unpress     : out   std_logic; 
             keycode     : out   std_logic_vector (9 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component Keyboard
      port ( datain   : in    std_logic; 
             clkin    : in    std_logic; 
             fclk     : in    std_logic; 
             rst      : in    std_logic; 
             fok      : out   std_logic; 
             scancode : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_2 : KEYBOARD_driver
      port map (CLK=>CLK4MHz,
                enable=>PPI_enable,
                joystick1(5 downto 0)=>joystick1(5 downto 0),
                joystick2(5 downto 0)=>joystick2(5 downto 0),
                keycode(9 downto 0)=>XLXN_27(9 downto 0),
                portC(3 downto 0)=>PPI_portC(3 downto 0),
                press=>XLXN_30,
                unpress=>XLXN_31,
                key_reset=>key_reset(1),
					 key_reset_space=>key_reset(0),
                portA(7 downto 0)=>PPI_portA(7 downto 0));
   
   XLXI_3 : KEYBOARD_controller
      port map (CLK=>CLK4MHz,
                fok=>XLXN_57,
                scancode_in(7 downto 0)=>XLXN_29(7 downto 0),
                keycode(9 downto 0)=>XLXN_27(9 downto 0),
                press=>XLXN_30,
                unpress=>XLXN_31);
   
--   XLXI_4 : VCC
--      port map (P=>PPI_enable);
PPI_enable<='1';
   
   XLXI_489 : Keyboard
      port map (clkin=>PS2_CLK,
                datain=>PS2_DATA,
                fclk=>CLK4MHz,
                rst=>XLXN_56,
                fok=>XLXN_57,
                scancode(7 downto 0)=>XLXN_29(7 downto 0));
   
--   XLXI_490 : GND
--      port map (G=>XLXN_56);
XLXN_56<='0';
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity FPGAmstrad_amstrad_motherboard is
   port ( CLK4MHz    : in    std_logic; 
          --FDD_input  : in    std_logic_vector (5 downto 0); 
          init_A     : in    std_logic_vector (22 downto 0); 
          init_Din   : in    std_logic_vector (7 downto 0); 
          init_R_n   : in    std_logic; 
          init_W_n   : in    std_logic;
          JOYSTICK1  : in    std_logic_vector (5 downto 0); 
          JOYSTICK2  : in    std_logic_vector (5 downto 0); 
          nCLK4MHz   : in    std_logic; 
          PS2_CLK    : in    std_logic; 
          PS2_DATA   : in    std_logic; 
          ram_Din    : in    std_logic_vector (7 downto 0); 
          RESET_n    : in    std_logic;
			 --dbBuffVRAM : in    std_logic;
			 CLK_PWM    : in    std_logic;
			 lowerVRAM : in std_logic_vector(1 downto 0);
			 upperVRAM : in std_logic_vector(1 downto 0);
			 ppi_jumpers : in std_logic_vector(3 downto 0);
			 is_dskReady : in std_logic_vector(1 downto 0);
          audio_AB      : out   std_logic; 
			 audio_BC      : out   std_logic; 
          --FDD_output : out   std_logic_vector (6 downto 0); 
          init_Dout  : out   std_logic_vector (7 downto 0); 
          key_reset  : out   std_logic_vector (1 downto 0); 
          palette_A  : out   std_logic_vector (13 downto 0); 
          palette_D  : out   std_logic_vector (7 downto 0); 
          palette_W  : out   std_logic; 
          --RAMBank    : out   std_logic_vector (2 downto 0); 
          ram_A      : out   std_logic_vector (22 downto 0); 
          ram_Dout   : out   std_logic_vector (7 downto 0); 
          ram_R      : out   std_logic; 
          ram_W      : out   std_logic; 
          --ROMbank    : out   std_logic_vector (7 downto 0); 
          --ROMen      : out   std_logic; 
          vram_A     : out   std_logic_vector (14 downto 0); 
          vram_D     : out   std_logic_vector (7 downto 0); -- pixel_DATA
          vram_W     : out   std_logic;
			  megashark_CHRNresult : in STD_LOGIC_VECTOR(4*8-1 downto 0); -- chr+1 quand W/R, chrn quand goto0
			  megashark_doGOTO : out std_logic_vector(2 downto 0); -- not a W/R operation finally
			  megashark_CHRN : out STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : out std_logic_vector(8 downto 0); -- sector byte selection
			  megashark_Din : in std_logic_vector(7 downto 0);
			  megashark_Dout : out std_logic_vector(7 downto 0);
			  megashark_doREAD : out std_logic;
			  megashark_doWRITE : out std_logic;
			  megashark_done : in std_logic;
			  megashark_face : out std_logic;
			  megashark_INFO_2SIDES : in std_logic;
			  megashark_INFO_ST1 : in std_logic_vector(7 downto 0);
			  megashark_INFO_ST2 : in std_logic_vector(7 downto 0);
			  CLK16MHz : in std_logic;
			 
			 
			 RED_out : out  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_out : out  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_out : out  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_out : out STD_logic;
			  VSYNC_out : out STD_logic
			 
			  );
end FPGAmstrad_amstrad_motherboard;

architecture BEHAVIORAL of FPGAmstrad_amstrad_motherboard is
   attribute KEEP_HIERARCHY : string ;
   attribute BOX_TYPE       : string ;
   attribute HU_SET         : string ;
   signal A             : std_logic_vector (15 downto 0);
   signal D             : std_logic_vector (7 downto 0);
   signal IO_RD         : std_logic;
   signal IO_REQ        : std_logic;
   signal IO_WR         : std_logic;
   signal LED1          : std_logic;
   signal LED2          : std_logic;
   signal MEM_RD        : std_logic;
   signal MEM_WR        : std_logic;
   signal n_crtc_vsync  : std_logic;
   signal portC         : std_logic_vector (7 downto 0);
   signal un            : std_logic;
   signal XLXN_16       : std_logic;
   signal XLXN_38       : std_logic;
   signal XLXN_58       : std_logic;
   signal XLXN_75       : std_logic;
   signal XLXN_86       : std_logic;
   signal XLXN_180      : std_logic;
   --signal XLXN_283      : std_logic_vector (7 downto 0);
	signal MIX_DOUT : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT0 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT1 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT01 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT2 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT3 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT23 : std_logic_vector (7 downto 0):=(others=>'1');
	
	
   --signal XLXN_303      : std_logic;
   signal XLXN_462      : std_logic_vector (7 downto 0);
   signal XLXN_464      : std_logic;
   signal XLXN_470      : std_logic;
   signal XLXN_473      : std_logic;
   signal XLXN_474      : std_logic;
   signal XLXN_475      : std_logic;
   signal XLXN_486_AB      : std_logic_vector (7 downto 0);
	signal XLXN_486_BC      : std_logic_vector (7 downto 0);
   --signal XLXN_498      : std_logic;
   --signal XLXN_499      : std_logic;
   signal XLXN_518      : std_logic_vector (7 downto 0);
   signal XLXN_519      : std_logic_vector (7 downto 0);
   signal XLXN_551      : std_logic;
   signal XLXN_785      : std_logic;
   signal XLXN_786      : std_logic;
   signal XLXN_787      : std_logic;
   signal XLXN_802      : std_logic;
   signal XLXN_806      : std_logic;
   signal XLXN_807      : std_logic;
   signal XLXN_814      : std_logic;
   signal XLXN_824      : std_logic;
   signal XLXN_826      : std_logic;
   signal XLXN_830      : std_logic;
   signal XLXN_835      : std_logic;
   signal XLXN_845      : std_logic;
   signal XLXN_857      : std_logic_vector (1 downto 0);
   signal XLXN_868      : std_logic_vector (15 downto 0);
   signal XLXN_869      : std_logic_vector (7 downto 0);
   signal XLXN_872      : std_logic;
   signal XLXN_874      : std_logic_vector (15 downto 0);
   signal XLXN_884      : std_logic;
   signal XLXN_904      : std_logic;
   signal XLXN_907      : std_logic;
   --signal XLXN_916      : std_logic;
  -- signal XLXN_918      : std_logic;
   signal XLXN_940      : std_logic;
	signal SOUND_CLK     : std_logic;
   signal xram_A        : std_logic_vector (22 downto 0);
   signal ROMbank_DUMMY : std_logic_vector (7 downto 0);
   signal ram_W_DUMMY   : std_logic;
   signal RAMBank_DUMMY : std_logic_vector (2 downto 0);
   signal RAMBank_DUMMY512 : std_logic_vector (2 downto 0);
   component T80se_p
      port ( RESET_n : in    std_logic; -- under time constraint test
             CLK_n   : in    std_logic; 
             CLKEN   : in    std_logic; 
             WAIT_n  : in    std_logic; 
             INT_n   : in    std_logic; 
             NMI_n   : in    std_logic; 
             BUSRQ_n : in    std_logic; 
             DI      : in    std_logic_vector (7 downto 0); 
             M1_n    : out   std_logic; 
             MREQ_n  : out   std_logic; 
             IORQ_n  : out   std_logic; 
             RD_n    : out   std_logic; 
             WR_n    : out   std_logic; 
             RFSH_n  : out   std_logic; 
             HALT_n  : out   std_logic; 
             BUSAK_n : out   std_logic; 
             A       : out   std_logic_vector (15 downto 0); 
             DO      : out   std_logic_vector (7 downto 0));
   end component;
   
   component simple_GateArray
      port ( CLK        : in    std_logic; 
             reset      : in    std_logic; 
             IO_REQ_W   : in    std_logic; 
             A15_A14    : in    std_logic_vector (1 downto 0); 
             D          : in    std_logic_vector (7 downto 0); 
             lowerROMen : out   std_logic; 
             upperROMen : out   std_logic; 
             MODE       : out   std_logic_vector (1 downto 0); 
             RAMbank    : out   std_logic_vector (2 downto 0);
			 RAMbank512 : out   std_logic_vector (2 downto 0)
			 );
   end component;
   
   component simple_GateArrayInterrupt
      port ( IO_REQ_W      : in    std_logic; 
             IO_REQ_R      : in    std_logic; 
             IO_ACK        : in    std_logic; 
             M1_n          : in    std_logic; 
             MEM_WR        : in    std_logic; 
             reset         : in    std_logic; 
             A15_A14_A9_A8 : in    std_logic_vector (3 downto 0); 
             MODE_select   : in    std_logic_vector (1 downto 0); 
             D             : in    std_logic_vector (7 downto 0); 
             crtc_D        : in    std_logic_vector (7 downto 0); 
             Dout          : inout std_logic_vector (7 downto 0);
				 --ecoleFix:in std_logic;
             crtc_VSYNC    : out   std_logic; 
             bvram_W       : out   std_logic; 
             crtc_R        : out   std_logic; 
             int           : out   std_logic;
             WAIT_MEM_n    : out   std_logic;
             WAIT_n        : out   std_logic;
				 SOUND_CLK     : out   std_logic;
             palette_W     : out   std_logic; 
             crtc_A        : out   std_logic_vector (15 downto 0); 
             bvram_A       : out   std_logic_vector (14 downto 0); 
             bvram_D       : out   std_logic_vector (7 downto 0); 
             palette_A     : out   std_logic_vector (13 downto 0); 
             palette_D     : out   std_logic_vector (7 downto 0); 
             nCLK4_1       : in    std_logic;
				 CLK16MHz       : in    std_logic;
				 RED_out : out  STD_LOGIC_VECTOR (5 downto 0);
				 GREEN_out : out  STD_LOGIC_VECTOR (5 downto 0);
				 BLUE_out : out  STD_LOGIC_VECTOR (5 downto 0);
				 HSYNC_out : out STD_logic;
				 VSYNC_out : out STD_logic
				 );
   end component;
   
   component ROMselect
      port ( CLK     : in    std_logic; 
             reset   : in    std_logic; 
             A13     : in    std_logic; 
             IO_WR   : in    std_logic; 
             D       : in    std_logic_vector (7 downto 0); 
             ROMbank : out   std_logic_vector (7 downto 0));
   end component;
   
--   component I82C55
--      port ( I_CS_L    : in    std_logic; 
--             I_RD_L    : in    std_logic; 
--             I_WR_L    : in    std_logic; 
--             RESET     : in    std_logic; 
--             ENA       : in    std_logic; 
--             CLK       : in    std_logic; 
--             I_ADDR    : in    std_logic_vector (1 downto 0); 
--             I_DATA    : in    std_logic_vector (7 downto 0); 
--             I_PA      : in    std_logic_vector (7 downto 0); 
--             I_PB      : in    std_logic_vector (7 downto 0); 
--             I_PC      : in    std_logic_vector (7 downto 0); 
--             IO_DATA   : inout std_logic_vector (7 downto 0); 
--             O_PA      : out   std_logic_vector (7 downto 0); 
--             O_PA_OE_L : out   std_logic_vector (7 downto 0); 
--             O_PB      : out   std_logic_vector (7 downto 0); 
--             O_PB_OE_L : out   std_logic_vector (7 downto 0); 
--             O_PC      : out   std_logic_vector (7 downto 0); 
--             O_PC_OE_L : out   std_logic_vector (7 downto 0));
--   end component;
	
	component pio
    port (
	addr			: in STD_LOGIC_VECTOR (1 downto 0);
	datain			: in STD_LOGIC_VECTOR (7 downto 0);
	cs				: in STD_LOGIC;
	iowr			: in STD_LOGIC;
	iord			: in STD_LOGIC;
	cpuclk			: in STD_LOGIC;
	
	PBI				: in STD_LOGIC_VECTOR (7 downto 0);
	PAI				: in STD_LOGIC_VECTOR (7 downto 0);		--Keyboarddaten
	PAO     		: buffer STD_LOGIC_VECTOR (7 downto 0);		--sounddaten
	PCO     		: out STD_LOGIC_VECTOR (7 downto 0);		--tastatur und steuerung
	DO		     	: out STD_LOGIC_VECTOR (7 downto 0)
    );
	end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AmstradRAMROM
      port ( wr_z80     : in    std_logic; 
             wr_io_z80  : in    std_logic; 
             lowerROMen : in    std_logic; 
             upperROMen : in    std_logic;
				 --ROMarea:out std_logic;
             A          : in    std_logic_vector (15 downto 0); 
             RAMbank    : in    std_logic_vector (2 downto 0);
			 RAMbank512 : in    std_logic_vector (2 downto 0);
             ROMbank    : in    std_logic_vector (7 downto 0); 
             ram_A      : out   std_logic_vector (22 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component simple_DSK
      port ( nCLK4_1        : in    std_logic; 
             reset          : in    std_logic; 
             A0             : in    std_logic; 
             IO_RD          : in    std_logic; 
             IO_WR          : in    std_logic; 
				 is_dskReady    : in    std_logic_vector (1 downto 0);
             A10_A8_A7      : in    std_logic_vector (2 downto 0); 
             D_command      : in    std_logic_vector (7 downto 0); 
            -- FDD_input      : in    std_logic_vector (5 downto 0); 
             D_result       : inout std_logic_vector (7 downto 0); 
            -- FDD_output     : out   std_logic_vector (6 downto 0)
				  megashark_CHRNresult : in STD_LOGIC_VECTOR(4*8-1 downto 0); -- chr+1 quand W/R, chrn quand goto0
			  megashark_doGOTO : out std_logic_vector(2 downto 0); -- not a W/R operation finally
			  megashark_CHRN : out STD_LOGIC_VECTOR(4*8-1 downto 0);
			  megashark_A : out std_logic_vector(8 downto 0); -- sector byte selection
			  megashark_Din : in std_logic_vector(7 downto 0);
			  megashark_Dout : out std_logic_vector(7 downto 0);
			  megashark_doREAD : out std_logic;
			  megashark_doWRITE : out std_logic;
			  megashark_done : in std_logic;
			  megashark_face : out std_logic;
			  megashark_INFO_2SIDES : in std_logic;
			  megashark_INFO_ST1 : in std_logic_vector(7 downto 0);
			  megashark_INFO_ST2 : in std_logic_vector(7 downto 0)
				 );
   end component;
   
	component AmstradRAM
    port ( reset:in  STD_LOGIC;
			  init_done:in  STD_LOGIC;
			  init_A : in  STD_LOGIC_VECTOR (22 downto 0);
			  init_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  init_Dout: out  STD_LOGIC_VECTOR (7 downto 0);
			  init_W_n : in STD_LOGIC;
			  init_R_n : in STD_LOGIC;
           
			  A : in  STD_LOGIC_VECTOR (22 downto 0);
           rd:in STD_LOGIC; -- Z80 MEM_RD
			  wr:in STD_LOGIC; -- Z80 MEM_WR
			  Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  Dout : inout  STD_LOGIC_VECTOR (7 downto 0); -- against I82C55.IO_DATA
			  
			  ram_A : out  STD_LOGIC_VECTOR (22 downto 0);
			  ram_W : out  STD_LOGIC:='0'; -- sim
           ram_R : out  STD_LOGIC:='0'; -- sim
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0);
			  ram_Dout : out STD_LOGIC_VECTOR (7 downto 0);
			  
			  vram_A:out STD_LOGIC_VECTOR (15 downto 0);
			  vram_A_isValid:out std_logic
			  );
   end component;

   
   component YM2149
      port ( I_A9_L    : in    std_logic; 
             I_A8      : in    std_logic; 
             I_BDIR    : in    std_logic; 
             I_BC2     : in    std_logic; 
             I_BC1     : in    std_logic; 
             I_SEL_L   : in    std_logic; 
             ENA       : in    std_logic; 
             RESET_L   : in    std_logic; 
             CLK       : in    std_logic; 
             I_DA      : in    std_logic_vector (7 downto 0); 
             I_IOA     : in    std_logic_vector (7 downto 0); 
             O_DA_OE_L : out   std_logic; 
             O_DA      : out   std_logic_vector (7 downto 0); 
             O_AUDIO_AB   : out   std_logic_vector (7 downto 0);
				 O_AUDIO_BC   : out   std_logic_vector (7 downto 0));
   end component;
   
   component PWM
      port ( clk     : in    std_logic; 
             PWM_in  : in    std_logic_vector (7 downto 0); 
             PWM_out : out   std_logic; 
             clk_ref : in    std_logic);
   end component;
   
--   component CB4CE_HXILINX_amstrad_motherboard
--      port ( C   : in    std_logic; 
--             CE  : in    std_logic; 
--             CLR : in    std_logic; 
--             CEO : out   std_logic; 
--             Q0  : out   std_logic; 
--             Q1  : out   std_logic; 
--             Q2  : out   std_logic; 
--             Q3  : out   std_logic; 
--             TC  : out   std_logic);
--   end component;
   
   component joykeyb_MUSER_amstrad_motherboard
      port ( CLK4MHz   : in    std_logic; 
             PPI_portC : in    std_logic_vector (3 downto 0); 
             joystick1 : in    std_logic_vector (5 downto 0); 
             joystick2 : in    std_logic_vector (5 downto 0); 
             PS2_DATA  : in    std_logic; 
             PS2_CLK   : in    std_logic; 
             PPI_portA : out   std_logic_vector (7 downto 0); 
             key_reset : out   std_logic_vector(1 downto 0));
   end component;
   
   component please_wait
      port ( CLK_n      : in    std_logic; 
             WAIT_n     : in    std_logic; 
             CLK_WAIT_n : out   std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component VRAM32Ko_Amstrad_MUSER_amstrad_motherboard
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (15 downto 0); 
             vga_A    : in    std_logic_vector (15 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0);
				 lowerVRAM : in std_logic_vector(1 downto 0);
			 upperVRAM : in std_logic_vector(1 downto 0);
				 --dbBuffVRAM   : in    std_logic; 
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
   
   attribute KEEP_HIERARCHY of GA : label is "TRUE";
   attribute KEEP_HIERARCHY of GA_interrupt : label is "TRUE";
   attribute KEEP_HIERARCHY of MyROMSelect : label is "TRUE";
   --attribute HU_SET of XLXI_399 : label is "XLXI_399_0";
	
	
	--signal ROMarea: std_logic;
begin

   --RAMBank(2 downto 0) <= RAMBank_DUMMY(2 downto 0);
   ram_W <= ram_W_DUMMY;
   --ROMbank(7 downto 0) <= ROMbank_DUMMY(7 downto 0);
   AmstradT80 : T80se_p
      port map (BUSRQ_n=>XLXN_16,
                CLKEN=>XLXN_16,
                CLK_n=>XLXN_802,
                DI(7 downto 0)=>MIX_DOUT(7 downto 0),
                INT_n=>XLXN_814,
                NMI_n=>XLXN_16,
                RESET_n=>RESET_n, -- under time constraint test
                WAIT_n=>XLXN_16,
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>open,
                DO(7 downto 0)=>D(7 downto 0),
                HALT_n=>open,
                IORQ_n=>XLXN_75,
                MREQ_n=>XLXN_58,
                M1_n=>XLXN_845,
                RD_n=>XLXN_86,
                RFSH_n=>open,
                WR_n=>XLXN_38);
   
	-- print inp(&0800)
	-- 255
	MIX_DOUT01<=MIX_DOUT0 and MIX_DOUT1;
	MIX_DOUT23<=MIX_DOUT2 and MIX_DOUT3;
	MIX_DOUT<=MIX_DOUT01 and MIX_DOUT23;
	
   GA : simple_GateArray
      port map (A15_A14(1 downto 0)=>A(15 downto 14),
                CLK=>nCLK4MHz,
                D(7 downto 0)=>D(7 downto 0),
                IO_REQ_W=>IO_WR,
                reset=>XLXN_907,
                lowerROMen=>LED1,
                MODE(1 downto 0)=>XLXN_857(1 downto 0),
                RAMbank(2 downto 0)=>RAMBank_DUMMY(2 downto 0),
				RAMbank512(2 downto 0)=>RAMBank_DUMMY512(2 downto 0),
                upperROMen=>LED2);
   
   GA_interrupt : simple_GateArrayInterrupt
      port map (A15_A14_A9_A8(3)=>A(15),
                A15_A14_A9_A8(2)=>A(14),
                A15_A14_A9_A8(1)=>A(9),
                A15_A14_A9_A8(0)=>A(8),
                crtc_D(7 downto 0)=>XLXN_869(7 downto 0),
                D(7 downto 0)=>D(7 downto 0),
                IO_ACK=>XLXN_826,
                IO_REQ_R=>IO_RD,
                IO_REQ_W=>IO_WR,
                MEM_WR=>MEM_WR, --XLXN_58,
                MODE_select(1 downto 0)=>XLXN_857(1 downto 0),
                M1_n=>XLXN_845,
                nCLK4_1=>nCLK4MHz,
					 CLK16MHz=>CLK16MHz,
					 --ecoleFix=>ecoleFix,
                reset=>XLXN_907,
                bvram_A(14 downto 0)=>vram_A(14 downto 0),
                bvram_D(7 downto 0)=>vram_D(7 downto 0),
					 --pixel_vsync=>pixel_vsync,
					 --pixel_hsync=>pixel_hsync,
                bvram_W=>vram_W,
                crtc_A(15 downto 0)=>XLXN_868(15 downto 0),
                crtc_R=>open,
                crtc_VSYNC=>n_crtc_vsync,
                int=>XLXN_835,
                palette_A(13 downto 0)=>palette_A(13 downto 0),
                palette_D(7 downto 0)=>palette_D(7 downto 0),
                palette_W=>palette_W,
                WAIT_MEM_n=>XLXN_807,
                WAIT_n=>XLXN_806,
					 SOUND_CLK=>SOUND_CLK,
                Dout(7 downto 0)=>MIX_DOUT0(7 downto 0), --inout
					 RED_out=>RED_out,
					 GREEN_out=>GREEN_out,
					 BLUE_out=>BLUE_out,
					 HSYNC_out=>HSYNC_out,
					 VSYNC_out=>VSYNC_out
					 );
   
   MyROMSelect : ROMselect
      port map (A13=>A(13),
                CLK=>nCLK4MHz,
                D(7 downto 0)=>D(7 downto 0),
                IO_WR=>IO_WR,
                reset=>XLXN_907,
                ROMbank(7 downto 0)=>ROMbank_DUMMY(7 downto 0));
   
	-- print inp(&0000)
	-- 255 (Caprice32) 0 (JavaCPC)
--   PPI : I82C55
--      port map (CLK=>nCLK4MHz,
--                ENA=>XLXN_303,
--                I_ADDR(1 downto 0)=>A(9 downto 8),
--                I_CS_L=>A(11),
--                I_DATA(7 downto 0)=>D(7 downto 0),
--                I_PA(7 downto 0)=>XLXN_519(7 downto 0),
--                I_PB(7)=>un, -- pull up (default)
--                I_PB(6)=>un, -- pull up (default)
--                I_PB(5)=>un, -- pull up (default)
--                I_PB(4)=>ppi_jumpers(3), --un, --50Hz
--                I_PB(3)=>ppi_jumpers(2), --un,
--                I_PB(2)=>ppi_jumpers(1), --zero,
--                I_PB(1)=>ppi_jumpers(0), --un,
--                I_PB(0)=>n_crtc_vsync,
--                I_PC(7)=>un, -- pull up (default)
--                I_PC(6)=>un, -- pull up (default)
--                I_PC(5)=>un, -- pull up (default)
--                I_PC(4)=>un, -- pull up (default)
--                I_PC(3)=>un, -- pull up (default)
--                I_PC(2)=>un, -- pull up (default)
--                I_PC(1)=>un, -- pull up (default)
--                I_PC(0)=>un, -- pull up (default)
--                I_RD_L=>XLXN_180,
--                I_WR_L=>XLXN_904,
--                RESET=>XLXN_907,
--                O_PA(7 downto 0)=>XLXN_462(7 downto 0),
--                O_PA_OE_L=>open,
--                O_PB=>open,
--                O_PB_OE_L=>open,
--                O_PC(7 downto 0)=>portC(7 downto 0),
--                O_PC_OE_L=>open,
--                IO_DATA(7 downto 0)=>MIX_DOUT1(7 downto 0)); -- inout
					 
	PPI : pio		 
		 port map (
	addr(1 downto 0)=>A(9 downto 8),
	datain(7 downto 0)=>D(7 downto 0),
	cs=>A(11),
	iowr=>XLXN_904,
	iord=>XLXN_180,
	cpuclk=>nCLK4MHz,
	
	PBI(7)=>un, -- pull up (default)
	PBI(6)=>un, -- pull up (default)
	PBI(5)=>un, -- pull up (default)
	PBI(4)=>ppi_jumpers(3), --un, --50Hz
	PBI(3)=>ppi_jumpers(2), --un,
	PBI(2)=>ppi_jumpers(1), --zero,
	PBI(1)=>ppi_jumpers(0), --un,
	PBI(0)=>n_crtc_vsync,
	
	PAI(7 downto 0)=>XLXN_519(7 downto 0),
	PAO(7 downto 0)=>XLXN_462(7 downto 0),
	PCO(7 downto 0)=>portC(7 downto 0),
	DO(7 downto 0)=>MIX_DOUT1(7 downto 0)
    );

	 
--   XLXI_168 : VCC
--      port map (P=>XLXN_16);
XLXN_16<='1';
   
--   XLXI_170 : AND2
--      port map (I0=>XLXN_785,
--                I1=>XLXN_786,
--                O=>MEM_WR);
MEM_WR<=XLXN_785 and XLXN_786;
   
   XLXI_173 : AmstradRAMROM
      port map (A(15 downto 0)=>A(15 downto 0),
                lowerROMen=>LED1,
					 --ROMarea=>ROMarea,
                RAMbank(2 downto 0)=>RAMBank_DUMMY(2 downto 0),
				RAMbank512(2 downto 0)=>RAMBank_DUMMY512(2 downto 0),
                ROMbank(7 downto 0)=>ROMbank_DUMMY(7 downto 0),
                upperROMen=>LED2,
                wr_io_z80=>IO_WR,
                wr_z80=>MEM_WR,
                ram_A(22 downto 0)=>xram_A(22 downto 0));
   
--   XLXI_181 : INV
--      port map (I=>XLXN_58,
--                O=>XLXN_786);
XLXN_786<=not(XLXN_58);
   
--   XLXI_183 : INV
--      port map (I=>XLXN_75,
--                O=>IO_REQ);
IO_REQ<=not(XLXN_75);
   
--   XLXI_184 : AND2
--      port map (I0=>IO_REQ,
--                I1=>XLXN_785,
--                O=>IO_WR);
IO_WR<=IO_REQ and XLXN_785;
   
--   XLXI_186 : INV
--      port map (I=>XLXN_86,
--                O=>XLXN_787);
XLXN_787<=not(XLXN_86);
   
--   XLXI_187 : AND2
--      port map (I0=>XLXN_787,
--                I1=>XLXN_786,
--                O=>MEM_RD);
MEM_RD<=XLXN_787 and XLXN_786;
   
--   XLXI_219 : AND2
--      port map (I0=>XLXN_787,
--                I1=>IO_REQ,
--                O=>IO_RD);
IO_RD<=XLXN_787 and IO_REQ;
   
	XLXI_348 : AmstradRAM
port map ( reset=>XLXN_907,
			  
			  init_done=>RESET_n, -- under time constraint test
			  init_A(22 downto 0)=>init_A(22 downto 0),
			  init_Din(7 downto 0)=>init_Din(7 downto 0),
			  init_Dout(7 downto 0)=>init_Dout(7 downto 0),
			  init_W_n=>init_W_n,
			  init_R_n=>init_R_n,
           
			  A(22 downto 0)=>xram_A(22 downto 0),
           rd=>MEM_RD, -- Z80 MEM_RD
			  wr=>MEM_WR, -- Z80 MEM_WR
			  Din(7 downto 0)=>D(7 downto 0),
			  Dout(7 downto 0)=>MIX_DOUT2(7 downto 0), -- against I82C55.IO_DATA inout
			  
			  ram_A(22 downto 0)=>ram_A(22 downto 0),
			  ram_W=>ram_W_DUMMY,
           ram_R=>ram_R,
           ram_Din(7 downto 0)=>ram_Din(7 downto 0),
			  ram_Dout(7 downto 0)=>ram_Dout(7 downto 0),
			  
			  vram_A(15 downto 0)=>XLXN_874(15 downto 0),
			  vram_A_isValid=>XLXN_872
			  );

   
--   XLXI_256 : VCC
--      port map (P=>un);
un<='1';
   
--   XLXI_257 : INV
--      port map (I=>IO_RD,
--                O=>XLXN_180);
XLXN_180<=not(IO_RD);
   
--   XLXI_258 : INV
--      port map (I=>IO_WR,
--                O=>XLXN_904);
XLXN_904<=not(IO_WR);
   
--   XLXI_306 : VCC
--      port map (P=>XLXN_303);
--XLXN_303<='1';
   
--   XLXI_307 : INV
--      port map (I=>RESET_n,
--                O=>XLXN_907);
XLXN_907<=not(RESET_n);
   
--   XLXI_332 : INV
--      port map (I=>XLXN_835,
--                O=>XLXN_814);
XLXN_814<=not(XLXN_835);
   
   XLXI_344 : simple_DSK
      port map (A0=>A(0),
                A10_A8_A7(2)=>A(10),
                A10_A8_A7(1)=>A(8),
                A10_A8_A7(0)=>A(7),
                D_command(7 downto 0)=>D(7 downto 0),
                --FDD_input(5 downto 0)=>FDD_input(5 downto 0),
                IO_RD=>IO_RD,
                IO_WR=>IO_WR,
					 is_dskReady=>is_dskReady,
                nCLK4_1=>nCLK4MHz,
                reset=>XLXN_907,
                --FDD_output(6 downto 0)=>FDD_output(6 downto 0),
                D_result(7 downto 0)=>MIX_DOUT3(7 downto 0), -- inout
			  megashark_CHRNresult=>megashark_CHRNresult,
			  megashark_doGOTO=>megashark_doGOTO,
			  megashark_CHRN=>megashark_CHRN,
			  megashark_A=>megashark_A,
			  megashark_Din=>megashark_Din,
			  megashark_Dout=>megashark_Dout,
			  megashark_doREAD=>megashark_doREAD,
			  megashark_doWRITE=>megashark_doWRITE,
			  megashark_done=>megashark_done,
			  megashark_face=>megashark_face,
			  megashark_INFO_2SIDES=>megashark_INFO_2SIDES,
			  megashark_INFO_ST1=>megashark_INFO_ST1,
			  megashark_INFO_ST2=>megashark_INFO_ST2
					 );
   

   
   XLXI_349 : YM2149
      port map (CLK=>SOUND_CLK,
                ENA=>XLXN_473,
                I_A8=>XLXN_464,
                I_A9_L=>XLXN_475,
                I_BC1=>portC(6),
                I_BC2=>XLXN_470,
                I_BDIR=>portC(7),
                I_DA(7 downto 0)=>XLXN_462(7 downto 0),
                I_IOA(7 downto 0)=>XLXN_518(7 downto 0),
                I_SEL_L=>XLXN_474,
                RESET_L=>RESET_n,
                O_AUDIO_AB(7 downto 0)=>XLXN_486_AB(7 downto 0),
					 O_AUDIO_BC(7 downto 0)=>XLXN_486_BC(7 downto 0),
                O_DA(7 downto 0)=>XLXN_519(7 downto 0),
                O_DA_OE_L=>open);
   
--   XLXI_350 : VCC
--      port map (P=>XLXN_464);
XLXN_464<='1';
   
--   XLXI_351 : VCC
--      port map (P=>XLXN_470);
XLXN_470<='1';
   
--   XLXI_355 : GND
--      port map (G=>XLXN_475);
XLXN_475<='0';
   
   XLXI_367_AB : PWM
      port map (clk=>CLK_PWM,--nCLK4MHz,
                clk_ref=>SOUND_CLK,
                PWM_in(7 downto 0)=>XLXN_486_AB(7 downto 0),
                PWM_out=>audio_AB);
	XLXI_367_BC : PWM
      port map (clk=>CLK_PWM,--nCLK4MHz,
                clk_ref=>SOUND_CLK,
                PWM_in(7 downto 0)=>XLXN_486_BC(7 downto 0),
                PWM_out=>audio_BC);
   
--   XLXI_377 : VCC
--      port map (P=>XLXN_473);
XLXN_473<='1';
   
--   XLXI_383 : VCC
--      port map (P=>XLXN_498);
--XLXN_498<='1';
   
--   XLXI_384 : GND
--      port map (G=>XLXN_499);
--XLXN_499<='0';
   
--   XLXI_385 : VCC
--      port map (P=>XLXN_474);
XLXN_474<='1';
   
   --XLXI_399 : CB4CE_HXILINX_amstrad_motherboard
     -- port map (C=>nCLK4MHz,
     --           CE=>XLXN_498,
     --           CLR=>XLXN_499,
     --           CEO=>open,
      --          Q0=>open,
      --          Q1=>XLXN_940,
      --          Q2=>open,
      --          Q3=>open,
      --          TC=>open);
   
--   XLXI_475 : AND2
--      port map (I0=>XLXN_824,
--                I1=>IO_REQ,
--                O=>XLXN_826);
XLXN_826<=XLXN_824 and IO_REQ;
   
--   XLXI_476 : INV
--      port map (I=>XLXN_845,
--                O=>XLXN_824);
XLXN_824<=not(XLXN_845);
   
   XLXI_494 : joykeyb_MUSER_amstrad_motherboard
      port map (CLK4MHz=>nCLK4MHz,
                joystick1(5 downto 0)=>JOYSTICK1(5 downto 0),
                joystick2(5 downto 0)=>JOYSTICK2(5 downto 0),
                PPI_portC(3 downto 0)=>portC(3 downto 0),
                PS2_CLK=>PS2_CLK,
                PS2_DATA=>PS2_DATA,
                key_reset=>key_reset,
                PPI_portA(7 downto 0)=>XLXN_518(7 downto 0));
   
--   XLXI_549 : INV
--      port map (I=>XLXN_38,
--                O=>XLXN_785);
XLXN_785<=not(XLXN_38);
   
   XLXI_568 : please_wait
      port map (CLK_n=>CLK4MHz,
                WAIT_n=>XLXN_830,
                CLK_WAIT_n=>XLXN_802);
   
--   XLXI_570 : AND2
--      port map (I0=>XLXN_807,
--                I1=>XLXN_806,
--                O=>XLXN_830);
XLXN_830<=XLXN_807 and XLXN_806; -- MEM_WR and M1
   
--   XLXI_583 : OR2
--      port map (I0=>LED2,
--                I1=>LED1,
--                O=>ROMen);
--ROMen<=LED2 or LED1;
   
   XLXI_589 : VRAM32Ko_Amstrad_MUSER_amstrad_motherboard
      port map (vga_A(15 downto 0)=>XLXN_868(15 downto 0),
                vga_CLK=>CLK4MHz,
                vram_A(15 downto 0)=>XLXN_874(15 downto 0),
                vram_CLK=>nCLK4MHz,
                vram_D(7 downto 0)=>D(7 downto 0),
                vram_W=>XLXN_884,
					 lowerVRAM=>lowerVRAM,
					 upperVRAM=>upperVRAM,
					 --dbBuffVRAM=>dbBuffVRAM,
                vga_D(7 downto 0)=>XLXN_869(7 downto 0));
   
--   XLXI_590 : AND2
--      port map (I0=>ram_W_DUMMY,
--                I1=>XLXN_872,
--                O=>XLXN_884);
XLXN_884<=ram_W_DUMMY and XLXN_872;
   
end BEHAVIORAL;


