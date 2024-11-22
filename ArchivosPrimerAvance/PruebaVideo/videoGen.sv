module videoGen (
    input logic [9:0] x, y,
    output logic [7:0] r, g, b
);

    // Instancia de la memoria ROM para cargar la imagen
    logic [23:0] image_data_out;

    ImageROM imageROM (
        .address((scaled_y * 200) + scaled_x),
        .data(image_data_out)
    );

    // Desplazamiento actualizado para centrar la imagen en una pantalla 640x480
    localparam H_OFFSET = 10'd20;   // Desplazamiento horizontal para centrar
    localparam V_OFFSET = 10'd40;   // Desplazamiento vertical para centrar

    // Coordenadas escaladas para la imagen de 200x200
    wire [8:0] scaled_x = (x >= H_OFFSET && x < (H_OFFSET + 200 * 3)) ? (x - H_OFFSET) / 3 : 9'b111111111;
    wire [8:0] scaled_y = (y >= V_OFFSET && y < (V_OFFSET + 200 * 2)) ? (y - V_OFFSET) / 2 : 9'b111111111;

    // Asignación de colores con un marco negro alrededor de la imagen centrada
    assign {r, g, b} = (x >= H_OFFSET && x < (H_OFFSET + 200 * 3) &&
                        y >= V_OFFSET && y < (V_OFFSET + 200 * 2)) ? image_data_out : 24'h000000;

endmodule
