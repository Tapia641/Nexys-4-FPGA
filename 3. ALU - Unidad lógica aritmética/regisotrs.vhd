
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regisotrs is -- Permite la carga y el reset asincrono
	 GENERIC(
		n : integer := 16
	 );
    Port ( d : in  STD_LOGIC_VECTOR (n-1 downto 0); -- Recibe o write data o SHE
           l, clk, clr : in  STD_LOGIC;
			  q : inout  STD_LOGIC_VECTOR (n-1 downto 0));
end regisotrs;

architecture Behavioral of regisotrs is
begin

proceso: process(clk, clr)
begin
	if (clr='1') then -- reset asincrono
		q <= (others => '0');
	elsif(clk='1' and clk'event) then -- Si detectamos una señal de reloj 
		if (l = '1') then
			q <= d;
		else
			q <= q;
		end if;
	end if;
end process proceso;

end Behavioral;

