library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_sixteen is
    port(A : in STD_LOGIC_VECTOR(15 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
    s :in STD_LOGIC;
	O : out STD_LOGIC_VECTOR(15 downto 0));
end mux_sixteen;

architecture gate_level of mux_sixteen is
begin
		O <= A when s = '0' else 
		B when s = '1';

end gate_level;
