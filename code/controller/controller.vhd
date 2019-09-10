 library ieee;
 use ieee.std_logic_1164.all;

 entity completo is port
 (
	i, reset: in std_logic;
	clk: in std_logic;
	z: out std_logic

 );
 end completo;
 
 architecture arquitetura_completo of completo is
 
 component Flip_Flop_jk
 port
 (  
   j:   in std_logic;
	k:   in std_logic;
	clk: in std_logic;
	reset: in std_logic;
	q:   out std_logic
 );
 end component;
 
 component combinacional
 port
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
 end component;
 
component Clock_Divider
		port (clk: in std_logic;
		      reset: in std_logic;
				clock_out: out std_logic);
end component;
 
 signal jj1, jj0, kk1, kk0, qq1, qq0, clk_out: std_logic;
 
 begin
 
   p3: Clock_Divider port map (clk, reset, clk_out);
	p0: combinacional port map (i, qq1, qq0, jj1, jj0, kk1, kk0, z);
	p1: Flip_Flop_jk port map (jj1, kk1, clk_out, reset, qq1);
	p2: Flip_Flop_jk port map (jj0, kk0, clk_out, reset, qq0);
  
 end arquitetura_completo;
