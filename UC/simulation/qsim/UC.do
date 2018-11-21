onerror {quit -f}
vlib work
vlog -work work UC.vo
vlog -work work UC.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.UC_vlg_vec_tst
vcd file -direction UC.msim.vcd
vcd add -internal UC_vlg_vec_tst/*
vcd add -internal UC_vlg_vec_tst/i1/*
add wave /*
run -all
