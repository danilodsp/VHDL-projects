library ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY clock IS
	port ( clk,reset: in std_logic;
				clock_out: out std_logic
);
END clock;
 
ARCHITECTURE arquitetura OF clock IS
	BEGIN
	PROCESS(clk,reset)
		VARIABLE COUNT : INTEGER:=0;
		VARIABLE TEMP : STD_LOGIC:='0';
		BEGIN
		IF reset='1' THEN
			COUNT:=0;
			TEMP:='0';
		ELSIF RISING_EDGE(clk)THEN
			COUNT:=COUNT+1;
			IF COUNT=25000000 THEN
				TEMP:=NOT TEMP;
				COUNT:=0;
			END IF;
		END IF;
		clock_out<=TEMP;
	END PROCESS;
END arquitetura;
