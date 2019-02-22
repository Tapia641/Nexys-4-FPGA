library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumador is
    Port ( a,b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin: in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           co : out  STD_LOGIC);
end Sumador;

architecture Behavioral of Sumador is
signal c : std_logic_vector (4 downto 0) ;
signal eb : std_logic_vector (3 downto 0) ;

begin
	c(0) <= cin;
	co <= c(4);
	etiqueta : for i in 0 to 3 generate
	eb(i) <= b(i) xor c(0);
	s(i) <= a(i) xor eb(i) xor c(i);
	c(i+1) <= (a(i) and eb(i)) or (a(i) and c(i)) or (eb(i) and c(i));
	end generate;
	co <= c(4);
end Behavioral;
