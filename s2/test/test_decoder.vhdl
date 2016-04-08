library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_decoder is
end test_decoder;

architecture behavorial of test_decoder is

  component DECODER2 is
    port(
      A:in unsigned(1 downto 0);
      Y:out  unsigned(3 downto 0));
  end component;

  signal A: unsigned(1 downto 0);
  signal  Y: unsigned(3 downto 0);
begin
  mapping: DECODER2 port map(A,Y);
    A<="10";
end behavorial;
