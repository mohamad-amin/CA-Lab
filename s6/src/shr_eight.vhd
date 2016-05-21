LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shr_sixteen is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            data_in : in STD_LOGIC;
            result:out STD_LOGIC_VECTOR(7 downto 0)
        );
end shr_sixteen;

architecture dataflow of shr_sixteen is

begin

    result(0) <= a(1);
    result(1) <= a(2);
    result(2) <= a(3);
    result(3) <= a(4);
    result(4) <= a(5);
    result(5) <= a(6);
    result(6) <= a(7);
    result(7) <= data_in;

end dataflow;

