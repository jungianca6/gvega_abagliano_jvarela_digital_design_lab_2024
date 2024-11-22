module interpreter(
    input logic [31:0] next_x, next_y,
    input logic [31:0] pixel_value_original, pixel_value_new,
    
    output logic [15:0] adr_original,
    output logic [31:0] adr_new,
    output logic [23:0] pixel_color
);

    // Canales de color separados
    logic [7:0] red, green, blue;
    logic [31:0] address;
    
    // Asignar los canales a la salida de color
    assign pixel_color[23:16] = red;   // Rojo
    assign pixel_color[15:8]  = green; // Verde
    assign pixel_color[7:0]   = blue;  // Azul

    assign adr_original = address[15:0];
    assign adr_new = address;
    
    always_comb begin
        // Imagen Original
        if (next_x >= 0 & next_x < 256 & next_y >= 0 & next_y < 256) 
        begin
            red   = pixel_value_original[23:16]; // Canal rojo
            green = pixel_value_original[15:8];  // Canal verde
            blue  = pixel_value_original[7:0];   // Canal azul
            address = (next_y * 256) + next_x;
        end
        
        // Imagen Nueva
        else if (next_x >= 266 & next_x < 522 & next_y >= 0 & next_y < 256) 
        begin
            red   = pixel_value_new[23:16]; // Canal rojo
            green = pixel_value_new[15:8];  // Canal verde
            blue  = pixel_value_new[7:0];   // Canal azul
            address = (next_y * 256) + next_x - 266;
        end
        
        // Fuera del rango definido
        else 
        begin
            red   = 8'd0;
            green = 8'd0;
            blue  = 8'd0;
            address = 32'd0;
        end
    end

endmodule
