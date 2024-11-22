module interpreter(
    input logic [31:0] next_x, next_y,                     // Coordenadas actuales en el plano (x, y)
    input logic [31:0] pixel_value_original, pixel_value_new, // Valores del píxel en formato 24 bits RGB (8 bits por canal)

    output logic [15:0] adr_original,                      // Dirección original de 16 bits (truncada)
    output logic [31:0] adr_new,                           // Dirección completa de 32 bits para el nuevo píxel
    output logic [23:0] pixel_color                        // Valor RGB del píxel final procesado
);

    // Canales de color separados
    logic [7:0] red, green, blue;                          // Canales individuales para R, G y B (8 bits cada uno)
    logic [31:0] address;                                  // Dirección calculada a partir de las coordenadas
    
    // Asignar los canales a la salida de color
    assign pixel_color[23:16] = red;   // Asignar el canal rojo a los bits más significativos del color
    assign pixel_color[15:8]  = green; // Asignar el canal verde a los bits intermedios del color
    assign pixel_color[7:0]   = blue;  // Asignar el canal azul a los bits menos significativos del color

    assign adr_original = address[15:0]; // Truncar la dirección calculada a 16 bits
    assign adr_new = address;            // Usar la dirección completa de 32 bits

    // Bloque combinacional para determinar valores del píxel y direcciones
    always_comb begin
        // Imagen Original
        if (next_x >= 0 & next_x < 256 & next_y >= 0 & next_y < 256) 
        begin
            red   = pixel_value_original[23:16]; // Extraer el canal rojo del píxel original
            green = pixel_value_original[15:8];  // Extraer el canal verde del píxel original
            blue  = pixel_value_original[7:0];   // Extraer el canal azul del píxel original
            address = (next_y * 256) + next_x;   // Calcular la dirección basada en (x, y) en un espacio de 256x256
        end
        
        // Imagen Nueva
        else if (next_x >= 266 & next_x < 522 & next_y >= 0 & next_y < 256) 
        begin
            red   = pixel_value_new[23:16]; // Extraer el canal rojo del nuevo píxel
            green = pixel_value_new[15:8];  // Extraer el canal verde del nuevo píxel
            blue  = pixel_value_new[7:0];   // Extraer el canal azul del nuevo píxel
            address = (next_y * 256) + next_x - 266; // Calcular dirección ajustada para el rango de la nueva imagen
        end
        
        // Fuera del rango definido
        else 
        begin
            red   = 8'd0;                     // Valores por defecto (negro) si las coordenadas están fuera de rango
            green = 8'd0;
            blue  = 8'd0;
            address = 32'd0;                  // Dirección por defecto (0) si está fuera de rango
        end
    end

endmodule
