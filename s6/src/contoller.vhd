library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is
    port(
        op_code : in STD_LOGIC_VECTOR(3 downto 0);
        clk : in STD_LOGIC;
        a_alu : out STD_LOGIC_VECTOR(15 downto 0);
        b_alu : out STD_LOGIC_VECTOR(15 downto 0);
        command_alu : out STD_LOGIC_VECTOR(3 downto 0);
        memory_write_addr : out STD_LOGIC;
        memory_read_addr : out STD_LOGIC;
        reg_read_addr_1 : out STD_LOGIC_VECTOR(3 downto 0);
        reg_read_addr_3 : out STD_LOGIC_VECTOR(3 downto 0);
        pc_increment : out STD_LOGIC;
        register_write_addr : out STD_LOGIC;
        register_write_data : out STD_LOGIC
    );
end entity;

architecture behavrial of controller is
begin
    process(clk)
    begin
        if(op_code = "0000") then
            end if;
    end process;
end behavrial;
