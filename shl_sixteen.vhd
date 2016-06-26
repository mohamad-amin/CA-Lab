
LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shl_sixteen is
    port(
            a : in STD_LOGIC_VECTOR(15 downto 0);
            data_in : in STD_LOGIC;
            result:out STD_LOGIC_VECTOR(15 downto 0)
        );
end shl_sixteen;

architecture dataflow of shl_sixteen is

begin

        result(15 downto 0) <= a(15) & a(15 downto 1);
end dataflow;

