library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.VComponents.all;

--Test de performance du composant avec une SDHC de classe 4
--lecture : CLK@6.25MHz & ram_CLK@381,4697265625Hz (divisé par 2**14, counter(13))
--écriture : CLK@6.25MHz & ram_CLK@5,9604644775390625Hz (divisé par (2**16)*(2**4), counter(15)_counter2(3))

entity DraculaSD is
    Generic(
			  RAM_A_MAX_SIZE:integer:=24;
			  --RAM_COUNT:integer:=5;
				-- le SPI mode ne fonctionne pas avec 2048 block
				-- windob ne formate pas en 512 block
				ROM_COUNT:integer:=2; -- attention ya du code en dur : "if files_loaded="11111" then"
				BLOCK_SIZE:integer:=4096; -- bytes
				FAT32_SECTOR0_OFFSET:STD_LOGIC_VECTOR (31 downto 0):=x"00400000" -- in byte
			  );
    Port ( CLK : in  STD_LOGIC;
           ram_CLK : in  STD_LOGIC;
           ram_S : in  STD_LOGIC_VECTOR (ROM_COUNT downto 0):=(others=>'0');
           ram_A : in  STD_LOGIC_VECTOR (RAM_A_MAX_SIZE-1 downto 0):=(others=>'0');
           ram_Din : in  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
			  ram_Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           ram_W : in  STD_LOGIC:='0';
           ram_R : in  STD_LOGIC:='0';

           ready : out  STD_LOGIC; -- internal bootload done
			  busy : out  STD_LOGIC:='0'; -- si falling_edge, alors une action a été effectuée.
           
			  -- special
			  -- la nième chargé au démarrage, utilisé dans le cas ram_S=ROM_COUNT
           file_select:in std_logic_vector(7 downto 0):=(others=>'0'); 
			  leds:out STD_LOGIC_VECTOR(7 downto 0);
			  
			  
			  -- special HACK, permet d'accélérer il faut commencer par lire ou écrire le premier byte du BLOCK (512 bytes) pour bien être dessus, et après faire les insertions, puis finalement écrire le dernier byte.
			  special_W:in STD_LOGIC:='0'; -- write on current cache block, in one CLK
           
			  --SDRAM
			  SS_n : out  STD_LOGIC;
			  MOSI : out  STD_LOGIC;
			  MISO : in  STD_LOGIC;
			  SCLK : out  STD_LOGIC;
			  CD_n : in  STD_LOGIC -- osef ='0' si carte inséré
			  );
end DraculaSD;

architecture Behavioral of DraculaSD is

--SPIMASTER part
COMPONENT SDRAM_SPIMASTER
	PORT(
		address : IN std_logic_vector(31 downto 0);
		SCLK : IN std_logic;
		MISO : IN std_logic;
		SS_n : OUT std_logic;
		CD_n : IN std_logic;
		spi_R : IN std_logic;          
		data_in : IN std_logic_vector(7 downto 0);
		data_out : OUT std_logic_vector(7 downto 0);
		MOSI : OUT std_logic;
		spi_Rdone : OUT std_logic;
		spi_W:in STD_LOGIC;
		spi_Wdone:out STD_LOGIC;
		spi_init_done : OUT std_logic;
		special_W:in STD_LOGIC;
		leds : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;


   signal spi_A : STD_LOGIC_VECTOR (31 downto 0):=(others=>'0');
   signal spi_Din : STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
	signal spi_Dout : STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
   signal spi_R : STD_LOGIC:='0';
   signal spi_Rdone : STD_LOGIC:='1';
	signal spi_W : STD_LOGIC:='0';
   signal spi_Wdone : STD_LOGIC:='1';
	signal spi_init_done : STD_LOGIC:='0';
--	constant stop:std_logic:='0'; -- stop main state machine
	signal load_init_done:std_logic:='0';
	signal SCLK_generated:std_logic:='0';

-- FAT32_LOADER part

	subtype filename_type is string(1 to 11);
	type list_filename_type is array (natural range <>) of filename_type;
	constant list_filename_defragmented:list_filename_type(ROM_COUNT-1 downto 0):=
	("NEXYSRA2BIN","NEXYSRAMBIN");
	subtype fileextension_type is string(1 to 3);
	constant file_extension:fileextension_type:="DSK";

	-- et c'est tout : les tailles se déduisent ou sinon prennent le maximum RAM_A_MAX_SIZE
	-- on sélectionne la RAM voulue via une entrée "switch"





	
	-- selon wiki eng : file allocation table
	constant BPB_RsvdSecCnt_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(14,spi_A'length);
	constant BPB_NumFATs_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(16,spi_A'length);
	constant BPB_FATSz32_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(36,spi_A'length);
	constant BPB_SecPerClus_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(13,spi_A'length);
	constant BPB_RootClus_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(44,spi_A'length);
	constant BPB_TotSec32_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(32,spi_A'length);
	constant BPB_BytsPerSec_addr:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(11,spi_A'length);






subtype file_name_type is std_logic_vector(11*8-1 downto 0);
function name_to_std_logic_vector(name:filename_type) return file_name_type is
	variable result:std_logic_vector(11*8-1 downto 0);
begin
	for i in 10 downto 0 loop
		result(8*(i+1)-1 downto 8*(i)):=conv_std_logic_vector(character'pos(name(11-i)),8);
	end loop;
	return result;
end function;

subtype file_extension_type is std_logic_vector(3*8-1 downto 0);
function extension_to_std_logic_vector(name:fileextension_type) return file_extension_type is
	variable result:std_logic_vector(3*8-1 downto 0);
begin
	for i in 2 downto 0 loop
		result(8*(i+1)-1 downto 8*(i)):=conv_std_logic_vector(character'pos(name(3-i)),8);
	end loop;
	return result;
end function;
		

	signal spi_A2:std_logic_vector(31 downto 0);
	signal spi_Din2:std_logic_vector(7 downto 0);
	signal special_W2:std_logic;
begin

	SCLK_generated<=CLK;
	SCLK<=SCLK_generated;
	ready<=load_init_done;

	Inst_SDRAM_SPIMASTER: SDRAM_SPIMASTER PORT MAP(
		address => spi_A2,
		data_in => spi_Din2,
		data_out => spi_Dout,
		SCLK => SCLK_generated,
		MOSI => MOSI,
		MISO => MISO,
		SS_n=> SS_n,
		CD_n=> CD_n,
		spi_R => spi_R,
		spi_Rdone => spi_Rdone,
		spi_W=>spi_W,
		spi_Wdone=> spi_Wdone,
		spi_init_done => spi_init_done,
		special_W => special_W2,
		leds => OPEN
	);

spi_A2<="00000000" & ram_A when special_W='1' else spi_A;
spi_Din2<=ram_Din when special_W='1' else spi_Din;
special_W2<='1' when special_W='1' else '0';

--check FAT32 fichiers défragmentés inexistants (trouver les trou et créer l'espace fichier carré défragmenté) - 2 jours
--=> test sur le PC : fichier vide de taille carré créé
---check FAT32 fichiers défragmentés existants (vérifier que l'espace est bien carré et défragmenté) - 0.5 jour
--=> test sur le PC : modification hexa d'un fichier créé précédemment, affichage d'une donnée à une adresse fixe sur les LEDS



	






	tortue_geniale:process (CLK,file_select) is

constant ATTR_ARCHIVE:std_logic_vector(7 downto 0):=x"20";
	
		subtype address_type is std_logic_vector(31 downto 0);
		type list_address_start_type is array(ROM_COUNT downto 0) of address_type;
		variable list_address_start:list_address_start_type;
			
		variable BPB_FATSz32:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_TotSec32:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_BytsPerSec:STD_LOGIC_VECTOR(15 downto 0);
		variable BPB_SecPerClus:STD_LOGIC_VECTOR(7 downto 0);
		variable BPB_RootClus:STD_LOGIC_VECTOR(31 downto 0);
		variable BPB_RsvdSecCnt:STD_LOGIC_VECTOR(15 downto 0);
		variable BPB_NumFATs:STD_LOGIC_VECTOR(7 downto 0);
	
		variable FATSz:integer;
		variable TotSec:integer;
		variable FirstDataSector:integer;
		variable FirstSectorofCluster:integer;
		variable FirstRootDirSecNum:integer;
		
		-- un BLOCK ?
		type spi_Dmem_type is array(32-1 downto 0) of std_logic_vector(7 downto 0);
		variable spi_Dmem:spi_Dmem_type;
		
		--variable spi_Rmem:std_logic:='0';
		--variable spi_Wmem:std_logic:='0';
		
		variable reste_byte_read:boolean:=false;
		variable reste_byte_write:boolean:=false;
		variable reste_byte_read_cursor:integer range 0 to 32-1:=0;
		variable reste_byte_write_cursor:integer range 0 to 32-1:=0;
		variable target_address:address_type;
		
-- le premier param permet juste de checker la taille de la variable à la compilation
procedure get_var1(var_name: in STD_LOGIC_VECTOR(7 downto 0);var_addr:address_type) is
begin
	reste_byte_read:=true;
	reste_byte_read_cursor:=0;
	target_address:=var_addr;
	spi_A<=target_address;
	spi_R<='1';
end;
procedure get_var2(var_name: in STD_LOGIC_VECTOR(15 downto 0);var_addr:address_type) is
begin
	reste_byte_read:=true;
	reste_byte_read_cursor:=1;
	target_address:=var_addr;
	spi_A<=target_address;
	spi_R<='1';
end;
procedure get_var4(var_name: in STD_LOGIC_VECTOR(31 downto 0);var_addr:address_type) is
begin
	reste_byte_read:=true;
	reste_byte_read_cursor:=3;
	target_address:=var_addr;
	spi_A<=target_address;
	spi_R<='1';
end;


function fix_big_endian1(var_name: in STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
begin
	return var_name;
end;
function fix_big_endian2(var_name: in STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(15 downto 0); -- frontiere a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8);
	return cache;
end;
function fix_big_endian4(var_name: in STD_LOGIC_VECTOR(31 downto 0)) return STD_LOGIC_VECTOR is
	variable cache:STD_LOGIC_VECTOR(31 downto 0); -- frontiere a=f(a)
begin
	cache:=var_name(7 downto 0) & var_name(15 downto 8) & var_name(23 downto 16) & var_name(31 downto 24);
	return cache;
end;

function fix12(var_name: in STD_LOGIC_VECTOR(12*8-1 downto 0)) return STD_LOGIC_VECTOR is
begin
	return var_name;
end;

function fix4(var_name: in STD_LOGIC_VECTOR(4*8-1 downto 0)) return STD_LOGIC_VECTOR is
begin
	return var_name;
end;


procedure get_var12(name:std_logic_vector(8*12-1 downto 0);address:address_type) is
begin
	reste_byte_read:=true;
	reste_byte_read_cursor:=11;
	target_address:=address;
	spi_A<=target_address;
	spi_R<='1';
end procedure;

procedure insert12(name:std_logic_vector(8*12-1 downto 0);address:address_type) is
begin
	for i in 0 to 11 loop
		for j in 0 to 7 loop
			spi_Dmem(i)(j):=name(8*i+j);
		end loop;
	end loop;
	reste_byte_write:=true;
	reste_byte_write_cursor:=11;
	target_address:=address;
	spi_Din<=spi_Dmem(reste_byte_write_cursor);
	spi_A<=target_address;
	spi_W<='1';
end procedure;

procedure insert32(name:std_logic_vector(8*32-1 downto 0);address:address_type) is
begin
	for i in 0 to 31 loop
		for j in 0 to 7 loop
			spi_Dmem(i)(j):=name(8*i+j);
		end loop;
	end loop;
	reste_byte_write:=true;
	reste_byte_write_cursor:=31;
	target_address:=address;
	spi_Din<=spi_Dmem(reste_byte_write_cursor);
	spi_A<=target_address;
	spi_W<='1';
end procedure;

-- 4 bytes ça fait 32 bit :)
procedure insert4(name:std_logic_vector(8*4-1 downto 0);address:address_type) is
begin
	for i in 0 to 3 loop
		for j in 0 to 7 loop
			spi_Dmem(i)(j):=name(8*i+j);
		end loop;
	end loop;
	reste_byte_write:=true;
	reste_byte_write_cursor:=3;
	target_address:=address;
	spi_Din<=spi_Dmem(reste_byte_write_cursor);
	spi_A<=target_address;
	spi_W<='1';
end procedure;



-- retourne l'addresse memoire pointant vers le début du secteur
--subtype address_type is std_logic_vector(31 downto 0);
impure function getSector(cluster:std_logic_vector(31 downto 0)) return address_type is
begin
	return (conv_std_logic_vector((((conv_integer(cluster)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec),32)+FAT32_SECTOR0_OFFSET);
end function;
-- retourne l'addresse memoire pointant vers le début du cluster suivant dans le FAT
impure function getFAT(cluster:std_logic_vector(31 downto 0)) return address_type is
begin
	--chaque cluster 4 bytes
	return conv_std_logic_vector(conv_integer(BPB_RsvdSecCnt)*conv_integer(BPB_BytsPerSec)+conv_integer(cluster)*4,32)+FAT32_SECTOR0_OFFSET;
end function;


-- free cluster
function fc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster = x"00000000";
end function;

-- reserved cluster
function rc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster = x"00000001" or (cluster>=x"0FFFFFF0" and cluster<=x"0FFFFFF7");
end function;

-- end of cluster
function eoc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster >= x"0FFFFFF8" and cluster <= x"0FFFFFFF" ;
end function;

-- out of range cluster
function oc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return cluster > x"0FFFFFFF";
end function;

-- general bad/useless cluster
function bc(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return fc(cluster) or rc(cluster) or eoc(cluster) or oc(cluster);
end function;

-- empty cluster (can be used as new one)
function ec(cluster:std_logic_vector(31 downto 0)) return boolean is
begin
	return fc(cluster) ; -- lol and not(rc(cluster) or eoc(cluster) or oc(cluster));
end function;


		variable step_var:integer range 0 to 43:=0;
		variable load_done:std_logic:='0';
		
		variable folder_cluster_pointer:std_logic_vector(31 downto 0); -- number
		variable file_cluster_pointer:std_logic_vector(31 downto 0); -- number
		
		variable file_cluster_pointer_H:std_logic_vector(15 downto 0);
		variable file_cluster_pointer_L:std_logic_vector(15 downto 0);
		variable folder_sector_pointer:std_logic_vector(31 downto 0);
		variable file_sector_pointer:std_logic_vector(31 downto 0);

		variable first_cluster_pointer:std_logic_vector(31 downto 0);
		variable first_cluster_pointer_H:std_logic_vector(15 downto 0);
		variable first_cluster_pointer_L:std_logic_vector(15 downto 0);

		
		variable rom_number:integer range 0 to ROM_COUNT:=0;
		variable rom_number_created:integer range 0 to ROM_COUNT:=0;
		
		--variable file_address:std_logic_vector(31 downto 0);
		variable folder_DirStruct_number:integer;
		
		variable file_size:std_logic_vector(31 downto 0);
		
		--files_loaded(0) : dsk loaded
		--files_loaded(1:3) : rom 1 2 3 loaded
		variable files_loaded:std_logic_vector(ROM_COUNT downto 0):=(others=>'0');
		--depuis que les fichiers vides sont créé, ce n'est plus important
		--constant files_loaded_finished:std_logic_vector(ROM_COUNT downto 0):=(others=>'1');
		variable passe2:boolean:=false;

		variable espace:integer range 0 to 2**(RAM_A_MAX_SIZE-12)-1:=0;
		
		--variable last_folder_cluster_pointer:boolean:=false;
		
		
		variable last_ram_CLK:std_logic:='0';
		
		variable ram_ready:boolean:=true; -- à true, pour le cas où load_done passe à 1 pour la première fois



	subtype number_S is integer range 0 to ROM_COUNT;
	function ram_S_to_number_S(ram_S : STD_LOGIC_VECTOR (ROM_COUNT downto 0)) return number_S is
		variable r:integer:=0;
	begin
		for i in ROM_COUNT downto 0 loop
			if ram_S(i)='1' then
				r:=i;
			end if;
		end loop;
		return r;
	end function;


		--variable dsk_address_start:address_type:=(others=>'0');
		variable dsk_found:boolean:=false;
		variable dsk_number:std_logic_vector(7 downto 0):=(others=>'0');
		
	begin
		load_init_done<=load_done;
		
		if rising_edge(CLK) then
		
		
		--ram_Dout<= ram_A(7 downto 0);
		
			leds<=conv_std_logic_vector(step_var,8);
		
		
			spi_R<='0';
			spi_W<='0';
				
		
			if spi_init_done='1' then
			
	--spi_Rmem<='0';
	--spi_Wmem<='0';
if spi_Rdone='1' and spi_Wdone='1' and spi_R='0' and spi_W='0' then

if reste_byte_read then
--	-- traiter le byte suivant (lecture ou écriture)
	spi_Dmem(reste_byte_read_cursor):=spi_Dout;
	if reste_byte_read_cursor=0 then
		reste_byte_read:=false;
	else
		target_address:=target_address+1;
		spi_A<=target_address;
		spi_R<='1';
		reste_byte_read_cursor:=reste_byte_read_cursor-1;
	end if;
elsif reste_byte_write then
	-- traiter le byte suivant (lecture ou écriture)
	if reste_byte_write_cursor=0 then
		reste_byte_write:=false;
	else
		target_address:=target_address+1;
		spi_A<=target_address;
		spi_W<='1';
		reste_byte_write_cursor:=reste_byte_write_cursor-1;
		spi_Din<=spi_Dmem(reste_byte_write_cursor);
	end if;
elsif load_done='0' then
	
	-- lancer des commandes bootload interne, commençant par le premier byte

				case step_var is
					when 0 =>
						get_var4(BPB_FATSz32,BPB_FATSz32_addr+FAT32_SECTOR0_OFFSET);
						step_var:=1;
					when 1 =>
						BPB_FATSz32:=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0));
						get_var4(BPB_TotSec32,BPB_TotSec32_addr+FAT32_SECTOR0_OFFSET);
						step_var:=2;
					when 2=>
						BPB_TotSec32:=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0));
						get_var1(BPB_SecPerClus,BPB_SecPerClus_addr+FAT32_SECTOR0_OFFSET);
						step_var:=3;
					when 3=>
						BPB_SecPerClus:=fix_big_endian1(spi_Dmem(0));
						get_var4(BPB_RootClus,BPB_RootClus_addr+FAT32_SECTOR0_OFFSET);
						step_var:=4;
					when 4=>
						--BPB_RootClus:=spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0); --
						BPB_RootClus:=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0));
--leds<=spi_Dmem(3);
-- 0 : "00000000"
-- 3 : "00001000"
						

						get_var2(BPB_RsvdSecCnt,BPB_RsvdSecCnt_addr+FAT32_SECTOR0_OFFSET);
						step_var:=5;
					when 5=>
						BPB_RsvdSecCnt:=fix_big_endian2(spi_Dmem(1) & spi_Dmem(0));
						get_var1(BPB_NumFATs,BPB_NumFATs_addr+FAT32_SECTOR0_OFFSET);
						step_var:=6;
					when 6=>
						BPB_NumFATs:=fix_big_endian1(spi_Dmem(0));
						get_var2(BPB_BytsPerSec,BPB_BytsPerSec_addr+FAT32_SECTOR0_OFFSET);
						step_var:=7;
					when 7=>
						--===========================================
						--== FIN DE CHARGEMENT DES VARIABLES DU BR ==
						--===========================================
						BPB_BytsPerSec:=fix_big_endian2(spi_Dmem(1) & spi_Dmem(0));
						FATSz := conv_integer(BPB_FATSz32); -- 15017 --944
						TotSec := conv_integer(BPB_TotSec32); -- 7720960 --7733248 alors que sous HsD j'en ai 7725056, bref l'étrange offset de 2000h
						-- 2734+2*15017=32768
						--FirstDataSector=32768
						-- BPB_RsvdSecCnt<2000h attention 2000h est exprimé en bloc512 (et non en BLOC_SIZE)
						-- BPB_RsvdSecCnt>400h donc comprend peut-être les secteurs avant l'offset 2000h (block512)
						FirstDataSector:=conv_integer(BPB_RsvdSecCnt)+(conv_integer(BPB_NumFATs)*FATSz) + 0;
						-- sector 0 liste : offset 2000h block512
						-- 0000h
						-- 0C00h bytes
						folder_cluster_pointer:=BPB_RootClus; --2
						step_var:=25;
						
						
						
--if conv_integer(folder_cluster_pointer)/=2 then
--	step_var:=40;
--elsif FirstDataSector/=32768 then
--	step_var:=41;
--elsif conv_integer(BPB_SecPerClus)/=4 then
--	step_var:=42;
--elsif conv_integer(BPB_BytsPerSec)/=512 then
--	step_var:=43;
--elsif conv_integer(FAT32_SECTOR0_OFFSET)/512 /=8192 then
--	step_var:=44;
--elsif (((conv_integer(folder_cluster_pointer)-2)*conv_integer(BPB_SecPerClus))+FirstDataSector)*conv_integer(BPB_BytsPerSec) /=32768*512 then
--	step_var:=45;
--else
							step_var:=25;
--end if;

						
						
					when 25=> -- impure variable setted, so impure function are now useable...
						folder_sector_pointer:=getSector(folder_cluster_pointer);
							if bc(folder_cluster_pointer) then
								-- pas cool
								step_var:=27;
							else
								step_var:=8;
								folder_DirStruct_number:=0;
							end if;
					when 8=> -- parcour la liste de DIRStruct
						--========================================================
						--== PARCOUR LISTE DIRSTRUCT D'UN FOLDER_SECTOR_POINTER ==
						--========================================================
						if folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32) then
							-- dernier DataStruct de l'ensemble des secteurs du cluster totalement parcouru
							step_var:=9;
						else
							folder_DirStruct_number:=folder_DirStruct_number+1;
							rom_number:=0;
							rom_number_created:=0;
							dsk_found:=false;
							step_var:=30;--10;
						end if;
					when 9=>
						--=========================
						--== NEXT FOLDER CLUSTER ==
						--=========================
						if bc(folder_cluster_pointer) then
							-- that's all sucks
							load_done:='0';
						else
							get_var4(folder_cluster_pointer,getFAT(folder_cluster_pointer));
							step_var:=12;
						end if;
					when 30=>
						--================================
						--== DETECTION FIN DE DIRSTRUCT ==
						--================================
						get_var1(x"00",folder_sector_pointer+(folder_DirStruct_number-1)*32);
						step_var:=31;
					when 31=>
						if spi_Dmem(0)=x"00" then
							-- un des secteur listés dans le sector_folder est vide
							-- il faut donc l'utiliser
							passe2:=true;
							-- on invalide le secteur suivant dans la liste
							if not(folder_DirStruct_number=conv_integer(BPB_SecPerClus)*(conv_integer(BPB_BytsPerSec)/32)) then
								insert4(x"00000000",folder_sector_pointer+(folder_DirStruct_number-1)*32);
							end if;
							step_var:=10;
						else
							step_var:=10;
						end if;
					when 10=>
						--=======================
						--== RECHERCHE DES ROM ==
						--=======================
						if passe2 then
							if rom_number_created=ROM_COUNT then
								-- that's really all folk !
								load_done:='1';
								step_var:=26; -- load done
							else
								if files_loaded(rom_number_created)='1' then
									rom_number_created:=rom_number_created+1;
									step_var:=10;
								else
									-- creation du fichier voulu
									get_var1(spi_Dmem(0),folder_sector_pointer+(folder_DirStruct_number-1)*32);
									step_var:=32;
								end if;
							end if;
						else
							-- scan la disquette avant le reste, donc ok...
							if rom_number=ROM_COUNT or dsk_found then
								-- CREATE ROM
								--passe2:=true; -- oui mais non
								step_var:=8; -- next DIRSTRUCT
							else
								if files_loaded(rom_number)='1' then
									rom_number:=rom_number+1;
									step_var:=10;
								else
									--file_address:=file_rom_address(rom_number);
									get_var12(name_to_std_logic_vector(list_filename_defragmented(rom_number)) & ATTR_ARCHIVE,folder_sector_pointer+(folder_DirStruct_number-1)*32);
									step_var:=13;
								end if;
							end if;
						end if;
					when 12=> -- next folder cluster
					
-- arrêt fatal en 28, déclanché par 12->23->28.
--si bad cluster alors c'est fini, fin du folder je devrais faire des insertions ici, non ?
					
						if bc(fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0))) then
							passe2:=true;
							--last_folder_cluster_pointer:=true;
							--first_cluster_pointer:=folder_cluster_pointer;
							file_cluster_pointer:=BPB_RootClus;
							get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));							
							step_var:=23;
						else
							folder_cluster_pointer:=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0));
							folder_sector_pointer:=getSector(folder_cluster_pointer);
							step_var:=8;
							folder_DirStruct_number:=0;
						end if;
					
					when 23=>
						if ec(fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0))) then
							-- youpi en trouver un second
							insert4(fix_big_endian4(file_cluster_pointer),getFAT(folder_cluster_pointer));
							step_var:=22;
						else
							file_cluster_pointer:=file_cluster_pointer+1;
							if file_cluster_pointer>BPB_TotSec32-BPB_RootClus then
								-- fin du disque
								step_var:=38;
							else
								get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
							end if;
						end if;
					when 22=>
						insert4(fix_big_endian4(x"0FFFFFFF"),getFAT(file_cluster_pointer));
						-- il est devenu bon
						folder_cluster_pointer:=file_cluster_pointer;
						folder_sector_pointer:=getSector(folder_cluster_pointer);
						step_var:=21;
						folder_DirStruct_number:=0;
					when 21=>
						step_var:=8;
						-- on crée une nouvelle LISTE DIRSTRUCT D'UN FOLDER_SECTOR_POINTER vide
						insert4(x"00000000",getSector(folder_cluster_pointer));

					when 13=> -- search ROM
						if fix4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0))=extension_to_std_logic_vector(file_extension) & ATTR_ARCHIVE then
							dsk_found:=true;
							if dsk_number=file_select then
								get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
								step_var:=14;
								files_loaded(ROM_COUNT):='1';
							else
								step_var:=10; -- rom suivante
							end if;
							dsk_number:=dsk_number+1;
						elsif fix12(spi_Dmem(11) & spi_Dmem(10) & spi_Dmem(9) & spi_Dmem(8) & spi_Dmem(7) & spi_Dmem(6) & spi_Dmem(5) & spi_Dmem(4) & spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0))=name_to_std_logic_vector(list_filename_defragmented(rom_number)) & ATTR_ARCHIVE then
							-- nom et extention de fichier identique
							files_loaded(rom_number):='1';
							get_var4(file_size,folder_sector_pointer+(folder_DirStruct_number-1)*32+28);
							step_var:=14;
						else
							rom_number:=rom_number+1;
							step_var:=10; -- rom suivante
						end if;
					when 14=>
						file_size:=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0));
						get_var2(file_cluster_pointer_H,folder_sector_pointer+(folder_DirStruct_number-1)*32+20);
						step_var:=15;
					when 15=>
						file_cluster_pointer_H:=fix_big_endian2(spi_Dmem(1) & spi_Dmem(0));
						get_var2(file_cluster_pointer_L,folder_sector_pointer+(folder_DirStruct_number-1)*32+26);
						step_var:=16;
					when 16=>
						file_cluster_pointer_L:=fix_big_endian2(spi_Dmem(1) & spi_Dmem(0));
						file_cluster_pointer:=file_cluster_pointer_H & file_cluster_pointer_L;
						step_var:=24;
					when 24=>
						file_sector_pointer:=getSector(file_cluster_pointer);
						if bc(file_cluster_pointer) then
							step_var:=29;
						else
							if dsk_found then
								list_address_start(ROM_COUNT):=file_sector_pointer;
							else
								list_address_start(rom_number):=file_sector_pointer;
							end if;
							step_var:=17;
						end if;
					when 17=>
						
						if file_size>conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32) then
							file_size:=file_size-conv_std_logic_vector(conv_integer(BPB_SecPerClus)*conv_integer(BPB_BytsPerSec),32);
							step_var:=19;
						else
							step_var:=18;
							-- that's all folk
						end if;
					when 18=>
						-- that's all folk
						step_var:=8; -- next DIRStruct
					when 19=>
						get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
						step_var:=20;
					when 20=>
						-- check defragmentation
						if file_cluster_pointer+1=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0)) then
							file_cluster_pointer:=fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0));
							step_var:=17;
						else
							-- pas bon
							--files_loaded(rom_number):='0'; --invalidate
							step_var:=39; -- next
						end if;
					when 26=>NULL; -- load done
					when 27=>NULL; -- bad root folder cluster
					when 28=>NULL; -- bad next folder cluster
					when 29=>NULL; -- bad file cluster
					when 39=>NULL; -- bad file defragment
					when 32=>
						--======================
						--== CREATION DES ROM ==
						--======================
						-- DIRStruct candidate pour une CREATION DE ROM ?
						if spi_Dmem(0)=x"E5" or spi_Dmem(0)=x"00" then
							-- can remplace yeah
							--rom_number:=0;  -- what the fuck ? rom_number_created
							file_cluster_pointer:=BPB_RootClus;
							espace:=0;
							first_cluster_pointer:=file_cluster_pointer;
							get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
							step_var:=34;
						else
							-- DIRStruct suivant...
							step_var:=18;
						end if;
					when 34=>
						-- trouver un trou de taille RAM_A_MAX_SIZE
						if ec(fix_big_endian4(spi_Dmem(3) & spi_Dmem(2) & spi_Dmem(1) & spi_Dmem(0))) then
							-- le remplir
							if espace=2**(RAM_A_MAX_SIZE-12)-1 then -- 2*12=4092=BLOCK_FAT32
								-- that's all folk
								file_cluster_pointer:=first_cluster_pointer;
								step_var:=36;
								files_loaded(rom_number_created):='1';
								list_address_start(rom_number_created):=getSector(first_cluster_pointer);
								espace:=0;
							else
								-- continuer à chercher
								espace:=espace+1;
								file_cluster_pointer:=file_cluster_pointer+1;
								if file_cluster_pointer>BPB_TotSec32-BPB_RootClus then
									-- fin du disque
									step_var:=38;
								else
									get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
									step_var:=34;
								end if;
							end if;
						else
							file_cluster_pointer:=file_cluster_pointer+1; --zap, passe au suivant
							if file_cluster_pointer>BPB_TotSec32-BPB_RootClus then
								-- fin du disque
								step_var:=38;
							else
								first_cluster_pointer:=file_cluster_pointer; -- qu'on assigne comme début de trou
								espace:=0; -- et on invalide le tout
								get_var4(file_cluster_pointer,getFAT(file_cluster_pointer));
								step_var:=34;
							end if;
						end if;
						
					when 36=>
						if espace=2**(RAM_A_MAX_SIZE-12)-1 then -- 2**12=4092=BLOCK_FAT32
							--done
							insert4(fix_big_endian4(x"0FFFFFF8"),getFAT(file_cluster_pointer)); -- eoc
							--file_cluster_pointer:=file_cluster_pointer+1; -- un espace de plus pour detail de fichier
							espace:=0;
							step_var:=37;
						else
							espace:=espace+1;
							insert4(fix_big_endian4(file_cluster_pointer+1),getFAT(file_cluster_pointer));
							file_cluster_pointer:=file_cluster_pointer+1;
						end if;
					when 37=>
						--=================================
						--== ENREGISTREMENT DU DIRSTRUCT ==
						--=================================
						-- le debut du contenu du fichier cad le trou libre : first_cluster_pointer
						-- le folder cluster à écraser avec un cluster vierge de détail de fichier
						
						first_cluster_pointer:=fix_big_endian4(first_cluster_pointer);
						first_cluster_pointer_H:=first_cluster_pointer(2*8-1 downto 0);
						first_cluster_pointer_L:=first_cluster_pointer(4*8-1 downto 2*8);
						insert32(name_to_std_logic_vector(list_filename_defragmented(rom_number_created)) & ATTR_ARCHIVE &  x"00" & x"0000000000" & x"0000" & first_cluster_pointer_H &  x"00000000" & first_cluster_pointer_L & fix_big_endian4(conv_std_logic_vector(2**RAM_A_MAX_SIZE,4*8)),folder_sector_pointer+(folder_DirStruct_number-1)*32);
						step_var:=18;
					when 38=> -- end of disk
					when 40=> -- ram_overrun
						when others=>
				end case;
else
	-- accès directes selon switch et adresse
	

-- attendre ram_CLK avant de renvoyer un premier ready
	
	ram_Dout<=spi_Dmem(0);
-- deux clock ? afin de détecter les overrun ?

	busy<='0';


if last_ram_CLK='0' and ram_CLK='1' then
	ram_ready:=true;

	if ram_R='1' then
		busy<='1';
		-- déclenchement
		reste_byte_read:=true;
		reste_byte_read_cursor:=0;
		target_address(31 downto 0):="00000000" & ram_A(RAM_A_MAX_SIZE-1 downto 0);
		target_address:=target_address+list_address_start(ram_S_to_number_S(ram_S));
		spi_A<=target_address;
		spi_R<='1';
	elsif ram_W='1' then
		busy<='1';
		spi_Dmem(0):=ram_Din;
		reste_byte_write:=true;
		reste_byte_write_cursor:=0;
		target_address(31 downto 0):="00000000" & ram_A(RAM_A_MAX_SIZE-1 downto 0);
		target_address:=target_address+list_address_start(ram_S_to_number_S(ram_S));
		spi_Din<=spi_Dmem(reste_byte_write_cursor);
		spi_A<=target_address;
		spi_W<='1';
	end if;
		
	-- ram_S
	-- ram_A
	-- ram_D
	-- ram_W
	-- ram_R
end if;
	
	
	
	
	
	
end if;
end if;
			end if;

-- si load_done viens juste de passer à 1, ça peut planter
			if load_done='1' and last_ram_CLK='0' and ram_CLK='1' then
				if not(ram_ready) then
					-- overrun
					step_var:=40;
					load_done:='0';
				end if;
				ram_ready:=false;
			end if;
			last_ram_CLK:=ram_CLK;
			
		end if;
	end process tortue_geniale;
	

end Behavioral;
