## Generated SDC file "q1_infravermelho.out.sdc"

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

## DATE    "Tue Dec 30 11:38:52 2025"

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

create_clock -name {Clock} -period 10.000 -waveform { 0.000 5.000 } [get_ports {Clock}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {Clock}] -rise_to [get_clocks {Clock}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {Clock}] -fall_to [get_clocks {Clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -rise_to [get_clocks {Clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Clock}] -fall_to [get_clocks {Clock}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Clock}]
set_input_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Reset}]
set_input_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Serial}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Ready}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clock}]  1.000 [get_ports {Tecla[7]}]


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

