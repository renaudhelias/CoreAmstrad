--    {@{@{@{@{@{@
--  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r005.2
--  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
--  {@{@{@{@{@{@{@{@
--  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
--  {@{@        {@{@   Contact : renaudhelias@gmail.com
--  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
--    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
--
--
--------------------------------------------------------------------------------
-- Mixage of source code from Tobi and DevilMarkus.
--------------------------------------------------------------------------------
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
	--PAI CPC.java
	--readPort()
	-- case PPI_PORT_B:
	--        result = 0x5e | (crtc.isVSync() ? 0x01 : 0);
	--        break;
	-- case PSG_PORT_A:
	--        result = keyboard.readSelectedRow();
	--        break;
	PAI				: in STD_LOGIC_VECTOR (7 downto 0);		--Keyboarddaten
	PAO     		: out STD_LOGIC_VECTOR (7 downto 0);		--sounddaten
	PCO     		: out STD_LOGIC_VECTOR (7 downto 0);		--tastatur und steuerung
	DO		     	: out STD_LOGIC_VECTOR (7 downto 0)
    );
end pio;

architecture logic of pio is
begin

process (cpuclk)
	constant IO_WRITE:STD_LOGIC:='0';
	constant IO_READ:STD_LOGIC:='1';

	variable	PAdir		: STD_LOGIC:=IO_READ;
	variable	PBdir		: STD_LOGIC:=IO_READ;
	variable	PCHdir		: STD_LOGIC:=IO_READ;
	variable	PCLdir		: STD_LOGIC:=IO_READ;
	--variable	PDdir		: STD_LOGIC:=IO_WRITE;
	
	variable DO_mem :std_logic_vector(7 downto 0):=(others=>'1');
	
	-- PIO is the only one component using a "low state" RESET.
	
	--protected int output = 0xff;
	variable PAO_mem:std_logic_vector(7 downto 0):=(others=>'1');
	variable PBO_mem:std_logic_vector(7 downto 0):=(others=>'1');
	variable PCO_mem:std_logic_vector(7 downto 0):=(others=>'1');
	variable PDO_mem:std_logic_vector(7 downto 0):=(others=>'1'); -- PORT_CONTROL
	--protected int input = 0xff;
	variable PAI_mem:std_logic_vector(7 downto 0):=(others=>'1');
	variable PBI_mem:std_logic_vector(7 downto 0):=(others=>'1');
	variable PCI_mem:std_logic_vector(7 downto 0):=(others=>'1');
begin 

	
	IF rising_edge(cpuclk) THEN
	
		
		IF cs='0' AND iowr='0' THEN -- writePort
			IF addr(1 downto 0)="00" THEN
				--ports[PORT_A].write()
				PAO_mem:=datain;
			elsif addr(1 downto 0)="01" THEN
				--ports[PORT_B].write()
				PBO_mem:=datain;
			elsIF addr(1 downto 0)="10" THEN
--CPC.java : mapping du PORT_C
--writePort()
--	case PPI_PORT_C:
--        psg.setBDIR_BC2_BC1(PSG_VALUES[value >> 6], ppi.readOutput(PPI8255.PORT_A));
--        keyboard.setSelectedRow(value & 0x0f);
--        break;
				--ports[PORT_C].write()
				--if (inputDevice == null) input = value;
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
				

				
				--JavaCPC ports[PORT_C].write() et Bit Set/Unset
				-- ioPort.readOutput() c'est pas getOutput() !!!
				IF PCHdir=IO_READ THEN
					PCO_mem(7 downto 4):="0000";
				end if;
				IF PCLdir=IO_READ THEN
					PCO_mem(3 downto 0):="0000";
				end if;
				
				--PCO_mem:="00000000"; -- provocate I_BDIR=0 I_BC1=1 ==>YM2149.busctrl_re
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
				--ports[PORT_C].write()
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
				
				--*.setPortMode()
				PCHdir := datain(3); -- 0x08
				PCLdir := datain(0); -- 0x01
				PAdir  := datain(4); -- 0x10 ('1':IO_READ)
				PBdir  := datain(1); -- 0x02
				
				--ports[PORT_A].write(0);
				PAO_mem:="00000000";
				--ports[PORT_B].write(0);
				PBO_mem:="00000000";
				--ports[PORT_C].write(0);
				PCO_mem:="00000000";
			END IF;
			--PAO <= PAO_mem;
			--PCO<=PCO_mem;
		END IF;

		
		IF cs='0' AND iord='0' THEN -- readPort
			IF addr(1 downto 0)="00" THEN	--Keyboarddaten
				--ports[PORT_A].read()
				--inputDevice.readPort()
				PAI_mem := PAI;
				IF PAdir=IO_READ THEN
					DO_mem := PAI_mem;
				ELSE
					DO_mem := PAO_mem;
				END IF;	
			elsIF addr(1 downto 0)="01" THEN
				--ports[PORT_B].read()
				--inputDevice.readPort()
				PBI_mem := PBI;
				IF PBdir=IO_READ then
					DO_mem := PBI_mem;
				elsE
					DO_mem := PBO_mem;
				end if;
			elsIF addr(1 downto 0)="10" THEN
				--ports[PORT_C].read()
				--inputDevice.readPort()
				--PCI_mem := PCI;
				IF PCHdir=IO_READ THEN
					DO_mem(7 downto 4) := PCI_mem(7 downto 4); -- PCI
				elsE
					DO_mem(7 downto 4) := PCO_mem(7 downto 4);
				end if;
				if PCLdir=IO_READ then
					DO_mem(3 downto 0) := PCI_mem(3 downto 0); -- PCI
				elsE
					DO_mem(3 downto 0) := PCO_mem(3 downto 0);
				end if;
			elsE
				--ports[PORT_D].read()
				--inputDevice.readPort()
				--PDI_mem := PDI;
				DO_mem:=PDO_mem; -- en IO_WRITE !
			END IF;
		else
			DO_mem:="11111111";
		END IF;
		DO <= DO_mem; --PPI8255.readPort()
		PAO <= PAO_mem; --PPI8255.writePort()
		PCO <= PCO_mem; --PPI8255.writePort()
	END IF;
	
	
END process;
end logic;
