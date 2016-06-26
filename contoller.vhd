library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is
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
		Jump : out STD_LOGIC
    );
end entity;

architecture behavrial of controller is
begin
    process(clk)
    begin
		jump<='0';
		branch<='0';
        if(op_code = "0000") then --add
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="1000";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "0001") then --sub
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="1001";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "0010") then --and
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="0000";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "0011") then --or
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="0001";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "0100") then --MUL
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="0110";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "0101") then --DIV
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="1010";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "0110") then --XOR
            RegDst <= '1';
			RegWrite <='1';
			AluSrc <= '0';
			AluOP<="0010";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "1101") then --load
            RegDst <= '0';
			RegWrite <='1';
			AluSrc <= '1';
			AluOP<="1000";
			MemWrite<='0';
			MemRead<='1';
			MemToReg<='1';
			pcsrc<= '0';
        end if;
		if(op_code = "1110") then --store
            RegDst <= '0';
			RegWrite <='0';
			AluSrc <= '1';
			AluOP<="1000";
			MemWrite<='1';
			MemRead<='0';
			MemToReg<='0';
			pcsrc<= '0';
        end if;
		if(op_code = "1100") then --beq
            RegDst <= '0';
			RegWrite <='0';
			AluSrc <= '0';
			AluOP<="1001";
			MemWrite<='0';
			MemRead<='0';
			MemToReg<='0';			
			pcsrc<= '1';
        end if;
    end process;
end behavrial;
