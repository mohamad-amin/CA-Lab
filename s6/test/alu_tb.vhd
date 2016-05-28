library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
    end entity;

architecture test_bench of alu_tb is
    component alu is
        port(
                command : in STD_LOGIC_VECTOR(3 downto 0);
                a : in STD_LOGIC_VECTOR(15 downto 0);
                b : in STD_LOGIC_VECTOR(15 downto 0);
                res : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;

    signal a, b, res: STD_LOGIC_VECTOR(15 downto 0);
    signal command : STD_LOGIC_VECTOR(3 downto 0);
begin
    mapping : alu port map(command, a, b, res);
    a <= "1010100010101011";
    b <= "0000000000000001";
    command <= "0000", "0001" after 1 ns, "0010" after 2 ns;

end test_bench;
