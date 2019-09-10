 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 
 entity counter is port
 (
	CLOCK		 : in std_logic;
	ZERA		 :	in std_logic;
	INICIA	 : in std_logic;
	SAIDA_CONT:	out std_logic_vector (3 downto 0)

 );
 end counter;
 
 architecture projeto of counter is 
 signal conte : std_logic_vector(3 downto 0);
 begin
	
	process (CLOCK, ZERA, INICIA)
	begin
		
		if(ZERA = '1') then
		conte <= "0000";
		elsif RISING_EDGE(CLOCK) then
			if INICIA = '1' then 
			conte <= conte + 1;
			end if;
		end if;
		SAIDA_CONT <= conte;
		
	end process;
end projeto;
