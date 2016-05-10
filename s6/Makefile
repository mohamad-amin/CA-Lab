#
#VHDL files
SRCDIR = src
FILES = $(SRCDIR)/multiplier_eight.vhd $(SRCDIR)/half_adder.vhd $(SRCDIR)/full_adder.vhd \
$(SRCDIR)/multiplier_four.vhd $(SRCDIR)/ripple_sixteen_adder.vhd

# Testbench
TESTDIR = test
TESTFILES = $(TESTDIR)/multiplier_eight_tb.vhd
SUFFIX = _out# Suffix of files created using -e option
MODULE = multiplier_eight_tb# Show wave of this module
STOPTIME = 3500ns

# Run
RUN_FLAGS = --stop-time=$(STOPTIME) --vcd=$(MODULE).vcd

# GHDL command
GHDL_CMD = ghdl
GHDL_FLAGS = -fexplicit --ieee=synopsys

all: | ghdl-compile ghdl-simulate show

ghdl-compile: $(FILES) $(TESTFILES)
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES) $(TESTFILES)
clean:
	rm *.o work-obj93.cf *.vcd *$(SUFFIX)
ghdl-simulate:
	$(GHDL_CMD) -e -o $(MODULE)$(SUFFIX) $(MODULE)
show:
	$(GHDL_CMD) -r $(MODULE)$(SUFFIX) $(RUN_FLAGS)
	gtkwave $(MODULE).vcd
