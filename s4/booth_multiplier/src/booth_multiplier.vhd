library IEEE;
use IEEE.math_real.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity booth_multiplier is
    port(a : in STD_LOGIC_VECTOR(3 downto 0);
         b : in STD_LOGIC_VECTOR(3 downto 0);
         clk : in STD_LOGIC;
         ans : out STD_LOGIC_VECTOR(7 downto 0)
     );
end booth_multiplier;

architecture dataflow of booth_multiplier is
begin
    process(clk)
        variable i : integer := 0;
        variable started : integer := 0;
        variable add : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
        variable minus : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
        variable res : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    begin

        started := 0;
        add := (others => '0');
        minus := (others => '0');
        res := (others => '0');

        if(b(0) = '1') then
            started := 1;
            minus(0) := '1';
        end if;

        while (i < 3) loop

            if((b(i) = '0' and b(i + 1) = '1')) then
                started := 1;
                minus(i+1) := '1';
            end if;

            if((b(i) = '1' and b(i + 1) = '0')) then
                started := 0;
                add(i+1) := '1';
            end if;
            i := i + 1;

        end loop;

        if(b(3) = '1') then
            started := 0;
            add(3) := '1';
        end if;

        i := 0;

        while (i < 4) loop
            if(add(i) = '1') then
                res := std_logic_vector(unsigned(res) + unsigned(a) * 2 ** i);
            end if;
            i := i + 1;
        end loop;

        i := 0;

        while (i < 4) loop
            if(minus(i) = '1') then
                res := std_logic_vector(unsigned(res) - unsigned(a) * 2 ** i);
            end if;
            i := i + 1;
        end loop;

        ans <= res;

    end process;
end dataflow;
