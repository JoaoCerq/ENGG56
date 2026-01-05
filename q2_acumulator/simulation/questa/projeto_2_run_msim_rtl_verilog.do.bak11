transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/q2_acumulator {/home/joao-cerqueira/Documents/ENGG56/q2_acumulator/TOP.v}
vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/q2_acumulator {/home/joao-cerqueira/Documents/ENGG56/q2_acumulator/Acumulador.v}
vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/q2_acumulator {/home/joao-cerqueira/Documents/ENGG56/q2_acumulator/FSM.v}

vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/q2_acumulator {/home/joao-cerqueira/Documents/ENGG56/q2_acumulator/tb_TOP.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_TOP

add wave *
view structure
view signals
run -all
