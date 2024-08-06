library ieee;
use ieee.std_logic_1164.all;

entity sumador4Bits_tb is
end sumador4Bits_tb;

architecture Prueba of sumador4Bits_tb is
    component sumador4Bits is
        port (
            A, B : in std_logic_vector(3 downto 0);  -- Entradas de dos números de 4 bits
            Cin  : in std_logic;                      -- Entrada del acarreo de entrada
            S  : out std_logic_vector(3 downto 0);    -- Salida de la suma de 4 bits
            Cout : out std_logic      -- Salida del acarreo de salida
        );
    end component;
	 
	 --Inputs

    signal A, B: std_logic_vector(3 downto 0) := (others => '0');
    signal Cin : std_logic := '0';  

	--Outputs
	 signal S : std_logic_vector(3 downto 0);
	 signal Cout : std_logic;
	 
begin
    -- Instancia del diseño bajo prueba (DUT)
    uut: sumador4Bits port map (
	 A => A, 
	 B => B, 
	 Cin => Cin, 
	 S  => S, 
	 Cout => Cout
	 );

    -- Proceso para generar estímulos de entrada
    stimulus: process
    begin
	 wait for 25 ns;
        -- Primer conjunto de valores de entrada
        a <= "0000"; b <= "0000"; wait for 10 ns;

        -- Segundo conjunto de valores de entrada
        a <= "0001"; b <= "0001";  wait for 10 ns;

        -- Tercer conjunto de valores de entrada
        a <= "0101"; b <= "1111";  wait for 10 ns;

        -- Cuarto conjunto de valores de entrada
        a <= "1010"; b <= "0110";  wait for 10 ns;

        wait;  -- Espera indefinida
    end process stimulus;
end Prueba;