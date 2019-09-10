LIBRARY ieee ;
USE ieee.std_logic_1164.all;

---------------------------------------------

ENTITY ffd_user IS
	GENERIC(
		width: INTEGER :=6;
	);
	PORT(	
		data_in: IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
		clock: IN STD_LOGIC;
		load_user: IN STD_LOGIC;
		data_out: OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0)
	);
END ffd_user;

----------------------------------------------

ARCHITECTURE behv OF ffd_user IS
BEGIN

    PROCESS(data_in, clock)
    BEGIN

	IF (clock'EVENT AND clock='0' AND load_user='1') THEN
	    data_out <= data_in;
	END IF;

    END PROCESS;	

END behv;