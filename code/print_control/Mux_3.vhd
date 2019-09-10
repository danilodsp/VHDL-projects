LIBRARY ieee;
USE ieee.std_logic_1164.all;

-------------------------------------------------

ENTITY Mux_3 IS
	PORT(	
		I2: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Numero de impressoes (num_imp), 4-bits
		I1: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Senha (pass), 4-bits
		I0: IN STD_LOGIC_VECTOR(5 DOWNTO 0); -- Usuario (user), 6-bits
		sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Select
		O: OUT STD_LOGIC_VECTOR(5 DOWNTO 0) -- Saida, 6-bits
	);
END Mux_3;  

-------------------------------------------------

ARCHITECTURE behv OF Mux_3 IS
BEGIN

    PROCESS(I3,I2,I1,I0,sel)
    BEGIN

        CASE sel IS
			WHEN "00" =>
				O <= I0;
			WHEN "01" =>
				O(5) <= '0';
				O(4) <= '0';
				O(3 DOWNTO 0) <= I1;
			WHEN "10" =>
				O(5) <= '0';
				O(4) <= '0';
				O(3 DOWNTO 0) <= I2;
			WHEN OTHERS =>
				O <= "ZZZZZZ";
		END CASE;

    END PROCESS;
END behv;