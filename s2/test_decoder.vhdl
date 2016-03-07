library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity test_bench is
end test_bench;

architecture behavorial of test_bench is

  component DECODER2 is
    port(
      A:in std_logic_vector(1 downto 0);
      Y:out  std_logic_vector(3 downto 0));
  end component;
  
  signal A: std_logic_vector(1 downto 0);
  signal  Y: std_logic_vector(3 downto 0);
begin
  mapping: DECODER2 port map(A,Y);
    A<="10";
end behavorial;