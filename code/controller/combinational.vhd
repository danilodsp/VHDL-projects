 library ieee;
 use ieee.std_logic_1164.all;

 entity combinacional is port
 (
	i : in std_logic;
	q1: in std_logic;
	q0: in std_logic;
	j1: out std_logic;
	j0: out std_logic;
	k1: out std_logic;	
	k0: out std_logic;	
	z : out std_logic

 );
 end combinacional;
 
 architecture arquitetura_combinacional of combinacional is
 begin
	j1 <= q0;
	k1 <= q0;
	j0 <= i or q1;
	k0 <= '1';
	z <= q1 and q0;
 
 
 end arquitetura_combinacional;
