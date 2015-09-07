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
-- FPGAmstrad_amstrad_motherboard.simple_GateArrayInterrupt
-- VRAM/PRAM write
-- CRTC interrupt, IO_ACK
-- WAIT_n
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- https://sourceforge.net/p/jemu/code/HEAD/tree/JEMU/src/jemu/system/cpc/GateArray.java

-- Being clear about address/data :
-- 12/13 : offset update, upper to 9 isn't used
-- 0 1 2 3 do run setEvents => strange it seems about HORIZONTALS
-- 7 seem making effects if its value is 0 but it seems a source code erratum
-- 3 does call setReg3(value) which rules under hsyncWidth and vsyncWidth
-- 6 does call setReg6() with some border effect on a demo
-- 8 does call setReg8(value) interlace

-- ink 0,2,20
-- speed ink 1,1
entity simple_GateArrayInterrupt is
	Generic (LATENCE_MEM_WR:integer:=1;
	NB_HSYNC_BY_INTERRUPT:integer:=52; --52; -- 52 sure it's 52
	NB_LINEH_BY_VSYNC:integer:=24+1; --4--5-- VSYNC normally 4 HSYNC
	-- feel nice policy : interrupt at end of HSYNC
	--I have HDISP (external port of original Amstrad 6128) so I can determinate true timing and making a fix time generator
	-- 39*8=312   /40=7.8 /52=6 /32=9.75
  VRAM_HDsp:integer:=800/16; -- words of 16bits, that contains more or less pixels... thinking as reference mode 2, some 800x600 mode 2 (mode 2 is one bit <=> one pixel, that's cool)
  VRAM_VDsp:integer:=600/2;
  VRAM_Hoffset:integer:=63-46-5; -- 63*16-46*16
  VRAM_Voffset:integer:=38*8-30*8-4*8+4  +0; -- no influence under layer PRAM (raster palette colours ink), because PRAM is time dependant. Here influence is just about image position on screen
  BUG_Voffset:integer:=0 -- a CRTC original bug ?
	);
    Port ( nCLK4_1 : in  STD_LOGIC;
           IO_REQ_W : in  STD_LOGIC;
			  IO_REQ_R : in  STD_LOGIC;
           A15_A14_A9_A8 : in  STD_LOGIC_VECTOR (3 downto 0);
			  MODE_select:in STD_LOGIC_VECTOR (1 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
			  Dout : inout  STD_LOGIC_VECTOR (7 downto 0):=(others=>'Z');
			  crtc_VSYNC : out STD_LOGIC:='0';
			  IO_ACK : in STD_LOGIC;
			  crtc_A: out STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
			  bvram_A:out STD_LOGIC_VECTOR (14 downto 0):=(others=>'0');
			  bvram_W:out STD_LOGIC:='0'; 
			  bvram_D:out std_logic_vector(7 downto 0):=(others=>'0'); -- pixel_DATA
			  crtc_R:out STD_LOGIC:='0'; --ram_A external solve CRTC read scan
           int : out  STD_LOGIC:='0'; -- JavaCPC reset init
			  M1_n : in  STD_LOGIC;
			  MEM_WR:in std_logic;
			  WAIT_MEM_n : out  STD_LOGIC:='1';
           WAIT_n : out  STD_LOGIC:='1';
			  
			  crtc_D : in  STD_LOGIC_VECTOR (7 downto 0);
			  palette_A: out STD_LOGIC_VECTOR (13 downto 0):=(others=>'0');
			  palette_D: out std_logic_vector(7 downto 0);
			  palette_W: out std_logic;
			  reset:in  STD_LOGIC;
			  pixel_vsync:out std_logic;
			  pixel_hsync:out std_logic
			  );
end simple_GateArrayInterrupt;

architecture Behavioral of simple_GateArrayInterrupt is
	-- init values are for test bench datasheet !
--	signal RHtot:std_logic_vector(7 downto 0):="00010000";
--	signal RHdisp:std_logic_vector(7 downto 0):="00000111";
--	signal RHsyncpos:std_logic_vector(7 downto 0):="00001001";
--	signal RHwidth:std_logic_vector(3 downto 0):="0100";
--	signal RVwidth:std_logic_vector(4 downto 0):="00011";
--	signal RVtot:std_logic_vector(6 downto 0):="0011000";
--	signal RVtotAdjust:std_logic_vector(4 downto 0):="00010";
--	signal RVdisp:std_logic_vector(6 downto 0):="0001111";
--	signal RVsyncpos:std_logic_vector(6 downto 0):="0010011";
--	signal RRmax:std_logic_vector(4 downto 0):="00011";
	
	-- init values are for test bench javacpc !
	signal RHtot:std_logic_vector(7 downto 0):="00111111";
	signal RHdisp:std_logic_vector(7 downto 0):="00101000";
	signal RHsyncpos:std_logic_vector(7 downto 0):="00101110";
	signal RHwidth:std_logic_vector(3 downto 0):="1101";-- minus 1 "1110";
	signal RVwidth:std_logic_vector(4 downto 0):="00100";-- shift 5 "01000";
	signal RVtot:std_logic_vector(6 downto 0):="0100110";
	signal RVtotAdjust:std_logic_vector(4 downto 0):="00000";
	signal RVdisp:std_logic_vector(6 downto 0):="0011001";
	signal RVsyncpos:std_logic_vector(6 downto 0):="0011110";
	signal RRmax:std_logic_vector(4 downto 0):="00111";

	constant DO_NOTHING : STD_LOGIC:='0';
	constant DO_HSYNC : STD_LOGIC:='1';
	constant DO_VSYNC : STD_LOGIC:='1';
	
	signal OFFSET:STD_LOGIC_VECTOR(13 downto 0):="110000" & "00000000";--(others=>'0');

	signal vsync:std_logic;
	signal hsync:std_logic;
	
	signal CLK4MHz : STD_LOGIC;

	signal crtc_DISP : STD_LOGIC;--alternate 2MHz phase scaled   ===//

	type pen_type is array(15 downto 0) of integer range 0 to 31;
	signal pen:pen_type:=(4,12,21,28,24,29,12,5,13,22,6,23,30,0,31,14);
	signal border:integer range 0 to 31;
	
	-- wtf solver
	signal palette_A_tictac: STD_LOGIC_VECTOR (13 downto 0):=(others=>'0');
	signal palette_D_tictac: std_logic_vector(7 downto 0);
	signal palette_W_tictac: std_logic;
begin

pixel_vsync<=vsync;
pixel_hsync<=hsync;
-- do scan mirror VRAM (underground way (no way)) via CRTC, and then send data to VRAM buffer
--
-- Z80=>RAM         (read/write at 4MHz)
--    =>mirror_VRAM (mirror : just write at 4MHz)
--
--mirror_VRAM<=CRTC (anarchy_clock read at 4MHz)
--
--CRTC=>VRAM_BUFFER+PRAM (pixels written at 50Hz)
--
--VRAM_BUFFER+PRAM=>VGA (read at 60Hz (that's another anarchy_clock))
--
-- anarchy_clock : see FPGAmstrad on CPCWiki about "magic clock" (a special FPGA RAM using two different clock entries at the same time)
-- mirror_VRAM = bvram_A
-- VRAM_BUFFER = crtc_A

--crtc_CLK<=CLK4_1; --VALIDATED
--bvram_CLK<=not(CLK4_1); --VALIDATED
--palette_CLK<=not(CLK4_1); --VALIDATED

	-- synchronize palette_CLK_tictac with bvram_CLK to provocate clock solver aZRaEL_vram2vgaAmstradMiaow (do win a half of clock time)
	stabilizatorVRAMvsPALETTE:process(nCLK4_1,reset) is
		variable palette_A_mem:std_logic_vector(palette_A'range):=(others=>'0');
		variable palette_D_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable palette_W_mem:std_logic:='0';
	begin
		if reset='1' then
			palette_A<=(others=>'0');
			palette_D<=(others=>'0');
			palette_W<='0';
		elsif falling_edge(nCLK4_1) then
			palette_A_mem:=palette_A_tictac;
			palette_A<=palette_A_mem;
			palette_D_mem:=palette_D_tictac;
			palette_D<=palette_D_mem;
			palette_W_mem:=palette_W_tictac;
			palette_W<=palette_W_mem;
		end if;
	end process;

	bvramWriter:process(nCLK4_1,reset) is -- transmit
		variable D2:STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
		variable W2:STD_LOGIC :='0';
	begin
		--problem with D2 and reset !
		if reset='1' then
			crtc_R<='0';
			bvram_D<=(others=>'0'); -- do not loose tempo about D2
			bvram_W<='0';
		else
			-- address is solved
			if falling_edge(nCLK4_1) then
				crtc_R<='1'; -- directly solve external ram_A for CRTC read
				if crtc_DISP='1' then
					D2:=crtc_D; --bug bug
					W2:='1';
				else
					D2:=x"00";
					W2:='0';
				end if;
				bvram_D<=D2; -- tempo D2 !!!
				bvram_W<=W2;
			end if;
		end if;
		
	end process;

ctrcConfig_process:process(nCLK4_1) is
	variable reg_select : integer range 0 to 17;
	type registres_type is array(0 to 17) of std_logic_vector(7 downto 0);
	variable registres:registres_type;
		
	constant A9_WRITE:std_logic:='0';
	
	variable ink:STD_LOGIC_VECTOR(3 downto 0);
	variable border_ink:STD_LOGIC;
	variable ink_color:STD_LOGIC_VECTOR(4 downto 0);
	
	variable pen_mem:pen_type:=(4,12,21,28,24,29,12,5,13,22,6,23,30,0,31,14);
	variable border_mem:integer range 0 to 31;
begin
	if rising_edge(nCLK4_1) then
		if IO_REQ_W='1' and A15_A14_A9_A8(3) = '0' and A15_A14_A9_A8(2) = '1' then
			if D(7) ='0' then
				-- ink -- osef
				if D(6)='0' then
					border_ink:=D(4);
					ink:=D(3 downto 0);
				else
					ink_color:=D(4 downto 0);
					if border_ink='0' then
						pen_mem(conv_integer(ink)):=conv_integer(ink_color);
						pen<=pen_mem;
					else
						border_mem:=conv_integer(ink_color);
						border<=border_mem;
					end if;
				end if;
			end if;
		end if;
	
		if (IO_REQ_W or IO_REQ_R)='1' and A15_A14_A9_A8(2)='0' then
			if A15_A14_A9_A8(1)=A9_WRITE then
				Dout<=(others=>'Z');
				if A15_A14_A9_A8(0)='0' then
					reg_select:=conv_integer(D and x"1F");
				else
					registres(reg_select):=D;
					
					case reg_select is
						when 0=>
								RHtot<=registres(0);
						when 1=>
							RHdisp<=registres(1);
						when 2=>
							RHsyncpos<=registres(2);
						when 3=>
	-- following DataSheet and Arnold emulator (Arnold says it exists a conversion table HSYNC crtc.c.GA_HSyncWidth)
							RHwidth<=registres(3)(3 downto 0); -- DataSheet
							--RVwidth<=conv_std_logic_vector(NB_LINEH_BY_VSYNC,5);-- (24+1) using Arnold formula ctrct.c.MONITOR_VSYNC_COUNT "01111"; -- Arkanoid does use width VSYNC while hurting a monster or firing with bonus gun
							RVwidth<='0' & registres(3)(7 downto 4); -- JavaCPC 2015
						when 4=>
							RVtot<=registres(4)(RVtot'range);
						when 5=>
							RVtotAdjust<=registres(5)(RVtotAdjust'range);
						when 6=>
							RVdisp<=registres(6)(RVdisp'range);
						when 7=>
							RVsyncpos<=registres(7)(RVsyncpos'range);
						when 8=>NULL;
							-- interlace & skew
						when 9=> -- max raster adress
							RRmax<=registres(9)(RRmax'range);
						when 10=>NULL;
							-- cursor start raster 
						when 11=>NULL;
							-- cursor end raster
						when 12=> --NULL;
							-- start adress H
							OFFSET<=registres(12)(5 downto 0) & registres(13);
						when 13=> --NULL;
							-- start adress L
							OFFSET<=registres(12)(5 downto 0) & registres(13);
						when 14=>NULL;
							-- cursor H
						when 15=>NULL;
							-- cursor L
						when 16=>NULL;
							--light pen H
						when 17=>NULL;
							--light pen L
					end case;
				end if;
			else
				-- A9_READ
				Dout<=(others=>'1');
			end if;
		elsif IO_ACK='1' then
			-- IO_ACK DATA_BUS
			Dout<=(others=>'0'); -- value to check... cpcwiki seem down at the moment I write this sentence :P
		else
			Dout<=(others=>'Z');
		end if;
	end if;
end process ctrcConfig_process;

	-- DANGEROUS WARNING : CRTC PART WAS TESTED AND VALIDATED USING TESTBENCH
simple_GateArray_process : process(nCLK4_1) is
 
 variable compteur1MHz : integer range 0 to 3:=0;
	variable disp:std_logic:='0';
	variable dispH:std_logic:='0'; -- horizontal disp (easier to compute BORDER area)
	-- following Quazar legends, 300 times per second
	-- Following a lost trace in Google about www.cepece.info/amstrad/docs/garray.html I have
	-- "In the CPC the Gate Array generates maskable interrupts, to do this it uses the HSYNC and VSYNC signals from CRTC, a 6-bit internal counter and monitors..."
-- perhaps useful also : http://www.cpcwiki.eu/index.php/Synchronising_with_the_CRTC_and_display 
		-- following http://cpcrulez.fr/coding_amslive04-z80.htm
		variable horizontal_counter : integer range 0 to 256-1:=0; --640/16
		variable vertical_counter : integer range 0 to 128*8-1:=0; --600
		variable vertical_counter_line : integer range 0 to 128-1:=0;
		variable etat_rgb : STD_LOGIC:=DO_NOTHING;
		variable etat_hsync : STD_LOGIC:=DO_NOTHING;
		variable etat_vsync : STD_LOGIC:=DO_NOTHING;
		variable last_etat_hsync : STD_LOGIC:=DO_NOTHING;
		variable last_etat_vsync : STD_LOGIC:=DO_NOTHING;
		variable ligne_carac_v:integer range 0 to 32-1:=0; -- buggy boy has value RRmax=5
		variable MA:STD_LOGIC_VECTOR(13 downto 0):=(others=>'0');
		variable RA:STD_LOGIC_VECTOR(4 downto 0):=(others=>'0');
		variable ADRESSE_CONSTANT_mem:integer range 0 to 16*1024-1;
		variable ADRESSE_INC_mem:integer range 0 to 16*1024-1;
		variable ADRESSE_VAR_mem:integer range 0 to 16*1024-1;
		variable crtc_A_mem:std_logic_vector(14 downto 0):=(others=>'0'); -- 16bit memory
		variable bvram_A_mem:std_logic_vector(14 downto 0):=(others=>'0'); -- 16bit memory
		variable MA_1514_begin:std_logic_vector(1 downto 0):=(others=>'0');

		variable crtc_VSYNC_counter:std_logic_vector(7 downto 0):=(others=>'0');

		variable was_M1_1:boolean:=false;
		variable waiting:boolean:=false;
		variable waiting_MEMWR:integer range 0 to LATENCE_MEM_WR:=LATENCE_MEM_WR;
		variable was_MEMWR_0:boolean:=false;
		
		--(128*1024)/64 2*1024=2^11
		variable zap_scan:boolean:=true; -- if in last round, has no blank signal, do not scan memory !

		variable vram_vertical_offset_counter:integer:=0;
		variable vram_vertical_counter:integer:=0;
		variable vram_horizontal_offset_counter:integer:=0;
		variable vram_horizontal_counter:integer:=0;
		
		variable palette_A_tictac_mem:std_logic_vector(13 downto 0):=(others=>'0');
		variable palette_D_tictac_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable last_dispH:std_logic:='0';
		variable palette_horizontal_counter:integer range 0 to 256-1:=0; --640/16
		variable palette_color:integer range 0 to 16-1;
		
		variable in_800x600:boolean:=false;
		variable last_CENTER:boolean:=false; -- not in left BORDER, in right BORDER if disp=0, in CENTER if disp=1
		
	begin
	--it's Z80 time !
		if rising_edge(nCLK4_1) then
		
		compteur1MHz:=(compteur1MHz+1) mod 4;
		
crtc_DISP<='0';
palette_W_tictac<='0';

-- Crazy Car II doesn't like little_reset
			-- Asphalt IACK without test in int_mem
			-- counter never upper than  52
			-- z80 mode 1 : the byte need no be sent, as the z80 restarts at logical address x38 regardless(z80 datasheet)
			case compteur1MHz is
			when 0=>
				if horizontal_counter>=RHsyncpos and horizontal_counter<RHsyncpos+RHwidth then
					etat_hsync:=DO_HSYNC;
hsync<='1'; -- following javacpc,grimware and arnold
				else
					etat_hsync:=DO_NOTHING;
hsync<='0';
				end if;

				--http://www.phenixinformatique.com/modules/newbb/viewtopic.php?topic_id=4316&forum=9
				--In original CRTC DataSheet, it doesn't have any test about VSync period, and also, bits 4 to 7 of R3 are not taken into account. Some factories shall have reused this free bits to put on it its own features, feel more about somes linked to VSync (like interlaced R8, adding difference between a certain model of CRTC and another).
				--PPI read CRTC.isVSYnc bool
				
				if vertical_counter+BUG_Voffset>=RVsyncpos*(RRmax+1) and vertical_counter+BUG_Voffset<RVsyncpos*(RRmax+1)+RVwidth then
					etat_vsync:=DO_VSYNC;
crtc_VSYNC<='1'; -- it is really '1' by here, because we need an interrupt while vsync=1 or else border is to too faster (border 1,2)
vsync<='1'; -- do start a counter permitting 2 hsync failing before interrupt
				else -- following Grim (forum)
					etat_vsync:=DO_NOTHING;
crtc_VSYNC<='0';
vsync<='0'; -- useless, except to addition several vsync layering them each others
				end if;

				if not(zap_scan) and horizontal_counter<RHdisp then -- and vertical_counter<RVDisp*(RRmax+1) then
					dispH:='1';
				else
					dispH:='0';
				end if;
				if not(zap_scan) and horizontal_counter<RHdisp and vertical_counter<RVDisp*(RRmax+1) then
					disp:='1';
					-- http://quasar.cpcscene.com/doku.php?id=assem:crtc
					-- Have to respect address cut ADRESSE_CONSTANT_mem:=conv_integer(OFFSET(13 downto 0)) mod (16*1024);
					ADRESSE_INC_mem:=(vertical_counter_line*conv_integer(RHdisp)) mod (16*1024);
					ADRESSE_VAR_mem:=(horizontal_counter) mod (16*1024);
					MA:=conv_std_logic_vector(ADRESSE_CONSTANT_mem+ADRESSE_INC_mem+ADRESSE_VAR_mem,14);
					RA:=conv_std_logic_vector(ligne_carac_v,5);
					crtc_A_mem(14 downto 0):=MA(13 downto 12) & RA(2 downto 0) & MA(9 downto 0);
					--http://cpcrulez.fr/coding_amslive02-balayage_video.htm dit :
					--MA(13 downto 12) & RA(2 downto 0) & MA(9 downto 0) & CCLK
				else
					disp:='0';
					crtc_A_mem:=(others=>'0');
				end if;
				-- it's not really 16MHz, but we don't care
				crtc_A(15 downto 0)<=crtc_A_mem(14 downto 0) & '0';

-- VRAM_HDsp VRAM_VDsp
-- it's just the begin, do relax...
if etat_vsync=DO_VSYNC and last_etat_vsync=DO_NOTHING then
	vram_vertical_offset_counter:=0;
	vram_vertical_counter:=0;
end if;
if etat_hsync=DO_HSYNC and last_etat_hsync=DO_NOTHING then
	if vram_vertical_offset_counter<=VRAM_Voffset then
		vram_vertical_offset_counter:=vram_vertical_offset_counter+1;
	elsif vram_vertical_counter<VRAM_VDsp then
		vram_vertical_counter:=vram_vertical_counter+1;
	end if;
	vram_horizontal_offset_counter:=0;
	vram_horizontal_counter:=0;
	in_800x600:=false;
	last_CENTER:=false;
end if;

-- Here we're scanning 800x600 following VSYNC et HSYNC, so we can write some border...
if vram_horizontal_offset_counter>VRAM_Hoffset then
	if vram_horizontal_counter<VRAM_HDsp then
		if vram_vertical_offset_counter>VRAM_Voffset and vram_vertical_counter<VRAM_VDsp then
			in_800x600:=true;
			
			if vram_horizontal_counter=0 and vram_vertical_counter= 0 then
				palette_A_tictac_mem:=(others=>'0');
			end if;
			
			
			if dispH='0' and not(last_CENTER) then
				-- in BORDER LEFT
			elsif dispH='1' and disp='0' then
				-- full VERTICAL BORDER
				last_CENTER:=true;
				-- filling palette (PRAM)
				if last_dispH='0' then
					palette_horizontal_counter:=0;
				else
					palette_horizontal_counter:=palette_horizontal_counter+1;
				end if;
				if palette_horizontal_counter<1 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					palette_D_tictac_mem:="00" & conv_std_logic_vector(vram_horizontal_counter,6);
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				elsif palette_horizontal_counter<2 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					palette_D_tictac_mem:=conv_std_logic_vector(border,5) & "1" & MODE_select;
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				elsif palette_horizontal_counter<2+16 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					if palette_horizontal_counter = 2 then
						palette_color:=0;
					else
						palette_color:=palette_color+1;
					end if;
					palette_D_tictac_mem:=conv_std_logic_vector(pen(palette_color),8);
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				elsif palette_horizontal_counter<2+16+1 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					palette_D_tictac_mem:=conv_std_logic_vector(vram_horizontal_counter-(2+16),8);
					palette_D_tictac_mem:=palette_D_tictac_mem+RHdisp;
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				else
					palette_A_tictac<=(others=>'0');
					palette_D_tictac<=(others=>'0');
					palette_W_tictac<='0';
				end if;
			elsif dispH='1' and disp='1' then
				-- DISPLAY
				last_CENTER:=true;
				-- filling palette (PRAM)
				if last_dispH='0' then
					palette_horizontal_counter:=0;
				else
					palette_horizontal_counter:=palette_horizontal_counter+1;
				end if;
				if palette_horizontal_counter<1 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					palette_D_tictac_mem:=conv_std_logic_vector(vram_horizontal_counter,8);
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				elsif palette_horizontal_counter<2 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					palette_D_tictac_mem:=conv_std_logic_vector(border,5) & "0" & MODE_select;
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				elsif palette_horizontal_counter<2+16 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					if palette_horizontal_counter = 2 then
						palette_color:=0;
					else
						palette_color:=palette_color+1;
					end if;
					palette_D_tictac_mem:=conv_std_logic_vector(pen(palette_color),8);
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				elsif palette_horizontal_counter<2+16+1 then
					palette_A_tictac<=palette_A_tictac_mem(13 downto 0);
					palette_D_tictac_mem:=conv_std_logic_vector(vram_horizontal_counter-(2+16),8);
					palette_D_tictac_mem:=palette_D_tictac_mem+RHdisp;
					palette_D_tictac<=palette_D_tictac_mem;
					palette_W_tictac<='1';
					palette_A_tictac_mem:=palette_A_tictac_mem+1;
				else
					palette_A_tictac<=(others=>'0');
					palette_D_tictac<=(others=>'0');
					palette_W_tictac<='0';
				end if;
				
			elsif dispH='0' and last_CENTER then
				-- in BORDER RIGHT
				last_CENTER:=false;
			end if;
			
			bvram_A_mem:=conv_std_logic_vector(vram_vertical_counter*VRAM_HDsp+vram_horizontal_counter,bvram_A_mem'length);
		end if;
		vram_horizontal_counter:=vram_horizontal_counter+1;
	end if;
else
	vram_horizontal_offset_counter:=vram_horizontal_offset_counter+1;
end if;

last_dispH:=dispH;
last_etat_vsync:=etat_vsync;
last_etat_hsync:=etat_hsync;

				-- The CRTC component is separated from Gatearray component, so does we have some late ?
				-- Not certain, as this old component was really old ones : using state and no rising_egde...
				if horizontal_counter=RHtot then -- tot-1 ok
					horizontal_counter:=0;
					if vertical_counter=(RVtot)*(RRmax+1)+RRmax + RVtotAdjust then
						vertical_counter:=0;
						vertical_counter_line:=0;
						ligne_carac_v:=0;
						zap_scan:=false;
						ADRESSE_CONSTANT_mem:=conv_integer(OFFSET(13 downto 0)) mod (16*1024);
					else
						vertical_counter:=vertical_counter+1;
						
						
						if ligne_carac_v=RRmax then
							ligne_carac_v:=0;
							vertical_counter_line:=vertical_counter_line+1;
						else
							ligne_carac_v:=ligne_carac_v+1;
						end if;
					end if;
				else
					horizontal_counter:=horizontal_counter+1;
				end if;
			when 1=>
				bvram_A(14 downto 0)<=bvram_A_mem(13 downto 0) & '0';
			when 2=>
				crtc_A(15 downto 0)<=crtc_A_mem(14 downto 0) & '1';
			when 3=>
				bvram_A(14 downto 0)<=bvram_A_mem(13 downto 0) & '1';
			end case;
			
			crtc_DISP<=disp;
			
			if was_MEMWR_0 and MEM_WR='1' then
				waiting_MEMWR:=0;
			end if;
			
			if waiting_MEMWR<LATENCE_MEM_WR then
				waiting_MEMWR:=waiting_MEMWR+1;
				WAIT_MEM_n<='0';
			else
				WAIT_MEM_n<='1';
				if waiting then
					WAIT_n<='0';
				else
					WAIT_n<='1';
				end if;

				--z80_synchronise	
				if M1_n='0' and was_M1_1 and compteur1MHz=0 then
					-- M---M---M---
					-- 012301230123
					-- cool
					waiting:=false;
					WAIT_n<='1';
				elsif waiting and compteur1MHz=0 then
					waiting:=false;
					WAIT_n<='1';
				elsif waiting then
					-- quand on pose un wait, cet idiot il garde M1_n=0 le tour suivant
				elsif M1_n='0' and was_M1_1 then
					-- M--M---M---
					-- 012301230123
					-- M--MW---M---
					-- 012301230123
					
					-- M-M---M---
					-- 012301230123
					-- M-MWW---M---
					-- 012301230123
				
					-- M----M---M---
					-- 0123012301230123
					-- M----MWWW---M---
					-- 0123012301230123
				
					-- pas cool
					WAIT_n<='0';
					waiting:=true;
				elsif compteur1MHz=0 and not(waiting) then
					-- Some instructions has more than 4 Tstate -- validated
				end if;
			end if;
			if M1_n='1' then
				was_M1_1:=true;
			else
				was_M1_1:=false;
			end if;
			if MEM_WR='0' then
				was_MEMWR_0:=true;
			else
				was_MEMWR_0:=false;
			end if;

			
		end if;
	end process simple_GateArray_process;

--http://www.cpcwiki.eu/index.php/Synchronising_with_the_CRTC_and_display
--	di                      ;; disable maskable interrupts
--	im 1                    ;; interrupt mode 0 (jump to interrupt handler at &0038)
--
--	ld hl,&c9fb             ;; poke EI,RET to interrupt handler.
--	ld (&0038),hl
--	ei                      ;; enable interrupts
--
--	;; first synchronise with the vsync
--	ld b,&f5
--	.vsync_sync
--	in a,(c)
--	rra
--	jr nc,vsync_sync
--
--	;; wait 3 interrupts so we are close to the position
--	;; we want
--	halt
--	halt
--	halt
--	;; at this point we are synchronised to the monitor draw cycle
--
--	;; now waste some time until we are at the exact point
--	ld b,32
--	.waste_time
--	djnz waste_time
--
--	;; we are now synchronised to exactly the point we want
--	.
--	.
--	.



--Interrupt Generation Facility of the Amstrad Gate Array
--The GA has a counter that increments on every falling edge of the CRTC generated HSYNC signal. Once this counter reaches 52, the GA raises the INT signal and resets the counter to 0.
--A VSYNC triggers a delay action of 2 HSYNCs in the GA, at the completion of which the scan line count in the GA is compared to 32. If the counter is below 32, the interrupt generation is suppressed. If it is greater than or equal to 32, an interrupt is issued. Regardless of whether or not an interrupt is raised, the scan line counter is reset to 0.
--The GA has a software controlled interrupt delay feature. The GA scan line counter will be cleared immediately upon enabling this option (bit 4 of ROM/mode control). It only applies once and has to be reissued if more than one interrupt needs to be delayed.
--Once the Z80 acknowledges the interrupt, the GA clears bit 5 of the scan line counter. 
GAinterrupt : process(nCLK4_1,vsync,hsync)
	variable compteur52 : std_logic_vector(5 downto 0):=(others=>'0'); -- a 6-bit counter, reset state is 0
	variable hsync_was_1:boolean:=false;
	variable vsync_was_0:boolean:=false;
	variable zap_next:boolean:=false;
	variable zap_next_next:boolean:=false;
	variable next_sync:boolean:=false;
	variable old_delay_feature:std_logic:='0';
	--variable compteur52_slower : std_logic_vector (1 downto 0):=(others=>'0');
begin
	
--http://cpctech.cpc-live.com/docs/ints2.html
--	Furthur details of interrupt timing
--
--Here is some information I got from Richard about the interrupt timing:
--"Just when I finally thought I had the interrupt timing sorted out (from real tests on a 6128 and 6128+), I decided to look at the Arnold V diagnostic cartridge in WinAPE, and the Interrupt Timing test failed.
--After pulling my hair out for a few hours, I checked out some info I found on the Z80 which states something like:
--The Z80 forces 2 wait-cycles (2 T-States) at the start of an interrupt.
--The code I had forced a 1us wait state for an interrupt acknowledge. For the most part this is correct, but it's not necessarily so. Seems the instruction currently being executed when an interrupt occurs can cause the extra CPC forced wait-state to be removed.
--Those instructions are:
--
--INC ss (ss = HL, BC, DE or SP)
--INC IX
--INC IY
--DEC ss
--DEC IX
--DEC IY
--RET cc  (condition not met)
--EX (SP),HL
--EX (SP),IX
--EX (SP),IY
--LD SP,HL
--LD SP,IX
--LD SP,IY
--LD A,I
--LD I,A
--LD A,R
--LD R,A
--LDI      (and both states of LDIR)
--LDD     (and both states of LDDR)
--CPIR    (when looping)
--CPDR   (when looping)
--
--This seems to be related to a combination of the T-States of the instruction, the M-Cycles, and the wait states imposed by the CPC hardware to force each instruction to the 1us boundary.
--Richard" 
	
	
--	Interrupt Generation Facility of the Amstrad Gate Array
--The GA has a counter that increments on every falling edge of the CRTC generated HSYNC signal.
--Once this counter reaches 52, the GA raises the INT signal and resets the counter to 0.
--A VSYNC triggers a delay action of 2 HSYNCs in the GA, at the completion of which the scan line
--count in the GA is compared to 32. If the counter is below 32, the interrupt generation is
--suppressed. If it is greater than or equal to 32, an interrupt is issued. Regardless of whether
--or not an interrupt is raised, the scan line counter is reset to 0.
--The GA has a software controlled interrupt delay feature. The GA scan line counter will be
--cleared immediately upon enabling this option (bit 4 of ROM/mode control). It only applies once
--and has to be reissued if more than one interrupt needs to be delayed.
--Once the Z80 acknowledges the interrupt, the GA clears bit 5 of the scan line counter.

--I think that "suppressed" is falling_edge the INTERRUPT signal (to 0), and I think that "raises" is rising_edge the INTERRUPT signal (to 1)
--At IO_ACK signal certainly we shut down the INTERRUPT signal (to 0)
--INTERRUPT
	
--Following my refactoring of Space Invaders during my MameVHDL project, in fact an IO_ACK do event when an interrupt finally want to start, and during IO_ACK, the DATA_BUS is read (warning several instruction, several consequences...)
	if rising_edge(nCLK4_1) then
		if IO_ACK='1' then
			--the Gate Array will reset bit5 of the counter
			--Once the Z80 acknowledges the interrupt, the GA clears bit 5 of the scan line counter.
			-- When the interrupt is acknowledged, this is sensed by the Gate-Array. The top bit (bit 5), of the counter is set to "0" and the interrupt request is cleared. This prevents the next interrupt from occuring closer than 32 HSYNCs time. http://cpctech.cpc-live.com/docs/ints.html
			compteur52(5):= '0'; -- following Grimware legends : When the CPU acknowledge the interrupt (eg. it is going to jump to the interrupt vector), the Gate Array will reset bit5 of the counter, so the next interrupt can't occur closer than 32 HSync.
			--compteur52(5 downto 1):= (others=>'0'); -- following JavaCPC 2015
			-- the interrupt request remains active until the Z80 acknowledges it. http://cpctech.cpc-live.com/docs/ints.html
			int<='0'; -- following JavaCPC 2015
		end if;
		
		if IO_REQ_W='1' and A15_A14_A9_A8(3) = '0' and A15_A14_A9_A8(2) = '1' then
			if D(7) ='0' then
				-- ink -- osef
			else
				if D(6) = '0' then
					-- It only applies once
					if D(4) = '1' then
						compteur52:=(others=>'0');
						--Grimware : if set (1), this will (only) reset the interrupt counter. --int<='0'; -- JavaCPC 2015
						--the interrupt request is cleared and the 6-bit counter is reset to "0".  -- http://cpctech.cpc-live.com/docs/ints.html
						int<='0';
					end if;
					-- JavaCPC 2015 : always old_delay_feature:=D(4); -- It only applies once ????
				else 
					-- rambank -- osef pour 464
				end if;
			end if;
		end if;
		
		if vsync_was_0 and vsync=DO_VSYNC then
			--A VSYNC triggers a delay action of 2 HSYNCs in the GA
			--In both cases the following interrupt requests are synchronised with the VSYNC. 
			zap_next:=true;
			zap_next_next:=false;
		end if;
		--The GA has a counter that increments on every falling edge of the CRTC generated HSYNC signal.
		if hsync=not(DO_HSYNC) and hsync_was_1 then
		-- It triggers 6 interrupts per frame http://pushnpop.net/topic-452-1.html
		
		
		
		
		--if conv_integer(compteur52_slower)>0 then
			compteur52:=compteur52+1;
		--	compteur52_slower:=(others=>'0');
		--else
		--	compteur52_slower:=compteur52_slower+1;
		--end if;
		
		
			

			if zap_next then
				zap_next:=false;
				zap_next_next:=true;
			elsif zap_next_next then
				zap_next_next:=false;
				--at the completion of which the scan line
				--count in the GA is compared to 32. 
				if conv_integer(compteur52)<32 then
					--If the counter is below 32, the interrupt generation is suppressed.
					int<='0';
				else
					--If it is greater than or equal to 32, an interrupt is issued.
					int<='1';
				end if;
				--Regardless of whether or not an interrupt is raised, the scan line counter is reset to 0.
				compteur52:=(others=>'0');
			elsif conv_integer(compteur52)=NB_HSYNC_BY_INTERRUPT then -- Asphalt ? -- 52="110100"
				--Once this counter reaches 52, the GA raises the INT signal and resets the counter to 0.
				compteur52:=(others=>'0');
				int<='1';
			end if;
		end if;
		if hsync=DO_HSYNC then
			hsync_was_1:=true;
		else
			hsync_was_1:=false;
		end if;
		if vsync=not(DO_VSYNC) then
			vsync_was_0:=true;
		else
			vsync_was_0:=false;
		end if;

	end if;
end process;
end Behavioral;
