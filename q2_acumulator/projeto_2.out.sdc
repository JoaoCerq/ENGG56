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

## DATE    "Mon Jan  5 19:32:42 2026"

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

create_clock -name {clock} -period 10.000 -waveform { 0.000 5.000 } [get_ports {Clock}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clock}] -rise_to [get_clocks {clock}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock}] -fall_to [get_clocks {clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock}] -rise_to [get_clocks {clock}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock}] -fall_to [get_clocks {clock}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Clock}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[0]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[1]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[2]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[3]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[4]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[5]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[6]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[7]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[8]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[9]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[10]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[11]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[12]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[13]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[14]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataOut[15]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Reset}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Address[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Address[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Address[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Address[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Address[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[8]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[9]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[10]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[11]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[12]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[13]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[14]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {DataIN[15]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {ReadEnable}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {Ready}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  1.000 [get_ports {WriteEnable}]


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

