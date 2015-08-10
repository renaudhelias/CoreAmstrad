--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.2
--  \   \         Application : sch2hdl
--  /   /         Filename : CLK_commander.vhf
-- /___/   /\     Timestamp : 02/05/2011 18:39:42
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3 -flat -suppress -vhdl C:/Users/freemac/BuildYourOwnZ80Computer/CLK_commander.vhf -w C:/Users/freemac/BuildYourOwnZ80Computer/CLK_commander.sch
--Design Name: CLK_commander
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity D3_8E_MXILINX_CLK_commander is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          A2 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic; 
          D4 : out   std_logic; 
          D5 : out   std_logic; 
          D6 : out   std_logic; 
          D7 : out   std_logic);
end D3_8E_MXILINX_CLK_commander;

architecture BEHAVIORAL of D3_8E_MXILINX_CLK_commander is
   attribute BOX_TYPE   : string ;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
begin
   I_36_30 : AND4
      port map (I0=>A2,
                I1=>A1,
                I2=>A0,
                I3=>E,
                O=>D7);
   
   I_36_31 : AND4B1
      port map (I0=>A0,
                I1=>A2,
                I2=>A1,
                I3=>E,
                O=>D6);
   
   I_36_32 : AND4B1
      port map (I0=>A1,
                I1=>A2,
                I2=>A0,
                I3=>E,
                O=>D5);
   
   I_36_33 : AND4B2
      port map (I0=>A1,
                I1=>A0,
                I2=>A2,
                I3=>E,
                O=>D4);
   
   I_36_34 : AND4B1
      port map (I0=>A2,
                I1=>A0,
                I2=>A1,
                I3=>E,
                O=>D3);
   
   I_36_35 : AND4B2
      port map (I0=>A2,
                I1=>A0,
                I2=>A1,
                I3=>E,
                O=>D2);
   
   I_36_36 : AND4B2
      port map (I0=>A2,
                I1=>A1,
                I2=>A0,
                I3=>E,
                O=>D1);
   
   I_36_37 : AND4B3
      port map (I0=>A2,
                I1=>A1,
                I2=>A0,
                I3=>E,
                O=>D0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FTRSE_MXILINX_CLK_commander is
   generic( INIT : bit :=  '0');
   port ( C  : in    std_logic; 
          CE : in    std_logic; 
          R  : in    std_logic; 
          S  : in    std_logic; 
          T  : in    std_logic; 
          Q  : out   std_logic);
end FTRSE_MXILINX_CLK_commander;

architecture BEHAVIORAL of FTRSE_MXILINX_CLK_commander is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal CE_S    : std_logic;
   signal D_S     : std_logic;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDRE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDRE : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   attribute RLOC of I_36_35 : label is "X0Y0";
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>TQ);
   
   I_36_35 : FDRE
   generic map( INIT => INIT)
      port map (C=>C,
                CE=>CE_S,
                D=>D_S,
                R=>R,
                Q=>Q_DUMMY);
   
   I_36_73 : OR2
      port map (I0=>S,
                I1=>TQ,
                O=>D_S);
   
   I_36_77 : OR2
      port map (I0=>CE,
                I1=>S,
                O=>CE_S);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CB8RE_MXILINX_CLK_commander is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          R   : in    std_logic; 
          CEO : out   std_logic; 
          Q   : out   std_logic_vector (7 downto 0); 
          TC  : out   std_logic);
end CB8RE_MXILINX_CLK_commander;

architecture BEHAVIORAL of CB8RE_MXILINX_CLK_commander is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal T2       : std_logic;
   signal T3       : std_logic;
   signal T4       : std_logic;
   signal T5       : std_logic;
   signal T6       : std_logic;
   signal T7       : std_logic;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal Q_DUMMY  : std_logic_vector (7 downto 0);
   signal TC_DUMMY : std_logic;
   component FTRSE_MXILINX_CLK_commander
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             R  : in    std_logic; 
             S  : in    std_logic; 
             T  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   attribute HU_SET of I_Q0 : label is "I_Q0_7";
   attribute HU_SET of I_Q1 : label is "I_Q1_6";
   attribute HU_SET of I_Q2 : label is "I_Q2_5";
   attribute HU_SET of I_Q3 : label is "I_Q3_4";
   attribute HU_SET of I_Q4 : label is "I_Q4_3";
   attribute HU_SET of I_Q5 : label is "I_Q5_2";
   attribute HU_SET of I_Q6 : label is "I_Q6_1";
   attribute HU_SET of I_Q7 : label is "I_Q7_0";
begin
   Q(7 downto 0) <= Q_DUMMY(7 downto 0);
   TC <= TC_DUMMY;
   I_Q0 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>XLXN_1,
                Q=>Q_DUMMY(0));
   
   I_Q1 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>Q_DUMMY(0),
                Q=>Q_DUMMY(1));
   
   I_Q2 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>T2,
                Q=>Q_DUMMY(2));
   
   I_Q3 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>T3,
                Q=>Q_DUMMY(3));
   
   I_Q4 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>T4,
                Q=>Q_DUMMY(4));
   
   I_Q5 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>T5,
                Q=>Q_DUMMY(5));
   
   I_Q6 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>T6,
                Q=>Q_DUMMY(6));
   
   I_Q7 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>T7,
                Q=>Q_DUMMY(7));
   
   I_36_7 : GND
      port map (G=>XLXN_2);
   
   I_36_13 : VCC
      port map (P=>XLXN_1);
   
   I_36_21 : AND2
      port map (I0=>Q_DUMMY(1),
                I1=>Q_DUMMY(0),
                O=>T2);
   
   I_36_22 : AND3
      port map (I0=>Q_DUMMY(2),
                I1=>Q_DUMMY(1),
                I2=>Q_DUMMY(0),
                O=>T3);
   
   I_36_23 : AND4
      port map (I0=>Q_DUMMY(3),
                I1=>Q_DUMMY(2),
                I2=>Q_DUMMY(1),
                I3=>Q_DUMMY(0),
                O=>T4);
   
   I_36_25 : AND2
      port map (I0=>Q_DUMMY(4),
                I1=>T4,
                O=>T5);
   
   I_36_26 : AND3
      port map (I0=>Q_DUMMY(5),
                I1=>Q_DUMMY(4),
                I2=>T4,
                O=>T6);
   
   I_36_28 : AND4
      port map (I0=>Q_DUMMY(6),
                I1=>Q_DUMMY(5),
                I2=>Q_DUMMY(4),
                I3=>T4,
                O=>T7);
   
   I_36_29 : AND5
      port map (I0=>Q_DUMMY(7),
                I1=>Q_DUMMY(6),
                I2=>Q_DUMMY(5),
                I3=>Q_DUMMY(4),
                I4=>T4,
                O=>TC_DUMMY);
   
   I_36_32 : AND2
      port map (I0=>CE,
                I1=>TC_DUMMY,
                O=>CEO);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CB2RE_MXILINX_CLK_commander is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          R   : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          TC  : out   std_logic);
end CB2RE_MXILINX_CLK_commander;

architecture BEHAVIORAL of CB2RE_MXILINX_CLK_commander is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal TC_DUMMY : std_logic;
   component FTRSE_MXILINX_CLK_commander
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             R  : in    std_logic; 
             S  : in    std_logic; 
             T  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of I_Q0 : label is "I_Q0_8";
   attribute HU_SET of I_Q1 : label is "I_Q1_9";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   TC <= TC_DUMMY;
   I_Q0 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>XLXN_1,
                Q=>Q0_DUMMY);
   
   I_Q1 : FTRSE_MXILINX_CLK_commander
      port map (C=>C,
                CE=>CE,
                R=>R,
                S=>XLXN_2,
                T=>Q0_DUMMY,
                Q=>Q1_DUMMY);
   
   I_36_37 : AND2
      port map (I0=>Q1_DUMMY,
                I1=>Q0_DUMMY,
                O=>TC_DUMMY);
   
   I_36_47 : VCC
      port map (P=>XLXN_1);
   
   I_36_54 : GND
      port map (G=>XLXN_2);
   
   I_36_55 : AND2
      port map (I0=>CE,
                I1=>TC_DUMMY,
                O=>CEO);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CLK_commander is
   port ( CLK50MHz  : in    std_logic; 
          CLK1MHz   : out   std_logic; 
          CLK4MHz   : out   std_logic; 
          CLK25MHz  : out   std_logic; 
          CLK100MHz : out   std_logic);
end CLK_commander;

architecture BEHAVIORAL of CLK_commander is
   attribute CLK_FEEDBACK          : string ;
   attribute CLKDV_DIVIDE          : string ;
   attribute CLKFX_DIVIDE          : string ;
   attribute CLKIN_PERIOD          : string ;
   attribute CLKFX_MULTIPLY        : string ;
   attribute CLKIN_DIVIDE_BY_2     : string ;
   attribute CLKOUT_PHASE_SHIFT    : string ;
   attribute DESKEW_ADJUST         : string ;
   attribute DFS_FREQUENCY_MODE    : string ;
   attribute DLL_FREQUENCY_MODE    : string ;
   attribute DSS_MODE              : string ;
   attribute DUTY_CYCLE_CORRECTION : string ;
   attribute PHASE_SHIFT           : string ;
   attribute STARTUP_WAIT          : string ;
   attribute BOX_TYPE              : string ;
   attribute HU_SET                : string ;
   signal COMPTEUR25                 : std_logic_vector (7 downto 0);
   signal XLXN_2                     : std_logic;
   signal XLXN_3                     : std_logic;
   signal XLXN_31                    : std_logic;
   signal XLXN_32                    : std_logic;
   signal XLXN_33                    : std_logic;
   signal XLXN_34                    : std_logic;
   signal XLXN_215                   : std_logic;
   signal XLXN_216                   : std_logic;
   signal XLXN_218                   : std_logic;
   signal XLXN_220                   : std_logic;
   signal XLXN_221                   : std_logic;
   signal XLXN_223                   : std_logic;
   signal XLXN_224                   : std_logic;
   signal XLXN_225                   : std_logic;
   signal XLXN_228                   : std_logic;
   signal CLK100MHz_DUMMY            : std_logic;
   signal CLK25MHz_DUMMY             : std_logic;
   signal XLXI_1_DSSEN_openSignal    : std_logic;
   signal XLXI_1_PSCLK_openSignal    : std_logic;
   signal XLXI_1_PSEN_openSignal     : std_logic;
   signal XLXI_1_PSINCDEC_openSignal : std_logic;
   signal XLXI_1_RST_openSignal      : std_logic;
   component DCM
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKIN_PERIOD : real :=  10.0;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DSS_MODE : string :=  "NONE";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE);
      -- synopsys translate_on
      port ( CLKFB    : in    std_logic; 
             CLKIN    : in    std_logic; 
             DSSEN    : in    std_logic; 
             PSCLK    : in    std_logic; 
             PSEN     : in    std_logic; 
             PSINCDEC : in    std_logic; 
             RST      : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLK90    : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic; 
             PSDONE   : out   std_logic; 
             STATUS   : out   std_logic_vector (7 downto 0));
   end component;
   attribute CLK_FEEDBACK of DCM : component is "1X";
   attribute CLKDV_DIVIDE of DCM : component is "2.0";
   attribute CLKFX_DIVIDE of DCM : component is "1";
   attribute CLKIN_PERIOD of DCM : component is "10.0";
   attribute CLKFX_MULTIPLY of DCM : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM : component is "FALSE";
   attribute CLKOUT_PHASE_SHIFT of DCM : component is "NONE";
   attribute DESKEW_ADJUST of DCM : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM : component is "LOW";
   attribute DSS_MODE of DCM : component is "NONE";
   attribute DUTY_CYCLE_CORRECTION of DCM : component is "TRUE";
   attribute PHASE_SHIFT of DCM : component is "0";
   attribute STARTUP_WAIT of DCM : component is "FALSE";
   attribute BOX_TYPE of DCM : component is "BLACK_BOX";
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component CB2RE_MXILINX_CLK_commander
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component CB8RE_MXILINX_CLK_commander
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (7 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component D3_8E_MXILINX_CLK_commander
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic; 
             D4 : out   std_logic; 
             D5 : out   std_logic; 
             D6 : out   std_logic; 
             D7 : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_5 : label is "XLXI_5_10";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_11";
   attribute HU_SET of XLXI_33 : label is "XLXI_33_12";
begin
   CLK25MHz <= CLK25MHz_DUMMY;
   CLK100MHz <= CLK100MHz_DUMMY;
   XLXI_1 : DCM
      port map (CLKFB=>XLXN_3,
                CLKIN=>CLK50MHz,
                DSSEN=>XLXI_1_DSSEN_openSignal,
                PSCLK=>XLXI_1_PSCLK_openSignal,
                PSEN=>XLXI_1_PSEN_openSignal,
                PSINCDEC=>XLXI_1_PSINCDEC_openSignal,
                RST=>XLXI_1_RST_openSignal,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_2,
                CLK2X=>CLK100MHz_DUMMY,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>open,
                PSDONE=>open,
                STATUS=>open);
   
   XLXI_2 : BUFG
      port map (I=>XLXN_2,
                O=>XLXN_3);
   
   XLXI_5 : CB2RE_MXILINX_CLK_commander
      port map (C=>CLK100MHz_DUMMY,
                CE=>XLXN_33,
                R=>XLXN_34,
                CEO=>open,
                Q0=>open,
                Q1=>CLK25MHz_DUMMY,
                TC=>open);
   
   XLXI_8 : CB8RE_MXILINX_CLK_commander
      port map (C=>CLK25MHz_DUMMY,
                CE=>XLXN_32,
                R=>XLXN_31,
                CEO=>open,
                Q(7 downto 0)=>COMPTEUR25(7 downto 0),
                TC=>open);
   
   XLXI_16 : AND3
      port map (I0=>COMPTEUR25(4),
                I1=>COMPTEUR25(3),
                I2=>COMPTEUR25(0),
                O=>XLXN_31);
   
   XLXI_17 : VCC
      port map (P=>XLXN_32);
   
   XLXI_18 : VCC
      port map (P=>XLXN_33);
   
   XLXI_19 : GND
      port map (G=>XLXN_34);
   
   XLXI_33 : D3_8E_MXILINX_CLK_commander
      port map (A0=>COMPTEUR25(2),
                A1=>COMPTEUR25(1),
                A2=>COMPTEUR25(0),
                E=>XLXN_228,
                D0=>open,
                D1=>XLXN_220,
                D2=>open,
                D3=>XLXN_221,
                D4=>open,
                D5=>XLXN_223,
                D6=>open,
                D7=>XLXN_224);
   
   XLXI_35 : INV
      port map (I=>COMPTEUR25(4),
                O=>XLXN_215);
   
   XLXI_36 : INV
      port map (I=>COMPTEUR25(3),
                O=>XLXN_216);
   
   XLXI_37 : AND2
      port map (I0=>XLXN_216,
                I1=>XLXN_215,
                O=>XLXN_218);
   
   XLXI_38 : AND2
      port map (I0=>XLXN_220,
                I1=>XLXN_218,
                O=>CLK1MHz);
   
   XLXI_39 : OR4
      port map (I0=>XLXN_224,
                I1=>XLXN_223,
                I2=>XLXN_221,
                I3=>XLXN_220,
                O=>XLXN_225);
   
   XLXI_40 : AND2
      port map (I0=>XLXN_225,
                I1=>XLXN_218,
                O=>CLK4MHz);
   
   XLXI_41 : VCC
      port map (P=>XLXN_228);
   
end BEHAVIORAL;


