LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is
    port(clk, rw:in STD_LOGIC;
         address:in STD_LOGIC_VECTOR(3 downto 0);
         data_in:in STD_LOGIC_VECTOR(3 downto 0);
         data_out:out STD_LOGIC_VECTOR(3 downto 0);
         data_ready:out STD_LOGIC);
end ram;

architecture dataflow of ram is
    type ram_array is array (15 downto 0) of std_logic_vector (3 downto 0);
    signal data_array : ram_array;
begin
    process(clk,rw,Data_in)
    begin
        Data_ready<='0';
        if(rw = '1' and  clk='1') then
            data_array(to_integer(unsigned(address))) <= data_in;
            data_ready<='0';
        end if;
        if(rw = '0' and  clk='1') then
            data_out <= data_array(to_integer(unsigned(address)));
            data_ready <= '1';
            data_ready <= '0';
        end if;
    end process;

end dataflow;
