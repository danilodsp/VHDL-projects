 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;

 entity mde_vhdl is port
 (
	a:   in  std_logic;
	b:   in  std_logic;
	z:   out std_logic;
   clk: in  std_logic 
 );
 end mde_vhdl;
 
 architecture comportamental of mde_vhdl is
 
	type estados is (E0, E1, E2, E3, E4, E5, E6);
	signal estado_atual: estados;
	signal estado_anterior: estados;
	signal ab: std_logic_vector (1 downto 0);
	
	begin 
	ab <= A & B;
	
		process (clk)
		begin
			if rising_edge (clk) then
			case estado_atual is
				
				when E0 => 		if 	ab = "00" then estado_atual <= E1;
								   elsif ab = "01" then estado_atual <= E1;
								   elsif ab = "10" then estado_atual <= E2;
									elsif ab = "11" then estado_atual <= E2;
									end if;
									estado_anterior <= E0;
									
				when E1 => 		if    ab = "00" then estado_atual <= E3;
								   elsif ab = "01" then estado_atual <= E3;
								   elsif ab = "10" then estado_atual <= E2;
									elsif ab = "11" then estado_atual <= E2;									   
									end if;
									estado_anterior <= E1;
									
				when E2 => 		if    ab = "00" then estado_atual <= E1;
								   elsif ab = "01" then estado_atual <= E1;
								   elsif ab = "10" then estado_atual <= E4;
									elsif ab = "11" then estado_atual <= E4;									
									end if;
									estado_anterior <= E2;
									
				when E3 => 		if    ab = "00" then estado_atual <= E3;
								   elsif ab = "01" then estado_atual <= E3;
								   elsif ab = "10" then estado_atual <= E2;
									elsif ab = "11" then estado_atual <= E5;									   
									end if;
									estado_anterior <= E3;
									
				when E4 => 		if    ab = "00" then estado_atual <= E1;
								   elsif ab = "01" then estado_atual <= E6;
								   elsif ab = "10" then estado_atual <= E4;
									elsif ab = "11" then estado_atual <= E4;									   
									end if;
									estado_anterior <= E4;
									
				when E5 => 		if    ab = "00" then estado_atual <= E1;
								   elsif ab = "01" then estado_atual <= E6;
								   elsif ab = "10" then estado_atual <= E4;
									elsif ab = "11" then estado_atual <= E5;									   
									end if;
									estado_anterior <= E5;
									
				when E6 => 		if    ab = "00" then estado_atual <= E3;
								   elsif ab = "01" then estado_atual <= E6;
								   elsif ab = "10" then estado_atual <= E2;
									elsif ab = "11" then estado_atual <= E5;									   
									end if;
									estado_anterior <= E6;
									
			end case;
			end if;
			end process;
			
			process (estado_atual, estado_anterior)
				begin
					case estado_atual is
						when E0 => z <= '0';
						when E1 => z <= '0';
						when E2 => z <= '0';
						when E3 => z <= '1';
						when E4 => z <= '1';
						when E5 => z <= '1';
						when E6 => z <= '1';
					end case;
			end process;
	end comportamental;
			