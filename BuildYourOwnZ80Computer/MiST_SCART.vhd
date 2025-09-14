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
-- MIST_*.vhd : MiST-board simple adapter (glue-code)
-- This type of component is only used on my main schematic.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MIST_SCART is
    Port ( RED_in : in  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_in : in  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_in : in  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_in : in STD_logic;
			  VSYNC_in : in STD_logic;
           RED_out : out  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_out : out  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_out : out  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_out : out STD_logic;
			  VSYNC_out : out STD_logic;
			  
			  RED_TV_in : in  STD_LOGIC_VECTOR (5 downto 0);
           GREEN_TV_in : in  STD_LOGIC_VECTOR (5 downto 0);
           BLUE_TV_in : in  STD_LOGIC_VECTOR (5 downto 0);
			  HSYNC_TV_in : in STD_logic;
			  VSYNC_TV_in : in STD_logic;
			  
			  mode : in std_logic;
			  screen_vga : in std_logic_vector (1 downto 0);
  			  pclk_in : in std_logic;
			  pclk_TV_CLK16MHz_in : in std_logic;
			  pclk_TV_CLK32MHz_in : in std_logic;
			  screen_color : in std_logic_vector (1 downto 0);


			  --green_scanlines : in std_logic_vector (1 downto 0);
			  -- vramORscandb : in std_logic;

			  pclk_out : out std_logic;
			  
			  HSYNC_XOR_out : out STD_logic;
			  VSYNC_XOR_out : out STD_logic
			  );
end MIST_SCART;

architecture Behavioral of MIST_SCART is

signal canal_red:STD_LOGIC_VECTOR (5 downto 0);
signal canal_green:STD_LOGIC_VECTOR (5 downto 0);
signal canal_blue:STD_LOGIC_VECTOR (5 downto 0);
signal canal_redTV:STD_LOGIC_VECTOR (5 downto 0);
signal canal_greenTV:STD_LOGIC_VECTOR (5 downto 0);
signal canal_blueTV:STD_LOGIC_VECTOR (5 downto 0);

-- for delta time purpose
signal canal_vsync:std_logic;
signal canal_hsync:std_logic;
signal canal_vsyncTV:std_logic;
signal canal_hsyncTV:std_logic;
signal true_mode:std_logic;
signal green_scanlines:STD_LOGIC_VECTOR(1 downto 0);

-- 64/27=2,37 => 2 => 2*27=54
type T_GREEN is array (0 to 63) --(63 downto 0)
        of STD_LOGIC_VECTOR(5 downto 0);
  constant GREEN_SCREEN : T_GREEN :=
            ("000000", --"11111111111111111111111111111101", --0,0,0
"000010", --0,0,1
"000000", --X,X,X
"000100", --0,0,2
"000110", --0,1,0
"001000", --0,1,1
"000000", --X,X,X
"001010", --0,1,2
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"001100", --0,2,0
"001110", --0,2,1
"000000", --X,X,X
"010000", --0,2,2
"010010", --1,0,0
"010100", --1,0,1
"000000", --X,X,X
"010110", --1,0,2
"011000", --1,1,0
"011010", --1,1,1
"000000", --X,X,X
"011100", --1,1,2
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"011110", --1,2,0
"100000", --1,2,1
"000000", --X,X,X
"100010", --1,2,2
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"100100", --2,0,0
"100110", --2,0,1
"000000", --X,X,X
"101000", --2,0,2
"101010", --2,1,0
"101100", --2,1,1
"000000", --X,X,X
"101110", --2,1,2
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"000000", --X,X,X
"110000", --2,2,0
"110010", --2,2,1
"000000", --X,X,X
"110100" --2,2,2
);

type T_COLOR is array (0 to 3) --(63 downto 0)
        of STD_LOGIC_VECTOR(5 downto 0);
  constant COLOR_SCREEN : T_COLOR :=
            ("000000",
"011010",
"011010",
"110100"
);

--https://www.cpcwiki.eu/index.php/CPC_Palette
--Firmware Number	Hardware Number	Colour Name	R %	G %	B %	Hexadecimal	RGB values	Colour
--0	54h	Black	0	0	0	#000000	0/0/0	
--1	44h (or 50h)	Blue	0	0	50	#000080	0/0/128	
--2	55h	Bright Blue	0	0	100	#0000FF	0/0/255	
--3	5Ch	Red	50	0	0	#800000	128/0/0	
--4	58h	Magenta	50	0	50	#800080	128/0/128	
--5	5Dh	Mauve	50	0	100	#8000FF	128/0/255	
--6	4Ch	Bright Red	100	0	0	#FF0000	255/0/0	
--7	45h (or 48h)	Purple	100	0	50	#FF0080	255/0/128	
--8	4Dh	Bright Magenta	100	0	100	#FF00FF	255/0/255	
--9	56h	Green	0	50	0	#008000	0/128/0	
--10	46h	Cyan	0	50	50	#008080	0/128/128	
--11	57h	Sky Blue	0	50	100	#0080FF	0/128/255	
--12	5Eh	Yellow	50	50	0	#808000	128/128/0	
--13	40h (or 41h)	White	50	50	50	#808080	128/128/128	
--14	5Fh	Pastel Blue	50	50	100	#8080FF	128/128/255	
--15	4Eh	Orange	100	50	0	#FF8000	255/128/0	
--16	47h	Pink	100	50	50	#FF8080	255/128/128	
--17	4Fh	Pastel Magenta	100	50	100	#FF80FF	255/128/255	
--18	52h	Bright Green	0	100	0	#00FF00	0/255/0	
--19	42h (or 51h)	Sea Green	0	100	50	#00FF80	0/255/128	
--20	53h	Bright Cyan	0	100	100	#00FFFF	0/255/255	
--21	5Ah	Lime	50	100	0	#80FF00	128/255/0	
--22	59h	Pastel Green	50	100	50	#80FF80	128/255/128	
--23	5Bh	Pastel Cyan	50	100	100	#80FFFF	128/255/255	
--24	4Ah	Bright Yellow	100	100	0	#FFFF00	255/255/0	
--25	43h (or 49h)	Pastel Yellow	100	100	50	#FFFF80	255/255/128	
--26	4Bh	Bright White	100	100	100	#FFFFFF	255/255/255	

type T_PALETTE is array (0 to 63) --(15 downto 0)
        of integer;
--constant PALETTE_RGB_v0:T_PALETTE :=
---- todo : réordonnancer suivant ordre incrementation hexa
----todo trie, puis trous (plein (exemple border 26) ou vrai trou)
--(0, -- 000000
--1, -- 000080
--2, -- 0000FF
--3, -- 800000
--4, -- 800080
--5, -- 8000FF
--6, -- FF0000
--7, -- FF0080
--8, -- FF00FF
--9, -- 008000
--10, -- 008080
--11, -- 0080FF
--12, -- 808000
--13, -- 808080
--14, -- 8080FF
--15, -- FF8000
--(others=>0)
--);

--constant PALETTE_RGB_v1:T_PALETTE :=
--(0, -- 000000
--1, -- 000080
--2, -- 0000FF
--9, -- 008000
--10, -- 008080
--11, -- 0080FF
--0, -- 00FF00
--0, -- 00FF80
--0, -- 00FFFF
--3, -- 800000
--4, -- 800080
--5, -- 8000FF
--12, -- 808000
--13, -- 808080
--14, -- 8080FF
--0, -- 80FF00
--0, -- 80FF80
--0, -- 80FFFF
--6, -- FF0000
--7, -- FF0080
--8, -- FF00FF
--15, -- FF8000
--(others=>0)
--);

--constant PALETTE_RGB_v2:T_PALETTE :=
--(0, -- 000000
--1, -- 000080
--2, -- 0000FF
--9, -- 008000
--10, -- 008080
--11, -- 0080FF
--0, -- 00FF00
--0, -- 00FF80
--0, -- 00FFFF
--3, -- 800000
--4, -- 800080
--5, -- 8000FF
--12, -- 808000
--13, -- 808080
--14, -- 8080FF
--0, -- 80FF00
--0, -- 80FF80
--0, -- 80FFFF
--6, -- FF0000
--7, -- FF0080
--8, -- FF00FF
--15, -- FF8000
--(others=>0)
--);

-- Red_in & Green_in & BluE_in

constant PALETTE_RGB:T_PALETTE :=
( 0, -- 00 00 00
  1,-- 00 00 01
  1,-- 00 00 10
  2,-- 00 00 11
  
  9,-- 00 01 OO
  10,
  10,
  11,
  
  0,
  0,
  0,
  0,
  
  5,
  4,
  4,
  5,
  
  12,
  13,
  13,
  14,
  
  0,
  0,
  0,
  0,
  
  
  6,
  7,
  7,
  8,
  
  15,
  
  -- bouclage de couleurs
  1,1,2,
  
  9,10,10,11,
    
  5,4,4,5,
  
  12, 13,13,14,
  
  0,0,0,0,
  
  6,7,7,8,
  
  -- rebouclage de couleurs
  0,1,1,2,
  
  9,10,10,11,
    
  5,4,4,5
  
  --12, 13,13,14,
  
  --6,7,7,8
);

--constant PALETTE_RGB_v3:T_PALETTE :=
--(0, -- 000000
--1, -- 000080
--2, -- 0000FF
--9, -- 008000
--10, -- 008080
--11, -- 0080FF
--0, -- 00FF00
--0, -- 00FF80
--0, -- 00FFFF
--3, -- 800000
--4, -- 800080
--5, -- 8000FF
--12, -- 808000
--13, -- 808080
--14, -- 8080FF
--0, -- 80FF00
--0, -- 80FF80
--0, -- 80FFFF
--6, -- FF0000
--7, -- FF0080
--8, -- FF00FF
--15, -- FF8000
--(others=>0)
--);

--mauvais mapping, on devrait avoir en paramètre une valeur composé parallèle
--se baser sur les couleurs système
type T_C64 is array (0 to 15) --(15 downto 0)
        of STD_LOGIC_VECTOR(5 downto 0);
constant C64_SCREEN_RED:T_C64 :=
("000000", --black 00
"111111", --white 3F
"101011", --red 2B
"011000", --cyan 18
"101100", --purple 2C
"010010", --green 12
"001101", --blue 0D
"111001", --yellow 39
"101101", --orange 2D
"011010", --brown 1A
"111010", --pink 3A
"010011", --d. gray 13
"100001", --gray 21
"101001", --l. green 29
"101001", --l. blue 1C
"101101" --l. gray 2D
);

constant C64_SCREEN_GREEN:T_C64 :=
("000000", --black 00
"111111", --white 3F
"001010", --red 0A
"110110", --cyan 36
"001111", --purple 0F
"110001", --green 31
"001110", --blue 0E
"111011", --yellow 3B
"010110", --orange 16
"001110", --brown 0E
"011101", --pink 1D
"010011", --d. gray 13
"100001", --gray 21
"111110", --l. green 3E
"011111", --l. blue 1F
"101101" --l. gray 2D
);

constant C64_SCREEN_BLUE:T_C64 :=
("000000", --black 00
"111111", --white 3F
"001010", --red 0A
"110011", --cyan 33
"101101", --purple 2D
"010010", --green 12
"110001", --blue 31
"010011", --yellow 13
"000111", --orange 07
"000010", --brown 02
"011011", --pink 1B
"010011", --d. gray 13
"100001", --gray 21
"100111", --l. green 27
"111001", --l. blue 39
"101101" --l. gray 2D
);





component scandoubler is
	  generic(
			HCNT_WIDTH : integer;
			COLOR_DEPTH : integer
	  );
	  port (
			clk_sys : in std_logic;
			-- scanlines (00-none 01-25% 10-50% 11-75%)
			scanlines : in std_logic_vector(1 downto 0);
			hs_in : in std_logic;
			vs_in : in std_logic;
			r_in : in std_logic_vector(COLOR_DEPTH-1 downto 0);
			g_in : in std_logic_vector(COLOR_DEPTH-1 downto 0);
			b_in : in std_logic_vector(COLOR_DEPTH-1 downto 0);
			hs_out : out std_logic;
			vs_out : out std_logic;
			r_out : out std_logic_vector(1 downto 0);
			g_out : out std_logic_vector(1 downto 0);
			b_out : out std_logic_vector(1 downto 0)
	  );
end component;


	 
signal HSYNC_XOR_video_out : STD_logic;
signal VSYNC_XOR_video_out : STD_logic;
signal VIDEO_in : std_logic_vector(5 downto 0);
signal VIDEO_scan : std_logic_vector(5 downto 0);
signal VSYNC_scan : STD_LOGIC;
signal HSYNC_scan : STD_LOGIC;

-- adapter sorgelig
signal fromageR:std_logic_vector(1 downto 0);
signal fromageG:std_logic_vector(1 downto 0);
signal fromageB:std_logic_vector(1 downto 0);

begin

--todo
--green_scanlines<=screen_color(0) and (screen_vga="01"); -- not(screen_vga(1)) and screen_vga(0)); -- 01 scanlines72Hz
green_scanlines<=screen_color(0) & (not(screen_vga(1)) and screen_vga(0)); -- 01 scanlines72Hz

--original signal
true_mode<= '1' when mode='1' or screen_vga="11" else '0';

-- with scandoubler
scanner : scandoubler
		generic map (
			HCNT_WIDTH => 4, --9,
			COLOR_DEPTH => 2 --6 -- 1-6
		)
      port map (clk_sys=>pclk_TV_CLK32MHz_in,
            scanlines=>"00",
				hs_in=>canal_hsyncTV, --not(canal_hsyncTV xor canal_vsyncTV), --canal_hsync,
            vs_in=>canal_vsyncTV, --'1', --canal_vsync,
				r_in=>canal_redTV(5 downto 4), -->VIDEO_in,
				g_in=>canal_greenTV(5 downto 4),
				b_in=>canal_blueTV(5 downto 4),
            r_out=>fromageR,
				g_out=>fromageG, --VIDEO_scan,
				b_out=>fromageB, --VIDEO_scan,
            vs_out=>VSYNC_scan,
				hs_out=>HSYNC_scan
					 );
					 
VIDEO_scan<=fromageR(1 downto 0)  & "00"  & "00";
--VIDEO_in<=canal_greenTV when green_scanlines(1)='1' else canal_redTV(5 downto 4) & canal_greenTV(5 downto 4) & canal_blueTV(5 downto 4);
RED_out<=canal_red when true_mode='0' and screen_vga(1)='0' else 
	"000000" when true_mode='0' and screen_vga(1)='1' and green_scanlines(1)='1' else
	--VIDEO_scan(5 downto 4) & "0000" when true_mode='0' and screen_vga="01" else canal_redTV;
	VIDEO_scan(5 downto 4) & "0000" when true_mode='1' and screen_vga="10" else canal_redTV;
GREEN_out<=canal_green when true_mode='0' and screen_vga(1)='0' else 
	VIDEO_scan when true_mode='0' and screen_vga(1)='1' and green_scanlines(1)='1' else
	VIDEO_scan(3 downto 2) & "0000" when true_mode='0' and screen_vga(1)='1' else canal_greenTV;
BLUE_out<=canal_blue when true_mode='0' and screen_vga(1)='0' else
	"000000" when true_mode='0' and screen_vga(1)='1' and green_scanlines(1)='1' else
	VIDEO_scan(1 downto 0) & "0000" when true_mode='0' and screen_vga(1)='1' else canal_blueTV;
HSYNC_XOR_out<= canal_hsync when true_mode='0' and screen_vga(1)='0' else HSYNC_scan when true_mode='1' and screen_vga="10" else not(canal_hsyncTV xor canal_vsyncTV);
VSYNC_XOR_out<= canal_vsync when true_mode='0' and screen_vga(1)='0' else VSYNC_scan when true_mode='1' and screen_vga="10" else '1';


green_color_vga : process(pclk_in) is
begin
		if rising_edge(pclk_in) then
			if screen_color="11" then
				--C64 -- couleur en hexa
				if green_scanlines(0)='0' or RED_in(3)='0' then
					canal_red<= C64_SCREEN_RED(PALETTE_RGB(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4))));
					canal_green<= C64_SCREEN_GREEN(PALETTE_RGB(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4))));
					canal_blue<= C64_SCREEN_BLUE(PALETTE_RGB(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4))));
					--canal_red<= C64_SCREEN_RED(conv_integer(RED_in(5 downto 4)))(5 downto 0);
					--canal_green<= C64_SCREEN_GREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 0);
					--canal_blue<= C64_SCREEN_BLUE(conv_integer(BLUE_in(5 downto 4)))(5 downto 0);
				else
					--pas de scanline pour le moment
					canal_red<= C64_SCREEN_RED(PALETTE_RGB(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4))));
					canal_green<= C64_SCREEN_GREEN(PALETTE_RGB(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4))));
					canal_blue<= C64_SCREEN_BLUE(PALETTE_RGB(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4))));
					
					--canal_red<= "0" & C64_SCREEN_RED(conv_integer(RED_in(5 downto 4)))(5 downto 1);
					--canal_green<= "0" & C64_SCREEN_GREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 1);
					--canal_blue<= "0" & C64_SCREEN_BLUE(conv_integer(BLUE_in(5 downto 4)))(5 downto 1);
				end if;
			elsif screen_color="10" then
				--orange
				if green_scanlines(0)='0' or RED_in(3)='0' then
					canal_red<= COLOR_SCREEN(conv_integer(RED_in(5 downto 4)))(5 downto 0);
					canal_green<= "0" & COLOR_SCREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 1);
					canal_blue<= "00" & COLOR_SCREEN(conv_integer(BLUE_in(5 downto 4)))(5 downto 2);
				else
					canal_red<= "0" & COLOR_SCREEN(conv_integer(RED_in(5 downto 4)))(5 downto 1);
					canal_green<= "00" & COLOR_SCREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 2);
					canal_blue<= "000" & COLOR_SCREEN(conv_integer(BLUE_in(5 downto 4)))(5 downto 3);
				end if;
			elsif green_scanlines(1)='0' then
				if green_scanlines(0)='0' or RED_in(3)='0' then
					canal_red<= COLOR_SCREEN(conv_integer(RED_in(5 downto 4)));
					canal_green<= COLOR_SCREEN(conv_integer(GREEN_in(5 downto 4)));
					canal_blue<= COLOR_SCREEN(conv_integer(BLUE_in(5 downto 4)));
				else
					canal_red<= "0" & COLOR_SCREEN(conv_integer(RED_in(5 downto 4)))(5 downto 1);-- + "00" & COLOR_SCREEN(conv_integer(RED_in(5 downto 4)))(5 downto 2);
					canal_green<= "0" & COLOR_SCREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 1);-- + "00" & COLOR_SCREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 2);
					canal_blue<= "0" & COLOR_SCREEN(conv_integer(BLUE_in(5 downto 4)))(5 downto 1);-- + "00" & COLOR_SCREEN(conv_integer(BLUE_in(5 downto 4)))(5 downto 2);
				end if;
			else
				if green_scanlines(0)='0' or RED_in(3)='0' then
					canal_red<= "000000";
					-- "Les sucres en morceaux" : V[9,18],R[3,6],B[1,2] 
					canal_green<= GREEN_SCREEN(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4)));
					canal_blue<= "000000";
				else
					canal_red<= "000000";
					-- "Les sucres en morceaux" : V[9,18],R[3,6],B[1,2] 
					canal_green<= "0" & GREEN_SCREEN(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4)))(5 downto 1); -- + "00" & GREEN_SCREEN(conv_integer(GREEN_in(5 downto 4) & RED_in(5 downto 4) & BLUE_in(5 downto 4)))(5 downto 2);
					canal_blue<= "000000";
				end if;
			end if;
			canal_hsync<=HSYNC_in;
			canal_vsync<=VSYNC_in;
		end if;
end process green_color_vga;

green_color_tv : process(pclk_TV_CLK16MHz_in) is
begin
		if rising_edge(pclk_TV_CLK16MHz_in) then


			if green_scanlines(1)='0' then
				canal_redTV<= COLOR_SCREEN(conv_integer(RED_TV_in(5 downto 4)));
				canal_greenTV<= COLOR_SCREEN(conv_integer(GREEN_TV_in(5 downto 4)));
				canal_blueTV<= COLOR_SCREEN(conv_integer(BLUE_TV_in(5 downto 4)));
			else
				canal_redTV<= "000000";
				-- "Les sucres en morceaux" : V[9,18],R[3,6],B[1,2] 
				canal_greenTV<= GREEN_SCREEN(conv_integer(GREEN_TV_in(5 downto 4) & RED_TV_in(5 downto 4) & BLUE_TV_in(5 downto 4)));
				canal_blueTV<= "000000";
			end if;
			canal_hsyncTV<=HSYNC_TV_in;
			canal_vsyncTV<=VSYNC_TV_in;
		end if;
end process green_color_tv;



HSYNC_out<=canal_hsync when true_mode='0' and screen_vga(1)='0' else HSYNC_scan when true_mode='0' and screen_vga(1)='1' else canal_hsyncTV;
VSYNC_out<=canal_vsync when true_mode='0' and screen_vga(1)='0' else VSYNC_scan when true_mode='0' and screen_vga(1)='1' else canal_vsyncTV;
HSYNC_XOR_video_out<= canal_hsyncTV;
VSYNC_XOR_video_out<= canal_vsyncTV;
pclk_out<=pclk_in when true_mode='0' and screen_vga(1)='0' else pclk_TV_CLK16MHz_in;

end Behavioral;

