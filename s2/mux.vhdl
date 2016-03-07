library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MUX is
    port(
      SEL: in std_logic_vector(1 downto 0);
      DATA: in  std_logic_vector(3 downto 0);
      output: out std_logic
    );
  end MUX;
  
  architecture gate_level of MUX is 
  begin
    output <= DATA(0) when SEL = "00" else
    DATA(1) when SEL = "01" else
    DATA(2) when SEL = "10" else
    DATA(3) when SEL = "11" else
    'X';
 ---   with SEL select 
  ---  output <= DATA(0) when "00",
  ---   DATA(1) when "01",
  ---   DATA(2) when "10",
  ---   DATA(3) when "11",
  ---  'X' when others;
  end gate_level;
  