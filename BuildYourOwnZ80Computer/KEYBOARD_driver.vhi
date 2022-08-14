
-- VHDL Instantiation Created from source file KEYBOARD_driver.vhd -- 18:01:51 02/07/2011
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT KEYBOARD_driver
	PORT(
		CLK : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		press : IN std_logic;
		unpress : IN std_logic;
		portC : IN std_logic_vector(3 downto 0);
		ScanCode : IN std_logic_vector(7 downto 0);          
		portA : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_KEYBOARD_driver: KEYBOARD_driver PORT MAP(
		CLK => ,
		reset => ,
		enable => ,
		press => ,
		unpress => ,
		portC => ,
		ScanCode => ,
		portA => 
	);


