library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity array_multiplier_tb is
    end array_multiplier_tb;

architecture test_bench of array_multiplier_tb is
    component array_multiplier is
        port(a : in STD_LOGIC_VECTOR(3 downto 0);
             b : in STD_LOGIC_VECTOR(3 downto 0);
             ans : out STD_LOGIC_VECTOR(7 downto 0)
         );
    end component;

    signal a : STD_LOGIC_VECTOR(3 downto 0);
    signal b : STD_LOGIC_VECTOR(3 downto 0);
    signal ans : STD_LOGIC_VECTOR(7 downto 0);
begin
    mapping : array_multiplier port map (a, b, ans);

    a <= "0010";
    b <= "0010";
end test_bench;
