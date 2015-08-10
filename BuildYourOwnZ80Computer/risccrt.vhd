-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: risccrt.tdf
-- VHDL Design Output: risccrt.vhd
-- Created 23-Apr-2011 05:33 AM
--
-- Copyright (c) 2011, Xilinx, Inc.  All Rights Reserved.
-- Xilinx Inc makes no warranty, expressed or implied, with respect to
-- the operation and/or functionality of the converted output files.
-- 


-- Some names could not be written out to VHDL as they were
-- in the source, and have been changed:
--
-- AHDL   VHDL
-- ====   ====
-- 16MHz  z16MHz


--  Copyright (c) 2005-2006 Tobias Gubener
--  Subdesign CPC T-REX by TobiFlex
--  All rights reserved
--  Redistribution and use in source and synthezised forms, with or without
--  modification, are permitted provided that the following conditions are met:
--  Redistributions of source code must retain the above copyright notice,
--  this list of conditions and the following disclaimer.
--  Redistributions in synthesized form must reproduce the above copyright
--  notice, this list of conditions and the following disclaimer in the
--  documentation and/or other materials provided with the distribution.
--  Neither the name of the author nor the names of other contributors may
--  be used to endorse or promote products derived from this software without
--  specific prior written permission.
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
--  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
--  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
--  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
--  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
--  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
--  POSSIBILITY OF SUCH DAMAGE.
Library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_arith.all;
entity risccrt is
   Port (
      z16MHz: in std_logic;
      VSYNC, HSYNC: buffer std_logic;
      vadr: buffer std_logic_vector(13 downto 0);
      blackb, border: buffer std_logic
   );
end risccrt;


architecture risccrt_behav of risccrt is
   signal count: std_logic_vector(9 downto 0);
   signal count_d: std_logic_vector(9 downto 0);
   signal count_q: std_logic_vector(9 downto 0);
   signal stat: std_logic_vector(2 downto 0);
   signal stat_d: std_logic_vector(2 downto 0);
   signal stat_ena: std_logic_vector(2 downto 0);
   signal stat_q: std_logic_vector(2 downto 0);
   signal vcount: std_logic_vector(8 downto 0);
   signal vcount_d: std_logic_vector(8 downto 0);
   signal vcount_q: std_logic_vector(8 downto 0);
   signal vstat: std_logic_vector(1 downto 0);
   signal vstat_d: std_logic_vector(1 downto 0);
   signal vstat_ena: std_logic_vector(1 downto 0);
   signal vstat_q: std_logic_vector(1 downto 0);
   signal countnode: std_logic_vector(9 downto 0);
   signal vcountnode: std_logic_vector(8 downto 0);
   signal videonode: std_logic_vector(5 downto 0);
   signal sstart: std_logic_vector(10 downto 0);
   signal sstart_d: std_logic_vector(10 downto 0);
   signal sstart_ena: std_logic_vector(10 downto 0);
   signal sstart_q: std_logic_vector(10 downto 0);
   signal scount: std_logic_vector(10 downto 0);
   signal scount_d: std_logic_vector(10 downto 0);
   signal scount_q: std_logic_vector(10 downto 0);
   signal ra: std_logic_vector(2 downto 0);
   signal ra_d: std_logic_vector(2 downto 0);
   signal ra_ena: std_logic_vector(2 downto 0);
   signal ra_q: std_logic_vector(2 downto 0);
   signal count0_clk_ctrl, stat0_clk_ctrl, border_clk_ctrl, scount0_clk_ctrl,
	 sstart0_clk_ctrl, ra0_clk_ctrl, vcount0_clk_ctrl, vstat0_clk_ctrl,
	 ra0_clrn_ctrl, vcc, border_q, border_d, blackb_q, blackb_d, vakt, res,
	 hsync_q, hsync_ena, hsync_clk, hsync_d: std_logic;

   Function to_std_logic(X: in Boolean) return Std_Logic is
   variable ret : std_logic;
   begin
   if x then ret := '1';  else ret := '0'; end if;
   return ret;
   end to_std_logic;


   -- sizeIt replicates a value to an array of specific length.
   Function sizeIt(a: std_Logic; len: integer) return std_logic_vector is
      variable rep: std_logic_vector( len-1 downto 0);
   begin for i in rep'range loop rep(i) := a;  end loop; return rep;
   end sizeIt;
begin

-- Register Section

   HSYNC <= hsync_q;
   process (hsync_clk) begin
      if hsync_clk'event and hsync_clk='1' then
	 if hsync_ena='1' then
	    hsync_q <= hsync_d;
	 end if;
      end if;
   end process;

   (blackb, border) <= std_logic_vector'(blackb_q & border_q);
   process (border_clk_ctrl) begin
      if border_clk_ctrl'event and border_clk_ctrl='1' then
	 (blackb_q, border_q) <= std_logic_vector'(blackb_d & border_d);
      end if;
   end process;

   process (count0_clk_ctrl) begin
      if count0_clk_ctrl'event and count0_clk_ctrl='1' then
	 count_q <= count_d;
      end if;
   end process;

   process (stat0_clk_ctrl) begin
      if stat0_clk_ctrl'event and stat0_clk_ctrl='1' then
	 if stat_ena(2)='1' then
	    stat_q(2) <= stat_d(2);
	 end if;
      end if;
   end process;

   process (stat0_clk_ctrl) begin
      if stat0_clk_ctrl'event and stat0_clk_ctrl='1' then
	 if stat_ena(1)='1' then
	    stat_q(1) <= stat_d(1);
	 end if;
      end if;
   end process;

   process (stat0_clk_ctrl) begin
      if stat0_clk_ctrl'event and stat0_clk_ctrl='1' then
	 if stat_ena(0)='1' then
	    stat_q(0) <= stat_d(0);
	 end if;
      end if;
   end process;

   process (vcount0_clk_ctrl) begin
      if vcount0_clk_ctrl'event and vcount0_clk_ctrl='1' then
	 vcount_q <= vcount_d;
      end if;
   end process;

   process (vstat0_clk_ctrl) begin
      if vstat0_clk_ctrl'event and vstat0_clk_ctrl='1' then
	 if vstat_ena(1)='1' then
	    vstat_q(1) <= vstat_d(1);
	 end if;
      end if;
   end process;

   process (vstat0_clk_ctrl) begin
      if vstat0_clk_ctrl'event and vstat0_clk_ctrl='1' then
	 if vstat_ena(0)='1' then
	    vstat_q(0) <= vstat_d(0);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(10)='1' then
	    sstart_q(10) <= sstart_d(10);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(9)='1' then
	    sstart_q(9) <= sstart_d(9);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(8)='1' then
	    sstart_q(8) <= sstart_d(8);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(7)='1' then
	    sstart_q(7) <= sstart_d(7);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(6)='1' then
	    sstart_q(6) <= sstart_d(6);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(5)='1' then
	    sstart_q(5) <= sstart_d(5);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(4)='1' then
	    sstart_q(4) <= sstart_d(4);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(3)='1' then
	    sstart_q(3) <= sstart_d(3);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(2)='1' then
	    sstart_q(2) <= sstart_d(2);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(1)='1' then
	    sstart_q(1) <= sstart_d(1);
	 end if;
      end if;
   end process;

   process (sstart0_clk_ctrl) begin
      if sstart0_clk_ctrl'event and sstart0_clk_ctrl='1' then
	 if sstart_ena(0)='1' then
	    sstart_q(0) <= sstart_d(0);
	 end if;
      end if;
   end process;

   process (scount0_clk_ctrl) begin
      if scount0_clk_ctrl'event and scount0_clk_ctrl='1' then
	 scount_q <= scount_d;
      end if;
   end process;

   process (ra0_clk_ctrl, ra0_clrn_ctrl) begin
      if ra0_clrn_ctrl='0' then
	 ra_q(2) <= '0';
      elsif ra0_clk_ctrl'event and ra0_clk_ctrl='1' then
	 if ra_ena(2)='1' then
	    ra_q(2) <= ra_d(2);
	 end if;
      end if;
   end process;

   process (ra0_clk_ctrl, ra0_clrn_ctrl) begin
      if ra0_clrn_ctrl='0' then
	 ra_q(1) <= '0';
      elsif ra0_clk_ctrl'event and ra0_clk_ctrl='1' then
	 if ra_ena(1)='1' then
	    ra_q(1) <= ra_d(1);
	 end if;
      end if;
   end process;

   process (ra0_clk_ctrl, ra0_clrn_ctrl) begin
      if ra0_clrn_ctrl='0' then
	 ra_q(0) <= '0';
      elsif ra0_clk_ctrl'event and ra0_clk_ctrl='1' then
	 if ra_ena(0)='1' then
	    ra_q(0) <= ra_d(0);
	 end if;
      end if;
   end process;

-- Start of original equations

-- --------------------------------------------------------------------------
-- VADR
-- --------------------------------------------------------------------------
   vadr(10 downto 0) <= scount_q;
   vadr(13 downto 11) <= ra_q;

-- --------------------------------------------------------------------------
-- HSYNC
-- --------------------------------------------------------------------------
   count0_clk_ctrl <= z16MHz;
   stat0_clk_ctrl <= z16MHz;
   hsync_clk <= z16MHz;
   border_d <= videonode(4);
   blackb_d <= videonode(5);
   border_clk_ctrl <= count_q(2);


   process (stat_q, vcc, vakt)
      variable stdVec3: std_logic_vector(2 downto 0);
   begin
      stat_d <= "000";
      countnode <= "0000000000";
      (videonode(3), videonode(2), videonode(1), videonode(0), videonode(5),
	    videonode(4)) <= std_logic_vector'("000001");
      hsync_d <= '0';
      stdVec3 := stat_q;
      case stdVec3 is
      when "000" =>

-- 74;
	 countnode <= "0001001111";

-- schwarzschulter
	 videonode <= "100000";

-- HSYNC
	 hsync_d <= vcc;
	 stat_d <= "001";
      when "001" =>

-- 92;
	 countnode <= "0001101111";
	 stat_d <= "010";
      when "010" =>

-- 95;
	 countnode <= "0000111111";

-- schwarzschulter
	 videonode <= "100000";
	 stat_d <= "011";
      when "011" =>

-- 639 BORDER
	 countnode <= "1001111111";
	 stat_d <= "100";
      when "100" =>

-- 95
	 countnode <= "0001011111";
	 if (vakt)='1' then

-- AKTIV
	    videonode(5 downto 4) <= "00";
	 end if;
	 stat_d <= "101";
      when "101" =>
	 countnode <= "0000011111";
	 stat_d <= "000";
      when others =>
      end case;
      stdVec3 := (others=>'0');  -- no storage needed
   end process;

-- --------------------------------------------------------------------------
-- ROW & COL
-- --------------------------------------------------------------------------
   scount0_clk_ctrl <= count_q(2);
   sstart0_clk_ctrl <= count_q(2);

-- 2MHz
   ra0_clk_ctrl <= count_q(2);
   ra_d <= std_logic_vector'(unsigned(ra_q) + unsigned'("001"));


   process (res, scount_q)
   begin
      sstart_d <= "00000000000";
      if (res)='1' then
	 sstart_d <= scount_q;
      else

-- (hadr[1..0],ladr[],B"0");
	 sstart_d <= "00000000000";
      end if;
   end process;


   process (stat_q, count_q, sstart_q, scount_q)
   begin
      scount_d <= "00000000000";
      if stat_q = "011" and count_q /= "0000000000" then
	 scount_d <= sstart_q;
      else
	 scount_d <= std_logic_vector'(unsigned(scount_q) +
	       unsigned'("00000000001"));
      end if;
   end process;


   process (stat_q, ra_q, res, vcc, countnode, count_q)
   begin
      count_d <= "0000000000";
      stat_ena <= "000";
      ra_ena <= "000";
      sstart_ena <= "00000000000";
      hsync_ena <= '0';
      if count_q = "0000000000" then
	 if stat_q = "100" then
	    sstart_ena <= sizeIt(to_std_logic(ra_q = "111"),11) or sizeIt(not
		  res,11);
	    ra_ena <= sizeIt(vcc,3);
	 end if;
	 stat_ena <= sizeIt(vcc,3);
	 hsync_ena <= vcc;
	 count_d <= countnode;
      else
	 count_d <= std_logic_vector'(unsigned(count_q) -
	       unsigned'("0000000001"));
      end if;
   end process;

-- --------------------------------------------------------------------------
-- VSYNC
-- --------------------------------------------------------------------------
   res <= to_std_logic(vstat_q /= "01");
   vcount0_clk_ctrl <= hsync_q;
   vstat0_clk_ctrl <= hsync_q;
   vstat_d <= std_logic_vector'(unsigned(vstat_q) + unsigned'("01"));
   ra0_clrn_ctrl <= res;


   process (vstat_q, vcc)
      variable stdVec2: std_logic_vector(1 downto 0);
   begin
      vcountnode <= "000000000";
      (VSYNC, vakt) <= std_logic_vector'("00");
      stdVec2 := vstat_q;
      case stdVec2 is
      when "00" =>

-- 43
	 vcountnode <= "001000001";

-- V-Sync
	 VSYNC <= vcc;
      when "01" =>

-- BORDER
	 vcountnode <= "011000111";
      when "10" =>

-- (43)
	 vcountnode <= "000100101";

-- AKTIV
	 vakt <= vcc;
      when "11" =>

-- BORDER (23)
	 vcountnode <= "000000111";
      when others =>
      end case;
      stdVec2 := (others=>'0');  -- no storage needed
   end process;


   process (vcc, vcountnode, vcount_q)
   begin
      vcount_d <= "000000000";
      vstat_ena <= "00";
      if vcount_q = "000000000" then
	 vstat_ena <= std_logic_vector'(vcc & vcc);
	 vcount_d <= vcountnode;
      else
	 vcount_d <= std_logic_vector'(unsigned(vcount_q) -
	       unsigned'("000000001"));
      end if;
   end process;

-- Define power signal(s)
   vcc <= '1';
end risccrt_behav;
