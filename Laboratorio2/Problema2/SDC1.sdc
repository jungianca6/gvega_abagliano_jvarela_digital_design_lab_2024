# Archivo SDC para tu proyecto de Quartus Prime

# Crear un grupo para las señales de reloj
create_clock -name clk -period 20.0 [get_ports clk]
# Ajusta el periodo de acuerdo con la frecuencia de tu reloj
# Periodo de 20.0 ns corresponde a una frecuencia de 50 MHz

# Definir la latencia del reloj
set_clock_latency -source 0.5 [get_clocks clk]

# Restringir el tiempo de los Flip-Flops (FF1 y FF2)

# FF1
set_input_delay -clock clk 5.0 [get_ports {A_numf1 B_numf1 operations_buttonsf1 change_modef1}]
set_output_delay -clock clk 2.0 [get_ports {Output_A_numf1 Output_B_numf1 Output_operations_buttonsf1 Output_change_modef1}]

# FF2
set_input_delay -clock clk 5.0 [get_ports {seg1f2 seg2f2 result_segf2 flags_segf2}]
set_output_delay -clock clk 2.0 [get_ports {Output_seg1f2 Output_seg2f2 Output_result_segf2 Output_flags_segf2}]

# Restringir el tiempo de los módulos internos en el diseño

# Señales críticas de la ALU (puedes ajustar estas restricciones si es necesario)
set_input_delay -clock clk 5.0 [get_ports {a b Operator}]
set_output_delay -clock clk 2.0 [get_ports {Result binaryResult display1 display2 N Z C V}]

# Tiempo de configuración y retención
set_false_path -from [get_clocks clk] -to [get_clocks clk] -through [get_cells *]

# Configuración de las señales de reset
set_input_delay -clock clk 5.0 [get_ports reset]
set_output_delay -clock clk 2.0 [get_ports {reset}]

# Incluir restricciones adicionales según la frecuencia máxima de operación
set_clock_uncertainty 0.5 [get_clocks clk]
