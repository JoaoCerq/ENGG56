transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/Project\ 2 {/home/joao-cerqueira/Documents/ENGG56/Project 2/TOP.v}
vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/Project\ 2 {/home/joao-cerqueira/Documents/ENGG56/Project 2/Acumulador.v}
vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/Project\ 2 {/home/joao-cerqueira/Documents/ENGG56/Project 2/FSM.v}

vlog  -work work +incdir+/home/joao-cerqueira/Documents/ENGG56/Project\ 2 {/home/joao-cerqueira/Documents/ENGG56/Project 2/tb_TOP.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_TOP

add wave *
view structure
view signals
run -all
