#!/bin/tcsh

###################################################################################################
## Create QuestaSim design and library
###################################################################################################
vlib LibTop
vmap -quiet work /filespace/p/pthirugnanas/pittu_main/Spring2024/ECE755/MS_3/LibTop
#echo "[ Info] Compiling Netlist and Testbench ..."

###################################################################################################
## Compile Verilog source and testbench
###################################################################################################
## Syntax
##vlog -suppress vlog-2583 -sv +acc -nologo -quiet -work work \
## \
##<list-of-source-files> \
## <list-of-source-files> \

# ./rtl/top.sv ./rtl/mlp.sv ./rtl/neuron4.sv \
vlog -suppress vlog-2583 -sv +acc -nologo -quiet -work work \
    ./outputs/top.vg \
    ./top_tb_v1.sv \
    ./asap7sc7p5t_28/Verilog/*.v

###################################################################################################
## Optimize design
###################################################################################################
#echo "[ Info] Elaborating Design ..."
# Syntax
vopt -quiet -suppress vopt-143 -work work -check_synthesis -o top_opt top
#vopt -quiet -suppress vopt-143 -work work -check_synthesis -o mlp_opt top 

###################################################################################################
## Run simulation
###################################################################################################
#echo "[ Info] Starting Simulation ..."
## Syntax
## vsim $1 -lib ./LibTop <name_of_testbench_module> -t ps -do ./run.do -sv_seed 10
vsim -lib ./LibTop tb_top_v1 -t ps -do ./run.do -sv_seed 10
