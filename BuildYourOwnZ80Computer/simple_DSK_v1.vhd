library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity simple_DSK is
	Generic (
		MAX_SECTORS:integer:=9;
		MAX_TRACKS:integer:=40; -- 40 par face 79+1
		PIF_SPEEDUP:boolean:=true
	);
    Port ( nCLK4_1 : in  STD_LOGIC;
           reset : in STD_LOGIC;
           A10_A8_A7 : in  STD_LOGIC_VECTOR (2 downto 0); -- chip select
           A0 : in  STD_LOGIC;-- data/status reg select
           IO_RD : in  STD_LOGIC;
           IO_WR : in  STD_LOGIC;
           D_command : in  STD_LOGIC_VECTOR (7 downto 0);
           D_result : inout  STD_LOGIC_VECTOR (7 downto 0);

			  cafe:in std_logic;
			  --cafePifHercule:in std_logic;
			  DSK_select : out STD_LOGIC_VECTOR (7 downto 0) := (others=>'0');
			  change : out std_logic := '1';

           dsk_A : out  STD_LOGIC_VECTOR (19 downto 0);
           dsk_W : out  STD_LOGIC;
           dsk_R : out  STD_LOGIC;
			  transmit : out STD_LOGIC; -- direct transmission between DSK and Z80 following dsk_A/dsk_R/dsk_W
			  is_ucpm : in std_logic
			  
			  --FDD_output :out STD_LOGIC_VECTOR (6 downto 0);
			  --FDD_input :in STD_LOGIC_VECTOR (5 downto 0)
			  
			  );
end simple_DSK;

architecture Behavioral of simple_DSK is
	--constant FDD_SEEKING : STD_LOGIC_VECTOR (7 downto 0):=x"0F";
	constant REQ_MASTER : STD_LOGIC_VECTOR (7 downto 0):=x"80";
	constant DATA_IN_OUT : STD_LOGIC_VECTOR (7 downto 0):=x"40";
	constant COMMAND_BUSY : STD_LOGIC_VECTOR (7 downto 0):=x"10";
	constant EXEC_MODE : STD_LOGIC_VECTOR (7 downto 0):=x"20";

	signal status:STD_LOGIC_VECTOR (7 downto 0):=REQ_MASTER;
	--signal status_sans_pif:STD_LOGIC_VECTOR (7 downto 0):=REQ_MASTER;
	
	constant ST0_SEEK_END : std_logic_vector(7 downto 0):=x"20";
	
	constant ETAT_OSEF:integer range 0 to 4:=0;
	constant ETAT_READ_DIAGNOSTIC:integer range 0 to 4:=1;
	constant ETAT_READ:integer range 0 to 4:=2;
	constant ETAT_SEEK:integer range 0 to 4:=3;
	constant ETAT_WRITE:integer range 0 to 4:=4;
	
	constant PHASE_ATTENTE_COMMANDE:integer range 0 to 4:=0;
	constant PHASE_COMMAND:integer range 0 to 4:=1;
	constant PHASE_EXECUTION_READ:integer range 0 to 4:=2;
	constant PHASE_EXECUTION_WRITE:integer range 0 to 4:=3;
	constant PHASE_RESULT:integer range 0 to 4:=4;

	signal phase:integer range 0 to 4:=PHASE_ATTENTE_COMMANDE;
	
	constant NB_SECTOR_PER_PISTE:integer:=15; -- donc on n'en �crit pas plus entre deux INDEX
	constant NB_PISTE_PER_FACE:integer:=80;
	constant NB_FACE:integer:=2;
	
	
begin

status <= REQ_MASTER when phase = PHASE_ATTENTE_COMMANDE
	else REQ_MASTER or COMMAND_BUSY when phase = PHASE_COMMAND
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE when phase = PHASE_EXECUTION_READ
	else REQ_MASTER or COMMAND_BUSY or EXEC_MODE or DATA_IN_OUT when phase = PHASE_EXECUTION_WRITE
	else REQ_MASTER or COMMAND_BUSY or DATA_IN_OUT when phase = PHASE_RESULT
	else REQ_MASTER;

change<='1';-- when change_state='1' else '0';


-- vue qu'on doit prendre en compte directement les commandes demand�s par le z80
-- il va faloir g�rer la RAM directement
cortex:process(nCLK4_1,reset)
	variable current_track:integer range 0 to MAX_TRACKS;
	variable current_sector:integer range 0 to MAX_SECTORS;
	variable current_byte:integer;
	--type sector_size_type is array(0 to 4) of integer;
	--constant SECTOR_SIZES:sector_size_type:=(128,256,512,1024,2048);--(x"80",x"100",x"200",x"400",x"800",x"1000",x"1800");
	constant SECTOR_SIZE:integer:=512; -- les formats prot�g�s sont SECTOR_SIZES(6)
	
	type params_type is array(0 to 7) of std_logic_vector(7 downto 0);
	type results_type is array(0 to 6) of std_logic_vector(7 downto 0);
	variable command_restant:integer range 0 to 8;
	variable params:params_type; -- � empiler params(command_restant)
	variable exec_restant:integer;
	variable exec_restant_write:integer;
	variable result_restant:integer range 0 to 7;
	variable results:results_type; -- � d�piler results(result_restant)
	type chrn_type is array(0 to 3) of std_logic_vector(7 downto 0);
	variable chrn:chrn_type;
	-- track 0 ou +
	-- sector 0 ou +
	-- return [sectTrack,sectSize,sectId,sectSize]
	function getCHRN (track: in integer range 0 to MAX_TRACKS-1;sector: in integer range 0 to MAX_SECTORS-1;ucpm:std_logic) return chrn_type is
		variable chrn:chrn_type;
	begin
		--return (track_id(track),x"00",sector_ids_of_tracks(track,sector),sector_sizes_of_tracks(track,sector));
-- "C:/Users/freemac/BuildYourOwnZ80Computer/simple_DSK.vhd" line 170: Index value(s) does not match array range, simulation mismatch.
		if ucpm='1' then
			chrn:=(conv_std_logic_vector(track,8),x"00",conv_std_logic_vector(sector,8)+x"41",x"02");
		else
			chrn:=(conv_std_logic_vector(track,8),x"00",conv_std_logic_vector(sector,8)+x"C1",x"02");
		end if;
		return chrn;
	end getCHRN;
	-- retourne le pointeur dans memory
	function getData(chrn: in chrn_type) return std_logic_vector is
		variable address:std_logic_vector(19 downto 0); -- simulator Cannot access 'dsk_a' from inside pure function 'getdata'. --dsk_A'range);
		variable pff:std_logic_vector(7 downto 0);
	begin
		pff:="0000" & chrn(2)(3 downto 0);
		pff:=pff-1;
		address:=chrn(0)(5 downto 0) & chrn(1)(0) & pff(3 downto 0) & "0" & x"00";
		return address;
	end getData;
	variable etat:integer range 0 to 4;
	variable command:std_logic_vector(7 downto 0);
	variable dsk_A_mem:STD_LOGIC_VECTOR (dsk_A'range);
	variable data:std_logic_vector(7 downto 0);
	variable was_concerned:boolean:=false;
	variable do_update:boolean;

	variable DSK_select_mem:std_logic_vector(7 downto 0);
begin

	if reset='1' then
		D_result<=(others=>'Z');
		dsk_A<=(others=>'0');
		current_track:=0;
		current_sector:=0;
		current_byte:=0;
		command_restant:=0;
		exec_restant:=0;
		result_restant:=0;
		etat:=ETAT_OSEF;
		transmit<='0';
		dsk_R<='0';
		dsk_W<='0';
		data:=(others=>'0');
		
		was_concerned:=false;
		do_update:=false;
	elsif rising_edge(nCLK4_1) then --CLK4
			if cafe='1' and IO_WR='1' then
				DSK_select_mem:=D_command;
				DSK_select<=DSK_select_mem;
				--change_state<='1';
			elsif cafe='1' and IO_RD='1' then
				D_result<= DSK_select_mem;--"0000" & "000" & change_state;
			elsif (IO_RD='1' or IO_WR='1') and A10_A8_A7=b"010"  then
				-- I am concerned
				if was_concerned then --and M1_n='1'
					-- on touche surtout � rien
					do_update:=false;
					was_concerned:=true;
				else
					-- nouveau
					do_update:=true;
					was_concerned:=true;
				end if;
			else
				-- I am not concerned : liberation entr�e/sorties
				dsk_R<='0';
				dsk_W<='0';
				transmit<='0';
				D_result<=(others=>'Z');

				was_concerned:=false;
				do_update:=false;
			end if;
			--end if;
			if do_update then
				--if CLK4(1)='1' then
					-- z80 is solved
					transmit<='0';
					dsk_R<='0';
					dsk_W<='0';
					D_result<=(others=>'Z');
					if (IO_RD='1' and A10_A8_A7=b"010" and A0='0') then
						-- read status
						-- read status
						D_result<=status;
						transmit<='0';
					elsif (IO_RD='1' and A10_A8_A7=b"010" and A0='1') then
						-- read data
						if phase=PHASE_EXECUTION_READ then
							if exec_restant>0 then
								exec_restant:=exec_restant-1;
							end if;
							if etat=ETAT_READ then
								--transmit<='1';
								chrn:=getCHRN(current_track,current_sector,is_ucpm);
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								if current_byte>=SECTOR_SIZE then
									current_sector:=current_sector+1;
									--if sector_count_of_tracks(current_track)>=current_sector then
									if MAX_SECTORS=current_sector then
										current_sector:=0;
										current_track:=current_track+1;
										if MAX_TRACKS=current_track then
											current_track:=0; -- rotate XD
										end if;
									end if;
									current_byte:=0;
									chrn:=getCHRN(current_track,current_sector,is_ucpm);
								end if;
								dsk_A_mem:=getData(chrn)+current_byte;
								dsk_A<=dsk_A_mem;
								dsk_R<='1';
								transmit<='1';
								current_byte:=current_byte+1;
								
								
								
								if exec_restant=0 then
									phase<=PHASE_RESULT;
									result_restant:=7;
									results(6):=ST0_SEEK_END; -- ST0
									results(5):=x"00"; -- ST1
									results(4):=x"00"; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5); -- H
									results(1):=params(4); -- R
									results(0):=params(3); -- N
								end if;
								
							else
								-- BIZARRE
							end if;
							
							
							
							
							
						
						elsif phase=PHASE_RESULT then
							if result_restant>0 then
								result_restant:=result_restant-1;
								data:=results(result_restant); -- d�pile
								D_result<=data;
								transmit<='0';
								if result_restant=0 then
									phase<=PHASE_ATTENTE_COMMANDE;
									etat:=ETAT_OSEF;
								end if;
							else
								-- BIZARRE
							end if;
						end if;
							
							
							
					
					elsif (IO_WR='1' and A10_A8_A7=b"010" and A0='0') then
						-- BIZARRE
					elsif (IO_WR='1' and A10_A8_A7=b"010" and A0='1') then
						-- write data
						
						if phase=PHASE_EXECUTION_WRITE then
							if exec_restant_write>0 then
								exec_restant_write:=exec_restant_write-1;
							end if;
							if etat=ETAT_WRITE then
								chrn:=getCHRN(current_track,current_sector,is_ucpm);
								--if current_byte>=SECTOR_SIZES(chrn(3)) then
								if current_byte>=SECTOR_SIZE then
									current_sector:=current_sector+1;
									--if sector_count_of_tracks(current_track)>=current_sector then
									if MAX_SECTORS=current_sector then
										current_sector:=0;
										current_track:=current_track+1;
										if MAX_TRACKS=current_track then
											current_track:=0; -- rotate XD
										end if;
									end if;
									current_byte:=0;
									chrn:=getCHRN(current_track,current_sector,is_ucpm);
								end if;
								dsk_A_mem:=getData(chrn)+current_byte;
								dsk_A<=dsk_A_mem;
								dsk_W<='1';
								data:=D_command;
								--dsk_info_D<=data;
								transmit<='1';
								current_byte:=current_byte+1;
							else
								-- BIZARRE
							end if;
						end if;
						-- au second tick
						
						-- write data
						if phase=PHASE_EXECUTION_WRITE then
							-- not implemented
							if etat=ETAT_WRITE then
								--transmit<='0';
								--dsk_W<='0';
								--dsk_info_D<=(others=>'Z');
								if exec_restant_write=0 then
									phase<=PHASE_RESULT;
									result_restant:=7;
									results(6):=ST0_SEEK_END; -- ST0
									results(5):=x"00"; -- ST1
									results(4):=x"00"; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5); -- H
									results(1):=params(2); --params(4); -- R EOT
									results(0):=params(3); -- N
								end if;
							end if;
						elsif phase=PHASE_ATTENTE_COMMANDE then
							command_restant:=0;
							exec_restant:=0;
							exec_restant_write:=0;
							result_restant:=0;
							etat:=ETAT_OSEF;
							phase<=PHASE_ATTENTE_COMMANDE;
							-- MT MF et SK (les trois premiers bits de D on s'en fou)
							command:=D_command and x"1f";
							case command is
								when x"03" => -- specify
									command_restant:=2;
									phase<=PHASE_COMMAND;
								when x"07" => -- recalibrate
									command_restant:=1;
									phase<=PHASE_COMMAND;
									-- goto track 0
									current_track:=0;
									current_sector:=0;
								when x"08" => -- sense interrupt status : status information about the FDC at the end of operation
									result_restant:=2;
									phase<=PHASE_RESULT;
									results(1):=ST0_SEEK_END;
									results(0):=conv_std_logic_vector(current_track,8); -- PCN : Present Cylinder Number
								when x"0a" => -- read id
									command_restant:=1; -- select drive/side : osef
									chrn:=getCHRN(current_track,current_sector,is_ucpm);
									result_restant:=7;
									phase<=PHASE_COMMAND;
									results(6):=ST0_SEEK_END;
									results(5):=x"00"; -- ST1
									results(4):=x"00"; -- ST2
									results(3):=chrn(0);
									results(2):=chrn(1);
									results(1):=chrn(2);
									results(0):=chrn(3);
								when x"02" => -- read diagnostic
									etat:=ETAT_READ_DIAGNOSTIC;
									phase<=PHASE_COMMAND;
									command_restant:=8; -- dont EOT qui d�termine jusqu'o� il faut lire buffer
								when x"06" => -- read
									command_restant:=8;
									etat:=ETAT_READ;
									phase<=PHASE_COMMAND;
								when x"0f" => -- seek : changement de track
									phase<=PHASE_COMMAND;
									command_restant:=2;
									etat:=ETAT_SEEK;


								when x"05" => -- write data
									command_restant:=8;
									phase<=PHASE_COMMAND;
									etat:=ETAT_WRITE;
									
									
									
								when others => --BIZARRE
							end case;
						elsif phase=PHASE_COMMAND then
							if command_restant>0 then
								command_restant:=command_restant-1;
								params(command_restant):=D_command;
							end if;
							if command_restant=0 then
								if etat=ETAT_READ_DIAGNOSTIC then
									-- params select C H R N EOT GPL DTL
									result_restant:=7;
									results(6):=ST0_SEEK_END;
									results(5):=x"00"; -- ST1
									results(4):=x"00"; -- ST2
									results(3):=params(6); -- C
									results(2):=params(5);-- H
									results(1):=params(2); -- EOT as sector_id
									current_track:=conv_integer(params(6));
									current_sector:=conv_integer(params(2)(3 downto 0))-1;
									--results(0):=sector_sizes_of_tracks(current_track,current_sector); -- N
									results(0):=x"02"; -- N
								elsif etat=ETAT_READ then
									-- params select C H R N EOT GPL DTL
									if params(3)>0 then -- N
										exec_restant:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										exec_restant:=conv_integer(params(0));
									end if;
									current_track:=conv_integer(params(6));
									current_sector:=conv_integer(params(4)(3 downto 0))-1;
									current_byte:=0;
								elsif etat=ETAT_SEEK then
									-- params select NCN
									current_track:=conv_integer(params(0)); -- NCN
									current_sector:=0;
									current_byte:=0;
								elsif etat=ETAT_WRITE then
									-- params select C H R N EOT GPL DTL
									if params(3)>0 then -- N
										exec_restant_write:=SECTOR_SIZE;--S(params(3)); -- SECTOR_SIZES(params(3))
									else
										exec_restant_write:=conv_integer(params(0)); -- DTL
									end if;
									current_track:=conv_integer(params(6));
									current_sector:=conv_integer(params(4)(3 downto 0))-1;
									current_byte:=0;
									
								end if;
								if exec_restant>0 then
									phase<=PHASE_EXECUTION_READ; -- on passe en mode execution_read
									--transmit<='1';
								elsif exec_restant_write>0 then
									phase<=PHASE_EXECUTION_WRITE;
								elsif result_restant>0 then
									phase<=PHASE_RESULT; -- on passe en mode RESULT
								else
									phase<=PHASE_ATTENTE_COMMANDE;
								end if;
							end if;
						end if;
						
						
					end if;

			end if; --do_update
	end if;
end process cortex;


end Behavioral;
