library ieee;
use ieee.std_logic_1164.all;

entity Flip_Flop_jk is port
( 
	j:   in std_logic;
	k:   in std_logic;
	clk: in std_logic;
	reset: in std_logic;
	q:   out std_logic
);
end Flip_Flop_jk;

architecture arquitetura_jk of flip_Flop_jk is
signal qx: std_logic;
begin
	process
		begin
			if reset = '1'	then qx <= '0';
			end if;
			wait until clk'event and clk = '1';
			if (j = '0' and k = '0') then qx <= qx;
			elsif (j = '0' and k = '1') then qx <= '0';
			elsif (j = '1' and k = '0') then qx <= '1';
			elsif (j = '1' and k = '1') then qx <= not qx;
			end if;
	end process;
	q <= qx;
end arquitetura_jk;