 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 
 entity controller is port
 (
	CLOCK     : in std_logic;
	X			 : in std_logic;
	COMPA_DATA: in std_logic;
	VETOR_SAIDA: out std_logic_vector (11 downto 0) 
--SEL_DATA(1), SEL_DATA(0), INI_DATA, ZERA_DATA, RESET_DATA, INI_CONT12, SINAL_H(2), SINAL_H(1), SINAL_H(0), SINAL_V(2), SINAL_V(1), SINAL_V(0)--
 );
 end controller;
 
 architecture projeto of controller is
 
 type estados is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9);
 signal estado_atual: estados;
 signal estado_antes: estados;
 
 
 begin
 
 
		process (CLOCK)
		begin
		if rising_edge (CLOCK) then
				case estado_atual is
				
				when E0 => estado_atual <= E1;
							  estado_antes <= E0;
				
				when E1 => if    COMPA_DATA = '0' then estado_atual <= E1;
							  elsif COMPA_DATA = '1' then estado_atual <= E2;
							  end if;
							  estado_antes <= E1;
							  
				when E2 => if    X = '0' then estado_atual <= E3;
							  elsif X = '1' then estado_atual <= E5;
							  end if;
							  estado_antes <= E2;
							  
				when E3 => if    COMPA_DATA = '0' then estado_atual <= E3;
							  elsif COMPA_DATA = '1'then estado_atual <= E4;
							  end if;
							  estado_antes <= E3;
							  
				when E4 => if    X = '0' then estado_atual <= E3;
				           elsif X = '1' then estado_atual <= E5;
							  end if;
							  estado_antes <= E4;
							  
				when E5 => if    COMPA_DATA = '0' then estado_atual <= E5;
							  elsif COMPA_DATA = '1' then estado_atual <= E6;
							  end if;
							  estado_antes <= E5;
							  
				when E6 => estado_atual <= E7;
							  estado_antes <= E6;
							  
				when E7 => if    COMPA_DATA = '0' then estado_atual <= E7;
							  elsif COMPA_DATA = '1' then estado_atual <= E8;
							  end if;
							  estado_antes <= E7;
							  
				when E8 => estado_atual <= E9;
							  estado_antes <= E8;
							  
				when E9 => if    COMPA_DATA = '0' then estado_atual <= E9;
							  elsif COMPA_DATA = '1' then estado_atual <= E0;
							  end if;
							  estado_antes <= E9;
				end case;
		 end if;
		 end process;
		 
		 process (estado_atual,estado_antes)
				begin
					case estado_atual is
					
						when E0 =>
							VETOR_SAIDA <= "000110001010";							
							
						when E1 =>
							VETOR_SAIDA <= "001000100001";
							
						when E2 =>
							VETOR_SAIDA <= "000100100001";
							
					   when E3 =>
							VETOR_SAIDA <= "011001100001";
							
					   when E4 =>
							VETOR_SAIDA <= "010101100001";
							
						when E5 =>
							VETOR_SAIDA <= "101001010001";
						
						when E6 =>
							VETOR_SAIDA <= "100101010001";
							
						when E7 =>
							VETOR_SAIDA <= "111001001100";
							
						when E8 =>
							VETOR_SAIDA <= "110101001100";
							
						when E9 =>
							VETOR_SAIDA <= "101001001010";
					end case;
			end process;
	end projeto;
						
