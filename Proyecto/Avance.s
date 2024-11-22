.global _start
_start:
	
	LDR     R0, =5                    @ R0 = 5
    LDR     R1, =9                  @ R1 = 10
    ADD     R2, R0, R1                @ R2 = R0 + R1 

	LDR     R3, =0x40
    STR     R2, [R3]                  @ Almacenar el valor de R2 en la dirección 0x20000000
	
	
	B .
