--------------------------------------------------------------------
-- Company: XESS Corp.
-- Engineer: Dave Vanden Bout
--
-- Create Date: 10:39:20 05/21/2006
-- Design Name: design3
-- Module Name: scancodereg - Behavioral
-- Project Name: design3
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity scancodereg is
	generic(
		CLKFREQ : natural := 4_000;--50_000; -- main clock freq (KHz)
		PSCLKFREQ : natural := 10 -- keyboard clock freq (KHz)
	);
	port(
		clk : in std_logic; -- main clock
		rst : in std_logic; -- reset
		psClk : in std_logic; -- keyboard clock
		psData : in std_logic; -- keyboard data
		scancode : out std_logic_vector(7 downto 0); -- key scancode
		rdy : out std_logic; -- true when scancode is ready
		rdy_begin : out std_logic -- true when scancode is ready
	);
end scancodereg;
architecture Behavioral of scancodereg is
	signal sc_r : std_logic_vector(9 downto 0); -- scancode shift reg
	constant TIMEOUT : natural := CLKFREQ/PSCLKFREQ; -- psClk quiet timeout
	signal cnt_r : natural range 0 to TIMEOUT; -- timeout counter
	signal scRdy_r : std_logic; -- scan code is ready flag
	signal rdy_r : std_logic:='0'; -- output scan code is ready flag
	signal rdy_begin_r : std_logic:='0'; -- by freemac xD
	signal keyrel_r : std_logic:='0'; -- key has been released flag
	constant KEYRELEASE : std_logic_vector(7 downto 0) := "11110000";
	
begin
	-- this process gathers the keybrd scancode into the shift register
	process(psClk, rst)
	begin
		-- async. reset of scancode ready flag
		if rst = '1' then
			sc_r <= (others => '0');
			-- accept keyboard data on falling edge of keyboard clock
		elsif falling_edge(psClk) then
			-- key data arrives LSB first so right-shift it into MSB of register
			sc_r <= psData & sc_r(sc_r'high downto 1);
		end if;
	end process;
	-- key scancode is in the lower 8-bits of the shift register
	--scancode <= scancode_r; --sc_r(scancode'range); -- output scancode
	-- this process detects the end of the scancode by looking
	-- for the absence of keyboard clock pulses
	process(clk, rst)
	begin
		if rst = '1' then
			cnt_r <= 0; -- clear the timeout counter
			scRdy_r <= '0'; -- clear the scancode ready flag
		elsif rising_edge(clk) then
			scRdy_r <= '0'; -- by default, no key scancode is ready for output
			if psClk = '0' then
				-- reset the timeout register whenever the keyboard clock pulses low
				cnt_r <= 0;
			elsif cnt_r /= TIMEOUT then
				-- increment the timeout counter if the keyvoard clock is high
				-- and the counter hasn't reached the timeout value yet
				cnt_r <= cnt_r + 1;
				if cnt_r = TIMEOUT-1 then
					-- signal that a key scancode is ready when the counter is
					-- equal to one less than the timeout value
					scRdy_r <= '1'; -- rdy signal pulses for one clock period
				end if;
			end if;
		end if;
	end process;
	-- this process detects when the keyboard key is released and
	-- signals when the scancode for the released key is ready
	process(clk)
		variable scancode_r:std_logic_vector(scancode'range):=(others=>'0');
	begin
		scancode<=scancode_r;
		if rising_edge(clk) then
			
			--rdy_r <= '0'; -- by default, no key scancode is ready for output
			--rdy_begin_r <='0';
			--keyrel_r <= '0';
			if scRdy_r = '1' then
				if sc_r(7 downto 0) = x"FA" or sc_r(7 downto 0) = x"AA" or sc_r(7 downto 0) = x"EE" or sc_r(7 downto 0) = x"FE" or sc_r(7 downto 0) = x"00" or sc_r(7 downto 0) = x"FF" then
				--ignore
				-- check the scancode register when a code is ready
				elsif sc_r(7 downto 0) = KEYRELEASE then
					-- set flag if the key release prefix is detected
					keyrel_r <= '1';
				elsif sc_r(7 downto 0) = x"E0" or sc_r(7 downto 0) = x"E1" then
					--osef le paquet suivant c'est F0
				elsif keyrel_r = '1' then
					-- end up here on next scancode received after key release prefix
					rdy_r <= '1'; -- released key scancode is in the scancode register
					rdy_begin_r <='0';
					scancode_r:=sc_r(7 downto 0);
					 -- reset the key release flag
				else -- c'est une touche
					rdy_begin_r <='1';
					rdy_r <= '0';
					scancode_r:=sc_r(7 downto 0);
				end if;
			end if;
		end if;
	end process;
	rdy <= rdy_r; -- signal that a key scancode is ready
	rdy_begin <= rdy_begin_r;
end Behavioral;