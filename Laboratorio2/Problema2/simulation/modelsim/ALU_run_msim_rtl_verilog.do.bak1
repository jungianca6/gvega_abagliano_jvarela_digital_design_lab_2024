transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/ALU.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/full_adder_nb.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/full_adder_1b.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/full_subtractor_nb.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/full_subtractor_1b.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/multiplier_nb.sv}

vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Problema_1 {C:/Users/julio/OneDrive/Escritorio/Problema_1/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
