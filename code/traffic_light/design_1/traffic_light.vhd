 'library IEEE;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 
 entity traffic_light is port
 (
	CLOCK  : in std_logic;
	PH		 : in std_logic;
	DV		 : in std_logic;
	SINAL_H:out std_logic_vector (2 downto 0);
	SINAL_V:out std_logic_vector (2 downto 0) 
 );
 end traffic_light;
 
 architecture projeto of traffic_light is
 
 component datapath is port
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
 end component;
  
 component controlador is port
 (
	CLOCK     : in std_logic;
	X			 : in std_logic;
	COMPA_DATA: in std_logic;
	VETOR_SAIDA: out std_logic_vector (11 downto 0) 
   --SEL_DATA(1), SEL_DATA(0), INI_DATA, ZERA_DATA, RESET_DATA, INI_CONT12,--
	--SINAL_H(2), SINAL_H(1), SINAL_H(0), SINAL_V(2), SINAL_V(1), SINAL_V(0)--
 );


 end component;


component gerador_clock is

 port(
  clock_in  : in std_logic;
  count     : buffer std_logic_vector(3 downto 0):="0000";
  clock_out : out std_logic);

 end component;
 
 signal c, d, e, f, g, h, sgn_clock: std_logic;
 signal s: std_logic_vector (1 downto 0);
 begin
 
 sinal_datapath : datapath port map (CLOCK=>sgn_clock, SEL_CON(1)=> s(1), SEL_CON(0)=> s(0), INI_CON=>c, ZERA_CON=>d, RESET_CON=>e
  , PH=>PH, DV=>DV, X=>f, INI_CON12=>g, COMPA_CON=>h);
 
sinal_controlador: controlador port map (CLOCK=>sgn_clock, X=>f, COMPA_DATA=>h, VETOR_SAIDA(11)=>s(1), VETOR_SAIDA(10)=>s(0),
 VETOR_SAIDA(9)=>c, VETOR_SAIDA(8)=>d, VETOR_SAIDA(7)=>e, VETOR_SAIDA(6)=>g, VETOR_SAIDA(5)=>SINAL_H(2),VETOR_SAIDA(4)=>SINAL_H(1),VETOR_SAIDA(3)=>SINAL_H(0), VETOR_SAIDA(2)=>SINAL_V(2),VETOR_SAIDA(1)=>SINAL_V(1),VETOR_SAIDA(0)=>SINAL_V(0));

sinal_dclock : gerador_clock port map (clock_in => CLOCK, clock_out => sgn_clock);	 
end projeto;
 
