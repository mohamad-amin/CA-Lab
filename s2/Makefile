compile_and_simulate: alu.vhd decoder.vhd four_bit_adder.vhd half_adder.vhd mux.vhdl test_alu.vhdl test_decoder.vhdl test_mux.vhdl
	ghdl -a -fexplicit --ieee=mentor alu.vhd decoder.vhd four_bit_adder.vhd half_adder.vhd mux.vhdl test_alu.vhdl test_decoder.vhdl test_mux.vhdl
	ghdl -e test_alu_out test_alu
	ghdl -r test_alu --vcd=test_alu.vcd

clean:
	rm *.o work-obj93.cf
