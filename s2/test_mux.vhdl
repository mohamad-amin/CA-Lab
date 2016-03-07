library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity test_bench_mux is
end test_bench_mux;

architecture behavorial of test_bench_mux is
component MUX is
    port(
      SEL: in std_logic_vector(1 downto 0);
      DATA: in  std_logic_vector(3 downto 0);
      output: out std_logic
    );
  end component;
  signal SEL: std_logic_vector(1 downto 0);
   signal   DATA:  std_logic_vector(3 downto 0);
    signal  output: std_logic ;

begin
  mapping: MUX port map(SEL,DATA, output);
    SEL<="11";
    DATA<="0101";
end behavorial;