-- Copyright (c) 2005-2006 Tobias Gubener
-- Subdesign CPC T-REX by TobiFlex
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

library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity crtcV is
    port (
	MA     : out STD_LOGIC_VECTOR (13 downto 0);
	RA     : out STD_LOGIC_VECTOR (4 downto 0);
	HSYNC  : out STD_LOGIC;
	VSYNC  : out STD_LOGIC;
	DISP   : out std_logic; -- freemac for testbench buffer STD_LOGIC;
	CPCHSYNC  : out STD_LOGIC;
	CPCVSYNC  : out STD_LOGIC;
	CPCDISP   : out STD_LOGIC;
	CPCBLACK  : out STD_LOGIC;
--	mark  : out STD_LOGIC;
--	mark2  : out STD_LOGIC;
	IOCLK  : in STD_LOGIC;
	RS     : in STD_LOGIC;
	CS     : in STD_LOGIC;
	RW     : in STD_LOGIC;
	Din    : in STD_LOGIC_VECTOR (7 downto 0);
	RESET  : in STD_LOGIC;
	CLK    : in STD_LOGIC
    );
end crtcV;

architecture logic of crtcV is



-- init values are for test bench !
-- 6845 registers
signal RHtot		: STD_LOGIC_VECTOR (7 downto 0):="00010000";
signal RHdisp		: STD_LOGIC_VECTOR (7 downto 0):="00000111";
signal RHsyncpos	: STD_LOGIC_VECTOR (7 downto 0):="00001001";
signal RHwidth		: STD_LOGIC_VECTOR (3 downto 0):="0100";
signal RVwidth		: STD_LOGIC_VECTOR (5 downto 0):='0' & "00011"; -- comment ça 6 bits ?
signal Vtot			: STD_LOGIC_VECTOR (6 downto 0):="0011000";
signal RVtot		: STD_LOGIC_VECTOR (6 downto 0):="0011000";
signal RVtaj		: STD_LOGIC_VECTOR (4 downto 0):="00010";
signal RVdisp		: STD_LOGIC_VECTOR (6 downto 0):="0001111";
signal RVsyncpos	: STD_LOGIC_VECTOR (6 downto 0):="0010011";
signal Rmax			: STD_LOGIC_VECTOR (4 downto 0); -- Rmax<=RRmax ?
signal RRmax		: STD_LOGIC_VECTOR (4 downto 0):="00011";
signal RAdrH		: STD_LOGIC_VECTOR (5 downto 0):=(others=>'0');
signal RAdrL		: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
signal RRadr		: STD_LOGIC_VECTOR (4 downto 0);

--------------------
signal cntH			: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
signal cntHP		: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
signal cntV			: STD_LOGIC_VECTOR (6 downto 0):=(others=>'0');
signal cntRA		: STD_LOGIC_VECTOR (4 downto 0):=(others=>'0');
signal cntMA		: STD_LOGIC_VECTOR (13 downto 0):=(others=>'0');
signal cntHS		: STD_LOGIC_VECTOR (3 downto 0):=(others=>'0');
signal cntVS		: STD_LOGIC_VECTOR (5 downto 0):=(others=>'0');
signal cnttaj		: STD_LOGIC_VECTOR (4 downto 0):=(others=>'0');
signal RMA			: STD_LOGIC_VECTOR (13 downto 0):=(others=>'0');
--signal enaHSS		: STD_LOGIC;
signal enaHSC		: STD_LOGIC:='0';
signal enaHtot		: STD_LOGIC:='0';
signal enaVtot		: STD_LOGIC:='0';
signal enaV			: STD_LOGIC:='0';
signal enaRA		: STD_LOGIC:='0';
signal split		: STD_LOGIC:='0';
--signal Hdisp		: STD_LOGIC;
signal Vdisp		: STD_LOGIC:='0';
signal disp_internal:std_logic:='0'; --freemac for testbench
begin
disp <= '1' when (cntV < RVdisp) and (cntH < RHdisp) else '0';
disp_internal <= '1' when (cntV < RVdisp) and (cntH < RHdisp) else '0';

cpcblack <= '1' when cntVS < 27 else '0';
--cpcblack <= '0';
--mark <= '0' ;--split; 
--mark2 <='1' when (cntV = RVtot and cntRA=RRmax and RVtaj=0) or cnttaj=1 else '0';
-------------------------------------------------------------------------
--H Line, H Sync and MA
-------------------------------------------------------------------------
process (clk, reset)
begin 
	if reset='0' then 
		cntH <= (others=>'0');
		cntMA <= (others=>'0');
--		Hdisp <= '0';
		Hsync <= '0';
	elsif rising_edge(clk) then
		CPCdisp <= disp_internal;
		if enaHtot='1' then
--		if cntH=RHtot or cntH=B"11111111" then
			cntH <= (others=>'0');
--			if split='1' then
			if cntV=0 and cntRA=0 then
				cntMA<=RAdrH&RAdrL;
				  RMA<=RAdrH&RAdrL;
--			elsif enaRA='0' then
			elsif cntRA/=0 then
				cntMA<=RMA;
			else
				RMA <= cntMA;
			end if;
		else
			cntH <= cntHP;
			if cntH < RHdisp then
				cntMA <= cntMA + 1;
			end if;
		end if;		
		
		if cntHS=RHwidth then
			Hsync<='0';
			cntHS <= B"0000";
			
		elsif cntHP=RHsyncpos then
			cntHS<=B"0001";
--			cntHS<=B"0011";
			
			Hsync<='1';
		else
			if cntHS/=0 then
--			if cntHS/=B"1111" then
				cntHS<=cntHS+1;	
			end if;	
		end if;
		
		if cntHS=9 or cntHS=RHwidth then
			CPCHsync<='0';
		elsif cntHS=3 then
			CPCHsync<='1';
		end if;
	end if;
end process;
MA<=cntMA;
cntHP <= cntH+1;
--enaHSS<='1' when cntHP=RHsyncpos else '0';
enaHSC<='1' when cntHS=RHwidth else '0';
enaHtot<='1' when cntH=RHtot or cntH=B"11111111" else '0';
--enaHtot<='1' when cntHS=RHwidth else '0';
-------------------------------------------------------------------------
--Row
-------------------------------------------------------------------------
process (clk, reset)
begin 
	if reset='0' then 
		cntRA <= (others=>'0');
	elsif rising_edge(clk) then
--	elsif falling_edge(clk) then
		if enaHSC='1' then	
			Rmax <= RRmax;
			if enaRA='1' or cnttaj=1 then
				cntRA <= (others=>'0');
			else
				cntRA <= cntRA+1;
			end if;		
		end if;	
	end if;
end process;
RA<=cntRA;
enaRA<='1' when cntRA=Rmax or cntRA=B"11111" else '0';
--enaRA<='1' when cntRA=Rmax or cnttaj=1 or cntRA=B"11111" else '0';
	

-------------------------------------------------------------------------
--V Line + Adjust
-------------------------------------------------------------------------
process (clk, reset)
begin 
	if reset='0' then 
		cntV <= (others=>'0');
	elsif rising_edge(clk) then
--	elsif falling_edge(clk) then
		if enaHSC='1' then
			Vtot <= RVtot;
			if split='1' then 
				cntV <= (others=>'0');
			else
				if enaRA='1' then --and cnttaj=0 then
					cntV <= cntV+1;
				end if;			
			end if;		
			if enaVtot='1' and enaRA='1' then 
				cnttaj <= RVtaj;
			elsif cnttaj/=0 then
				cnttaj <= cnttaj-1;
			end if;			
		end if;	
	end if;
end process;
split<='1' when (enaVtot='1' and enaRA='1' and RVtaj=0) or cnttaj=1 else '0';
--enaV<='1' when cntV=0 else '0';
--enaVtot<='1' when cntV = RVtot or cnttaj=1 else '0';
enaVtot<='1' when cntV = Vtot  or cntV=B"1111111" else '0';
--enaVtot<='1' when (cntV = RVtot and RVtaj=0) or cnttaj=1 else '0';
-------------------------------------------------------------------------
--V SYNC
-------------------------------------------------------------------------
process (clk, reset)
begin 
	if reset='0' then 
		cntVS <= (others=>'0');
		Vsync <= '0';
	elsif rising_edge(clk) then
--	elsif falling_edge(clk) then
--		if cntH=0 then
		if enaHtot='1' then
			if (cntV=RVsyncpos and cntRA=0) then
				Vsync<='1';
				cntVS <= B"000001";
			else
				if cntVS /= 63 then
					cntVS <= cntVS+1;
				end if;
			end if;			
	--		if cntVS=1 then
	--			Vsync<='1';
	--		end if;
			if cntVS=RVwidth then
				Vsync<='0';
			end if;
			if cntVS=2 then
				CPCVsync<='1';
			end if;
			if cntVS=6 or cntVS=RVwidth then
				CPCVsync<='0';
			end if;
		end if;
	end if;
end process;
-------------------------------------------------------------------------
--IO Regs
-------------------------------------------------------------------------
process (ioclk, reset)
begin 
	if reset='0' then 
		RHtot<="00111111";
		RHdisp<="00101000";
		RHsyncpos<="00101110";
		RHwidth<="1110";
		RVwidth<="001000";
		RVtot<="0100110";
		RVtaj<="00000";
		RVdisp<="0011001";
		RVsyncpos<="0011110";
		RRmax<="00111";
		RAdrH<="110000";
		RAdrL<="00000000";
	elsif rising_edge(ioclk) then
	if rw='0' and cs='0' then
		if rs='0' then
			RRadr<=Din(4 downto 0);
		else
			if RRadr="00000" then
				RHtot<=Din;
			end if;
			if RRadr="00001" then
				RHdisp<=Din;
			end if;
			if RRadr="00010" then
				RHsyncpos<=Din;
			end if;
			if RRadr="00011" then
				if Din(7 downto 4)="0000" then
					RVwidth<="01"& Din(7 downto 4);
				else
					RVwidth<="00"& Din(7 downto 4);
				end if;
--				if Din(3 downto 0)="0000" then
--					RHwidth<='1'& Din(3 downto 0);
--				else
--					RHwidth<='0'& Din(3 downto 0);
--				end if;
				RHwidth <= Din(3 downto 0);
			end if;
			if RRadr="00100" then
				RVtot<=Din(6 downto 0);
			end if;
			if RRadr="00101" then
				RVtaj<=Din(4 downto 0);
			end if;
			if RRadr="00110" then
				RVdisp<=Din(6 downto 0);
			end if;
			if RRadr="00111" then
				RVsyncpos<=Din(6 downto 0);
			end if;
			if RRadr="01001" then
				RRmax<=Din(4 downto 0);
			end if;
			if RRadr="01100" then
				RAdrH<=Din(5 downto 0);
			end if;
			if RRadr="01101" then
				RAdrL<=Din;
			end if;
		end if;
	end if;	
	end if;
end process;
end logic;

