library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumadorAnticipado is
    Port ( a,b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin: in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           co : out  STD_LOGIC);
end SumadorAnticipado;

architecture Behavioral of SumadorAnticipado is

begin

	process (a, b, cin)
	variable p, g : std_logic_vector (3 downto 0);
	variable algo, algo2, sm : std_logic;
	variable c : std_logic_vector (4 downto 0) ;
	variable eb : std_logic_vector (3 downto 0) ;
	
	begin
	
		c(0) := cin;
		for i in 0 to 3 loop
			eb(i) := b(i) xor cin;
			p(i) := a(i) xor eb(i);
			g(i) := a(i) and eb(i);
			s(i) <= p(i) xor c(i);
			
			algo := c(0);
			for j in 0 to i loop
				algo := p(j) and algo;
			end loop;
			
			algo2 := '0';
			if(i>0) then
				sm := g(0) and algo2;
				for k in 0 to (i-1) loop
					for l in (k+1) to i loop
						if(l=(k+1)) then
							algo2 := p(l);
						end if;
						algo2 := algo2 and p(l);
					end loop;
				if(k=0) then
					sm := algo2 and g(0);
				else
					sm := sm or (algo2 and g(k));
				end if;
				algo2 := '0';
				end loop;
			else
				sm := '0';
			end if;
			c(i+1) := g(i) or algo or sm;
		end loop;
	co <= c(4);
	end process;	
end Behavioral;

