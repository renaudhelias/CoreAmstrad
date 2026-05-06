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
			  --green_scanlines : in std_logic_vector (1 downto 0);
  			  
  			  pclk_in : in std_logic;
			  pclk_TV_CLK16MHz_in : in std_logic;
			  pclk_TV_CLK32MHz_in : in std_logic;
			  screen_color : in std_logic_vector (1 downto 0);
			  --vramORscandb : in std_logic;

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


--public class GreenScreen {
--
--	static final int MAX=2+2+2;
--	static final int MAX_TOP=64; // 6bits => 2^6=64.
--	static final int STEP=11; //MAX_TOP/MAX;
--
--	public static void main(String[] args) {
--		for (int red=0; red<4; red++) {
--			for (int green=0; green<4; green++) {
--				for (int blue=0; blue<4; blue++) {
--					try {
--						int r= value(red);
--						int g= value(green);
--						int b= value(blue);
--						int green_screen = r+g+b;
--						green_screen*=STEP;
--						// System.out.println(green_screen);
--						System.out.println("\""+max2flat(green_screen+MAX_TOP - MAX*STEP - 1)+"\", --"+r+","+g+","+b);
--					} catch (Exception e) {
--						// not mapped value !
--						System.out.println("\"000000\", --X,X,X");
--					}
--				}
--			}
--		}
--	}
--	
--	static int value(int color) throws Exception {
--		if (color==0) return 0;
--		if (color==1) return 1;
--		if (color==3) return 2;
--		throw new Exception("out of range");
--	}
--
--	static String max2flat(int sum) {
--		return fill(Integer.toBinaryString(sum),6);
--	}
--	
--	static String fill(String binary,int c) {
--		String out=binary;
--		while (out.length()<c) {
--			out="0"+out;
--		}
--		return out;
--	}
--}


-- manual calibration :
-- 111111 : 60/((2+2+2)/(2+2+2))=60 111100
-- 110100 : 60/((2+2+2)/(1+2+2))=50 110010
-- 101001 : 60/((2+2+2)/(0+2+2))=40 101000
-- 011110 : 60/((2+2+2)/(0+1+2))=30 011110
-- 010011 : 60/((2+2+2)/(0+0+2))=20 010100
-- 001000 : 60/((2+2+2)/(0+0+1))=10 001010
-- 000000 : 60/((2+2+2)/(0+0+0))=0  000000

-- "Les sucres en morceaux" calibration :
-- V[9,18],R[3,6],B[1,2]
-- 0,0,0 00 00 00 00
-- 0,0,1 00 00 01 01
-- 0,0,2 00 00 02 02
-- 0,1,0 00 03 00 03
-- 0,1,1 00 03 01 04
-- 0,1,2 00 03 02 05
-- 0,2,0 00 06 00 06
-- 0,2,1 00 06 01 07
-- 0,2,2 00 06 02 08
-- 1,0,0 09 00 00 09
-- 1,0,1 09 00 01 10
-- 1,0,2 09 00 02 11
-- 1,1,0 09 03 00 12
-- 1,1,1 09 03 01 13
-- 1,1,2 09 03 02 14
-- 1,2,0 09 06 00 15
-- 1,2,1 09 06 01 16
-- 1,2,2 09 06 02 17
-- 2,0,0 18 00 00 18
-- 2,0,1 18 00 01 19
-- 2,1,0 18 00 02 20
-- 2,1,0 18 03 00 21
-- 2,1,1 18 03 01 22
-- 2,1,2 18 03 02 23
-- 2,2,0 18 06 00 24
-- 2,2,1 18 06 01 25
-- 2,2,2 18 06 02 26

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
--0	54h	Black          0	0	0  	#000000	0/0/0	
--1	44h (or 50h)	Blue	0	0	50 	#000080	0/0/128	
--2	55h	Bright Blue    0	0	100	#0000FF	0/0/255	
--3	5Ch	Red	         50	0	0  	#800000	128/0/0	
--4	58h	Magenta        50	0	50 	#800080	128/0/128	
--5	5Dh	Mauve          50	0	100	#8000FF	128/0/255	
--6	4Ch	Bright Red    100	0	0  	#FF0000	255/0/0	
--7	45h (or 48h) Purple 100	0	50 	#FF0080	255/0/128	
--8	4Dh	Bright Magenta100	0	100	#FF00FF	255/0/255	
--9	56h	Green          0	50	0   	#008000	0/128/0	
--10	46h	Cyan           0	50	50 	#008080	0/128/128	
--11	57h	Sky Blue       0	50	100	#0080FF	0/128/255	
--12	5Eh	Yellow         50	50	0  	#808000	128/128/0	
--13	40h (or 41h)	White	50	50	50 	#808080	128/128/128	
--14	5Fh	Pastel Blue    50	50	100	#8080FF	128/128/255	
--15	4Eh	Orange        100	50	0  	#FF8000	255/128/0	
--16	47h	Pink          100	50	50 	#FF8080	255/128/128	
--17	4Fh	Pastel Magenta100	50	100	#FF80FF	255/128/255	
--18	52h	Bright Green   0 100	0  	#00FF00	0/255/0	
--19	42h (or 51h)Sea Green0 100	50 	#00FF80	0/255/128	
--20	53h	Bright Cyan    0 100	100	#00FFFF	0/255/255	
--21	5Ah	Lime          50 100	0  	#80FF00	128/255/0	
--22	59h	Pastel Green  50 100	50 	#80FF80	128/255/128	
--23	5Bh	Pastel Cyan	  50 100	100	#80FFFF	128/255/255	
--24	4Ah	Bright Yellow100 100	0  	#FFFF00	255/255/0	
--25	43h (or 49h)PYellow100 100	50 	#FFFF80	255/255/128	
--26	4Bh	Bright White 100 100	100	#FFFFFF	255/255/255	

type T_PALETTE is array (0 to 63) --(15 downto 0)
        of integer;

constant PALETTE_RGB:T_PALETTE :=
( 0, -- 00 00 00
  1, -- 00 00 01
  1, -- 00 00 >10< trou
  2, -- 00 00 11 OK
  
  9, -- 00 01 OO
  10,-- 00,01,01
  10,-- 00,01,>10< trou
  11,-- 00,01,11 OK
  
  9, -- 00,>10<,00 trou
  10,-- 00,>10<,01 trou 
  10,-- 00,>10<,>10< trou 
  11,-- 00,>10<,11 trou OK

  18,--  00,11,00
  19,--  00,11,01
  19,--  00,11,>10< trou
  20,--  00,11,11 OK
  
  3, -- 01,00,00
  4, -- 01,00,01
  4, -- 01,00,>10< trou
  5, -- 01,00,11 OK
  
  12, -- 01,01,00
  13, -- 01,01,01
  13, -- 01,01,>10< trou
  14, -- 01,01,11 OK
  
  12, -- 01,>10<,00 trou
  13, -- 01,>10<,01 trou
  13, -- 01,>10<,>10< trou
  14, -- 01,>10<,11 trou OK
  
  21, -- 01,11,00
  22, -- 01,11,01
  22, -- 01,11,>10< trou
  23, -- 01,11,11 OK
  
  3,  -- >10<<,00,00 trou
  4, -- >10<,00,01 trou
  4, -- >10<,00,>10< trou
  5, -- >10<,00,11 trou OK
	 
  12, -- >10<,01,00 trou
  13, -- >10<,01,01 trou
  13, -- >10<,01,>10< trou
  14, -- >10<,01,11 trou >OK
  
  12, -- >10<,>10<,00 trou
  13, -- >10<,>10<,01 trou
  13, -- >10<,>10<,10 trou
  14, -- >10<,>10<,11 trou OK
  
  21, -- >10<,11,00 trou
  22, -- >10<,11,01 trou
  22, -- >10<,11,>10< trou
  23, -- >10<,11,11 trou OK
  
  6, -- 11,00,00
  7, -- 11,00,01
  7, -- 11,00,>10< trou
  8, -- 11,00,11 OK
  
  15, -- 11,01,00 
  16, -- 11,01,01
  16, -- 11,01,>10< trou
  17, -- 11,01,11 OK
  
  15, -- 11,>10<,00
  16, -- 11,>10<,01
  16, -- 11,>10<,>10< trou
  17, --  11,>10<,11 OK
    
  24, -- 11,11,00
  25, -- 11,11,01
  25, -- 11,11,>10< trou
  26  -- 11,11,11
);


--mauvais mapping, on devrait avoir en paramètre une valeur composé parallèle
--se baser sur les couleurs système
type T_C64 is array (0 to 31) --(15 downto 0)
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
"101101", --l. gray 2D



"010111",
"110101",
"010000",
"001001",
"100001",
"011111",
"111100",
"010000",
"011111",
"100110",
"011111",
"101101",
"000010",
"110101",
"010111",
"101101"




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
"101101", --l. gray 2D




"011011",
"001111",
"101110",
"100101",
"110000",
"100110",
"001101",
"100001",
"011010",
"010011",
"010111",
"010111",
"110011",
"011001",
"101000",
"011010"





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
"101101", --l. gray 2D


"111111",
"111001",
"000000",
"111001",
"110011",
"000000",
"101100",
"111001",
"111001",
"111111",
"111111",
"011111",
"000101",
"000101",
"000101",
"010010"




);


component scandoubler
      port ( video_in	: in std_logic_vector(5 downto 0);
	hsync_in	: in std_logic;
	vsync_in	: in std_logic;
	dblclk		: in std_logic;
	pixclk		: in std_logic;
	video_out	: out std_logic_vector(5 downto 0);
	vsync_out	: out std_logic;
	hsync_out	: out std_logic);
   end component;



	 
signal HSYNC_XOR_video_out : STD_logic;
signal VSYNC_XOR_video_out : STD_logic;
signal VIDEO_in : std_logic_vector(5 downto 0);
signal VIDEO_scan : std_logic_vector(5 downto 0);
signal VSYNC_scan : STD_LOGIC;
signal HSYNC_scan : STD_LOGIC;

begin

--todo
--green_scanlines<=screen_color(0) and (screen_vga="01"); -- not(screen_vga(1)) and screen_vga(0)); -- 01 scanlines72Hz
green_scanlines<=screen_color(0) & (not(screen_vga(1)) and screen_vga(0)); -- 01 scanlines72Hz

--original signal (non présent dans MYST_CONFIG_STRING
true_mode<= '1' when mode='1' or screen_vga="10" else '0';

-- with scandoubler
scanner : scandoubler
      port map (video_in=>VIDEO_in,
                hsync_in=>HSYNC_XOR_video_out,
                vsync_in=>VSYNC_XOR_video_out,
					 dblclk=>pclk_TV_CLK32MHz_in,
                pixclk=>pclk_TV_CLK16MHz_in,
                video_out=>VIDEO_scan,
                vsync_out=>VSYNC_scan,
					 hsync_out=>HSYNC_scan
					 );
					 
--VIDEO_scan<=fromageR(1 downto 0)  & "00"  & "00";
VIDEO_in<=canal_greenTV when green_scanlines(1)='1' else canal_redTV(5 downto 4) & canal_greenTV(5 downto 4) & canal_blueTV(5 downto 4);
RED_out<=canal_red when true_mode='0' and screen_vga(1)='0' else 
	"000000" when true_mode='0' and screen_vga(1)='1' and green_scanlines(1)='1' else
	VIDEO_scan(5 downto 4) & "0000" when true_mode='1' and screen_vga="10" else canal_redTV;
GREEN_out<=canal_green when true_mode='0' and screen_vga(1)='0' else 
	VIDEO_scan when true_mode='0' and screen_vga(1)='1' and green_scanlines(1)='1' else
	VIDEO_scan(3 downto 2) & "0000" when true_mode='1' and screen_vga="10" else canal_greenTV;
BLUE_out<=canal_blue when true_mode='0' and screen_vga(1)='0' else
	"000000" when true_mode='0' and screen_vga(1)='1' and green_scanlines(1)='1' else
	VIDEO_scan(1 downto 0) & "0000" when true_mode='1' and screen_vga="10" else canal_blueTV;
HSYNC_XOR_out<= canal_hsync when true_mode='0' and screen_vga(1)='0' else HSYNC_scan when true_mode='1' and screen_vga="10" else not(canal_hsyncTV xor canal_vsyncTV);
VSYNC_XOR_out<= canal_vsync when true_mode='0' and screen_vga(1)='0' else VSYNC_scan when true_mode='1' and screen_vga="10" else '1';

--RED_out<=canal_red when mode='0' else canal_redTV;
--GREEN_out<=canal_green when mode='0' else canal_greenTV;
--BLUE_out<=canal_blue when mode='0' else canal_blueTV;

green_color_vga : process(pclk_in) is
begin
		if rising_edge(pclk_in) then
			if screen_color="11" then
				--C64 -- couleur en hexa
				if green_scanlines(0)='0' or RED_in(3)='0' then
					canal_red<= C64_SCREEN_RED(PALETTE_RGB(conv_integer(RED_in(5 downto 4) & GREEN_in(5 downto 4) & BLUE_in(5 downto 4))));
					canal_green<= C64_SCREEN_GREEN(PALETTE_RGB(conv_integer(RED_in(5 downto 4) & GREEN_in(5 downto 4) & BLUE_in(5 downto 4))));
					canal_blue<= C64_SCREEN_BLUE(PALETTE_RGB(conv_integer(RED_in(5 downto 4) & GREEN_in(5 downto 4) & BLUE_in(5 downto 4))));
					--cyan 3 KO
					-- 4 purple
					--vert 5 OK
					--canal_red<= C64_SCREEN_RED(5);
					--canal_green<= C64_SCREEN_GREEN(5);
					--canal_blue<= C64_SCREEN_BLUE(5);
					
					--canal_red<= C64_SCREEN_RED(conv_integer(RED_in(5 downto 4)))(5 downto 0);
					--canal_green<= C64_SCREEN_GREEN(conv_integer(GREEN_in(5 downto 4)))(5 downto 0);
					--canal_blue<= C64_SCREEN_BLUE(conv_integer(BLUE_in(5 downto 4)))(5 downto 0);
				else
					--pas de scanline pour le moment
					canal_red<= "0" & C64_SCREEN_RED(PALETTE_RGB(conv_integer(RED_in(5 downto 4) & GREEN_in(5 downto 4) & BLUE_in(5 downto 4))))(5 downto 1);
					canal_green<= "0" & C64_SCREEN_GREEN(PALETTE_RGB(conv_integer(RED_in(5 downto 4) & GREEN_in(5 downto 4) & BLUE_in(5 downto 4))))(5 downto 1);
					canal_blue<= "0" & C64_SCREEN_BLUE(PALETTE_RGB(conv_integer(RED_in(5 downto 4) & GREEN_in(5 downto 4) & BLUE_in(5 downto 4))))(5 downto 1);

--					canal_red<= C64_SCREEN_RED(5);
--					canal_green<= C64_SCREEN_GREEN(5);
--					canal_blue<= C64_SCREEN_BLUE(5);
					
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

--assign VGA_HS = scandoubler_disable?!(video_hs^video_vs):sd_hs;
--assign VGA_VS = scandoubler_disable?1'b1:sd_vs;
HSYNC_out<=canal_hsync when true_mode='0' and screen_vga(1)='0' else HSYNC_scan when true_mode='0' and screen_vga(1)='1' else canal_hsyncTV;
VSYNC_out<=canal_vsync when true_mode='0' and screen_vga(1)='0' else VSYNC_scan when true_mode='0' and screen_vga(1)='1' else canal_vsyncTV;
HSYNC_XOR_video_out<= canal_hsyncTV;
VSYNC_XOR_video_out<= canal_vsyncTV;
pclk_out<=pclk_in when true_mode='0' and screen_vga(1)='0' else pclk_TV_CLK16MHz_in;

end Behavioral;

