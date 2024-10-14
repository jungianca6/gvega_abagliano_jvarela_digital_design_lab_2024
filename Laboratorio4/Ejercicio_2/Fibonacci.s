.text
.global _start

_start:
    LDR r0, =5         @ Calcular Fibonacci de 5
    BL fibonacci       @ Llamar a la función fibonacci
    @ El resultado estará en r0
    
    LDR r0, =7         @ Calcular Fibonacci de 7
    BL fibonacci       @ Llamar a la función fibonacci
    
    LDR r0, =10        @ Calcular Fibonacci de 10
    BL fibonacci       @ Llamar a la función fibonacci
    
    @ Fin del programa
    B .

fibonacci:
    MOV r1, #0          @ r1 = F(n-2) = 0
    MOV r2, #1          @ r2 = F(n-1) = 1
    CMP r0, #1          @ Compara X con 1
    BLE end_fib         @ Si X <= 1, regresa el resultado
    
loop:
    ADD r3, r1, r2      @ r3 = F(n) = F(n-1) + F(n-2)
    SUBS r0, r0, #1     @ Decrementa X (n--) y actualiza r0
    MOV r1, r2          @ F(n-2) = F(n-1)
    MOV r2, r3          @ F(n-1) = F(n)
    BGT loop            @ Si n > 0, sigue el ciclo

end_fib:
    MOV r0, r1          @ Coloca el resultado en r0
    BX lr               @ Retorna
