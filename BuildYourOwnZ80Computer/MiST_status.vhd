----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:19 10/11/2014 
-- Design Name: 
-- Module Name:    NEXYS4_RGB - Behavioral 
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

entity MIST_STATUS is
    Port ( status : in  STD_LOGIC_VECTOR (7 downto 0);
	 
           status_0 : out  STD_LOGIC;
			  
			  lowerVRAM : out std_logic_vector(1 downto 0);
			  upperVRAM : out std_logic_vector(1 downto 0);
			  ppi_jumpers : out std_logic_vector(3 downto 0)
			  
			 -- leds_select : out  STD_LOGIC_VECTOR (4 downto 0)
			  --dbBuffVRAM : out STD_LOGIC
			  --ecoleFix : out STD_LOGIC
			 );
end MIST_STATUS;

architecture Behavioral of MIST_STATUS is

begin
status_0<=status(0);
--leds_select(4 downto 0)<=status(5 downto 1);
--Amstrad;DSK;O1,LowerVRAM,1X,0X;O2,LowerVRAM,X0,X1;O3,UpperVRAM,1X,0X;O4,UpperVRAM,1X,0X;
lowerVRAM(0)<=status(2);
lowerVRAM(1)<=not(status(1));
upperVRAM(0)<=not(status(4));
upperVRAM(1)<=not(status(3));
ppi_jumpers<=not(status(6)) & '1' & status(5) & '1';
end Behavioral;

