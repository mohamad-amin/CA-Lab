library IEEE;
use ieee.std_logic_1164.all;

entity test_full_adder is
end test_full_adder;

architecture test_bench of test_full_adder is

  component full_adder is
    port( A, B, Cin :in std_logic;
      sum ,Cout :out std_logic);
    end component;

    signal A,B,Cin,sum,Cout :std_logic;

    begin
      mapping: full_adder port map(A=>A, B=>B, Cin=>Cin, sum=>sum, cout=>cout);

        A<='1';
        B<='1';
        Cin<='0' ;
      end test_bench;
