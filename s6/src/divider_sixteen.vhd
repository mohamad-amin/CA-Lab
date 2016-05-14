library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider_sixteen is
    port(
            a : in STD_LOGIC_VECTOR(15 downto 0);
            b : in STD_LOGIC_VECTOR(15 downto 0);
            res : out STD_LOGIC_VECTOR(15 downto 0)
        );
end entity;

architecture behavorial of divider_sixteen is
    signal temp : integer;

begin
    temp <= to_integer(unsigned(a)) / to_integer(unsigned(b));
    res <= STD_LOGIC_VECTOR(to_unsigned(temp, 16));
end behavorial;
