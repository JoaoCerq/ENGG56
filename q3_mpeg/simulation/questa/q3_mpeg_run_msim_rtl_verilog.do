transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/q3_mpeg {/home/joao-cerqueira/Documents/ENGG56/q3_mpeg/FSM_Control.v}

vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/q3_mpeg {/home/joao-cerqueira/Documents/ENGG56/q3_mpeg/FSM_Control_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  FSM_Control_tb

add wave *
view structure
view signals
run -all
