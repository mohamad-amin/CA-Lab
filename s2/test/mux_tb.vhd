library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_mux is
    end test_mux;

architecture behavorial of test_mux is
    component MUX is
        port(
                SEL: in unsigned(1 downto 0);
                DATA: in  unsigned(3 downto 0);
                output: out std_logic
            );
    end component;
    signal SEL:  unsigned(1 downto 0);
    signal   DATA:  unsigned(3 downto 0);
    signal  output: std_logic ;

begin
    mapping: MUX port map(SEL,DATA, output);
    SEL<="11";
    DATA<="0101";
end behavorial;
