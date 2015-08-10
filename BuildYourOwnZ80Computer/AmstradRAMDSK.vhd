----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:14:01 01/26/2011 
-- Design Name: 
-- Module Name:    AmstradRAMDSK - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AmstradRAMDSK is
    Port ( A : in  STD_LOGIC_VECTOR (17 downto 0);
           dsk_A : in  STD_LOGIC_VECTOR (19 downto 0);
			  init_A : in  STD_LOGIC_VECTOR (22 downto 0);
			  --crtc_A : in  STD_LOGIC_VECTOR (15 downto 0);
			  --VRAM01:in STD_LOGIC;
           transmit : in  STD_LOGIC;
			  --crtc_transmit : in  STD_LOGIC;
			  init_done : in  STD_LOGIC;
           ram_A : out  STD_LOGIC_VECTOR (22 downto 0);
			  --wr_enable:out std_logic; -- do not write into ROM
			  vram_A:out STD_LOGIC_VECTOR (15 downto 0);
			  vram_A_isValid:out std_logic
           --ram_LB : out  STD_LOGIC;
           --ram_UB : out  STD_LOGIC
			  );
end AmstradRAMDSK;

architecture Behavioral of AmstradRAMDSK is

begin

--wr_enable<= '1'; -- '0' when init_done='1' and transmit='0' and A(17 downto 16)="00" else '1';


vram_A(15 downto 0)<=A(15 downto 0);
-- A(17..16) : viser la RAM basse : "10"
-- A(15) : >8000h
--vram_A_isValid<='0' when init_done='0' else '0' when transmit='1' else '1' when A(17 downto 15)="10" & "1" else '0';
-- immediate
--vram_A_isValid<= init_done and not(transmit) and A(17) and not(A(16)) and A(15);
vram_A_isValid<= init_done and not(transmit) and A(17) and not(A(16));

ram_A(13 downto 0)<= init_A(13 downto 0) when init_done='0' else dsk_A(13 downto 0) when transmit='1' else A(13 downto 0); -- address is solving
ram_A(17 downto 14)<= init_A(17 downto 14) when init_done='0' else dsk_A(17 downto 14) when transmit='1' else A(17 downto 14); -- address is solving

--ram_A(13 downto 0)<= init_A(13 downto 0) when init_done='0' else dsk_A(13 downto 0) when transmit='1' else "0" & crtc_A(12 downto 0) when crtc_transmit='1' else A(13 downto 0); -- address is solving
-- je suis sur la ROM l�...CFFF 1100 pour C donc paging off ne marche pas !
-- pourquoi tant de adressage A pour crtc ????
--ram_A(17 downto 14)<= init_A(17 downto 14) when init_done='0' else dsk_A(17 downto 14) when transmit='1' else "0110"  when crtc_transmit='1' else A(17 downto 14); -- VRAM paging OFF
--ram_A(17 downto 14)<= init_A(17 downto 14) when init_done='0' else dsk_A(17 downto 14) when transmit='1' else "00" & crtc_A(15 downto 14) when crtc_transmit='1' else A(17 downto 14); -- testing ROM Amstrad into VRAM
--ram_A(17 downto 14)<= init_A(17 downto 14) when init_done='0' else dsk_A(17 downto 14) when transmit='1' else A(17 downto 14); -- testing Z80 A moving into VRAM

ram_A(19 downto 18)<= init_A(19 downto 18) when init_done='0' else dsk_A(19 downto 18) when transmit='1' else (others=>'0'); -- address is solving
ram_A(20)<=init_A(20) when init_done='0' else '1' when transmit='1' else '0';
--death byte
--ram_A(22 downto 21)<=(others=>'1');
-- sim
ram_A(22 downto 21)<=(others=>'0');

--ram_LB<='0';
--ram_UB<='0';

end Behavioral;

