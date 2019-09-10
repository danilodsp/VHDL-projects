library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter is
PORT(
		clock_cont : IN std_logic;
		reset_cont: IN std_logic;
		load_cont: IN std_logic;
		ent1,ent2,ent3,ent4: IN std_logic;
		SCont1,SCont2,Scont3,Scont4 : OUT std_logic
	  );
END counter;

ARCHITECTURE arquitetura OF counter IS
SIGNAL counter : std_logic_vector(3 DOWNTO 0);
	BEGIN
	PROCESS(clock_cont,reset_cont)
		BEGIN
		IF(reset_cont = '1') THEN 
			counter(0)<='1';
			counter(1)<='1';
			counter(2)<='1';
			counter(3)<='1';
		ELSIF (RISING_EDGE(clock_cont)) THEN
			IF (load_cont = '1') THEN
			counter(0)<=ent1;
			counter(1)<=ent2;
			counter(2)<=ent3;
			counter(3)<=ent4;
			counter <= counter - 1;
			END IF;
		END IF;

	  Scont1 <= counter(0);
	  Scont2 <= counter(1);
	  Scont3 <= counter(2);
	  Scont4 <= counter(3);

	  END PROCESS;

END arquitetura;
