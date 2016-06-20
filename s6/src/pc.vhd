library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc is
    port(
            increment : in STD_LOGIC;
            pc_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
end entity;

architecture behavorial of pc is
    signal current_pc : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal temp : integer;
begin
    process(increment)
    begin
        if(increment'event) then
            temp <= to_integer(unsigned(current_pc)) + 1;
            current_pc <= STD_LOGIC_VECTOR(to_unsigned(temp, 4));
        end if;
    end process;
end behavorial;
