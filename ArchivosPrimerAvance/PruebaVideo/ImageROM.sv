module ImageROM (
    input logic [15:0] address,    // Dirección de 16 bits para acceder a 200x200 píxeles
    output logic [23:0] data       // Salida de 24 bits para los colores RGB
);

    // Memoria ROM para almacenar los datos de la imagen
    logic [23:0] image_data[0:39999];  // 200x200 = 40000 direcciones

    initial begin
        // Cargar datos de la imagen desde el archivo .mem
        $readmemh("image_data.mem", image_data);
    end

    // Asignar el valor de `data` en función de la dirección
    assign data = image_data[address];

endmodule
