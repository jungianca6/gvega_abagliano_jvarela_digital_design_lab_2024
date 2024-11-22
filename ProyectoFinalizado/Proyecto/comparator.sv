module comparator(
    input int a, b,     // Entradas: dos números enteros para comparar
    output eq,          // Salida: 1 si a es igual a b (a == b), 0 en caso contrario
    output leq          // Salida: 1 si a es menor o igual a b (a <= b), 0 en caso contrario
);

    // Comparación de igualdad
    assign eq = (a == b);  // Verifica si a es igual a b y asigna el resultado a eq

    // Comparación de menor o igual
    assign leq = (a <= b); // Verifica si a es menor o igual a b y asigna el resultado a leq

endmodule
