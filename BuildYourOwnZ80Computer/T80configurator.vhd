----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:20 05/18/2011 
-- Design Name: 
-- Module Name:    T80configurator - Behavioral 
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

entity T80configurator is
generic (
		USE_FX2:boolean:=true
		);
port(
		RESET_n		: in std_logic;
		CLK_n		: in std_logic;
		CLKEN		: in std_logic;
		WAIT_n		: in std_logic;
		INT_n		: in std_logic;
		NMI_n		: in std_logic;
		BUSRQ_n		: in std_logic;
		M1_n		: out std_logic;
		MREQ_n		: out std_logic;
		IORQ_n		: out std_logic;
		RD_n		: out std_logic;
		WR_n		: out std_logic;
		RFSH_n		: out std_logic;
		HALT_n		: out std_logic;
		BUSAK_n		: out std_logic;
		A			: out std_logic_vector(15 downto 0);
		DI			: in std_logic_vector(7 downto 0);
		DO			: out std_logic_vector(7 downto 0);
		FX2BB : inout std_logic_vector(40 downto 1)
	);
end T80configurator;

architecture Behavioral of T80configurator is
	component T80se
      port ( RESET_n : in    std_logic; 
             CLK_n   : in    std_logic; 
             CLKEN   : in    std_logic; 
             WAIT_n  : in    std_logic; 
             INT_n   : in    std_logic; 
             NMI_n   : in    std_logic; 
             BUSRQ_n : in    std_logic; 
             DI      : in    std_logic_vector (7 downto 0); 
             M1_n    : out   std_logic; 
             MREQ_n  : out   std_logic; 
             IORQ_n  : out   std_logic; 
             RD_n    : out   std_logic; 
             WR_n    : out   std_logic; 
             RFSH_n  : out   std_logic; 
             HALT_n  : out   std_logic; 
             BUSAK_n : out   std_logic; 
             A       : out   std_logic_vector (15 downto 0); 
             DO      : out   std_logic_vector (7 downto 0));
   end component;
	component Z80fx2bb
      port ( RESET_n : in    std_logic; 
             CLK_n   : in    std_logic; 
             CLKEN   : in    std_logic; 
             WAIT_n  : in    std_logic; 
             INT_n   : in    std_logic; 
             NMI_n   : in    std_logic; 
             BUSRQ_n : in    std_logic; 
             DI      : in    std_logic_vector (7 downto 0); 
             M1_n    : out   std_logic; 
             MREQ_n  : out   std_logic; 
             IORQ_n  : out   std_logic; 
             RD_n    : out   std_logic; 
             WR_n    : out   std_logic; 
             RFSH_n  : out   std_logic; 
             HALT_n  : out   std_logic; 
             BUSAK_n : out   std_logic; 
             A       : out   std_logic_vector (15 downto 0); 
             DO      : out   std_logic_vector (7 downto 0);
				 FX2BB   : inout std_logic_vector(40 downto 1));
   end component;
begin

	hard:if USE_FX2 generate
	AmstradT80_hard : Z80fx2bb
      port map (BUSRQ_n=>BUSRQ_n,
                CLKEN=>CLKEN,
                CLK_n=>CLK_n,
                DI(7 downto 0)=>DI(7 downto 0),
                INT_n=>INT_n,
                NMI_n=>NMI_n,
                RESET_n=>RESET_n,
                WAIT_n=>WAIT_n,
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>BUSAK_n,
                DO(7 downto 0)=>DO(7 downto 0),
                HALT_n=>HALT_n,
                IORQ_n=>IORQ_n,
                MREQ_n=>MREQ_n,
                M1_n=>M1_n,
                RD_n=>RD_n,
                RFSH_n=>RFSH_n,
                WR_n=>WR_n,
					 FX2BB=>FX2BB);
	end generate hard;
	soft:if not(USE_FX2) generate
		FX2BB<=(others=>'Z');
		AmstradT80_soft : T80se
      port map (BUSRQ_n=>BUSRQ_n,
                CLKEN=>CLKEN,
                CLK_n=>CLK_n,
                DI(7 downto 0)=>DI(7 downto 0),
                INT_n=>INT_n,
                NMI_n=>NMI_n,
                RESET_n=>RESET_n,
                WAIT_n=>WAIT_n,
                A(15 downto 0)=>A(15 downto 0),
                BUSAK_n=>BUSAK_n,
                DO(7 downto 0)=>DO(7 downto 0),
                HALT_n=>HALT_n,
                IORQ_n=>IORQ_n,
                MREQ_n=>MREQ_n,
                M1_n=>M1_n,
                RD_n=>RD_n,
                RFSH_n=>RFSH_n,
                WR_n=>WR_n);
	end generate soft;


end Behavioral;

