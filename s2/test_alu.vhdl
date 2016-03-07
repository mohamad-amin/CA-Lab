library IEEE;
use ieee.std_logic_1164.all;

entity test_bench is
end test_bench;

architecture tb of test_bench is
  
component ALU8 is port (
A,B: in std_logic_vector ( 7 downto 0) ;
addsub: in std_logic ;
r : out std_logic_vector (7 downto 0);
gt , zero , co : out std_logic);
end component;
    
   signal A,B: std_logic_vector ( 7 downto 0) ;
signal addsub: std_logic ;
signal r : std_logic_vector (7 downto 0);
signal gt , zero , co : std_logic;
    
    begin
      mapping :ALU8 port map(A,B,addsub,r,gt,zero,co);
        A<="00000000";
        B<="00000001";
        addsub<='0';
        
      end tb;