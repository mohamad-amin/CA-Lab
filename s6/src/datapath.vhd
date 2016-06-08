library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity datapath is
    port(
            alu_opcode : in STD_LOGIC_VECTOR(3 downto 0);
            branch : in STD_LOGIC;
            reg_dest : in STD_LOGIC;
            reg_write : in STD_LOGIC;
            alu_src : in STD_LOGIC;
            mem_write : in STD_LOGIC;
            mem_reg : in STD_LOGIC;
            mem_read : in STD_LOGIC;
            clk : in STD_LOGIC;
            address : in STD_LOGIC_VECTOR(3 downto 0)
        );
end entity;

architecture behavorial of datapath is
    component instruction_memory is
        port(clk : in STD_LOGIC;
             address:in STD_LOGIC_VECTOR(3 downto 0);
             data_out:out STD_LOGIC_VECTOR(15 downto 0)
         );
    end component;
    component data_memory is
        port(clk:in STD_LOGIC;
             address:in STD_LOGIC_VECTOR(3 downto 0);
             data_in:in STD_LOGIC_VECTOR(15 downto 0);
             read_data:out STD_LOGIC_VECTOR(15 downto 0);
             mem_write:in STD_LOGIC;
             mem_read:in STD_LOGIC;
             data_ready:out STD_LOGIC);
    end  component;
    component alu is
        port(
                command : in STD_LOGIC_VECTOR(3 downto 0);
                a : in STD_LOGIC_VECTOR(15 downto 0);
                b : in STD_LOGIC_VECTOR(15 downto 0);
                res : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component register_file is
    port(
            rs1 : in STD_LOGIC_VECTOR(3 downto 0);
            rs2 : in STD_LOGIC_VECTOR(3 downto 0);
            load_address : in STD_LOGIC_VECTOR(3 downto 0);
            write_data : in STD_LOGIC_VECTOR(15 downto 0);
            write : in STD_LOGIC;
            A : out STD_LOGIC_VECTOR(15 downto 0);
            B : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal pc : STD_LOGIC_VECTOR(3 downto 0);
    signal instruction : STD_LOGIC_VECTOR(15 downto 0);
    signal reg_read: STD_LOGIC_VECTOR(15 downto 0);
    signal data_memory_readdata: STD_LOGIC_VECTOR(15 downto 0);
    signal alu_operand_1:STD_LOGIC_VECTOR(15 downto 0);
    signal alu_operand_2:STD_LOGIC_VECTOR(15 downto 0);
    signal alu_out : STD_LOGIC_VECTOR(15 downto 0);
    signal rs1 : STD_LOGIC_VECTOR(3 downto 0);
    signal rs2 : STD_LOGIC_VECTOR(3 downto 0);
    signal load_address : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_3 : STD_LOGIC_VECTOR(15 downto 0);
begin
    instruction_mem : instruction_memory port map(clk, address, instruction);
    data_mem : data_memory port map(clk,address,reg_read,data_memory_readdata,mem_write,mem_read);
    alu_instance : alu port map(alu_opcode, alu_operand_1, alu_operand_2, alu_out);
    register_file_instance : register_file port map(rs1, rs2, load_address, mux_3, reg_write);
end behavorial;
