LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY temp IS
	GENERIC(
	cont1: INTEGER := 20; -- 20ms
	cont2: INTEGER := 200; -- 200ms
	cont3: INTEGER := 600 -- 600ms
	);
	PORT(
	clk: IN STD_LOGIC; -- 1KHz
	ta: IN STD_LOGIC;
	tv: IN STD_LOGIC;
	tp: IN STD_LOGIC;
	at: OUT STD_LOGIC;
	ap: OUT STD_LOGIC
	);
END temp;

ARCHITECTURE arq_cont OF temp IS
SIGNAL saida : STD_LOGIC;

BEGIN

	PROCESS(clk, ta, tv, tp)
	VARIABLE cont: INTEGER := 0;
	BEGIN
	IF (clk'EVENT AND clk='1') THEN
	
	IF (tp = '1' AND cont < cont1) THEN
	cont := cont + 1;
	ap <= '0';
	ELSIF (ta = '1' AND cont < cont2) THEN
	cont := cont + 1;
	at <= '0';
	ELSIF (tv = '1' AND cont < cont3) THEN
	cont := cont + 1;
	at <= '0';
	ELSIF (tp = '1' AND cont = cont1) THEN
	ap <= '1';
	cont := 0;
	ELSIF (ta = '1' AND cont = cont2) THEN
	at <= '1';
	cont := 0;
	ELSIF (tv = '1' AND cont = cont3) THEN
	at <= '1';
	cont := 0;
	ELSE
	at <= '0';
	ap <= '0';
	cont :=0;
	END IF;
		
	END IF;
	
	END PROCESS;
	
END arq_cont;
