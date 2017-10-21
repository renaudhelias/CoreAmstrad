--    {@{@{@{@{@{@
--  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r005
--  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
--  {@{@{@{@{@{@{@{@
--  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
--  {@{@        {@{@   Contact : renaudhelias@gmail.com
--  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
--    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
--
--
--------------------------------------------------------------------------------
-- This is part of CPC T-REX project, it is a cool simple implementation.
-- Tested and validated against a Mock of NES signal output.
-- Not tested in a normal 4/3 VGA screen... (I've got a boring 5/4 one :/)
-- 
-- Nintendo (NES) PAL is :
-- Modeline "256x240 PAL (50Hz)" 5.320 256 269 294 341 240 270 273 312 -hsync -vsync
-- 5.320MHz * 3 = 15,96MHz =16MHz
-- 256 * 3 = 768 pixels
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                                                                          --
-- Copyright (c) 2004-2009 Tobias Gubener                                   -- 
-- Subdesign CPC T-REX by TobiFlex                                          --
--                                                                          --
-- This source file is free software: you can redistribute it and/or modify --
-- it under the terms of the GNU General Public License as published        --
-- by the Free Software Foundation, either version 3 of the License, or     --
-- (at your option) any later version.                                      --
--                                                                          --
-- This source file is distributed in the hope that it will be useful,      --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of           --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            --
-- GNU General Public License for more details.                             --
--                                                                          --
-- You should have received a copy of the GNU General Public License        --
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.    --
--                                                                          --
------------------------------------------------------------------------------
------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scandoubler is
Generic(
	HSYNC_WIDTH:integer:=256-1; 
	VSYNC_WIDTH:integer:=4; --4 original, parfois 3 ou 6 (6=>21cm de haut 9cm de relache)
	HSYNC_OFFSET_POS:integer:=2-1;--300 (à droite et à gauche) --600 (à droite); --0 (à gauche?); -- HSYNC<=>DATA
	HSYNC_OFFSET_NEG:integer:=2-1 -- VSYNC<=>HSYNC
);
port
	(
	video_in	: in std_logic_vector(5 downto 0);
	hsync_in	: in std_logic;
	vsync_in	: in std_logic;
	dblclk		: in std_logic; -- 32MHz
	pixclk		: in std_logic; -- 16MHz
	video_out	: out std_logic_vector(5 downto 0);
	vsync_out	: out std_logic;
	hsync_out	: out std_logic
	);
end;

architecture rtl of scandoubler is


signal 	wraddress	: STD_LOGIC_VECTOR (9 DOWNTO 0);
signal	rdaddress	: STD_LOGIC_VECTOR (9 DOWNTO 0);
signal  divtwo		: std_logic;
signal	linelength	: STD_LOGIC_VECTOR (9 DOWNTO 0);

signal q			: std_logic_vector (7 downto 0);
signal hsyncd		: std_logic;
signal hsyncod		: std_logic;
-- 00001
-- 00011
-- 00111
-- 01111
--       4 tics VSE-VHE=4
signal vsyncd		: std_logic_vector (VSYNC_WIDTH downto 0);
signal hsync_d    : std_logic_vector (HSYNC_WIDTH downto 0);
signal hsync_buff_pos    : std_logic_vector (HSYNC_OFFSET_POS downto 0);
signal hsync_buff_neg    : std_logic_vector (HSYNC_OFFSET_NEG downto 0);


type linebuff_t is array(0 to 1023) of std_logic_vector(7 downto 0);
signal linebuff	  	: linebuff_t;
	
begin

--	vsync_out <= vsyncd(0) and not vsyncd(2) when bypass='0' else vsync_in;  --f�r VGA nur 2 Zeilen vsync
--	hsync_out <= q(16) when bypass='0' else hsync_in;
--	video_out <= q(15 downto 0) when bypass='0' else video_in;
	
	process (dblclk) --is
		--variable old_pixclk:std_logic:='0';
	begin
		if rising_edge(dblclk) then
		
			
			--Nintendo : modeline "768x240 PAL (50Hz)" 15.96 768 807 882 1023 240 270 273 312 -hsync -vsync
			
			--HSE-HSS=75 on NES Nintendo (16MHz)
			--HSE-HSS=96 on VGA (640x480@25.2MHz)
			--so normaly at 16MHz we have : 96*25/16=150, so 300 at 32MHz
			-- 640->300 so 768->360 ? 768->250 ?
			--but here : 208 by Amstrad 16MHz, 100 in final after doublescan.
			
				--vsync_out <= vsyncd(0) and not vsyncd(3); --flags +vsync
				vsync_out <= not(vsyncd(0) and not vsyncd(VSYNC_WIDTH)); --flags -vsync
				--vsync_out <= not(not(vsyncd(0)) and vsyncd(3));  --flags -vsync offset
				hsync_d <= hsync_d(HSYNC_WIDTH-1 downto 0) & q(6);
				--hsync_out <= not(hsync_d(0) and not hsync_d(HSYNC_WIDTH));  --flags -hvsync big offset
				--hsync_out <= q(6); --flags -hsync
				hsync_buff_neg <= hsync_buff_neg(HSYNC_OFFSET_NEG-1 downto 0) & not(not(hsync_d(0)) and hsync_d(HSYNC_WIDTH));
				hsync_buff_pos <= hsync_buff_pos(HSYNC_OFFSET_POS-1 downto 0) & hsync_buff_neg(HSYNC_OFFSET_NEG);
				hsync_out <= hsync_buff_pos(HSYNC_OFFSET_POS);
				--hsync_out <= not(q(6)); --flags +hsync
				video_out <= q(5 downto 0); 
			
			q <= linebuff(conv_integer(rdaddress));
			linebuff(conv_integer(wraddress)) <= (vsync_in & hsync_in & video_in);
			
			hsyncd <= hsync_in;
			hsyncod <= hsync_buff_neg(HSYNC_OFFSET_NEG);
			if hsync_buff_neg(HSYNC_OFFSET_NEG)='1' and hsyncod='0' then --rising_edge (end of -hsync)
				vsyncd <= vsyncd(VSYNC_WIDTH-1 downto 0) & q(7);
			end if;
			if (hsync_in='0' and hsyncd='1') OR linelength=0 then
				rdaddress <= (OTHERS=>'0');
			else
				rdaddress <= rdaddress+1;
			end if;	
			if hsync_in='0' and hsyncd='1' then
				wraddress <= (OTHERS=>'0');
				divtwo <= '0';
				-- div 2
				linelength <= wraddress + 1;
			else
				linelength <= linelength-1;
				divtwo <= not divtwo;
				IF divtwo='1' THEN
					wraddress <= wraddress+1;
				END IF;
			end if;
			--old_pixclk:=pixclk;
		end if;
	end process;
end;
