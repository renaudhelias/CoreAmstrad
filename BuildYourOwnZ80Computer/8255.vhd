-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: 8255.tdf
-- VHDL Design Output: 8255.vhd
-- Created 16-Jan-2011 04:01 PM
--
-- Copyright (c) 2011, Xilinx, Inc.  All Rights Reserved.
-- Xilinx Inc makes no warranty, expressed or implied, with respect to
-- the operation and/or functionality of the converted output files.
-- 


-- Some names could not be written out to VHDL as they were
-- in the source, and have been changed:
--
-- AHDL  VHDL
-- ====  ====
-- 8255  z8255


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
entity z8255 is

-- Keyboarddaten
-- sounddaten
-- tastatur und steuerung
-- PCO[7] = bdir, PCO[6] = BC
   Port (
      adr: in std_logic_vector(15 downto 8);
      data: in std_logic_vector(7 downto 0);
      iowr, iord, ioclk: in std_logic;
      PBI: in std_logic_vector(7 downto 0);
      PAI: in std_logic_vector(7 downto 0);
      PAO: buffer std_logic_vector(7 downto 0);
      PCO: buffer std_logic_vector(7 downto 0);
      DO: inout std_logic_vector(7 downto 0)
   );
end z8255;


architecture z8255_behav of z8255 is
   signal PAO_d: std_logic_vector(7 downto 0);
   signal PAO_ena: std_logic_vector(7 downto 0);
   signal PAO_q: std_logic_vector(7 downto 0);
   signal PCO_d: std_logic_vector(7 downto 0);
   signal PCO_ena: std_logic_vector(7 downto 0);
   signal PCO_q: std_logic_vector(7 downto 0);
   signal t_data: std_logic_vector(7 downto 0);
   signal t_data_in: std_logic_vector(7 downto 0);
   signal t_data_oe: std_logic_vector(7 downto 0);
   signal PAO0_clk_ctrl, PCO0_clk_ctrl, PAO7_d_2, PAO7_d_1, PAO6_d_2, PAO6_d_1,
	 PAO5_d_2, PAO5_d_1, PAO4_d_2, PAO4_d_1, PAO3_d_2, PAO3_d_1, PAO2_d_2,
	 PAO2_d_1, PAO1_d_2, PAO1_d_1, PAO0_d_2, PAO0_d_1, PAO7_ena_2,
	 PAO7_ena_1, PAO6_ena_2, PAO6_ena_1, PAO5_ena_2, PAO5_ena_1,
	 PAO4_ena_2, PAO4_ena_1, PAO3_ena_2, PAO3_ena_1, PAO2_ena_2,
	 PAO2_ena_1, PAO1_ena_2, PAO1_ena_1, PAO0_ena_2, PAO0_ena_1, PCO7_d_3,
	 PCO7_d_2, PCO7_d_1, PCO6_d_3, PCO6_d_2, PCO6_d_1, PCO5_d_3, PCO5_d_2,
	 PCO5_d_1, PCO4_d_3, PCO4_d_2, PCO4_d_1, PCO3_d_3, PCO3_d_2, PCO3_d_1,
	 PCO2_d_3, PCO2_d_2, PCO2_d_1, PCO1_d_3, PCO1_d_2, PCO1_d_1, PCO0_d_3,
	 PCO0_d_2, PCO0_d_1, PCO7_ena_3, PCO7_ena_2, PCO7_ena_1, PCO6_ena_3,
	 PCO6_ena_2, PCO6_ena_1, PCO5_ena_3, PCO5_ena_2, PCO5_ena_1,
	 PCO4_ena_3, PCO4_ena_2, PCO4_ena_1, PCO3_ena_3, PCO3_ena_2,
	 PCO3_ena_1, PCO2_ena_3, PCO2_ena_2, PCO2_ena_1, PCO1_ena_3,
	 PCO1_ena_2, PCO1_ena_1, PCO0_ena_3, PCO0_ena_2, PCO0_ena_1,
	 t_data7_in_3, t_data7_in_2, t_data7_in_1, t_data6_in_3, t_data6_in_2,
	 t_data6_in_1, t_data5_in_3, t_data5_in_2, t_data5_in_1, t_data4_in_3,
	 t_data4_in_2, t_data4_in_1, t_data3_in_3, t_data3_in_2, t_data3_in_1,
	 t_data2_in_3, t_data2_in_2, t_data2_in_1, t_data1_in_3, t_data1_in_2,
	 t_data1_in_1, t_data0_in_3, t_data0_in_2, t_data0_in_1, t_data7_oe_3,
	 t_data7_oe_2, t_data7_oe_1, t_data6_oe_3, t_data6_oe_2, t_data6_oe_1,
	 t_data5_oe_3, t_data5_oe_2, t_data5_oe_1, t_data4_oe_3, t_data4_oe_2,
	 t_data4_oe_1, t_data3_oe_3, t_data3_oe_2, t_data3_oe_1, t_data2_oe_3,
	 t_data2_oe_2, t_data2_oe_1, t_data1_oe_3, t_data1_oe_2, t_data1_oe_1,
	 t_data0_oe_3, t_data0_oe_2, t_data0_oe_1, vcc: std_logic;

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
   t_data(0) <= t_data_in(0) when t_data_oe(0)='1' else 'Z';
   t_data(1) <= t_data_in(1) when t_data_oe(1)='1' else 'Z';
   t_data(2) <= t_data_in(2) when t_data_oe(2)='1' else 'Z';
   t_data(3) <= t_data_in(3) when t_data_oe(3)='1' else 'Z';
   t_data(4) <= t_data_in(4) when t_data_oe(4)='1' else 'Z';
   t_data(5) <= t_data_in(5) when t_data_oe(5)='1' else 'Z';
   t_data(6) <= t_data_in(6) when t_data_oe(6)='1' else 'Z';
   t_data(7) <= t_data_in(7) when t_data_oe(7)='1' else 'Z';

-- Register Section

   PAO(7) <= PAO_q(7);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(7)='1' then
	    PAO_q(7) <= PAO_d(7);
	 end if;
      end if;
   end process;

   PAO(6) <= PAO_q(6);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(6)='1' then
	    PAO_q(6) <= PAO_d(6);
	 end if;
      end if;
   end process;

   PAO(5) <= PAO_q(5);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(5)='1' then
	    PAO_q(5) <= PAO_d(5);
	 end if;
      end if;
   end process;

   PAO(4) <= PAO_q(4);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(4)='1' then
	    PAO_q(4) <= PAO_d(4);
	 end if;
      end if;
   end process;

   PAO(3) <= PAO_q(3);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(3)='1' then
	    PAO_q(3) <= PAO_d(3);
	 end if;
      end if;
   end process;

   PAO(2) <= PAO_q(2);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(2)='1' then
	    PAO_q(2) <= PAO_d(2);
	 end if;
      end if;
   end process;

   PAO(1) <= PAO_q(1);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(1)='1' then
	    PAO_q(1) <= PAO_d(1);
	 end if;
      end if;
   end process;

   PAO(0) <= PAO_q(0);
   process (PAO0_clk_ctrl) begin
      if PAO0_clk_ctrl'event and PAO0_clk_ctrl='1' then
	 if PAO_ena(0)='1' then
	    PAO_q(0) <= PAO_d(0);
	 end if;
      end if;
   end process;

   PCO(7) <= PCO_q(7);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(7)='1' then
	    PCO_q(7) <= PCO_d(7);
	 end if;
      end if;
   end process;

   PCO(6) <= PCO_q(6);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(6)='1' then
	    PCO_q(6) <= PCO_d(6);
	 end if;
      end if;
   end process;

   PCO(5) <= PCO_q(5);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(5)='1' then
	    PCO_q(5) <= PCO_d(5);
	 end if;
      end if;
   end process;

   PCO(4) <= PCO_q(4);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(4)='1' then
	    PCO_q(4) <= PCO_d(4);
	 end if;
      end if;
   end process;

   PCO(3) <= PCO_q(3);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(3)='1' then
	    PCO_q(3) <= PCO_d(3);
	 end if;
      end if;
   end process;

   PCO(2) <= PCO_q(2);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(2)='1' then
	    PCO_q(2) <= PCO_d(2);
	 end if;
      end if;
   end process;

   PCO(1) <= PCO_q(1);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(1)='1' then
	    PCO_q(1) <= PCO_d(1);
	 end if;
      end if;
   end process;

   PCO(0) <= PCO_q(0);
   process (PCO0_clk_ctrl) begin
      if PCO0_clk_ctrl'event and PCO0_clk_ctrl='1' then
	 if PCO_ena(0)='1' then
	    PCO_q(0) <= PCO_d(0);
	 end if;
      end if;
   end process;

-- Start of original equations
   PAO0_clk_ctrl <= ioclk;
   PCO0_clk_ctrl <= ioclk;
   DO <= t_data;


   process (adr, iowr, vcc, data)
   begin
      (PAO7_ena_1, PAO6_ena_1, PAO5_ena_1, PAO4_ena_1, PAO3_ena_1, PAO2_ena_1,
	    PAO1_ena_1, PAO0_ena_1, PAO7_d_1, PAO6_d_1, PAO5_d_1, PAO4_d_1,
	    PAO3_d_1, PAO2_d_1, PAO1_d_1, PAO0_d_1) <=
	    std_logic_vector'("0000000000000000");
      if adr = "11110100" and ((not iowr)='1') then
	 (PAO7_ena_1, PAO6_ena_1, PAO5_ena_1, PAO4_ena_1, PAO3_ena_1,
	       PAO2_ena_1, PAO1_ena_1, PAO0_ena_1) <= sizeIt(vcc,8);
	 (PAO7_d_1, PAO6_d_1, PAO5_d_1, PAO4_d_1, PAO3_d_1, PAO2_d_1, PAO1_d_1,
	       PAO0_d_1) <= data;
      end if;
   end process;


   process (adr, iord, vcc, PAI)
   begin
      (t_data7_oe_1, t_data6_oe_1, t_data5_oe_1, t_data4_oe_1, t_data3_oe_1,
	    t_data2_oe_1, t_data1_oe_1, t_data0_oe_1, t_data7_in_1,
	    t_data6_in_1, t_data5_in_1, t_data4_in_1, t_data3_in_1,
	    t_data2_in_1, t_data1_in_1, t_data0_in_1) <=
	    std_logic_vector'("0000000000000000");

-- Keyboarddaten
      if adr = "11110100" and ((not iord)='1') then
	 (t_data7_oe_1, t_data6_oe_1, t_data5_oe_1, t_data4_oe_1, t_data3_oe_1,
	       t_data2_oe_1, t_data1_oe_1, t_data0_oe_1) <= sizeIt(vcc,8);
	 (t_data7_in_1, t_data6_in_1, t_data5_in_1, t_data4_in_1, t_data3_in_1,
	       t_data2_in_1, t_data1_in_1, t_data0_in_1) <= PAI;
      end if;
   end process;


   process (adr, iord, vcc, PBI)
   begin
      (t_data7_oe_2, t_data6_oe_2, t_data5_oe_2, t_data4_oe_2, t_data3_oe_2,
	    t_data2_oe_2, t_data1_oe_2, t_data0_oe_2, t_data7_in_2,
	    t_data6_in_2, t_data5_in_2, t_data4_in_2, t_data3_in_2,
	    t_data2_in_2, t_data1_in_2, t_data0_in_2) <=
	    std_logic_vector'("0000000000000000");
      if adr = "11110101" and ((not iord)='1') then
	 (t_data7_oe_2, t_data6_oe_2, t_data5_oe_2, t_data4_oe_2, t_data3_oe_2,
	       t_data2_oe_2, t_data1_oe_2, t_data0_oe_2) <= sizeIt(vcc,8);

--       t_data[].in=(B"1",PBI[6],B"1",PBI[4],B"111",PBI[0]);
	 (t_data7_in_2, t_data6_in_2, t_data5_in_2, t_data4_in_2, t_data3_in_2,
	       t_data2_in_2, t_data1_in_2, t_data0_in_2) <=
	       std_logic_vector'("111" & PBI(4) & "111" & PBI(0));
      end if;
   end process;


   process (adr, iowr, vcc, data)
   begin
      (PCO7_ena_1, PCO6_ena_1, PCO5_ena_1, PCO4_ena_1, PCO3_ena_1, PCO2_ena_1,
	    PCO1_ena_1, PCO0_ena_1, PCO7_d_1, PCO6_d_1, PCO5_d_1, PCO4_d_1,
	    PCO3_d_1, PCO2_d_1, PCO1_d_1, PCO0_d_1) <=
	    std_logic_vector'("0000000000000000");
      if adr = "11110110" and ((not iowr)='1') then
	 (PCO7_ena_1, PCO6_ena_1, PCO5_ena_1, PCO4_ena_1, PCO3_ena_1,
	       PCO2_ena_1, PCO1_ena_1, PCO0_ena_1) <= sizeIt(vcc,8);
	 (PCO7_d_1, PCO6_d_1, PCO5_d_1, PCO4_d_1, PCO3_d_1, PCO2_d_1, PCO1_d_1,
	       PCO0_d_1) <= data;
      end if;
   end process;


   process (adr, iord, vcc, PCO_q)
   begin
      (t_data7_oe_3, t_data6_oe_3, t_data5_oe_3, t_data4_oe_3, t_data3_oe_3,
	    t_data2_oe_3, t_data1_oe_3, t_data0_oe_3, t_data7_in_3,
	    t_data6_in_3, t_data5_in_3, t_data4_in_3, t_data3_in_3,
	    t_data2_in_3, t_data1_in_3, t_data0_in_3) <=
	    std_logic_vector'("0000000000000000");
      if adr = "11110110" and ((not iord)='1') then
	 (t_data7_oe_3, t_data6_oe_3, t_data5_oe_3, t_data4_oe_3, t_data3_oe_3,
	       t_data2_oe_3, t_data1_oe_3, t_data0_oe_3) <= sizeIt(vcc,8);

-- internes Register lesen
	 (t_data7_in_3, t_data6_in_3, t_data5_in_3, t_data4_in_3, t_data3_in_3,
	       t_data2_in_3, t_data1_in_3, t_data0_in_3) <= PCO_q;
      end if;
   end process;


   process (adr, iowr, data)
   begin
      (PCO7_d_2, PCO6_d_2, PCO5_d_2, PCO4_d_2, PCO3_d_2, PCO2_d_2, PCO1_d_2,
	    PCO0_d_2, PCO0_ena_2, PCO1_ena_2, PCO2_ena_2, PCO3_ena_2,
	    PCO4_ena_2, PCO5_ena_2, PCO6_ena_2, PCO7_ena_2) <=
	    std_logic_vector'("0000000000000000");
      if (to_std_logic(adr = "11110111") and (not iowr) and (not data(7)))='1'
	    then
	 (PCO7_d_2, PCO6_d_2, PCO5_d_2, PCO4_d_2, PCO3_d_2, PCO2_d_2, PCO1_d_2,
	       PCO0_d_2) <= sizeIt(data(0),8);
	 PCO0_ena_2 <= to_std_logic(data(3 downto 1) = "000");
	 PCO1_ena_2 <= to_std_logic(data(3 downto 1) = "001");
	 PCO2_ena_2 <= to_std_logic(data(3 downto 1) = "010");
	 PCO3_ena_2 <= to_std_logic(data(3 downto 1) = "011");
	 PCO4_ena_2 <= to_std_logic(data(3 downto 1) = "100");
	 PCO5_ena_2 <= to_std_logic(data(3 downto 1) = "101");
	 PCO6_ena_2 <= to_std_logic(data(3 downto 1) = "110");
	 PCO7_ena_2 <= to_std_logic(data(3 downto 1) = "111");
      end if;
   end process;


   process (adr, iowr, data, vcc)
   begin
      (PAO7_ena_2, PAO6_ena_2, PAO5_ena_2, PAO4_ena_2, PAO3_ena_2, PAO2_ena_2,
	    PAO1_ena_2, PAO0_ena_2, PCO7_ena_3, PCO6_ena_3, PCO5_ena_3,
	    PCO4_ena_3, PCO3_ena_3, PCO2_ena_3, PCO1_ena_3, PCO0_ena_3,
	    PAO7_d_2, PAO6_d_2, PAO5_d_2, PAO4_d_2, PAO3_d_2, PAO2_d_2,
	    PAO1_d_2, PAO0_d_2, PCO7_d_3, PCO6_d_3, PCO5_d_3, PCO4_d_3,
	    PCO3_d_3, PCO2_d_3, PCO1_d_3, PCO0_d_3) <=
	    std_logic_vector'("00000000000000000000000000000000");
      if (to_std_logic(adr = "11110111") and (not iowr) and data(7))='1' then
	 (PAO7_ena_2, PAO6_ena_2, PAO5_ena_2, PAO4_ena_2, PAO3_ena_2,
	       PAO2_ena_2, PAO1_ena_2, PAO0_ena_2) <= sizeIt(vcc,8);
	 (PCO7_ena_3, PCO6_ena_3, PCO5_ena_3, PCO4_ena_3, PCO3_ena_3,
	       PCO2_ena_3, PCO1_ena_3, PCO0_ena_3) <= sizeIt(vcc,8);
	 (PAO7_d_2, PAO6_d_2, PAO5_d_2, PAO4_d_2, PAO3_d_2, PAO2_d_2, PAO1_d_2,
	       PAO0_d_2) <= std_logic_vector'("00000000");
	 (PCO7_d_3, PCO6_d_3, PCO5_d_3, PCO4_d_3, PCO3_d_3, PCO2_d_3, PCO1_d_3,
	       PCO0_d_3) <= std_logic_vector'("00000000");
      end if;
   end process;


-- Assignments added to explicitly combine the
-- effects of multiple drivers in the source
   t_data_oe(0) <= t_data0_oe_1 or t_data0_oe_2 or t_data0_oe_3;
   t_data_oe(1) <= t_data1_oe_1 or t_data1_oe_2 or t_data1_oe_3;
   t_data_oe(2) <= t_data2_oe_1 or t_data2_oe_2 or t_data2_oe_3;
   t_data_oe(3) <= t_data3_oe_1 or t_data3_oe_2 or t_data3_oe_3;
   t_data_oe(4) <= t_data4_oe_1 or t_data4_oe_2 or t_data4_oe_3;
   t_data_oe(5) <= t_data5_oe_1 or t_data5_oe_2 or t_data5_oe_3;
   t_data_oe(6) <= t_data6_oe_1 or t_data6_oe_2 or t_data6_oe_3;
   t_data_oe(7) <= t_data7_oe_1 or t_data7_oe_2 or t_data7_oe_3;
   t_data_in(0) <= t_data0_in_1 or t_data0_in_2 or t_data0_in_3;
   t_data_in(1) <= t_data1_in_1 or t_data1_in_2 or t_data1_in_3;
   t_data_in(2) <= t_data2_in_1 or t_data2_in_2 or t_data2_in_3;
   t_data_in(3) <= t_data3_in_1 or t_data3_in_2 or t_data3_in_3;
   t_data_in(4) <= t_data4_in_1 or t_data4_in_2 or t_data4_in_3;
   t_data_in(5) <= t_data5_in_1 or t_data5_in_2 or t_data5_in_3;
   t_data_in(6) <= t_data6_in_1 or t_data6_in_2 or t_data6_in_3;
   t_data_in(7) <= t_data7_in_1 or t_data7_in_2 or t_data7_in_3;
   PCO_ena(0) <= PCO0_ena_1 or PCO0_ena_2 or PCO0_ena_3;
   PCO_ena(1) <= PCO1_ena_1 or PCO1_ena_2 or PCO1_ena_3;
   PCO_ena(2) <= PCO2_ena_1 or PCO2_ena_2 or PCO2_ena_3;
   PCO_ena(3) <= PCO3_ena_1 or PCO3_ena_2 or PCO3_ena_3;
   PCO_ena(4) <= PCO4_ena_1 or PCO4_ena_2 or PCO4_ena_3;
   PCO_ena(5) <= PCO5_ena_1 or PCO5_ena_2 or PCO5_ena_3;
   PCO_ena(6) <= PCO6_ena_1 or PCO6_ena_2 or PCO6_ena_3;
   PCO_ena(7) <= PCO7_ena_1 or PCO7_ena_2 or PCO7_ena_3;
   PCO_d(0) <= PCO0_d_1 or PCO0_d_2 or PCO0_d_3;
   PCO_d(1) <= PCO1_d_1 or PCO1_d_2 or PCO1_d_3;
   PCO_d(2) <= PCO2_d_1 or PCO2_d_2 or PCO2_d_3;
   PCO_d(3) <= PCO3_d_1 or PCO3_d_2 or PCO3_d_3;
   PCO_d(4) <= PCO4_d_1 or PCO4_d_2 or PCO4_d_3;
   PCO_d(5) <= PCO5_d_1 or PCO5_d_2 or PCO5_d_3;
   PCO_d(6) <= PCO6_d_1 or PCO6_d_2 or PCO6_d_3;
   PCO_d(7) <= PCO7_d_1 or PCO7_d_2 or PCO7_d_3;
   PAO_ena(0) <= PAO0_ena_1 or PAO0_ena_2;
   PAO_ena(1) <= PAO1_ena_1 or PAO1_ena_2;
   PAO_ena(2) <= PAO2_ena_1 or PAO2_ena_2;
   PAO_ena(3) <= PAO3_ena_1 or PAO3_ena_2;
   PAO_ena(4) <= PAO4_ena_1 or PAO4_ena_2;
   PAO_ena(5) <= PAO5_ena_1 or PAO5_ena_2;
   PAO_ena(6) <= PAO6_ena_1 or PAO6_ena_2;
   PAO_ena(7) <= PAO7_ena_1 or PAO7_ena_2;
   PAO_d(0) <= PAO0_d_1 or PAO0_d_2;
   PAO_d(1) <= PAO1_d_1 or PAO1_d_2;
   PAO_d(2) <= PAO2_d_1 or PAO2_d_2;
   PAO_d(3) <= PAO3_d_1 or PAO3_d_2;
   PAO_d(4) <= PAO4_d_1 or PAO4_d_2;
   PAO_d(5) <= PAO5_d_1 or PAO5_d_2;
   PAO_d(6) <= PAO6_d_1 or PAO6_d_2;
   PAO_d(7) <= PAO7_d_1 or PAO7_d_2;

-- Define power signal(s)
   vcc <= '1';
end z8255_behav;
