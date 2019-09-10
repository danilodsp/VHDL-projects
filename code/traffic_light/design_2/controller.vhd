library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY controller IS
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
END controller;

ARCHITECTURE arquitetura OF controller IS
	TYPE estados IS (estado00, estado01, estado02, estado03, estado04, estado05, estado06, estado07);
	SIGNAL estado_atual: estados := estado00;
	SIGNAL estado_anterior: estados;
	
	BEGIN
	PROCESS(clock_controller)
		BEGIN
			IF RISING_EDGE(clock_controller) THEN
				case estado_atual IS 
					WHEN estado00 => -- inicial
						estado_atual <= estado01;
						estado_anterior <= estado00;
					WHEN estado01 => -- 16 segundos
						IF (resultSensor = '1' AND resultComparador = '1') THEN
							estado_atual <= estado05;
							estado_anterior <= estado01;							
						ELSIF (resultSensor = '0' AND resultComparador = '1') THEN
							estado_atual <= estado02; 
							estado_anterior <= estado01;							
						END IF;
					WHEN estado02 => -- 1º vez 4 segunos
						IF (resultSensor = '1' AND resultComparador = '1') THEN
							estado_atual <= estado05;
							estado_anterior <= estado02;							
						ELSIF (resultSensor = '0' AND resultComparador = '1') THEN
							estado_atual <= estado03; 
							estado_anterior <= estado02;							
						END IF;
					WHEN estado03 => -- 2º vez 4 segunos
						IF (resultSensor = '1' AND resultComparador = '1') THEN
							estado_atual <= estado05;
							estado_anterior <= estado03;							
						ELSIF (resultSensor = '0' AND resultComparador = '1') THEN
							estado_atual <= estado04; 
							estado_anterior <= estado03;							
						END IF;
					WHEN estado04 => -- 3º vez 4 segunos
						IF (resultComparador = '1') THEN
							estado_atual <= estado05;
							estado_anterior <= estado04;
						END IF;
					WHEN estado05 =>
						IF (resultComparador = '1') THEN -- 2 segunos
							estado_atual <= estado06; 
							estado_anterior <= estado05;
						END IF;
					WHEN estado06 => -- 6 segunos
						IF (resultComparador = '1') THEN
							estado_atual <= estado07; 
							estado_anterior <= estado06;
						END IF;
					WHEN estado07 => -- 2 segunos
						IF (resultComparador = '1') THEN
							estado_atual <= estado00; 
							estado_anterior <= estado07;
						END IF;
				END CASE;
		END IF;		
	END PROCESS;

	PROCESS(estado_atual, estado_anterior)
		BEGIN
			CASE estado_atual IS
				WHEN estado00 =>
					reset_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '1';
					seletor3_mux <= '1';
					Hr <= '0'; Hy <= '0'; Hg <= '1';
					Vr <= '1'; Vy <= '0'; Vg <= '0';
					
				WHEN estado01 =>				
					Hr <= '0'; Hy <= '0'; Hg <= '1';
					Vr <= '1'; Vy <= '0'; Vg <= '0';
					load_controller <= '1';					
					seletor1_mux <= '1';
					seletor2_mux <= '0';
					seletor3_mux <= '0';
					
				WHEN estado02 =>  -- 1º vez conta 4 segundos
					Hr <= '0'; Hy <= '0'; Hg <= '1';
					Vr <= '1'; Vy <= '0'; Vg <= '0';	
					load_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '0';
					seletor3_mux <= '1';
					
				WHEN estado03 =>	-- 2º vez conta 4 segundos
					Hr <= '0'; Hy <= '0'; Hg <= '1';
					Vr <= '1'; Vy <= '0'; Vg <= '0';
					load_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '0';
					seletor3_mux <= '1';
					
				WHEN estado04 =>	-- 3º vez conta 4 segundos
					Hr <= '0'; Hy <= '0'; Hg <= '1';
					Vr <= '1'; Vy <= '0'; Vg <= '0';	
					load_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '0';
					seletor3_mux <= '1';
					
				WHEN estado05 => -- 2 segundos
					Hr <= '0'; Hy <= '1'; Hg <= '0';
					Vr <= '1'; Vy <= '0'; Vg <= '0';	
					load_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '0';
					seletor3_mux <= '0';
					
				WHEN estado06 => -- 6 segundos
					Hr <= '1'; Hy <= '0'; Hg <= '0';
					Vr <= '0'; Vy <= '1'; Vg <= '0';	
					load_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '1';
					seletor3_mux <= '0';
						
				WHEN estado07 => -- 2 segundos
					Hr <= '1'; Hy <= '0'; Hg <= '0';
					Vr <= '0'; Vy <= '1'; Vg <= '0';	
					load_controller <= '1';
					seletor1_mux <= '0';
					seletor2_mux <= '0';
					seletor3_mux <= '0';

			END CASE;
		END PROCESS;
		
END arquitetura;
