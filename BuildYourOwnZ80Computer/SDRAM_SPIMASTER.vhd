library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--only in NEXYS4's version (!IS_MIST_BOARD)
--Library UNISIM;
--use UNISIM.vcomponents.all;

-- on a plus int�r�t a faire un "tableau de byte" ici pour que �a comprenne qu'on fait que des pas de 8
-- et que donc ce n'est pas la peine de pr�voir de faire des pas de 1bit

-- CRC7 peut-�tre qu'il ne prend que commande+argument dans le traitement
-- il faudrait d�j� tester l'exemple avec les algo du web (ceux en ligne)

entity SDRAM_SPIMASTER is
	Generic (
			IS_MIST_BOARD:boolean:=true; -- MIST BOARD
			IS_NO_CRC16:boolean:=true; -- no check_crc16 = IS_MIST_BOARD
			BLOCK_SIZE:integer:=512; -- bytes
			BLOCK_SQRT:integer:=9 -- 2^BLOCK_SQRT=BLOCK_SIZE
			-- in case of SDHC or SDXC cards, fixed to 512
			);
    Port (
			  reset : in std_logic:='0';
           address : in STD_LOGIC_VECTOR (31 downto 0); -- 32bit FAT32
			  data_in : in STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
			  data_out : out STD_LOGIC_VECTOR(7 downto 0);
           SCLK : in  STD_LOGIC; -- 25MHz
           MOSI : out  STD_LOGIC:='1'; -- sleeping 1 (because other one does not have the same rising edge)
           MISO : in  STD_LOGIC;
           SS_n : out  STD_LOGIC;
			  CD_n : in  STD_LOGIC; -- useless here, just for plug
			  --SDCS : out STD_LOGIC; -- actif 1, apr�s on on a un not SS_n SS_n=0 tout le temps donne le m�me effet
           spi_R:in STD_LOGIC;
			  spi_Rdone:out STD_LOGIC:='1';
			  spi_W:in STD_LOGIC:='0';
			  spi_Wblock:in STD_LOGIC:='0';
			  spi_Wdone:out STD_LOGIC:='1';
			  spi_init_done:out std_logic:='0';
			  special_W:in STD_LOGIC:='0';
			  leds_select:in std_logic:='0';
			  debug_crc_r:out std_logic_vector(15 downto 0):=(others=>'0');
			  debug_crc_c:out std_logic_vector(15 downto 0):=(others=>'0');
			  leds:out std_logic_vector(7 downto 0):=(others=>'0')
			  );
end SDRAM_SPIMASTER;

architecture Behavioral of SDRAM_SPIMASTER is

	constant GO_IDLE_STATE:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(0,6);
	constant SEND_IF_CONF:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(8,6);
	constant READ_OCR:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(58,6);
	constant CRC_ON_OFF:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(59,6);
	constant SINGLE_BLOCK_READ:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(17,6);
	constant SET_BLOCKLEN:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(16,6);
	constant WRITE_BLOCK:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(24,6);
	
	
	constant APP_CMD:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(55,6); -- � lancer avant une ACMD
	constant SD_SEND_OP_COND:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(41,6); -- mieux que SEND_OP_COND
	constant SEND_OP_COND:STD_LOGIC_VECTOR (5 downto 0):=conv_std_logic_vector(1,6);
	
	
	signal ram_T:boolean:=false;
	signal ram_Tblock:boolean:=false;
	signal ram_Tdone:boolean:=true;
	
	signal buffer_send:STD_LOGIC_VECTOR (47 downto 0);
	signal length_send:integer range 0 to buffer_send'length:=0;
	signal buffer_response:STD_LOGIC_VECTOR (39 downto 0);
	signal length_response:integer range 0 to buffer_response'length:=0;
	signal length_data_block:integer range 0 to BLOCK_SIZE:=0; -- bytes
	signal length_data_block_write:integer range 0 to BLOCK_SIZE:=0; -- bytes
	--signal buffer_crc16:STD_LOGIC_VECTOR (15 downto 0);
	--signal length_crc16:integer range 0 to buffer_crc16'length:=0;
	
	

	
	
	signal data_block_in:std_logic_vector(7 downto 0);
	signal data_block_in2:std_logic_vector(7 downto 0);
	--signal data_block_in_cmd:std_logic_vector(7 downto 0);
	--signal data_block_in_write:std_logic_vector(7 downto 0);
	
	signal data_block_w:std_logic:='0';
	signal data_block_w2:std_logic:='0';
	--signal just_write:std_logic:='0';
	signal data_block_address:std_logic_vector(BLOCK_SQRT-1 downto 0);
	signal data_block_address2:std_logic_vector(BLOCK_SQRT-1 downto 0);
	signal RAMB16_S9_address:std_logic_vector(10 downto 0);
	signal parity:std_logic_vector(0 downto 0);
	
	signal check_crc16:boolean:=false;
	
	signal data_block_out:std_logic_vector(7 downto 0):=(others=>'0');

	--signal cursor_special_byte:integer range 0 to BLOCK_SIZE*8+1;
	--signal special_byte:std_logic_vector(7 downto 0);

	signal leds_native_cmd:std_logic_vector(7 downto 0):=(others=>'0');
	signal leds_sangoku:std_logic_vector(7 downto 0):=(others=>'0');
	
	component altera_syncram is
	  generic (abits : integer := 9; dbits : integer := 32 );
	  port (
	    clk      : in std_ulogic;
	    address  : in std_logic_vector((abits -1) downto 0);
	    datain   : in std_logic_vector((dbits -1) downto 0);
	    dataout  : out std_logic_vector((dbits -1) downto 0);
	    enable   : in std_ulogic;
	    write    : in std_ulogic); 
	end component;
	
	
	
	signal reset_released:std_logic:='0';
	
begin

	leds<=leds_sangoku when leds_select='0'
	else leds_native_cmd;

---- mode
--if mode=0 generate
--	-- CPOL=0
--	-- CPHA=0
--end generate;
--if mode=1 generate
--	-- CPOL=0
--	-- CPHA=1
--end generate;
--if mode=2 generate
--	-- CPOL=1
--	-- CPHA=0
--end generate;
--if mode=3 generate
--	-- CPOL=1
--	-- CPHA=1
--end generate;

--only in NEXYS4's version (!IS_MIST_BOARD)
--nexys4_ram : if not(IS_MIST_BOARD) generate
--	RAMB16_S9_inst : RAMB16_S9
--	port map (
--		DO => data_block_out,      -- 8-bit Data Output
--		DOP => open,    -- 1-bit parity Output
--		ADDR => RAMB16_S9_address,  -- 11-bit Address Input
--		CLK => SCLK,    -- Clock
--		DI => data_block_in2,      -- 8-bit Data Input
--		DIP => parity,    -- 1-bit parity Input
--		EN => '1',      -- RAM Enable Input
--		SSR => '0',    -- Synchronous Set/Reset Input
--		WE => data_block_w2       -- Write Enable Input
--	);
--	RAMB16_S9_address<="00" & data_block_address2;
--end generate nexys4_ram;

--only in MiST's version (IS_MIST_BOARD)
mist_ram : if IS_MIST_BOARD generate
 RAMB16_S9_inst : altera_syncram
 generic map (
   abits =>9,
	dbits =>8
 )
 port map (
	clk=>SCLK,
	address=>data_block_address2,
	datain=>data_block_in2,
	dataout=>data_block_out,
	enable=>'1',
	write=>data_block_w2
	);
end generate mist_ram;

SS_n<='0';
--data_block_in<=data_block_in_write when just_write='1' else data_block_in_cmd;
--data_block_w2<='1' when just_write='1' else data_block_w;

data_block_w2<='1' when special_W='1' else data_block_w;
data_block_in2<=data_in when special_W='1' else data_block_in;
data_block_address2<=address(BLOCK_SQRT-1 downto 0) when special_W='1' else data_block_address;

data_out<=data_block_out;

parity(0)<=data_block_in(0) xor data_block_in(1) xor data_block_in(2) xor data_block_in(3) xor data_block_in(4) xor data_block_in(5) xor data_block_in(6) xor data_block_in(7);
	
	native_send_cmd : process(SCLK) is
		variable step_cmd:integer range 0 to 21:=0;
		variable cursor:integer range 0 to 7:=0;
		variable cursor_send:integer range 0 to buffer_send'length-1:=0;
		variable cursor_response:integer range 0 to buffer_response'length-1:=0;
		variable cursor_data_block:integer range 0 to BLOCK_SIZE:=0; -- il faut addresser avant de lire
		variable cursor_crc16:integer range 0 to 16-1:=0;
		
		
		variable current_byte:std_logic_vector(7 downto 0);
		variable check_byte_leds:std_logic_vector(7 downto 0):=(others=>'0');
		--variable current_byte2:std_logic_vector(7 downto 0);
		variable buffer_response_mem:STD_LOGIC_VECTOR(buffer_response'range):=(others=>'0'); -- utile
		variable data_block_d:std_logic_vector(7 downto 0);
		variable buffer_crc16_mem:STD_LOGIC_VECTOR(15 downto 0);
		variable read_token:std_logic_vector(7 downto 0);
	variable crc16_value:std_logic_vector(15 downto 0);
	procedure crc16_init is
	begin
		crc16_value:=(others=>'0'); -- not like USB protocol...
	end procedure;
	subtype crc16_result is STD_LOGIC_VECTOR(15 downto 0);
	function crc16(d:std_logic;crc16:std_logic_vector(15 downto 0)) return crc16_result is
		variable a:std_logic;
		variable b:std_logic;
		variable crc:std_logic_vector(15 downto 0);
	begin
		crc:=crc16; -- fronti�re pour a=f(a);
		b:=d; -- fronti�re (parano ?)
		a:=crc(15) xor b;
		crc:=crc(14 downto 0) & a;
		crc(5):=crc(5) xor a;
		crc(12):=crc(12) xor a;
		return crc;
	end function;
	
		--variable SDCS_mem:std_logic:='0'; -- not  transmit_done
		
		constant START_BLOCK_TOKEN:std_logic_vector(7 downto 0):="11111110";
		
	begin
		buffer_response<=buffer_response_mem;
		
		--buffer_crc16<=buffer_crc16_mem;
		--leds<=leds_mem;
		--leds<=check_byte_leds;
--		if reset='1' then
			--ram_Tdone<=true; -- il y a plusieurs reset lors du init_step ^^'
			--step_cmd:=0;
			--cursor:=0;
		--	MOSI<='1';
		if rising_edge(SCLK) then
		
			--SDCS<=SDCS_mem;
		
			--leds<=check_byte_leds;
			leds_native_cmd<=conv_std_logic_vector(step_cmd,8);
		
			--leds<=buffer_response_mem(buffer_response_mem'length-1 downto buffer_response_mem'length-8);		

		
			MOSI<='1'; -- le start bit c'est '0' et le end bit c'est '1'... donc le repos c'est '1' je pense :)
			

			data_block_w<='0';
			data_block_address<=address(BLOCK_SQRT-1 downto 0);
			
			if ram_T then
				if not(ram_Tdone) then
					step_cmd:=21; -- overrun (sans clignotement)
				elsif ram_Tblock then
					step_cmd:=19;
				else
					step_cmd:=0;
				end if;
				cursor:=0;
				ram_Tdone<=false;
			end if;
			
			if CD_n='0' then
			
				if not(ram_Tdone) then
					case step_cmd is
						when 0=> -- x"FF" waiting
							if cursor=7 then
								step_cmd:=1;
								cursor:=0;
							else
								cursor:=cursor+1;
							end if;
						when 1=> -- command
							MOSI<=buffer_send(buffer_send'length-1-cursor_send);
							if cursor_send=length_send-1 then
								step_cmd:=2;
								cursor_send:=0;
							else
								cursor_send:=cursor_send+1;
							end if;
						when 2=> -- response
							if MISO='0' or cursor_response>0 then
								--if cursor=1 then
								--	--debug
									--buffer_response_mem(buffer_response_mem'length-cursor):='1'; -- MISO toujours 1 avec SS_n=0
								--else
									buffer_response_mem(buffer_response_mem'length-1-cursor_response):=MISO; -- MISO toujours 1 avec SS_n=0
								--end if;
								if cursor_response=length_response-1 then
									cursor_response:=0;
									if length_data_block=0 and length_data_block_write=0 then
										ram_Tdone<=true;
										step_cmd:=6;
									elsif not (length_data_block=0) then
										step_cmd:=3;
									elsif not (length_data_block_write=0) then
										step_cmd:=10;
									end if;
									
									-- leds<=buffer_response_mem(7 downto 0); R1="00000000" donc ok
								else
									cursor_response:=cursor_response+1;
								end if;
							end if;
							
						when 3=>	-- byte aligned
							read_token(7-cursor):=MISO;
							if cursor=7 then
								cursor:=0;
								if read_token="11111110" then
									--cursor_byte:=0;
									step_cmd:=4;
									
									crc16_init;
--									
--									-- avec le token ?
--									crc16_value:=crc16('1',crc16_value);
--									crc16_value:=crc16('1',crc16_value);
--									crc16_value:=crc16('1',crc16_value);
--									crc16_value:=crc16('1',crc16_value);
--									
--									crc16_value:=crc16('1',crc16_value);
--									crc16_value:=crc16('1',crc16_value);
--									crc16_value:=crc16('1',crc16_value);
--									crc16_value:=crc16('0',crc16_value);
									
									
								elsif read_token(7 downto 5)="000" then
									step_cmd:=7;
								else
									step_cmd:=3; -- next byte aligned is ? --step_cmd:=8;
								end if;
							else
								cursor:=cursor+1;
							end if;
						
						when 4=> -- data_block
						
						-- registre CSD.READ_BL_LEN (4bytes)
						-- 512 ou 1024 ou 2048
						
						
							-- in fact start byte is "11111110" so last bit is 0 then can be taken as start bit (not totaly safe but if all work fine its ok)
--							leds<=buffer_response_mem(39 downto 32);
							--if MISO='0' or cursor>0 then
								current_byte(cursor):=MISO; -- MSB first (Most Significant Bit first)
								
								
								--cursor_byte:=cursor_byte+1;
--								if cursor_byte>8 then
--									cursor_byte:=1;
--								end if;
--								current_byte2(cursor_byte-1):=MISO; -- MSB first (Most Significant Bit first)
								crc16_value:=crc16(MISO,crc16_value);
								--crc16_value:=crc16('1',crc16_value);
								
								
								if cursor=7 then
									cursor:=0;
									data_block_d:=current_byte; -- bah oui ! little endian !
									-- page 21 doc SPI, les DATA bit sont envoy� du 7 au 0 (Most Significant Bit first), donc il faut inverser
									for i in current_byte'range loop
										data_block_d(7-i):=current_byte(i);
									end loop;
									current_byte:=data_block_d;
									--data_block_d:=conv_std_logic_vector(cursor,8);
									data_block_in<=data_block_d;


									if current_byte=x"EB" and cursor_data_block=0 then --=check_byte_0_sector_0 or current_byte=check_byte_0_sector_0_inv then -- and cursor=512 then
										check_byte_leds(7):='1';
									elsif current_byte=x"46" and cursor_data_block=82 then --F
										check_byte_leds(5):='1';
									elsif current_byte=x"41" and cursor_data_block=83 then --A
										check_byte_leds(4):='1';
									elsif current_byte=x"54" and cursor_data_block=84 then --T
										check_byte_leds(3):='1';
									elsif current_byte=x"33" and cursor_data_block=85 then --3
										check_byte_leds(2):='1';
									elsif current_byte=x"32" and cursor_data_block=86 then --2
										check_byte_leds(1):='1';
									end if;





									data_block_address<=conv_std_logic_vector(cursor_data_block,data_block_address'length);
									data_block_w<='1';
									if cursor_data_block=BLOCK_SIZE-1 then
										cursor_data_block:=0;
										step_cmd:=5;
									else
										cursor_data_block:=cursor_data_block+1;
									end if;
								else
									cursor:=cursor+1;
								end if;
						when 5=> -- crc16
							buffer_crc16_mem(15-cursor_crc16):=MISO;
							--buffer_crc16_mem(cursor-1):=MISO;
							if cursor_crc16=16-1 then
								cursor_crc16:=0;
								debug_crc_r<=buffer_crc16_mem;
								debug_crc_c<=crc16_value;
								if buffer_crc16_mem=crc16_value then
									step_cmd:=6;
									ram_Tdone<=true;--SDCS_mem:='0';
									check_crc16<=true;
								else
									step_cmd:=9;
--leds<=crc16_value(15 downto 8);

-- buffer_crc16_mem(7  downto 0) = "00001101"
-- buffer_crc16_mem(15 downto 8) = "10011110"
-- crc16_value(7 downto 0)       = "01111001"
-- crc16_value(15 downto 8)      = 


									if IS_NO_CRC16 then
										ram_Tdone<=true;--SDCS_mem:='0';
										check_crc16<=true; -- CRC16 not implemented in MiST
									end if;
								end if;
							else
								cursor_crc16:=cursor_crc16+1;
							end if;
						when 6=>NULL; -- transmit done
						when 7=>NULL; -- error token (from read data_block)
--						when 8=> -- error : data_block not following response message
--							if MISO='0' then
--								cursor:=0;
--								cursor_byte:=0;
--								step_cmd:=3;
--							end if;
						when 8=>NULL; -- error : incertain following message
						when 9=>NULL; -- CRC16 failed
						
						when 10=> -- send writen block
							-- start block token (one byte)
							MOSI<=START_BLOCK_TOKEN(7-cursor);
							data_block_address<=conv_std_logic_vector(cursor_data_block,data_block_address'length);
							if cursor=7 then
								cursor:=0;
								step_cmd:=11;
								crc16_init;
								
								-- il faut addresser avant de lire
								
								current_byte:=data_block_out;
								if cursor_data_block=conv_integer(address(BLOCK_SQRT-1 downto 0)) then
									-- on en profite au passage
									data_block_w<='1';
									current_byte:=data_in;
									data_block_in<=current_byte;
								end if;
								
								cursor_data_block:=1;					
								
							else
								cursor:=cursor+1;
							end if;
						when 11=>
							-- blocks
							MOSI<=current_byte(7-cursor); -- si r�actif que �a, ne pas utiliser un buffer par ici plut�t ?
							crc16_value:=crc16(current_byte(7-cursor),crc16_value);


							-- address en avance et au moins un pas avant car sinon �cras� par valeur par d�faut globale
							if cursor_data_block<BLOCK_SIZE then
								data_block_address<=conv_std_logic_vector(cursor_data_block,data_block_address'length);
							end if;
							
							if cursor=7 then
								cursor:=0;
								current_byte:=data_block_out;
								if cursor_data_block=conv_integer(address(BLOCK_SQRT-1 downto 0)) then
										-- on en profite au passage
										data_block_w<='1';
										current_byte:=data_in;
										data_block_in<=current_byte;
									end if;
								if cursor_data_block=BLOCK_SIZE then
									-- c la fin
									cursor_data_block:=0;
									step_cmd:=12;
								else
									cursor_data_block:=cursor_data_block+1;
								end if;
							else
								cursor:=cursor+1;
							end if;
						when 12=>
							--crc16
							MOSI<=crc16_value(15-cursor_crc16);
							if cursor_crc16=16-1 then
								cursor_crc16:=0;
								step_cmd:=13;
								current_byte:=x"FF";
							else
								cursor_crc16:=cursor_crc16+1;
							end if;
						when 13=>
							current_byte:=current_byte(6 downto 0) & MISO;
							if current_byte(7 downto 3)="00101" then
								-- "010" data accepted
								step_cmd:=14;
							elsif current_byte(7 downto 3)="01011" then
								-- "101" CRC error
								step_cmd:=15;
							elsif current_byte(7 downto 3)="01101" then
								-- "110" write error
								step_cmd:=16;
							end if;
						when 14=>
							current_byte(cursor):=MISO;
							if cursor=7 then
								cursor:=0;
								-- not BUSY (busy c'est x"00" en attendant la fin l'écriture réelle)
								if current_byte=x"FF" then
									ram_Tdone<=true;
									step_cmd:=6;
								end if;
							else
								cursor:=cursor+1;
							end if;
						when 15=> NULL; -- CRC write error
						when 16=> NULL; -- write error
						when 17=> NULL; -- no return
						when 18=> NULL; -- no return 0
						when 19=> NULL; -- just write into BLOCK internal RAM
							cursor_data_block:=conv_integer(address(BLOCK_SQRT-1 downto 0));
							data_block_address<=conv_std_logic_vector(cursor_data_block,data_block_address'length);
							current_byte:=data_in;
							data_block_in<=current_byte;
							data_block_w<='1';
							step_cmd:=20;
						when 20=>
							ram_Tdone<=true;
							cursor_data_block:=0; -- rembobiner
							step_cmd:=6;
						when 21=> NULL; --overrun
					end case;
				end if;
			end if;
		end if;
	end process native_send_cmd;
	
	-- voir les diff�rentes fa�on de send et receive
	sangoku:process(SCLK) is
		constant REPOS:integer:=0;
		
		variable state:integer:=REPOS;
		
		--variable cursor:integer:=0;
		variable command:STD_LOGIC_VECTOR (5 downto 0):="000000";
		variable argument:STD_LOGIC_VECTOR (31 downto 0):=(others=>'0');
		
		variable crc: STD_LOGIC_VECTOR (6 downto 0);
		variable command_output: STD_LOGIC_VECTOR (47 downto 0);
		
		constant R1_length:integer:=8;
		variable responseR1: STD_LOGIC_VECTOR (7 downto 0);
		constant R1_7:integer:=39; -- equals 0
		constant R1_parameter_error:integer:=38;
		constant R1_address_error:integer:=37;
		constant R1_erase_sequence_error:integer:=36;
		constant R1_com_crc_error:integer:=35;
		constant R1_illegal_error:integer:=34;
		constant R1_erase_reset:integer:=33;
		constant R1_in_idle_state:integer:=32;
		--constant R1b_busy_signal:integer:=32; -- incertain p129
		
		constant R2_length:integer:=16;
		variable responseR2: STD_LOGIC_VECTOR (15 downto 0);
		constant R2_15:integer:=39; -- equals 0
		constant R2_parameter_error:integer:=38;
		constant R2_address_error:integer:=37;
		constant R2_erase_sequence_error:integer:=36;
		constant R2_com_crc_error:integer:=35;
		constant R2_illegal_error:integer:=34;
		constant R2_erase_reset:integer:=33;
		constant R2_in_idle_state:integer:=32;
		constant R2_out_of_range_or_csd_overwrite:integer:=31;
		constant R2_erase_param:integer:=30;
		constant R2_wp_violation:integer:=29;
		constant R2_card_ecc_failed:integer:=28;
		constant R2_CC_error:integer:=27;
		constant R2_error:integer:=26;
		constant R2_wp_erase_skip_or_lockUnlock_cmd_failed:integer:=25;
		constant R2_card_is_locked:integer:=24;
		
		constant R3_length:integer:=40;
		variable responseR3: STD_LOGIC_VECTOR (39 downto 0); -- READ_OCR response
		constant R3_R1_39:integer:=39; -- equals 0
		constant R3_R1_parameter_error:integer:=38;
		constant R3_R1_address_error:integer:=37;
		constant R3_R1_erase_sequence_error:integer:=36;
		constant R3_R1_com_crc_error:integer:=35;
		constant R3_R1_illegal_error:integer:=34;
		constant R3_R1_erase_reset:integer:=33;
		constant R3_R1_in_idle_state:integer:=32;
		constant R3_OCR_CCS:integer:=30; -- registre OCR, champ CCS
		constant R3_OCR_BUSY:integer:=31;
		
		
		constant R7_length:integer:=40;
		variable responseR7: STD_LOGIC_VECTOR (39 downto 0); -- SEND_IF_COND response
		constant R7_R1_39:integer:=39; -- equals 0
		constant R7_R1_parameter_error:integer:=38;
		constant R7_R1_address_error:integer:=37;
		constant R7_R1_erase_sequence_error:integer:=36;
		constant R7_R1_com_crc_error:integer:=35;
		constant R7_R1_illegal_error:integer:=34;
		constant R7_R1_erase_reset:integer:=33;
		constant R7_R1_in_idle_state:integer:=32;
		constant R7_command_version_u:integer:=31;
		constant R7_command_version_l:integer:=28;
		constant R7_reserved_bits_u:integer:=27;
		constant R7_reserved_bits_l:integer:=12;
		constant R7_voltage_accepted_u:integer:=11;
		constant R7_voltage_accepted_l:integer:=8;
		constant R7_check_pattern_u:integer:=7; -- 'echo-back'
		constant R7_check_pattern_l:integer:=0;
		
		variable tokenDATA_RESPONSE: STD_LOGIC_VECTOR(7 downto 0);
		constant tokenDATA_RESPONSE_status_u:integer:=3;
		constant tokenDATA_RESPONSE_status_l:integer:=1;
		constant tokenDATA_RESPONSE_mask0:STD_LOGIC_VECTOR(7 downto 0):="00010000";
		constant tokenDATA_RESPONSE_mask1:STD_LOGIC_VECTOR(7 downto 0):="00000001";
		constant tokenDATA_RESPONSE_status_data_accepted:STD_LOGIC_VECTOR(2 downto 0):="010";
		constant tokenDATA_RESPONSE_status_data_rejected_CRC:STD_LOGIC_VECTOR(2 downto 0):="101";
		constant tokenDATA_RESPONSE_status_data_rejected_WRITE:STD_LOGIC_VECTOR(2 downto 0):="110";
		
		constant tokenSTART_SINGLE_BLOCK: STD_LOGIC_VECTOR(7 downto 0):="11111110"; -- then user_data then CRC16
		
		variable tokenDATA_ERROR: STD_LOGIC_VECTOR(7 downto 0);
		constant tokenDATA_ERROR_out_of_range:integer:=3;
		constant tokenDATA_ERROR_card_ECC_failed:integer:=2;
		constant tokenDATA_ERROR_CC_error:integer:=1;
		constant tokenDATA_ERROR_error:integer:=0;
		
		constant VHS:STD_LOGIC_VECTOR(3 downto 0):="0001"; --"0001"; -- 2.7v-3.6v voir p51
		constant HCS:STD_LOGIC:='1'; -- Host Capacity Support : 1 if host support SDHC or SDXC (j'ai une carte SDHC donc c'est 1...)
		constant check_pattern_8bit:STD_LOGIC_VECTOR(7 downto 0):="10101010";
	
	subtype crc7_result is STD_LOGIC_VECTOR(6 downto 0);
	-- selon le schema de la doc de sdcard et un test java :
	function crc7(something:STD_LOGIC_VECTOR (39 downto 0)) return crc7_result is
		variable crc:std_logic_vector(6 downto 0);
		variable a:std_logic;
	begin
		crc:=(others=>'0');
		for i in something'length-1 downto 0 loop
			a:=crc(6) xor something(i);
			crc:=crc(5 downto 0) & a;
			crc(3):=crc(3) xor a;
		end loop;
		return crc;
	end crc7;
	
	
	
	
	variable command_token_mem:STD_LOGIC_VECTOR(47 downto 0);
	procedure send_cmd(command:STD_LOGIC_VECTOR(5 downto 0); arg:STD_LOGIC_VECTOR(31 downto 0)) is
		variable crc:std_logic_vector(6 downto 0);
	begin
		-- lets go
		length_send<=48;
		crc:=crc7("01" & command & arg);
		command_token_mem:= "01" & command & arg & crc & "1";
		buffer_send<=command_token_mem;
		--if command=SEND_STATUS then
		--	length_response<=R2_length;
		--els
		if command=SEND_IF_CONF then
			length_response<=R7_length;
		elsif command=READ_OCR then
			length_response<=R3_length;
		else
			length_response<=R1_length;
		end if;
		
		if command=SINGLE_BLOCK_READ then
			length_data_block<=BLOCK_SIZE; -- provocate READ BYTES
			length_data_block_write<=0;
		elsif command=WRITE_BLOCK then
			length_data_block<=0;
			length_data_block_write<=BLOCK_SIZE; -- provocate WRITE BYTES
		end if;
		ram_T<=true;
	end send_cmd;
	
	impure function check_ok return boolean is
	begin
		return (buffer_response(39 downto 32) and "11111110")="00000000";
	end function;
	
		variable init_step:integer range 0 to 18:=0;
		variable read_step:integer range 0 to 6:=0;
		variable write_step: integer range 0 to 8:=0;
		variable address_loaded:STD_LOGIC_VECTOR(32-BLOCK_SQRT-1 downto 0):=(others=>'1'); -- � multiplier par 8 du coup ?
		variable wanted_address:STD_LOGIC_VECTOR(31 downto 0);
		variable spi_Rmem:std_logic:='1';
		variable spi_wasRWmem:std_logic:='1';
		variable spi_Wmem:std_logic:='1';
		variable address_loaded_safe:boolean:=false; -- address_loaded a bien �t� load au moins une fois...
		
		variable init_done:std_logic:='0';
		variable overrun:boolean:=false;
		variable ccs:std_logic:='0';
		
		variable init_start_waiting:std_logic_vector(7 downto 0):=x"00"; -- instable reset with bad responses (MiST-board SPI simulator)
	begin
		--leds<=leds_mem;
		if rising_edge(SCLK) then
		if reset='1' or not(IS_MIST_BOARD) then
			reset_released<='1'; -- have passed by reset phase (reset perhaps is 0 before being 1 for first time)
		end if;
		
		spi_Rdone<=spi_Rmem;
		spi_Wdone<=spi_Wmem;
		
--		just_write<='0';
		spi_init_done<=init_done;
		
		--leds<=conv_std_logic_vector(init_step,8);
		if overrun then
			leds_sangoku<= "11000011";
		elsif spi_Wmem='0' then
			leds_sangoku<= "10" & conv_std_logic_vector(write_step,6);
		elsif spi_Rmem='0' then
			leds_sangoku<= "00" & conv_std_logic_vector(read_step,6);
		elsif not(init_done='1') then
			leds_sangoku<= "01" & conv_std_logic_vector(init_step,6);
		else
			leds_sangoku<=(others=>'1');
		end if;
		
			ram_T<=false;
			ram_Tblock<=false;
			
if reset='0' and reset_released='1' then
			
			if not(init_done='1') then
				length_data_block<=0;
				length_data_block_write<=0;
		--		length_crc16<=0;
				case init_step is
					when 0 =>
						if not(ram_T) and ram_Tdone then
							--init_step:=2;
							-- debug
							-- perhaps some reset,not(reset),reset does insert bad return responses
							-- like 500640 or 7F0604
							if init_start_waiting=x"FF" then
								init_step:=1;
							else
								init_start_waiting:=init_start_waiting+1;
							end if;
						end if;
					when 1 =>
						if not(ram_T) and ram_Tdone then
							--init_step:=2;
							-- debug
							init_step:=2;
							send_cmd(GO_IDLE_STATE,(others=>'0'));
						end if;
					when 2 =>
						if not(ram_T) and ram_Tdone then
							--leds<=buffer_response(39 downto 32);
							-- osef buffer_receive(
							if check_ok then
								init_step:=3;
								-- voir page 54 pour le CRC7...
								send_cmd(SEND_IF_CONF,"00000000000000000000" & VHS & check_pattern_8bit);
							else
								init_step:=10;
							end if;
						end if;
					when 3 =>
						if not(ram_T) and ram_Tdone then
							-- osef error
							if check_ok then
								init_step:=4;
								send_cmd(READ_OCR,(others=>'0'));
							else
								-- crc error : osef !
								--leds<=buffer_response(39 downto 32);
								init_step:=11;
							end if;
						end if;
					when 4 =>
						if not(ram_T) and ram_Tdone then
							send_cmd(APP_CMD,(others=>'0'));
							init_step:=5;
						end if;
					when 5=>
						if not(ram_T) and ram_Tdone then
							-- osef error
							init_step:=6;
							send_cmd(SD_SEND_OP_COND,'0' & HCS & "000000" & x"000000");
						end if;
					when 6 =>
						-- �tre en repos c'est normal je pense donc in_idle_state='1' c'est que c'est pas busy je pense
						--leds<=buffer_response(39 downto 32);
						if not(ram_T) and ram_Tdone and buffer_response(R1_in_idle_state)='1' then
							--send_cmd(SD_SEND_OP_COND,'0' & HCS & "000000" & x"000000"); -- retry
							init_step:=4; -- retry
						elsif not(ram_T) and ram_Tdone then
							-- osef error
							init_step:=7;
							send_cmd(READ_OCR,(others=>'0'));
						end if;
					when 7 =>
						if not(ram_T) and ram_Tdone then
							if check_ok then
								--leds<=buffer_response(7 downto 0);
								
								if buffer_response(R3_OCR_BUSY)='0' then
									-- card power up not finished
									init_step:=7;
									send_cmd(READ_OCR,(others=>'0'));
								elsif buffer_response(R3_OCR_CCS)='0' then -- voir page 126 commande READ_OCR command description
									-- v2.x standard capacity SD memory card
									init_step:=8;
									--send_cmd(SET_BLOCKLEN,conv_std_logic_vector(BLOCK_SIZE,32));
									-- adapted to MiST (normalement on arrive jamais par là...
									send_cmd(SET_BLOCKLEN,conv_std_logic_vector(BLOCK_SIZE,32-9) & "0" & x"00");
									ccs:='0';
								else
									-- v2.x high capacity or Extended capacity SD memory card
									--init_step:=15;
									init_step:=17;
									ccs:='1';
									--send_cmd(CRC_ON_OFF,x"00000001");
									send_cmd(SET_BLOCKLEN,conv_std_logic_vector(BLOCK_SIZE,32));
								end if;
							else
							
								--leds<=buffer_response(7 downto 0);
							
								init_step:=12;
							end if;
						end if;
					when 8 => -- CCS 0 - addresses by byte
						if not(ram_T) and ram_Tdone then
							if check_ok then
								init_step:=15;
								send_cmd(CRC_ON_OFF,x"00000001");
							else
								init_step:=14;
								--leds<=buffer_response(39 downto 32);
							end if;
						end if;
					when 9 =>NULL; -- CCS 1 - addresses by block512
					when 10=>NULL; -- check failed
					when 11=>NULL; -- check failed
					when 12=>NULL; -- check failed
					when 13=>NULL; -- CCS 0 - BLOCKLEN=512 addresses by bytes
					when 14=>NULL; -- check failed
					when 15=> -- CRC on
						if not(ram_T) and ram_Tdone then
							if check_ok then
								init_done:='1';
								if ccs='0' then
									init_step:=13;
								else
									init_step:=9;
								end if;
							else
								init_step:=16;
							end if;
						end if;
					when 16=>NULL; -- check failed
					when 17=> -- set block len force
						if not(ram_T) and ram_Tdone then
							if check_ok then
								send_cmd(CRC_ON_OFF,x"00000001");
								init_step:=15;
							else
								init_step:=18;
							end if;
						end if;
					when 18=>NULL; -- check failed
				end case;
				
			elsif not(overrun) then
			
--				length_crc16<=16;
				
				if spi_R='1' or spi_W='1' or spi_Wblock='1' then
					if spi_Rmem='0' then
						overrun:=true; -- over run
						read_step:=6; -- over run
					elsif spi_Wmem='0' then
						overrun:=true; -- over run
						write_step:=8; -- over run
					else 
						if spi_Wblock='1' then
							spi_Wmem:='0';
							write_step:=7; -- just write into internal RAM
							spi_wasRWmem:='0'; -- block is contaminated : it's my BLOCK :p
						elsif spi_W='1' then
							spi_Wmem:='0';
							if spi_wasRWmem='0' and address_loaded_safe and address_loaded=address(31 downto BLOCK_SQRT) then
								-- its perfect do it quickly
								write_step:=2;
							else
								write_step:=0;
							end if;
		--==============================================
		--==============================================
		--==============================================
		--==============================================
		--==============================================
		--==============================================
		-- je suppose qu'on ne peut �crire que par gros BLOCK_SIZE bytes
		-- �tape 1 : read BLOCK sauf octet �crit
		-- �tape 2 : write BLOCK
							spi_wasRWmem:='0';
						elsif spi_R='1' then
							if spi_wasRWmem='0' and address_loaded_safe and address_loaded=address(31 downto BLOCK_SQRT) then
								-- its perfect do nothing
							else
								-- reset
								read_step:=0;
								spi_Rmem:='0';
							end if;
							spi_wasRWmem:='0';
						end if;
						
						if spi_Rmem='0' or spi_Wmem='0' then
							--action
							wanted_address:=address(31 downto BLOCK_SQRT) & "0" & "00000000"; -- block de 512    *8 = &"00000000"
						end if;
					end if;
				end if;
			if not(overrun) then
					if spi_Rmem='0' then
						
						case read_step is
							when 0 =>
								if not (ram_T) and ram_Tdone then
								--send_cmd(SET_BLOCK_COUNT,x"00000001");
								--send_cmd(READ_MULTIPLE_BLOCK,x"00000001");
									read_step:=1;
									-- CCS=0 use byte unit and CCS=1 use block unit
									if ccs='0' then --if ccs='0' then
										send_cmd(SINGLE_BLOCK_READ,wanted_address);
									else
										--send_cmd(SINGLE_BLOCK_READ,wanted_address+x"00002000");
										--send_cmd(SINGLE_BLOCK_READ,x"00002001"); -- 4096
										-- x"00000001" retourne que des FF
										-- x"00001000" retourne que des FF
										-- x"00000200" retourne que des FF
										-- x"00000000" contient parfois autre chose que des FF
										-- x"01000000" il est pas content, il reste bloqu�, m�me pas de error token !
										
										-- x"00020000" correspond sous HxD au secteur num�ro 122880 (x"1E000")
										-- x"00400000" correspond sous HxD au secteur num�ro 4186112 (x"3FE000")
										-- x"00002000" sector 0 -- cad qu'on a un simple offset de 2000h
										-- x"00002200" retourne que des FF
										-- x"00002001" sector 1 -- cad qu'une incr�mentation nous fait avancer d'un block 512
										
										
										send_cmd(SINGLE_BLOCK_READ,x"00" & "0" & wanted_address(31 downto BLOCK_SQRT)); --  + x"00002000"
									end if;
								end if;
							when 1 =>
								if not (ram_T) and ram_Tdone then
									if check_ok then
										if check_crc16 then
											address_loaded:=wanted_address(31 downto BLOCK_SQRT);
											spi_Rmem:='1';
											read_step:=3;
											address_loaded_safe:=true;
										else
											read_step:=5; -- retry
										end if;
									else
										read_step:=2;
									end if;
								end if;
							when 2=>NULL; -- check read failed
							when 3=>NULL; -- read done ok
							when 4=>NULL; -- non utilis� x) (debug said address of byte was > 512)
							when 5=>NULL; -- crc16 failed
							when 6=>NULL; -- over run (on a demand� trop t�t un run)
						end case;
					elsif spi_Wmem='0' then
						
						case write_step is
							when 0 =>
								if not (ram_T) and ram_Tdone then
									-- read BLOCK
									write_step:=1;
									-- CCS=0 use byte unit and CCS=1 use block unit
									if ccs='0' then --if ccs='0' then
										send_cmd(SINGLE_BLOCK_READ,wanted_address);
									else
										--send_cmd(SINGLE_BLOCK_READ,wanted_address+x"00002000");
										--send_cmd(SINGLE_BLOCK_READ,x"00002001"); -- 4096
										-- x"00000001" retourne que des FF
										-- x"00001000" retourne que des FF
										-- x"00000200" retourne que des FF
										-- x"00000000" contient parfois autre chose que des FF
										-- x"01000000" il est pas content, il reste bloqu�, m�me pas de error token !
										
										-- x"00020000" correspond sous HxD au secteur num�ro 122880 (x"1E000")
										-- x"00400000" correspond sous HxD au secteur num�ro 4186112 (x"3FE000")
										-- x"00002000" sector 0 -- cad qu'on a un simple offset de 2000h
										-- x"00002200" retourne que des FF
										-- x"00002001" sector 1 -- cad qu'une incr�mentation nous fait avancer d'un block 512
										
										
										send_cmd(SINGLE_BLOCK_READ,x"00" & "0" & wanted_address(31 downto BLOCK_SQRT)); --  + x"00002000"
									end if;
								end if;
							when 1 =>
							
								if not (ram_T) and ram_Tdone then
									if check_ok then
										if check_crc16 then
											address_loaded:=wanted_address(31 downto BLOCK_SQRT);
											--spi_Rmem:='1';
											write_step:=2;
											address_loaded_safe:=true;
										else
											write_step:=6; -- retry
										end if;
									else
										write_step:=5;
									end if;
								end if;
							
							when 2 =>
								-- BLOCK is READEN, let's write them all
								-- write them all !
								if not (ram_T) and ram_Tdone then
									if ccs='0' then
										send_cmd(WRITE_BLOCK,wanted_address);
									else
										send_cmd(WRITE_BLOCK,x"00" & "0" & wanted_address(31 downto BLOCK_SQRT));
									end if;
									write_step:=3;
								end if;
							when 3=>
								if not (ram_T) and ram_Tdone then
									spi_Wmem:='1';
									write_step:=4;
								end if;
							when 4=>NULL; -- write done
							when 5=>NULL; -- check read failed
							when 6=>NULL; -- crc16 failed
							when 7=> -- just write into internal RAM
								if not (ram_T) and ram_Tdone then
									ram_Tblock<=true;
									ram_T<=true;
									address_loaded:=wanted_address(31 downto BLOCK_SQRT); --thrust me you can do quick Write
									address_loaded_safe:=true; --thrust me you can do quick Write
									write_step:=3; -- do conclude
								end if;
							when 8=>NULL; -- overrun
						end case;
					end if;
				end if;
			end if;
end if;
		end if;
	end process sangoku;
	
end Behavioral;
