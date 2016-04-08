library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU8 is port (
    A,B: in unsigned ( 7 downto 0) ;
    addsub: in std_logic ;
    r : out unsigned (7 downto 0);
gt , zero , co : out std_logic);
end entity ALU8;
architecture assigns of alu8 is
    signal mid : unsigned(8 downto 0) ;
begin
    mid <= ('0' & A) + ('0' & B) when addsub = '1' else  ('0' & A) - ('0' & B);
    co <= mid(8);
    r <= mid(7 downto 0 );
    gt<= '1' when a>b else '0';
    zero <= '1' when mid (7 downto 0) = "0000000" else '0';
end assigns;
