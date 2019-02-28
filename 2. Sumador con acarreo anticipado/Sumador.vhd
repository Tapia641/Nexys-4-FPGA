
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumador is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end Sumador;

architecture Behavioral of Sumador is

begin

	s <= a xor b xor cin;
	cout <= (a and b) or (b and cin) or (a and cin);


end Behavioral;

