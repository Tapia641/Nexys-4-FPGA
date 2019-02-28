library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUN is
	generic(n : integer := 4);
    Port ( a,b: in std_logic_vector(n-1 downto 0);
			  cin, sela, selb : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           cout : out  STD_LOGIC;
			  res : out  STD_LOGIC_vector(n-1 downto 0);
			  band: out std_logic_vector(3 downto 0)
			  );
end ALUN;

architecture Behavioral of ALUN is

component ALU1 is
    Port ( a,b,cin, sela, selb : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           cout,res : out  STD_LOGIC
			  );
end component;

signal c : std_logic_Vector(n downto 0);
signal aux:std_logic_vector(n-1 downto 0);

begin

	c(0) <= cin;
	
	ciclo: for i in 0 to n-1 generate
		alu : ALU1 PORT MAP (
					 a => a(i),
					 b => b(i),
					 cin => cin,
					 sela => sela,
					 selb => selb,
					 op => op,
					 cout => c(i+1),
					 res => aux(i)
		);
		
	
	end generate;
	res <= aux;
	cout <= c(n);
	
	--Bandera de acarreo
	band(0) <= cout;
	
	--Bandera de signo
	band(2) <= aux(n-1);
	
	--Bandera de Zero
	band(1) <= '1' when aux(n-1 downto 0) = "0000" else '0'; 
	
	--Bandera de overflow 
	--band(3) <= c(n) xor c(n-1);
	band(3) <= '0';

end Behavioral;

