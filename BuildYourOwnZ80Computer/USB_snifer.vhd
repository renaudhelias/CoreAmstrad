library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity USB_snifer is
    Port ( CLK : in STD_LOGIC;
			  USB_DATA : inout  STD_LOGIC_VECTOR (1 downto 0);
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end USB_snifer;

architecture Behavioral of USB_snifer is

procedure nrzi_inv(d:std_logic;last_nrzi_inv : inout std_logic;result : out std_logic) is
begin
	if d=last_nrzi_inv then
		-- no change so '1'
		result:= '1';
	else
		result:='0';
	end if;
	last_nrzi_inv:=d;
end procedure;
--nrzi_inv('1',last_nrzi_inv,result);

begin

--USB_DATA<="HL"; -- fullspeed
USB_DATA<="ZZ"; -- fullspeed

process(CLK) is
	variable compteur:integer:=0;
	--variable old_data:std_logic_vector(1 downto 0):="00";
	variable old_usb_data_1:std_logic:='0';
	constant STATE_UNKNOWN:std_logic_vector(2 downto 0):="001";
	constant STATE_EOP:std_logic_vector(2 downto 0):="010";
	constant STATE_IDLE:std_logic_vector(2 downto 0):="011";
	constant STATE_SYNCHRO:std_logic_vector(2 downto 0):="100";
	constant STATE_PID:std_logic_vector(2 downto 0):="101";
	constant STATE_FRAME_NUMBER:std_logic_vector(2 downto 0):="110";
	constant STATE_CRC5:std_logic_vector(2 downto 0):="111";
	
	variable synchro_cursor:integer range 0 to 7:=0;
	constant SYNCHRO:std_logic_vector(7 downto 0):="00101010";
	constant clock_size:integer:=8;
	variable clock_sizing:integer:=0;
	variable clock_step:integer:=0;
	variable micro_state:std_logic_vector(2 downto 0):=STATE_UNKNOWN;
	
	constant PID_SOF:std_logic_vector(7 downto 0):="10100101";
	variable pid_cursor:integer:=0;
	
	variable frame_number_cursor:integer:=0;
	variable frame_numbering:std_logic_vector(10 downto 0):=(others=>'0');
	variable frame_number:std_logic_vector(7 downto 0):=(others=>'0'); -- les 8 poids faible des 11bits


	variable last_nrzi_inv:std_logic;
	variable result:std_logic;
	variable counter6_1:integer:=0;

--x^5+x^2+1
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
	--crc5_init
	--crc5_value:=crc5('1',crc5_value);
	--crc5_value:=crc5('1',crc5_value);
	--crc5_value:=crc5('1',crc5_value);
	--crc5_value:=crc5('1',crc5_value);
	--crc5_value:=crc5('0',crc5_value);
	--crc5_value:=crc5('1',crc5_value);
	--crc5_value:=crc5('1',crc5_value);
	----inversion : "00110" => "11001"
	--result:=not(crc5_value(4)) & not(crc5_value(3)) & not(crc5_value(2)) & not(crc5_value(1)) & not(crc5_value(0));
	
	variable crc5_cursor:integer:=0;
	
	variable error_count:integer:=0;
	variable frame_numbering_test:std_logic_vector(10 downto 0):=(others=>'0');
	
begin
	if rising_edge(CLK) then
		--leds<=conv_std_logic_vector(error_count,8);
		--leds<=frame_number;
		leds<=conv_std_logic_vector(compteur,8);
		--leds<=conv_std_logic_vector(clock_size,8);
		--EOP "00"
		--IDLE "10"
		--SYNCHRO "01".... "01010100"
		if micro_state=STATE_UNKNOWN or (USB_DATA="00" and not(micro_state=STATE_CRC5)) then
			if USB_DATA="00" then
				micro_state:=STATE_EOP;
			end if;
		elsif micro_state=STATE_EOP then
			if USB_DATA="10" then
				micro_state:=STATE_IDLE;
			elsif not(USB_DATA="00") then
				micro_state:=STATE_UNKNOWN;
			end if;
		elsif micro_state=STATE_IDLE then
			if USB_DATA="01" then
				micro_state:=STATE_SYNCHRO;synchro_cursor:=0;clock_sizing:=0;
			elsif not(USB_DATA="10") then
				micro_state:=STATE_UNKNOWN;
			end if;
		elsif micro_state=STATE_SYNCHRO then
			if synchro_cursor=0 then
				if USB_DATA(1)='1' then
					clock_step:=0;
					--clock_size:=clock_sizing+1;
					synchro_cursor:=1;
				else
					clock_sizing:=clock_sizing+1;
				end if;
			else
				clock_step:=clock_step+1;
				-- check desynchro
				if not (old_usb_data_1=USB_DATA(1)) then
					if clock_step*2<clock_size then--clock_step*3<clock_size then
						-- retard
						clock_step:=0;
					elsif clock_step*2>clock_size then --clock_step*3>clock_size*2 then
						-- avance
						clock_step:=clock_size;
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
				
				if clock_step=clock_size then
					clock_step:=0;
					if synchro_cursor=7 then
						micro_state:=STATE_PID;
						pid_cursor:=0;
						last_nrzi_inv:='0';
						counter6_1:=1; --nrzi("10000000")="00101010"
						compteur:=compteur+1; -- une trame valide trouvée !
					else
						synchro_cursor:=synchro_cursor+1;
					end if;
				elsif clock_step*2=clock_size then
					--check SYNCHRO VALUE
					--if SYNCHRO(synchro_cursor)=USB_DATA(1) then
if (SYNCHRO(synchro_cursor)='1' and USB_DATA="10") or (SYNCHRO(synchro_cursor)='0' and USB_DATA="01") then
					
						-- cool
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
			end if;
		
		elsif counter6_1>=6 then
			--zap, oui mais non, il faut zapper le bon temps
			-- une sorte de STATE_ZAP
			-- finir le clock
			clock_step:=clock_step+1;
			-- check desynchro
			if not (old_usb_data_1=USB_DATA(1)) then
				if clock_step*2<clock_size then --clock_step*3<clock_size then
					-- retard
					clock_step:=0;
				elsif clock_step*2>clock_size then --clock_step*3>clock_size*2 then
					-- avance
					clock_step:=clock_size;
				else
					-- pas cool
					micro_state:=STATE_UNKNOWN;
				end if;
			end if;
				
			if clock_step=clock_size then
				clock_step:=0;
				if counter6_1	= 7 then
					counter6_1:=0; --merci et au revoir
				else
					counter6_1:= counter6_1+1;
				end if;
			elsif clock_step*2=clock_size then
				--check VALUE
				nrzi_inv(USB_DATA(1),last_nrzi_inv,result);
				if result='0' then
					-- cool
				else
					-- pas cool
					micro_state:=STATE_UNKNOWN; -- tolérance debug : stricte
				end if;
			end if;
		else
			if micro_state=STATE_PID then
				clock_step:=clock_step+1;
				-- check desynchro
				if not (old_usb_data_1=USB_DATA(1)) then
					if clock_step*2<clock_size then --clock_step*3<clock_size then
						-- retard
						clock_step:=0;
					elsif clock_step*2>clock_size then --clock_step*3>clock_size*2 then
						-- avance
						clock_step:=clock_size;
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
				
				if clock_step=clock_size then
					clock_step:=0;
					if pid_cursor	= 7 then
						frame_number_cursor:=0;
						crc5_init;
						micro_state:=STATE_FRAME_NUMBER;
					else
						pid_cursor:=pid_cursor+1;
					end if;
				elsif clock_step*2=clock_size then
					--check VALUE
					nrzi_inv(USB_DATA(1),last_nrzi_inv,result);
					if result='1' then
						counter6_1:=counter6_1+1;
					else
						counter6_1:=0;
					end if;
					if PID_SOF(pid_cursor)=result then
						-- cool
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
			elsif micro_state=STATE_FRAME_NUMBER then
				
				clock_step:=clock_step+1;
				-- check desynchro
				if not (old_usb_data_1=USB_DATA(1)) then
					if clock_step*2<clock_size then --clock_step*3<clock_size then
						-- retard
						clock_step:=0;
					elsif clock_step*2>clock_size then --clock_step*3>clock_size*2 then
						-- avance
						clock_step:=clock_size;
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
				
				if clock_step=clock_size then
					clock_step:=0;
					if frame_number_cursor	= 10 then
						micro_state:=STATE_CRC5;
						crc5_cursor:=0;
						-- attend un peu toi... on va crc5 avant ! frame_number:=frame_numbering(10 downto 3);
					else
						frame_number_cursor:=frame_number_cursor+1;
					end if;
				elsif clock_step*2=clock_size then
					--check VALUE
					nrzi_inv(USB_DATA(1),last_nrzi_inv,result);
					crc5_value:=crc5(result,crc5_value);
					if result='1' then
						counter6_1:=counter6_1+1;
					else
						counter6_1:=0;
					end if;

					frame_numbering(frame_number_cursor):=result;
				end if;
				
			elsif micro_state=STATE_CRC5 then
				
				clock_step:=clock_step+1;
				-- check desynchro
				if not (old_usb_data_1=USB_DATA(1)) then
					if clock_step*2<clock_size then --clock_step*3<clock_size then
						-- retard
						clock_step:=0;
					elsif clock_step*2>clock_size then --clock_step*3>clock_size*2 then
						-- avance
						clock_step:=clock_size;
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
				
				if clock_step=clock_size then
					clock_step:=0;
					if crc5_cursor	= 4 then
						micro_state:=STATE_UNKNOWN;
						-- on valide
						
						if frame_numbering_test=frame_numbering then
							-- cool
						else
							frame_numbering_test:=frame_numbering_test+1;
							if frame_numbering_test=frame_numbering then
								-- cool
							else
								-- pas cool
								error_count:=error_count+1;
							end if;
						end if;

						frame_number:=frame_numbering(10 downto 3);
						frame_numbering_test:=frame_numbering;
						
						
					else
						crc5_cursor:=crc5_cursor+1;
					end if;
				elsif clock_step*2=clock_size then
					--check VALUE
					nrzi_inv(USB_DATA(1),last_nrzi_inv,result);
					if result='1' then
						counter6_1:=counter6_1+1;
					else
						counter6_1:=0;
					end if;
					if crc5_value(crc5_cursor)=not(result) then
						-- cool
					else
						-- pas cool
						micro_state:=STATE_UNKNOWN;
					end if;
				end if;
				
			end if;
		end if;
			
		old_usb_data_1:=USB_DATA(1);
	end if;
end process;

end Behavioral;

