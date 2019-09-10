LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY comparator IS
	PORT ( 
		V1, V2, V3, V4 : IN STD_LOGIC ; -- Estas entradas são valores da saida do contador
		out_comp : OUT STD_LOGIC -- caso esta saida seja 1 ele chegou ao fim da contagem no caso zero
		--esta saida vai para o controlador
		---x: in std_logic_vector(1 DOWNTO 0);		
		) ;
END comparator ;

ARCHITECTURE arquitetura OF comparator IS
	BEGIN
	PROCESS ( V1,V2,V3,V4 )
		BEGIN
		IF ((V1 = '0') and (V2 = '0') and (V3 = '0') and (V4 = '0') ) THEN
			out_comp <= '1';
		ELSE 
			out_comp <= '0';
		END IF ;
	END PROCESS ;
END arquitetura;
