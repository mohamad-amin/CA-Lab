library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity signed_extend is
    port(
            a : in STD_LOGIC_VECTOR(3 downto 0);
            extended : out STD_LOGIC_VECTOR(15 downto 0)
        );
end entity;

architecture behavorial of signed_extend is
begin
    extended <= "11111111111" & a when a(3) = '1' else
                "00000000000" & a when a(3) = '0';
end behavorial;
