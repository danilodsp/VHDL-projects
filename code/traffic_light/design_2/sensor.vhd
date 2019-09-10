library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity sensor IS
	port(
	clock_sensor  : in std_logic; 
	dv, ph  : in std_logic; -- entrada do projeto
	saida_sensor : out std_logic -- vai para o controlador
	);
end sensor;
 
ARCHITECTURE arquitetura OF sensor IS

BEGIN
	PROCESS(clock_sensor,dv,ph)
		BEGIN
			IF (dv = '0' AND ph ='0') THEN
				saida_sensor <= '0';
			ELSIF (dv = '1' OR ph ='1') THEN
				saida_sensor <= '1';
			END IF;
	
END PROCESS;
	
END arquitetura;