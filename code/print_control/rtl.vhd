LIBRARY ieee;
USE ieee.std_logic.all;
USE work.pacote.all;

------------------------------------------------------

ENTITY rtl IS
	PORT(
	-- entradar do datapath
	num_imp: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	pass: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	user: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	-- entradas do controlador
	clear: IN STD_LOGIC;
	reset: IN STD_LOGIC;
	clock: IN STD_LOGIC;
	en_inicio: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	confirm: IN STD_LOGIC;
	-- saida
	Z: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END rtl;

------------------------------------------------------

ARCHITECTURE cci OF rtl IS
COMPONENT c_cci IS
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
END COMPONENT;

SIGNAL tmp_ffd_user: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL tmp_addr_ram: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL tmp_ffd_pass: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL tmp_ffd_ni: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL data_in_p: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL data_in_ni: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL data_out_p: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL data_out_ni: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL saida_mux: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL tmp_igual: STD_LOGIC;
SIGNAL tmp_menor: STD_LOGIC;
SIGNAL count: STD_LOGIC;
SIGNAL clear_count: STD_LOGIC;
SIGNAL load_user: STD_LOGIC;
SIGNAL load_pass: STD_LOGIC;
SIGNAL load_ni: STD_LOGIC;
SIGNAL enable_ram: STD_LOGIC;
SIGNAL en_read_ram: STD_LOGIC;
SIGNAL en_write_ram: STD_LOGIC;
SIGNAL sel: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL load_pass: STD_LOGIC;
SIGNAL load_ni: STD_LOGIC;
SIGNAL saida_sub: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

	u0: counter PORT MAP(clock, clear_counter, count, tmp_ffd_user);
	u1: RAM_3d PORT MAP(clock, enable_ram, en_read_ram, en_write_ram, tmp_addr_ram, tmp_ffd_user, Data_in_p, Data_in_ni, Data_out_p,	Data_out_ni);
	u2: ffd_user PORT MAP(tmp_ffd_user, clock, load_user, tmp_addr_ram);
	u3: Mux_3 PORT MAP(num_imp, pass, user, sel, saida_mux);
	u4: ffd_pass PORT MAP(saida_mux(3 DOWNTO 0), clock, load_pass, tmp_ffd_pass);
	u5: ffd_ni PORT MAP(data_out_ni, clock, load_ni, tmp_ffd_ni);
	u6: comparador_igual PORT MAP(tmp_ffd_pass, tmp_ffd_ni, tmp_igual);
	u7: comparador_menor PORT MAP(saida_mux(3 DOWNTO 0), tmp_ffd_ni, tmp_menor);
	u8: subtrador PORT MAP(saida_mux(3 DOWNTO 0), tmp_ffd_ni, saida_sub);
	u9: c_cci PORT MAP(clear, reset, clock, en_inicio, confirm, tmp_igual, tmp_menor, count, clear_counter, load_user, enable_ram, en_read_ram, en_write_ram, sel, load_pass, load_ni);
	
	result_comp <= tmp_igual;
	result_comp_menor <= tmp_menor;
	Z <= saida_sub;

END cci;