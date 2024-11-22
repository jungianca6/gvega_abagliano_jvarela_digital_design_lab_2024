transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/arm.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/controller.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/decoder.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/condlogic.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/datapath.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/regfile.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/flopr.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/flopenr.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/mux2.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/top.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/dmem.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/adder.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/extend.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/alu.sv}
vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/imem.sv}

vlog -sv -work work +incdir+D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador {D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
