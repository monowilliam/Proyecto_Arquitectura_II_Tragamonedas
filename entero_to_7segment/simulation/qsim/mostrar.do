onerror {quit -f}
vlib work
vlog -work work mostrar.vo
vlog -work work mostrar.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mostrar_vlg_vec_tst
vcd file -direction mostrar.msim.vcd
vcd add -internal mostrar_vlg_vec_tst/*
vcd add -internal mostrar_vlg_vec_tst/i1/*
add wave /*
run -all
