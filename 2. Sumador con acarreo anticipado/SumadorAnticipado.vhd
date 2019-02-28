library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumadorAnticipado is
	generic ( n : integer := 4	);
	
    Port ( a,b : in  STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (n-1 downto 0);
           cout : out  STD_LOGIC);
end SumadorAnticipado;

architecture Behavioral of SumadorAnticipado is

component Sumador is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end component;

signal c : std_logic_Vector(n downto 0);

begin

c(0) <= cin;

	ciclo : for i in 0 to n-1 generate
		suma : 
		Sumador port map ( 
			 a	=> a(i),
			 b => b(i),
			 cin => c(i),  
			 s		=> s(i),
			 cout => c(i+1)
		);
	end generate;
	
	cout <= c(4);



end Behavioral;

