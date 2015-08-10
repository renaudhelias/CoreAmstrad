----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:46 01/18/2011 
-- Design Name: 
-- Module Name:    test1_config - Behavioral 
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
--library renaud;
--use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--use work.all;

configuration test1 of amstrad_switch_z80_vga_exported is
--use work.T80_REG;
		for BEHAVIORAL
			for AmstradT80:T80se
				for rtl
					for u0:T80
						for rtl
							for all:T80_Reg
								use entity WORK.T80_Reg(testbench);
							end for;
						end for;
					end for;
				end for;
			end for;
		end for;
end configuration;
