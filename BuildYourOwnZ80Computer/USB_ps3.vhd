library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- optim possible :
-- vérifier si les interrupteurs font bien des pull up
-- la boucle for la faire en bus et non fil par fil
-- remettre les trames à l'endroit, afin d'incrementer les compteurs à la place de les décrémenter
-- faire des if step_ps3==XX then c++; else c:=0;

entity USB_ps3 is
    Port ( CLK60MHz : in  STD_LOGIC;
	 -- 60MHz=50*6/5 MHz -- 60/5=12 MHz
	--7.5MHz=50*6/40MHz --7.5/5=1.5MHz
           USB_DATA : inout  STD_LOGIC_VECTOR (1 downto 0);
			  PLAGE:in std_logic_vector(3 downto 0);
			  
			  -- la manette doit être chargée... c'est mieux
			  -- PLAGE=0100 test d'initialisation, si LEDS=10010 alors l'initialisation a réussi
			  -- mettre PLAGE=1000, rien n'est allumé, appuyer sur le bouton power, quelques leds s'allument c'est en fait la vertical de l'analogique de gauche
			  -- PLAGE=1000 : manette analogique gauche - vertical
			  -- PLAGE=1001 : manette analogique gauche - horizontal
			  -- PLAGE=1100 : Les 4 boutons, plus les 4 boutons de derrière
			  -- PLAGE=1101 : les flèches, plus les quatre boutons spéciaux (2 analogique+start+stop)
			  
           LEDS : out  STD_LOGIC_VECTOR (7 downto 0));
end USB_ps3;

architecture Behavioral of USB_ps3 is

constant UN:std_logic_vector(1 downto 0):="10"; --fullspeed
constant ZERO:std_logic_vector(1 downto 0):="01"; --fullspeed
constant EOP:std_logic_vector(1 downto 0):="00";
constant IDLE:std_logic_vector(1 downto 0):=UN;
constant bInterval:std_logic_vector(7 downto 0):=x"01"; -- ps3

function bit2data(b:std_logic) return std_logic_vector is
begin
	if b='0' then
		return ZERO;
	else
		return UN;
	end if;
end function;

function data2bit(d:std_logic_vector(1 downto 0)) return std_logic is
begin
	if d=ZERO then
		return '0';
	else
		return '1';
	end if;
end function;
	

constant SYNCHRO:std_logic_vector(7 downto 0):="01010100";

constant ACK  :std_logic_vector(7 downto 0):="01001011";
constant NACK :std_logic_vector(7 downto 0):="01011010";
constant STALL:std_logic_vector(7 downto 0):="01110001";
constant DATA1:std_logic_vector(7 downto 0):="11010010";
constant DATA0:std_logic_vector(7 downto 0):="11000011";
constant SETUP:std_logic_vector(7 downto 0):="10110100";

constant ADDR0_ENDP0:std_logic_vector(11+5-1 downto 0):="00000000000" & "01000";
constant ADDR1_ENDP0:std_logic_vector(11+5-1 downto 0):="10000000000" & "10111";
constant ADDR1_ENDP1:std_logic_vector(11+5-1 downto 0):="10000001000" & "11010";


constant GET_DESCRIPTOR_DEVICE_8h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "00000000"&"10000000" & "00000000"&"00000000" & "00010000"&"00000000" & "1101011100101001";
constant SET_ADDRESS_1					:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000000" & "10100000" & "10000000"&"00000000" & "00000000"&"00000000" & "00000000"&"00000000" & "1101011110100100";
constant GET_DESCRIPTOR_DEVICE_12h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "00000000"&"10000000" & "00000000"&"00000000" & "01001000"&"00000000" & "0000011100101111";
constant GET_DESCRIPTOR_STRING2_2h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "01000000"&"11000000" & "10010000"&"00100000" & "01000000"&"00000000" & "1110101111010010";
constant GET_DESCRIPTOR_STRING2_36h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "01000000"&"11000000" & "10010000"&"00100000" & "01101100"&"00000000" & "1000001111010001";
constant GET_DESCRIPTOR_STRING1_2h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "10000000"&"11000000" & "10010000"&"00100000" & "01000000"&"00000000" & "1110101100011110";
constant GET_DESCRIPTOR_STRING1_Ch	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "10000000"&"11000000" & "10010000"&"00100000" & "00110000"&"00000000" & "1100101100011000";
constant GET_DESCRIPTOR_CONFIG_4h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "00000000"&"01000000" & "00000000"&"00000000" & "00100000"&"00000000" & "0101010100101001";
constant GET_DESCRIPTOR_CONFIG_29h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000001" & "01100000" & "00000000"&"01000000" & "00000000"&"00000000" & "10010100"&"00000000" & "1110110100100011";
constant SET_CONFIGURATION_1			:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000000" & "10010000" & "10000000"&"00000000" & "00000000"&"00000000" & "00000000"&"00000000" & "1110010010100100";
constant GET_DESCRIPTOR_34_94h		:std_logic_vector(11*8-1 downto 0):=DATA0 & "10000001" & "01100000" & "00000000"&"01000100" & "00000000"&"00000000" & "00101001"&"00000000" & "0110000111111001";
constant CLEAR_FEATURE_3F2h_12h		:std_logic_vector(11*8-1 downto 0):=DATA0 & "10000101" & "10000000" & "01001111"&"11000000" & "00000000"&"00000000" & "01001000"&"00000000" & "1001110001001100";
constant SET_CONFIGURATION_506_8h	:std_logic_vector(11*8-1 downto 0):=DATA0 & "10000100" & "10010000" & "10101111"&"11000000" & "00000000"&"00000000" & "00010000"&"00000000" & "0100110110100010";
constant OUT_CONFIGURATION_506_8h	:std_logic_vector(11*8-1 downto 0):=DATA1 & "1000010010010000101011111100000000000000000000000001000000000000" & "0100110110100010";

constant GET_INTERFACE 					:std_logic_vector(11*8-1 downto 0):=DATA0 & "10000100" & "01010000" & "00000000"&"00000000" & "00000000"&"00000000" & "00000000"&"00000000" & "0110101100000100";

--index=7   11100000
--length=1  10000000
--value=08h 
--constant SET_DATA_MAX_SIZE_1h_offset7	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000000" & "11100000" & "11100000"&"10000000" & "00000000"&"00000000" & "00010000"&"00000000" & "1100111100101100";
constant SET_DATA_MAX_SIZE_1h_offset7	:std_logic_vector(11*8-1 downto 0):=DATA0 & "00000000" & "11100000" & "11100000"&"10000000" & "00000000"&"00000000" & "10000000"&"00000000" & "0010111111001011";

--constant OUT_DATA_MAX_SIZE_1h_offset7	:std_logic_vector(11*8-1 downto 0):=DATA1 & "01001000"&"10000000"&"0000000001000000"&"00000000"&"00000000"&"00000000"&"00010000" & "1110101011100111";
constant OUT_DATA_MAX_SIZE_1h_offset7	:std_logic_vector(4*8-1 downto 0):=DATA1 & "00010000" & "1000001010011110";

constant OUT_OUT:std_logic_vector(7 downto 0):="10000111";
constant OUT_DATA1:std_logic_vector(3*8-1 downto 0):=DATA1 & "0000000000000000";




--constant GET_DESCRIPTOR_CONFIG_SETUP:std_logic_vector(3*8-1 downto 0):="10110100" & "10000000"&"000" & "10111";
--constant GET_DESCRIPTOR_CONFIG_SETUP_DATA0:std_logic_vector(11*8-1 downto 0):="11000011" & "00000001"&"01100000" & "00000000"&"01000000" & "00000000"&"00000000" & "10010000"&"00000000" & "0111010100100000";
--constant GET_DESCRIPTOR_CONFIG_SETUP_DATA0:std_logic_vector(11*8-1 downto 0):="11000011" & "00000001"&"01100000" & "00000000"&"01000000" & "00000000"&"00000000" & "10010100"&"00000000" & "1110110100100011";

constant SOF:std_logic_vector(7 downto 0):="10100101"; -- non NRZI

constant IN_IN:std_logic_vector(7 downto 0):="10010110";

constant period_RESET:integer:=1486684; --100-200ms >1486684< + 96147; --

constant period_IDLE:integer:=409;
constant period_EOP:integer:=1;

constant period_SOF:integer:=12000; --11890+8+3*8+2; --11924

constant PAS:integer:=5;
constant DEMI_PAS:integer:=2;--5/2;

constant TIME_OUT:integer:=8; -- 7.5bit

signal step_ps3_test:integer range 0 to 11:=0;

begin

process(CLK60MHz) is
	variable step_ps3:integer range 0 to 47:=0;
	variable step_cmd:integer range 0 to 18:=0;
	variable next_cmd:boolean:=false;
	variable counter_RESET:integer range 0 to period_RESET*PAS:=0;
	variable counter_IDLE:integer range 0 to period_IDLE+period_EOP:=0;
	variable counter_PAS:integer range 0 to PAS:=0;
	variable counter_SOF_stuff:integer range 0 to period_SOF:=0;
	
	variable counter_TRAME:integer:=0;
	
	variable last_USB_DATA:std_logic_vector(1 downto 0):=EOP;
	variable mode_receive:boolean:=false;
	variable JOY_mem:std_logic_vector(8*8-1 downto 0):=(others=>'0');
	variable JOY_CANDIDATE_mem:std_logic_vector(8*8-1 downto 0):=(others=>'0');
	variable DATA_MAX_SIZE:integer:=512; -- writing it (8h bytes) 512;
	variable SIZE_mem:std_logic_vector(7 downto 0):=(others=>'0');
	variable PID_mem:std_logic_vector(7 downto 0):=(others=>'0');
	variable CRC16_mem:std_logic_vector(15 downto 0):=(others=>'0');
	
	variable frame_number:std_logic_vector(10 downto 0):=(others=>'0');
	
	variable crc5_value:std_logic_vector(4 downto 0);
	procedure crc5_init is
	begin
		crc5_value:=(others=>'1');
	end procedure;
	subtype crc5_result is STD_LOGIC_VECTOR(4 downto 0);
	function crc5(d:std_logic;crc5:std_logic_vector(4 downto 0)) return crc5_result is
		variable a:std_logic;
		variable b:std_logic;
		variable crc:std_logic_vector(4 downto 0);
	begin
		crc:=crc5; -- frontière pour a=f(a);
		b:=d; -- frontière (parano ?)
		a:=crc(4) xor b;
		crc:=crc(3 downto 0) & a;
		crc(2):=crc(2) xor a;
		return crc;
	end function;
	
	
	--x^16+x^15+x^2+1
	variable crc16_value:std_logic_vector(15 downto 0);
	procedure crc16_init is
	begin
		crc16_value:=(others=>'1');
	end procedure;
	subtype crc16_result is STD_LOGIC_VECTOR(15 downto 0);
	function crc16(d:std_logic;crc16:std_logic_vector(15 downto 0)) return crc16_result is
		variable a:std_logic;
		variable b:std_logic;
		variable crc:std_logic_vector(15 downto 0);
	begin
		crc:=crc16; -- frontière pour a=f(a);
		b:=d; -- frontière (parano ?)
		a:=crc(15) xor b;
		crc:=crc(14 downto 0) & a;
		crc(2):=crc(2) xor a;
		crc(15):=crc(15) xor a;
		return crc;
	end function;
	
	variable last_nrzi:std_logic;
	variable result:std_logic;
	procedure nrzi(d:std_logic;last_nrzi : inout std_logic;result: out std_logic) is
	begin
		if d='1' then
			--no change level
			result:=last_nrzi;
		else
			--change level
			last_nrzi:=not(last_nrzi);
			result:=last_nrzi;
		end if;
	end procedure;
	procedure nrzi_inv(d:std_logic;last_nrzi : inout std_logic;result: out std_logic) is
	begin
		if d=last_nrzi then
			--no change level
			result:='1';
		else
			--change level
			result:='0';
			last_nrzi:=d;
		end if;
	end procedure;
	
	
	
	variable zap:boolean:=false;
	variable counter6:integer range 0 to 5:=0;
	procedure stuff_init is
	begin
		counter6:=1;
	end procedure;
	procedure stuff(b:std_logic) is
	begin
		if b='1' then
			if counter6=5 then	
				counter6:=0;
				zap:=true;
			else
				counter6:=counter6+1;
			end if;
		else
			counter6:=0;
		end if;
	end procedure;
	
	variable sleep:boolean:=false;
	variable counter_sleep:integer:=0;
	procedure pause(p:integer) is
	begin
		sleep:=true;
		counter_sleep:=p;
	end procedure;
	
	variable time_out:boolean:=false;
	
	procedure sof_init is
	begin
		counter_RESET:=0;
--		counter_IDLE:=0;
		counter_SOF_stuff:=0;
		counter_TRAME:=0;
		counter_PAS:=0;
		mode_receive:=false;
	end procedure;
		
		
	procedure nrzi_init is
	begin
		last_nrzi:='0';
	end procedure;


	variable TRAME_GET_SETUP:std_logic_vector(8+11+5-1 downto 0):=SETUP & ADDR0_ENDP0;
	variable TRAME_GET_DATA0:std_logic_vector(11*8-1 downto 0):=GET_DESCRIPTOR_DEVICE_12h;
	variable IN_ADDR_ENDP:std_logic_vector(8+11+5-1 downto 0):=IN_IN & ADDR0_ENDP0;
	variable OUT_ADDR_ENDP:std_logic_vector(8+11+5-1 downto 0):=OUT_OUT & ADDR1_ENDP1;
	variable TRAME_OUT_DATA1:std_logic_vector(11*8-1 downto 0):=OUT_CONFIGURATION_506_8h;
	variable TRAME_OUT_DATA1_length:integer range 0 to TRAME_OUT_DATA1'length:=0;
	procedure trame_read(ADDR_ENDP:std_logic_vector(11+5-1 downto 0); DATA:std_logic_vector(11*8-1 downto 0)) is
	begin
		TRAME_GET_SETUP:=SETUP & ADDR_ENDP;
		TRAME_GET_DATA0:=DATA;
		IN_ADDR_ENDP:=IN_IN & ADDR_ENDP;
		OUT_ADDR_ENDP:=OUT_OUT & ADDR_ENDP;
		TRAME_OUT_DATA1_length:=OUT_DATA1'length;
		TRAME_OUT_DATA1:=(others=>'0');
		TRAME_OUT_DATA1(TRAME_OUT_DATA1_length-1 downto 0):=OUT_DATA1;
		step_ps3:=18;
	end procedure;
	
	procedure trame_write(ADDR_ENDP:std_logic_vector(11+5-1 downto 0); DATA:std_logic_vector(11*8-1 downto 0); OUT_DATA:std_logic_vector(11*8-1 downto 0)) is
	begin
		TRAME_GET_SETUP:=SETUP & ADDR_ENDP;
		TRAME_GET_DATA0:=DATA;
		IN_ADDR_ENDP:=IN_IN & ADDR_ENDP;
		OUT_ADDR_ENDP:=OUT_OUT & ADDR_ENDP;
		TRAME_OUT_DATA1:=OUT_DATA;
		TRAME_OUT_DATA1_length:=OUT_DATA'length;
		step_ps3:=18;
	end procedure;

	variable TRAME_SET_SETUP:std_logic_vector(8+11+5-1 downto 0):=SETUP & ADDR0_ENDP0;
	variable TRAME_SET_DATA0:std_logic_vector(11*8-1 downto 0):=SET_ADDRESS_1;
	procedure trame_set(ADDR_ENDP:std_logic_vector(11+5-1 downto 0); DATA:std_logic_vector(11*8-1 downto 0)) is
	begin
		TRAME_SET_SETUP:=SETUP & ADDR_ENDP;
		TRAME_SET_DATA0:=DATA;
		IN_ADDR_ENDP:=IN_IN & ADDR_ENDP;
		step_ps3:=7;
	end procedure;

	procedure set_max_size_8 is
	begin
		DATA_MAX_SIZE:=8*8; -- 8 bytes == 64bits
		TRAME_GET_SETUP:=SETUP & ADDR0_ENDP0;
		TRAME_GET_DATA0:=SET_DATA_MAX_SIZE_1h_offset7;
		IN_ADDR_ENDP:=IN_IN & ADDR0_ENDP0;
		OUT_ADDR_ENDP:=OUT_OUT & ADDR0_ENDP0;
		TRAME_OUT_DATA1_length:=OUT_DATA_MAX_SIZE_1h_offset7'length;
		TRAME_OUT_DATA1:=(others=>'0');
		TRAME_OUT_DATA1(TRAME_OUT_DATA1_length-1 downto 0):=OUT_DATA_MAX_SIZE_1h_offset7;
		step_ps3:=18;
	end procedure;

	procedure plug(ADDR_ENDP:std_logic_vector(11+5-1 downto 0)) is
	begin
		IN_ADDR_ENDP:=IN_IN & ADDR_ENDP;
		
		step_ps3:=34;
	end procedure;

	variable interval:std_logic_vector(7 downto 0):=(others=>'0');
	
	variable DEBUG_mem:std_logic_vector(31 downto 0):=(others=>'0');
	
	variable old_PLAGE:std_logic_vector(3 downto 0):=(others=>'0');
begin
step_ps3_test<=step_ps3;
if rising_edge(CLK60MHz) then

	--LEDS<=conv_std_logic_vector(step_cmd,8);
	--LEDS<=conv_std_logic_vector(step_ps3,8);

	if conv_integer(PLAGE)=0 then
		LEDS<=DEBUG_mem(7 downto 0);
	elsif conv_integer(PLAGE)=1 then
		LEDS<=DEBUG_mem(15 downto 8);
	elsif conv_integer(PLAGE)=2 then
		LEDS<=DEBUG_mem(23 downto 16);
	elsif conv_integer(PLAGE)=3 then
		LEDS<=DEBUG_mem(31 downto 24);
	elsif conv_integer(PLAGE)=4 then
		LEDS<=conv_std_logic_vector(step_cmd,8);
	elsif conv_integer(PLAGE)<8 then
		if not(old_PLAGE=PLAGE) then
			LEDS<=conv_std_logic_vector(step_ps3,8);
		end if;
	else
		--LEDS<=JOY_mem(7 downto 0);
		--for i in 0 to 7 loop
			--LEDS(i)<=JOY_mem(i + 8*conv_integer(old_PLAGE(2 downto 0)));
--		end loop;
		LEDS<=JOY_mem(7 + 8*conv_integer(old_PLAGE(2 downto 0)) downto 8*conv_integer(old_PLAGE(2 downto 0)));
	end if;
	old_PLAGE:=PLAGE;
	
	
	if zap then
		if counter_PAS=DEMI_PAS then
			if mode_receive then
				--nrzi('0',last_nrzi,result);
				nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
				if result='0' then
					--cool
				else
					-- pas cool
crc16_value:=(others=>'0');
crc5_value:=(others=>'0');
-- TRAMES TROP LONGUE POUR TOLERER FATAL ERROR step_ps3:=2;
				end if;
			else
				nrzi('0',last_nrzi,result);
				USB_DATA<=bit2data(result);
			end if;
			zap:=false;
		end if;
	elsif sleep then
		if counter_PAS=DEMI_PAS then
			USB_DATA<="ZZ";
			counter_sleep:=counter_sleep-1;
			if counter_sleep=0 then
				sleep:=false;
			end if;
		end if;
	elsif time_out then
		mode_receive:=false;
		if counter_IDLE=0 then
			USB_DATA<=EOP;
		else
			USB_DATA<=UN;
		end if;
		if counter_SOF_stuff=0 then
			time_out:=false;
			sof_init;
		end if;
	else
		case step_ps3 is
			--=========
			-- CONNECT
			--=========
			when 0=>
				USB_DATA<="ZZ";
				step_ps3:=3;
			when 1=> -- test
			when 2=> -- erreur zap en mode_receive
			when 3=>
				if USB_DATA=UN then
					step_ps3:=4;
				end if;
--step_ps3:=4; -- FOR TESTBENCH
			--=======
			-- RESET
			--=======
			when 4=>
				USB_DATA<=EOP;
				if counter_RESET=period_RESET*PAS-1 then
					counter_RESET:=0;
					step_ps3:=5;
					USB_DATA<="ZZ";
				else
					counter_RESET:=counter_RESET+1;
				end if;
			when 5=>
				-- end of reset
				if USB_DATA=UN then
					step_ps3:=6;
				end if;
			when 6=>
				USB_DATA<=UN;
				if counter_RESET=10*PAS-1 then
					step_ps3:=1;
					next_cmd:=true;
					sof_init;
				else
					counter_RESET:=counter_RESET+1;
				end if;
			


			--=====================================================
			-- TRAME SET (SOF,TRAME_SET_SETUP,TRAME_SET_DATA0,ACK)
			--=====================================================
			when 7=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						step_ps3:=8;
					end if;
					if step_ps3=7 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 8=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+TRAME_SET_SETUP'length then
						stuff(TRAME_SET_SETUP(8+TRAME_SET_SETUP'length -1-counter_TRAME));
						nrzi(TRAME_SET_SETUP(8+TRAME_SET_SETUP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 then -- on va dire 5 à la place de 3 IDLE
						USB_DATA<=UN;
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8 then
						USB_DATA<=bit2data(SYNCHRO(8+TRAME_SET_SETUP'length+2+5 +8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length then
						stuff(TRAME_SET_DATA0(8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length -1-counter_TRAME));
						nrzi(TRAME_SET_DATA0(8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=9;
					else
						counter_TRAME:=0;
						time_out:=true;
						step_ps3:=7; -- next SOF
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 9=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+TRAME_SET_SETUP'length+2+5 +8+TRAME_SET_DATA0'length+2+1+1 +8 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=8;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=10;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 10=> -- reception ACK ????
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=11;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						if not(result=ACK(8+ACK'length -1-counter_TRAME)) then
							-- pas cool
							step_ps3:=11;counter_TRAME:=0;mode_receive:=false;
						end if;
					else
						pause(5);
						time_out:=true;
						step_ps3:=12; --next INSTRUCTION
					end if;
					if step_ps3=10 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 11=>
				-- wait EOP
				if counter_PAS=DEMI_PAS and USB_DATA=EOP then -- DEMI_PAS ? plus long ??? ne pas rendre un "entre deux états"
					pause(5);
					time_out:=true;
					step_ps3:=7; --next SOF
				end if;
			--==================================
			-- TRAME SET (SOF,IN_ADDR_ENDP,ACK)
			--==================================
			when 12=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						step_ps3:=13;
					end if;
					if step_ps3=12 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 13=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length then
						stuff(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME));
						nrzi(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=14;
					else
						step_ps3:=12;-- next SOF
						time_out:=true;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 14=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8*10 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=13;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=15;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 15=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=16;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						PID_mem(8+8 -1-counter_TRAME):=result;
						if counter_TRAME=8+8-1 then
							if PID_mem=DATA1 then
								-- cool
							elsif PID_mem=NACK then
								-- pas cool : attendre
								step_ps3:=16;counter_TRAME:=0;mode_receive:=false;
							else -- STALL or DATA0
								-- pas cool : reset cmd
								step_ps3:=11;counter_TRAME:=0;mode_receive:=false;
							end if;
						end if;
					elsif USB_DATA=EOP then
						SIZE_mem:=conv_std_logic_vector(counter_TRAME-16-16,8); -- NO_DATA=0
						counter_TRAME:=0;
						pause(5);
						mode_receive:=false;
						step_ps3:=17;
					else
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						-- DATA & CRC16
					end if;
					if step_ps3=15 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 16=>
				-- wait EOP
				if USB_DATA=EOP and counter_PAS=DEMI_PAS then
					pause(5);
					time_out:=true;
					step_ps3:=12; -- next SOF
				end if;
			when 17=>
				-- envoyer un ACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						stuff(ACK(8+ACK'length -1-counter_TRAME));
						nrzi(ACK(8+ACK'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+ACK'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+ACK'length+2+1 then
						USB_DATA<=UN;
					else
						pause(3);
						time_out:=true;
						step_ps3:=1;-- next SOF next INSTRUCTION
						next_cmd:=true;
					end if;
					if step_ps3=17 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;







			--========================================================
			-- TRAME_GET (SOF, TRAME_GET_SETUP, TRAME_GET_DATA0, ACK)
			--========================================================
			when 18=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						step_ps3:=19;
					end if;
					if step_ps3=18 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 19=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+TRAME_GET_SETUP'length then
						stuff(TRAME_GET_SETUP(8+TRAME_GET_SETUP'length -1-counter_TRAME));
						nrzi(TRAME_GET_SETUP(8+TRAME_GET_SETUP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 then -- on va dire 5 à la place de 3 IDLE
						USB_DATA<=UN;
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8 then
						USB_DATA<=bit2data(SYNCHRO(8+TRAME_GET_SETUP'length+2+5 +8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length then
						stuff(TRAME_GET_DATA0(8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length -1-counter_TRAME));
						nrzi(TRAME_GET_DATA0(8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=20;
					else
						counter_TRAME:=0;
						time_out:=true;
						step_ps3:=18; -- next SOF
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 20=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+TRAME_GET_SETUP'length+2+5 +8+TRAME_GET_DATA0'length+2+1+1 +8 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=19;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=21;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 21=> -- reception ACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=22;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						if not(result=ACK(8+ACK'length -1-counter_TRAME)) then
							-- pas cool
							step_ps3:=22;counter_TRAME:=0;mode_receive:=false;
						end if;
					else
						pause(5);
						time_out:=true;
						if not(TRAME_OUT_DATA1_length=OUT_DATA1'length) then
							-- direct OUT (write_trame !) -- puis fini par un in NO_DATA.
							step_ps3:=29;
						else
							step_ps3:=23; --24; next INSTRUCTION
						end if;
					end if;
					if step_ps3=21 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 22=>
				-- wait EOP
				if USB_DATA=EOP and counter_PAS=DEMI_PAS then
					pause(5);
					time_out:=true;
					step_ps3:=18; -- next SOF
				end if;
			--========================
			-- TRAME_GET (SOF,IN_ADDR_ENDP,ACK)
			--========================
			when 23=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						step_ps3:=24;
					end if;
					if step_ps3=23 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 24=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length then
						stuff(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME));
						nrzi(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=25;
					else
						step_ps3:=23;-- next SOF
						time_out:=true;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 25=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8*10 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=24;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=26;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 26=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=27;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						PID_mem(8+8 -1-counter_TRAME):=result;
						if counter_TRAME=8+8-1 then
							crc16_init;
							if PID_mem=DATA1 or PID_mem=DATA0 then
								-- cool
							elsif PID_mem=NACK then
								-- pas cool : attendre
								step_ps3:=27;counter_TRAME:=0;mode_receive:=false;
							else -- STALL
								-- pas cool : reset cmd
								step_ps3:=22;counter_TRAME:=0;mode_receive:=false;
							end if;
						end if;
					elsif USB_DATA=EOP then
						SIZE_mem:=conv_std_logic_vector(counter_TRAME-16-16,8);
						counter_TRAME:=0;
						pause(5);
						mode_receive:=false;
						step_ps3:=28;
						if conv_integer(SIZE_mem)>0 then
							for i in 0 to 15 loop
								CRC16_mem(i):=not(CRC16_mem(i));
							end loop;
							if not(CRC16_mem=crc16_value) then
								step_ps3:=41; -- 40 IS NACK AND THEN TIME_OUT
							else
								--JOY_mem:=JOY_CANDIDATE_mem;
							end if;
						end if;
					else
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						if counter_TRAME>=8+8+16 then
							crc16_value:=crc16(CRC16_mem(15),crc16_value);
						end if;
						CRC16_mem:=CRC16_mem(14 downto 0) & result;
						-- DATA & CRC16


--						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
--						stuff(result);
						-- DATA & CRC16
					end if;
					if step_ps3=26 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 27=>
				-- wait EOP
				if USB_DATA=EOP and counter_PAS=DEMI_PAS then
					pause(5);
					time_out:=true;
					step_ps3:=23; -- next SOF
				end if;
			when 28=>
				-- envoyer un ACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						stuff(ACK(8+ACK'length -1-counter_TRAME));
						nrzi(ACK(8+ACK'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+ACK'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+ACK'length+2+1 then
						USB_DATA<=UN;
					else
						pause(3);
						time_out:=true;
						if conv_integer(SIZE_mem)=DATA_MAX_SIZE then
							--encore !
							step_ps3:=23; -- next SOF
						else
							--merci et au revoir
							--step_ps3:=1;
							step_ps3:=29; -- next SOF next INSTRUCTION
						end if;
					end if;
					if step_ps3=28 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;				
				
				
				
				
				
				
			when 41=>
				-- envoyer un NACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+NACK'length then
						stuff(NACK(8+NACK'length -1-counter_TRAME));
						nrzi(NACK(8+NACK'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+NACK'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+NACK'length+2+1 then
						USB_DATA<=UN;
					else
						pause(3);
						time_out:=true;
						--encore !
						step_ps3:=23; -- next SOF
					end if;
					if step_ps3=41 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			--========================
			-- TRAME_GET (SOF,OUT_ADDR_ENDP,OUT_DATA1,ACK)
			--========================
			when 29=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						step_ps3:=30;
					end if;
					if step_ps3=29 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 30=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length then
						stuff(OUT_ADDR_ENDP(8+OUT_ADDR_ENDP'length -1-counter_TRAME));
						nrzi(OUT_ADDR_ENDP(8+OUT_ADDR_ENDP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 then -- on va dire 5 à la place de 3 IDLE
						USB_DATA<=UN;
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8 then
						USB_DATA<=bit2data(SYNCHRO(8+OUT_ADDR_ENDP'length+2+5 +8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length then
						stuff(TRAME_OUT_DATA1(8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length -1-counter_TRAME));
						nrzi(TRAME_OUT_DATA1(8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=31;
					else
						counter_TRAME:=0;
						time_out:=true;
						step_ps3:=29; -- next SOF
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 31=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+OUT_ADDR_ENDP'length+2+5 +8+TRAME_OUT_DATA1_length+2+1+1 +8 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=30;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=32;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 32=> -- reception ACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=33;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						if not(result=ACK(8+ACK'length -1-counter_TRAME)) then
							-- pas cool
							step_ps3:=33;counter_TRAME:=0;mode_receive:=false;
						end if;
					else
						pause(5);
						time_out:=true;
						if not(TRAME_OUT_DATA1_length=OUT_DATA1'length) then
							-- direct OUT (write_trame !) -- puis fini par un in NO_DATA.
							step_ps3:=42;
						else
							step_ps3:=1; -- next INSTRUCTION
							next_cmd:=true;
						end if;
					end if;
					if step_ps3=32 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 33=>
				-- wait EOP
				if USB_DATA=EOP and counter_PAS=DEMI_PAS then
					pause(5);
					time_out:=true;
					step_ps3:=29; -- next SOF
				end if;
			--=============
			-- (STATUS IN)
			--==================================
			-- TRAME GET (SOF,IN_ADDR_ENDP,ACK)
			--==================================
			when 42=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						step_ps3:=43;
					end if;
					if step_ps3=42 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 43=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length then
						stuff(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME));
						nrzi(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=44;
					else
						step_ps3:=42;-- next SOF
						time_out:=true;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 44=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8*10 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=43;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=45;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 45=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=46;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						PID_mem(8+8 -1-counter_TRAME):=result;
						if counter_TRAME=8+8-1 then
							if PID_mem=DATA1 then
								-- cool
							elsif PID_mem=NACK then
								-- pas cool : attendre
								step_ps3:=46;counter_TRAME:=0;mode_receive:=false;
							else -- NACK STALL or DATA0
								-- pas cool : reset cmd
								step_ps3:=22;counter_TRAME:=0;mode_receive:=false;
							end if;
						end if;
					elsif USB_DATA=EOP then
						SIZE_mem:=conv_std_logic_vector(counter_TRAME-16-16,8); -- NO_DATA=0
						counter_TRAME:=0;
						pause(5);
						mode_receive:=false;
						step_ps3:=47;
					else
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						-- DATA & CRC16
					end if;
					if step_ps3=45 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 46=>
				-- wait EOP
				if USB_DATA=EOP and counter_PAS=DEMI_PAS then
					pause(5);
					time_out:=true;
					step_ps3:=42; -- next SOF
				end if;
			when 47=>
				-- envoyer un ACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						stuff(ACK(8+ACK'length -1-counter_TRAME));
						nrzi(ACK(8+ACK'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+ACK'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+ACK'length+2+1 then
						USB_DATA<=UN;
					else
						pause(3);
						time_out:=true;
						step_ps3:=1;-- next SOF next INSTRUCTION
						next_cmd:=true;
					end if;
					if step_ps3=47 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;


			
				

				
				
				
				
				
	











			
			
			
			--=============================
			-- PLUG (SOF,IN_ADDR_ENDP,ACK)
			--=============================
			-- toujours vide, non lancé du coup
			when 34=>
			--PID_SOF
				--frame_number 0 to 11
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						stuff(SOF(8+8 -1-counter_TRAME));
						nrzi(SOF(8+8 -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_init;
					elsif counter_TRAME<8+8+11 then -- stuff osef (si ça passe pas, ça passe pas)
						stuff(frame_number(counter_TRAME-8-8));
						nrzi(frame_number(counter_TRAME-8-8),last_nrzi,result);
						USB_DATA<=bit2data(result);
						crc5_value:=crc5(frame_number(counter_TRAME-8-8),crc5_value);
					elsif counter_TRAME<8+8+11+5 then
						-- reverse and inverse
						stuff(not(crc5_value(8+8+11+5 -1-counter_TRAME)));
						nrzi(not(crc5_value(8+8+11+5 -1-counter_TRAME)),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+8+11+5+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+8+11+5+2+3 then
						USB_DATA<="ZZ";
					else
						counter_TRAME:=0;
						frame_number:=frame_number+1;
						
						if interval>bInterval+1 then
							interval:=x"00";
							step_ps3:=35;
						else
							interval:=interval+1;
							time_out:=true; -- wait next SOF
						end if;
						
					end if;
					if step_ps3=34 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 35=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length then
						stuff(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME));
						nrzi(IN_ADDR_ENDP(8+IN_ADDR_ENDP'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1 then
						USB_DATA<=UN;
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 then
						USB_DATA<="ZZ";
					elsif counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8 then
						-- TIME_OUT ?
						step_ps3:=36;
					else
						step_ps3:=34;-- next SOF
						time_out:=true;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
			when 36=> --
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8+IN_ADDR_ENDP'length+2+1+1 +8*10 then
						USB_DATA<="ZZ";
					else
						-- TIME_OUT
						step_ps3:=35;
					end if;
					counter_TRAME:=counter_TRAME+1;
				end if;
				
				if USB_DATA=ZERO then
					last_USB_DATA:=EOP;-- not(USB_DATA=ZERO)
					mode_receive:=true;
					step_ps3:=37;
--JOY_mem:=JOY_mem+1;
					counter_TRAME:=0;
					counter_PAS:=0;
				end if;
			when 37=>
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						if not(SYNCHRO(8 -1-counter_TRAME)=data2bit(USB_DATA)) then
							-- pas cool
							step_ps3:=38;counter_TRAME:=0;mode_receive:=false;
						end if;
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+8 then
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						
						PID_mem(8+8 -1-counter_TRAME):=result;
						if counter_TRAME=8+8-1 then
							crc16_init;
							--JOY_mem:=PID_mem;
							if PID_mem=DATA0 or PID_mem=DATA1 then
								--cool
							elsif PID_mem=STALL then
							--	-- RESET ALL : mauvaise idée : un reset ça prend du temps, ce n'est donc pas une réaction normale du système
							--	counter_TRAME:=0;mode_receive:=false;	
							--	pause(5);
							--	time_out:=true;
							--	step_ps3:=0;-- next INSTRUCTION
							--	step_cmd:=0;
							--	next_cmd:=false;
								step_ps3:=2; -- death
							else
								-- pas cool : surement le NACK (ping failed)
								step_ps3:=38;counter_TRAME:=0;mode_receive:=false;	
							end if;
						end if;
					elsif USB_DATA=EOP then
							SIZE_mem:=conv_std_logic_vector(counter_TRAME-16-16,8);
							counter_TRAME:=0;
							pause(5);
							mode_receive:=false;
							step_ps3:=39;
							if conv_integer(SIZE_mem)>0 then
								for i in 0 to 15 loop
									CRC16_mem(i):=not(CRC16_mem(i));
								end loop;
								if not(CRC16_mem=crc16_value) then
									step_ps3:=40; -- envoyer un NACK
								else
									JOY_mem:=JOY_CANDIDATE_mem;
								end if;
							end if;
					else
						nrzi_inv(data2bit(USB_DATA),last_nrzi,result);
						stuff(result);
						if counter_TRAME>=8+8+16 then
							crc16_value:=crc16(CRC16_mem(15),crc16_value);
						end if;
						CRC16_mem:=CRC16_mem(14 downto 0) & result;
						-- DATA & CRC16
					end if;
					if counter_TRAME>=8+8 and counter_TRAME<8+8+8*8 then
						JOY_CANDIDATE_mem(8+8+8*8 -1-counter_TRAME):=result;
					end if;
					if counter_SOF_stuff*2>period_SOF then
						-- timeout !
						step_ps3:=38;counter_TRAME:=0;mode_receive:=false;
					end if;

					if step_ps3=37 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			when 38=>
				-- wait EOP
				if USB_DATA=EOP and counter_PAS=DEMI_PAS then
					pause(5);
					time_out:=true;
					step_ps3:=34; -- next SOF
				end if;
			when 39=>
				-- envoyer un ACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+ACK'length then
						stuff(ACK(8+ACK'length -1-counter_TRAME));
						nrzi(ACK(8+ACK'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+ACK'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+ACK'length+2+1 then
						USB_DATA<=UN;
					else
						pause(3);
						time_out:=true;
						step_ps3:=1;-- loop -- next SOF next INSTRUCTION
						next_cmd:=true;
					end if;
					if step_ps3=39 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			
			when 40=>
				-- envoyer un NACK
				if counter_PAS=DEMI_PAS then
					if counter_TRAME<8 then
						USB_DATA<=bit2data(SYNCHRO(8 -1-counter_TRAME));
						stuff_init;
						nrzi_init;
					elsif counter_TRAME<8+NACK'length then
						stuff(NACK(8+NACK'length -1-counter_TRAME));
						nrzi(NACK(8+NACK'length -1-counter_TRAME),last_nrzi,result);
						USB_DATA<=bit2data(result);
					elsif counter_TRAME<8+NACK'length+2 then
						USB_DATA<=EOP;
					elsif counter_TRAME<8+NACK'length+2+1 then
						USB_DATA<=UN;
					else
						pause(3);
						time_out:=true;
						step_ps3:=1;-- loop -- next SOF next INSTRUCTION
						next_cmd:=true;
					end if;
					if step_ps3=40 then
						counter_TRAME:=counter_TRAME+1;
					end if;
				end if;
			
				


			
		end case;
	end if;
	
	counter_PAS:=counter_PAS+1;
	if mode_receive then
		if not(USB_DATA=last_USB_DATA) then
			if counter_PAS<DEMI_PAS then
				counter_PAS:=0;
			elsif counter_PAS>DEMI_PAS then
				counter_PAS:=PAS;
			end if;
		end if;
		last_USB_DATA:=USB_DATA;
	end if;
	if counter_PAS=PAS then
		counter_PAS:=0;
	end if;
	
	if counter_PAS=DEMI_PAS then
		counter_IDLE:=counter_IDLE+1;
		if counter_IDLE=period_IDLE+period_EOP then
			counter_IDLE:=0;
		end if;
		counter_SOF_stuff:=counter_SOF_stuff+1;
		if counter_SOF_stuff=period_SOF then
			counter_SOF_stuff:=0;
		end if;
	end if;
				
--SETUP 00000000000 DATA0 00000001 01100000 00000000_10000000 00000000_00000000 00010000_00000000
--GET_DESCRIPTOR_DEVICE length=8h
--SETUP 00000000000 DATA0 00000000 10100000 00100000_00000000 00000000_00000000 00000000_00000000
--SET_ADDRESS 4
--SETUP 00100000000 DATA0 00000001 01100000 00000000_10000000 00000000_00000000 01001000_00000000
--GET_DESCRIPTOR_DEVICE length=12h
--SETUP 00100000000 DATA0 00000001 01100000 01000000_11000000 10010000_00100000 01000000_00000000
--GET_DESCRIPTOR_STRING 2 lang=409h length=2h
--SETUP 00100000000 DATA0 00000001 01100000 01000000_11000000 10010000_00100000 01101100_00000000
--GET_DESCRIPTOR_STRING 2 lang=409h length=36h
--SETUP 00100000000 DATA0 00000001 01100000 10000000_11000000 10010000_00100000 01000000_00000000
--GET_DESCRIPTOR_STRING 1 lang=409h length=2h
--SETUP 00100000000 DATA0 00000001 01100000 10000000_11000000 10010000_00100000 00110000_00000000
--GET_DESCRIPTOR_STRING 1 lang=409h length=Ch
--SETUP 00100000000 DATA0 00000001 01100000 00000000_01000000 00000000_00000000 00100000_00000000
--GET_DESCRIPTOR_CONFIG length=4h
--SETUP 00100000000 DATA0 00000001 01100000 00000000_01000000 00000000_00000000 10010100_00000000
--GET_DESCRIPTOR_CONFIG length=29h
--SETUP 00100000000 DATA0 00000000 10010000 10000000_00000000 00000000_00000000 00000000_00000000
--SET_CONFIGURATION 1
--SETUP 00100000000 DATA0 10000001 01100000 00000000_01000100 00000000_00000000 00101001_00000000
--GET_DESCRIPTOR_34 length=94h
--SETUP 00100000000 DATA0 00000001 01100000 10000000_11000000 10010000_00100000 01000000_00000000
--GET_DESCRIPTOR_STRING 1 lang=409h length=2h
--SETUP 00100000000 DATA0 00000001 01100000 10000000_11000000 10010000_00100000 00110000_00000000
--GET_DESCRIPTOR_STRING 1 lang=409h length=Ch
--SETUP 00100000000 DATA0 00000001 01100000 01000000_11000000 10010000_00100000 01000000_00000000
--GET_DESCRIPTOR_STRING 2 lang=409h length=2h
--SETUP 00100000000 DATA0 00000001 01100000 01000000_11000000 10010000_00100000 01101100_00000000
--GET_DESCRIPTOR_STRING 2 lang=409h length=36h
--SETUP 00100000000 DATA0 10000101 10000000 01001111_11000000 00000000_00000000 01001000_00000000
--CLEAR_FEATURE 3F2h length=12h
--SETUP 00100000000 DATA0 10000100 10010000 10101111_11000000 00000000_00000000 00010000_00000000
--SET_CONFIGURATION 506 length=8h
--OUT 00100000000 DATA1 10000000_00000000_00000111_00011111_11100010_01111000_10011111_11101101
--IN 00100001000



-- il y a quatre pattern :
-- -les SETUP :
--   -SET_ADDRESS, SET_CONFIGURATION,GET_INTERFACE, qui IN jusqu'à NO_DATA et ACK simplement
--   -ceux qui attendent des réponses IN jusqu'à (DATA_SIZE<DATA_MAX_SIZE or else NO_DATA) et qui OUT du coup et attendent le ACK
--     ==>DATA_SIZE ne peut pas être déterminé avant la fin d'un crc16 (cad un EOP), et le crc16 ne peut pas être déterminé sans un stuff_inv. il faut donc compter la taille du tout, en unstuff pour déterminer DATA_SIZE.
--   -ceux qui OUT 8 octets, directement après le SETUP, puis qui IN jusqu'à NO_DATA et ACK simplement
-- -le IN qui réceptionne la donnée du joystick

if next_cmd then
	next_cmd:=false;
	DEBUG_mem:=(others=>'0');
	case (step_cmd) is
		when 0=>
			trame_read(ADDR0_ENDP0,GET_DESCRIPTOR_DEVICE_8h);
			step_cmd:=1;
		when 1=>
			trame_set(ADDR0_ENDP0,SET_ADDRESS_1);
			step_cmd:=2;
		when 2=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_DEVICE_12h);
			step_cmd:=3;
		when 3=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING2_2h);
			step_cmd:=4;
		when 4=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING2_36h);
			step_cmd:=5;
		when 5=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING1_2h);
			step_cmd:=6;
		when 6=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING1_Ch);
			step_cmd:=7;
		when 7=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_CONFIG_4h);
			step_cmd:=8;
		when 8=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_CONFIG_29h);
			step_cmd:=9;
		when 9=>
			trame_set(ADDR1_ENDP0,SET_CONFIGURATION_1);
			step_cmd:=10;
		when 10=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_34_94h);
			step_cmd:=11;
		when 11=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING1_2h);
			step_cmd:=12;
		when 12=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING1_Ch);
			step_cmd:=13;
		when 13=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING2_2h);
			step_cmd:=14;
		when 14=>
			trame_read(ADDR1_ENDP0,GET_DESCRIPTOR_STRING2_36h);
			step_cmd:=15;
		when 15=>
			trame_set(ADDR1_ENDP0,GET_INTERFACE);
			step_cmd:=16;
		when 16=>
			trame_read(ADDR1_ENDP0,CLEAR_FEATURE_3F2h_12h);
			step_cmd:=17;
		when 17=>
			trame_write(ADDR1_ENDP0,SET_CONFIGURATION_506_8h,OUT_CONFIGURATION_506_8h);
			step_cmd:=18;
		when 18=>
			plug(ADDR1_ENDP1);
	end case;
end if;

		
end if;

end process;

end Behavioral;

