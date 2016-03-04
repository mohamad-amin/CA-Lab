LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity bit4Adder is
  port (A,B:in STD_LOGIC_VECTOR(3 downto 0);
    sum:out STD_LOGIC_VECTOR(3 downto 0);
    cin:in STD_LOGIC;
    cout:out STD_LOGIC);
  end bit4Adder;
  
  
  architecture gate of bit4Adder is
   component full_adder is 
    port( A, B, Cin :in std_logic;
      sum ,Cout :out std_logic);
    end component;
  
  signal cout1,cout2,cout3,cout4 :STD_LOGIC;
     begin
    
      FA1: full_adder port map(A=>A(0), B=>B(0), Cin=>Cin, sum=>sum(0), cout=>cout1);
      FA2: full_adder port map(A=>A(1), B=>B(1), Cin=>cout1, sum=>sum(1), cout=>cout2);
      FA3: full_adder port map(A=>A(2), B=>B(2), Cin=>cout2, sum=>sum(2), cout=>cout3);
      FA4: full_adder port map(A=>A(3), B=>B(3), Cin=>cout3, sum=>sum(3), cout=>cout);
      
      end gate; 
    