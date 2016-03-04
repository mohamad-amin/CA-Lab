library IEEE;
use ieee.std_logic_1164.all;

entity test_bench2 is
end test_bench2;

architecture tb2 of test_bench2 is
  
  component bit4Adder is 
   port (A,B:in STD_LOGIC_VECTOR(3 downto 0);
    sum:out STD_LOGIC_VECTOR(3 downto 0);
    cin:in STD_LOGIC;
    cout:out STD_LOGIC);
   end component;
    
    signal A,B: STD_LOGIC_VECTOR(3 downto 0);
    signal sum: STD_LOGIC_VECTOR(3 downto 0);
    signal cin,cout: STD_LOGIC;
    
    begin
      mapping: bit4Adder port map(A=>A, B=>B, Cin=>Cin, sum=>sum, cout=>cout);
        
        A(0)<='1';
        A(1)<='0';
        A(2)<='0';
        A(3)<='0';
        B(0)<='0';
        B(1)<='0';
        B(2)<='0';
        B(3)<='0';
        Cin<='0' after 0ns, '1' after 20ns;
      
      end tb2;
