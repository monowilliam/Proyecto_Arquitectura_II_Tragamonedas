onerror {quit -f}
vlib work
vlog -work work Mux14.vo
vlog -work work Mux14.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Mux14_vlg_vec_tst
vcd file -direction Mux14.msim.vcd
vcd add -internal Mux14_vlg_vec_tst/*
vcd add -internal Mux14_vlg_vec_tst/i1/*
add wave /*
run -all
