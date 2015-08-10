--===========================================================================--
--                                                                           --
--  S Y N T H E S I Z A B L E    CRTC6845   C O R E                          --
--                                                                           --
--  www.opencores.org - January 2000                                         --
--  This IP core adheres to the GNU public license.                          --
--                                                                           --
--  VHDL model of MC6845 compatible CRTC                                     --
--                                                                           --
--  This model doesn't implement interlace mode. Everything else is          --
--  (probably) according to original MC6845 data sheet (except VTOTADJ).     --
--                                                                           --
--  Implementation in Xilinx Virtex XCV50-6 runs at 50 MHz (character clock).--
--  With external pixel	generator this CRTC could handle 450MHz pixel rate   --
--  (see MC6845 datasheet for typical application).	                     --
--                                                                           --
--  Author: Damjan Lampret, lampret@opencores.org                            --
--                                                                           --
--  TO DO:                                                                   --
--                                                                           --
--   - fix REG_INIT and remove non standard signals at topl level entity.    --
--     Allow fixed registers values (now set with REG_INIT). Anyway cleanup  --
--     required.                                                             --
--                                                                           --
--   - split design in four units (horizontal sync, vertical sync, bus       --
--     interface and the rest)                                               --
--                                                                           --
--   - synthesis with Synplify pending (there are some problems with         --
--     UNSIGNED and BIT_LOGIC_VECTOR types in some units !)                  --
--                                                                           --
--   - testbench                                                             --
--                                                                           --
--   - interlace mode support, extend VSYNC for V.Total Adjust value (R5)    --
--                                                                           --
--   - verification in a real application                                    --
--                                                                           --
--===========================================================================--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.math_real.all;

package CONFIG is

	-- Don't change these unless you know what you are doing.
	constant MA_WIDTH	: INTEGER	:= 14;
	constant RA_WIDTH	: INTEGER	:= 5;
	constant DB_WIDTH	: INTEGER	:= 8;
	constant AR_WIDTH	: INTEGER	:= 5;
	
	constant INDEX_HT	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"0";
	constant INDEX_HD	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"1";
	constant INDEX_HSP	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"2";
	constant INDEX_HSW	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"3";
	constant INDEX_VT	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"4";
	constant INDEX_ADJ	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"5";
	constant INDEX_VD	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"6";
	constant INDEX_VSP	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"7";
	constant INDEX_IM	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"8";
	constant INDEX_SL	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"9";
	constant INDEX_CURST	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"a";
	constant INDEX_CUREND	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"b";
	constant INDEX_SA_H	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"c";
	constant INDEX_SA_L	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"d";
	constant INDEX_CUR_H	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"e";
	constant INDEX_CUR_L	: STD_LOGIC_VECTOR (4 downto 0)	:= '0' & x"f";
	constant INDEX_LP_H	: STD_LOGIC_VECTOR (4 downto 0)	:= '1' & x"0";
	constant INDEX_LP_L	: STD_LOGIC_VECTOR (4 downto 0)	:= '1' & x"1";

	
end CONFIG;

package body CONFIG is

   -- synopsys synthesis_off
    type tbl_type is array (STD_ULOGIC) of STD_ULOGIC;
    constant tbl_BINARY : tbl_type :=
	('X', 'X', '0', '1', 'X', 'X', '0', '1', 'X');
    -- synopsys synthesis_on

  
    
end CONFIG;

