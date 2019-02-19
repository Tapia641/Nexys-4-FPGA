LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SumadorRestador IS
    PORT ( a : IN  STD_LOGIC_VECTOR (3 DOWNTO 0); 					--DECLARAMOS A COMO UN VECTOR DE ENTRADA
           b : in  STD_LOGIC_VECTOR (3 DOWNTO 0);					--DECLARAMOS B COMO UN VECTOR DE ENTRADA
           cin : IN  STD_LOGIC;											--DECLARAMOS EL ACARREO DE ENTRADA (CARRY)
           s : OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);					--DECLARAMOS S COMO EL VECTOR SALIDA DE LA SUMA
           cout : OUT STD_LOGIC);										--DECLARAMOS EL ACARREO DE SALIDA (CARRY)
END SumadorRestador;


ARCHITECTURE Behavioral OF SumadorRestador IS

SIGNAL c : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL eb : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

	c(0) <= cin;
	cout <= c(4);
	
	etiqueta : FOR i IN 0 TO 3 GENERATE
	eb(i) <= b(i) XOR c(0);
	s(i) <= a(i) XOR eb(i) XOR c(i);
	c(i+1) <= (a(i) AND eb(i)) OR (a(i) AND c(i)) OR (eb(i) AND c(i));

	END GENERATE;
	
	cout <= c(4);

END Behavioral;