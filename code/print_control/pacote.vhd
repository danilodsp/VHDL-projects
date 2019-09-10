PACKAGE pacote IS

-- Contador
COMPONENT counter IS
GENERIC(n: INTEGER :=6);
	PORT(	
		clock: IN STD_LOGIC;
		clear: IN STD_LOGIC;
		count: IN STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END COMPONENT;

-- RAM_3d
COMPONENT RAM_3d IS
	GENERIC(
		width_p: INTEGER :=4; -- Largura de password
		width_ni: INTEGER :=4; -- Largura do numero de impressoes
		pilha: INTEGER :=4; -- Quantidade de dados
		addr: INTEGER :=6 -- Largura do endereço (usuário)
		);
	PORT(	
		Clock: IN STD_LOGIC;
		Enable: IN STD_LOGIC; -- Habilita a RAM
		en_Read: IN STD_LOGIC; -- Habilita a leitura
		en_Write: IN STD_LOGIC; -- Habilita a escrita
		Read_Addr: IN STD_LOGIC_VECTOR(addr-1 DOWNTO 0); -- Endereco de leitura
		Write_Addr: IN STD_LOGIC_VECTOR(addr-1 DOWNTO 0);  -- Endereco de escrita
		Data_in_p: IN STD_LOGIC_VECTOR(width_p-1 DOWNTO 0); -- Dados de entrada do password
		Data_in_ni: IN STD_LOGIC_VECTOR(width_ni-1 DOWNTO 0); -- Dados de entrada numero de impressoes
		Data_out_p: OUT STD_LOGIC_VECTOR(width_p-1 DOWNTO 0); -- Dados de saida do password
		Data_out_ni: OUT STD_LOGIC_VECTOR(width_ni-1 DOWNTO 0) -- Dados de saida numero de impressoes
	);
END COMPONENT;

-- ffd_user
COMPONENT ffd_user IS
	GENERIC(
		width: INTEGER :=6;
	);
	PORT(	
		data_in: IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
		clock: IN STD_LOGIC;
		load_user: IN STD_LOGIC;
		data_out: OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0)
	);
END COMPONENT;

-- ffd_pass
COMPONENT ffd_pass IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(	
		data_in: IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
		clock: IN STD_LOGIC;
		load_pass: IN STD_LOGIC;
		data_out: OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0)
	);
END COMPONENT;

-- ffd_ni
COMPONENT ffd_ni IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(	
		data_in: IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
		clock: IN STD_LOGIC;
		load_ni: IN STD_LOGIC;
		data_out: OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0)
	);
END COMPONENT;

-- comparador_igual
COMPONENT comparador_igual IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(
		a, b: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0); -- a(pass, ffd_pass), b(pass, RAM_3d)
		y: OUT STD_LOGIC
	);
END COMPONENT;

-- comparador_menor
COMPONENT comparador_menor IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(
		a, b: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0); -- a(numero de impressoes solicitados, MUX_3), b(numero de impressoes do usuario, RAM_3d)
		y: OUT STD_LOGIC
	);
END COMPONENT;

-- Mux_3
COMPONENT Mux_3 IS
	PORT(	
		I2: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Numero de impressoes (num_imp), 4-bits
		I1: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Senha (pass), 4-bits
		I0: IN STD_LOGIC_VECTOR(5 DOWNTO 0); -- Usuario (user), 6-bits
		sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Select
		O: OUT STD_LOGIC_VECTOR(5 DOWNTO 0) -- Saida, 6-bits
	);
END COMPONENT;

-- subtrador
COMPONENT subtrador IS
	GENERIC(
		width: INTEGER :=4;
	);
	PORT(
		a, b: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0); -- y = a - b
		y: OUT STD_LOGIC
	);
END COMPONENT;


END pacote;