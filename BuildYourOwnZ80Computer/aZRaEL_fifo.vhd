----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:18 11/01/2010 
-- Design Name: 
-- Module Name:    aZRaEL_fifo - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- lui il gère les pop et push dans une VRAM, il a possibilité de resynchroniser lors de H/V-SYNC venant de aZRaEL_CRTC ou aZRaEL_VGA
entity aZRaEL_fifo is
  generic(
		  VRAM_WIDTH:integer:=300;
		  VRAM_HEIGHT:integer:=207;
		  VGA_WIDTH:integer:=640;
		  VGA_HEIGHT:integer:=480
		  );
  port(
        clock_pop  : in std_logic;
		clock_push  : in std_logic;
		clock_force_push  : in std_logic;
		push_pixel : in std_logic_vector;
		force_push_pixel : in std_logic_vector;
		force_addr : in std_logic_vector;
		pop_pixel : out std_logic_vector(2 downto 0);
		do_pop : in boolean;
		do_push : in boolean;
		do_force_push : in boolean;
		ram_addr : out std_logic_vector(13 downto 0);
		ram_data : in std_logic_vector(7 downto 0);
		ram_write : out boolean;
		ram_read : out boolean;
		resynchro_pop : in boolean
	   );
end aZRaEL_fifo;



architecture Behavioral of aZRaEL_fifo is
-- états
--    x- FLEMME				000
--    x- ADDR_READ			001
--    x- DATA_READ			010
--    x- ADDR_WRITE			011
--    x- DATA_WRITE			100
--    x- FORCE_ADDR_WRITE	101
--    x- FORCE_DATA_WRITE	110
constant FLEMME : std_logic_vector(2 downto 0):="000";
constant ADDR_READ : std_logic_vector(2 downto 0):="001";
constant DATA_READ : std_logic_vector(2 downto 0):="010";
constant ADDR_WRITE : std_logic_vector(2 downto 0):="011";
constant DATA_WRITE : std_logic_vector(2 downto 0):="100";
constant FORCE_ADDR_WRITE : std_logic_vector(2 downto 0):="101";
constant FORCE_DATA_WRITE : std_logic_vector(2 downto 0):="110";
begin
--ram_data <= (others=>'Z');

PileFIFO : process(clock_pop,clock_push) is
	variable fifo_in : integer range 0 to (VRAM_WIDTH*VRAM_HEIGHT)-1 := 0;
	variable fifo_force_in : integer range 0 to (VRAM_WIDTH*VRAM_HEIGHT)-1 := 0;
	--variable fifo_out_VGA : integer range 0 to (VGA_WIDTH*VGA_HEIGHT)-1 := 0;
	variable fifo_out_VGA_line : integer range 0 to VGA_HEIGHT := 0;
	variable fifo_out_VGA_column : integer range 0 to VGA_WIDTH := 0;
	variable fifo_out_VRAM : integer range 0 to (VRAM_WIDTH*VRAM_HEIGHT)-1 := 0;

	variable etat : std_logic_vector(2 downto 0) := FLEMME;
	variable push_mem : std_logic_vector(push_pixel'range);
	variable pop_mem : std_logic_vector(pop_pixel'range);
	
begin
	if rising_edge(clock_pop) then
		if resynchro_pop then
			fifo_out_VGA_line:=0;fifo_out_VGA_column:=0;
		end if;
		if etat = FLEMME then
			-- politique read then write then force write
			if do_pop then
				-- read
				etat := ADDR_READ;
				ram_addr<=conv_std_logic_vector(fifo_out_VRAM,ram_addr'length);
				ram_read<=true;
				ram_write<=false;
			elsif do_push then
				push_mem:=push_pixel;
				--ram_data<=(push_mem(0),push_mem(1),push_mem(2),'0','0',push_mem(0),push_mem(1),push_mem(2));
				ram_read<=false;
				ram_write<=true;
				-- write
			elsif do_force_push then
				pop_mem:=force_push_pixel;
				--ram_data<=pop_mem;
				ram_read<=false;
				ram_write<=true;
				-- force write
			end if;
		elsif etat = ADDR_READ then
			-- reading address
			pop_mem:=ram_data(7 downto 5);
			pop_pixel<=pop_mem;
			--do_pop<=true; -- wanna_push xor done_push= do_push un truc du genre
			ram_read<=false;
			ram_write<=false;
			etat := FLEMME; --etat := DATA_READ;
			
			-- et on avance
			fifo_out_VGA_column:=fifo_out_VGA_column+1;
			if fifo_out_VGA_column=0 then
				fifo_out_VGA_line:=fifo_out_VGA_line+1;
			end if;
			--fifo_out_VGA:=fifo_out_VGA+1;
			--fifo_out_VGA_line
			if fifo_out_VGA_column>=VRAM_WIDTH then
				fifo_out_VRAM:=0;
				pop_mem:="100";pop_pixel<=pop_mem;
			elsif fifo_out_VGA_line>=VRAM_HEIGHT then
				fifo_out_VRAM:=0;
				pop_mem:="010";pop_pixel<=pop_mem;
			else
				pop_mem:="000";pop_pixel<=pop_mem;
				fifo_out_VRAM:=(fifo_out_VGA_line)*VRAM_WIDTH+fifo_out_VGA_column;-- y*with+x
			end if;
		elsif etat = ADDR_WRITE then
			-- reading address
			--do_push<=true; -- wanna_push xor done_push= do_push un truc du genre
			ram_read<=false;
			ram_write<=false;
			etat := FLEMME; --etat := DATA_READ;
		elsif etat = FORCE_ADDR_WRITE then
			-- reading address
			--do_force_push<=true; -- wanna_push xor done_push= do_push un truc du genre
			ram_read<=false;
			ram_write<=false;
			etat := FLEMME; --etat := DATA_READ;
		end if;
	end if;
end process PileFIFO;

end Behavioral;

