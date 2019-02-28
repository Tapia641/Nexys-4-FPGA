
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1 is
    Port ( a,b,cin, sela, selb : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           cout,res : out  STD_LOGIC);
end ALU1;

architecture Behavioral of ALU1 is
component Sumador is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end component;



signal aux_a, aux_b, res_and, res_or, res_xor, res_suma : std_logic;
begin

	aux_a <= a xor sela;
	aux_b <= b xor selb;
	
	res_and <= aux_a and aux_b;
	res_or <= aux_a or aux_b;
	res_xor <= aux_a xor aux_b;
	
	suma: Sumador port map (
		a => aux_a,
		b => aux_b,
		cin => cin,
      s => res_suma,
		cout => cout
		);
		
--	process (res_and, res_or, res_xor, res_suma,op)
--	begin 
--		case op is 
--			when "00" => res <= res_and;
--			when "01" => res <= res_or;
--			when "10" => res <= res_xor;
--			when others => res <= res_suma;
--		end case;
--	end process;

	process (res_and, res_or, res_xor, res_suma, op)
	begin 
		if op = "00" then
			res <= res_and;
		elsif op = "01" then
			res <= res_or;
		elsif op = "10" then
			res <= res_xor;
		else 
			res <= res_suma;
		end if;
	end process;

	
	

end Behavioral;

