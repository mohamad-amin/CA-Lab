LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity counter is port (
	clk : in std_logic;
	en : in std_logic;
	data : in std_logic_vector(5 downto 0);
	oup : out std_logic
);
end entity;

architecture rtl of counter is 
	signal data_temp : std_logic_vector(5 downto 0) := (others => '0');
begin
	
	process (en, data_temp)
	begin
		if (en = '1') then
			data_temp <= data;
		else
			data_temp <= std_logic_vector(unsigned(data_temp) - 1);
		end if;

		if (data_temp /= "000000") then

			if (data_temp = "000000") then
				oup <= '1';
			else
				oup <= '0';
			end if;
		end if;
	end process;

end architecture;
