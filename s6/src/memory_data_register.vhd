library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory_data_register is
    port(
            clk : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR(15 downto 0);
            data_out : out STD_LOGIC_VECTOR(15 downto 0)
        );
end entity;

architecture dataflow of memory_data_register is
begin
    process(clk)
    begin
        data_out <= data_in;
    end process;
end dataflow;
