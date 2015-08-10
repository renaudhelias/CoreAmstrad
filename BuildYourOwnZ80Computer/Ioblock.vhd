-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: Ioblock.tdf
-- VHDL Design Output: Ioblock.vhd
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
entity Ioblock is
   Port (
      z16MHz, cpuclk, expint: in std_logic;
      count: in std_logic_vector(3 downto 0);
      video: out std_logic_vector(15 downto 0);
--      VSYNC, DIVSYNC, HSYNC, DIHSYNC: out std_logic;
      vadr: out std_logic_vector(22 downto 0);
      vack: out std_logic;
      OUT_B: out std_logic_vector(7 downto 0);
      IO_Adr: in std_logic_vector(7 downto 0);
      IO_Data: in std_logic_vector(7 downto 0);
      IOWR: in std_logic;
      ROMENA: out std_logic_vector(1 downto 0);
      reset: in std_logic;
      vdatain: in std_logic_vector(7 downto 0);
      riscview: in std_logic;
      disp: out std_logic:='0' -- not used
   );
end Ioblock;


architecture Ioblock_behav of Ioblock is

-- pour le simulateur
     signal VSYNC, DIVSYNC, HSYNC, DIHSYNC: std_logic;


--   count[3..0]             :DFF;
--   expintvd                :DFFE;
--   hsynccnt[3..0]      :DFFE;
--   vsynccnt[5..0]      :DFFE;
   signal videonode: std_logic_vector(5 downto 0):=(others=>'0');
   signal n_data: std_logic_vector(7 downto 0):=(others=>'0');
   signal n_data_d: std_logic_vector(7 downto 0):=(others=>'0');
   signal n_data_q: std_logic_vector(7 downto 0):=(others=>'0');
   signal n_video: std_logic_vector(5 downto 0):=(others=>'0');
   signal MF: std_logic_vector(3 downto 0):=(others=>'0');
   signal MF_d: std_logic_vector(3 downto 0):=(others=>'0');
   signal MF_ena: std_logic_vector(3 downto 0):=(others=>'0');
   signal MF_q: std_logic_vector(3 downto 0):=(others=>'0');
   signal MFH: std_logic_vector(1 downto 0):=(others=>'0');
   signal MFH_d: std_logic_vector(1 downto 0):=(others=>'0');
   signal MFH_q: std_logic_vector(1 downto 0):=(others=>'0');
   signal colorram_data: std_logic_vector(4 downto 0):=(others=>'0');
   signal colorram_wraddress: std_logic_vector(4 downto 0):=(others=>'0');
   signal colorram_rdaddress: std_logic_vector(4 downto 0):=(others=>'0');
   signal colorram_q: std_logic_vector(4 downto 0):=(others=>'0');
   signal colortab_address: std_logic_vector(5 downto 0):=(others=>'0');
   signal colortab_q: std_logic_vector(5 downto 0):=(others=>'0');
   signal coladr: std_logic_vector(4 downto 0):=(others=>'0');
   signal coladr_d: std_logic_vector(4 downto 0):=(others=>'0');
   signal coladr_ena: std_logic_vector(4 downto 0):=(others=>'0');
   signal coladr_q: std_logic_vector(4 downto 0):=(others=>'0');
   signal crtc_Din: std_logic_vector(7 downto 0):=(others=>'0');
   signal crtc_MA: std_logic_vector(13 downto 0):=(others=>'0');
   signal crtc_RA: std_logic_vector(4 downto 0):=(others=>'0');
   signal rcrt_vadr: std_logic_vector(13 downto 0):=(others=>'0');
   signal vdatad: std_logic_vector(7 downto 0):=(others=>'0');
   signal vdatad_d: std_logic_vector(7 downto 0):=(others=>'0');
   signal vdatad_q: std_logic_vector(7 downto 0):=(others=>'0');
   signal riscnode: std_logic_vector(1 downto 0):=(others=>'0');
   signal vdatad0_clk_ctrl, n_data0_clk_ctrl, MFH0_clk_ctrl, MF2_clrn_ctrl,
	 MF0_clk_ctrl, coladr0_clk_ctrl, vcc, gnd, rcrt_border, rcrt_blackb,
	 rcrt_HSYNC, rcrt_VSYNC, rcrt_16MHz, crtc_CPCBLACK, crtc_CPCDISP,
	 crtc_CPCVSYNC, crtc_CPCHSYNC, crtc_DISP, crtc_VSYNC, crtc_HSYNC,
	 crtc_CLK, crtc_RESET, crtc_RW, crtc_CS, crtc_RS, crtc_IOCLK, n_clk,
	 colortab_clock, colorram_rdclock, colorram_wrclock, colorram_wren:
	 std_logic:='0';

-- Sub Module Interface Section


   component colorram_inst
      Port (
	 data: in std_logic_vector(4 downto 0);
	 wren: in std_logic;
	 wraddress: in std_logic_vector(4 downto 0);
	 rdaddress: in std_logic_vector(4 downto 0);
	 wrclock, rdclock: in std_logic;
	 q: buffer std_logic_vector(4 downto 0)
      );
   end component;


   component colortab_inst
      Port (
	 address: in std_logic_vector(5 downto 0);
	 clock: in std_logic;
	 q: buffer std_logic_vector(5 downto 0)
      );
   end component;


   component crtcV
      Port (
	 IOCLK, RS, CS, RW: in std_logic;
	 Din: in std_logic_vector(7 downto 0);
	 RESET, CLK: in std_logic;
	 MA: out std_logic_vector(13 downto 0);
	 RA: out std_logic_vector(4 downto 0);
	 HSYNC, VSYNC, DISP, CPCHSYNC, CPCVSYNC, CPCDISP, CPCBLACK: out
	       std_logic
      );
   end component;


   component risccrt
      Port (
	 z16MHz: in std_logic;
	 VSYNC, HSYNC: buffer std_logic;
	 vadr: buffer std_logic_vector(13 downto 0);
	 blackb, border: buffer std_logic
      );
   end component;

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

-- Sub Module Section
--   colorram: colorram_inst port map (data=>colorram_data, wren=>colorram_wren,
--	 wraddress=>colorram_wraddress, rdaddress=>colorram_rdaddress,
--	 wrclock=>colorram_wrclock, rdclock=>colorram_rdclock, q=>colorram_q);
--   colortab: colortab_inst port map (address=>colortab_address,
--	 clock=>colortab_clock, q=>colortab_q);
--	 
--	 
   crtc: crtcV port map (IOCLK=>crtc_IOCLK, RS=>crtc_RS, CS=>crtc_CS,
	 RW=>crtc_RW, Din=>crtc_Din, RESET=>crtc_RESET, CLK=>crtc_CLK,
	 MA=>crtc_MA, RA=>crtc_RA, HSYNC=>crtc_HSYNC, VSYNC=>crtc_VSYNC,
	 CPCHSYNC=>crtc_CPCHSYNC, CPCVSYNC=>crtc_CPCVSYNC,
	 CPCDISP=>crtc_CPCDISP, CPCBLACK=>crtc_CPCBLACK);
   rcrt: risccrt port map (z16MHz=>rcrt_16MHz, VSYNC=>rcrt_VSYNC,
	 HSYNC=>rcrt_HSYNC, vadr=>rcrt_vadr, blackb=>rcrt_blackb,
	 border=>rcrt_border);

-- Register Section

   process (n_data0_clk_ctrl) begin
      if n_data0_clk_ctrl'event and n_data0_clk_ctrl='1' then
	 n_data_q <= n_data_d;
      end if;
   end process;

   process (MF0_clk_ctrl, MF2_clrn_ctrl) begin
      if MF2_clrn_ctrl='0' then
	 MF_q(3) <= '0';
      elsif MF0_clk_ctrl'event and MF0_clk_ctrl='1' then
	 if MF_ena(3)='1' then
	    MF_q(3) <= MF_d(3);
	 end if;
      end if;
   end process;

   process (MF0_clk_ctrl, MF2_clrn_ctrl) begin
      if MF2_clrn_ctrl='0' then
	 MF_q(2) <= '0';
      elsif MF0_clk_ctrl'event and MF0_clk_ctrl='1' then
	 if MF_ena(2)='1' then
	    MF_q(2) <= MF_d(2);
	 end if;
      end if;
   end process;

   process (MF0_clk_ctrl) begin
      if MF0_clk_ctrl'event and MF0_clk_ctrl='1' then
	 if MF_ena(1)='1' then
	    MF_q(1) <= MF_d(1);
	 end if;
      end if;
   end process;

   process (MF0_clk_ctrl) begin
      if MF0_clk_ctrl'event and MF0_clk_ctrl='1' then
	 if MF_ena(0)='1' then
	    MF_q(0) <= MF_d(0);
	 end if;
      end if;
   end process;

   process (MFH0_clk_ctrl) begin
      if MFH0_clk_ctrl'event and MFH0_clk_ctrl='1' then
	 MFH_q <= MFH_d;
      end if;
   end process;

   process (coladr0_clk_ctrl) begin
      if coladr0_clk_ctrl'event and coladr0_clk_ctrl='1' then
	 if coladr_ena(4)='1' then
	    coladr_q(4) <= coladr_d(4);
	 end if;
      end if;
   end process;

   process (coladr0_clk_ctrl) begin
      if coladr0_clk_ctrl'event and coladr0_clk_ctrl='1' then
	 if coladr_ena(3)='1' then
	    coladr_q(3) <= coladr_d(3);
	 end if;
      end if;
   end process;

   process (coladr0_clk_ctrl) begin
      if coladr0_clk_ctrl'event and coladr0_clk_ctrl='1' then
	 if coladr_ena(2)='1' then
	    coladr_q(2) <= coladr_d(2);
	 end if;
      end if;
   end process;

   process (coladr0_clk_ctrl) begin
      if coladr0_clk_ctrl'event and coladr0_clk_ctrl='1' then
	 if coladr_ena(1)='1' then
	    coladr_q(1) <= coladr_d(1);
	 end if;
      end if;
   end process;

   process (coladr0_clk_ctrl) begin
      if coladr0_clk_ctrl'event and coladr0_clk_ctrl='1' then
	 if coladr_ena(0)='1' then
	    coladr_q(0) <= coladr_d(0);
	 end if;
      end if;
   end process;

   process (vdatad0_clk_ctrl) begin
      if vdatad0_clk_ctrl'event and vdatad0_clk_ctrl='1' then
	 vdatad_q <= vdatad_d;
      end if;
   end process;

-- Start of original equations

-- FUNCTION crtcV (IOCLK, RS, CS, RW, Din[7..0], RESET, CLK)
--   RETURNS (MA[13..0], RA[4..0], HSYNC, VSYNC, DISP);
   crtc_IOCLK <= cpuclk;

-- 1MHz
   crtc_CLK <= count(3);
   crtc_RS <= IO_Adr(0);
   crtc_CS <= IO_Adr(6);
   crtc_Din <= IO_Data;
   crtc_RW <= IOWR;
   crtc_RESET <= reset;

--   crtc.degclk=16MHz;
   DIVSYNC <= crtc_VSYNC;
   DIHSYNC <= crtc_HSYNC;


   process (riscview, rcrt_VSYNC, rcrt_HSYNC, rcrt_vadr, crtc_CPCVSYNC,
	 crtc_CPCHSYNC, crtc_RA, count, crtc_MA)
   begin
      (vadr(13), vadr(12), vadr(11), vadr(15), vadr(14), vadr(10), vadr(9),
	    vadr(8), vadr(7), vadr(6), vadr(5), vadr(4), vadr(3), vadr(2),
	    vadr(1), vadr(0), vadr(22), vadr(21), vadr(20), vadr(19), vadr(18),
	    vadr(17), vadr(16)) <=
	    std_logic_vector'("00000000000000000000000");
      (VSYNC, HSYNC) <= std_logic_vector'("00");
      if (riscview)='1' then
	 VSYNC <= rcrt_VSYNC;
	 HSYNC <= rcrt_HSYNC;
	 vadr(13 downto 0) <= rcrt_vadr;

--       vadr[22..14]=B"000100101";
	 vadr(22 downto 14) <= "000101011";
      else
	 VSYNC <= crtc_CPCVSYNC;
	 HSYNC <= crtc_CPCHSYNC;
	 vadr(13 downto 11) <= crtc_RA(2 downto 0);
	 vadr(15 downto 14) <= crtc_MA(13 downto 12);
	 vadr(10 downto 0) <= std_logic_vector'(crtc_MA(9) & crtc_MA(8) &
	       crtc_MA(7) & crtc_MA(6) & crtc_MA(5) & crtc_MA(4) & crtc_MA(3) &
	       crtc_MA(2) & crtc_MA(1) & crtc_MA(0) & (not count(3)));-- >2< 4 8 16  
	 vadr(22 downto 16) <= "0001011";
      end if;
   end process;
   rcrt_16MHz <= z16MHz;

-- ****************************
-- Videobytesteuerung
-- ****************************
   vack <= count(2); -- 2 >4< 8 16
   vdatad0_clk_ctrl <= count(2);
   n_data_d <= vdatad_q;
   vdatad_d <= vdatain;

--   n_data[]=vadr[7..0];
   n_data0_clk_ctrl <= count(2);

--   n_data[].clk=NOT cpuclk;--count[2];
-- --------------------------------------------------------------------------
-- Gate Array
-- --------------------------------------------------------------------------
   MFH_d <= MF_q(1 downto 0);
   MFH0_clk_ctrl <= not HSYNC;


   process (DIVSYNC, DIHSYNC, crtc_CPCBLACK, crtc_CPCDISP, MFH_q, count,
	 n_data_q)
      variable stdVec2: std_logic_vector(1 downto 0);
      variable stdVec3: std_logic_vector(2 downto 0);
      variable stdVec1: std_logic_vector(0 downto 0);
   begin
      videonode <= "000000";
      if (DIVSYNC or DIHSYNC or crtc_CPCBLACK)='1' then

--   IF DIHSYNC THEN
-- schwarzschulter
	 videonode <= "100000";
      elsif (crtc_CPCDISP)='1' then

-- AKTIV
	 videonode(5 downto 4) <= "00";

--                   case B"10"  is
	 stdVec2 := MFH_q;
	 case stdVec2 is
	 when "01" =>
	    videonode(3 downto 2) <= "00";
	    stdVec2 := count(2 downto 1);
	    case stdVec2 is
	    when "11" =>
	       videonode(0) <= n_data_q(7);
	       videonode(1) <= n_data_q(3);
	    when "10" =>
	       videonode(0) <= n_data_q(6);
	       videonode(1) <= n_data_q(2);
	    when "01" =>
	       videonode(0) <= n_data_q(5);
	       videonode(1) <= n_data_q(1);
	    when "00" =>
	       videonode(0) <= n_data_q(4);
	       videonode(1) <= n_data_q(0);
	    when others =>
	    end case;
	    stdVec2 := (others=>'0');  -- no storage needed
	 when "10" =>
	    videonode(3 downto 1) <= "000";
	    stdVec3 := count(2 downto 0);
	    case stdVec3 is
	    when "111" =>
	       videonode(0) <= n_data_q(7);
	    when "110" =>
	       videonode(0) <= n_data_q(6);
	    when "101" =>
	       videonode(0) <= n_data_q(5);
	    when "100" =>
	       videonode(0) <= n_data_q(4);
	    when "011" =>
	       videonode(0) <= n_data_q(3);
	    when "010" =>
	       videonode(0) <= n_data_q(2);
	    when "001" =>
	       videonode(0) <= n_data_q(1);
	    when "000" =>
	       videonode(0) <= n_data_q(0);
	    when others =>
	    end case;
	    stdVec3 := (others=>'0');  -- no storage needed
	 when others =>
	    case count(2) is
	    when '1' =>
	       videonode(0) <= n_data_q(7);
	       videonode(2) <= n_data_q(5);
	       videonode(1) <= n_data_q(3);
	       videonode(3) <= n_data_q(1);
	    when '0' =>
	       videonode(0) <= n_data_q(6);
	       videonode(2) <= n_data_q(4);
	       videonode(1) <= n_data_q(2);
	       videonode(3) <= n_data_q(0);
	    when others =>
	    end case;
	 end case;
	 stdVec2 := (others=>'0');  -- no storage needed
      else

-- border
	 videonode <= "010000";
      end if;
   end process;


   process (count, n_data_q)
      variable stdVec2: std_logic_vector(1 downto 0);
   begin
      (riscnode(0), riscnode(1)) <= std_logic_vector'("00");

-- --------------------------------------------------------------------------
-- IOBLOCK
-- --------------------------------------------------------------------------
--   riscnode1=GND;
--   case count[2..0] is
--       WHEN 7 => riscnode0=n_data7;
--       WHEN 6 => riscnode0=n_data6;
--       WHEN 5 => riscnode0=n_data5;
--       WHEN 4 => riscnode0=n_data4;
--       WHEN 3 => riscnode0=n_data3;
--       WHEN 2 => riscnode0=n_data2;
--       WHEN 1 => riscnode0=n_data1;
--       WHEN 0 => riscnode0=n_data0;
      stdVec2 := count(2 downto 1);
      case stdVec2 is
      when "11" =>
	 riscnode(0) <= n_data_q(7);
	 riscnode(1) <= n_data_q(3);
      when "10" =>
	 riscnode(0) <= n_data_q(6);
	 riscnode(1) <= n_data_q(2);
      when "01" =>
	 riscnode(0) <= n_data_q(5);
	 riscnode(1) <= n_data_q(1);
      when "00" =>
	 riscnode(0) <= n_data_q(4);
	 riscnode(1) <= n_data_q(0);
      when others =>
      end case;
      stdVec2 := (others=>'0');  -- no storage needed
   end process;


   process (riscview, riscnode, rcrt_border, colorram_q, videonode)
      variable stdVec3: std_logic_vector(2 downto 0);
   begin
      colortab_address <= std_logic_vector'("------");
      if (riscview)='1' then
	 stdVec3 := std_logic_vector'(rcrt_border & riscnode);
	 case stdVec3 is
	 when "000" =>

-- 25;
	    colortab_address <= "000011";
	 when "001" =>

-- 0;
	    colortab_address <= "010100";
	 when "010" =>

-- 15;
--           WHEN 3 => colortab.address[5..0]=X"1C";--3;
	    colortab_address <= "001110";
	 when others =>

-- 3;
--       IF  riscnode AND NOT rcrt.border THEN
--           colortab.address[5..0]=B"001010";       --gelb
--       ELSE
--           colortab.address[5..0]=B"000100";       --blau
--       END IF;
	    colortab_address <= "011100";
	 end case;
	 stdVec3 := (others=>'0');  -- no storage needed
      else
	 colortab_address <= std_logic_vector'(videonode(5) & colorram_q);
      end if;
   end process;

-- n_vadr[4..0];
   colorram_wraddress <= coladr_q;
   colorram_data <= IO_Data(4 downto 0);
   colorram_wrclock <= cpuclk;
   colorram_wren <= n_clk;
   colorram_rdaddress <= videonode(4 downto 0);
   colorram_rdclock <= z16MHz;
   colortab_clock <= not z16MHz;

--   colortab.address[5..0]=videonode[];
   n_video <= colortab_q;


   process (HSYNC, VSYNC, videonode, rcrt_blackb, riscview, gnd, n_video)
   begin
      video <= "0000000000000000";

--   n_video[5..0]=(gnd,videonode[4..0]);
--       if hsync OR vsync OR videonode[5] then
      if (HSYNC or VSYNC or (videonode(5) and (not riscview)) or (rcrt_blackb
	    and riscview))='1' then
	 video <= "0000000000000000";
      else
	 video <= std_logic_vector'(n_video(1) & n_video(0) & n_video(0) &
	       n_video(0) & n_video(0) & n_video(3) & n_video(2) & n_video(2) &
	       n_video(2) & n_video(2) & gnd & n_video(5) & n_video(4) &
	       n_video(4) & n_video(4) & n_video(4));
      end if;
   end process;
   MF2_clrn_ctrl <= reset;
   ROMENA <= MF_q(3 downto 2);
   MF0_clk_ctrl <= cpuclk;
   coladr0_clk_ctrl <= cpuclk;


   process (IO_Adr, IOWR, IO_Data, vcc)
   begin
      MF_ena <= "0000";
      MF_d <= "0000";
      coladr_ena <= "00000";
      coladr_d <= "00000";
      n_clk <= '0';
      if (not (IO_Adr(7) or IOWR))='1' then

-- coloradresse
	 if IO_Data(7 downto 6) = "00" then
	    coladr_d <= IO_Data(4 downto 0);
	    coladr_ena <= sizeIt(vcc,5);
	 end if;

-- colorwert
	 if IO_Data(7 downto 6) = "01" then
	    n_clk <= vcc;
	 end if;
	 if IO_Data(7 downto 6) = "10" then

-- ROM & MODE
	    MF_d <= IO_Data(3 downto 0);

--   ELSE
--       n_vadr[]=videonode[4..0];
	    MF_ena <= sizeIt(vcc,4);
	 end if;
      end if;
   end process;

-- Signals given default values
   OUT_B(0) <= vcc;
   OUT_B(1) <= vcc;
   OUT_B(2) <= vcc;
   OUT_B(3) <= vcc;
   OUT_B(4) <= vcc;
   OUT_B(5) <= vcc;
   OUT_B(6) <= vcc;
   OUT_B(7) <= vcc;

-- Define power signal(s)
   vcc <= '1';
   gnd <= '0';
end Ioblock_behav;
