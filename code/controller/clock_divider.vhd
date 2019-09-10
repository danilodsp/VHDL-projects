library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 
entity Clock_Divider is
		port ( clk,reset: in std_logic;
				clock_out: out std_logic);
end Clock_Divider;
 
architecture bhv of Clock_Divider is
 
signal count: integer := 0;
signal tmp : std_logic := '0';
constant N : integer := 25000000;
 
begin

process(clk,reset)
	begin
	
	if(reset='1') then
		count<=0;
		tmp<='1';
	elsif(clk'event and clk='1') then
		count <= count+1;
		if (count = (N-1)) then
			tmp <= NOT tmp;
			count <= 0;
		end if;
	end if;
	
	clock_out <= tmp;
	
end process;
 
end bhv;
