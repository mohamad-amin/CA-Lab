LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity data_memory is
    port(clk:in STD_LOGIC;
         address:in STD_LOGIC_VECTOR(15 downto 0);
         data_in:in STD_LOGIC_VECTOR(15 downto 0);
         read_data:out STD_LOGIC_VECTOR(15 downto 0);
         mem_write:in   STD_LOGIC;
         mem_read:in STD_LOGIC);
end data_memory;

architecture dataflow of data_memory is
    type ram_array is array (15 downto 0) of std_logic_vector (15 downto 0);
    signal data_array : ram_array := (others=>"0000000000000001");
begin
    process(clk,mem_write,Data_in,mem_read)
    begin
        read_data <= data_array(to_integer(unsigned(address)));
        if(mem_write = '1' and  clk='1') then
            data_array(to_integer(unsigned(address))) <= data_in;
        end if;
   end process;

end dataflow;

