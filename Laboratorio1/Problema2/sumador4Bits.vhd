library ieee;
use ieee.std_logic_1164.all;

entity sumador4Bits is
    port (
        A: in std_logic_vector(3 downto 0); 			-- Entrada del primer número de 4 bits
		  B: in std_logic_vector(3 downto 0); 			-- Entrada del segundo número de 4 bits
        Cin  : in std_logic;                   		-- Acarreo de entrada
        S : out std_logic_vector(3 downto 0); 	-- Salida de la suma de 4 bits
        Cout : out std_logic);  -- Salida del acarreo de salida
end sumador4Bits;

architecture sumadorCompleto4Bits of sumador4Bits is

	-- Instancia para utilizar el sumador de un 1-bit
    component sumador1Bit is
	 
        port (
            A : in std_logic; 
				B : in std_logic;
				Cin : in std_logic;
            S : out std_logic;
				Cout: out std_logic );
        
    end component;
	 
	 --component disp7seg is
	 
		--port (b_num : in  STD_LOGIC_VECTOR (3 downto 0);
				--seg : out  STD_LOGIC_VECTOR (6 downto 0) );
	
	 
	 signal f_carry : std_logic_vector(2 downto 0); 	-- Señal para almacenar el carry de salida
	 
	 
begin
    -- Instancias de sumadores de un bit, conectados en cascada
    FA0: sumador1Bit port map (A(0), B(0), Cin, S(0), f_carry(0)); -- Suma el bit menos significativo
    FA1: sumador1Bit port map (A(1), B(1), f_carry(0), S(1), f_carry(1)); -- Suma el segundo bit con el acarreo anterior
    FA2: sumador1Bit port map (A(2), B(2), f_carry(1), S(2), f_carry(2)); -- Suma el tercer bit con el acarreo anterior
    FA3: sumador1Bit port map (A(3), B(3), f_carry(2), S(3), Cout); -- Suma el bit más significativo y obtiene el acarreo de salida
	 
	 --f_carry <= "000" & C_int(3);	--Guarda el carry de salida como un número de 4 bits
	 
	 --Conversor de las salidas a números de 7 bits correspondientes
	 --a cada segmento de los display utilizados
	 
	 --hex1: disp7seg port map(result, sum4);  --Convierte el resultado de la suma en un número de 7 bits 
	 --hex2: disp7seg port map(f_carry, Cout);	  --Convierte el carry final en un número de 7 bits 
	 
end sumadorCompleto4Bits;