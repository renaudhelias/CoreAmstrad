-- C-One reconfigurable computer
-- http://c64upgra.de/c-one/
-- Subdesign C-One 
--
-- Copyright (c) 2004-2005 Tobias Gubener
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scandoubler2 is
port
	(
	video_in	: in std_logic_vector(15 downto 0);
	hsync_in	: in std_logic;
	vsync_in	: in std_logic;
	pixclk		: in std_logic;
	bypass		: in std_logic:='1';
	video_out	: out std_logic_vector(15 downto 0);
	vsync_out	: out std_logic;
	hsync_out	: out std_logic
	);
end;

architecture rtl of scandoubler2 is


signal 	wraddress	: STD_LOGIC_VECTOR (10 DOWNTO 0);
signal	rdaddress	: STD_LOGIC_VECTOR (9 DOWNTO 0);
signal	jpaddress	: STD_LOGIC_VECTOR (9 DOWNTO 0);

signal wrclk		: std_logic;
signal q			: std_logic_vector (17 downto 0);
signal hsyncd		: std_logic;
signal hsyncod		: std_logic;
signal vsyncd		: std_logic_vector (2 downto 0);

component lineram
	PORT
	(
		data		: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
		wraddress	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		rdaddress	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wren		: IN STD_LOGIC  := '1';
		wrclock		: IN STD_LOGIC ;
		rdclock		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (17 DOWNTO 0)
	);
end component;

begin

lineram_inst : lineram PORT MAP (
		data	 	=> (vsync_in & hsync_in & video_in),
		wren	 	=> '1',--wrclk,
		wraddress	=> wraddress (10 downto 1),
		rdaddress	=> rdaddress,
		wrclock		=> pixclk,
		rdclock		=> pixclk,
		q	 		=> q
	);
	
	vsync_out <= vsyncd(0) and not vsyncd(2) when bypass='0' else vsync_in;  --für VGA nur 2 Zeilen vsync
	hsync_out <= q(16) when bypass='0' else hsync_in;
	video_out <= q(15 downto 0) when bypass='0' else video_in;
	
	process (pixclk) begin
			if (pixclk'event and pixclk='0') then
				hsyncd <= hsync_in;
				hsyncod <= q(16);
				wraddress <= wraddress+1;
				if q(16)='1' and hsyncod='0' then
					vsyncd <= vsyncd(1 downto 0) & q(17);
				end if;
				if hsync_in='0' and hsyncd='1' then
					rdaddress <= jpaddress;
					jpaddress <= wraddress(10 downto 1) ;
				else
					rdaddress <= rdaddress+1;
				end if;
			end if;
	end process;
end;
