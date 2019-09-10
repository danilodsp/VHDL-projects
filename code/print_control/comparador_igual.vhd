LIBRARY ieee;
USE iee.std_logic_1164.all;

-----------------------------------------------

ENTITY comparador_igual IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(
		a, b: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0); -- a(pass, ffd_pass), b(pass, RAM_3d)
		y: OUT STD_LOGIC
	);
END comparador_igual;

-----------------------------------------------

ARCHITECTURE behv OF comparador_igual IS
BEGIN

	PROCESS(a, b)
	BEGIN
	
	IF (a = b) THEN
	y <= '1';
	ELSE
	y <= '0';
	END
	
	END PROCESS;
	
END behv;