
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistroArchivo is
	 generic (
		n : integer := 16
	 );
    Port ( read_register1,read_register2 : in  STD_LOGIC_VECTOR (3 downto 0); --Selectores para cada mux
           shamt : in  STD_LOGIC_VECTOR (3 downto 0); -- Determina el corrimiento del barrel shifter
           write_register : in  STD_LOGIC_VECTOR (3 downto 0); --Contro
           write_data : in  STD_LOGIC_VECTOR (n-1 downto 0);
           wr : in  STD_LOGIC;
           she : in  STD_LOGIC;
           dir : in  STD_LOGIC; -- 
           clk,clr : in  STD_LOGIC;
           read_data1,read_data2 : inout  STD_LOGIC_VECTOR (n-1 downto 0));
end RegistroArchivo;

architecture Behavioral of RegistroArchivo is

TYPE MATRIX IS ARRAY (0 TO n-1) OF STD_LOGIC_VECTOR(n-1 DOWNTO 0);

SIGNAL R_MATRIX: MATRIX;
SIGNAL L_VECTOR       : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SIGNAL NEW_WRITE_DATA : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SIGNAL BS_WRITE_DATA : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

	COMPONENT regisotrs -- Instanciamos los registros	
	PORT(
		clk : IN     STD_LOGIC;	
		clr : IN     STD_LOGIC;		
		l   : IN     STD_LOGIC;		
		d   : IN     STD_LOGIC_VECTOR (n-1 downto 0);       		
		q   : INOUT  STD_LOGIC_VECTOR (n-1 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT Multiplexor
	
	PORT(
		
			data_0      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_1      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_2      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_3      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_4      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_5      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_6      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_7      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_8      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_9      : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_10     : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_11     : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_12     : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_13     : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_14     : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_15     : IN    STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			sel         : IN    STD_LOGIC_VECTOR(3   DOWNTO 0);
			data_out      : INOUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		
		);
	
	END COMPONENT;

	COMPONENT Demultiplexor
	
	PORT(
		
			data_in : in  STD_LOGIC;
         sel : in  STD_LOGIC_VECTOR (3 downto 0);
         data_out : inout  STD_LOGIC_VECTOR (n-1 downto 0)
		
		);
	
	END COMPONENT;
	
	
	COMPONENT Multiplexor2a1
	
			PORT(
			  data_0,data_1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           sel : in  STD_LOGIC;
           data_out : inout  STD_LOGIC_VECTOR (n-1 downto 0)
			);
			
	END COMPONENT;
	
	COMPONENT Corrimiento
	
			PORT(
			
			  data_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  shamt : in  STD_LOGIC_VECTOR (3 downto 0);
			  dir : in STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (n-1 downto 0)
		
			);
			
	END COMPONENT;
	
BEGIN

		Ciclo: FOR i IN 0 TO N-1 GENERATE

				Inst_Registro: regisotrs PORT MAP(

					clk => clk,
					clr => clr,
					l => L_VECTOR(i),
					d => NEW_WRITE_DATA,
					q => R_MATRIX(i)

				);
				
		END GENERATE Ciclo;
		
		Inst_mux_uno: Multiplexor PORT MAP(

			data_0 		=> R_MATRIX(0),
			data_1 		=> R_MATRIX(1),
			data_2 		=> R_MATRIX(2),
			data_3 		=> R_MATRIX(3),
			data_4 		=> R_MATRIX(4),
			data_5 		=> R_MATRIX(5),
			data_6 		=> R_MATRIX(6),
			data_7 		=> R_MATRIX(7),
			data_8 		=> R_MATRIX(8),
			data_9 		=> R_MATRIX(9),
			data_10 		=> R_MATRIX(10),
			data_11 		=> R_MATRIX(11),
			data_12 		=> R_MATRIX(12),
			data_13 		=> R_MATRIX(13),
			data_14 		=> R_MATRIX(14),
			data_15 		=> R_MATRIX(15),
			sel 			=> read_register1,
			data_out		=> read_data1

		);
		
		Inst_mux_dos: Multiplexor PORT MAP(

			data_0 		=> R_MATRIX(0),
			data_1 		=> R_MATRIX(1),
			data_2 		=> R_MATRIX(2),
			data_3 		=> R_MATRIX(3),
			data_4 		=> R_MATRIX(4),
			data_5 		=> R_MATRIX(5),
			data_6 		=> R_MATRIX(6),
			data_7 		=> R_MATRIX(7),
			data_8 		=> R_MATRIX(8),
			data_9 		=> R_MATRIX(9),
			data_10 		=> R_MATRIX(10),
			data_11 		=> R_MATRIX(11),
			data_12 		=> R_MATRIX(12),
			data_13 		=> R_MATRIX(13),
			data_14 		=> R_MATRIX(14),
			data_15 		=> R_MATRIX(15),
			sel 			=> read_register2,
			data_out 		=> read_data2

		);
		
		Ins_demux: Demultiplexor PORT MAP(

			data_in  => wr,
			sel   => write_register,
			data_out => L_VECTOR

		);
		
		InsMux_2a1: Multiplexor2a1 PORT MAP(

			data_0 => BS_WRITE_DATA,
			data_1 => write_data,
			sel    => she,
			data_out   => NEW_WRITE_DATA

		);
		
		InsBarrelShifter: Corrimiento PORT MAP(

			shamt  => shamt,
			dir    => dir,
			data_in    => read_data2,
			data_out   => BS_WRITE_DATA

		);

end Behavioral;

