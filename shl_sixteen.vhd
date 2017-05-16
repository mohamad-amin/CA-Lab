
LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shl_sixteen is
    port(
            a : in STD_LOGIC_VECTOR(15 downto 0);
            data_in : in STD_LOGIC_VECTOR(5 downto 0);
            result:out STD_LOGIC_VECTOR(15 downto 0)
        );
end shl_sixteen;

architecture dataflow of shl_sixteen is

	component counter is port (
	clk : in std_logic;
	en : in std_logic;
	data : in std_logic_vector(5 downto 0);
	oup : out std_logic);
	end component;

begin
	
	


end dataflow;

