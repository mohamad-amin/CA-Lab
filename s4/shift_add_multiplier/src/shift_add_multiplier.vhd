library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shift_add_multiplier is
    port(a : in STD_LOGIC_VECTOR(3 downto 0);
         b : in STD_LOGIC_VECTOR(3 downto 0);
         clk : in STD_LOGIC;
         ans : out STD_LOGIC_VECTOR(7 downto 0)
     );
end shift_add_multiplier;

architecture dataflow of shift_add_multiplier is
begin
    process(clk)
    begin

    end process;
end dataflow;
