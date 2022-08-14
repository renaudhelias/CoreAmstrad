LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY MOUSE IS


   PORT( clock_25Mhz, reset 			: IN std_logic;
        SIGNAL mouse_data				: IN std_logic; --INOUT
        SIGNAL mouse_clk 				: IN std_logic; --INOUT
        SIGNAL left_button, right_button: OUT std_logic;
		SIGNAL mouse_cursor_row 		: OUT std_logic_vector(9 DOWNTO 0); 
		SIGNAL mouse_cursor_column 		: OUT std_logic_vector(9 DOWNTO 0));       
		
		
END MOUSE;

ARCHITECTURE behavior OF MOUSE IS

TYPE STATE_TYPE IS (INHIBIT_TRANS, LOAD_COMMAND,LOAD_COMMAND2, WAIT_OUTPUT_READY,
					WAIT_CMD_ACK, INPUT_PACKETS);

-- Signals for Mouse
SIGNAL mouse_state							: state_type;
SIGNAL inhibit_wait_count					: std_logic_vector(10 DOWNTO 0);
SIGNAL CHARIN, CHAROUT						: std_logic_vector(7 DOWNTO 0);
SIGNAL new_cursor_row, new_cursor_column 	: std_logic_vector(9 DOWNTO 0);
SIGNAL cursor_row, cursor_column 			: std_logic_vector(9 DOWNTO 0);
SIGNAL INCNT, OUTCNT, mSB_OUT 				: std_logic_vector(3 DOWNTO 0);
SIGNAL PACKET_COUNT 						: std_logic_vector(1 DOWNTO 0);
SIGNAL SHIFTIN 								: std_logic_vector(8 DOWNTO 0);
SIGNAL SHIFTOUT 							: std_logic_vector(10 DOWNTO 0);
SIGNAL PACKET_CHAR1, PACKET_CHAR2, 
		PACKET_CHAR3 						: std_logic_vector(7 DOWNTO 0); 
SIGNAL MOUSE_CLK_BUF, DATA_READY, READ_CHAR	: std_logic;
SIGNAL i									: integer;
SIGNAL cursor, iready_set, break, toggle_next, 
		output_ready, send_char, send_data 	: std_logic;
SIGNAL MOUSE_DATA_DIR, MOUSE_DATA_OUT, MOUSE_DATA_BUF, 
		MOUSE_CLK_DIR 						: std_logic;
SIGNAL MOUSE_CLK_FILTER 					: std_logic;
SIGNAL filter 								: std_logic_vector(7 DOWNTO 0);


BEGIN

mouse_cursor_row <= cursor_row;
mouse_cursor_column <= cursor_column;

			-- tri_state control logic for mouse data and clock lines
--MOUSE_DATA <= 'Z' WHEN MOUSE_DATA_DIR = '0' ELSE MOUSE_DATA_BUF;
--MOUSE_CLK <=  'Z' WHEN MOUSE_CLK_DIR = '0' ELSE MOUSE_CLK_BUF;

			-- state machine to send init command and start recv process.
	PROCESS (reset, clock_25Mhz)
	BEGIN
		IF reset = '1' THEN
			mouse_state <= INHIBIT_TRANS;
			inhibit_wait_count <= conv_std_logic_vector(0,11);
			SEND_DATA <= '0';
		ELSIF clock_25Mhz'EVENT AND clock_25Mhz = '1' THEN
			CASE mouse_state IS
-- Mouse powers up and sends self test codes, AA and 00 out before board is downloaded
-- Pull clock line low to inhibit any transmissions from mouse
-- Need at least 60usec to stop a transmission in progress
-- Note: This is perhaps optional since mouse should not be tranmitting
				WHEN INHIBIT_TRANS =>
				inhibit_wait_count <= inhibit_wait_count + 1;
				IF inhibit_wait_count(10 DOWNTO 9) = "11" THEN
						mouse_state <= LOAD_COMMAND;
				END IF;
					-- Enable Streaming Mode Command, F4
						charout <= "11110100";
					-- Pull data low to signal data available to mouse
				WHEN LOAD_COMMAND =>
						SEND_DATA <= '1';
						mouse_state <= LOAD_COMMAND2;
				WHEN LOAD_COMMAND2 =>
						SEND_DATA <= '1';
						mouse_state <= WAIT_OUTPUT_READY;
		-- Wait for Mouse to Clock out all bits in command.
		-- Command sent is F4, Enable Streaming Mode
		-- This tells the mouse to start sending 3-byte packets with movement data
				WHEN WAIT_OUTPUT_READY =>
					SEND_DATA <= '0';
			-- Output Ready signals that all data is clocked out of shift register
					IF OUTPUT_READY='1' THEN
						mouse_state <= WAIT_CMD_ACK;
					ELSE
						mouse_state <= WAIT_OUTPUT_READY;
					END IF;
		-- Wait for Mouse to send back Command Acknowledge, FA
				WHEN WAIT_CMD_ACK =>
					SEND_DATA <= '0';
					IF IREADY_SET='1' THEN
						mouse_state <= INPUT_PACKETS;
					END IF;
		-- Release clock_25Mhz and data lines and go into mouse input mode
		-- Stay in this state and recieve 3-byte mouse data packets forever
		-- Default rate is 100 packets per second
				WHEN INPUT_PACKETS =>
						mouse_state <= INPUT_PACKETS;
			END CASE;
		END IF;
	END PROCESS;

	WITH mouse_state SELECT
-- Mouse Data Tri-state control line: '1' FLEX Chip drives, '0'=Mouse Drives
		MOUSE_DATA_DIR 	<=	'0'	WHEN INHIBIT_TRANS,
							'0'	WHEN LOAD_COMMAND,
							'0'	WHEN LOAD_COMMAND2,
							'1'	WHEN WAIT_OUTPUT_READY,
							'0'	WHEN WAIT_CMD_ACK,
							'0'	WHEN INPUT_PACKETS;
-- Mouse Clock Tri-state control line: '1' FLEX Chip drives, '0'=Mouse Drives
	WITH mouse_state SELECT
		MOUSE_CLK_DIR 	<=	'1'	WHEN INHIBIT_TRANS,
							'1'	WHEN LOAD_COMMAND,
							'1'	WHEN LOAD_COMMAND2,
							'0'	WHEN WAIT_OUTPUT_READY,
							'0'	WHEN WAIT_CMD_ACK,
							'0'	WHEN INPUT_PACKETS;
	WITH mouse_state SELECT
-- Input to FLEX chip tri-state buffer mouse clock_25Mhz line
		MOUSE_CLK_BUF 	<=	'0'	WHEN INHIBIT_TRANS,
							'1'	WHEN LOAD_COMMAND,
							'1'	WHEN LOAD_COMMAND2,
							'1'	WHEN WAIT_OUTPUT_READY,
							'1'	WHEN WAIT_CMD_ACK,
							'1'	WHEN INPUT_PACKETS;

-- filter for mouse clock
PROCESS
BEGIN
		WAIT UNTIL clock_25Mhz'event and clock_25Mhz = '1';
		filter(7 DOWNTO 1) <= filter(6 DOWNTO 0);
		filter(0) <= MOUSE_CLK;
		IF filter = "11111111" THEN
			MOUSE_CLK_FILTER <= '1';
		ELSIF filter = "00000000" THEN
			MOUSE_CLK_FILTER <= '0';
		END IF;
END PROCESS;

	--This process sends serial data going to the mouse
SEND_UART: PROCESS (send_data, Mouse_clK_filter)
BEGIN
IF SEND_DATA = '1' THEN
	OUTCNT <= "0000";
    SEND_CHAR <= '1';
	OUTPUT_READY <= '0';
		-- Send out Start Bit(0) + Command(F4) + Parity  Bit(0) + Stop Bit(1)
	SHIFTOUT(8 DOWNTO 1) <= CHAROUT ;
		-- START BIT
	SHIFTOUT(0) <= '0';
		-- COMPUTE ODD PARITY BIT
	SHIFTOUT(9) <=  not (charout(7) xor charout(6) xor charout(5) xor 
		charout(4) xor Charout(3) xor charout(2) xor charout(1) xor 
		charout(0));
		-- STOP BIT 
	SHIFTOUT(10) <= '1';
		-- Data Available Flag to Mouse
		-- Tells mouse to clock out command data (is also start bit)
    MOUSE_DATA_BUF <= '0';

ELSIF(MOUSE_CLK_filter'event and MOUSE_CLK_filter='0') THEN
IF MOUSE_DATA_DIR='1' THEN
		-- SHIFT OUT NEXT SERIAL BIT
  IF SEND_CHAR = '1' THEN
		-- Loop through all bits in shift register
        IF OUTCNT <= "1001" THEN
         OUTCNT <= OUTCNT + 1;
		-- Shift out next bit to mouse
         SHIFTOUT(9 DOWNTO 0) <= SHIFTOUT(10 DOWNTO 1);
		 SHIFTOUT(10) <= '1';
         MOUSE_DATA_BUF <= SHIFTOUT(1);
		 OUTPUT_READY <= '0';
		-- END OF CHARACTER
	 ELSE
     	SEND_CHAR <= '0';
		-- Signal the character has been output
		OUTPUT_READY <= '1';
		OUTCNT <= "0000";
	END IF;
  END IF;
END IF;
END IF;
END PROCESS SEND_UART;

RECV_UART: PROCESS(reset, mouse_clk_filter)
BEGIN
IF RESET='1' THEN
	INCNT <= "0000";
    READ_CHAR <= '0';
	PACKET_COUNT <= "00";
    LEFT_BUTTON <= '0';
    RIGHT_BUTTON <= '0';
	CHARIN <= "00000000";
ELSIF MOUSE_CLK_FILTER'event and MOUSE_CLK_FILTER='1' THEN
	IF MOUSE_DATA_DIR='0' THEN
 		IF MOUSE_DATA='0' AND READ_CHAR='0' THEN
			READ_CHAR<= '1';
    		IREADY_SET<= '0';
 		ELSE
		-- SHIFT IN NEXT SERIAL BIT
  		IF READ_CHAR = '1' THEN
        	IF INCNT < "1001" THEN
         		INCNT <= INCNT + 1;
         		SHIFTIN(7 DOWNTO 0) <= SHIFTIN(8 DOWNTO 1);
         		SHIFTIN(8) <= MOUSE_DATA;
	 			IREADY_SET <= '0';
		-- END OF CHARACTER
	 		ELSE
	 			CHARIN <= SHIFTIN(7 DOWNTO 0);
     			READ_CHAR <= '0';
	 			IREADY_SET <= '1';
  	 			PACKET_COUNT <= PACKET_COUNT + 1;
		-- PACKET_COUNT = "00" IS ACK COMMAND
				IF PACKET_COUNT = "00" THEN
		-- Set Cursor to middle of screen
				    cursor_column <= CONV_STD_LOGIC_VECTOR(320,10);
    				cursor_row <= CONV_STD_LOGIC_VECTOR(240,10);
				    NEW_cursor_column <= CONV_STD_LOGIC_VECTOR(320,10);
    				NEW_cursor_row <= CONV_STD_LOGIC_VECTOR(240,10);
				ELSIF PACKET_COUNT = "01" THEN
					PACKET_CHAR1 <= SHIFTIN(7 DOWNTO 0);
	-- Limit Cursor on Screen Edges	
	-- Check for left screen limit
	-- All numbers are positive only, and need to check for zero wrap around.
	-- Set limits higher since mouse can move up to 128 pixels in one packet
					IF (cursor_row < 128) AND ((NEW_cursor_row > 256) OR
						(NEW_cursor_row < 2)) THEN
						cursor_row <= CONV_STD_LOGIC_VECTOR(0,10);
			-- Check for right screen limit
					ELSIF NEW_cursor_row > 480 THEN
						cursor_row <= CONV_STD_LOGIC_VECTOR(480,10);
					ELSE
						cursor_row <= NEW_cursor_row;
					END IF;
			-- Check for top screen limit
					IF (cursor_column < 128)  AND ((NEW_cursor_column > 256)  OR
						(NEW_cursor_column < 2)) THEN
						cursor_column <= CONV_STD_LOGIC_VECTOR(0,10);
			-- Check for bottom screen limit
					ELSIF NEW_cursor_column > 640 THEN
						cursor_column <= CONV_STD_LOGIC_VECTOR(640,10);
					ELSE
						cursor_column <= NEW_cursor_column;
					END IF;
  				ELSIF PACKET_COUNT = "10" THEN
					PACKET_CHAR2 <= SHIFTIN(7 DOWNTO 0);
  				ELSIF PACKET_COUNT = "11" THEN
					PACKET_CHAR3 <= SHIFTIN(7 DOWNTO 0);
  				END IF;
	 			INCNT <= conv_std_logic_vector(0,4);
  				IF PACKET_COUNT = "11" THEN
    				PACKET_COUNT <= "01";
		-- Packet Complete, so process data in packet
		-- Sign extend X AND Y two's complement motion values and 
		-- add to Current Cursor Address
		--
		-- Y Motion is Negative since up is a lower row address
    				NEW_cursor_row <= cursor_row - (PACKET_CHAR3(7) & 
								PACKET_CHAR3(7) & PACKET_CHAR3);
    				NEW_cursor_column <= cursor_column + (PACKET_CHAR2(7) & 
								PACKET_CHAR2(7) & PACKET_CHAR2);
    				LEFT_BUTTON <= PACKET_CHAR1(0);
    				RIGHT_BUTTON <= PACKET_CHAR1(1);
  				END IF;
			END IF;
  		END IF;
 	END IF;
 END IF;
END IF;
END PROCESS RECV_UART;

END behavior;
