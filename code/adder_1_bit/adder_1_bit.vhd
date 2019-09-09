LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY adder_1_bit IS
PORT (
		x: IN std_logic;
		y: IN std_logic;
		cin: IN std_logic;
		s: OUT std_logic;
		cout: OUT std_logic
);
END adder_1_bit;

ARCHITECTURE arch_adder_1_bit OF adder_1_bit IS

	BEGIN
		s <= x XOR y XOR cin;
		cout <= (x AND y) OR (x AND cin) OR (y AND cin);
		
END arch_adder_1_bit;