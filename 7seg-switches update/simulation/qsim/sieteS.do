onerror {quit -f}
vlib work
vlog -work work sieteS.vo
vlog -work work sieteS.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.sieteS_vlg_vec_tst
vcd file -direction sieteS.msim.vcd
vcd add -internal sieteS_vlg_vec_tst/*
vcd add -internal sieteS_vlg_vec_tst/i1/*
add wave /*
run -all
