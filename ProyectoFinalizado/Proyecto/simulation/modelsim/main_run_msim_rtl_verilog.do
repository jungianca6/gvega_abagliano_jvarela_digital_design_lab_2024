transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/RAM2.v}
vlog -vlog01compat -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/ROM2.v}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/clock_divider.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/arm_demo.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/counter.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/comparator.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/interpreter.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/vga_driver.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/condlogic.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/decoder.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/controller.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/arm.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/regfile.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/mux2.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/flopr.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/extend.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/datapath.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/adder.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/main.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/adderalu.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/alu.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/dmem.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/barrel_shifter.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/mulalu.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/switchPC.sv}
vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/imem.sv}

vlog -sv -work work +incdir+C:/Users/julio/OneDrive/Escritorio/Proyecto {C:/Users/julio/OneDrive/Escritorio/Proyecto/arm_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  arm_tb

add wave *
view structure
view signals
run 100 ns
