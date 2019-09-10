LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity traffic_light IS
port( 
		dvs, phs : IN std_logic;
		clock_de_entrada, reset_entrada : IN std_logic;
		RedH, YellowH, GreenH, RedV, YellowV, GreenV : out std_logic
		);
END traffic_light;

ARCHITECTURE arquitetura OF traffic_light IS

COMPONENT datapath IS
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
END COMPONENT;

COMPONENT controller IS
	PORT (
		clock_controller : IN STD_LOGIC;
		resultSensor : IN STD_LOGIC; 
		resultComparador : IN STD_LOGIC; 
		reset_controller : OUT STD_LOGIC;
		load_controller : OUT STD_LOGIC;	
		seletor1_mux : OUT STD_LOGIC; 
		seletor2_mux : OUT STD_LOGIC; 
		seletor3_mux : OUT STD_LOGIC;
		Hg, Hy, Hr, Vg, Vy, Vr: OUT STD_LOGIC ); 
END COMPONENT;

COMPONENT clk_traffic_light is
	PORT (
		clk,reset: in std_logic;
		clock_out: out std_logic);
END COMPONENT;

	SIGNAL sinal1,sinal2,sinal3,sinal4,sinal5,sinal6,sinal7,sinal8: std_logic;
	
	BEGIN
	
clock : clk_traffic_light PORT MAP (
	clock_de_entrada, 
	reset_entrada,
	sinal1
);
	
controller_traffic_light: controller PORT MAP(
	sinal1, -- clock_controller
	sinal2, -- 		resultSensor
	sinal3, -- resultComparador
	sinal8,  -- reset_controller
	sinal4, -- load_controller
	sinal5, -- seletor1_mux
	sinal6, -- seletor2_mux
	sinal7, -- seletor3_mux
	GreenH, YellowH, RedH, GreenV, YellowV, RedV	
); 

datapath_traffic_light: datapath PORT MAP(
		sinal5, -- Sel1
		sinal6, -- Sel2
		sinal7, -- Sel3 
		sinal1, -- clock_datapath
		sinal8, -- reset_in
		sinal4, -- load_datapath
		dvs, phs,
		sinal3,
		sinal2

	);

END arquitetura;
