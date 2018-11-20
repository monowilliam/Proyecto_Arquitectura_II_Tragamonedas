onerror {quit -f}
vlib work
vlog -work work randomSegmento.vo
vlog -work work randomSegmento.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.randomSegmento_vlg_vec_tst
vcd file -direction randomSegmento.msim.vcd
vcd add -internal randomSegmento_vlg_vec_tst/*
vcd add -internal randomSegmento_vlg_vec_tst/i1/*
add wave /*
run -all
