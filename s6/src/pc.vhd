library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
    port (
             inPC  : in  std_logic_vector(3 downto 0);
             outPC : out std_logic_vector(3 downto 0);
             clk   : in  std_logic
         );
end pc;

architecture behavorial of PC is

begin
    reg: process(CLK)
    begin
        if rising_edge(CLK) then
            outPC <= inPC;
        end if;
    end process;
end behavorial;
