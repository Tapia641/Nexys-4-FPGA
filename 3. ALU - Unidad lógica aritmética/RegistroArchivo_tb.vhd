
LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;

USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
ENTITY RegistroArchivo_tb IS
END RegistroArchivo_tb;
 
ARCHITECTURE behavior OF RegistroArchivo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegistroArchivo
    PORT(
         read_register1 : IN  std_logic_vector(3 downto 0);
         read_register2 : IN  std_logic_vector(3 downto 0);
         shamt 			: IN  std_logic_vector(3 downto 0);
         write_register : IN  std_logic_vector(3 downto 0);
         write_data 		: IN  std_logic_vector(15 downto 0);
         wr 				: IN  std_logic;
         she 				: IN  std_logic;
         dir 				: IN  std_logic;
         clk 				: IN  std_logic;
         clr 				: IN  std_logic;
         read_data1 		: INOUT  std_logic_vector(15 downto 0);
         read_data2 		: INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal read_register1 : std_logic_vector(3 downto 0) := (others => '0');
   signal read_register2 : std_logic_vector(3 downto 0) := (others => '0');
   signal shamt : std_logic_vector(3 downto 0) := (others => '0');
   signal write_register : std_logic_vector(3 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal wr : std_logic := '0';
   signal she : std_logic := '0';
   signal dir : std_logic := '0';
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

	--BiDirs
   signal read_data1 : std_logic_vector(15 downto 0);
   signal read_data2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegistroArchivo PORT MAP (
          read_register1 => read_register1,
          read_register2 => read_register2,
          shamt => shamt,
          write_register => write_register,
          write_data => write_data,
          wr => wr,
          she => she,
          dir => dir,
          clk => clk,
          clr => clr,
          read_data1 => read_data1,
          read_data2 => read_data2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   file ARCH_RES : TEXT;																					
	variable LINEA_RES : line;
	VARIABLE VAR_RDU : STD_LOGIC_VECTOR(15 DOWNTO 0);
	VARIABLE VAR_RDD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
	

	VARIABLE VAR_RR1    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_RR2    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_SHAMT  :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_WRE    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_WD     :  STD_LOGIC_VECTOR(15 DOWNTO 0);
	VARIABLE VAR_WR     :  STD_LOGIC;
	VARIABLE VAR_SHE    :  STD_LOGIC;
	VARIABLE VAR_DIR    :  STD_LOGIC;
	VARIABLE VAR_CLR    :  STD_LOGIC;

	
	VARIABLE CADENA : STRING(1 TO 4);
	VARIABLE CADENA_I : STRING(1 TO 6);
	VARIABLE CADENA_W : STRING(1 TO 10);
	VARIABLE CADENA_X : STRING(1 TO 5);

   begin		
		file_open(ARCH_RES, "salida.TXT", WRITE_MODE); 	
		file_open(ARCH_VEC, "entrada.TXT", READ_MODE); 	

		CADENA_X := "  RR1";
		write(LINEA_RES, CADENA_X, right, CADENA_X'LENGTH+1);	
		CADENA := " RR2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA_I := " SHAMT";
		write(LINEA_RES, CADENA_I, right, CADENA_I'LENGTH+1);	
		CADENA_X := " WREG";
		write(LINEA_RES, CADENA_X, right, CADENA_X'LENGTH+1);
		CADENA := " WD ";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA_I:= "   WR ";
		write(LINEA_RES, CADENA, right, CADENA_I'LENGTH+1);
		CADENA := " SHE";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " DIR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " RD1";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " RD2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		
		writeline(ARCH_RES,LINEA_RES);
      wait for 100 ns;	

	FOR I IN 0 TO 9 LOOP
			readline(ARCH_VEC,LINEA_VEC);
			
			Hread(LINEA_VEC, VAR_RR1);
			read_register1<=VAR_RR1;

			Hread(LINEA_VEC, VAR_RR2);
			read_register2<=VAR_RR2;

			Hread(LINEA_VEC, VAR_SHAMT);
			shamt<=VAR_SHAMT;
			
			Hread(LINEA_VEC, VAR_WRE);
			write_register<=VAR_WRE;
			
			Hread(LINEA_VEC, VAR_WD);
			write_data<=VAR_WD;
			
			read(LINEA_VEC, VAR_WR);
			wr<=VAR_WR;

			read(LINEA_VEC, VAR_SHE);
			she<=VAR_SHE;
			
			read(LINEA_VEC, VAR_DIR);
			dir<=VAR_DIR;

			read(LINEA_VEC, VAR_CLR);
			clr<=VAR_CLR;
			
			WAIT UNTIL RISING_EDGE(CLK);
			VAR_RDU := read_data1;	
			VAR_RDD := read_data2;	
	
			Hwrite(LINEA_RES, VAR_RR1, 	right, 5);
			Hwrite(LINEA_RES, VAR_RR2, 	right, 5);
			Hwrite (LINEA_RES, VAR_SHAMT, right, 5);	
			Hwrite (LINEA_RES, VAR_WRE, 	right, 8);	
			Hwrite (LINEA_RES, VAR_WD, 	right, 7);	
			write(LINEA_RES, VAR_WR, 	right, 5);
			write(LINEA_RES, VAR_SHE, 	right, 5);
			write(LINEA_RES, VAR_DIR, 	right, 5);
			Hwrite (LINEA_RES, VAR_RDU, right, 6);	
			Hwrite (LINEA_RES, VAR_RDD, right, 6);	
			writeline(ARCH_RES,LINEA_RES);

		end loop;
		
		file_close(ARCH_VEC);
		file_close(ARCH_RES);  

      wait for CLK_period*10;


      wait;
   end process;

END;
