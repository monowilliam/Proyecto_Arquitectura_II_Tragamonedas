onerror {quit -f}
vlib work
vlog -work work Mux12.vo
vlog -work work Mux12.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Mux12_vlg_vec_tst
vcd file -direction Mux12.msim.vcd
vcd add -internal Mux12_vlg_vec_tst/*
vcd add -internal Mux12_vlg_vec_tst/i1/*
add wave /*
run -all
