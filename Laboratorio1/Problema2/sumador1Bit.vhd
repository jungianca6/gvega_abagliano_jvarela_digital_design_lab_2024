library IEEE; use IEEE.STD_LOGIC_1164.all;

entity sumador1Bit is

	port(A : in STD_LOGIC; 					-- Entrada del primer número de 4 bits
		  B : in STD_LOGIC; 					-- Entrada del segundo número de 4 bits
		  Cin : in STD_LOGIC;				-- Acarreo de entrada
			S, Cout: out STD_LOGIC);	-- Resultado de la suma y acarreo de salida
			
end;

architecture oneBitModule of sumador1Bit is
	
begin

	S <= A XOR B XOR Cin;

	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
	
	
end oneBitModule;