LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE package_pm IS

COMPONENT controller IS
	PORT(
	clk: IN STD_LOGIC;
	reset: IN STD_LOGIC;
	at: IN STD_LOGIC; -- temp
	ap: IN STD_LOGIC; -- temp
	sa: IN STD_LOGIC; -- heart
	sv: IN STD_LOGIC; -- heart
	ta: OUT STD_LOGIC; -- temp
	tv: OUT STD_LOGIC; -- temp
	tp: OUT STD_LOGIC; -- temp
	pa: OUT STD_LOGIC; -- heart
	pv: OUT STD_LOGIC -- heart
	);
END COMPONENT;

COMPONENT temp IS
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
END COMPONENT;

COMPONENT div_clock IS
	PORT(
	clock_in: IN STD_LOGIC; -- 50MHz
	clock_out: OUT STD_LOGIC -- 1KHz
	);
END COMPONENT;

END package_pm;
