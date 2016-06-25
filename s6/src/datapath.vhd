library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity datapath is
    port(
            alu_opcode : in STD_LOGIC_VECTOR(3 downto 0);
            branch : in STD_LOGIC;
            reg_dest : in STD_LOGIC; --RegDst
            reg_write : in STD_LOGIC; --RegWrite
            alu_src : in STD_LOGIC; --ALUOp
            mem_write : in STD_LOGIC; --MemWrite
            mem_reg : in STD_LOGIC; --MemToReg
            mem_read : in STD_LOGIC; --MemRead
            pc_src : in STD_LOGIC; --PCSrc
            clk : in STD_LOGIC;
            address : in STD_LOGIC_VECTOR(3 downto 0);
            opcode : out STD_LOGIC_VECTOR(3 downto 0)
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

    component instruction_register is
        port(instruction : in STD_LOGIC_VECTOR(15 downto 0);
             instruction_p1 : out STD_LOGIC_VECTOR(3 downto 0);
             instruction_p2 : out STD_LOGIC_VECTOR(3 downto 0);
             instruction_p3 : out STD_LOGIC_VECTOR(3 downto 0);
             instruction_p4 : out STD_LOGIC_VECTOR(3 downto 0)
         );
    end component;
    component signed_extend is
        port(
                a : in STD_LOGIC_VECTOR(7 downto 0);
                extended : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component pc is
    port (
             inPC  : in  std_logic_vector(3 downto 0);
             outPC : out std_logic_vector(3 downto 0);
             clk   : in  std_logic
         );
    end component;


    signal pc_signal : STD_LOGIC_VECTOR(3 downto 0);
    signal instruction : STD_LOGIC_VECTOR(15 downto 0);
    signal data_memory_readdata: STD_LOGIC_VECTOR(15 downto 0);
    signal alu_operand_1:STD_LOGIC_VECTOR(15 downto 0);
    signal alu_operand_2:STD_LOGIC_VECTOR(15 downto 0);
    signal alu_out : STD_LOGIC_VECTOR(15 downto 0);
    signal rs1 : STD_LOGIC_VECTOR(3 downto 0);
    signal rs2 : STD_LOGIC_VECTOR(3 downto 0);
    signal load_address : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_3 : STD_LOGIC_VECTOR(15 downto 0);
    signal instruction_p1 : STD_LOGIC_VECTOR(15 downto 12);
    signal instruction_p2 : STD_LOGIC_VECTOR(11 downto 8);
    signal instruction_p3 : STD_LOGIC_VECTOR(7 downto 4);
    signal instruction_p4 : STD_LOGIC_VECTOR(3 downto 0);
    signal instruction_p3_p4 : STD_LOGIC_VECTOR(7 downto 0);
    signal extended : STD_LOGIC_VECTOR(15 downto 0);
    signal a_register_file, b_register_file : STD_LOGIC_VECTOR(15 downto 0);
    signal pc_plus_4 : STD_LOGIC_VECTOR(3 downto 0);
    signal pc_plus_4_tmp : integer;
    signal shifted_extended : STD_LOGIC_VECTOR(15 downto 0);
    signal extended_plus_pc : STD_LOGIC_VECTOR(15 downto 0);
    signal extended_plus_pc_tmp : integer;
    signal pc_in : STD_LOGIC_VECTOR(3 downto 0);
begin
    instruction_mem : instruction_memory port map(clk, pc_signal, instruction);
    data_mem : data_memory port map(clk, alu_out, alu_out,
        data_memory_readdata, mem_write, mem_read);
    alu_instance : alu port map(alu_opcode, alu_operand_1, alu_operand_2, alu_out);
    register_file_instance : register_file port map(rs1, rs2, load_address, mux_3, reg_write, a_register_file, b_register_file);
    instruction_splitter : instruction_register port map(instruction, instruction_p1, instruction_p2, instruction_p3, instruction_p4);
    signed_extend_instance : signed_extend port map(instruction_p3_p4, extended);
    program_counter : pc port map(pc_signal);

    -- signal assignments
    alu_operand_2 <= b_register_file when alu_src = '0' else
                     extended when alu_src = '1';
    alu_operand_1 <= a_register_file;

    opcode <= instruction_p1;

    rs1 <= instruction_p2;
    rs2 <= instruction_p3;

    load_address <=
    pc_plus_4_tmp <= to_integer(unsigned(pc_signal)) + 2;
    pc_plus_4 <= std_logic_vector(to_unsigned(pc_plus_4_tmp, 4));

    instruction_p3_p4 <= instruction_p3 & instruction_p4;
    shifted_extended <= extended(15 downto 1) & '0';

    extended_plus_pc_tmp <= to_integer(unsigned(pc_signal)) + to_integer(unsigned(shifted_extended));
    extended_plus_pc <= std_logic_vector(to_unsigned(extended_plus_pc_tmp,16));

    mux_3 <= alu_out when mem_reg = '0' else
             data_memory_readdata when mem_reg = '1';
    pc_in <= extended_plus_pc when pc_src = '1' else
             pc_plus_4;
end behavorial;
