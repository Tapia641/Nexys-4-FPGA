
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor2a1 is
	 generic(
		n : integer := 16
	 );
    Port ( data_0,data_1 : in  STD_LOGIC_VECTOR (n-1 downto 0); -- Recibe el write data y el barrel shifter
           sel : in  STD_LOGIC; -- Es SHE
           data_out : inout  STD_LOGIC_VECTOR (n-1 downto 0)); -- Q del registro
end Multiplexor2a1;

architecture Behavioral of Multiplexor2a1 is

begin

	multi2a1 : process(sel, data_0,data_1,data_out)
begin

	if sel = '1' then --Dejamos pasar uno
		data_out <= data_0;
	else
		data_out <= data_1;
	end if;

end process multi2a1;

end Behavioral;

