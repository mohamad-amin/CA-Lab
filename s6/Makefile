#
#VHDL files
SRCDIR = src
FILES = $(SRCDIR)/alu.vhd $(SRCDIR)/and_sixteen.vhd $(SRCDIR)/contoller.vhd \
		$(SRCDIR)/data_memory.vhd $(SRCDIR)/datapath.vhd $(SRCDIR)/divider_sixteen.vhd \
		$(SRCDIR)/full_adder.vhd $(SRCDIR)/half_adder.vhd $(SRCDIR)/instruction_memory.vhd \
		$(SRCDIR)/instruction_register.vhd $(SRCDIR)/memory_data_register.vhd \
		$(SRCDIR)/mips.vhd $(SRCDIR)/multiplier_eight.vhd $(SRCDIR)/multiplier_four.vhd \
		$(SRCDIR)/mux_sixteen.vhd $(SRCDIR)/or_sixteen.vhd $(SRCDIR)/pc.vhd $(SRCDIR)/ram.vhd \
		$(SRCDIR)/register_file.vhd $(SRCDIR)/ripple_sixteen_adder.vhd $(SRCDIR)/shl_sixteen.vhd \
		$(SRCDIR)/shr_sixteen.vhd $(SRCDIR)/signed_extend.vhd $(SRCDIR)/xnor_sixteen.vhd \
		$(SRCDIR)/xor_sixteen.vhd


# Testbench
TESTDIR = test
TESTFILES = $(TESTDIR)/alu_tb.vhd
SUFFIX = _out# Suffix of files created using -e option
MODULE = mips# Show wave of this module
STOPTIME = 3500ns

# Run
RUN_FLAGS = --stop-time=$(STOPTIME) --vcd=$(MODULE).vcd

# GHDL command
GHDL_CMD = ghdl
GHDL_FLAGS = -fexplicit --ieee=synopsys

all: | ghdl-compile ghdl-simulate

ghdl-compile: $(FILES) $(TESTFILES)
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES) $(TESTFILES)
clean:
	rm *.o work-obj93.cf *.vcd *$(SUFFIX)
ghdl-simulate:
	$(GHDL_CMD) -e -o $(MODULE)$(SUFFIX) $(MODULE)
show:
	$(GHDL_CMD) -r $(MODULE)$(SUFFIX) $(RUN_FLAGS)
	gtkwave $(MODULE).vcd
