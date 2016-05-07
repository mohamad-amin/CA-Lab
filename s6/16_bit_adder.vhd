LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity ripple_sixteen_adder is
    port (A,B:in STD_LOGIC_VECTOR(15 downto 0);
          sum:out STD_LOGIC_VECTOR(15 downto 0);
          cin:in STD_LOGIC;
          cout:out STD_LOGIC;
          command:in STD_LOGIC);
end ripple_sixteen_adder;


architecture gate_level_implementation of ripple_sixteen_adder is
    component full_adder is
        port( A, B, Cin :in std_logic;
        sum ,Cout :out std_logic);
    end component;

    signal cout_mid : STD_LOGIC_VECTOR(15 downto 0);
begin
    FA1: full_adder port map(A=>A(0), B=>B(0), Cin=>Cin, sum=>sum(0), cout=>cout_mid(0));
      
    GEN_REG: 
   for I in 1 to 15 generate
      FA : full_adder port map(A=>A(I), B=>B(I), Cin=>cout_mid(I-1), sum=>sum(I), cout=>cout_mid(I));
   end generate GEN_REG;  
      
      
end gate_level_implementation;
