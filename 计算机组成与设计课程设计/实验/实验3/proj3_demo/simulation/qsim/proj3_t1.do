onerror {quit -f}
vlib work
vlog -work work proj3_t1.vo
vlog -work work proj3_t1.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.proj3_t1_vlg_vec_tst
vcd file -direction proj3_t1.msim.vcd
vcd add -internal proj3_t1_vlg_vec_tst/*
vcd add -internal proj3_t1_vlg_vec_tst/i1/*
add wave /*
run -all
