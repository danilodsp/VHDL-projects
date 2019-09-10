LIBRARY ieee;
USE iee.std_logic_1164.all;

-----------------------------------------------

ENTITY comparador_menor IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(
		a, b: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0); -- a(numero de impressoes solicitados, MUX_3), b(numero de impressoes do usuario, RAM_3d)
		y: OUT STD_LOGIC
	);
END comparador_menor;

-----------------------------------------------

ARCHITECTURE behv OF comparador_menor IS
BEGIN

	PROCESS(a, b)
	BEGIN
	
	IF ((a < b) OR (a = b)) THEN
	y <= '1';
	ELSE
	y <= '0';
	END
	
	END PROCESS;
	
END behv;