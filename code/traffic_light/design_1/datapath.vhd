 library ieee;
 use ieee.std_logic_1164.all;
 
 entity datapath is port
 (
	CLOCK		 : in std_logic;
	SEL_CON   : in std_logic_vector (1 downto 0);
	INI_CON	 : in std_logic;
	ZERA_CON	 : in std_logic;
	RESET_CON : in std_logic;
	PH 		 : in std_logic;
	DV 		 : in std_logic;
	X  		 :out std_logic;
	INI_CON12 : in std_logic;
	COMPA_CON :out std_logic 
 );
 end datapath;
 
 architecture projeto of datapath is
 
 component mux4x1 is
 port
 (
	SEL : in  STD_LOGIC_VECTOR (1 downto 0);
   SAIDA_MUX   : out STD_LOGIC_VECTOR (3 downto 0)
 
 );
 end component;
 
 component contador is
 port
 (
	CLOCK		 : in std_logic;
	ZERA		 :	in std_logic;
	INICIA	 : in std_logic;
	SAIDA_CONT:	out std_logic_vector (3 downto 0)

 );
 end component;
 
 component comparador is
 port
 (   
	ENT_CONT : in std_logic_vector (3 downto 0);
	ENT_MUX  : in std_logic_vector (3 downto 0);
	SAIDA_COMP 	 : out std_logic
 
 );
 end component;
 
 component botao is
 port
 (
	CLOCK  : in std_logic;
	RESET	 : in std_logic;
	DV		 : in std_logic;
	PH		 : in std_logic;
	INI_CON: in std_logic;
	X		 :out std_logic 
 
 );
 end component;
 
 signal S1 : std_logic_vector (3 downto 0);
 signal S2 : std_logic_vector (3 downto 0);
 
 begin
 sinal_mux :  mux4x1     port map (SEL_CON, S1);
 sinal_cont:  contador   port map (CLOCK, ZERA_CON, INI_CON, S2);
 sinal_comp:  comparador port map (S2, S1, COMPA_CON);
 sinal_botao: botao 		 port map (CLOCK, RESET_CON, DV, PH, INI_CON12, X);
 
 end projeto;
