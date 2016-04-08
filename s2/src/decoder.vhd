library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DECODER2 is
    port(
            A: in unsigned(1 downto 0);
            Y: out  unsigned(3 downto 0)
        );
end DECODER2;

architecture RTL2 of DECODER2 is
begin
    with A select
        Y <= "0001" when "00",
             "0010" when "01",
             "0100" when "10",
             "1000" when "11",
             "XXXX" when others;
end RTL2;
