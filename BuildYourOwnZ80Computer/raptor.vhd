----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:30:31 05/08/2011 
-- Design Name: 
-- Module Name:    raptor - Behavioral 
-- Project Name: 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity raptor is
    Port ( cpc_CLK : in  STD_LOGIC_vector(2 downto 0);
           cpc_M1_n : in  STD_LOGIC;
           cpc_WAIT_n : in  STD_LOGIC;
           cpc_INT_n : in  STD_LOGIC;
           cpc_SYNC : in  STD_LOGIC;
			  ram_D: inout STD_LOGIC_VECTOR (7 downto 0);
			  ram_W:out std_logic:='0';
			  ram_A:out std_logic_VECTOR (22 downto 0);
           LEDS : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0')
			  );
end raptor;

architecture Behavioral of raptor is

	--signal addr:std_logic_vector(10 downto 0):=(others=>'0');
	--signal we:std_logic:='0';
	--signal data_out:std_logic_vector(7 downto 0);
	--signal data_in:std_logic_vector(7 downto 0);
	--signal parity:std_logic_vector(0 downto 0);
--	signal interrupt_decoupler:std_logic:='0';
begin


--
--RAMB16_S9_inst : RAMB16_S9
--port map (
--   DO => ram_D,      -- 8-bit Data Output
--   DOP => open,    -- 1-bit parity Output
--   ADDR => addr,  -- 11-bit Address Input
--   CLK => cpc_CLK, --not(cpc_CLK),    -- Clock peut-être not(cpc_CLK)
--   DI => data_in,      -- 8-bit Data Input
--   DIP => parity,    -- 1-bit parity Input
--   EN => '1',      -- RAM Enable Input
--   SSR => '0',    -- Synchronous Set/Reset Input
--   WE => we       -- Write Enable Input
--);
--data_in<=cpc_M1_n & cpc_WAIT_n & cpc_INT_n & cpc_SYNC & "0000";
--parity(0)<=cpc_M1_n xor cpc_WAIT_n xor cpc_INT_n xor cpc_SYNC xor '0' xor '0' xor '0' xor '0';


--	process(cpc_INT_n)
--		variable interrupting:std_logic:='0';
--	begin
--		if rising_edge(cpc_INT_n) then
--			interrupting:=not(interrupting);
--			interrupt_decoupler<=interrupting;
--		end if;
--	end process;

	process(cpc_CLK(0))
		variable compteur:std_logic_vector(27 downto 0):=(others=>'0');
		--variable mem_full:boolean:=false;
		--variable mem_transmit_done:boolean:=false;
		--variable compteur_transmit:std_logic_vector(11 downto 0):=(others=>'0');
		--variable data_to_write:std_logic_vector(7 downto 0);
		--variable was_10:boolean:=false;
		variable data:std_logic_vector(7 downto 0):=(others=>'0');
		variable started:boolean:=false;
	begin
		if rising_edge(cpc_CLK(0)) then
						
			if compteur(23)='1' then
				started:=false; -- finished
				LEDS<="11011011";
			elsif cpc_CLK(2 downto 1)="00" then
				started:=true;
			end if;
			
			if started then
				LEDS<=compteur(27 downto 27-7);
				if cpc_CLK(2 downto 1)="00" then
					ram_A<=compteur(22 downto 0);
					data:=cpc_M1_n & cpc_WAIT_n & cpc_INT_n & cpc_SYNC & "0000";
					ram_D<=data;
				elsif cpc_CLK(2 downto 1)="01" then
					ram_W<='1';
				elsif cpc_CLK(2 downto 1)="10" then
					ram_W<='0';
				elsif cpc_CLK(2 downto 1)="11" then
					compteur:=compteur+1;
				end if;
				
			end if;
--			
--			compteur:=compteur+1;
--			if compteur(11)='1' then
--				mem_full:=true;
--			end if;
--			we<='0';
--			--ram_W<='0';
--			if not(mem_full) then
--				LEDS<=compteur(27 downto 27-7);
--				we<='1';
--				addr<=compteur(10 downto 0);
--				--data_to_write:=cpc_M1_n & cpc_WAIT_n & cpc_INT_n & cpc_SYNC & "0000";
--				--data_to_write:=compteur(7 downto 0);
--				--data<=data_to_write;
--				--parity(0)<=data_to_write(0) xor data_to_write(1) xor data_to_write(2) xor data_to_write(3) xor data_to_write(4) xor data_to_write(5) xor data_to_write(6) xor data_to_write(7);
--			elsif not(mem_transmit_done) then
--				LEDS<=compteur(27 downto 27-7);
--				if compteur(5 downto 4)="00" then
--					addr<=compteur_transmit(10 downto 0);
--					ram_A<=x"00" & "000" & compteur_transmit;
--					--ram_D<=compteur_transmit(7 downto 0);
--				elsif compteur(5 downto 4)="01" then
--					ram_W<='1'; -- peut-être hachuré par clk de RAM interne
--				elsif compteur(5 downto 4)="10"  then
--					ram_W<='0';
--					was_10:=true;
--				elsif compteur(5 downto 4)="11" then
--					if was_10 then
--						compteur_transmit:=compteur_transmit+1;
--						was_10:=false;
--					end if;
--					if compteur_transmit(11)='1' then
--						mem_transmit_done:=true;
--					end if;
--				end if;
--			else
--				LEDS<="11100111";
--			end if;
		end if;
	end process;

end Behavioral;

