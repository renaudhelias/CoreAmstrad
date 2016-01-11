------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                                                                          --
-- Copyright (c) 2009 Tobias Gubener                                        -- 
-- Subdesign CPC T-REX by TobiFlex                                          --
--                                                                          --
-- This source file is free software: you can redistribute it and/or modify --
-- it under the terms of the GNU General Public License as published        --
-- by the Free Software Foundation, either version 3 of the License, or     --
-- (at your option) any later version.                                      --
--                                                                          --
-- This source file is distributed in the hope that it will be useful,      --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of           --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            --
-- GNU General Public License for more details.                             --
--                                                                          --
-- You should have received a copy of the GNU General Public License        --
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.    --
--                                                                          --
------------------------------------------------------------------------------
------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;

entity pio is
    port (
	addr			: in STD_LOGIC_VECTOR (1 downto 0);
	datain			: in STD_LOGIC_VECTOR (7 downto 0);
	cs				: in STD_LOGIC;
	iowr			: in STD_LOGIC;
	iord			: in STD_LOGIC;
	cpuclk			: in STD_LOGIC;
	
	PBI				: in STD_LOGIC_VECTOR (7 downto 0);
	PAI				: in STD_LOGIC_VECTOR (7 downto 0);		--Keyboarddaten
	PAO     		: out STD_LOGIC_VECTOR (7 downto 0);		--sounddaten
	PCO     		: out STD_LOGIC_VECTOR (7 downto 0);		--tastatur und steuerung
	DO		     	: out STD_LOGIC_VECTOR (7 downto 0)
    );
end pio;

architecture logic of pio is




begin
process (cpuclk)
variable	PAdir		: STD_LOGIC;
variable	PBdir		: STD_LOGIC;
variable	PCHdir		: STD_LOGIC;
variable	PCLdir		: STD_LOGIC;
variable DO_mem :std_logic_vector(7 downto 0):=(others=>'0');
variable PAO_mem:std_logic_vector(7 downto 0):=(others=>'0');
variable PBO_mem:std_logic_vector(7 downto 0):=(others=>'0');
variable PCO_mem:std_logic_vector(7 downto 0):=(others=>'0');
variable PDO_mem:std_logic_vector(7 downto 0):=(others=>'0');
--variable PCO_d	 :std_logic_vector(7 downto 0):=(others=>'0');
--variable PCO_dMask :std_logic_vector(7 downto 0):=(others=>'0');

begin 

	
	IF rising_edge(cpuclk) THEN
	
		
		IF cs='0' AND iowr='0' THEN
			IF addr(1 downto 0)="00" THEN
				PAO_mem:=datain;
			elsif addr(1 downto 0)="01" THEN
				PBO_mem:=datain;
			elsIF addr(1 downto 0)="10" THEN
				PCO_mem := datain;
			elsIF addr(1 downto 0)="11" AND datain(7)='0' THEN
			
-- IOPort ioPort = ports[PORT_C];
-- int mask = 1 << ((value >> 1) & 0x07);
--
-- if ((value & 0x01) == 0) // Reset Bit
-- {
--	  ioPort.write(ioPort.readOutput() & (mask ^ 0xff));
-- } else // Set Bit
-- {
--	  ioPort.write(ioPort.readOutput() | mask);
-- }
			
--				CASE datain(3 downto 1) IS --int mask
--					WHEN "000" => PCO_mem(0) := datain(0);
--					WHEN "001" => PCO_mem(1) := datain(0);
--					WHEN "010" => PCO_mem(2) := datain(0);
--					WHEN "011" => PCO_mem(3) := datain(0);
--					WHEN "100" => PCO_mem(4) := datain(0);
--					WHEN "101" => PCO_mem(5) := datain(0);
--					WHEN "110" => PCO_mem(6) := datain(0);
--					WHEN OTHERS => PCO_mem(7) := datain(0);
--				END CASE;	
				
				--JavaCPC
				if datain(3)='1' then
					PCO_mem(3) := datain(0);
				end if;
				if datain(2)='1' then
					PCO_mem(2) := datain(0);
				end if;
				if datain(1)='1' then
					PCO_mem(1) := datain(0);
				end if;
				
				
				
			else --elsIF addr(1 downto 0)="11" AND datain(7)='1' THEN
				-- setControl(value);
				PDO_mem:=datain;
				--int mode = (value & 0x08) != 0 ? 0 : 0xf0;
				PCHdir := datain(3); -- 0x08
				PCLdir := datain(0); -- 0x01
				PAdir  := datain(4); -- 0x10 ('1':IO_READ)
				PBdir  := datain(1); -- 0x02
				PAO_mem:="00000000";
				PBO_mem:="00000000";
				PCO_mem:="00000000";
			END IF;
		END IF;

		
		IF cs='0' AND iord='0' THEN
			IF addr(1 downto 0)="00" THEN	--Keyboarddaten
				IF PAdir='1' THEN
					DO_mem := PAI;
				ELSE
					DO_mem := PAO_mem;
				END IF;	
			elsIF addr(1 downto 0)="01" THEN
				IF PBdir='1' then
					DO_mem := PBI;
				elsE
					DO_mem := PBO_mem;
				end if;
			elsIF addr(1 downto 0)="10" THEN
				IF PCHdir='1' THEN
					DO_mem(7 downto 4) := "1111"; -- PCI
				elsE
					DO_mem(7 downto 4) := PCO_mem(7 downto 4);
				end if;
				if PCLdir='1' then
					DO_mem(3 downto 0) := "1111"; -- PCI
				elsE
					DO_mem(3 downto 0) := PCO_mem(3 downto 0);
				end if;
			elsE
				DO_mem:=PDO_mem;
			END IF;
		else
			DO_mem:="11111111";
		END IF;
		DO <= DO_mem;
		PAO <= PAO_mem;
		PCO<=PCO_mem;
	END IF;
	
	
END process;
end logic;
