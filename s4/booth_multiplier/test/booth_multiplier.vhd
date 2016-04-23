library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity booth_multiplier_tb is
    end booth_multiplier_tb;

architecture test_bench of booth_multiplier_tb is
    component booth_multiplier is
        port(a : in STD_LOGIC_VECTOR(3 downto 0);
             b : in STD_LOGIC_VECTOR(3 downto 0);
             clk : in STD_LOGIC;
             ans : out STD_LOGIC_VECTOR(7 downto 0)
         );
    end component;

    signal a : STD_LOGIC_VECTOR(3 downto 0);
    signal b : STD_LOGIC_VECTOR(3 downto 0);
    signal ans : STD_LOGIC_VECTOR(7 downto 0);
    signal clk : STD_LOGIC;
begin

    mapping : booth_multiplier port map(a, b, clk, ans);
    a <= "0011";
    b <= "0001";

    CLOCK:
    clk <= '1' after 1 ns when clk = '0' else
           '0' after 1 ns when clk = '1';
end test_bench;
