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
-- FPGAmstrad_amstrad_video.aZRaEL_vram2vgaAmstradMiaow
-- VRAM 800x600 at middle of screen 640x480@60Hz
-- PRAM Raster line per line palette
-- VGA protocol
--
-- Historically, the first image I succeed to display with that code was Azrael cat.
--
-- Amstrad output RGB is using 3-state output :
-- * red   possible outputs : 0.0 0.5 1.0
-- * green possible outputs : 0.0 0.5 1.0
-- * blue  possible outputs : 0.0 0.5 1.0
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aZRaEL_vram2vgaAmstradMiaow is
    Generic(
	 -- Amstrad
	 -- 
	 --OFFSET:STD_LOGIC_VECTOR(15 downto 0):=x"C000";
	 -- screen.bas
	 -- CLS
	 -- FOR A=&C000 TO &FFFF
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- line.bas
	 -- CLS
	 -- FOR A=&C000 TO &C050
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- lines.bas
	 -- CLS
	 -- FOR A=&C000 TO &C7FF
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- byte pixels structure :
	 -- mode 1 :
	 --   1 byte <=> 4 pixels
	 --   [AAAA][BBBB] : layering colors [AAAA] and [BBBB]
	 --   A+B=0+0=dark blue (default Amstrad background color)
	 --   A+B=0+1=light blue
	 --   A+B=1+0=yellow
	 --   A+B=1+1=red
	 --  for example [1100][0011] with give 2 yellow pixels followed by 2 light blue pixels &C3
	 -- mode 0 : 
	 --   1 byte <=> 2 pixels
	 --   [AA][BB][CC][DD] : layering colors of AA, BB, CC, DD
	 --   Because it results too many equations for a simple RGB output, they do switch the last equation (alternating at a certain low frequency (INK SPEED))
	 -- mode 2 :
	 --   1 byte <=> 8 pixels
	 --   [AAAAAAAA] : so only 2 colors xD
	 MODE_MAX:integer:=2;
--	 NB_PIXEL_PER_OCTET:integer:=4;--2**(MODE+1);
	NB_PIXEL_PER_OCTET_MAX:integer:=8;
	NB_PIXEL_PER_OCTET_MIN:integer:=2;
	 -- Just after having launched lines.bas we can count them... while moving cursor.
	 -- mode 1 :
	 --   We have 40 characters per line in mode 1, one character does 8 pixels width.
	 CHAR_WIDTH:integer:=16; -- sucks, it's about bytes finally.... crtc is done for building addresses, not RGB output... :/
	 -- using 320x200pixels=64000pixels=16000 bytes used
	 --  but we are currently scanning &FFFF+1-&C000=16384 bytes... so some bytes are not used :D
	 -- 
	 -- forget.bas
	 -- MODE 1
	 -- CLS
	 -- FOR A=0 TO 639
	 -- FOR B=0 to 399
	 -- PLOT a,b
	 -- NEXT b
	 -- NEXT a
	 -- 
	 -- If we make a snapshot, we can see &F0 values at addresses :
	 -- C000 .. C7D0-1
	 -- C800 .. CFD0-1
	 -- D000 .. D7D0-1
	 -- D800 .. DFD0-1
	 -- E000 .. E7D0-1
	 -- E800 .. EFD0-1
	 -- F000 .. F7D0-1
	 -- F800 .. FFD0-1
	 --
	 -- More quickly :D
	 --
	 -- forget2.bas
	 -- paper 2
	 -- cls
	 -- 
	 -- If by going bottom (using cursor) and make the picture scrolling up on screen. Let's do then another snapshot
	 -- We conclude that it's hazardous in memory areas employed : forgotten bytes has change of location !
	 -- It's why I added "MODE 1" in forget.bas source code x)
	 -- If I do scroll screen placing cursor at bottom, "poke &C000,&ff" does not target any more the top-left pixel,
	 -- and in certain time it disappear : in this case it is just on a forgotten byte.
	 -- 
-- "modeline" is a Unix command, it's a helper command, listing VGA screen parameters on Unix.
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
				  VZoom:integer:=2;
				  
				  VRAM_HDsp:integer:=768; --changing mode doesn't affect number of pixel finally outputted
				  VRAM_VDsp:integer:=280 --560/2
		  );
    Port ( DATA : in  STD_LOGIC_VECTOR (7 downto 0); -- buffer
           ADDRESS : out  STD_LOGIC_VECTOR (14 downto 0):=(others=>'0');
			  PALETTE_D : in STD_LOGIC_VECTOR (7 downto 0);
			  PALETTE_A : out STD_LOGIC_VECTOR (13 downto 0):=(others=>'0');
           RED : out  STD_LOGIC_VECTOR(1 downto 0);
           GREEN : out  STD_LOGIC_VECTOR(1 downto 0);
           BLUE : out  STD_LOGIC_VECTOR(1 downto 0);
           VSYNC : out  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           CLK_25MHz : in  STD_LOGIC
			  );
end aZRaEL_vram2vgaAmstradMiaow;

architecture Behavioral of aZRaEL_vram2vgaAmstradMiaow is
	constant DO_NOTHING_OUT : integer range 0 to 2:=0;
	constant DO_READ : integer range 0 to 2:=1;
	constant DO_BORDER: integer range 0 to 2:=2;
	
	constant DO_NOTHING : STD_LOGIC:='0';
	constant DO_HSYNC : STD_LOGIC:='1';
	constant DO_VSYNC : STD_LOGIC:='1';

	constant VDecal_negatif:integer:=(560-480)/2;
	constant HDecal_negatif:integer:=(768-640)/2;
	constant HDecal:integer:=0;
	constant VDecal:integer:=0;
	
	type palette_type is array(31 downto 0) of std_logic_vector(5 downto 0); -- RRVVBB
	constant palette:palette_type:=(
		20=>"000000",
		 4=>"000001",
		21=>"000011",
		28=>"010000",
		24=>"010001",
			29=>"010011",
		12=>"110000",
			5=>"110001",
		13=>"110011",
		22=>"000100",
		6=>"000101",
		23=>"000111",
		30=>"010100",
		 0=>"010101",
		31=>"010111",
		14=>"110100",
		 7=>"110101",
		15=>"110111",
		18=>"001100",
		 2=>"001101",
		19=>"001111",
		26=>"011100",
		25=>"011101",
		27=>"011111",
		10=>"111100",
		 3=>"111101",
		11=>"111111",
		
		-- others color >=27
		1=>"010101",
		8=>"110001",
		9=>"111101",
		16=>"000001",
		17=>"001101"
		);
	
	signal MODE_select:STD_LOGIC_VECTOR (1 downto 0):="01"; -- mode 1
begin

aZRaEL_vram2vgaAmstrad_process : process(CLK_25MHz) is

	constant PALETTE_H_OFFSET:integer:=32-1;--16+1  +1;
	-- l'effet de la palette est une ligne sur deux, mais ces lignes avancent bien à la même vitesse que vertical_counter...
	constant PALETTE_V_OFFSET:integer:=0;-- optim PRAM au debut VGA --(560-480)/2;
	-- 1.LittleOne OK, border/couleur decale :
	--constant PALETTE_V_OFFSET:integer:=0;
	-- 2.LittleOne OK, DISP pas bon
	--constant PALETTE_V_OFFSET:integer:=((560-480)/2)/2;
	constant HMax:integer:=HTot-1;
	constant VMax:integer:=VTot-1;
	
	variable horizontal_counter : integer range 0 to 1024-1 :=0;
	variable vertical_counter : integer range 0 to 1024-1 :=0;
	
	variable palette_horizontal_counter : integer range 0 to 1024-1:=PALETTE_H_OFFSET;
	variable palette_vertical_counter : integer range 0 to 1024-1:=PALETTE_V_OFFSET;
	constant DO_NADA:integer range 0 to 4:=0;
	constant DO_MODE:integer range 0 to 4:=1;
	constant DO_COLOR:integer range 0 to 4:=2;
	constant DO_HBEGIN:integer range 0 to 4:=3;
	constant DO_HEND:integer range 0 to 4:=4;
	variable palette_action:integer range 0 to 4:=DO_NADA;
	variable palette_action_retard:integer range 0 to 4:=DO_NADA;
	variable palette_color:integer range 0 to 16-1:=0;
	variable palette_color_retard:integer range 0 to 16-1:=0;
	variable palette_A_mem:std_logic_vector(palette_A'range):=(others=>'0');
	variable palette_D_mem:std_logic_vector(7 downto 0);
	
	variable etat_rgb : integer range 0 to 2:=DO_NOTHING_OUT;
	variable etat_rgb_retard : integer range 0 to 2:=DO_NOTHING_OUT;
	variable etat_hsync : STD_LOGIC:=DO_NOTHING;
	variable etat_hsync_retard : STD_LOGIC:=DO_NOTHING;
	variable etat_vsync : STD_LOGIC:=DO_NOTHING;
	variable etat_vsync_retard : STD_LOGIC:=DO_NOTHING;
	variable color : STD_LOGIC_VECTOR(2**(MODE_MAX)-1 downto 0);
	variable color_patch : STD_LOGIC_VECTOR(2**(MODE_MAX)-1 downto 0);
	variable cursor_pixel_ref : integer range 0 to NB_PIXEL_PER_OCTET_MAX-1;
	variable cursor_pixel : integer range 0 to NB_PIXEL_PER_OCTET_MAX-1;
	variable cursor_pixel_retard : integer range 0 to NB_PIXEL_PER_OCTET_MAX-1;
	variable v:integer range 0 to 256-1;
	variable h:integer range 0 to CHAR_WIDTH*128*8-1;
	variable new_h:integer range 0 to 128*8-1;
	variable NB_PIXEL_PER_OCTET:integer range NB_PIXEL_PER_OCTET_MIN to NB_PIXEL_PER_OCTET_MAX;
	--variable ADRESSE_CONSTANT_mem:integer range 0 to 16*1024-1;
	--variable ADRESSE_INC_mem:integer range 0 to 16*1024-1;
	--variable ADRESSE_VAR_mem:integer range 0 to 16*1024-1;
	variable MA:STD_LOGIC_VECTOR(13 downto 0);
	--variable MA_13_begin:std_logic:='0';
	variable RA:STD_LOGIC_VECTOR(4 downto 0);
	variable CA:STD_LOGIC_VECTOR(0 downto 0); -- sqrt(CHAR_WIDTH/8)-1 ?
	variable no_char:integer range 0 to CHAR_WIDTH/8-1;
	
	
	type pen_type is array(15 downto 0) of std_logic_vector(5 downto 0);
	variable pen:pen_type:=(
		palette(4),palette(12),palette(21),palette(28),
		palette(24),palette(29),palette(12),palette(5),
		palette(13),palette(22),palette(6),palette(23),
		palette(30),palette(0),palette(31),palette(14)
	);
	variable border:std_logic_vector(5 downto 0);

	variable ADDRESS_mem : STD_LOGIC_VECTOR (14 downto 0):=(others=>'0');
	variable has_LEFT_BORDER : boolean:=false;
	variable has_RIGHT_BORDER : boolean:=false;
	variable horizontal_counter_LEFT_BORDER : integer range 0 to 1024-1 :=0;
	variable horizontal_counter_RIGHT_BORDER : integer range 0 to 1024-1 :=0;
	variable is_full_vertical_BORDER:boolean:=true;
begin
	if rising_edge(CLK_25MHz) then
	
	
	

		
	
	
	
	
	
	
	
		if MODE_select="00" then
			NB_PIXEL_PER_OCTET:=2;
		elsif MODE_select="01" then
			NB_PIXEL_PER_OCTET:=4;
		elsif MODE_select="10" then
			NB_PIXEL_PER_OCTET:=8;
		else
			NB_PIXEL_PER_OCTET:=2;
		end if;
		
		-- more stable
		cursor_pixel_retard:=cursor_pixel;
		if etat_rgb_retard = DO_READ then
			color:=(others=>'0');
			for i in 2**(MODE_MAX)-1 downto 0 loop
				if (MODE_select="00" and i<=3)
				or (MODE_select="01" and i<=1)
				or (MODE_select="10" and i<=0) then
					color(3-i):=DATA(i*NB_PIXEL_PER_OCTET+(NB_PIXEL_PER_OCTET-1-cursor_pixel_retard));
				end if;
			end loop;
			if MODE_select="10" then
				RED<=pen(conv_integer(color(3)))(5 downto 4);
				GREEN<=pen(conv_integer(color(3)))(3 downto 2);
				BLUE<=pen(conv_integer(color(3)))(1 downto 0);
			elsif MODE_select="01" then
				RED<=pen(conv_integer(color(3 downto 2)))(5 downto 4);
				GREEN<=pen(conv_integer(color(3 downto 2)))(3 downto 2);
				BLUE<=pen(conv_integer(color(3 downto 2)))(1 downto 0);
			elsif MODE_select="00" then
				color_patch:=color(3) & color(1) & color(2) & color(0); -- wtf xD
				RED<=pen(conv_integer(color_patch))(5 downto 4);
				GREEN<=pen(conv_integer(color_patch))(3 downto 2);
				BLUE<=pen(conv_integer(color_patch))(1 downto 0);
			else -- MODE 11
				RED<="01";
				GREEN<="11";
				BLUE<="01";
			end if;
		elsif etat_rgb_retard = DO_BORDER then
			RED<=border(5 downto 4);
			GREEN<=border(3 downto 2);
			BLUE<=border(1 downto 0);
		else
			RED<="00";
			GREEN<="00";
			BLUE<="00";
		end if;
		etat_rgb_retard:=etat_rgb;
		-- strange cursor_pixel_retard:=cursor_pixel;

		
		if etat_hsync_retard = DO_HSYNC then
			hsync<='1' xor nhsync;
		else
			hsync<='0' xor nhsync;
		end if;
		etat_hsync_retard:=etat_hsync;
		
		if etat_vsync_retard = DO_VSYNC then
			vsync<='1' xor nvsync;
			--palette_A_mem:=(others=>'0');
		else
			vsync<='0' xor nvsync;
		end if;
		etat_vsync_retard:=etat_vsync;
		
		
--beware : PRAM is PRAM of VRAM768x560, not PRAM of VGA640x480
--Number of RAMB16s: 18 out of      20   90%
--reality : some memory area are mocked, do to problem of space, so when you are out of screen, generally you are in mocked ram areas.
--brain garbage : PRAM 60 lines/33bits, PRAM 100 lines/32*5bit+2bit.
		if palette_action_retard=DO_MODE then
--nopb palette
			palette_D_mem:=palette_D;
			MODE_select<=palette_D_mem(1 downto 0);
			border:=palette(conv_integer(palette_D_mem(7 downto 3)));
			if palette_D_mem(2)='1' then
				is_full_vertical_BORDER:=true;
			else
				is_full_vertical_BORDER:=false;
			end if;
		elsif palette_action_retard=DO_COLOR then
--nopb palette
			palette_D_mem:=palette_D;
			pen(palette_color_retard):=palette(conv_integer(palette_D_mem(4 downto 0)));

		--RHdisp equals 40 so 16*40=640 pixels so ratio is 16*.
		--HDecal_negatif/16=5 so we can try not going out of displayed RAM area.
		elsif palette_action_retard=DO_HBEGIN then
			palette_D_mem:=palette_D;
			horizontal_counter_LEFT_BORDER:=conv_integer(palette_D_mem(7 downto 0));
			if horizontal_counter_LEFT_BORDER>((HDecal_negatif-HDecal)/16) then
				--horizontal_counter_LEFT_BORDER:=160;
				--horizontal_counter_LEFT_BORDER:=15;--conv_integer(palette_D_mem(7 downto 0));
				horizontal_counter_LEFT_BORDER:=horizontal_counter_LEFT_BORDER*16;
				horizontal_counter_LEFT_BORDER:=horizontal_counter_LEFT_BORDER-HDecal_negatif+HDecal;
				--horizontal_counter_LEFT_BORDER:=16*(conv_integer(palette_D_mem(7 downto 0))-((HDecal_negatif-HDecal)/16));
				has_LEFT_BORDER:=true;
			else
				horizontal_counter_LEFT_BORDER:=0;
				has_LEFT_BORDER:=false;
			end if;
		elsif palette_action_retard=DO_HEND then
			palette_D_mem:=palette_D;
			horizontal_counter_RIGHT_BORDER:=conv_integer(palette_D_mem(7 downto 0));
			if horizontal_counter_RIGHT_BORDER<HDsp/16 + ((HDecal_negatif-HDecal)/16) then
				--horizontal_counter_RIGHT_BORDER:=480-1;
				--horizontal_counter_RIGHT_BORDER:=35;--conv_integer(palette_D_mem(7 downto 0));
				horizontal_counter_RIGHT_BORDER:=horizontal_counter_RIGHT_BORDER*16;
				horizontal_counter_RIGHT_BORDER:=horizontal_counter_RIGHT_BORDER-HDecal_negatif+HDecal;
				horizontal_counter_RIGHT_BORDER:=horizontal_counter_RIGHT_BORDER-1;
				--horizontal_counter_RIGHT_BORDER:=(16*(conv_integer(palette_D_mem(7 downto 0))-((HDecal_negatif-HDecal)/16)))-1;
				has_RIGHT_BORDER:=true;
			else
				horizontal_counter_RIGHT_BORDER:=HDsp;
				has_RIGHT_BORDER:=false; -- HEURISTIC :p
			end if;
		end if;
		palette_action_retard:=palette_action;
		palette_color_retard:=palette_color;
		
		
		
		
		
		if palette_vertical_counter mod VZoom=0 and palette_vertical_counter<VDsp then  -- one line per two... + no out of VRAM range vertically
			if palette_horizontal_counter<1 then
				-- mode
				palette_A<=palette_A_mem;
				palette_action:=DO_HBEGIN;
			elsif palette_horizontal_counter<2 then
				-- mode
				palette_A<=palette_A_mem;
				palette_action:=DO_MODE;
			elsif palette_horizontal_counter<2+16 then
				-- color
				palette_A<=palette_A_mem;
				palette_action:=DO_COLOR;
				if palette_horizontal_counter = 2 then
					palette_color:=0;
				else
					palette_color:=palette_color+1;
				end if;
			elsif palette_horizontal_counter<2+16+1 then
				-- mode
				palette_A<=palette_A_mem;
				palette_action:=DO_HEND;
			else
				palette_action:=DO_NADA;
			end if;
		else
			palette_action:=DO_NADA;
		end if;
		
		
		
		if horizontal_counter<HDsp and vertical_counter<VDsp then
			if horizontal_counter+HDecal_negatif<HDecal or vertical_counter+VDecal_negatif<VDecal or horizontal_counter+HDecal_negatif>=HDecal+VRAM_HDsp or vertical_counter+VDecal_negatif>=VDecal+VZoom*VRAM_VDsp then
				ADDRESS<= (others=>'0');
				-- OUT OF VRAM800x600
				etat_rgb:=DO_BORDER;
			elsif is_full_vertical_BORDER then
				-- vertical full BORDER (UPPER AND LOWER ONES)
				ADDRESS<= (others=>'0');
				etat_rgb:=DO_BORDER;
			elsif has_LEFT_BORDER and horizontal_counter<horizontal_counter_LEFT_BORDER then
				-- LEFT BORDER
				ADDRESS<= (others=>'0');
				etat_rgb:=DO_BORDER;
			elsif has_RIGHT_BORDER and horizontal_counter>horizontal_counter_RIGHT_BORDER then
				-- RIGHT BORDER
				ADDRESS<= (others=>'0');
				etat_rgb:=DO_BORDER;
			else
				v:=(vertical_counter+VDecal_negatif-VDecal)/(VZoom);
				h:=horizontal_counter+HDecal_negatif-HDecal;
				no_char:=(h / 8) mod (CHAR_WIDTH/8);
				-- 640x200 pixels with 2 colours ("Mode 2", 80 text columns) so it is really 8 physicals pixels per bytes
				if NB_PIXEL_PER_OCTET=2 then
					cursor_pixel_ref:=(((h-1+8) mod 8) / 4) mod 8;
					cursor_pixel:=cursor_pixel_ref;
				elsif NB_PIXEL_PER_OCTET=4 then
					cursor_pixel_ref:=(((h-1+8) mod 8) / 2) mod 8; -- ok
					cursor_pixel:=cursor_pixel_ref; -- target correction... data more slow than address coming : one tic
				elsif NB_PIXEL_PER_OCTET=8 then
					cursor_pixel_ref:=(((h-1+8) mod 8) / 1) mod 8;
					cursor_pixel:=cursor_pixel_ref; -- hide one pixel on both
				end if;
				new_h:=h/CHAR_WIDTH; -- really 8 physicals pixels per bytes
				etat_rgb:=DO_READ;

				MA:=conv_std_logic_vector(v*(VRAM_HDsp/CHAR_WIDTH),14);
				MA:=new_h+MA;
				CA:=conv_std_logic_vector(no_char,1);
				ADDRESS_mem:=MA(13 downto 0) & CA(0);
				ADDRESS<=ADDRESS_mem;
			end if;
		else
			ADDRESS<= (others=>'0');
			etat_rgb:=DO_NOTHING_OUT;
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

		
		
		
		
		
		
		
		
		if horizontal_counter>=HMax then
			horizontal_counter:=0;
		else
			horizontal_counter:=horizontal_counter+1;
		end if;
		if horizontal_counter=0 then
			if vertical_counter>=VMax then
				vertical_counter:=0;
			else
				vertical_counter:=vertical_counter+1;
			end if;
		end if;
		
		if palette_horizontal_counter>=HMax then
			palette_horizontal_counter:=0;
		else
			palette_horizontal_counter:=palette_horizontal_counter+1;
		end if;
		if palette_horizontal_counter=0 then
			if palette_vertical_counter>=VMax then
				palette_vertical_counter:=0;
				palette_A_mem:=(others=>'0');
			else
				palette_vertical_counter:=palette_vertical_counter+1;
				if palette_vertical_counter mod VZoom=0 then -- one line per two...
					palette_A_mem:=palette_A_mem+1;
				end if;
			end if;
		elsif palette_horizontal_counter<2+16+1 then
				if palette_vertical_counter mod VZoom=0 then -- one line per two...
					palette_A_mem:=palette_A_mem+1;
				end if;
		end if;
		
	end if;
end process aZRaEL_vram2vgaAmstrad_process;

end Behavioral;
