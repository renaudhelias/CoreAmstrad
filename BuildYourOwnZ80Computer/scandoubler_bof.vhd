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
-- This is part of CPC T-REX project, it is a cool simple implementation.
-- Nintendo (NES) PAL is :
-- Modeline "256x240 PAL (50Hz)" 5.320 256 269 294 341 240 270 273 312 -hsync -vsync
-- 5.320MHz * 3 = 15,96MHz =16MHz
-- 256 * 3 = 768 pixels
-- So you can not divide by 2 the Amstrad pixel digest.
-- So a better formula here is doing : linelength <= '0' & wraddress(9 downto 1);
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
	HSYNC_OFFSET:integer:=12
);
port
	(
	videoR_in	: in std_logic_vector(5 downto 0);
	videoG_in	: in std_logic_vector(5 downto 0);
	videoB_in	: in std_logic_vector(5 downto 0);
	hsync_in	: in std_logic;
	vsync_in	: in std_logic;
	pixclk		: in std_logic; -- 32MHz
	bypass		: in std_logic:='1';
	videoR_out	: out std_logic_vector(5 downto 0);
	videoG_out	: out std_logic_vector(5 downto 0);
	videoB_out	: out std_logic_vector(5 downto 0);
	hsync_out	: out std_logic;
	vsync_out	: out std_logic
	);
end;

architecture rtl of scandoubler is


signal 	wraddress	: STD_LOGIC_VECTOR (9 DOWNTO 0);
signal	rdaddress	: STD_LOGIC_VECTOR (9 DOWNTO 0);
signal  divtwo		: std_logic;
signal	linelength	: STD_LOGIC_VECTOR (9 DOWNTO 0);

signal q			: std_logic_vector (19 downto 0); --(7 downto 0); -- 1+1+X -1... 1+1+18 -1
signal hsyncd		: std_logic;
signal hsyncod		: std_logic;
signal vsyncd		: std_logic_vector (2 downto 0);
signal hsync_delay : std_logic_vector(HSYNC_OFFSET-1 downto 0);

type linebuff_t is array(0 to 1023) of std_logic_vector(19 downto 0); --7 downto 0);
signal linebuff	  	: linebuff_t;
	
begin

--	vsync_out <= vsyncd(0) and not vsyncd(2) when bypass='0' else vsync_in;  --f�r VGA nur 2 Zeilen vsync
--	hsync_out <= q(16) when bypass='0' else hsync_in;
--	video_out <= q(15 downto 0) when bypass='0' else video_in;
	
	process (pixclk) begin
		if (pixclk'event and pixclk='1') then
		
			IF bypass='0' THEN
				vsync_out <= vsyncd(0) and not vsyncd(2);
				--hsync_out <= not(q(6));
				hsync_delay <= hsync_delay(HSYNC_OFFSET-1-1 downto 0) & q(18);--6);
				hsync_out <= not(hsync_delay(HSYNC_OFFSET-1));
				videoR_out <= q(17 downto 12); 
				videoG_out <= q(11 downto 6); 
				videoB_out <= q(5 downto 0); 
			ELSE
				vsync_out <= vsync_in;
				hsync_out <= hsync_in;
				videoR_out <= videoR_in; 
				videoG_out <= videoG_in;
				videoB_out <= videoB_in;
			END IF;
			
			q <= linebuff(conv_integer(rdaddress));
			linebuff(conv_integer(wraddress)) <= (vsync_in & hsync_in & videoR_in & videoG_in & videoB_in);
			
			hsyncd <= hsync_in;
			hsyncod <= q(18);--6);
			--if q(6)='1' and hsyncod='0' then
			if q(18)='1' and hsyncod='0' then
				vsyncd <= vsyncd(1 downto 0) & q(19); --7);
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
				linelength <= wraddress;
			else
				linelength <= linelength-1;
				divtwo <= not divtwo;
				IF divtwo='1' THEN
					wraddress <= wraddress+1;
				END IF;
			end if;
		end if;
	end process;
end;
