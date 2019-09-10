LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY div_clock IS
	PORT(
	clock_in: IN STD_LOGIC; -- 50MHz
	clock_out: OUT STD_LOGIC -- 1KHz
	);
END div_clock;

ARCHITECTURE arq_dc OF div_clock IS
SIGNAL clock: STD_LOGIC := '0';
CONSTANT temp: INTEGER := 25000;
BEGIN

	PROCESS(clock_in)
	VARIABLE cont: INTEGER := 0;
	BEGIN
	
	IF (clock_in'EVENT AND clock_in='1') THEN
	
		IF (cont < temp) THEN
		cont := cont + 1;
		ELSE
			cont := 0;
			IF (clock='1') THEN
			clock <= '0';
			ELSE
			clock <= '1';
			END IF;
		END IF;
	
	END IF;
	
	END PROCESS;
	clock_out <= clock;

END arq_dc;