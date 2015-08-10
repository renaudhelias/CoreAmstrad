-- PS/2 serial port, input only
--
-- Version : 0242
--
-- Copyright (c) 2002 Daniel Wallner (jesus@opencores.org)
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
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
--	http://www.fpgaarcade.com
--
-- Limitations :
--
-- File history :
--
--	0242 : First release
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ps2kbd_revised is
generic(
		CLKFREQ : natural := 4_000;--50_000; -- main clock freq (KHz)
		PSCLKFREQ : natural := 10 -- keyboard clock freq (KHz) 10-16.5kHz
	);
	port(
		Rst_n		: in std_logic;
		Clk_circuit : in std_logic;
		PS2_Clk		: in std_logic;
		PS2_Data	: in std_logic;
		Press		: out std_logic;
		Release		: out std_logic;
		ScanCode	: out std_logic_vector(7 downto 0)
		);
end ps2kbd_revised;

architecture rtl of ps2kbd_revised is
	signal	RX_scancode		: std_logic_vector(7 downto 0);
	signal DO_PRESS:std_logic;
constant TIMEOUT : natural := CLKFREQ/PSCLKFREQ; -- psClk quiet timeout
	signal cnt_r : natural range 0 to TIMEOUT; -- timeout counter
signal scRdy_r : std_logic; -- scan code is ready flag
	
begin



	process (PS2_Clk, Rst_n,scRdy_r)
		variable releasing:boolean:=false;
		variable RX_scancode_mem:std_logic_vector(7 downto 0);
		variable	RX_Bit_Cnt		: integer range 0 to 11;
		variable RX_ShiftReg	: std_logic_vector(7 downto 0);
		variable failed:boolean:=false; -- attendre une stabilisation au début
	begin
		RX_scancode<=RX_scancode_mem;	
		if Rst_n = '0' then
			RX_Bit_Cnt := 0;
			RX_ShiftReg := (others => '0');
			RX_scancode_mem:=(others=>'0');
			DO_PRESS<='0';
			failed:=false;
		elsif falling_edge(PS2_Clk) then
			if scRdy_r='1' or (failed and scRdy_r='1') then
				failed:=false;
				RX_Bit_Cnt:=0;
				if PS2_Data = '0' then -- Start bit
					RX_Bit_Cnt := RX_Bit_Cnt + 1;
				end if;
			elsif failed then
				--wait stabilisation
			else
				if RX_Bit_Cnt = 0 then
					if PS2_Data = '0' then -- Start bit
						RX_Bit_Cnt := RX_Bit_Cnt + 1;
					end if;
				elsif RX_Bit_Cnt = 9 then -- Parity bit
					RX_Bit_Cnt := RX_Bit_Cnt + 1;
					-- Ignoring parity
				elsif RX_Bit_Cnt = 10 then -- Stop bit
					if PS2_Data = '1' then
						-- les commandes
						if RX_ShiftReg = x"FA" or RX_ShiftReg = x"AA" or RX_ShiftReg = x"EE" or RX_ShiftReg = x"FE" or RX_ShiftReg = x"00" or RX_ShiftReg = x"FF" then
							--ignore
						elsif releasing and not(RX_ShiftReg = x"F0" or RX_ShiftReg = x"E0") then
							-- on est en train de relacher la touche RX_ShiftReg
							-- de toute façon c'est tout pourri le PS/2 on peut pas appuyer sur beaucoup de touche à la fois...
							releasing:=false;
							DO_PRESS<='0';
							RX_scancode_mem:=RX_ShiftReg;
						else
							if RX_ShiftReg = x"F0" then
								-- c'est un relachement
								-- il faut zapper le paquet suivant !
								releasing:=true;
							elsif RX_ShiftReg = x"E0" then
								-- on s'en fou le paquet suivant c'est F0
--								is_e0:=true;
							elsif RX_ShiftReg = x"E1" then
								-- on s'en fou le paquet suivant c'est F0
--								is_e1:=true;
							else
								-- c'est une touche
								RX_scancode_mem:=RX_ShiftReg;
								DO_PRESS<='1';
							end if;
						end if;
					else
						failed:=true;
					end if;
					RX_Bit_Cnt :=0;
				else
					RX_ShiftReg(RX_Bit_Cnt-1):=PS2_Data;
					RX_Bit_Cnt:=RX_Bit_Cnt+1;
				end if;
			end if;
		end if;
	end process;


process(Clk_circuit, Rst_n)
	begin
		if Rst_n = '0' then
			cnt_r <= 0; -- clear the timeout counter
			scRdy_r <= '0'; -- clear the scancode ready flag
		elsif rising_edge(Clk_circuit) then
			--scRdy_r <= '0'; -- by default, no key scancode is ready for output
			if PS2_Clk = '0' then
				-- reset the timeout register whenever the keyboard clock pulses low
				cnt_r <= 0;
				scRdy_r <= '0';
			elsif cnt_r /= TIMEOUT then
				-- increment the timeout counter if the keyvoard clock is high
				-- and the counter hasn't reached the timeout value yet
				cnt_r <= cnt_r + 1;
				if cnt_r = TIMEOUT-1 then
					-- signal that a key scancode is ready when the counter is
					-- equal to one less than the timeout value
					scRdy_r <= '1'; -- rdy signal pulses for one clock period
				end if;
			end if;
		end if;
	end process;

-- pas de PS2_Data_s par ici donc c'est certainement le rendu
	process (Clk_circuit, Rst_n)
		variable ScanCode_mem:std_logic_vector(7 downto 0):=(others=>'0');
		variable Press_mem:std_logic:='0';
		variable Release_mem:std_logic:='0';
	begin
	ScanCode <= ScanCode_mem;
	Press<=Press_mem;
	Release<=Release_mem;
		if Rst_n = '0' then
			Press_mem := '0';
			Release_mem := '0';
			ScanCode_mem:= (others => '0');
--			e0<='0';
--			e1<='0';
		elsif rising_edge(Clk_circuit) then
			 -- la touche appuyée ou sinon la touche relachée
--			if RX_e0='1' then
--				e0<='1';
--			else
--				e0<='0';
--			end if;
--			if RX_e1='1' then
--				e1<='1';
--			else
--				e1<='0';
--			end if;
			if DO_PRESS = '1' and Press_mem='0' then
				ScanCode_mem:=RX_scancode;
				Press_mem := '1';
				Release_mem := '0';
			elsif Release_mem ='0' then
				ScanCode_mem:=RX_scancode;
				Press_mem := '0';
				Release_mem := '1';
			end if;
		end if;
	end process;
end;
