LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

----------------------------------------------------

ENTITY counter IS

GENERIC(n: INTEGER :=6);
	PORT(	
		clock: IN STD_LOGIC;
		clear: IN STD_LOGIC;
		count: IN STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END counter;

----------------------------------------------------

ARCHITECTURE behv OF counter IS
	
SIGNAL Pre_Q: STD_LOGIC_VECTOR(n-1 DOWNTO 0);

BEGIN

    -- behavior describe the counter

    PROCESS(clock, count, clear)
    BEGIN
	IF (clear = '1') THEN
 	    Pre_Q <= "000000";
	ELSIF (clock'EVENT AND clock='0') THEN
	    IF count = '1' THEN
		Pre_Q <= Pre_Q + 1;
	    END IF;
	END IF;
    END PROCESS;
	
    -- concurrent assignment statement
    Q <= Pre_Q;

END behv;

