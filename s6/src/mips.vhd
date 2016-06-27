library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mips is
    port(
            clk : in STD_LOGIC
        );
    end entity;

architecture dataflow of mips is
    component datapath is
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
            opcode : out STD_LOGIC_VECTOR(3 downto 0);
            jump : STD_LOGIC;
			IType : in std_logic
        );
	end component;
    component controller is
    port(
        op_code : in STD_LOGIC_VECTOR(3 downto 0);
        clk : in STD_LOGIC;
		aluOP : out STD_LOGIC_VECTOR (3 downto 0);
		RegDst : out STD_LOGIC;
		RegWrite : out STD_LOGIC;
		AluSrc : out STD_LOGIC;
		MemWrite : out STD_LOGIC;
		MemToReg : out STD_LOGIC;
		MemRead : out STD_LOGIC;
		pcsrc : out STD_LOGIC;
		Branch : out STD_LOGIC;
		Jump : out STD_LOGIC;
		IType : out std_logic
    );
end component;

    signal alu_opcode : STD_LOGIC_VECTOR(3 downto 0);
    signal opcode : STD_LOGIC_VECTOR(3 downto 0);
    signal branch : STD_LOGIC;
    signal reg_dest : STD_LOGIC; --RegDst
    signal reg_write : STD_LOGIC; --RegWrite
    signal alu_src : STD_LOGIC; --ALUOp
    signal mem_write : STD_LOGIC; --MemWrite
    signal mem_reg : STD_LOGIC; --MemToReg
    signal mem_read : STD_LOGIC; --MemRead
    signal pc_src : STD_LOGIC; --PCSrc
    signal jump : STD_LOGIC;
	signal IType : std_logic;


begin
    controller_instance : controller port map(opcode, clk, alu_opcode, reg_dest, reg_write, alu_src, mem_write, mem_reg, mem_read,pc_src, branch, jump,IType);
    datapath_instance : datapath port map(alu_opcode, branch, reg_dest, reg_write, alu_src, mem_reg, mem_read, mem_write, pc_src, clk, opcode, jump,IType);
end dataflow;
