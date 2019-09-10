LIBRARY ieee ;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;      
USE ieee.std_logic_unsigned.ALL;  

ENTITY  mux IS
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
END mux;

ARCHITECTURE arquitetura OF mux IS

	BEGIN 

	PROCESS(ent1, ent2, ent3)
	BEGIN

		IF (ent1='0' AND ent2='0'AND ent3='0') THEN
		 output0 <= '0'; output1 <= '0'; output2 <= '0'; output3 <= '1'; 
		ELSIF (ent1='0' AND ent2='0'AND ent3='1') THEN
		 output0 <= '0'; output1 <= '0'; output2 <= '1'; output3 <= '1'; 
		ELSIF (ent1='0' AND ent2='1'AND ent3='0') THEN
		 output0 <= '0'; output1 <= '1'; output2 <= '0'; output3 <= '1';
		ELSIF (ent1='0' AND ent2='1'AND ent3='1') THEN
		 output0 <= '1'; output1 <= '1'; output2 <= '1'; output3 <= '1';
		ELSIF (ent1='1' AND ent2='0'AND ent3='0') THEN
		 output0 <= load0; output1 <= load1; output2 <= load2; output3 <= load3;
		END IF;

	END PROCESS;

END arquitetura;
