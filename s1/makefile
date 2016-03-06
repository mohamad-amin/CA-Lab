complie_simulate: four_bit_adder.vhd half_adder.vhd full_adder.vhdl test_4_bit_adder.vhdl
	ghdl -a -fexplicit --ieee=synopsys four_bit_adder.vhd half_adder.vhd full_adder.vhdl test_4_bit_adder.vhdl
	ghdl -e test_4_bit_adder
	ghdl -r test_4_bit_adder --vcd=test_4_bit_adder.vcd
