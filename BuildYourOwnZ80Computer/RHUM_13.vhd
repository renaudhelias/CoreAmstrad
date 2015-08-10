library ieee;
use ieee.std_logic_1164.all;

entity ROM_0_12 is
  port ( address : in std_logic_vector(12 downto 0);
         --data : out std_logic_vector(7 downto 0) );
			data : out std_logic_vector(7 downto 0) );
end entity ROM_0_12;

architecture behavioral of ROM_0_12 is
  type mem is array ( 0 to 2**4 - 1) of std_logic_vector(7 downto 0);
  
  	 -- LD A,55
	 -- OUT (00),A
	 -- JP 0000
	 -- hexa : 3E55 D300 C30000

  constant my_Rom : mem := (
    0  => X"3E",
    1  => X"55",
    2  => X"D3",
    3  => X"00",
    4  => X"C3",
    5  => X"00",
    6  => X"00",
    7  => X"00",
    8  => X"00",
    9  => X"00",
    10 => X"00",
    11 => X"00",
    12 => X"00",
    13 => X"00",
    14 => X"00",
    15 => X"00");
begin
   process (address)
   begin
     case address is
       when "0000000000000" => data <= my_rom(0);
       when "0000000000001" => data <= my_rom(1);
       when "0000000000010" => data <= my_rom(2);
       when "0000000000011" => data <= my_rom(3);
       when "0000000000100" => data <= my_rom(4);
       when "0000000000101" => data <= my_rom(5);
       when "0000000000110" => data <= my_rom(6);
       when "0000000000111" => data <= my_rom(7);
       when "0000000001000" => data <= my_rom(8);
       when "0000000001001" => data <= my_rom(9);
       when "0000000001010" => data <= my_rom(10);
       when "0000000001011" => data <= my_rom(11);
       when "0000000001100" => data <= my_rom(12);
       when "0000000001101" => data <= my_rom(13);
       when "0000000001110" => data <= my_rom(14);
       when "0000000001111" => data <= my_rom(15);
       when others => data <= "00000000";
	 end case;
  end process;
end architecture behavioral;