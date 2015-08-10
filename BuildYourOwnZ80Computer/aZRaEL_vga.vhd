----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:40 11/01/2010 
-- Design Name: 
-- Module Name:    aZRaEL_vga - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;





-- lui il gère la génération des HSYNC et VSYNC quand il le faut, et le pop quand il le faut, pas trop compliqué il suffit de paramétrer bien les trames
entity aZRaEL_vga is
  generic(
   --modeline label pxcl HDsp HSS HSE HTot VDsp VSS VSE VTot flags
   --modeline "640x480@60" 25.2 640 656 752 800 480 490 492 525 -vsync -hsync
              label_modeline  :string:="640x480@60";--(ignored  by  svgalib) mainly there to be compatible with XF86Config.   I  use  the  format  "Width  x   Height   @   Vert.Refresh", but that's just personal taste...
              pxcl:string:="25.2"; -- the pixel clock in MHz
              HDsp:integer:=640; -- size of the visible area (horizontal/vertical)
              HSS:integer:=656; -- Sync start (horizontal/vertical)
              HSE:integer:=752; -- Sync end (horizontal/vertical)
              HTot:integer:=800; -- Total width/height (end of back porch)
              VDsp:integer:=480; -- size of the visible area (horizontal/vertical)
              VSS:integer:=490; -- Sync start (horizontal/vertical)
              VSE:integer:=492; -- Sync end (horizontal/vertical)
              VTot:integer:=525; -- Total width/height (end of back porch)
				  nvsync:std_logic:='1';--flags  +vsync -vsync
				  nhsync:std_logic:='1' --flags  +hsync -hsync
              --flags  interlace interlaced
              --       doublescan Sync polarity, interlace mode
		  );
  port(
		red : out std_logic;
		green : out std_logic;
		blue : out std_logic;
		vsync : out std_logic;
		hsync : out std_logic;

		clock_pop  : in std_logic; -- surement 25.2MHz
		pop_pixel : in std_logic_vector(2 downto 0);
		do_pop : out boolean;
		resynchro_pop : out boolean
	   );
end aZRaEL_vga;

architecture Behavioral of aZRaEL_vga is
begin	-- affiche un écran rouge
aZRaEL_process : process(clock_pop) is
	variable mem_pixel : std_logic_vector(pop_pixel'range):=('1','0','0',others=>'0');
	variable horizontal_counter : integer range 0 to HTot:=0;
	variable vertical_counter : integer range 0 to VTot:=0;
begin
	if rising_edge(clock_pop) then
		resynchro_pop<=false;
		if horizontal_counter<HDsp and vertical_counter<VDsp then
			do_pop<=true;
			mem_pixel:=pop_pixel;
			red<=mem_pixel(0);
			green<=mem_pixel(1);
			blue<=mem_pixel(2);
		else
			do_pop<=false;
			red<='0';
			green<='0';
			blue<='0';
		end if;
		if horizontal_counter>=HSS and horizontal_counter<HSE then
			hsync<='1' xor nhsync;
		else
			hsync<='0' xor nhsync;
		end if;
		if vertical_counter>=VSS and vertical_counter<VSE then
			vsync<='1' xor nvsync;
			resynchro_pop<=true;
		else
			vsync<='0' xor nvsync;
			resynchro_pop<=false;
		end if;
		horizontal_counter:=horizontal_counter+1;
		if horizontal_counter>=HTot then
			horizontal_counter:=0;
		end if;
		
		if horizontal_counter=0 then
			vertical_counter:=vertical_counter+1;
			if vertical_counter>=VTot then
				vertical_counter:=0;
			end if;
		end if;
	end if;
end process aZRaEL_process;

end Behavioral;

