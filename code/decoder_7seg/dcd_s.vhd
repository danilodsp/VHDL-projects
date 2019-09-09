library IEEE;
use IEEE.std_logic_1164.all;
entity decod_sete is
port(
X : in std_logic;
Y : in std_logic;
W : in std_logic;
Z : in std_logic;
e,f,g,h,i,j,k : out std_logic
);
end decod_sete;

architecture arquitetura_decod_sete of decod_sete is
begin
		e <= X or W or (Y xnor Z);
		f <= (not Y) or (W xnor Z);
		g <= (not W) or Z or Y;
		h <= X or (W and (not Z)) or ((not Y) and W) or ((not Y) and (not Z)) or (Y and (not W) and Z);
		i <= (W and (not Z)) or ((not Y) and (not Z));
		j <= X or (Y and (not W)) or ((not W) and (not Z)) or (Y and (not Z));
		k <= X or (W and (not Z)) or (Y xor W);
end arquitetura_decod_sete;