
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor is -- Multiplexor de 16 a 1 (read_data)i y un selector (read_register)i
	 Generic( n : integer := 16 );
    Port ( data_0,data_1,data_2,data_3,data_4 : in  STD_LOGIC_VECTOR (n-1 downto 0); -- Debido a que le llega cada registro de 16 bits
			  data_5,data_6,data_7,data_8,data_9 : in  STD_LOGIC_VECTOR (n-1 downto 0); -- "
			  data_10,data_11,data_12,data_13 : in  STD_LOGIC_VECTOR (n-1 downto 0); -- "
			  data_14,data_15 : in  STD_LOGIC_VECTOR (n-1 downto 0); -- "
           sel : in  STD_LOGIC_VECTOR (3 downto 0);--El selector que en el RegistroArchivo es Read_reg1
           data_out : inout  STD_LOGIC_VECTOR (n-1 downto 0)); -- La salida que enel RegistroArchivo es de Read_data
end Multiplexor;

architecture Behavioral of Multiplexor is

begin

multi : process(sel, data_0,data_1,data_2,data_3,data_4,data_5,data_6,data_7,
data_8,data_9,data_10,data_11,data_12,data_13,data_14,data_15)
begin

	case sel is
		when "0000" => data_out <= data_0;
		when "0001" => data_out <= data_1;
		when "0010" => data_out <= data_2;
		when "0011" => data_out <= data_3;
		when "0100" => data_out <= data_4;
		when "0101" => data_out <= data_5;
		when "0110" => data_out <= data_6;
		when "0111" => data_out <= data_7;
		when "1000" => data_out <= data_8;
		when "1001" => data_out <= data_9;
		when "1010" => data_out <= data_10;
		when "1011" => data_out <= data_11;
		when "1100" => data_out <= data_12;
		when "1101" => data_out <= data_13;
		when "1110" => data_out <= data_14;
		when "1111" => data_out <= data_15;
		when others => data_out <= (others => '0');
	end case;

end process multi;

end Behavioral;

