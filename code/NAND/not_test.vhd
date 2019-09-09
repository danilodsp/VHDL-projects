LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY not_test IS
PORT(
		x : IN STD_LOGIC;
		y : OUT STD_LOGIC
	);
END not_test;

ARCHITECTURE arquitetura_not_test OF not_test IS

	BEGIN
		y <= not x;

END arquitetura_not_test;