library IEEE;
use ieee.std_logic_1164.all;

entity test_bench is
end test_bench;

architecture tb of test_bench is
  
  component full_adder is 
    port( A, B, Cin :in std_logic;
      sum ,Cout :out std_logic);
    end component;
    
    signal A,B,Cin,sum,Cout :std_logic;
    
    begin
      mapping: full_adder port map(A=>A, B=>B, Cin=>Cin, sum=>sum, cout=>cout);
        
        A<='1';
        B<='1';
        Cin<='0' after 0ns, '1' after 20ns;
      
      end tb;