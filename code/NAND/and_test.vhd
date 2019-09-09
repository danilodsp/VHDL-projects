LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY and_test IS
PORT(
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		c : OUT STD_LOGIC
	);
END and_test;

ARCHITECTURE arquitetura_and_test OF and_test IS

	BEGIN
		c <= a AND b;

END arquitetura_and_test;