library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;


entity aZRaEL_vga2vram is
    Generic(
	 
	 
--		RHtot<="00111111"; -- HTot -- 63
--		RHdisp<="00101000"; -- HDsp -- 40
--		RHsyncpos<="00101110"; -- HSS -- 46
--		RHwidth<="1110"; -- (HSE-HSS) -- 14 -- donc HSE="111100"
--		RVwidth<="001000"; -- (VSE-VSS) -- 8 donc VSE="100110"
--		RVtot<="0100110"; -- VTot -- 38
--		RVtaj<="00000"; -- VTot adjust (inutile ?)
--		RVdisp<="0011001"; -- VDsp -- 25
--		RVsyncpos<="0011110"; -- VSS -- 30
--		RRmax<="00111"; -- nombre de ligne par caractère -- 7
--		RAdrH<="110000"; -- start adress (???) -- 11000000000000
--		RAdrL<="00000000"; -- start adress (???) -- 12288
	 
   --modeline label pxcl HDsp HSS HSE HTot VDsp VSS VSE VTot flags
   --modeline "640x480@60" 25.2 640 656 752 800 480 490 492 525 -vsync -hsync
              label_modeline  :string:="640x480@60";--(ignored  by  svgalib) mainly there to be compatible with XF86Config.   I  use  the  format  "Width  x   Height   @   Vert.Refresh", but that's just personal taste...
              pxcl:string:="1"; -- the pixel clock in MHz
              HDsp:integer:=40*8; -- size of the visible area (horizontal/vertical)
              HSS:integer:=46*8; -- Sync start (horizontal/vertical)
              HSE:integer:=46*8+14; -- Sync end (horizontal/vertical)
              HTot:integer:=63*8; -- Total width/height (end of back porch)
              VDsp:integer:=25*7; -- size of the visible area (horizontal/vertical)
              VSS:integer:=30*7; -- Sync start (horizontal/vertical)
              VSE:integer:=30*7+8; -- Sync end (horizontal/vertical)
              VTot:integer:=38*7; -- Total width/height (end of back porch)
				  nvsync:std_logic:='0';--flags  +vsync -vsync
				  nhsync:std_logic:='0'; --flags  +hsync -hsync
              --flags  interlace interlaced
              --       doublescan Sync polarity, interlace mode
				  SQRT_VRAM_WIDTH:integer:=7;
				  SQRT_VRAM_HEIGHT:integer:=7

		  );
    Port ( DATA : out  STD_LOGIC_VECTOR (7 downto 0);
           ADDRESS : out  STD_LOGIC_VECTOR (SQRT_VRAM_WIDTH+SQRT_VRAM_HEIGHT-1 downto 0);
           W : out  STD_LOGIC; -- Z
           RED : in  STD_LOGIC;
           GREEN : in  STD_LOGIC;
           BLUE : in  STD_LOGIC;
           VSYNC : in  STD_LOGIC;
           HSYNC : in  STD_LOGIC;
           CLK25MHz : in  STD_LOGIC);
end aZRaEL_vga2vram;

architecture Behavioral of aZRaEL_vga2vram is
	constant DO_NOTHING : STD_LOGIC:='0';
	constant DO_WRITE : STD_LOGIC:='1';
begin
aZRaEL_vram2vga_process : process(CLK25MHz) is
	variable horizontal_counter : integer range 0 to HTot:=0;
	variable vertical_counter : integer range 0 to VTot:=0;
	variable etat_write : STD_LOGIC:=DO_NOTHING;
	
	variable last_hsync : STD_LOGIC:=not nhsync;
	variable last_vsync : STD_LOGIC:=not nvsync;
begin
	if rising_edge(CLK25MHz) then
		if horizontal_counter<HTot then
			horizontal_counter:=horizontal_counter+1;
		end if;
		if (last_hsync xor nhsync) = '1' and (hsync xor nhsync) = '0' then
			horizontal_counter:=0;
			if vertical_counter<VTot then
				vertical_counter:=vertical_counter+1;
			end if;
		end if;
		if (last_vsync xor nvsync) = '1' and (vsync xor nvsync) = '0' then
			vertical_counter:=0;
		end if;
		
		last_vsync:=vsync;
		last_hsync:=hsync;
		
		
		if horizontal_counter<HDsp and vertical_counter<VDsp then
			if horizontal_counter<2**SQRT_VRAM_WIDTH and vertical_counter<2**SQRT_VRAM_HEIGHT then
				etat_write := DO_WRITE;
				--ADDRESS<= conv_std_logic_vector(vertical_counter*(2**SQRT_VRAM_WIDTH) + horizontal_counter,ADDRESS'length);
				ADDRESS(SQRT_VRAM_WIDTH+SQRT_VRAM_HEIGHT-1 downto SQRT_VRAM_WIDTH)<= conv_std_logic_vector(vertical_counter,SQRT_VRAM_HEIGHT);
				ADDRESS(SQRT_VRAM_WIDTH-1 downto 0)<= conv_std_logic_vector(horizontal_counter,SQRT_VRAM_WIDTH);
				DATA <= (RED,GREEN,BLUE,'0','0',BLUE,GREEN,RED);
			else
				etat_write := DO_NOTHING;
				ADDRESS<= (others=>'0');
				DATA <= (others=>'0');
			end if;
		else
			etat_write := DO_NOTHING;
			ADDRESS<= (others=>'0');
			DATA <= (others=>'0');
		end if;
		W <= etat_write;
	end if;
end process aZRaEL_vram2vga_process;


end Behavioral;

