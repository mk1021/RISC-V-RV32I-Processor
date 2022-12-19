#!/bin/sh

set -eu

# cleanup
rm -rf obj_dir
rm -f top.vcd

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace ALU.sv ALUsrc.sv controlunit.sv datamem.sv instrmem.sv pc.sv regfile.sv signextend.sv top.sv --exe top_tb.cpp

# build C++ project via make automatically generated by Verilator 
make -j -C obj_dir/ -f VALU.mk VALU

# run executable simulation file
obj_dir/VALU