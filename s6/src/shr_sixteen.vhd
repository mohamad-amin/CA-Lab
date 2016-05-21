LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shr_sixteen is
    port(
            a : in STD_LOGIC_VECTOR(15 downto 0);
            data_in : in STD_LOGIC;
            result:out STD_LOGIC_VECTOR(15 downto 0)
        );
end shr_sixteen;

architecture dataflow of shr_sixteen is

begin
    result(15 downto 0) <= data_in & a(14 downto 0);
end dataflow;

