library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity example1 is
    end example1;
architecture behavorial of example1 is
    signal A : integer := 4;
    signal B : integer := 4;
    signal C : integer := 4;
    signal Y : integer := 4;
    signal Z : integer := 4;
begin
    process(A, B, C)
        variable M : integer := 4;
        variable N : integer := 4;
    begin
        M := A;
        N := B;
        Z <= M + N;
        M := C;
        Y <= M + N;
    end process;
end behavorial;

