library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY datapath IS
	PORT(
		Sel1 : IN std_logic;
		Sel2 : IN std_logic;
		Sel3 : IN std_logic;
		clock_datapath : IN std_logic;
		reset_in : IN std_logic;
		load_datapath: IN std_logic;
		dv_in, ph_in : IN std_logic;
		saidaComparador : OUT std_logic;
		saidaSensores : OUT std_logic
	);
END datapath;

ARCHITECTURE estrutura OF datapath IS

COMPONENT counter is
	PORT(
		clock_cont : IN std_logic;
		reset_cont: IN std_logic;
		load_cont: IN std_logic;
		ent1,ent2,ent3,ent4: IN std_logic;
		SCont1,SCont2,Scont3,Scont4 : OUT std_logic
	  );
END COMPONENT;

COMPONENT comparator IS
	PORT ( 
		V1, V2, V3, V4 : IN STD_LOGIC ;
		out_comp : OUT STD_LOGIC
		);
END COMPONENT ;

COMPONENT  mux IS
   PORT (
		ent1: IN  STD_LOGIC;
		ent2: IN  STD_LOGIC;
		ent3: IN  STD_LOGIC;
		load0: IN  STD_LOGIC;
		load1: IN  STD_LOGIC;
		load2: IN  STD_LOGIC;
		load3: IN  STD_LOGIC;	
		output0: OUT STD_LOGIC;
		output1: OUT STD_LOGIC;
		output2: OUT STD_LOGIC;
		output3: OUT STD_LOGIC
        );
END COMPONENT;

COMPONENT sensor IS
	port(
		clock_sensor  : in std_logic;	
		dv, ph  : in std_logic; 
		saida_sensor : out std_logic
	);
end COMPONENT;

	SIGNAL s1,s2,s3,s4,s5,s6,s7,s8,s9,s10 : std_logic;

	BEGIN
		
		Contador_datapath : counter port map(
		clock_datapath,
		reset_in,
		load_datapath,
		s1,s2,s3,s4, -- entradas
		s5,s6,s7,s8 -- saidas 
	  );
	  
	Comparador_datapath : comparator port map( 
		s5,s6,s7,s8,
		saidaComparador
		);

	mux_datapath : mux port map(
		sel1,sel2,sel3,
		s5,s6,s7,s8,
		s1,s2,s3,s4
        );
	sensor_datapath : sensor port map(
		clock_datapath,	
		dv_in, ph_in, 
		saidaSensores
	);
		  
end estrutura;
