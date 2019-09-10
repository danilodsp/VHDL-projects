 library ieee;
 use ieee.std_logic_1164.all;

 entity mux4x1 is port
 (
	SEL : in  STD_LOGIC_VECTOR (1 downto 0);
   SAIDA_MUX   : out STD_LOGIC_VECTOR (3 downto 0)
 
 );
 end mux4x1;
 
 architecture mux of mux4x1 is
 begin
	with SEL select
    SAIDA_MUX <= "1110" when "00",
					  "0010" when "01",
					  "0000" when "10",
					  "0100" when "11",
					  "0000" when others;
 
 
 end mux;
