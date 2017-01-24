-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Fri Dec 16 20:01:29 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cpu_top IS 
	PORT
	(
		pin_name1 :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		pin_name4 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END cpu_top;

ARCHITECTURE bdf_type OF cpu_top IS 

COMPONENT z80_top_direct_n
	PORT(nWAIT : IN STD_LOGIC;
		 nINT : IN STD_LOGIC;
		 nNMI : IN STD_LOGIC;
		 nRESET : IN STD_LOGIC;
		 nBUSRQ : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 D : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 nM1 : OUT STD_LOGIC;
		 nMREQ : OUT STD_LOGIC;
		 nIORQ : OUT STD_LOGIC;
		 nRD : OUT STD_LOGIC;
		 nWR : OUT STD_LOGIC;
		 nRFSH : OUT STD_LOGIC;
		 nHALT : OUT STD_LOGIC;
		 nBUSACK : OUT STD_LOGIC;
		 A : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';
SYNTHESIZED_WIRE_1 <= '0';
SYNTHESIZED_WIRE_2 <= '0';
SYNTHESIZED_WIRE_3 <= '0';
SYNTHESIZED_WIRE_4 <= '0';
SYNTHESIZED_WIRE_5 <= '0';



b2v_inst : z80_top_direct_n
PORT MAP(nWAIT => SYNTHESIZED_WIRE_0,
		 nINT => SYNTHESIZED_WIRE_1,
		 nNMI => SYNTHESIZED_WIRE_2,
		 nRESET => SYNTHESIZED_WIRE_3,
		 nBUSRQ => SYNTHESIZED_WIRE_4,
		 CLK => SYNTHESIZED_WIRE_5,
		 D => pin_name1,
		 A => pin_name4);
















END bdf_type;