LIBRARY ieee;
USE ieee.std_logic.all;

------------------------------------------------------

ENTITY c_cci IS
	PORT(
	clear: IN STD_LOGIC; -- clear externo (limpa tudo)
	reset: IN STD_LOGIC; -- reset externo (volta pro primeiro estado)
	clock: IN STD_LOGIC; -- clock
	en_inicio: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- entrada externa
	confirm: IN STD_LOGIC; -- confirma entradas externas
	result_comp: IN STD_LOGIC; -- comparador_igual
	result_comp_menor: IN STD_LOGIC; -- comparador_menor
	count: OUT STD_LOGIC; -- counter
	clear_counter: OUT STD_LOGIC; -- counter
	load_user: OUT STD_LOGIC; -- ffd_user
	enable_ram: OUT STD_LOGIC; -- RAM_3d
	en_read_ram: OUT STD_LOGIC; -- RAM_3d
	en_write_ram: OUT STD_LOGIC; -- RAM_3d
	sel: OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- MUX_3
	load_pass: OUT STD_LOGIC; -- ffd_pass
	load_ni: OUT STD_LOGIC -- ffd_ni
	);
END c_cci;

------------------------------------------------------

ARCHITECTURE controller OF c_cci IS

TYPE estad_tipo IS (e0, e1, e2, e3, e4, e5);
SIGNAL estado: estado_tipo :=e0;

BEGIN
clear_counter <= '1';

	PROCESS(clear, reset, clock, en_inicio)
	BEGIN
	
	IF (clear = '1') THEN
	estado <= e0;
	clear_counter <= '1';
	ELSE
	
	IF (reset = '1') THEN
	estado <= e0;
	ELSIF (clock'EVENT AND clock='1') THEN
		CASE estado IS
			WHEN e0 =>
				IF (en_inicio = "01") THEN
				load_user <= '1';
				count <= '1';
				estado <= e1;
				ELSIF (en_inicio = "00") THEN
				load_user <= '0';
				count <= '0';
				estado <= e2;
				ELSE
				estado <= e0;
			WHEN e1 =>
				enable_ram <= '1';
				en_write_ram <= '1';
				estado <= e0;
			WHEN e2 =>
				IF (confirm='1') THEN
				sel <= "00";
				enable_ram <= '1';
				en_read_ram <= '1';
				estado <= e3;
				ELSE
				estado <= e2;
				END IF;
			WHEN e3 =>
				IF (confirm='1') THEN
				sel <= "01";
				load_pass <= '1';
				load_ni <= '1';
				estado <= e4;
				ELSE
				estado <= e3;
				END IF;
			WHEN e4 =>
				IF (confirm='1') THEN
				sel <= "10";
				estado <= e5;
				ELSE
				estado <= e4;
				END IF;
			WHEN e5 =>
				IF ((result_comp='1') AND (result_comp_menor='1')) THEN
				enable_ram <= '1';
				en_writer_ram <= '1';
				estado <= e0;
		END CASE;
	END IF;
	
	END IF;
	END PROCESS;

END controller;