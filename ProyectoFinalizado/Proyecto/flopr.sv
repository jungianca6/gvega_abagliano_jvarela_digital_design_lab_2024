module flopr #(parameter WIDTH = 8)            // Parámetro genérico para definir el ancho de datos (default: 8 bits)
                 (
                  input logic clk, reset,       // Señales de reloj y reset
                  input logic [WIDTH-1:0] d,    // Entrada de datos de ancho parametrizable
                  output logic [WIDTH-1:0] q    // Salida de datos almacenados (mismo ancho que la entrada)
                 );
					
  // Bloque secuencial que se activa en el flanco positivo del reloj o del reset
  always_ff @(posedge clk, posedge reset)
    if (reset)                                 // Si la señal de reset está activa
      q <= 0;                                  // Reiniciar la salida del registro a 0
    else                                       // De lo contrario (sin reset activo)
      q <= d;                                  // Actualizar el registro con el valor de entrada `d`
endmodule
