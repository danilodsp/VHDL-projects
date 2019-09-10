LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controller IS
	PORT(
	clk: IN STD_LOGIC;
	reset: IN STD_LOGIC;
	at: IN STD_LOGIC; -- temporizador
	ap: IN STD_LOGIC; -- temporizador
	sa: IN STD_LOGIC; -- coração
	sv: IN STD_LOGIC; -- coração
	ta: OUT STD_LOGIC; -- temporizador
	tv: OUT STD_LOGIC; -- temporizador
	tp: OUT STD_LOGIC; -- temporizador
	pa: OUT STD_LOGIC; -- coração
	pv: OUT STD_LOGIC -- coração
	);
END controller;

ARCHITECTURE c_mp OF controller IS
TYPE estado_tipo IS (est_as, est_ra, est_ea, est_pa, est_rv, est_ev, est_pv);
SIGNAL estado: estado_tipo := est_as;

BEGIN

	PROCESS(clk,reset)
	BEGIN
	IF (reset='0') THEN
		estado <= est_as;
		
	ELSIF (clk'EVENT AND clk='0') THEN
		
		CASE estado IS
			WHEN est_as=>
				IF (sv='1' AND sa='0') THEN
					estado <= est_ra;
				ELSIF (sv='0' AND sa='1') THEN
					estado <= est_rv;
				ELSE
					estado <= est_as;
				END IF;
			WHEN est_ra=>
				estado <= est_ea;
				tp <= '0';
			WHEN est_ea=>
				IF (sa='0' AND at='0') THEN
					estado <= est_ea;
				ELSIF (sa='0' AND at='1') THEN
					estado <= est_pa;
				ELSIF (sa='1') THEN
					estado <= est_rv;
				ELSE
					estado <= est_ea;
				END IF;
			WHEN est_pa=>
				IF (at='0' AND ap='0') THEN
					estado <= est_pa;
				ELSIF (at='1') THEN
					tp <= '1';
					estado <= est_pa;
				ELSIF (ap='1') THEN
					estado <= est_rv;
				ELSE
					estado <= est_pa;
				END IF;
			WHEN est_rv=>
				estado <= est_ev;
				tp <= '0';
			WHEN est_ev=>
				IF (sv='0' AND at='0') THEN
					estado <= est_ev;
				ELSIF (sv='0' AND at='1') THEN
					estado <= est_pv;
				ELSIF (sv='1') THEN
					estado <= est_ra;
				ELSE
					estado <= est_ev;
				END IF;
			WHEN est_pv=>
				IF (at='0' AND ap='0') THEN
					estado <= est_pv;
				ELSIF (at='1') THEN
					tp <= '1';
					estado <= est_pv;
				ELSIF (ap='1') THEN
					estado <= est_ra;
				ELSE
					estado <= est_pv;
				END IF;
		END CASE;
	
	END IF;
	END PROCESS;
	
	PROCESS(estado)
	BEGIN
	
		CASE estado IS
			WHEN est_ra=>
				ta <= '1';
				tv <= '0';
				pa <= '0';
				pv <= '0';
			WHEN est_ea=>
				ta <= '1';
				tv <= '0';
				pa <= '0';
				pv <= '0';
			WHEN est_pa=>
				tv <= '0';
				ta <= '0';
				pa <= '1';
				pv <= '0';
			WHEN est_rv=>
				tv <= '1';
				ta <= '0';
				pa <= '0';
				pv <= '0';
			WHEN est_ev=>
				tv <= '1';
				ta <= '0';
				pa <= '0';
				pv <= '0';
			WHEN est_pv=>
				tv <= '0';
				ta <= '0';
				pa <= '0';
				pv <= '1';
			WHEN OTHERS =>
				ta <= '0';
				tv <= '0';
				pa <= '0';
				pv <= '0';
		END CASE;
	
	END PROCESS;

END c_mp;
