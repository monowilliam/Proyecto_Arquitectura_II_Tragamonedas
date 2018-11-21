onerror {quit -f}
vlib work
vlog -work work memoriaram.vo
vlog -work work memoriaram.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.memoriaram_vlg_vec_tst
vcd file -direction memoriaram.msim.vcd
vcd add -internal memoriaram_vlg_vec_tst/*
vcd add -internal memoriaram_vlg_vec_tst/i1/*
add wave /*
run -all
