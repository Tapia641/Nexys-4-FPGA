
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Corrimiento is -- Barrel shifter
	 GENERIC( n : integer := 16;	e : integer := 4 );
    Port ( data_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
				shamt : in  STD_LOGIC_VECTOR (e-1 downto 0); -- 
				dir : in STD_LOGIC; -- Direccion del corrimiento
           data_out : out  STD_LOGIC_VECTOR (n-1 downto 0));
end Corrimiento;

architecture Behavioral of Corrimiento is
begin

ls: process (data_in,shamt,dir)
variable aux: std_logic_vector(n-1 downto 0);
begin
	aux := data_in;
	if (dir = '1') then -- Corrimiento hacia la izquierda
		for i in 0 to e-1 loop
			for j in n-1 downto 0 loop
				if shamt(i) = '1' then --
					if (j-2**i > -1) then
						aux(j) := aux(j-(2**i));
					else
						aux(j) := '0';
					end if;
				end if;
			end loop;
		end loop;
	else -- Corrimiento hacia la derecha
		for i in 0 to e-1 loop
			for j in 0 to n-1 loop
				if shamt(i) = '1' then
					if (j+2**i < n) then
						aux(j) := aux(j+(2**i));
					else
						aux(j) := '0';
					end if;
				end if;
			end loop;
		end loop;
	end if;
	data_out <= aux;
end process ls;

end Behavioral;

