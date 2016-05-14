
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
    result(0) <= data_in;
    result(1) <= a(0);
    result(2) <= a(1);
    result(3) <= a(2);
    result(4) <= a(3);
    result(5) <= a(4);
    result(6) <= a(5);
    result(7) <= a(6);
    result(8) <= a(7);
    result(9) <= a(8);
    result(10) <= a(9);
    result(11) <= a(10);
    result(12) <= a(11);
    result(13) <= a(12);
    result(14) <= a(13);
    result(15) <= a(14);
end dataflow;

