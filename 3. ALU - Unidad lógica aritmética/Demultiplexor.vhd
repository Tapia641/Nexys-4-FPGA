
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demultiplexor is
	 generic ( n : integer := 16 );
    Port ( data_in : in  STD_LOGIC; -- Es write cuando es instanciado
           sel : in  STD_LOGIC_VECTOR (3 downto 0); -- Es Write-reg
           data_out : inout  STD_LOGIC_VECTOR (n-1 downto 0)); --Cada salida va a cada uno de los registros
end Demultiplexor;

architecture Behavioral of Demultiplexor is

begin

	demultiplexor : process (data_in,sel,data_out)
	begin
		data_out <= (others => '0');
		case sel is 
			when "0000" => data_out(0) <= data_in;
			when "0001" => data_out(1) <= data_in;
			when "0010" => data_out(2) <= data_in;
			when "0011" => data_out(3) <= data_in;
			when "0100" => data_out(4) <= data_in;
			when "0101" => data_out(5) <= data_in;
			when "0110" => data_out(6) <= data_in;
			when "0111" => data_out(7) <= data_in;
			when "1000" => data_out(8) <= data_in;
			when "1001" => data_out(9) <= data_in;
			when "1010" => data_out(10) <= data_in;
			when "1011" => data_out(11) <= data_in;
			when "1100" => data_out(12) <= data_in;
			when "1101" => data_out(13) <= data_in;
			when "1110" => data_out(14) <= data_in;
			when "1111" => data_out(15) <= data_in;
			when others => data_out <= (others => '0');
		end case;
	end process demultiplexor;

end Behavioral;

