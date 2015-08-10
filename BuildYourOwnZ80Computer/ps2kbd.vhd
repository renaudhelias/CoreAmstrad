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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ps2kbd is
	port(
		Rst_n		: in std_logic;
		Clk_bourin			: in std_logic; -- il faut bouriner ici
		Clk_circuit : in std_logic;
		PS2_Clk		: in std_logic;
		PS2_Data	: in std_logic;
		Press		: out std_logic;
		Release		: out std_logic;
		--Reset		: out std_logic;
		ScanCode	: out std_logic_vector(7 downto 0)
		--e0: out STD_LOGIC;
		--e1: out STD_LOGIC
		);
end ps2kbd;

architecture rtl of ps2kbd is
	signal	PS2_Sample		: std_logic;
	signal	PS2_Data_s		: std_logic;

	signal	RX_Bit_Cnt		: unsigned(3 downto 0);
	--signal	RX_Byte			: unsigned(2 downto 0);
	signal	RX_ShiftReg		: std_logic_vector(7 downto 0);
	signal	RX_scancode		: std_logic_vector(7 downto 0);
	signal	RX_e0:std_logic;
	signal	RX_e1:std_logic;
	signal DO_PRESS:std_logic;
	--signal	RX_Release		: std_logic;
	--signal	RX_Received		: std_logic;

begin

	process (Clk_bourin, Rst_n)
		variable PS2_Data_r		: std_logic_vector(1 downto 0);
		variable PS2_Clk_r		: std_logic_vector(1 downto 0);
	begin
		if Rst_n = '0' then
			PS2_Sample <= '0';
			PS2_Data_s <= '0';
			PS2_Data_r := "11";
			PS2_Clk_r := "11";
		elsif Clk_bourin'event and Clk_bourin = '1' then
			PS2_Sample <= '0';

			-- Deglitch
			if PS2_Clk_r = "10" then
				PS2_Sample <= '0';
				if PS2_Data_r(0) = '0' then
					PS2_Data_s <= '0';
				end if;
				if PS2_Data_r(0) = '1' then
					PS2_Data_s <= '1';
				end if;
			end if;
			if PS2_Clk_r = "01" then
				PS2_Sample <= '1';
				if PS2_Data_r(0) = '0' then
					PS2_Data_s <= '0';
				end if;
				if PS2_Data_r(0) = '1' then
					PS2_Data_s <= '1';
				end if;

			end if;

			-- Double synchronise
			PS2_Data_r(1) := PS2_Data_r(0);
			PS2_Clk_r(1) := PS2_Clk_r(0);
			PS2_Data_r(0) := PS2_Data;
			PS2_Clk_r(0) := PS2_Clk;
		end if;
	end process;

	process (PS2_Sample, Rst_n)
		variable Cnt : integer range 0 to 127;
		variable releasing:boolean:=false;
		variable RX_scancode_mem:std_logic_vector(7 downto 0);
--		variable RX_e0_mem:STD_LOGIC;
--		variable RX_e1_mem:STD_LOGIC;
--		variable is_e0:boolean;
--		variable is_e1:boolean;
	begin
	
--		RX_e0<=RX_e0_mem;
--		RX_e1<=RX_e1_mem;
		if Rst_n = '0' then
			RX_Bit_Cnt <= (others => '0');
			RX_ShiftReg <= (others => '0');
			RX_scancode <= (others => '0');
--			is_e0:=false;
--			is_e1:=false;
			RX_scancode_mem:=(others=>'0');
--			RX_e0_mem:='0';
--			RX_e1_mem:='0';
			--RX_Received <= '0';
			DO_PRESS<='0';
			Cnt := 0;
		elsif PS2_Sample'event and PS2_Sample = '1' then
			--RX_Received <= '0';
			if Cnt > 0 then
				Cnt:=Cnt-1;
			else
				if RX_Bit_Cnt = "0000" then
					Cnt := 0;
					if PS2_Data_s = '0' then -- Start bit
						RX_Bit_Cnt <= RX_Bit_Cnt + 1;
					end if;
				elsif RX_Bit_Cnt = "1001" then -- Parity bit
					RX_Bit_Cnt <= RX_Bit_Cnt + 1;
					-- Ignoring parity
				elsif RX_Bit_Cnt = "1010" then -- Stop bit
					if PS2_Data_s = '1' then
						--RX_Received <= '1';
						-- les commandes
						if RX_ShiftReg = x"FA" or RX_ShiftReg = x"AA" or RX_ShiftReg = x"EE" or RX_ShiftReg = x"FE" or RX_ShiftReg = x"00" or RX_ShiftReg = x"FF" then
							--ignore
						elsif releasing and not(RX_ShiftReg = x"F0" or RX_ShiftReg = x"E0") then
							-- on est en train de relacher la touche RX_ShiftReg
							-- de toute façon c'est tout pourri le PS/2 on peut pas appuyer sur beaucoup de touche à la fois...
							releasing:=false;
							DO_PRESS<='0';
							RX_scancode_mem:=RX_ShiftReg;
							RX_scancode<=RX_scancode_mem;
--							if is_e0 then
--								RX_e0_mem:='1';
--							else
--								RX_e0_mem:='0';
--							end if;
--							if is_e1 then
--								RX_e1_mem:='1';
--							else
--								RX_e1_mem:='0';
--							end if;
--							is_e0:=false;
--							is_e1:=false;
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
								RX_scancode<=RX_scancode_mem;
--								if is_e0 then
--									RX_e0_mem:='1';
--								else
--									RX_e0_mem:='0';
--								end if;
--								if is_e1 then
--									RX_e1_mem:='1';
--								else
--									RX_e1_mem:='0';
--								end if;
--								is_e0:=false;
--								is_e1:=false;
								DO_PRESS<='1';
							end if;
						end if;
					else
						Cnt:=127;
					end if;
					RX_Bit_Cnt <= "0000";
				else
					RX_Bit_Cnt <= RX_Bit_Cnt + 1;
					RX_ShiftReg(6 downto 0) <= RX_ShiftReg(7 downto 1);
					RX_ShiftReg(7) <= PS2_Data_s;
				end if;
			end if;
		end if;
	end process;

-- pas de PS2_Data_s par ici donc c'est certainement le rendu
	process (Clk_circuit, Rst_n)
		variable ScanCode_mem:std_logic_vector(7 downto 0):=(others=>'0');
	begin
	ScanCode <= ScanCode_mem;
		if Rst_n = '0' then
			Press <= '0';
			Release <= '0';
			ScanCode_mem:= (others => '0');
--			e0<='0';
--			e1<='0';
		elsif Clk_circuit'event and Clk_circuit = '1' then
			ScanCode_mem:=RX_scancode; -- la touche appuyée ou sinon la touche relachée
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
			if DO_PRESS = '1' then
				Press <= '1';
				Release <= '0';
			else 
				Press <= '0';
				Release <= '1';
			end if;
		end if;
	end process;
end;
