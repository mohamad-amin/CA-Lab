library IEEE;
use ieee.std_logic_1164.all;

entity test_4_bit_adder is
end test_4_bit_adder;

architecture test_bench of test_4_bit_adder is

  component four_bit_adder is
   port (A,B:in STD_LOGIC_VECTOR(3 downto 0);
    sum:out STD_LOGIC_VECTOR(3 downto 0);
    cin:in STD_LOGIC;
    cout:out STD_LOGIC);
   end component;

    signal A,B: STD_LOGIC_VECTOR(3 downto 0);
    signal sum: STD_LOGIC_VECTOR(3 downto 0);
    signal cin,cout: STD_LOGIC;

    begin
      mapping: four_bit_adder port map(A=>A, B=>B, Cin=>Cin, sum=>sum, cout=>cout);

        A(0)<='1';
        A(1)<='0';
        A(2)<='0';
        A(3)<='0';
        B(0)<='0';
        B(1)<='0';
        B(2)<='0';
        B(3)<='0';
        Cin<='0' after 0 ns, '1' after 20 ns;

      end test_bench;
