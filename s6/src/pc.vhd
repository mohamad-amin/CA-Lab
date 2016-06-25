library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY PC IS
	port (
		inPC  : in  std_logic_vector(3 downto 0);
		outPC : out std_logic_vector(3 downto 0);
		CLK   : in  std_logic;
		Rst   : in  std_logic);
END PC;

ARCHITECTURE behavorial of PC is

BEGIN
 	reg: process(CLK)
	begin
		if (Rst='1') then
			outPC <= std_logic_vector(to_signed(0,4));
		end if;
		if rising_edge(CLK) then
			outPC <= inPC;
		end if;
	end process;
END behavorial;
