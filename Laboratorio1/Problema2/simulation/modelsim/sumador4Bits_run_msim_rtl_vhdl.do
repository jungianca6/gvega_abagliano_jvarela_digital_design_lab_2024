transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/julio/OneDrive/Documentos/GitHub/gvega_digital_design_lab_2024/Laboratorio1/Problema2/sumador1Bit.vhd}
vcom -93 -work work {C:/Users/julio/OneDrive/Documentos/GitHub/gvega_digital_design_lab_2024/Laboratorio1/Problema2/sumador4Bits.vhd}
vcom -93 -work work {C:/Users/julio/OneDrive/Documentos/GitHub/gvega_digital_design_lab_2024/Laboratorio1/Problema2/disp7seg.vhd}

vcom -93 -work work {C:/Users/julio/OneDrive/Documentos/GitHub/gvega_digital_design_lab_2024/Laboratorio1/Problema2/sumador4Bits_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  sumador4Bits_tb

add wave *
view structure
view signals
run -all
