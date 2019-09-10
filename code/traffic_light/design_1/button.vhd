 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 
 entity button is port
 (
	CLOCK  : in std_logic;
	RESET	 : in std_logic;
	DV		 : in std_logic;
	PH		 : in std_logic;
	INI_CON: in std_logic;
	X		 :out std_logic 
  
 );
 end button;
 
 architecture projeto of button is
 
 component counter is port
 (
	CLOCK		 : in std_logic;
	ZERA		 :	in std_logic;
	INICIA	 : in std_logic;
	SAIDA_CONT:	out std_logic_vector (3 downto 0)

 );
 end component;
 
 component flipflop_JK is port
 ( 
	j:   in std_logic;
	k:   in std_logic;
	clk: in std_logic;
	reset: in std_logic;
	q:   out std_logic
);
end component;
 
 signal and_out, K1, teste,f : std_logic;
 signal s : std_logic_vector (3 downto 0);
 
 begin
 K1 <= '0';
 
 
 SAIDA_JK : flipflop_JK port map (q => teste, reset => RESET, clk => CLOCK, j => and_out, k=> K1);
 SAIDA_CONTADOR: counter port map (CLOCK, RESET, INI_CON, s);

   process(CLOCK,RESET,DV,PH)
	begin

		if(CLOCK ='1' and CLOCK'event) then
			if	(DV='1' OR PH='1') then
					and_out<='1';
				else 
					and_out<='0';
			end if;
		end if;
	if (s>"0111") then
		f<='1';
	else
		f<='0';
	end if;
	end process;
	
	
	X <= teste or DV or PH or and_out or f;
	
end projeto;
 
