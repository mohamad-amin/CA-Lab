library ieee;
use ieee.std_logic_1164.all;

ENTITY TestBench is
END TestBench;

ARCHITECTURE TestBench_MIPS of TestBench is

	component MIPS
		port (
			CLK     : in  std_logic);
	end component;

	signal CLK: std_logic;
	signal Rst: std_logic;
	signal outMIPS: std_logic_vector(31 downto 0);

BEGIN

	UUT:  MIPS
		port map (CLK);

	clock: process
		variable clktmp : std_logic:='1';
	begin
		clktmp:= NOT clktmp;
		CLK <= clktmp;
		wait for 50 ns;   
    end process;
--
END TestBench_MIPS;