library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_file is
    port(
            rs1 : in STD_LOGIC_VECTOR(3 downto 0);
            rs2 : in STD_LOGIC_VECTOR(3 downto 0);
            load_address : in STD_LOGIC_VECTOR(3 downto 0) ;
            write_data : in STD_LOGIC_VECTOR(15 downto 0);
            write : in STD_LOGIC;
            A : out STD_LOGIC_VECTOR(15 downto 0);
            B : out STD_LOGIC_VECTOR(15 downto 0);
            clk : in STD_LOGIC
        );
end entity;


architecture behavorial of register_file is
    type data_array_data is array (15 downto 0) of STD_LOGIC_VECTOR (15 downto 0);

    signal data : data_array_data := ("0001000100001000","0001001110011000",others=>"1100011111111111");
begin
          data(to_integer(unsigned(load_address))) <= write_data when write = '1';
  process(clk)

    begin
    A <= data(to_integer(unsigned(rs1)));
    B <= data(to_integer(unsigned(rs2)));


  end process;
end behavorial;
