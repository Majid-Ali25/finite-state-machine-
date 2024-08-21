
vlib work
vlog FSM_Binary.sv
vlog FSM_OneHot.sv
vlog FSM_OneHot_Reversed.sv

vlog FSM_Testbench.sv

# Start simulation
vsim FSM_Testbench

# Run simulation for 200ns
run 200ns