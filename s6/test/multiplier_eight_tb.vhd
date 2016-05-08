library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier_eight_tb is
    end multiplier_eight_tb;

architecture test_bench of multiplier_eight_tb is
    component multiplier_eight is
        port(A : in STD_LOGIC_VECTOR(15 downto 0);
             B : in STD_LOGIC_VECTOR(15 downto 0);
             res : out STD_LOGIC_VECTOR(15 downto 0)
         );
    end component;
    signal A : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000011";
    signal B : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000010";
    signal res : STD_LOGIC_VECTOR(15 downto 0);
begin
    mapping : multiplier_eight port map(A, B, res);
    A <= "0000000000000010" after 10 ns;

end test_bench;
