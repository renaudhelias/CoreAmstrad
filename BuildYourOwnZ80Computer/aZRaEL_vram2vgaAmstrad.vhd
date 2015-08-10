library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aZRaEL_vram2vgaAmstrad is
    Generic(
	 -- Amstrad
	 -- 
	 OFFSET:STD_LOGIC_VECTOR(15 downto 0):=x"C000";
	 -- ecran.bas
	 -- CLS
	 -- FOR A=&C000 TO &FFFF
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- ligne.bas
	 -- CLS
	 -- FOR A=&C000 TO &C050
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- lignes.bas
	 -- CLS
	 -- FOR A=&C000 TO &C7FF
	 -- POKE A,&FF
	 -- NEXT A
	 -- 
	 -- Organisation d'un octet :
	 -- mode 1 :
	 --   1 octet <=> 4 pixels
	 --   [AAAA][BBBB] : superposition des couleurs de [AAAA] et [BBBB]
	 --   A+B=0+0=bleu foncé (couleur du fond par défaut)
	 --   A+B=0+1=bleu clair
	 --   A+B=1+0=jaune
	 --   A+B=1+1=rouge
	 --  par exemple [1100][0011] donnera 2 pixels jaune suivi de 2 pixels bleu clair &C3
	 -- mode 0 : 
	 --   1 octet <=> 2 pixels
	 --   [AA][BB][CC][DD] : superposition des couleurs de AA, BB, CC, DD
	 --   comme il y a "trop" de combinaisons pour une sortie RGB sans variation de lumière
	 --   ils ont fait clignoter les dernière combinaisons. La variation de lumière a été
	 --   ajouté par la suite, avec PEN/PAPER...
	 -- mode 2 :
	 --   1 octet <=> 8 pixels
	 --   [AAAAAAAA] : on a donc que 2 couleurs xD
	 MODE:integer:=1;
	 NB_PIXEL_PER_OCTET:integer:=4;--2**(MODE+1);
	 -- Lorsqu'on lance lignes.bas on peut ensuite déplacer le curseur pour compter
	 -- mode 1 :
	 --   On a 40 caractères par lignes en mode 1, un caractère fait 8 pixels de large
	 CHAR_WIDTH:integer:=8;
	 --   On a donc 2*4*40 pixels en largeur
	 SCREEN_WIDTH:integer:=2*4*40;
	 --   On a 25 lignes
	 LINE_COUNT:integer:=25;
	 --   Le caractère fait 8 pixels de haut
	 CHAR_HEIGHT:integer:=8;
	 --   on a donc LINE_COUNT*CHAR_HEIGHT en hauteur
	 SCREEN_HEIGHT:integer:=25*8; --LINE_COUNT*CHAR_HEIGHT;
	 -- 
	 -- On a 320x200pixels=64000pixels=16000 octets utilisés
	 --  or on scanne &FFFF+1-&C000=16384 octets... donc il y a des trous x)
	 -- 
	 -- trou.bas
	 -- MODE 1
	 -- CLS
	 -- FOR A=0 TO 639
	 -- FOR B=0 to 399
	 -- PLOT a,b
	 -- NEXT b
	 -- NEXT a
	 -- 
	 -- On observe le snapshoot on a des &F0 aux adresses :
	 -- C000 à C7D0-1
	 -- C800 à CFD0-1
	 -- D000 à D7D0-1
	 -- D800 à DFD0-1
	 -- E000 à E7D0-1
	 -- E800 à EFD0-1
	 -- F000 à F7D0-1
	 -- F800 à FFD0-1
	 -- 
	 -- si on va en bas de l'écran afin de remonter l'image d'un cran et qu'on refait un snapshoot
	 -- on remarque que c'est le bazard niveau mémoire : les trou ne sont plus au même endroit !
	 -- c'est pourquoi j'ai mis "MODE 1" dans trou.bas x)
	 -- si on remonte l'image en allant en bas de l'écran avec le curseur
	 --  un "poke &C000,&ff" ne vise plus en haut à gauche... parfois il ne marche même plus : il est dans le trou !
	 -- 
	 NB_TROU:integer:=8;
	 TAILLE_TROU:integer:=48;-- C800-C7D0= &30
	 TAILLE_PAQUET:integer:=2000;-- C7D0-C000= &7D0
	 TAILLE_PAQUET_ET_TROU:integer:=2048; -- &800
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
				  --SQRT_VRAM_WIDTH:integer:=7;
				  --SQRT_VRAM_HEIGHT:integer:=7;
				  SQRT_VRAM_SIZE:integer:=16;

				  HZoom:integer:=2;
				  VZoom:integer:=2;
				  HDecal:integer:=0;
				  VDecal:integer:=40
		  );
    Port ( DATA : in  STD_LOGIC_VECTOR (7 downto 0); -- buffer
           ADDRESS : out  STD_LOGIC_VECTOR (SQRT_VRAM_SIZE-1 downto 0);
           R : out  STD_LOGIC;
           RED : out  STD_LOGIC;
           GREEN : out  STD_LOGIC;
           BLUE : out  STD_LOGIC;
           VSYNC : out  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           CLK_25MHz : in  STD_LOGIC);
end aZRaEL_vram2vgaAmstrad;

architecture Behavioral of aZRaEL_vram2vgaAmstrad is
	constant DO_NOTHING : STD_LOGIC:='0';
	constant DO_READ : STD_LOGIC:='1';
	constant DO_HSYNC : STD_LOGIC:='1';
	constant DO_VSYNC : STD_LOGIC:='1';
begin

aZRaEL_vram2vgaAmstrad_process : process(CLK_25MHz) is
	variable horizontal_counter : integer range 0 to HTot:=0;
	variable vertical_counter : integer range 0 to VTot:=0;
	variable etat_rgb : STD_LOGIC:=DO_NOTHING;
	variable etat_hsync : STD_LOGIC:=DO_NOTHING;
	variable etat_vsync : STD_LOGIC:=DO_NOTHING;
	variable color : STD_LOGIC_VECTOR(2**(2-MODE)-1 downto 0);
	variable cursor_pixel_ref : integer range 0 to NB_PIXEL_PER_OCTET-1;
	variable cursor_pixel : integer range 0 to NB_PIXEL_PER_OCTET-1;
	variable v:integer range 0 to SCREEN_HEIGHT-1;
	variable h:integer range 0 to SCREEN_WIDTH-1;
	variable ligne_carac_v:integer range 0 to CHAR_HEIGHT-1;
	variable no_ligne_v:integer range 0 to LINE_COUNT-1;
	variable new_h:integer range 0 to SCREEN_WIDTH/NB_PIXEL_PER_OCTET-1;
	variable new_v:integer range 0 to SCREEN_HEIGHT-1;
	variable no_trou:integer range 0 to NB_TROU-1;
	--variable DATA_MEM : STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
begin
	if rising_edge(CLK_25MHz) then
		--DATA_MEM:=DATA;
		if etat_rgb = DO_READ then
			color:=(others=>'0');
			for i in 2**(2-MODE)-1 downto 0 loop
				color(i):=DATA(i*NB_PIXEL_PER_OCTET+(NB_PIXEL_PER_OCTET-1-cursor_pixel));
			end loop;
			if color'length=1 then
				RED<='1';
				GREEN<='0';
				BLUE<=color(0);
			elsif color'length=2 then
				RED<=color(1);
				GREEN<=color(0) xor color(1);
				BLUE<=not(color(1));
			else
				RED<=color(0);
				GREEN<=color(2);
				BLUE<=color(1);
			end if;
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
			if horizontal_counter<HDecal or vertical_counter<VDecal or horizontal_counter>=HDecal+HZoom*(SCREEN_WIDTH) or vertical_counter>=VDecal+VZoom*(SCREEN_HEIGHT) then
				ADDRESS<= (others=>'0');
				R<='0';
				etat_rgb:=DO_NOTHING;
			else
				v:=(vertical_counter-VDecal)/VZoom;
				h:=(horizontal_counter-HDecal)/HZoom;
				cursor_pixel_ref:=h mod NB_PIXEL_PER_OCTET;
				-- Fonctionnement avec une RAM SYNCHRONE (à la vitesse d'écriture différente de la vitesse de lecture) :
				-- il y a 4 pixel par octet. Il y a un temps de retard entre la requête pour l'adressage
				-- et la réponse de la donnée. Je zoom x2, donc deux pixels qui se suivent sont les même
				-- ou poser mon cursus afin qu'il pointe le bon pixel dans le bon octet au bon moment ?
				-- réponse : c'est plus simple de retarder la donnée de 2 temps en tout, puis de retarder le curseur :
				cursor_pixel:=(cursor_pixel_ref+NB_PIXEL_PER_OCTET-1) mod NB_PIXEL_PER_OCTET; -- la donnée a un 1 temps de retard
				new_h:=h/NB_PIXEL_PER_OCTET;
				no_ligne_v:=v/CHAR_HEIGHT;
				ligne_carac_v:=v; --%CHAR_HEIGHT;
				-- new_v:=no_ligne_v*CHAR_HEIGHT+ligne_carac_v; -- normalement
				new_v:=ligne_carac_v*LINE_COUNT+no_ligne_v; -- Amstrad style
				
				--no_trou:=(new_h*new_v)/TAILLE_PAQUET;
				no_trou:=ligne_carac_v;

				--ADDRESS<=conv_std_logic_vector(conv_integer(OFFSET(15 downto 0))+new_v*SCREEN_WIDTH+new_h,SQRT_VRAM_SIZE);
				ADDRESS<=conv_std_logic_vector(49152+no_trou*TAILLE_TROU+new_v*(SCREEN_WIDTH/NB_PIXEL_PER_OCTET)+new_h,SQRT_VRAM_SIZE);
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
end process aZRaEL_vram2vgaAmstrad_process;


end Behavioral;

