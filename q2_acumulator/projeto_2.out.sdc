## Generated SDC file "projeto_2.out.sdc"

## Copyright (C) 2025  Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Altera and sold by Altera or its authorized distributors.  Please
## refer to the Altera Software License Subscription Agreements 
## on the Quartus Prime software download page.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"

## DATE    "Mon Jan  5 18:30:22 2026"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {Clock} -period 10.000 -waveform { 0.000 0.500 } [get_ports { Clock }]
create_clock -name {FSM:InstFSM|current_state.ADD} -period 1.000 -waveform { 0.000 0.500 } [get_registers {FSM:InstFSM|current_state.ADD}]
create_clock -name {FSM:InstFSM|current_state.LOAD} -period 1.000 -waveform { 0.000 0.500 } [get_registers {FSM:InstFSM|current_state.LOAD}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -rise_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -fall_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -rise_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -fall_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -rise_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -fall_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -rise_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.LOAD}] -fall_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.ADD}] -rise_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.ADD}] -fall_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.ADD}] -rise_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {FSM:InstFSM|current_state.ADD}] -fall_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.ADD}] -rise_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.ADD}] -fall_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.ADD}] -rise_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {FSM:InstFSM|current_state.ADD}] -fall_to [get_clocks {Clock}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -rise_to [get_clocks {FSM:InstFSM|current_state.LOAD}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -fall_to [get_clocks {FSM:InstFSM|current_state.LOAD}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -rise_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -fall_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -rise_to [get_clocks {Clock}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -fall_to [get_clocks {Clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -rise_to [get_clocks {FSM:InstFSM|current_state.LOAD}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -fall_to [get_clocks {FSM:InstFSM|current_state.LOAD}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -rise_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -fall_to [get_clocks {FSM:InstFSM|current_state.ADD}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -rise_to [get_clocks {Clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -fall_to [get_clocks {Clock}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

