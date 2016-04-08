library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUX is
    port(
            SEL: in unsigned(1 downto 0);
            DATA: in  unsigned(3 downto 0);
            output: out std_logic
        );
end MUX;

architecture gate_level of MUX is
begin
    output <= DATA(0) when SEL = "00" else
              DATA(1) when SEL = "01" else
              DATA(2) when SEL = "10" else
              DATA(3) when SEL = "11" else
              'X';
end gate_level;
