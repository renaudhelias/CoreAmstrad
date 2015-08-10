library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity aZRaEL_vram2vga is
    Generic(
--   --modeline label pxcl HDsp HSS HSE HTot VDsp VSS VSE VTot flags
--   --modeline "640x480@60" 25.2 640 656 752 800 480 490 492 525 -vsync -hsync
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
				  nhsync:std_logic:='1'; --flags  +hsync -hsync
              --flags  interlace interlaced
              --       doublescan Sync polarity, interlace mode
				  SQRT_VRAM_WIDTH:integer:=7;
				  SQRT_VRAM_HEIGHT:integer:=7;

				  HZoom:integer:=4;
				  VZoom:integer:=4;
				  HDecal:integer:=64;
				  VDecal:integer:=0
		  );
    Port ( DATA : in  STD_LOGIC_VECTOR (7 downto 0); -- buffer
           ADDRESS : out  STD_LOGIC_VECTOR (SQRT_VRAM_WIDTH+SQRT_VRAM_HEIGHT-1 downto 0);
           R : out  STD_LOGIC;
           RED : out  STD_LOGIC;
           GREEN : out  STD_LOGIC;
           BLUE : out  STD_LOGIC;
           VSYNC : out  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           CLK_25MHz : in  STD_LOGIC);
end aZRaEL_vram2vga;

architecture Behavioral of aZRaEL_vram2vga is
	constant DO_NOTHING : STD_LOGIC:='0';
	constant DO_READ : STD_LOGIC:='1';
	constant DO_HSYNC : STD_LOGIC:='1';
	constant DO_VSYNC : STD_LOGIC:='1';
begin

aZRaEL_vram2vga_process : process(CLK_25MHz) is
	variable horizontal_counter : integer range 0 to HTot:=0;
	variable vertical_counter : integer range 0 to VTot:=0;
	variable etat_rgb : STD_LOGIC:=DO_NOTHING;
	variable etat_hsync : STD_LOGIC:=DO_NOTHING;
	variable etat_vsync : STD_LOGIC:=DO_NOTHING;
begin
	if rising_edge(CLK_25MHz) then
		if etat_rgb = DO_READ then
			RED<=DATA(7);--or DATA(0);
			GREEN<=DATA(6);-- or DATA(1);
			BLUE<=DATA(5);-- or DATA(2);
		else
			RED<='0';
			GREEN<='0';
			BLUE<='0';
		end if;
		if etat_hsync = DO_HSYNC then
			hsync<='1' xor nhsync;
		else
			hsync<='0' xor nhsync;
		end if;
		if etat_vsync = DO_VSYNC then
			vsync<='1' xor nvsync;
		else
			vsync<='0' xor nvsync;
		end if;
		
		if horizontal_counter<HDsp and vertical_counter<VDsp then
			if horizontal_counter<HDecal or vertical_counter<VDecal or horizontal_counter>=HDecal+HZoom*(2**SQRT_VRAM_WIDTH) or vertical_counter>=VDecal+VZoom*(2**SQRT_VRAM_HEIGHT) then
				ADDRESS<= (others=>'0');
				R<='0';
				etat_rgb:=DO_NOTHING;
			else
				ADDRESS(SQRT_VRAM_WIDTH+SQRT_VRAM_HEIGHT-1 downto SQRT_VRAM_WIDTH)<= conv_std_logic_vector((vertical_counter-VDecal)/VZoom,SQRT_VRAM_HEIGHT);
				ADDRESS(SQRT_VRAM_WIDTH-1 downto 0)<= conv_std_logic_vector((horizontal_counter-HDecal)/HZoom,SQRT_VRAM_WIDTH);
				R<='1';
				etat_rgb:=DO_READ;
			end if;

		else
			ADDRESS<= (others=>'0');
			R<='0';
			etat_rgb:=DO_NOTHING;
		end if;
		if horizontal_counter>=HSS and horizontal_counter<HSE then
			etat_hsync:=DO_HSYNC;
		else
			etat_hsync:=DO_NOTHING;
		end if;
		if vertical_counter>=VSS and vertical_counter<VSE then
			etat_vsync:=DO_VSYNC;
		else
			etat_vsync:=DO_NOTHING;
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
end process aZRaEL_vram2vga_process;


end Behavioral;

