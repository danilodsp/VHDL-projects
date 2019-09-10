LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.package_pm.all;

ENTITY pacemaker IS
	PORT(
	clk: IN STD_LOGIC;
	reset: IN STD_LOGIC;
	sa: IN STD_LOGIC;
	sv: IN STD_LOGIC;
	pa: OUT STD_LOGIC;
	pv: OUT STD_LOGIC
	);
END pacemaker;

ARCHITECTURE arq_mc OF pacemaker IS
SIGNAL clock: STD_LOGIC;
SIGNAL at: STD_LOGIC;
SIGNAL ap: STD_LOGIC;
SIGNAL ta: STD_LOGIC;
SIGNAL tv: STD_LOGIC;
SIGNAL tp: STD_LOGIC;

BEGIN

	u0: div_clock PORT MAP(clk, clock);
	u1: controller PORT MAP(clock, reset, at, ap, sa, sv, ta, tv, tp, pa, pv);
	u2: temp PORT MAP(clock, ta, tv, tp, at, ap);

END arq_mc;
