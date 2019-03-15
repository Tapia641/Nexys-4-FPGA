LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ejemplo_tb IS
END ejemplo_tb;
 
ARCHITECTURE behavior OF ejemplo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ejemplo
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal co : std_logic;
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ejemplo PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s => s,
          co => co
        );

    -- Stimulus process
   stim_proc: process
   begin		
		-- 5 + 5 
		a<="0101";
		b<="0101";
		cin<='0';
      wait for 100 ns;	
		-- 12 + 7
		a<="1100";
		b<="1000";
		cin<='0';
      wait for 100 ns;	
		-- 9 + 5
		a<="1001";
		b<="0101";
		cin<='0';
      wait for 100 ns;	
		-- 14 + 9
		a<="1110";
		b<="0110";
		cin<='1';
      wait for 100 ns;	
		-- 4 + 2
		a<="0100";
		b<="0010";
		cin<='0';
      wait for 100 ns;	
		-- 7 + 7
		a<="0111";
		b<="1000";
		cin<='0';
      wait for 100 ns;	
		-- 15 + 5
		a<="1111";
		b<="1011";
		cin<='1';
      wait for 100 ns;	
		-- 11 + 8
		a<="1011";
		b<="1000";
		cin<='1';
      wait for 100 ns;	
		-- 1 + 8
		a<="0001";
		b<="1000";
		cin<='0';
      wait for 100 ns;	
   end process;

END;
