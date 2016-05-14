library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instruction_register is
    port(instruction : in STD_LOGIC_VECTOR(15 downto 0);
         instruction_p1 : out STD_LOGIC_VECTOR(3 downto 0);
         instruction_p2 : out STD_LOGIC_VECTOR(3 downto 0);
         instruction_p3 : out STD_LOGIC_VECTOR(3 downto 0);
         instruction_p4 : out STD_LOGIC_VECTOR(3 downto 0)
     );
end entity;

architecture behavorial of instruction_register is
begin
   instruction_p1 <= instruction(15 downto 12);
   instruction_p2 <= instruction(11 downto 8);
   instruction_p3 <= instruction(7 downto 4);
   instruction_p4 <= instruction(3 downto 0);
end behavorial;
