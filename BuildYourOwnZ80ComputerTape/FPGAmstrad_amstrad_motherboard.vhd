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

--library ieee;
--use ieee.std_logic_1164.ALL;
--use ieee.numeric_std.ALL;
--
--entity VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard is
--   port ( vga_A    : in    std_logic_vector (13 downto 0); 
--          vga_CLK  : in    std_logic; 
--          vram_A   : in    std_logic_vector (13 downto 0); 
--          vram_CLK : in    std_logic; 
--          vram_D   : in    std_logic_vector (7 downto 0); 
--          vram_W   : in    std_logic; 
--          vga_D    : out   std_logic_vector (7 downto 0));
--end VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard;
--
--architecture BEHAVIORAL of VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard is
--   component VRAM_Amstrad_MiST
--      port ( vram_A   : in    std_logic_vector (13 downto 0); 
--             vga_A    : in    std_logic_vector (13 downto 0); 
--             vram_CLK : in    std_logic; 
--             vga_CLK  : in    std_logic; 
--             vram_W   : in    std_logic; 
--             vram_D   : in    std_logic; 
--             vga_D    : out   std_logic);
--   end component;
--   
--begin
--   XLXI_30 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(0),
--                vram_W=>vram_W,
--                vga_D=>vga_D(0));
--   
--   XLXI_31 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(1),
--                vram_W=>vram_W,
--                vga_D=>vga_D(1));
--   
--   XLXI_32 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(2),
--                vram_W=>vram_W,
--                vga_D=>vga_D(2));
--   
--   XLXI_33 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(3),
--                vram_W=>vram_W,
--                vga_D=>vga_D(3));
--   
--   XLXI_34 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(4),
--                vram_W=>vram_W,
--                vga_D=>vga_D(4));
--   
--   XLXI_35 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(5),
--                vram_W=>vram_W,
--                vga_D=>vga_D(5));
--   
--   XLXI_36 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(6),
--                vram_W=>vram_W,
--                vga_D=>vga_D(6));
--   
--   XLXI_37 : VRAM_Amstrad_MiST
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D=>vram_D(7),
--                vram_W=>vram_W,
--                vga_D=>vga_D(7));
--   
--end BEHAVIORAL;



--library ieee;
--use ieee.std_logic_1164.ALL;
--use ieee.numeric_std.ALL;

--entity VRAM32Ko_Amstrad_MUSER_amstrad_motherboard is
--   port ( vga_A    : in    std_logic_vector (15 downto 0); 
--          vga_CLK  : in    std_logic; 
--          vram_A   : in    std_logic_vector (15 downto 0); 
--          vram_CLK : in    std_logic; 
--          vram_D   : in    std_logic_vector (7 downto 0); 
--          vram_W   : in    std_logic;
--			 --lowerVRAM : in std_logic_vector(1 downto 0);
--			 --upperVRAM : in std_logic_vector(1 downto 0);
--          vga_D    : out   std_logic_vector (7 downto 0));
--end VRAM32Ko_Amstrad_MUSER_amstrad_motherboard;
--
--architecture BEHAVIORAL of VRAM32Ko_Amstrad_MUSER_amstrad_motherboard is
--   attribute BOX_TYPE   : string ;
--   signal wLower  : std_logic;
--   signal wUpper  : std_logic;
--   signal dLower  : std_logic_vector (7 downto 0):="00000000"; 
--   signal dUpper  : std_logic_vector (7 downto 0):=(others=>'0');
--   component and_then
--      port ( A : in    std_logic; 
--             B : in    std_logic; 
--             C : out   std_logic);
--   end component;
--   
--   component SELECT8tris
--      port ( s1    : in    std_logic;
--				 s2    : in    std_logic; 
--             DATA1 : in    std_logic_vector (7 downto 0); 
--             DATA2 : in    std_logic_vector (7 downto 0); 
--             DATA3 : in    std_logic_vector (7 downto 0); 
--             DATA0 : out   std_logic_vector (7 downto 0));
--   end component;
--   
--   component VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
--      port ( vram_CLK : in    std_logic; 
--             vga_CLK  : in    std_logic; 
--             vram_A   : in    std_logic_vector (13 downto 0); 
--             vga_A    : in    std_logic_vector (13 downto 0); 
--             vram_W   : in    std_logic; 
--             vram_D   : in    std_logic_vector (7 downto 0); 
--             vga_D    : out   std_logic_vector (7 downto 0));
--   end component;
--   
--begin
--
--   XLXI_2 : and_then
--      port map (A=>vram_W,
--                --B=>vram_A(15) and not(vram_A(14)),
--					 B=>('1' xor not(vram_A(15))) and ('0' xor not(vram_A(14))),
--                C=>wLower);
--   
--   XLXI_4 : SELECT8tris
--      port map (DATA1(7 downto 0)=>dUpper(7 downto 0), --&C000-FFFF
--                DATA2(7 downto 0)=>dLower(7 downto 0), --&8000-BFFF ?
--					 DATA3(7 downto 0)=>x"FF",
--                s1=>('1' xor not(vga_A(15))) and ('1' xor not(vga_A(14))),
--                --s2=>vga_A(15) and not(vga_A(14)),
--					 s2=>('1' xor not(vga_A(15))) and ('0' xor not(vga_A(14))),
--					 DATA0(7 downto 0)=>vga_D(7 downto 0));
--   
--   XLXI_7 : and_then
--      port map (A=>vram_W,
--                B=>('1' xor not(vram_A(15))) and ('1' xor not(vram_A(14))), --&C000-FFFF
--                C=>wUpper);
--   
--	--&8000-BFFF
--   XLXI_8 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D(7 downto 0)=>vram_D(7 downto 0),
--                vram_W=>wLower,
--                vga_D(7 downto 0)=>dLower(7 downto 0));
--   
--	--&C000-FFFF
--   XLXI_9 : VRAM_Amstrad_NEXYS4_16Ko_MUSER_amstrad_motherboard
--      port map (vga_A(13 downto 0)=>vga_A(13 downto 0),
--                vga_CLK=>vga_CLK,
--                vram_A(13 downto 0)=>vram_A(13 downto 0),
--                vram_CLK=>vram_CLK,
--                vram_D(7 downto 0)=>vram_D(7 downto 0),
--                vram_W=>wUpper,
--                vga_D(7 downto 0)=>dUpper(7 downto 0));
--   
--end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

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
   
   component Keyboard
      port ( datain   : in    std_logic; 
             clkin    : in    std_logic; 
             fclk     : in    std_logic; 
             rst      : in    std_logic; 
             fok      : out   std_logic; 
             scancode : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_2 : KEYBOARD_driver
      port map (CLK=>CLK4MHz,
                enable=>'1', --PPI_enable
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
   
   XLXI_489 : Keyboard
      port map (clkin=>PS2_CLK,
                datain=>PS2_DATA,
                fclk=>CLK4MHz,
                rst=>'0',
                fok=>XLXN_57,
                scancode(7 downto 0)=>XLXN_29(7 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity FPGAmstrad_amstrad_motherboard is
	generic (
			 USE_AZ80:boolean:=false;
			 HACK_Z80:boolean:=false
	);
   port ( CLK4MHz    : in    std_logic; 
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
			 CLK_PWM    : in    std_logic;
			 --lowerVRAM : in std_logic_vector(1 downto 0);
			 --upperVRAM : in std_logic_vector(1 downto 0);
			 ppi_jumpers : in std_logic_vector(3 downto 0);
			 --is_dskReady : in std_logic_vector(1 downto 0);
          audio_AB      : out   std_logic; 
			 audio_BC      : out   std_logic; 
          init_Dout  : out   std_logic_vector (7 downto 0); 
          key_reset  : out   std_logic_vector (1 downto 0); 
          palette_A  : out   std_logic_vector (13 downto 0); 
          palette_D  : out   std_logic_vector (7 downto 0); 
          palette_W  : out   std_logic; 
          ram_A      : out   std_logic_vector (22 downto 0); 
          ram_Dout   : out   std_logic_vector (7 downto 0); 
          ram_R      : out   std_logic; 
          ram_W      : out   std_logic; 
          vram_A     : out   std_logic_vector (14 downto 0); 
          vram_D     : out   std_logic_vector (7 downto 0); -- pixel_DATA
          vram_W     : out   std_logic;
			 
			  
			  CLK16MHz : in std_logic;
			 
			 RED_out : out  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_out : out  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_out : out  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_out : out STD_logic;
			  VSYNC_out : out STD_logic;
			  
			  zram_din : in std_logic_vector(7 downto 0); 
			  zram_addr : out std_logic_vector(15 downto 0);
			  zram_rd : out std_logic;
			  crtc_type: in std_logic;
			  ga_shunt : in std_logic;

			  PS2_MOUSE_DATA : in std_logic_vector(7 downto 0);
			  
			   
			  jacquie_phase : in STD_LOGIC_VECTOR(2 downto 0);
			  jacquie_length : in STD_LOGIC_VECTOR(8*2-1 downto 0); -- data_length or pulse_length or pause_length
			  jacquie_count : in STD_LOGIC_VECTOR(8*2-1 downto 0); -- pulse count, or data bit count of byte to play
			  jacquie_byte : in STD_LOGIC_VECTOR(8-1 downto 0); -- data byte
			  jacquie_do : in STD_LOGIC;
			  jacquie_done : out STD_LOGIC;
			  jacquie_no_block : in STD_LOGIC_VECTOR(15 downto 0);
			  
			  leds8_debug : out STD_LOGIC_VECTOR (19 downto 0)
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
   signal WR_n       : std_logic;
   signal MREQ_n       : std_logic;
   signal RFSH_n       : std_logic;
   signal IORQ_n       : std_logic;
   signal RD_n       : std_logic;
   signal XLXN_180      : std_logic;
	signal MIX_DOUT_MOUSE : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT0 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT1 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT01 : std_logic_vector (7 downto 0):=(others=>'1');
	signal MIX_DOUT2 : std_logic_vector (7 downto 0):=(others=>'1');
	--signal MIX_DOUT3 : std_logic_vector (7 downto 0):=(others=>'1');
	--signal MIX_DOUT23 : std_logic_vector (7 downto 0):=(others=>'1');
	
   signal XLXN_462      : std_logic_vector (7 downto 0);
   signal XLXN_486_AB      : std_logic_vector (7 downto 0);
	signal XLXN_486_BC      : std_logic_vector (7 downto 0);
   signal XLXN_486_mixAB      : std_logic_vector (7 downto 0);
	signal XLXN_486_mixBC      : std_logic_vector (7 downto 0);
   signal XLXN_518      : std_logic_vector (7 downto 0);
   signal XLXN_519      : std_logic_vector (7 downto 0);
   signal XLXN_551      : std_logic;
   signal WR      : std_logic;
   signal MREQ      : std_logic;
   signal RD      : std_logic;
   signal XLXN_802      : std_logic;
   signal WAIT_n      : std_logic;
   signal INT_n      : std_logic;
   signal XLXN_824      : std_logic;
   signal XLXN_826      : std_logic;
   signal XLXN_835      : std_logic;
   signal M1_n      : std_logic;
   signal XLXN_857      : std_logic_vector (1 downto 0);
   --signal XLXN_872      : std_logic;
   --signal XLXN_874      : std_logic_vector (15 downto 0);
   --signal XLXN_884      : std_logic;
   signal XLXN_904      : std_logic;
   signal XLXN_907      : std_logic;
   signal XLXN_940      : std_logic;
	signal SOUND_CLK     : std_logic;
   signal xram_A        : std_logic_vector (22 downto 0);
   signal ROMbank_DUMMY : std_logic_vector (7 downto 0);
   --signal ram_W_DUMMY   : std_logic;
   signal RAMBank_DUMMY : std_logic_vector (2 downto 0);
   signal RAMBank_DUMMY512 : std_logic_vector (2 downto 0);
	signal cassette_O:std_logic;
	
	-- t80_latest.tar.gz (vhdl)
   component T80se
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
	
	-- a-z80_latest.tar.gz (verilog)
	COMPONENT z80_top_direct_n
		PORT(nWAIT : IN STD_LOGIC;
			 nINT : IN STD_LOGIC;
			 nNMI : IN STD_LOGIC;
			 nRESET : IN STD_LOGIC;
			 nBUSRQ : IN STD_LOGIC;
			 CLK : IN STD_LOGIC;
			 D : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			 nM1 : OUT STD_LOGIC;
			 nMREQ : OUT STD_LOGIC;
			 nIORQ : OUT STD_LOGIC;
			 nRD : OUT STD_LOGIC;
			 nWR : OUT STD_LOGIC;
			 nRFSH : OUT STD_LOGIC;
			 nHALT : OUT STD_LOGIC;
			 nBUSACK : OUT STD_LOGIC;
			 A : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	
	--signal D_az80 : STD_LOGIC_VECTOR(7 DOWNTO 0);
   
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
				 MEM_RD        : in    std_logic;
             reset         : in    std_logic; 
				 crtc_type : in std_logic;
				 ga_shunt : in std_logic;
             A15_A14_A9_A8 : in    std_logic_vector (3 downto 0); 
             MODE_select   : in    std_logic_vector (1 downto 0); 
             D             : in    std_logic_vector (7 downto 0); 
				 R2D2             : in    std_logic_vector (7 downto 0);
             crtc_D        : in    std_logic_vector (7 downto 0); 
             Dout          : inout std_logic_vector (7 downto 0);
             crtc_VSYNC    : out   std_logic; 
             bvram_W       : out   std_logic; 
             crtc_R        : out   std_logic; 
             int           : out   std_logic;
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
	PAO     		: buffer STD_LOGIC_VECTOR (7 downto 0);		--so'1'ddaten
	PCO     		: out STD_LOGIC_VECTOR (7 downto 0);		--tastatur '1'd steuer'1'g
	DO		     	: out STD_LOGIC_VECTOR (7 downto 0)
    );
	end component;
   
   component AmstradRAMROM
      port ( wr_z80     : in    std_logic; 
             wr_io_z80  : in    std_logic; 
             lowerROMen : in    std_logic; 
             upperROMen : in    std_logic;
             A          : in    std_logic_vector (15 downto 0); 
             RAMbank    : in    std_logic_vector (2 downto 0);
			 RAMbank512 : in    std_logic_vector (2 downto 0);
             ROMbank    : in    std_logic_vector (7 downto 0); 
             ram_A      : out   std_logic_vector (22 downto 0));
   end component;
   
   component simple_CDT
      port ( nCLK4_1        : in    std_logic; 
             reset          : in    std_logic; 
				 
				 cassette_input : in STD_LOGIC;
			  cassette_output : out STD_LOGIC;
			  cassette_motor : in STD_LOGIC;
				 
             jacquie_phase : in STD_LOGIC_VECTOR(2 downto 0);
			  jacquie_length : in STD_LOGIC_VECTOR(8*2-1 downto 0); -- data_length or pulse_length or pause_length
			  jacquie_count : in STD_LOGIC_VECTOR(8*2-1 downto 0); -- pulse count, or data bit count of byte to play
			  jacquie_byte : in STD_LOGIC_VECTOR(8-1 downto 0); -- data byte
			  jacquie_do : in STD_LOGIC;
			  jacquie_done : out STD_LOGIC;
			  jacquie_no_block : in STD_LOGIC_VECTOR(15 downto 0);
			  
			  soundAB_input:in STD_LOGIC_VECTOR(7 downto 0);
			  soundBC_input:in STD_LOGIC_VECTOR(7 downto 0);
			  soundAB_output:out STD_LOGIC_VECTOR(7 downto 0);
			  soundBC_output:out STD_LOGIC_VECTOR(7 downto 0);
			  
			  leds8_debug : out STD_LOGIC_VECTOR (19 downto 0)
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
			  ram_Dout : out STD_LOGIC_VECTOR (7 downto 0)
			  
			  --vram_A:out STD_LOGIC_VECTOR (15 downto 0);
			  --vram_A_isValid:out std_logic
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
   
--   component OR2
--      port ( I0 : in    std_logic; 
--             I1 : in    std_logic; 
--             O  : out   std_logic);
--   end component;
--   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component VRAM32Ko_Amstrad_MUSER_amstrad_motherboard
      port ( vram_CLK : in    std_logic; 
             vga_CLK  : in    std_logic; 
             vram_A   : in    std_logic_vector (15 downto 0); 
             vga_A    : in    std_logic_vector (15 downto 0); 
             vram_W   : in    std_logic; 
             vram_D   : in    std_logic_vector (7 downto 0);
				 --lowerVRAM : in std_logic_vector(1 downto 0);
			 --upperVRAM : in std_logic_vector(1 downto 0);
             vga_D    : out   std_logic_vector (7 downto 0));
   end component;
   
begin

do_hack_t80:if HACK_Z80 and not(USE_AZ80) generate
   AmstradT80 : T80se
      port map (BUSRQ_n=>'1',
                CLKEN=>'1',
                CLK_n=>XLXN_802,
                DI(7 downto 0)=>MIX_DOUT(7 downto 0),
                INT_n=>INT_n,
                NMI_n=>'1',
                RESET_n=>RESET_n, -- '1'der time constraint test
                WAIT_n=>'1',
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>open,
                DO(7 downto 0)=>D(7 downto 0),
                HALT_n=>open,
                IORQ_n=>IORQ_n,
                MREQ_n=>MREQ_n,
                M1_n=>M1_n,
                RD_n=>RD_n,
                RFSH_n=>RFSH_n,
                WR_n=>WR_n);


   XLXI_568 : please_wait
      port map (CLK_n=>CLK4MHz,
                WAIT_n=>WAIT_n,
                CLK_WAIT_n=>XLXN_802);
   
end generate;

do_t80:if not(HACK_Z80) and not(USE_AZ80) generate
   AmstradT80 : T80se
      port map (BUSRQ_n=>'1',
                CLKEN=>'1',
                CLK_n=>CLK4MHz, --XLXN_802,
                DI(7 downto 0)=>MIX_DOUT_MOUSE(7 downto 0),
                INT_n=>INT_n,
                NMI_n=>'1',
                RESET_n=>RESET_n, -- '1'der time constraint test
                WAIT_n=>WAIT_n, --'1',
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>open,
                DO(7 downto 0)=>D(7 downto 0),
                HALT_n=>open,
                IORQ_n=>IORQ_n,
                MREQ_n=>MREQ_n,
                M1_n=>M1_n,
                RD_n=>RD_n,
                RFSH_n=>RFSH_n,
                WR_n=>WR_n);

					 -- #FBEE	%xxxxx0x1 xxx0xxx0	Kempston Mouse - 8bit X position
					 -- #FBEF	%xxxxx0x1 xxx0xxx1	Kempston Mouse - 8bit Y position
					 -- #FAEF	%xxxxx0x0 xxx0xxxx	Kempston Mouse - Mouse Buttons
					 -- #FB7E	%xxxxx0x1 0xxxxxx0	765 FDC (internal) Status Register
					 -- #FB7F	%xxxxx0x1 0xxxxxx1	765 FDC (internal) Data Register
					 -- #FA7E	%xxxxx0x0 0xxxxxxx	Floppy Motor Control (for 765 FDC)
					 MIX_DOUT_MOUSE <= PS2_MOUSE_DATA when IO_RD='1' and A(10)='0' and A(4)='0' else MIX_DOUT;

--   XLXI_568 : please_wait
--      port map (CLK_n=>CLK4MHz,
--                WAIT_n=>WAIT_n,
--                CLK_WAIT_n=>XLXN_802);
   
end generate;

do_az80:if USE_AZ80 generate
b2v_inst : z80_top_direct_n
PORT MAP(nWAIT => WAIT_n,
			nINT => INT_n,
			nNMI => '1',
			nRESET => RESET_n,
			nBUSRQ=> '1',
			CLK => CLK4MHz,
			D => MIX_DOUT(7 downto 0), --D_az80(7 downto 0), 
			nM1 =>M1_n,
			nMREQ =>MREQ_n,
			nIORQ =>IORQ_n,
			nRD =>RD_n,
			nWR =>WR_n,
			nRFSH =>RFSH_n,
			nHALT =>open,
			nBUSACK =>open,
			A =>A(15 downto 0));
	--D(7 downto 0)<=D_az80;
	--D_az80<=(others=>'0') when RD_n='1' else MIX_DOUT(7 downto 0);
end generate;
	
	-- print inp(&0800)
	-- 255
	MIX_DOUT01<=MIX_DOUT0 and MIX_DOUT1;
	--MIX_DOUT23<=MIX_DOUT2 and MIX_DOUT3;
	MIX_DOUT<=MIX_DOUT01 and MIX_DOUT2; --MIX_DOUT23;
	
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
                crtc_D(7 downto 0)=>zram_din(7 downto 0),
                D(7 downto 0)=>D(7 downto 0),
					 R2D2(7 downto 0)=>MIX_DOUT(7 downto 0),
                IO_ACK=>XLXN_826,
                IO_REQ_R=>IO_RD,
                IO_REQ_W=>IO_WR,
					 MEM_RD=>MEM_RD,
                MODE_select(1 downto 0)=>XLXN_857(1 downto 0),
                M1_n=>M1_n,
                nCLK4_1=>nCLK4MHz,
					 CLK16MHz=>CLK16MHz,
                reset=>XLXN_907,
					 crtc_type=>crtc_type,
					 ga_shunt=>ga_shunt,
                bvram_A(14 downto 0)=>vram_A(14 downto 0),
                bvram_D(7 downto 0)=>vram_D(7 downto 0),
                bvram_W=>vram_W,
                crtc_A(15 downto 0)=>zram_addr(15 downto 0),
                crtc_R=>zram_rd,
                crtc_VSYNC=>n_crtc_vsync,
                int=>XLXN_835,
                palette_A(13 downto 0)=>palette_A(13 downto 0),
                palette_D(7 downto 0)=>palette_D(7 downto 0),
                palette_W=>palette_W,
                WAIT_n=>WAIT_n,
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

	PPI : pio		 
		 port map (
	addr(1 downto 0)=>A(9 downto 8),
	datain(7 downto 0)=>D(7 downto 0),
	cs=>A(11),
	iowr=>XLXN_904,
	iord=>XLXN_180,
	cpuclk=>CLK16MHz, -- (no clocked this component normaly, so let's overclock it) --nCLK4MHz,
	
	PBI(7)=>cassette_O, -- pull up (default)
	PBI(6)=>'1', -- pull up (default)
	PBI(5)=>'1', -- pull up (default)
	PBI(4)=>ppi_jumpers(3), --'1', --50Hz
	PBI(3)=>ppi_jumpers(2), --'1',
	PBI(2)=>ppi_jumpers(1), --zero,
	PBI(1)=>ppi_jumpers(0), --'1',
	PBI(0)=>n_crtc_vsync,
	
	PAI(7 downto 0)=>XLXN_519(7 downto 0),
	PAO(7 downto 0)=>XLXN_462(7 downto 0),
	PCO(7 downto 0)=>portC(7 downto 0),
	DO(7 downto 0)=>MIX_DOUT1(7 downto 0)
    );

MEM_WR<=WR and MREQ;
   
   XLXI_173 : AmstradRAMROM
      port map (A(15 downto 0)=>A(15 downto 0),
                lowerROMen=>LED1,
                RAMbank(2 downto 0)=>RAMBank_DUMMY(2 downto 0),
				RAMbank512(2 downto 0)=>RAMBank_DUMMY512(2 downto 0),
                ROMbank(7 downto 0)=>ROMbank_DUMMY(7 downto 0),
                upperROMen=>LED2,
                wr_io_z80=>IO_WR,
                wr_z80=>MEM_WR,
                ram_A(22 downto 0)=>xram_A(22 downto 0));
   
-- Sorgelig formula : wire acc = (MREQ_n | ~RFSH_n) & IORQ_n;
MREQ<=not(MREQ_n or not(RFSH_n));
-- Sorgelig formula v2 : .wait_n((phase == 0) | (IORQ_n & MREQ_n) | no_wait)
--MREQ<=not(MREQ_n);
IO_REQ<=not(IORQ_n);
IO_WR<=IO_REQ and WR;
RD<=not(RD_n);
MEM_RD<=RD and MREQ;
IO_RD<=RD and IO_REQ;
   
	XLXI_348 : AmstradRAM
port map ( reset=>XLXN_907,
			  
			  init_done=>RESET_n, -- '1'der time constraint test
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
			  ram_W=>ram_W,
           ram_R=>ram_R,
           ram_Din(7 downto 0)=>ram_Din(7 downto 0),
			  ram_Dout(7 downto 0)=>ram_Dout(7 downto 0)
			  
			  --vram_A(15 downto 0)=>XLXN_874(15 downto 0),
			  --vram_A_isValid=>XLXN_872
			  );

XLXN_180<=not(IO_RD);
XLXN_904<=not(IO_WR);
XLXN_907<=not(RESET_n);
INT_n<=not(XLXN_835);
   
   XLXI_344 : simple_CDT
      port map (
                nCLK4_1=>nCLK4MHz,
                reset=>XLXN_907,
                
					 cassette_input=>portC(5),
			  cassette_output=>cassette_O,
			  cassette_motor=>portC(4),
					 
			-- simpleCDT interface
			  jacquie_phase=>jacquie_phase,
			  jacquie_length=>jacquie_length,
			  jacquie_count=>jacquie_count,
			  jacquie_byte=>jacquie_byte,
			  jacquie_do=>jacquie_do,
			  jacquie_done=>jacquie_done,
			  jacquie_no_block=>jacquie_no_block,
			  
			  soundAB_input=>XLXN_486_AB,
			  soundBC_input=>XLXN_486_BC,
			  soundAB_output=>XLXN_486_mixAB,
			  soundBC_output=>XLXN_486_mixBC,
			  
			  leds8_debug=>leds8_debug
					 );
   
   XLXI_349 : YM2149
      port map (CLK=>SOUND_CLK,
                ENA=>'1',
                I_A8=>'1',
                I_A9_L=>'0',
                I_BC1=>portC(6),
                I_BC2=>'1',
                I_BDIR=>portC(7),
                I_DA(7 downto 0)=>XLXN_462(7 downto 0),
                I_IOA(7 downto 0)=>XLXN_518(7 downto 0),
                I_SEL_L=>'1',
                RESET_L=>RESET_n,
                O_AUDIO_AB(7 downto 0)=>XLXN_486_AB(7 downto 0),
					 O_AUDIO_BC(7 downto 0)=>XLXN_486_BC(7 downto 0),
                O_DA(7 downto 0)=>XLXN_519(7 downto 0),
                O_DA_OE_L=>open);

   XLXI_367_AB : PWM
      port map (clk=>CLK_PWM,--nCLK4MHz,
                clk_ref=>nCLK4MHz, --SOUND_CLK,
                PWM_in(7 downto 0)=>XLXN_486_mixAB(7 downto 0),
                PWM_out=>audio_AB);
	XLXI_367_BC : PWM
      port map (clk=>CLK_PWM,--nCLK4MHz,
                clk_ref=>nCLK4MHz, --SOUND_CLK,
                PWM_in(7 downto 0)=>XLXN_486_mixBC(7 downto 0),
                PWM_out=>audio_BC);
   
XLXN_826<=XLXN_824 and IO_REQ;
XLXN_824<=not(M1_n);
   
   XLXI_494 : joykeyb_MUSER_amstrad_motherboard
      port map (CLK4MHz=>nCLK4MHz,
                joystick1(5 downto 0)=>JOYSTICK1(5 downto 0),
                joystick2(5 downto 0)=>JOYSTICK2(5 downto 0),
                PPI_portC(3 downto 0)=>portC(3 downto 0),
                PS2_CLK=>PS2_CLK,
                PS2_DATA=>PS2_DATA,
                key_reset=>key_reset,
                PPI_portA(7 downto 0)=>XLXN_518(7 downto 0));
   
WR<=not(WR_n);
   
   
   
end BEHAVIORAL;


