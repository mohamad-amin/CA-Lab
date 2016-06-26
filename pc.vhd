library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
    port (
			reset : in std_logic;
             inPC  : in  std_logic_vector(15 downto 0);
             outPC : out std_logic_vector(15 downto 0);
             clk   : in  std_logic
         );
end pc;
architecture behavorial of PC is
	signal Q : std_logic_vector(15 downto 0) := "0000000000000000";

begin

    reg: process(CLK,reset)
    begin
		if reset = '1' then
			outPC <= "0000000000000000";
		end if;
        if rising_edge(CLK) then
            outPC <= inPC;
        end if;
    end process;
end behavorial;
