LIBRARY ieee;
USE iee.std_logic_1164.all;

-----------------------------------------------

ENTITY subtrador IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(
		a, b: IN STD_LOGIC_VECTOR(width-1 DOWNTO 0); -- y = a - b
		y: OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0); -- saida
	);
END subtrador;

-----------------------------------------------

ARCHITECTURE behv OF subtrador IS
BEGIN

	PROCESS(a, b)
	BEGIN
	
	y <= (a XOR (NOT B)) XOR "1111";
	
	END PROCESS;
	
END behv;