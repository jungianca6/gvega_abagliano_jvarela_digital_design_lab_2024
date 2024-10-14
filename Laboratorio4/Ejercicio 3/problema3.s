.global _start

_start:
    // Definir las direcciones base en memoria a cada matriz
    LDR r1, =A     
    LDR r2, =B      
    LDR r3, =C    

    // Contador para el bucle
    MOV r0, #0

WHILE:
	// Comparar si el contador es 16, si es igual sale del bucle, si no ignora el branch
	CMP r0, #16
    BEQ .
    // Cargar valores de A y B
    LDR r4, [r1, r0, LSL #2]
    LDR r5, [r2, r0, LSL #2]

    // Sumar valores
    ADD r4, r4, r5

    // Almacenar resultado en C
    STR r4, [r3, r0, LSL #2]

    // Incrementar índice
    ADD r0, r0, #1
    
	// Repetir ciclo
    B WHILE

.data
A:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
B:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
C:  .space 64    // Reserva espacio para 16 enteros (4 bytes cada uno)