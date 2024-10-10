.global _start
_start:
	
	LDR R0, =array      @ R0 apunta al inicio del arreglo
    MOV R1, #0          @ R1 es el índice i, inicializado a 0
    MOV R2, #6          @ Constante "y" en R2

loop:
    CMP R1, #9         @ Comparar el índice con 10
    BGT endLoop        @ Si i > 10, salir del bucle

    LDR R3, [R0, R1, LSL #2]  @ Cargar array[i] en R3 (acceso al arreglo)
    CMP R3, R2                @ Comparar array[i] con la constante "y"
    BLT add              @ Si array[i] < y, ir a la suma

mul:
    MUL R3, R3, R2            @ array[i] = array[i] * y
    STR R3, [R0, R1, LSL #2]  @ Guardar el resultado de nuevo en array[i] (cada elemento es de 4 bytes)
    B next

add:
    ADD R3, R3, R2            @ array[i] = array[i] + y
    STR R3, [R0, R1, LSL #2]  @ Guardar el resultado en array[i] (cada elemento es de 4 bytes)

next:
    ADD R1, R1, #1            @ Incrementar el índice i
    B loop                    @ Volver al inicio del bucle

endLoop:
    @ Fin del bucle

array:
    .word 7, 4, 2, 9, 1, 3, 6, 5, 10, 8  @ Definición del arreglo en memoria