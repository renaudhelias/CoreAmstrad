--    {@{@{@{@{@{@
--  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r004
--  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
--  {@{@{@{@{@{@{@{@
--  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
--  {@{@        {@{@   Contact : renaudhelias@gmail.com
--  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
--    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
--
--
--------------------------------------------------------------------------------
-- FPGAmstrad_amstrad_motherboard.PWM patched for luxurious output quality
-- clk : a big clock, upper than dog sound frequency, here 17MHz
-- clk_ref : clock matching with PWM_in data, here YM2149.CLK (Yamaha chip clock)
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- http://www.fpga4fun.com/PWM_DAC.html

entity PWM is
  port (
   clk : in std_logic;
   clk_ref : in std_logic;
   PWM_in : in std_logic_vector (7 downto 0) := "00000000";
   PWM_out : out std_logic
  );
end PWM;

architecture PWM_arch of PWM is
  signal  PWM_Accumulator : std_logic_vector(8 downto 0):=(others=>'0'); -- sim XXXXXXXXX
  signal PWM_iRef:std_logic_vector(7 downto 0);
  signal PWM_i:std_logic_vector(7 downto 0);
begin

  process(clk_ref)
	variable PWM_mem : std_logic_vector(7 downto 0):=x"00";
  begin
		if rising_edge(clk_ref) then
			PWM_mem:=PWM_in;
			PWM_iRef<=PWM_mem;
		end if;
  end process;

  process(clk)
	variable PWM_mem : std_logic_vector(7 downto 0):=x"00";
  begin
		if rising_edge(clk) then
			PWM_mem:=PWM_iRef;
			PWM_i<=PWM_mem;
		end if;
  end process;


  process(clk)
  begin
		if rising_edge(clk) then
			PWM_Accumulator  <=  ("0" & PWM_Accumulator(7 downto 0)) + ("0" & PWM_i);
		end if;
  end process;

  PWM_out <= PWM_Accumulator(8);
end PWM_arch;
