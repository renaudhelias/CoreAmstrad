-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: ay8912.tdf
-- VHDL Design Output: ay8912.vhd
-- Created 16-Jan-2011 04:00 PM
--
-- Copyright (c) 2011, Xilinx, Inc.  All Rights Reserved.
-- Xilinx Inc makes no warranty, expressed or implied, with respect to
-- the operation and/or functionality of the converted output files.
-- 


--  C-One reconfigurable computer
--  http://c64upgra.de/c-one/
--  Subdesign C-One
--  Copyright (c) 2005 Tobias Gubener
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
entity ay8912 is

-- H-aktiv
--   chanA[7..0]                 :OUTPUT;
--   chanB[7..0]                 :OUTPUT;
--   chanC[7..0]                 :OUTPUT;
   Port (
      iclk, reset, cs, bc0, bdir: in std_logic;
      rechts: buffer std_logic_vector(15 downto 0);
      links: buffer std_logic_vector(15 downto 0);
      PortAin: in std_logic_vector(7 downto 0);
      ioData: in std_logic_vector(7 downto 0);
      oData: buffer std_logic_vector(7 downto 0)
   );
end ay8912;


architecture ay8912_behav of ay8912 is

--   rechts[15..0]               :DFF;
--   links[15..0]                :DFF;
-- Reg 0,1
-- Reg 2,3
-- Reg 4,5
-- Reg 6
-- Reg 7
-- Reg 8
-- Reg 9
-- Reg 10
-- Reg 11,12
-- Reg 13
-- Reg 14
-- Reg 15
-- Reg 8log
-- Reg 9log
-- Reg 10log
--   chanA[8..0]                 :NODE;
--   chanB[8..0]                 :NODE;
--   chanC[8..0]                 :NODE;
-- teilt durch 8
   signal t_Data: std_logic_vector(7 downto 0);
   signal t_Data_in: std_logic_vector(7 downto 0);
   signal t_PortA: std_logic_vector(7 downto 0);
   signal t_PortA_in: std_logic_vector(7 downto 0);
   signal t_PortB: std_logic_vector(7 downto 0);
   signal t_PortB_in: std_logic_vector(7 downto 0);
   signal PSGReg: std_logic_vector(3 downto 0);
   signal PSGReg_d: std_logic_vector(3 downto 0);
   signal PSGReg_ena: std_logic_vector(3 downto 0);
   signal PSGReg_q: std_logic_vector(3 downto 0);
   signal APeriode: std_logic_vector(11 downto 0);
   signal APeriode_d: std_logic_vector(11 downto 0);
   signal APeriode_ena: std_logic_vector(11 downto 0);
   signal APeriode_q: std_logic_vector(11 downto 0);
   signal BPeriode: std_logic_vector(11 downto 0);
   signal BPeriode_d: std_logic_vector(11 downto 0);
   signal BPeriode_ena: std_logic_vector(11 downto 0);
   signal BPeriode_q: std_logic_vector(11 downto 0);
   signal CPeriode: std_logic_vector(11 downto 0);
   signal CPeriode_d: std_logic_vector(11 downto 0);
   signal CPeriode_ena: std_logic_vector(11 downto 0);
   signal CPeriode_q: std_logic_vector(11 downto 0);
   signal Noise: std_logic_vector(4 downto 0);
   signal Noise_d: std_logic_vector(4 downto 0);
   signal Noise_ena: std_logic_vector(4 downto 0);
   signal Noise_q: std_logic_vector(4 downto 0);
   signal enable: std_logic_vector(7 downto 0);
   signal enable_d: std_logic_vector(7 downto 0);
   signal enable_ena: std_logic_vector(7 downto 0);
   signal enable_q: std_logic_vector(7 downto 0);
   signal AVol: std_logic_vector(4 downto 0);
   signal AVol_d: std_logic_vector(4 downto 0);
   signal AVol_ena: std_logic_vector(4 downto 0);
   signal AVol_q: std_logic_vector(4 downto 0);
   signal BVol: std_logic_vector(4 downto 0);
   signal BVol_d: std_logic_vector(4 downto 0);
   signal BVol_ena: std_logic_vector(4 downto 0);
   signal BVol_q: std_logic_vector(4 downto 0);
   signal CVol: std_logic_vector(4 downto 0);
   signal CVol_d: std_logic_vector(4 downto 0);
   signal CVol_ena: std_logic_vector(4 downto 0);
   signal CVol_q: std_logic_vector(4 downto 0);
   signal HPeriode: std_logic_vector(15 downto 0);
   signal HPeriode_d: std_logic_vector(15 downto 0);
   signal HPeriode_ena: std_logic_vector(15 downto 0);
   signal HPeriode_q: std_logic_vector(15 downto 0);
   signal HKurve: std_logic_vector(3 downto 0);
   signal HKurve_d: std_logic_vector(3 downto 0);
   signal HKurve_ena: std_logic_vector(3 downto 0);
   signal HKurve_q: std_logic_vector(3 downto 0);
   signal PortA: std_logic_vector(7 downto 0);
   signal PortA_d: std_logic_vector(7 downto 0);
   signal PortA_ena: std_logic_vector(7 downto 0);
   signal PortA_q: std_logic_vector(7 downto 0);
   signal PortB: std_logic_vector(7 downto 0);
   signal PortB_d: std_logic_vector(7 downto 0);
   signal PortB_ena: std_logic_vector(7 downto 0);
   signal PortB_q: std_logic_vector(7 downto 0);
   signal AVollog: std_logic_vector(7 downto 0);
   signal AVollog_d: std_logic_vector(7 downto 0);
   signal AVollog_ena: std_logic_vector(7 downto 0);
   signal AVollog_q: std_logic_vector(7 downto 0);
   signal BVollog: std_logic_vector(7 downto 0);
   signal BVollog_d: std_logic_vector(7 downto 0);
   signal BVollog_ena: std_logic_vector(7 downto 0);
   signal BVollog_q: std_logic_vector(7 downto 0);
   signal CVollog: std_logic_vector(7 downto 0);
   signal CVollog_d: std_logic_vector(7 downto 0);
   signal CVollog_ena: std_logic_vector(7 downto 0);
   signal CVollog_q: std_logic_vector(7 downto 0);
   signal HVollog: std_logic_vector(7 downto 0);
   signal HVollog_d: std_logic_vector(7 downto 0);
   signal HVollog_q: std_logic_vector(7 downto 0);
   signal ACount: std_logic_vector(11 downto 0);
   signal ACount_d: std_logic_vector(11 downto 0);
   signal ACount_q: std_logic_vector(11 downto 0);
   signal chanA: std_logic_vector(8 downto 0);
   signal chanA_d: std_logic_vector(8 downto 0);
   signal chanA_q: std_logic_vector(8 downto 0);
   signal BCount: std_logic_vector(11 downto 0);
   signal BCount_d: std_logic_vector(11 downto 0);
   signal BCount_q: std_logic_vector(11 downto 0);
   signal chanB: std_logic_vector(8 downto 0);
   signal chanB_d: std_logic_vector(8 downto 0);
   signal chanB_q: std_logic_vector(8 downto 0);
   signal CCount: std_logic_vector(11 downto 0);
   signal CCount_d: std_logic_vector(11 downto 0);
   signal CCount_q: std_logic_vector(11 downto 0);
   signal chanC: std_logic_vector(8 downto 0);
   signal chanC_d: std_logic_vector(8 downto 0);
   signal chanC_q: std_logic_vector(8 downto 0);
   signal NCount: std_logic_vector(4 downto 0);
   signal NCount_d: std_logic_vector(4 downto 0);
   signal NCount_q: std_logic_vector(4 downto 0);
   signal HCount: std_logic_vector(15 downto 0);
   signal HCount_d: std_logic_vector(15 downto 0);
   signal HCount_q: std_logic_vector(15 downto 0);
   signal HVol: std_logic_vector(4 downto 0);
   signal HVol_d: std_logic_vector(4 downto 0);
   signal HVol_ena: std_logic_vector(4 downto 0);
   signal HVol_q: std_logic_vector(4 downto 0);
   signal nHVol: std_logic_vector(3 downto 0);
   signal RNG: std_logic_vector(16 downto 0);
   signal RNG_d: std_logic_vector(16 downto 0);
   signal RNG_ena: std_logic_vector(16 downto 0);
   signal RNG_q: std_logic_vector(16 downto 0);
   signal T16: std_logic_vector(7 downto 0);
   signal T16_d: std_logic_vector(7 downto 0);
   signal T16_q: std_logic_vector(7 downto 0);
   signal n_Pegel: std_logic_vector(7 downto 0);
   signal enable0_clk_ctrl, T160_clk_ctrl, ACount0_clk_ctrl, BCount0_clk_ctrl,
	 CCount0_clk_ctrl, HCount0_clk_ctrl, HVol0_clk_ctrl, HVollog0_clk_ctrl,
	 RNG0_clk_ctrl, NCount0_clk_ctrl, chanA0_clk_ctrl, chanB0_clk_ctrl,
	 chanC0_clk_ctrl, t_PortA0_oe_ctrl, t_PortB0_oe_ctrl, t_Data0_oe_ctrl,
	 ACount0_clrn_ctrl, BCount0_clrn_ctrl, CCount0_clrn_ctrl,
	 chanA0_clrn_ctrl, chanB0_clrn_ctrl, chanC0_clrn_ctrl, HVol0_clrn_ctrl,
	 HCount0_clrn_ctrl, enable7_d_2, enable7_d_1, enable6_d_2, enable6_d_1,
	 enable5_d_2, enable5_d_1, enable4_d_2, enable4_d_1, enable3_d_2,
	 enable3_d_1, enable2_d_2, enable2_d_1, enable1_d_2, enable1_d_1,
	 enable0_d_2, enable0_d_1, AVollog7_ena_2, AVollog7_ena_1,
	 AVollog6_ena_2, AVollog6_ena_1, AVollog5_ena_2, AVollog5_ena_1,
	 AVollog4_ena_2, AVollog4_ena_1, AVollog3_ena_2, AVollog3_ena_1,
	 AVollog2_ena_2, AVollog2_ena_1, AVollog1_ena_2, AVollog1_ena_1,
	 AVollog0_ena_2, AVollog0_ena_1, BVollog7_ena_2, BVollog7_ena_1,
	 BVollog6_ena_2, BVollog6_ena_1, BVollog5_ena_2, BVollog5_ena_1,
	 BVollog4_ena_2, BVollog4_ena_1, BVollog3_ena_2, BVollog3_ena_1,
	 BVollog2_ena_2, BVollog2_ena_1, BVollog1_ena_2, BVollog1_ena_1,
	 BVollog0_ena_2, BVollog0_ena_1, CVollog7_ena_2, CVollog7_ena_1,
	 CVollog6_ena_2, CVollog6_ena_1, CVollog5_ena_2, CVollog5_ena_1,
	 CVollog4_ena_2, CVollog4_ena_1, CVollog3_ena_2, CVollog3_ena_1,
	 CVollog2_ena_2, CVollog2_ena_1, CVollog1_ena_2, CVollog1_ena_1,
	 CVollog0_ena_2, CVollog0_ena_1, gnd, vcc, n_setreg, Cnot_q, Cnot_ena,
	 Cnot_clrn, Cnot_clk, Cnot_d, Cnot, Bnot_q, Bnot_ena, Bnot_clrn,
	 Bnot_clk, Bnot_d, Bnot, Anot_q, Anot_ena, Anot_clrn, Anot_clk, Anot_d,
	 Anot, Noisebit, HStart, HXor, Hclk, vclk: std_logic;

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

-- Tristate Section
   t_PortB(0) <= t_PortB_in(0) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(1) <= t_PortB_in(1) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(2) <= t_PortB_in(2) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(3) <= t_PortB_in(3) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(4) <= t_PortB_in(4) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(5) <= t_PortB_in(5) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(6) <= t_PortB_in(6) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortB(7) <= t_PortB_in(7) when t_PortB0_oe_ctrl='1' else 'Z';
   t_PortA(0) <= t_PortA_in(0) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(1) <= t_PortA_in(1) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(2) <= t_PortA_in(2) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(3) <= t_PortA_in(3) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(4) <= t_PortA_in(4) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(5) <= t_PortA_in(5) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(6) <= t_PortA_in(6) when t_PortA0_oe_ctrl='1' else 'Z';
   t_PortA(7) <= t_PortA_in(7) when t_PortA0_oe_ctrl='1' else 'Z';
   t_Data(0) <= t_Data_in(0) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(1) <= t_Data_in(1) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(2) <= t_Data_in(2) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(3) <= t_Data_in(3) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(4) <= t_Data_in(4) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(5) <= t_Data_in(5) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(6) <= t_Data_in(6) when t_Data0_oe_ctrl='1' else 'Z';
   t_Data(7) <= t_Data_in(7) when t_Data0_oe_ctrl='1' else 'Z';

-- Register Section

   process (PSGReg_ena, PSGReg_d) begin
      if PSGReg_ena(3)='1' then
	 PSGReg_q(3) <= PSGReg_d(3);
      end if;
   end process;

   process (PSGReg_ena, PSGReg_d) begin
      if PSGReg_ena(2)='1' then
	 PSGReg_q(2) <= PSGReg_d(2);
      end if;
   end process;

   process (PSGReg_ena, PSGReg_d) begin
      if PSGReg_ena(1)='1' then
	 PSGReg_q(1) <= PSGReg_d(1);
      end if;
   end process;

   process (PSGReg_ena, PSGReg_d) begin
      if PSGReg_ena(0)='1' then
	 PSGReg_q(0) <= PSGReg_d(0);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(11)='1' then
	 APeriode_q(11) <= APeriode_d(11);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(10)='1' then
	 APeriode_q(10) <= APeriode_d(10);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(9)='1' then
	 APeriode_q(9) <= APeriode_d(9);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(8)='1' then
	 APeriode_q(8) <= APeriode_d(8);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(7)='1' then
	 APeriode_q(7) <= APeriode_d(7);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(6)='1' then
	 APeriode_q(6) <= APeriode_d(6);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(5)='1' then
	 APeriode_q(5) <= APeriode_d(5);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(4)='1' then
	 APeriode_q(4) <= APeriode_d(4);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(3)='1' then
	 APeriode_q(3) <= APeriode_d(3);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(2)='1' then
	 APeriode_q(2) <= APeriode_d(2);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(1)='1' then
	 APeriode_q(1) <= APeriode_d(1);
      end if;
   end process;

   process (APeriode_ena, APeriode_d) begin
      if APeriode_ena(0)='1' then
	 APeriode_q(0) <= APeriode_d(0);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(11)='1' then
	 BPeriode_q(11) <= BPeriode_d(11);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(10)='1' then
	 BPeriode_q(10) <= BPeriode_d(10);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(9)='1' then
	 BPeriode_q(9) <= BPeriode_d(9);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(8)='1' then
	 BPeriode_q(8) <= BPeriode_d(8);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(7)='1' then
	 BPeriode_q(7) <= BPeriode_d(7);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(6)='1' then
	 BPeriode_q(6) <= BPeriode_d(6);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(5)='1' then
	 BPeriode_q(5) <= BPeriode_d(5);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(4)='1' then
	 BPeriode_q(4) <= BPeriode_d(4);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(3)='1' then
	 BPeriode_q(3) <= BPeriode_d(3);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(2)='1' then
	 BPeriode_q(2) <= BPeriode_d(2);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(1)='1' then
	 BPeriode_q(1) <= BPeriode_d(1);
      end if;
   end process;

   process (BPeriode_ena, BPeriode_d) begin
      if BPeriode_ena(0)='1' then
	 BPeriode_q(0) <= BPeriode_d(0);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(11)='1' then
	 CPeriode_q(11) <= CPeriode_d(11);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(10)='1' then
	 CPeriode_q(10) <= CPeriode_d(10);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(9)='1' then
	 CPeriode_q(9) <= CPeriode_d(9);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(8)='1' then
	 CPeriode_q(8) <= CPeriode_d(8);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(7)='1' then
	 CPeriode_q(7) <= CPeriode_d(7);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(6)='1' then
	 CPeriode_q(6) <= CPeriode_d(6);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(5)='1' then
	 CPeriode_q(5) <= CPeriode_d(5);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(4)='1' then
	 CPeriode_q(4) <= CPeriode_d(4);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(3)='1' then
	 CPeriode_q(3) <= CPeriode_d(3);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(2)='1' then
	 CPeriode_q(2) <= CPeriode_d(2);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(1)='1' then
	 CPeriode_q(1) <= CPeriode_d(1);
      end if;
   end process;

   process (CPeriode_ena, CPeriode_d) begin
      if CPeriode_ena(0)='1' then
	 CPeriode_q(0) <= CPeriode_d(0);
      end if;
   end process;

   process (Noise_ena, Noise_d) begin
      if Noise_ena(4)='1' then
	 Noise_q(4) <= Noise_d(4);
      end if;
   end process;

   process (Noise_ena, Noise_d) begin
      if Noise_ena(3)='1' then
	 Noise_q(3) <= Noise_d(3);
      end if;
   end process;

   process (Noise_ena, Noise_d) begin
      if Noise_ena(2)='1' then
	 Noise_q(2) <= Noise_d(2);
      end if;
   end process;

   process (Noise_ena, Noise_d) begin
      if Noise_ena(1)='1' then
	 Noise_q(1) <= Noise_d(1);
      end if;
   end process;

   process (Noise_ena, Noise_d) begin
      if Noise_ena(0)='1' then
	 Noise_q(0) <= Noise_d(0);
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(7)='1' then
	    enable_q(7) <= enable_d(7);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(6)='1' then
	    enable_q(6) <= enable_d(6);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(5)='1' then
	    enable_q(5) <= enable_d(5);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(4)='1' then
	    enable_q(4) <= enable_d(4);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(3)='1' then
	    enable_q(3) <= enable_d(3);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(2)='1' then
	    enable_q(2) <= enable_d(2);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(1)='1' then
	    enable_q(1) <= enable_d(1);
	 end if;
      end if;
   end process;

   process (enable0_clk_ctrl) begin
      if enable0_clk_ctrl'event and enable0_clk_ctrl='1' then
	 if enable_ena(0)='1' then
	    enable_q(0) <= enable_d(0);
	 end if;
      end if;
   end process;

   process (AVol_ena, AVol_d) begin
      if AVol_ena(4)='1' then
	 AVol_q(4) <= AVol_d(4);
      end if;
   end process;

   process (AVol_ena, AVol_d) begin
      if AVol_ena(3)='1' then
	 AVol_q(3) <= AVol_d(3);
      end if;
   end process;

   process (AVol_ena, AVol_d) begin
      if AVol_ena(2)='1' then
	 AVol_q(2) <= AVol_d(2);
      end if;
   end process;

   process (AVol_ena, AVol_d) begin
      if AVol_ena(1)='1' then
	 AVol_q(1) <= AVol_d(1);
      end if;
   end process;

   process (AVol_ena, AVol_d) begin
      if AVol_ena(0)='1' then
	 AVol_q(0) <= AVol_d(0);
      end if;
   end process;

   process (BVol_ena, BVol_d) begin
      if BVol_ena(4)='1' then
	 BVol_q(4) <= BVol_d(4);
      end if;
   end process;

   process (BVol_ena, BVol_d) begin
      if BVol_ena(3)='1' then
	 BVol_q(3) <= BVol_d(3);
      end if;
   end process;

   process (BVol_ena, BVol_d) begin
      if BVol_ena(2)='1' then
	 BVol_q(2) <= BVol_d(2);
      end if;
   end process;

   process (BVol_ena, BVol_d) begin
      if BVol_ena(1)='1' then
	 BVol_q(1) <= BVol_d(1);
      end if;
   end process;

   process (BVol_ena, BVol_d) begin
      if BVol_ena(0)='1' then
	 BVol_q(0) <= BVol_d(0);
      end if;
   end process;

   process (CVol_ena, CVol_d) begin
      if CVol_ena(4)='1' then
	 CVol_q(4) <= CVol_d(4);
      end if;
   end process;

   process (CVol_ena, CVol_d) begin
      if CVol_ena(3)='1' then
	 CVol_q(3) <= CVol_d(3);
      end if;
   end process;

   process (CVol_ena, CVol_d) begin
      if CVol_ena(2)='1' then
	 CVol_q(2) <= CVol_d(2);
      end if;
   end process;

   process (CVol_ena, CVol_d) begin
      if CVol_ena(1)='1' then
	 CVol_q(1) <= CVol_d(1);
      end if;
   end process;

   process (CVol_ena, CVol_d) begin
      if CVol_ena(0)='1' then
	 CVol_q(0) <= CVol_d(0);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(15)='1' then
	 HPeriode_q(15) <= HPeriode_d(15);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(14)='1' then
	 HPeriode_q(14) <= HPeriode_d(14);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(13)='1' then
	 HPeriode_q(13) <= HPeriode_d(13);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(12)='1' then
	 HPeriode_q(12) <= HPeriode_d(12);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(11)='1' then
	 HPeriode_q(11) <= HPeriode_d(11);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(10)='1' then
	 HPeriode_q(10) <= HPeriode_d(10);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(9)='1' then
	 HPeriode_q(9) <= HPeriode_d(9);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(8)='1' then
	 HPeriode_q(8) <= HPeriode_d(8);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(7)='1' then
	 HPeriode_q(7) <= HPeriode_d(7);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(6)='1' then
	 HPeriode_q(6) <= HPeriode_d(6);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(5)='1' then
	 HPeriode_q(5) <= HPeriode_d(5);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(4)='1' then
	 HPeriode_q(4) <= HPeriode_d(4);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(3)='1' then
	 HPeriode_q(3) <= HPeriode_d(3);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(2)='1' then
	 HPeriode_q(2) <= HPeriode_d(2);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(1)='1' then
	 HPeriode_q(1) <= HPeriode_d(1);
      end if;
   end process;

   process (HPeriode_ena, HPeriode_d) begin
      if HPeriode_ena(0)='1' then
	 HPeriode_q(0) <= HPeriode_d(0);
      end if;
   end process;

   process (HKurve_ena, HKurve_d) begin
      if HKurve_ena(3)='1' then
	 HKurve_q(3) <= HKurve_d(3);
      end if;
   end process;

   process (HKurve_ena, HKurve_d) begin
      if HKurve_ena(2)='1' then
	 HKurve_q(2) <= HKurve_d(2);
      end if;
   end process;

   process (HKurve_ena, HKurve_d) begin
      if HKurve_ena(1)='1' then
	 HKurve_q(1) <= HKurve_d(1);
      end if;
   end process;

   process (HKurve_ena, HKurve_d) begin
      if HKurve_ena(0)='1' then
	 HKurve_q(0) <= HKurve_d(0);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(7)='1' then
	 PortA_q(7) <= PortA_d(7);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(6)='1' then
	 PortA_q(6) <= PortA_d(6);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(5)='1' then
	 PortA_q(5) <= PortA_d(5);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(4)='1' then
	 PortA_q(4) <= PortA_d(4);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(3)='1' then
	 PortA_q(3) <= PortA_d(3);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(2)='1' then
	 PortA_q(2) <= PortA_d(2);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(1)='1' then
	 PortA_q(1) <= PortA_d(1);
      end if;
   end process;

   process (PortA_ena, PortA_d) begin
      if PortA_ena(0)='1' then
	 PortA_q(0) <= PortA_d(0);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(7)='1' then
	 PortB_q(7) <= PortB_d(7);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(6)='1' then
	 PortB_q(6) <= PortB_d(6);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(5)='1' then
	 PortB_q(5) <= PortB_d(5);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(4)='1' then
	 PortB_q(4) <= PortB_d(4);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(3)='1' then
	 PortB_q(3) <= PortB_d(3);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(2)='1' then
	 PortB_q(2) <= PortB_d(2);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(1)='1' then
	 PortB_q(1) <= PortB_d(1);
      end if;
   end process;

   process (PortB_ena, PortB_d) begin
      if PortB_ena(0)='1' then
	 PortB_q(0) <= PortB_d(0);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(7)='1' then
	 AVollog_q(7) <= AVollog_d(7);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(6)='1' then
	 AVollog_q(6) <= AVollog_d(6);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(5)='1' then
	 AVollog_q(5) <= AVollog_d(5);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(4)='1' then
	 AVollog_q(4) <= AVollog_d(4);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(3)='1' then
	 AVollog_q(3) <= AVollog_d(3);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(2)='1' then
	 AVollog_q(2) <= AVollog_d(2);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(1)='1' then
	 AVollog_q(1) <= AVollog_d(1);
      end if;
   end process;

   process (AVollog_ena, AVollog_d) begin
      if AVollog_ena(0)='1' then
	 AVollog_q(0) <= AVollog_d(0);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(7)='1' then
	 BVollog_q(7) <= BVollog_d(7);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(6)='1' then
	 BVollog_q(6) <= BVollog_d(6);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(5)='1' then
	 BVollog_q(5) <= BVollog_d(5);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(4)='1' then
	 BVollog_q(4) <= BVollog_d(4);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(3)='1' then
	 BVollog_q(3) <= BVollog_d(3);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(2)='1' then
	 BVollog_q(2) <= BVollog_d(2);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(1)='1' then
	 BVollog_q(1) <= BVollog_d(1);
      end if;
   end process;

   process (BVollog_ena, BVollog_d) begin
      if BVollog_ena(0)='1' then
	 BVollog_q(0) <= BVollog_d(0);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(7)='1' then
	 CVollog_q(7) <= CVollog_d(7);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(6)='1' then
	 CVollog_q(6) <= CVollog_d(6);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(5)='1' then
	 CVollog_q(5) <= CVollog_d(5);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(4)='1' then
	 CVollog_q(4) <= CVollog_d(4);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(3)='1' then
	 CVollog_q(3) <= CVollog_d(3);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(2)='1' then
	 CVollog_q(2) <= CVollog_d(2);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(1)='1' then
	 CVollog_q(1) <= CVollog_d(1);
      end if;
   end process;

   process (CVollog_ena, CVollog_d) begin
      if CVollog_ena(0)='1' then
	 CVollog_q(0) <= CVollog_d(0);
      end if;
   end process;

   process (HVollog0_clk_ctrl) begin
      if HVollog0_clk_ctrl'event and HVollog0_clk_ctrl='1' then
	 HVollog_q <= HVollog_d;
      end if;
   end process;

   process (ACount0_clk_ctrl, ACount0_clrn_ctrl) begin
      if ACount0_clrn_ctrl='0' then
	 ACount_q <= std_logic_vector'("000000000000");
      elsif ACount0_clk_ctrl'event and ACount0_clk_ctrl='1' then
	 ACount_q <= ACount_d;
      end if;
   end process;

   process (chanA0_clk_ctrl, chanA0_clrn_ctrl) begin
      if chanA0_clrn_ctrl='0' then
	 chanA_q <= std_logic_vector'("000000000");
      elsif chanA0_clk_ctrl'event and chanA0_clk_ctrl='1' then
	 chanA_q <= chanA_d;
      end if;
   end process;

   process (BCount0_clk_ctrl, BCount0_clrn_ctrl) begin
      if BCount0_clrn_ctrl='0' then
	 BCount_q <= std_logic_vector'("000000000000");
      elsif BCount0_clk_ctrl'event and BCount0_clk_ctrl='1' then
	 BCount_q <= BCount_d;
      end if;
   end process;

   process (chanB0_clk_ctrl, chanB0_clrn_ctrl) begin
      if chanB0_clrn_ctrl='0' then
	 chanB_q <= std_logic_vector'("000000000");
      elsif chanB0_clk_ctrl'event and chanB0_clk_ctrl='1' then
	 chanB_q <= chanB_d;
      end if;
   end process;

   process (CCount0_clk_ctrl, CCount0_clrn_ctrl) begin
      if CCount0_clrn_ctrl='0' then
	 CCount_q <= std_logic_vector'("000000000000");
      elsif CCount0_clk_ctrl'event and CCount0_clk_ctrl='1' then
	 CCount_q <= CCount_d;
      end if;
   end process;

   process (chanC0_clk_ctrl, chanC0_clrn_ctrl) begin
      if chanC0_clrn_ctrl='0' then
	 chanC_q <= std_logic_vector'("000000000");
      elsif chanC0_clk_ctrl'event and chanC0_clk_ctrl='1' then
	 chanC_q <= chanC_d;
      end if;
   end process;

   process (NCount0_clk_ctrl) begin
      if NCount0_clk_ctrl'event and NCount0_clk_ctrl='1' then
	 NCount_q <= NCount_d;
      end if;
   end process;

   process (HCount0_clk_ctrl, HCount0_clrn_ctrl) begin
      if HCount0_clrn_ctrl='0' then
	 HCount_q <= std_logic_vector'("0000000000000000");
      elsif HCount0_clk_ctrl'event and HCount0_clk_ctrl='1' then
	 HCount_q <= HCount_d;
      end if;
   end process;

   process (HVol0_clk_ctrl, HVol0_clrn_ctrl) begin
      if HVol0_clrn_ctrl='0' then
	 HVol_q(4) <= '0';
      elsif HVol0_clk_ctrl'event and HVol0_clk_ctrl='1' then
	 if HVol_ena(4)='1' then
	    HVol_q(4) <= HVol_d(4);
	 end if;
      end if;
   end process;

   process (HVol0_clk_ctrl, HVol0_clrn_ctrl) begin
      if HVol0_clrn_ctrl='0' then
	 HVol_q(3) <= '0';
      elsif HVol0_clk_ctrl'event and HVol0_clk_ctrl='1' then
	 if HVol_ena(3)='1' then
	    HVol_q(3) <= HVol_d(3);
	 end if;
      end if;
   end process;

   process (HVol0_clk_ctrl, HVol0_clrn_ctrl) begin
      if HVol0_clrn_ctrl='0' then
	 HVol_q(2) <= '0';
      elsif HVol0_clk_ctrl'event and HVol0_clk_ctrl='1' then
	 if HVol_ena(2)='1' then
	    HVol_q(2) <= HVol_d(2);
	 end if;
      end if;
   end process;

   process (HVol0_clk_ctrl, HVol0_clrn_ctrl) begin
      if HVol0_clrn_ctrl='0' then
	 HVol_q(1) <= '0';
      elsif HVol0_clk_ctrl'event and HVol0_clk_ctrl='1' then
	 if HVol_ena(1)='1' then
	    HVol_q(1) <= HVol_d(1);
	 end if;
      end if;
   end process;

   process (HVol0_clk_ctrl, HVol0_clrn_ctrl) begin
      if HVol0_clrn_ctrl='0' then
	 HVol_q(0) <= '0';
      elsif HVol0_clk_ctrl'event and HVol0_clk_ctrl='1' then
	 if HVol_ena(0)='1' then
	    HVol_q(0) <= HVol_d(0);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(16)='1' then
	    RNG_q(16) <= RNG_d(16);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(15)='1' then
	    RNG_q(15) <= RNG_d(15);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(14)='1' then
	    RNG_q(14) <= RNG_d(14);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(13)='1' then
	    RNG_q(13) <= RNG_d(13);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(12)='1' then
	    RNG_q(12) <= RNG_d(12);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(11)='1' then
	    RNG_q(11) <= RNG_d(11);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(10)='1' then
	    RNG_q(10) <= RNG_d(10);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(9)='1' then
	    RNG_q(9) <= RNG_d(9);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(8)='1' then
	    RNG_q(8) <= RNG_d(8);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(7)='1' then
	    RNG_q(7) <= RNG_d(7);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(6)='1' then
	    RNG_q(6) <= RNG_d(6);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(5)='1' then
	    RNG_q(5) <= RNG_d(5);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(4)='1' then
	    RNG_q(4) <= RNG_d(4);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(3)='1' then
	    RNG_q(3) <= RNG_d(3);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(2)='1' then
	    RNG_q(2) <= RNG_d(2);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(1)='1' then
	    RNG_q(1) <= RNG_d(1);
	 end if;
      end if;
   end process;

   process (RNG0_clk_ctrl) begin
      if RNG0_clk_ctrl'event and RNG0_clk_ctrl='1' then
	 if RNG_ena(0)='1' then
	    RNG_q(0) <= RNG_d(0);
	 end if;
      end if;
   end process;

   process (Anot_clk, Anot_clrn) begin
      if Anot_clrn='0' then
	 Anot_q <= '0';
      elsif Anot_clk'event and Anot_clk='1' then
	 if Anot_ena='1' then
	    Anot_q <= Anot_d;
	 end if;
      end if;
   end process;

   process (Bnot_clk, Bnot_clrn) begin
      if Bnot_clrn='0' then
	 Bnot_q <= '0';
      elsif Bnot_clk'event and Bnot_clk='1' then
	 if Bnot_ena='1' then
	    Bnot_q <= Bnot_d;
	 end if;
      end if;
   end process;

   process (Cnot_clk, Cnot_clrn) begin
      if Cnot_clrn='0' then
	 Cnot_q <= '0';
      elsif Cnot_clk'event and Cnot_clk='1' then
	 if Cnot_ena='1' then
	    Cnot_q <= Cnot_d;
	 end if;
      end if;
   end process;

   process (T160_clk_ctrl) begin
      if T160_clk_ctrl'event and T160_clk_ctrl='1' then
	 T16_q <= T16_d;
      end if;
   end process;

-- Start of original equations
   enable0_clk_ctrl <= iclk;

--   mono[]=(B"00",chanA[])+(B"00",chanB[])+(B"00",chanC[]);
--   mono[]=(B"0", RNG[0], B"000000000");
--   rechts[]=(B"0",(chanA[],B"000000")+(B"0",chanB[],B"00000"));
--   links[]= (B"0",(chanC[],B"000000")+(B"0",chanB[],B"00000"));
--   rechts[]=(chanA[],B"0000000");
--   links[]= (chanC[],B"0000000");
--   rechts[]=(H"8000"+(chanA[8],chanA[8],chanA[],B"00000")+(chanB[8],chanB[8],chanB[8],chanB[],B"0000"));
--   links[]= (H"8000"+(chanC[8],chanC[8],chanC[],B"00000")+(chanB[8],chanB[8],chanB[8],chanB[],B"0000"));
   rechts <= std_logic_vector'((unsigned'("0100000000000000") +
	 unsigned(std_logic_vector'(chanA_q(8) & chanA_q(8) & chanA_q(8) &
	 chanA_q & "0000"))) + unsigned(std_logic_vector'(chanB_q(8) &
	 chanB_q(8) & chanB_q(8) & chanB_q(8) & chanB_q & "000")));
   links <= std_logic_vector'((unsigned'("0100000000000000") +
	 unsigned(std_logic_vector'(chanC_q(8) & chanC_q(8) & chanC_q(8) &
	 chanC_q & "0000"))) + unsigned(std_logic_vector'(chanB_q(8) &
	 chanB_q(8) & chanB_q(8) & chanB_q(8) & chanB_q & "000")));
   t_PortA_in <= PortA_q;
   t_PortB_in <= PortB_q;
   PortA_d <= ioData;
   PortB_d <= ioData;
   PSGReg_d <= ioData(3 downto 0);
   (enable7_d_1, enable6_d_1, enable5_d_1, enable4_d_1, enable3_d_1,
	 enable2_d_1, enable1_d_1, enable0_d_1) <= ioData xor "00111111";
   APeriode_d(7 downto 0) <= ioData;
   APeriode_d(11 downto 8) <= ioData(3 downto 0);
   BPeriode_d(7 downto 0) <= ioData;
   BPeriode_d(11 downto 8) <= ioData(3 downto 0);
   CPeriode_d(7 downto 0) <= ioData;
   CPeriode_d(11 downto 8) <= ioData(3 downto 0);
   Noise_d <= ioData(4 downto 0);
   AVol_d <= ioData(4 downto 0);
   BVol_d <= ioData(4 downto 0);
   CVol_d <= ioData(4 downto 0);
   HPeriode_d(7 downto 0) <= ioData;
   HPeriode_d(15 downto 8) <= ioData;
   HKurve_d <= ioData(3 downto 0);

--   (PortA[], PortB[], enable[]).clk=iclk;
--   (APeriode[], BPeriode[],CPeriode[], Noise[], AVol[], BVol[], CVol[], HPeriode[], HKurve[]).clk=iclk;
--   (AVollog[], BVollog[], CVollog[]).clk=iclk;
   T160_clk_ctrl <= iclk;
   T16_d <= std_logic_vector'(unsigned(T16_q) + unsigned'("00000001"));
   vclk <= T16_q(2);
   Hclk <= T16_q(3);
   ACount0_clk_ctrl <= vclk;
   Anot_clk <= vclk;
   BCount0_clk_ctrl <= vclk;
   Bnot_clk <= vclk;
   CCount0_clk_ctrl <= vclk;
   Cnot_clk <= vclk;
   HCount0_clk_ctrl <= Hclk;
   HVol0_clk_ctrl <= Hclk;
   HVollog0_clk_ctrl <= vclk;
   RNG0_clk_ctrl <= vclk;
   NCount0_clk_ctrl <= vclk;
   chanA0_clk_ctrl <= vclk;
   chanB0_clk_ctrl <= vclk;
   chanC0_clk_ctrl <= vclk;
   t_PortA0_oe_ctrl <= enable_q(6);
   t_PortB0_oe_ctrl <= enable_q(7);

--   t_Data[7..0].oe=bc0 AND cs AND NOT bdir;
   t_Data0_oe_ctrl <= bc0 and (not bdir);
   oData <= t_Data;

--   (PortA[], PortB[], enable[]).clrn=reset;
--   (APeriode[], BPeriode[],CPeriode[], Noise[], AVol[], BVol[], CVol[], HPeriode[], HKurve[]).clrn=reset;
--   (AVollog[], BVollog[], CVollog[]).clrn=reset;
   ACount0_clrn_ctrl <= reset;
   Anot_clrn <= reset;
   BCount0_clrn_ctrl <= reset;
   Bnot_clrn <= reset;
   CCount0_clrn_ctrl <= reset;
   Cnot_clrn <= reset;
   chanA0_clrn_ctrl <= reset;
   chanB0_clrn_ctrl <= reset;
   chanC0_clrn_ctrl <= reset;
   n_setreg <= bdir and cs and (not bc0);


   process (reset, vcc, bc0, bdir, cs, PSGReg_q, APeriode_q, BPeriode_q,
	 CPeriode_q, Noise_q, enable_q, AVol_q, BVol_q, ioData, gnd, CVol_q,
	 HPeriode_q, n_setreg, HKurve_q, PortAin, PortB_q)
      variable stdVec4: std_logic_vector(3 downto 0);
   begin
      t_Data_in <= "00000000";
      HKurve_ena <= "0000";
      (HPeriode_ena(7), HPeriode_ena(6), HPeriode_ena(5), HPeriode_ena(4),
	    HPeriode_ena(3), HPeriode_ena(2), HPeriode_ena(1), HPeriode_ena(0),
	    HPeriode_ena(15), HPeriode_ena(14), HPeriode_ena(13),
	    HPeriode_ena(12), HPeriode_ena(11), HPeriode_ena(10),
	    HPeriode_ena(9), HPeriode_ena(8)) <=
	    std_logic_vector'("0000000000000000");
      CVol_ena <= "00000";
      BVol_ena <= "00000";
      AVol_ena <= "00000";
      enable_ena <= "00000000";
      Noise_ena <= "00000";
      (CPeriode_ena(7), CPeriode_ena(6), CPeriode_ena(5), CPeriode_ena(4),
	    CPeriode_ena(3), CPeriode_ena(2), CPeriode_ena(1), CPeriode_ena(0),
	    CPeriode_ena(11), CPeriode_ena(10), CPeriode_ena(9),
	    CPeriode_ena(8)) <= std_logic_vector'("000000000000");
      (BPeriode_ena(7), BPeriode_ena(6), BPeriode_ena(5), BPeriode_ena(4),
	    BPeriode_ena(3), BPeriode_ena(2), BPeriode_ena(1), BPeriode_ena(0),
	    BPeriode_ena(11), BPeriode_ena(10), BPeriode_ena(9),
	    BPeriode_ena(8)) <= std_logic_vector'("000000000000");
      (APeriode_ena(7), APeriode_ena(6), APeriode_ena(5), APeriode_ena(4),
	    APeriode_ena(3), APeriode_ena(2), APeriode_ena(1), APeriode_ena(0),
	    APeriode_ena(11), APeriode_ena(10), APeriode_ena(9),
	    APeriode_ena(8)) <= std_logic_vector'("000000000000");
      PSGReg_ena <= "0000";
      (enable7_d_2, enable6_d_2, enable5_d_2, enable4_d_2, enable3_d_2,
	    enable2_d_2, enable1_d_2, enable0_d_2, AVollog7_ena_1,
	    AVollog6_ena_1, AVollog5_ena_1, AVollog4_ena_1, AVollog3_ena_1,
	    AVollog2_ena_1, AVollog1_ena_1, AVollog0_ena_1, BVollog7_ena_1,
	    BVollog6_ena_1, BVollog5_ena_1, BVollog4_ena_1, BVollog3_ena_1,
	    BVollog2_ena_1, BVollog1_ena_1, BVollog0_ena_1, HStart,
	    CVollog7_ena_1, CVollog6_ena_1, CVollog5_ena_1, CVollog4_ena_1,
	    CVollog3_ena_1, CVollog2_ena_1, CVollog1_ena_1, CVollog0_ena_1) <=
	    std_logic_vector'("000000000000000000000000100000000");
      if (not reset)='1' then
	 (enable7_d_2, enable6_d_2, enable5_d_2, enable4_d_2, enable3_d_2,
	       enable2_d_2, enable1_d_2, enable0_d_2) <=
	       std_logic_vector'("00000000");
	 enable_ena <= sizeIt(vcc,8);
      elsif std_logic_vector'(bdir & bc0) = "11" then
	 PSGReg_ena <= sizeIt(cs,4);
      else
	 stdVec4 := PSGReg_q;
	 case stdVec4 is
	 when "0000" =>
	    APeriode_ena(7 downto 0) <= sizeIt(n_setreg,8);
	    t_Data_in <= APeriode_q(7 downto 0);
	 when "0001" =>
	    APeriode_ena(11 downto 8) <= sizeIt(n_setreg,4);
	    t_Data_in(3 downto 0) <= APeriode_q(11 downto 8);
	 when "0010" =>
	    BPeriode_ena(7 downto 0) <= sizeIt(n_setreg,8);
	    t_Data_in <= BPeriode_q(7 downto 0);
	 when "0011" =>
	    BPeriode_ena(11 downto 8) <= sizeIt(n_setreg,4);
	    t_Data_in(3 downto 0) <= BPeriode_q(11 downto 8);
	 when "0100" =>
	    CPeriode_ena(7 downto 0) <= sizeIt(n_setreg,8);
	    t_Data_in <= CPeriode_q(7 downto 0);
	 when "0101" =>
	    CPeriode_ena(11 downto 8) <= sizeIt(n_setreg,4);
	    t_Data_in(3 downto 0) <= CPeriode_q(11 downto 8);
	 when "0110" =>
	    Noise_ena <= sizeIt(n_setreg,5);
	    t_Data_in(4 downto 0) <= Noise_q;
	 when "0111" =>
	    enable_ena <= sizeIt(n_setreg,8);
	    t_Data_in <= enable_q xor "00111111";
	 when "1000" =>
	    if (n_setreg and ioData(4))='1' then
	       HStart <= gnd;
	    end if;
	    (AVollog7_ena_1, AVollog6_ena_1, AVollog5_ena_1, AVollog4_ena_1,
		  AVollog3_ena_1, AVollog2_ena_1, AVollog1_ena_1,
		  AVollog0_ena_1) <= sizeIt(n_setreg,8);
	    AVol_ena <= sizeIt(n_setreg,5);
	    t_Data_in(4 downto 0) <= AVol_q;
	 when "1001" =>
	    if (n_setreg and ioData(4))='1' then
	       HStart <= gnd;
	    end if;
	    (BVollog7_ena_1, BVollog6_ena_1, BVollog5_ena_1, BVollog4_ena_1,
		  BVollog3_ena_1, BVollog2_ena_1, BVollog1_ena_1,
		  BVollog0_ena_1) <= sizeIt(n_setreg,8);
	    BVol_ena <= sizeIt(n_setreg,5);
	    t_Data_in(4 downto 0) <= BVol_q;
	 when "1010" =>
	    if (n_setreg and ioData(4))='1' then
	       HStart <= gnd;
	    end if;
	    (CVollog7_ena_1, CVollog6_ena_1, CVollog5_ena_1, CVollog4_ena_1,
		  CVollog3_ena_1, CVollog2_ena_1, CVollog1_ena_1,
		  CVollog0_ena_1) <= sizeIt(n_setreg,8);
	    CVol_ena <= sizeIt(n_setreg,5);
	    t_Data_in(4 downto 0) <= CVol_q;
	 when "1011" =>
	    HPeriode_ena(7 downto 0) <= sizeIt(n_setreg,8);
	    t_Data_in <= HPeriode_q(7 downto 0);
	 when "1100" =>
	    HPeriode_ena(15 downto 8) <= sizeIt(n_setreg,8);
	    t_Data_in <= HPeriode_q(15 downto 8);
	 when "1101" =>
	    HKurve_ena <= sizeIt(n_setreg,4);
	    t_Data_in(3 downto 0) <= HKurve_q;
	 when "1110" =>

--                   PortA[].ena=n_setreg;
	    t_Data_in <= PortAin;
	 when "1111" =>

--                   PortB[].ena=n_setreg;
	    t_Data_in <= PortB_q;
	 when others =>
	 end case;
	 stdVec4 := (others=>'0');  -- no storage needed
      end if;
   end process;


   process (AVol_q, HVollog_q, vcc, n_Pegel)
   begin
      AVollog_d <= "00000000";
      (AVollog7_ena_2, AVollog6_ena_2, AVollog5_ena_2, AVollog4_ena_2,
	    AVollog3_ena_2, AVollog2_ena_2, AVollog1_ena_2, AVollog0_ena_2) <=
	    std_logic_vector'("00000000");
      if (AVol_q(4))='1' then
	 AVollog_d <= HVollog_q;
	 (AVollog7_ena_2, AVollog6_ena_2, AVollog5_ena_2, AVollog4_ena_2,
	       AVollog3_ena_2, AVollog2_ena_2, AVollog1_ena_2, AVollog0_ena_2)
	       <= sizeIt(vcc,8);
      else
	 AVollog_d <= n_Pegel;
      end if;
   end process;


   process (Noisebit, enable_q, Anot_q, AVollog_q)
   begin
      chanA_d <= "000000000";

--   IF (enable[3] AND Noisebit) XOR (enable[0] AND Anot) THEN
--       chanA[]=(GND, AVollog[]);
--   ELSE
--       chanA[]=0;
--   END IF;
      if (enable_q(3) or enable_q(0))='1' then
	 if ((enable_q(3) and Noisebit) xor (enable_q(0) and Anot_q))='1' then
	    chanA_d <= std_logic_vector'('0' & AVollog_q);
	 else
	    chanA_d <= std_logic_vector'(unsigned'("000000000") -
		  unsigned(std_logic_vector'('0' & AVollog_q)));
	 end if;
      else
	 chanA_d <= "000000000";
      end if;
   end process;


   process (Anot_q, APeriode_q, vcc, ACount_q)
   begin
      ACount_d <= "000000000000";
      (Anot_d, Anot_ena) <= std_logic_vector'("00");
      if (unsigned(ACount_q) >= unsigned(APeriode_q)) then
	 ACount_d <= "000000000001";

--       Anot=NOT Anot AND(APeriode[] > 8);
	 Anot_d <= to_std_logic(((not Anot_q)='1') and APeriode_q /=
	       "000000000000");
	 Anot_ena <= vcc;
      else
	 ACount_d <= std_logic_vector'(unsigned(ACount_q) +
	       unsigned'("000000000001"));
      end if;
   end process;


   process (BVol_q, HVollog_q, vcc, n_Pegel)
   begin
      BVollog_d <= "00000000";
      (BVollog7_ena_2, BVollog6_ena_2, BVollog5_ena_2, BVollog4_ena_2,
	    BVollog3_ena_2, BVollog2_ena_2, BVollog1_ena_2, BVollog0_ena_2) <=
	    std_logic_vector'("00000000");
      if (BVol_q(4))='1' then
	 BVollog_d <= HVollog_q;
	 (BVollog7_ena_2, BVollog6_ena_2, BVollog5_ena_2, BVollog4_ena_2,
	       BVollog3_ena_2, BVollog2_ena_2, BVollog1_ena_2, BVollog0_ena_2)
	       <= sizeIt(vcc,8);
      else
	 BVollog_d <= n_Pegel;
      end if;
   end process;


   process (Noisebit, enable_q, Bnot_q, BVollog_q, gnd)
   begin
      chanB_d <= "000000000";

--   IF (enable[4] AND Noisebit) XOR (enable[1] AND Bnot) THEN
--       chanB[]=(GND, BVollog[]);
--   ELSE
--       chanB[]=0;
--   END IF;
      if (enable_q(4) or enable_q(1))='1' then
	 if ((enable_q(4) and Noisebit) xor (enable_q(1) and Bnot_q))='1' then
	    chanB_d <= std_logic_vector'(gnd & BVollog_q);
	 else
	    chanB_d <= std_logic_vector'(unsigned'("000000000") -
		  unsigned(std_logic_vector'(gnd & BVollog_q)));
	 end if;
      else
	 chanB_d <= "000000000";
      end if;
   end process;


   process (Bnot_q, BPeriode_q, vcc, BCount_q)
   begin
      BCount_d <= "000000000000";
      (Bnot_d, Bnot_ena) <= std_logic_vector'("00");
      if (unsigned(BCount_q) >= unsigned(BPeriode_q)) then
	 BCount_d <= "000000000001";

--       Bnot=NOT Bnot AND(BPeriode[] > 8);
	 Bnot_d <= to_std_logic(((not Bnot_q)='1') and BPeriode_q /=
	       "000000000000");
	 Bnot_ena <= vcc;
      else
	 BCount_d <= std_logic_vector'(unsigned(BCount_q) +
	       unsigned'("000000000001"));
      end if;
   end process;


   process (CVol_q, HVollog_q, vcc, n_Pegel)
   begin
      CVollog_d <= "00000000";
      (CVollog7_ena_2, CVollog6_ena_2, CVollog5_ena_2, CVollog4_ena_2,
	    CVollog3_ena_2, CVollog2_ena_2, CVollog1_ena_2, CVollog0_ena_2) <=
	    std_logic_vector'("00000000");
      if (CVol_q(4))='1' then
	 CVollog_d <= HVollog_q;
	 (CVollog7_ena_2, CVollog6_ena_2, CVollog5_ena_2, CVollog4_ena_2,
	       CVollog3_ena_2, CVollog2_ena_2, CVollog1_ena_2, CVollog0_ena_2)
	       <= sizeIt(vcc,8);
      else
	 CVollog_d <= n_Pegel;
      end if;
   end process;


   process (Noisebit, enable_q, Cnot_q, CVollog_q, gnd)
   begin
      chanC_d <= "000000000";

--   IF (enable[5] AND Noisebit) XOR (enable[2] AND Cnot) THEN
--       chanC[]=(GND, CVollog[]);
--   ELSE
--       chanC[]=0;
--   END IF;
      if (enable_q(5) or enable_q(2))='1' then
	 if ((enable_q(5) and Noisebit) xor (enable_q(2) and Cnot_q))='1' then
	    chanC_d <= std_logic_vector'(gnd & CVollog_q);
	 else
	    chanC_d <= std_logic_vector'(unsigned'("000000000") -
		  unsigned(std_logic_vector'(gnd & CVollog_q)));
	 end if;
      else
	 chanC_d <= "000000000";
      end if;
   end process;


   process (Cnot_q, CPeriode_q, vcc, CCount_q)
   begin
      CCount_d <= "000000000000";
      (Cnot_d, Cnot_ena) <= std_logic_vector'("00");
      if (unsigned(CCount_q) >= unsigned(CPeriode_q)) then
	 CCount_d <= "000000000001";

--       Cnot=NOT Cnot AND(CPeriode[] >8 );
	 Cnot_d <= to_std_logic(((not Cnot_q)='1') and CPeriode_q /=
	       "000000000000");
	 Cnot_ena <= vcc;
      else
	 CCount_d <= std_logic_vector'(unsigned(CCount_q) +
	       unsigned'("000000000001"));
      end if;
   end process;
   RNG_d <= std_logic_vector'((not (RNG_q(0) xor RNG_q(2))) & RNG_q(16 downto
	 1));

--   RNG[]=((RNG[0] XOR RNG[2]) OR RNG[]==0, RNG[16..1]);
--   RNG[18..0]=(NOT (RNG[0] XOR RNG[2]), RNG[18..1]); --sehr gut
--   RNG[18..0]=(NOT (RNG[0] XOR RNG[5]), RNG[18..1]); --sehr gut
--  AND (Noise[]!=0);
   Noisebit <= RNG_q(0);


   process (Noise_q, NCount_q)
   begin
      NCount_d <= "00000";
      RNG_ena <= "00000000000000000";
      if (unsigned(NCount_q) >= unsigned(Noise_q)) then
	 NCount_d <= "00001";
	 RNG_ena <= sizeIt(to_std_logic(Noise_q /= "00000"),17);
      else
	 NCount_d <= std_logic_vector'(unsigned(NCount_q) +
	       unsigned'("00001"));
      end if;
   end process;


   process (HVol_q, HKurve_q, HPeriode_q, HCount_q)
   begin
      HCount_d <= "0000000000000000";
      HVol_ena <= "00000";
      if (unsigned(HCount_q) >= unsigned(HPeriode_q)) then
	 HCount_d <= "0000000000000001";

--       HVol[].ena=(NOT HVol[4] OR (NOT HKurve[0] AND HKurve[3]));   --HOLD
-- HOLD
	 HVol_ena <= (sizeIt(not HVol_q(4),5) or (sizeIt(not HKurve_q(0),5) and
	       sizeIt(HKurve_q(3),5))) and sizeIt(to_std_logic(HPeriode_q /=
	       "0000000000000000"),5);
      else
	 HCount_d <= std_logic_vector'(unsigned(HCount_q) +
	       unsigned'("0000000000000001"));
      end if;
   end process;

--   (HVol[], HCount[]).clrn=AVol[4] OR BVol[4] OR CVol[4];
   HVol0_clrn_ctrl <= HStart;
   HCount0_clrn_ctrl <= HStart;
   HVol_d <= std_logic_vector'(unsigned(HVol_q) + unsigned'("00001"));
   nHVol <= HVol_q(3 downto 0) xor std_logic_vector'(HXor & HXor & HXor &
	 HXor);
   HXor <= (HKurve_q(3) or (not HVol_q(4))) and ((not HKurve_q(2)) xor
	 ((HKurve_q(1) xor HKurve_q(0)) and HVol_q(4)));


   process (nHVol)
   begin
      HVollog_d <= "00000000";
      if nHVol = "1111" then

--  Umsetzung in logarithmische Werte in ca. 3dB Schritten
	 HVollog_d <= "11111111";
      elsif nHVol = "1110" then

--  für Hüllkurve
	 HVollog_d <= "10110101";
      elsif nHVol = "1101" then
	 HVollog_d <= "10000000";
      elsif nHVol = "1100" then
	 HVollog_d <= "01011011";
      elsif nHVol = "1011" then
	 HVollog_d <= "01000000";
      elsif nHVol = "1010" then
	 HVollog_d <= "00101101";
      elsif nHVol = "1001" then
	 HVollog_d <= "00100000";
      elsif nHVol = "1000" then
	 HVollog_d <= "00010111";
      elsif nHVol = "0111" then
	 HVollog_d <= "00010000";
      elsif nHVol = "0110" then
	 HVollog_d <= "00001011";
      elsif nHVol = "0101" then
	 HVollog_d <= "00001000";
      elsif nHVol = "0100" then
	 HVollog_d <= "00000101";
      elsif nHVol = "0011" then
	 HVollog_d <= "00000011";
      elsif nHVol = "0010" then
	 HVollog_d <= "00000010";
      elsif nHVol = "0001" then
	 HVollog_d <= "00000001";
      elsif nHVol = "0000" then
	 HVollog_d <= "00000000";
      end if;
   end process;


   process (ioData)
   begin
      n_Pegel <= "00000000";
      if ioData(3 downto 0) = "1111" then

--  Umsetzung in logarithmische Werte in ca. 3dB Schritten
	 n_Pegel <= "11111111";
      elsif ioData(3 downto 0) = "1110" then

--  für kanäle
	 n_Pegel <= "10110101";
      elsif ioData(3 downto 0) = "1101" then
	 n_Pegel <= "10000000";
      elsif ioData(3 downto 0) = "1100" then
	 n_Pegel <= "01011011";
      elsif ioData(3 downto 0) = "1011" then
	 n_Pegel <= "01000000";
      elsif ioData(3 downto 0) = "1010" then
	 n_Pegel <= "00101101";
      elsif ioData(3 downto 0) = "1001" then
	 n_Pegel <= "00100000";
      elsif ioData(3 downto 0) = "1000" then
	 n_Pegel <= "00010111";
      elsif ioData(3 downto 0) = "0111" then
	 n_Pegel <= "00010000";
      elsif ioData(3 downto 0) = "0110" then
	 n_Pegel <= "00001011";
      elsif ioData(3 downto 0) = "0101" then
	 n_Pegel <= "00001000";
      elsif ioData(3 downto 0) = "0100" then
	 n_Pegel <= "00000101";
      elsif ioData(3 downto 0) = "0011" then
	 n_Pegel <= "00000011";
      elsif ioData(3 downto 0) = "0010" then
	 n_Pegel <= "00000010";
      elsif ioData(3 downto 0) = "0001" then
	 n_Pegel <= "00000001";
      elsif ioData(3 downto 0) = "0000" then
	 n_Pegel <= "00000000";
      end if;
   end process;


-- Assignments added to explicitly combine the
-- effects of multiple drivers in the source
   CVollog_ena(0) <= CVollog0_ena_1 or CVollog0_ena_2;
   CVollog_ena(1) <= CVollog1_ena_1 or CVollog1_ena_2;
   CVollog_ena(2) <= CVollog2_ena_1 or CVollog2_ena_2;
   CVollog_ena(3) <= CVollog3_ena_1 or CVollog3_ena_2;
   CVollog_ena(4) <= CVollog4_ena_1 or CVollog4_ena_2;
   CVollog_ena(5) <= CVollog5_ena_1 or CVollog5_ena_2;
   CVollog_ena(6) <= CVollog6_ena_1 or CVollog6_ena_2;
   CVollog_ena(7) <= CVollog7_ena_1 or CVollog7_ena_2;
   BVollog_ena(0) <= BVollog0_ena_1 or BVollog0_ena_2;
   BVollog_ena(1) <= BVollog1_ena_1 or BVollog1_ena_2;
   BVollog_ena(2) <= BVollog2_ena_1 or BVollog2_ena_2;
   BVollog_ena(3) <= BVollog3_ena_1 or BVollog3_ena_2;
   BVollog_ena(4) <= BVollog4_ena_1 or BVollog4_ena_2;
   BVollog_ena(5) <= BVollog5_ena_1 or BVollog5_ena_2;
   BVollog_ena(6) <= BVollog6_ena_1 or BVollog6_ena_2;
   BVollog_ena(7) <= BVollog7_ena_1 or BVollog7_ena_2;
   AVollog_ena(0) <= AVollog0_ena_1 or AVollog0_ena_2;
   AVollog_ena(1) <= AVollog1_ena_1 or AVollog1_ena_2;
   AVollog_ena(2) <= AVollog2_ena_1 or AVollog2_ena_2;
   AVollog_ena(3) <= AVollog3_ena_1 or AVollog3_ena_2;
   AVollog_ena(4) <= AVollog4_ena_1 or AVollog4_ena_2;
   AVollog_ena(5) <= AVollog5_ena_1 or AVollog5_ena_2;
   AVollog_ena(6) <= AVollog6_ena_1 or AVollog6_ena_2;
   AVollog_ena(7) <= AVollog7_ena_1 or AVollog7_ena_2;
   enable_d(0) <= enable0_d_1 or enable0_d_2;
   enable_d(1) <= enable1_d_1 or enable1_d_2;
   enable_d(2) <= enable2_d_1 or enable2_d_2;
   enable_d(3) <= enable3_d_1 or enable3_d_2;
   enable_d(4) <= enable4_d_1 or enable4_d_2;
   enable_d(5) <= enable5_d_1 or enable5_d_2;
   enable_d(6) <= enable6_d_1 or enable6_d_2;
   enable_d(7) <= enable7_d_1 or enable7_d_2;

-- Signals given default values
   PortB_ena(0) <= gnd;
   PortB_ena(1) <= gnd;
   PortB_ena(2) <= gnd;
   PortB_ena(3) <= gnd;
   PortB_ena(4) <= gnd;
   PortB_ena(5) <= gnd;
   PortB_ena(6) <= gnd;
   PortB_ena(7) <= gnd;
   PortA_ena(0) <= gnd;
   PortA_ena(1) <= gnd;
   PortA_ena(2) <= gnd;
   PortA_ena(3) <= gnd;
   PortA_ena(4) <= gnd;
   PortA_ena(5) <= gnd;
   PortA_ena(6) <= gnd;
   PortA_ena(7) <= gnd;

-- Define power signal(s)
   vcc <= '1';
   gnd <= '0';
end ay8912_behav;
