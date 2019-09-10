LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

--------------------------------------------------------------

ENTITY RAM_3d IS
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
END RAM_3d;

--------------------------------------------------------------

ARCHITECTURE behv OF RAM_3d IS

TYPE ram_type_p IS ARRAY (0 TO pilha-1) OF 
	STD_LOGIC_VECTOR(width_p-1 DOWNTO 0);
TYPE ram_type_ni IS ARRAY (0 TO pilha-1) OF 
	STD_LOGIC_VECTOR(width_ni-1 DOWNTO 0);

SIGNAL tmp_ram_p: ram_type_p;
SIGNAL tmp_ram_ni: ram_type_ni;

BEGIN		   
    -- Leitura
    PROCESS(Clock, en_Read)
    BEGIN
	IF (Clock'EVENT AND Clock='1') THEN
	    IF Enable='1' THEN
		IF en_Read='1' THEN
		    Data_out_p <= tmp_ram_p(conv_integer(Read_Addr)); -- Foi utilizado um conversor de inteiro para o endereco
		    Data_out_ni <= tmp_ram_ni(conv_integer(Read_Addr)); 
		ELSE
		    Data_out_p <= (Data_out_p'RANGE => 'Z');
		    Data_out_ni <= (Data_out_ni'RANGE => 'Z');
		END IF;
	    END IF;
	END IF;
    END PROCESS;
	
    -- Escrita
    PROCESS(Clock, en_Write)
    BEGIN
	IF (Clock'EVENT AND Clock='0') THEN
	    IF Enable='1' THEN
		IF en_Write='1' THEN
		    tmp_ram_p(conv_integer(Write_Addr)) <= Data_in_p;
		    tmp_ram_ni(conv_integer(Write_Addr)) <= Data_in_ni;
		END IF;
	    END IF;
	END IF;
    END PROCESS;

END behv;
