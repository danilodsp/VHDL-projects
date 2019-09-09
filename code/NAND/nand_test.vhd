LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY nand_test IS
PORT(
		in1 : IN STD_LOGIC;
		in2 : IN STD_LOGIC;
		out1 : OUT STD_LOGIC
	);
END nand_test;

ARCHITECTURE arquitetura_nand_test OF nand_test IS

SIGNAL s1 : STD_LOGIC;

COMPONENT and_test
PORT(
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		c : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT not_test
PORT(
		x : IN STD_LOGIC;
		y : OUT STD_LOGIC
	);
END COMPONENT;

	BEGIN
		--and1: and_test PORT MAP(a => in1, b => in2, c => s1);
		--not1: not_test PORT MAP(x => s1, y => out1);
		and1: and_test PORT MAP(in1, in2, s1);
		not1: not_test PORT MAP(s1, out1);

END arquitetura_nand_test;