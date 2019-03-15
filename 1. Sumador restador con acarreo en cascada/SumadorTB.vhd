LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Pruebas IS
END Pruebas;
 
ARCHITECTURE behavior OF Pruebas IS 
 
    COMPONENT Sumador
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
    
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

   signal s : std_logic_vector(3 downto 0);
   signal co : std_logic;
 
 
BEGIN
 
   uut: Sumador PORT MAP (
          "0001" => a,
          "0010" => b,
          '1' => cin,
          s => s,
          co => co
        );
      wait;
   end process;

END;
