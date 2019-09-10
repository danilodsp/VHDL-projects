 library ieee;
 use ieee.std_logic_1164.all;
 
 entity 	comparator is port
 (   
	ENT_CONT : in std_logic_vector (3 downto 0);
	ENT_MUX  : in std_logic_vector (3 downto 0);
	SAIDA_COMP 	 : out std_logic
 
 );
 end comparator;
 
 architecture projeto of comparator is
 begin
 
	process ( ENT_CONT (0), ENT_CONT(1), ENT_CONT (2), ENT_CONT(3), ENT_MUX (0), ENT_MUX (1), ENT_MUX (2), ENT_MUX (3))
	begin
		if ((ENT_CONT(0)= ENT_MUX(0))and(ENT_CONT(1)= ENT_MUX(1))and(ENT_CONT(2)= ENT_MUX(2))and(ENT_CONT(3)= ENT_MUX(3))) then
		SAIDA_COMP <= '1';
		else
		SAIDA_COMP <= '0';
		end if;
	end process;
end projeto;
		
	
