--------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Joerg Wolfram
--
-- Create Date:    	04.03.2007
-- Design Name:    
-- Module Name:    	mctest example
-- Project Name: 	fbas_encoder	
-- Target Device:  	XC9536 
-- Tool versions:  
-- Description:		PAL/NTSC-FBAS generator 
--
-- Revision:		0.31
-- License:		GPL
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mctest is
-------------------------------------------------------------------------------
--- io
-------------------------------------------------------------------------------
port (
	sysclk:	in std_logic;			
	cpuclk:	inout std_logic;
	red,green,blue:	in std_logic;
	cgsel:		in std_logic;
	hsync,vsync:	in std_logic;
	luma:		out std_logic_vector(4 downto 0);
	chroma:		out std_logic_vector(1 downto 0);
	fbh,fbl:	out std_logic);
	
end entity mctest;

architecture main of mctest is
-------------------------------------------------------------------------------
--- the chroma and luma signal generator components
-------------------------------------------------------------------------------
component chroma_gen is
    port (
	cg_clock:	in std_logic;				--- clock
	cg_enable:	in std_logic;				--- colour enable
	cg_hsync:	in std_logic;				--- hor. sync
	cg_pnsel:	in std_logic;				--- mode select
	cg_rgb:		in std_logic_vector(2 downto 0);	--- rgb input
	cg_out:		out std_logic_vector(2 downto 0));	--- chroma out
end component chroma_gen;

for all:chroma_gen use entity chroma_gen(clock32);

component luma_gen is
    port (
	lg_clock:	in std_logic;				--- clock
	lg_hsync:	in std_logic;				--- colour enable
	lg_vsync:	in std_logic;				--- pal/ntsc mode	
	lg_rgb:		in std_logic_vector(2 downto 0);	--- rgb input
	lg_out:		out std_logic_vector(4 downto 0));	--- luma out
end component luma_gen;

-------------------------------------------------------------------------------
--- internal signals
-------------------------------------------------------------------------------
signal	rgb_int:	std_logic_vector(2 downto 0);		--- rgb internal
signal 	chroma_int:	std_logic_vector(2 downto 0);		--- chroma internal

begin
-------------------------------------------------------------------------------
--- static signals for chroma generation	
-------------------------------------------------------------------------------
	fbh <= '1';
	fbl <= '0';

-------------------------------------------------------------------------------
--- clock divider	
-------------------------------------------------------------------------------
    process (sysclk) is
    begin
	if (rising_edge(sysclk)) then
	    cpuclk <= not(cpuclk);
	end if;
    end process;

-------------------------------------------------------------------------------
--- store rgb signal	
-------------------------------------------------------------------------------
    process (cpuclk) is
    begin
	if (rising_edge(cpuclk)) then
	    rgb_int(0) <= blue;
	    rgb_int(1) <= red;
	    rgb_int(2) <= green;
	end if;
    end process;

-------------------------------------------------------------------------------
--- chroma generation
-------------------------------------------------------------------------------
    I1: chroma_gen port map(
	cg_clock   => sysclk,
	cg_rgb     => rgb_int,
	cg_hsync   => hsync,
	cg_enable  => cgsel,
	cg_pnsel   => '0',
	cg_out     => chroma_int
	);

-------------------------------------------------------------------------------
--- luma generation
-------------------------------------------------------------------------------
    I2: luma_gen port map(
	lg_clock => cpuclk,
	lg_rgb   => rgb_int,
	lg_hsync => hsync,
	lg_vsync => vsync,
	lg_out   => luma
	);

-------------------------------------------------------------------------------
--- chroma burstlevel output
-------------------------------------------------------------------------------
    process (chroma_int) is
    begin
	if (chroma_int(1)='0') then
	    chroma(0) <= 'Z';
	else
	    chroma(0) <= chroma_int(0);
	end if;    
    end process;

-------------------------------------------------------------------------------
--- chroma colourlevel output
-------------------------------------------------------------------------------
    process (chroma_int) is
    begin
	if (chroma_int(2)='0') then
	    chroma(1) <= 'Z';
	else
	    chroma(1) <= chroma_int(0);
	end if;    
    end process;

-------------------------------------------------------------------------------
--- minimal configuration
-------------------------------------------------------------------------------
end architecture main;

configuration main of mctest is
    for main
    end for;
end configuration main;


