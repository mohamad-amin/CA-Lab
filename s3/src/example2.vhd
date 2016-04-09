library IEEE;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity example1 is
    end example1;
architecture behavorial of example1 is
    signal A, B, C, Y, Z : integer;
    signal M, N : integer;
begin
    process(A, B, C)
    begin
        M <= A;
        N <= B;
        Z <= M + N;
        M <= C;
        Y <= M + N;
    end process;
end behavorial;


