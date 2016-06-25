LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instruction_memory is
    port(clk : in STD_LOGIC;
         address:in STD_LOGIC_VECTOR(15 downto 0);
         data_out:out STD_LOGIC_VECTOR(15 downto 0)
         );
end instruction_memory;

architecture dataflow of instruction_memory is
    type ram_array is array (15 downto 0) of std_logic_vector (15 downto 0);
    signal data_array : ram_array := ("0110000011000011","0110000011001111",others=>"0000000000000000");
begin
    process(clk)
    begin
        if(clk='1') then
            data_out <= data_array(to_integer(unsigned(address)));
        end if;
    end process;

end dataflow;

