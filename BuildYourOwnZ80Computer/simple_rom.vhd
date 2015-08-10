-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity SIMPLE_ROM is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of SIMPLE_ROM is

  function romgen_str2bv (str : string) return bit_vector is
    variable result : bit_vector (str'length*4-1 downto 0);
  begin
    for i in 0 to str'length-1 loop
      case str(str'high-i) is
        when '0'       => result(i*4+3 downto i*4) := x"0";
        when '1'       => result(i*4+3 downto i*4) := x"1";
        when '2'       => result(i*4+3 downto i*4) := x"2";
        when '3'       => result(i*4+3 downto i*4) := x"3";
        when '4'       => result(i*4+3 downto i*4) := x"4";
        when '5'       => result(i*4+3 downto i*4) := x"5";
        when '6'       => result(i*4+3 downto i*4) := x"6";
        when '7'       => result(i*4+3 downto i*4) := x"7";
        when '8'       => result(i*4+3 downto i*4) := x"8";
        when '9'       => result(i*4+3 downto i*4) := x"9";
        when 'A'       => result(i*4+3 downto i*4) := x"A";
        when 'B'       => result(i*4+3 downto i*4) := x"B";
        when 'C'       => result(i*4+3 downto i*4) := x"C";
        when 'D'       => result(i*4+3 downto i*4) := x"D";
        when 'E'       => result(i*4+3 downto i*4) := x"E";
        when 'F'       => result(i*4+3 downto i*4) := x"F";
        when others    => null;
      end case;
    end loop;
    return result;
  end romgen_str2bv;

  attribute INITP_00 : string;
  attribute INITP_01 : string;
  attribute INITP_02 : string;
  attribute INITP_03 : string;
  attribute INITP_04 : string;
  attribute INITP_05 : string;
  attribute INITP_06 : string;
  attribute INITP_07 : string;

  attribute INIT_00 : string;
  attribute INIT_01 : string;
  attribute INIT_02 : string;
  attribute INIT_03 : string;
  attribute INIT_04 : string;
  attribute INIT_05 : string;
  attribute INIT_06 : string;
  attribute INIT_07 : string;
  attribute INIT_08 : string;
  attribute INIT_09 : string;
  attribute INIT_0A : string;
  attribute INIT_0B : string;
  attribute INIT_0C : string;
  attribute INIT_0D : string;
  attribute INIT_0E : string;
  attribute INIT_0F : string;
  attribute INIT_10 : string;
  attribute INIT_11 : string;
  attribute INIT_12 : string;
  attribute INIT_13 : string;
  attribute INIT_14 : string;
  attribute INIT_15 : string;
  attribute INIT_16 : string;
  attribute INIT_17 : string;
  attribute INIT_18 : string;
  attribute INIT_19 : string;
  attribute INIT_1A : string;
  attribute INIT_1B : string;
  attribute INIT_1C : string;
  attribute INIT_1D : string;
  attribute INIT_1E : string;
  attribute INIT_1F : string;
  attribute INIT_20 : string;
  attribute INIT_21 : string;
  attribute INIT_22 : string;
  attribute INIT_23 : string;
  attribute INIT_24 : string;
  attribute INIT_25 : string;
  attribute INIT_26 : string;
  attribute INIT_27 : string;
  attribute INIT_28 : string;
  attribute INIT_29 : string;
  attribute INIT_2A : string;
  attribute INIT_2B : string;
  attribute INIT_2C : string;
  attribute INIT_2D : string;
  attribute INIT_2E : string;
  attribute INIT_2F : string;
  attribute INIT_30 : string;
  attribute INIT_31 : string;
  attribute INIT_32 : string;
  attribute INIT_33 : string;
  attribute INIT_34 : string;
  attribute INIT_35 : string;
  attribute INIT_36 : string;
  attribute INIT_37 : string;
  attribute INIT_38 : string;
  attribute INIT_39 : string;
  attribute INIT_3A : string;
  attribute INIT_3B : string;
  attribute INIT_3C : string;
  attribute INIT_3D : string;
  attribute INIT_3E : string;
  attribute INIT_3F : string;

  component RAMB16_S9
    --pragma translate_off
    generic (
      INITP_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";

      INIT_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_08 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_09 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_10 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_11 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_12 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_13 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_14 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_15 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_16 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_17 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_18 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_19 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_20 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_21 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_22 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_23 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_24 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_25 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_26 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_27 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_28 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_29 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_30 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_31 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_32 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_33 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_34 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_35 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_36 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_37 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_38 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_39 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000"
      );
    --pragma translate_on
    port (
      DO    : out std_logic_vector (7 downto 0);
      DOP   : out std_logic_vector (0 downto 0);
      ADDR  : in  std_logic_vector (10 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (7 downto 0);
      DIP   : in  std_logic_vector (0 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(10 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(10 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    -- LD A,(0000)
	 -- LD (0000),A
	 -- JP 0000
	 -- hexa: 3A0000 320000 C30000
	 
	 -- 1+4+16+64= hexa 55
	 -- LD A,55
	 -- LD (0000),A
	 -- JP 0000
	 -- hexa : 3E55 320000 C30000
	 
	 -- LD A,55
	 -- OUT (00),A
	 -- JP 0000
	 -- hexa : 3E55 D300 C30000
	 
	 -- IN A,(00)
	 -- OUT (00),A
	 -- JP 0000
	 -- hexa : DB00 D300 C30000
	 
	 
    attribute INIT_00 of inst : label is "000000000000000000000000000000000000000000000000000000C300D3553E";
    attribute INIT_01 of inst : label is "4CCDD81856CD1DCF010AB1CD1828C31844CD1837DA1856CD1DBE01206C320A3E";
    attribute INIT_02 of inst : label is "03670A036FC837FFFE0AC9C10A93CD4F206C3AC5C9C11439CD1006C5183AC318";
    attribute INIT_03 of inst : label is "CC2A04E620C23A1898CAB820CA3A4701D9CD4E233420C221C9A703570A035F0A";
    attribute INIT_04 of inst : label is "5021C920CB32013E00000015D3C3EB1A3BCD20C52120C722190030111888C220";
    attribute INIT_05 of inst : label is "18B8CA01E620553A20C132043E207E32FF3E208032023E1A32CD10061BC01120";
    attribute INIT_06 of inst : label is "3E1956CD01E6CD00062400310AB6C308FFCD00263E33112118C0C201E620553A";
    attribute INIT_07 of inst : label is "9432B020943AC904C03D20823A0206C923D00F20E72120673A0AEAC320CF3208";
    attribute INIT_08 of inst : label is "11241E211C0EC923D80F20673A20E7211597C314D8CD01C3C3220021C903D320";
    attribute INIT_09 of inst : label is "0121070E09ADC36F66237E2356235E1931C320FC211931C320F82108F3C31AE4";
    attribute INIT_0A of inst : label is "CD1925CD191ACD1A5CCD1931C320F42109B2C33C012120EB3A08F3C31FA91135";
    attribute INIT_0B of inst : label is "C31947CD19D7CD16E6C3206D32013E1671C319DCCD1947C3193CCD1950CD192B";
    attribute INIT_0C of inst : label is "ACC2A7201E3A0000000008F3C3130E19BE1128032109D6C3198BC920C132193C";
    attribute INIT_0D of inst : label is "132808F3C3090E0BF7112E1B21C034FE76E601DB201E323CC072D676E601DB19";
    attribute INIT_0E of inst : label is "A020943A0019D3C3AFC920E932013E280D0E081300110E0F110E02260E130800";
    attribute INIT_0F of inst : label is "7C14CBCD100619ECC23D791439CD4F10061C601119FACA270121C903D3209432";
    attribute INIT_10 of inst : label is "020304050607080A0D11161C242B32C937C0A880E61A46207221C919FAC235FE";
    attribute INIT_11 of inst : label is "7E2356235EC91A32C2051323771AFF0507090B0C0D0E101315181C22272E3401";
    attribute INIT_12 of inst : label is "36240021C9C16720F63FE67C1A4AC2056F1F7D671F7C0306C5C96F6146234E23";
    attribute INIT_13 of inst : label is "CDC91A69C205C109002001E11A6BC20D231377B61AE5C5C91A5FC240FE7C2300";
    attribute INIT_14 of inst : label is "20009E101C20FEB8FF0000000009C5C30FE6250121F119E6CD773DF5C8A7092E";
    attribute INIT_15 of inst : label is "1C26110E261B252624110418000B0F26261104150E26040C000607080B10301C";
    attribute INIT_16 of inst : label is "1314012626110418000B0F1B26180B0D0E260D0E131314012612110418000B0F";
    attribute INIT_17 of inst : label is "26251C2404110E02122604110E02123F080726251B2404110E021226260D0E13";
    attribute INIT_18 of inst : label is "0000011030201C600C05FF028E00800000F80038783878020000000010000001";
    attribute INIT_19 of inst : label is "0300001CEE0400000000000476020000FFFF00040130281C90100003BB000000";
    attribute INIT_1A of inst : label is "0300001CD0041D0601000006820000000300001CE2041D0001000004B6000000";
    attribute INIT_1B of inst : label is "00FC251B24110418000B0F2618000B0F0000001200300001211000001CC000FF";
    attribute INIT_1C of inst : label is "1C20009E100000010040010000060008001D54021829D01D6420000000FFFF01";
    attribute INIT_1D of inst : label is "000000001BA000FF101BA098B8010000001A3D68FCFC683D1A08131478040300";
    attribute INIT_1E of inst : label is "00193A6DFAFA6D3A190B147804030000039BC81CD0070000000000050E001000";
    attribute INIT_1F of inst : label is "391C0000271C00002F1C000000000080001F7401000001000000000000000000";
    attribute INIT_20 of inst : label is "0000781DBE6C3C3C3C6CBE1D78000000000039797A6EECFAFAEC6E7A79390000";
    attribute INIT_21 of inst : label is "0000387A7F6DECFAFAEC6D7F7A38000000000000193A6DFAFA6D3A1900000000";
    attribute INIT_22 of inst : label is "000000001A3D68FCFC683D1A0000000000000E18BE6D3D3C3D6DBE180E000000";
    attribute INIT_23 of inst : label is "01000304492F032F0FB3070313010400000F1F1F1F1F7FFF7F1F1F1F1F0F0000";
    attribute INIT_24 of inst : label is "080E0F261A1B27997C3EBC3D7E3C990F481184404B0B27270F5B030AA3050840";
    attribute INIT_25 of inst : label is "130B08133020100228040B0100132604020D001503002604110E02122812130D";
    attribute INIT_26 of inst : label is "3FBE154A88542244AA1022548810AA4400000849221481420042811422490800";
    attribute INIT_27 of inst : label is "000029000B0F90FE4800FE0012FE2400FE0080FC8020FC2010FC1004FC04255E";
    attribute INIT_28 of inst : label is "030A060A080706040502050A07040B020802090B01010306010B040101010701";
    attribute INIT_29 of inst : label is "FFFCFFF8FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFF8FFFCFFFF7FFF3FFF1FFF0FFF";
    attribute INIT_2A of inst : label is "1010103005101015100505109D9A9794301510050FFF1FFF3FFF7FFFFFFFFFFF";
    attribute INIT_2B of inst : label is "A500220000000000040C1E373E7C747E7E747C3E371E0C040000000005101505";
    attribute INIT_2C of inst : label is "1A1A1D1A1F1B1A1A1B1A1F26000008904208981DB66248101D363CB63D980840";
    attribute INIT_2D of inst : label is "2C0E1211040300150D0826260402000F1218000B0F4040404848485060302010";
    attribute INIT_2E of inst : label is "FF1C992E081DF42E0A1DEA2E0C1DE02E0EFF1C002C081C402C0A1C202C0C1D68";
    attribute INIT_2F of inst : label is "000012130D080E0F261A1C2712130D080E0F261A1D271811041312180C263827";
    attribute INIT_30 of inst : label is "00003E4141417F000000224141413E000000364949497F0000001F2444241F00";
    attribute INIT_31 of inst : label is "00007F0808087F000000474541413E000000404848487F000000414949497F00";
    attribute INIT_32 of inst : label is "0000010101017F000000412214087F0000007E0101010200000000417F410000";
    attribute INIT_33 of inst : label is "0000304848487F0000003E4141413E0000007F0408107F0000007F2018207F00";
    attribute INIT_34 of inst : label is "000040407F40400000002649494932000000314A4C487F0000003D4245413E00";
    attribute INIT_35 of inst : label is "000063140814630000007F020C027F0000007C0201027C0000007E0101017E00";
    attribute INIT_36 of inst : label is "000000017F21000000003E5149453E000000615149454300000060100F106000";
    attribute INIT_37 of inst : label is "00004E51515172000000047F24140C0000006659494142000000314949452300";
    attribute INIT_38 of inst : label is "00003C4A49493100000036494949360000006050484740000000464949291E00";
    attribute INIT_39 of inst : label is "0000141414141400000000000000000000000814224100000000004122140800";
    attribute INIT_3A of inst : label is "2512110418000B0F261C26110E261B240000030478040300000022147F142200";
    attribute INIT_3B of inst : label is "000102000102000100000101260D080E02261B2626110418000B0F261B282626";
    attribute INIT_3C of inst : label is "1F502A0D0D080E022626131104120D08001A3D68FCFC683D1A183060100F1060";
    attribute INIT_3D of inst : label is "00193A6DFAFA6D3A193860100F10600026130803041102FF1FE12A071F622A0A";
    attribute INIT_3E of inst : label is "200094101C2022D00100001F800097101F80FFB8FF000000000020504D402000";
    attribute INIT_3F of inst : label is "0000080808080800260712140F120D080E02261C2612110418000B0F261C281C";
  begin
  inst : RAMB16_S9
      --pragma translate_off
      generic map (
        INITP_00 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_01 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_02 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_03 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_05 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_06 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_07 => x"0000000000000000000000000000000000000000000000000000000000000000",

        INIT_00 => romgen_str2bv(inst'INIT_00),
        INIT_01 => romgen_str2bv(inst'INIT_01),
        INIT_02 => romgen_str2bv(inst'INIT_02),
        INIT_03 => romgen_str2bv(inst'INIT_03),
        INIT_04 => romgen_str2bv(inst'INIT_04),
        INIT_05 => romgen_str2bv(inst'INIT_05),
        INIT_06 => romgen_str2bv(inst'INIT_06),
        INIT_07 => romgen_str2bv(inst'INIT_07),
        INIT_08 => romgen_str2bv(inst'INIT_08),
        INIT_09 => romgen_str2bv(inst'INIT_09),
        INIT_0A => romgen_str2bv(inst'INIT_0A),
        INIT_0B => romgen_str2bv(inst'INIT_0B),
        INIT_0C => romgen_str2bv(inst'INIT_0C),
        INIT_0D => romgen_str2bv(inst'INIT_0D),
        INIT_0E => romgen_str2bv(inst'INIT_0E),
        INIT_0F => romgen_str2bv(inst'INIT_0F),
        INIT_10 => romgen_str2bv(inst'INIT_10),
        INIT_11 => romgen_str2bv(inst'INIT_11),
        INIT_12 => romgen_str2bv(inst'INIT_12),
        INIT_13 => romgen_str2bv(inst'INIT_13),
        INIT_14 => romgen_str2bv(inst'INIT_14),
        INIT_15 => romgen_str2bv(inst'INIT_15),
        INIT_16 => romgen_str2bv(inst'INIT_16),
        INIT_17 => romgen_str2bv(inst'INIT_17),
        INIT_18 => romgen_str2bv(inst'INIT_18),
        INIT_19 => romgen_str2bv(inst'INIT_19),
        INIT_1A => romgen_str2bv(inst'INIT_1A),
        INIT_1B => romgen_str2bv(inst'INIT_1B),
        INIT_1C => romgen_str2bv(inst'INIT_1C),
        INIT_1D => romgen_str2bv(inst'INIT_1D),
        INIT_1E => romgen_str2bv(inst'INIT_1E),
        INIT_1F => romgen_str2bv(inst'INIT_1F),
        INIT_20 => romgen_str2bv(inst'INIT_20),
        INIT_21 => romgen_str2bv(inst'INIT_21),
        INIT_22 => romgen_str2bv(inst'INIT_22),
        INIT_23 => romgen_str2bv(inst'INIT_23),
        INIT_24 => romgen_str2bv(inst'INIT_24),
        INIT_25 => romgen_str2bv(inst'INIT_25),
        INIT_26 => romgen_str2bv(inst'INIT_26),
        INIT_27 => romgen_str2bv(inst'INIT_27),
        INIT_28 => romgen_str2bv(inst'INIT_28),
        INIT_29 => romgen_str2bv(inst'INIT_29),
        INIT_2A => romgen_str2bv(inst'INIT_2A),
        INIT_2B => romgen_str2bv(inst'INIT_2B),
        INIT_2C => romgen_str2bv(inst'INIT_2C),
        INIT_2D => romgen_str2bv(inst'INIT_2D),
        INIT_2E => romgen_str2bv(inst'INIT_2E),
        INIT_2F => romgen_str2bv(inst'INIT_2F),
        INIT_30 => romgen_str2bv(inst'INIT_30),
        INIT_31 => romgen_str2bv(inst'INIT_31),
        INIT_32 => romgen_str2bv(inst'INIT_32),
        INIT_33 => romgen_str2bv(inst'INIT_33),
        INIT_34 => romgen_str2bv(inst'INIT_34),
        INIT_35 => romgen_str2bv(inst'INIT_35),
        INIT_36 => romgen_str2bv(inst'INIT_36),
        INIT_37 => romgen_str2bv(inst'INIT_37),
        INIT_38 => romgen_str2bv(inst'INIT_38),
        INIT_39 => romgen_str2bv(inst'INIT_39),
        INIT_3A => romgen_str2bv(inst'INIT_3A),
        INIT_3B => romgen_str2bv(inst'INIT_3B),
        INIT_3C => romgen_str2bv(inst'INIT_3C),
        INIT_3D => romgen_str2bv(inst'INIT_3D),
        INIT_3E => romgen_str2bv(inst'INIT_3E),
        INIT_3F => romgen_str2bv(inst'INIT_3F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(7 downto 0),
        DOP  => open,
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "00000000",
        DIP  => "0",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
