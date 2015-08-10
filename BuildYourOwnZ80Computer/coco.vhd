--coco(Behavioral)
-- =======================================================================
-- ==                                                                   ==
-- == Reçoit les trames séries                                          ==
-- == Pour clk50_in :                                                   ==
-- ==     9600 baud DATABITS_8 STOPBITS_1 PARITY_NONE FLOWCONTROL_NONE  ==
-- ==                                                                   ==
-- =======================================================================
--
--  CCC  OOO  CCC  OOO       CCC       B       T         SSS
--  C    O O  C    O O       C         B       T         S  
--  C    O O  C    O O  ===  C    U U  BB   I  TTT  U U  SSS
--  C    O O  C    O O       C    U U  B B  I  T    U U    S
--  CCC  OOO  CCC  OOO       CCC  UUU  BB   I  T    UUU  SSS
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity coco is
	generic (
			SOLO_RX : boolean := false
			);
    Port (
			tx : out std_logic;
			rx : in std_logic;
			leds : out std_logic_vector(7 downto 0);
			do_led : out std_logic:='0';
			switches : in std_logic_vector(7 downto 0);
			do_switch : in std_logic;
			CLK_50MHz : in std_logic;
			CLK_read : in std_logic;
			CLK_baud : out std_logic;
			tx_complete : out std_logic --si complete alors incremente compteur sinon retry ?
			);
end coco;

architecture Behavioral of coco is


component kcuart_rx 
    Port (      serial_in : in std_logic;  
                 data_out : out std_logic_vector(7 downto 0);
              data_strobe : out std_logic;
             en_16_x_baud : in std_logic;
                      clk : in std_logic);
    end component;

component kcuart_tx 
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
    end component;
--  component uart_rx
--    Port (            serial_in : in std_logic;
--                       data_out : out std_logic_vector(7 downto 0);
--                    read_buffer : in std_logic;
--                   reset_buffer : in std_logic;
--                   en_16_x_baud : in std_logic;
--            buffer_data_present : out std_logic;
--                    buffer_full : out std_logic;
--               buffer_half_full : out std_logic;
--                            clk : in std_logic);
--  end component;
-- Signals used to connect KCPSM3 to program ROM and I/O logic
signal out_port        : std_logic_vector(7 downto 0) := "00000000";
-- Signals for UART connections
signal          baud_count : integer range 0 to 511 :=0;
signal        en_16_x_baud : std_logic;
signal       write_to_uart : std_logic := '0';
signal             tx_full : std_logic;
signal        tx_half_full : std_logic;
signal      read_from_uart : std_logic;
signal             rx_data : std_logic_vector(7 downto 0) := "00000000";
signal     rx_data_present : std_logic :='0';
signal             rx_full : std_logic;
signal        rx_half_full : std_logic;


signal data_ready_P:std_logic:='1';
signal data_ready_V:std_logic:='0';
-- Start of circuit description

begin


 kcuart: kcuart_rx
  port map (     serial_in => rx,
                  data_out => rx_data,
               data_strobe => rx_data_present,
              en_16_x_baud => en_16_x_baud,
                       clk => CLK_50MHz );
							  
							  
--  receive: uart_rx
--  port map (            serial_in => rx,
--                         data_out => rx_data,
--                      read_buffer => '1', --read_from_uart,
--                     reset_buffer => '0',
--                     en_16_x_baud => en_16_x_baud,
--              buffer_data_present => rx_data_present,
--                      buffer_full => rx_full,
--                 buffer_half_full => rx_half_full,
--                              clk => CLK_50MHz );  
--  
  
  -- Set baud rate to 9600 for the UART communications
  -- For 50MHz clock the 'en_16_x_baud' is 153600Hz and means a pulse required every 326 cycles 
  baud_timer: process(CLK_50MHz)
  begin
    if CLK_50MHz'event and CLK_50MHz='1' then
      if baud_count=325 then
           baud_count <= 0;
         en_16_x_baud <= '1';
			CLK_baud <= '1';
-- non faut mieux pas ça marche pas sinon :(       elsif baud_count<5 then
--         -- on va être un peu gentil quand même
--			baud_count <= baud_count + 1;
--         en_16_x_baud <= '1';
--			CLK_baud <= '1';
		 else
           baud_count <= baud_count + 1;
         en_16_x_baud <= '0';
			CLK_baud <= '0';
      end if;
    end if;
  end process baud_timer;

display_received: process(CLK_50MHz,data_ready_P)
	variable data_mem  : std_logic_vector(7 downto 0):="00000000";
	
  begin
	-- et la lumière fut
   leds<=data_mem;
   --do_led<=rx_data_present;
	if rising_edge(CLK_50MHz) then
		if rx_data_present='1' then
			data_mem := rx_data(7 downto 0);
			if data_ready_P='1' and data_ready_V='0' then
				data_ready_V<='1';
			end if;
		end if;
		if data_ready_P='0' and data_ready_V='1' then
			data_ready_V<='0';
		end if;
	end if;
end process display_received;
process(data_ready_V,data_ready_P)
begin
end process;

process(CLK_read,data_ready_V)
begin
	if rising_edge(CLK_read) then
		if data_ready_V='1' and data_ready_P='1' then
			data_ready_P<='0';
			do_led<='1';
		else
			do_led<='0';
		end if;
		if data_ready_V='0' and data_ready_P='0' then
			data_ready_P<='1';
		end if;
	end if;
end process;

generate_with_tx : if not SOLO_RX generate

 kcuart: kcuart_tx
  port map (        data_in => switches,
             send_character => do_switch,
               en_16_x_baud => en_16_x_baud,
                 serial_out => tx,
                Tx_complete => tx_complete,
                        clk => CLK_50MHz);

--  transmit: entity uart_tx 
--  port map (            data_in => switches, 
--                   write_buffer => do_switch,
--                   reset_buffer => '0',
--                   en_16_x_baud => en_16_x_baud,
--                     serial_out => tx,
--                    buffer_full => tx_full,
--               buffer_half_full => tx_half_full,
--                            clk => CLK_50MHz );
--

end generate generate_with_tx;
end Behavioral;