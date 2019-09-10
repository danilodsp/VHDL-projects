library ieee;
use ieee.std_logic_1164.all;

entity manchester is

	port(
		clk		 : in	std_logic;
		input	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic
	);

end entity;

architecture rtl of manchester is

	-- Build an enumerated type for the state machine
	type state_type is (I, A, B, C, D);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= I;
		elsif (rising_edge(clk)) then
			case state is
				when I =>
					if input = '1' then
						state <= A;
					else
						state <= C;
					end if;
				when A =>
					if input = '1' then
						state <= B;
					else
						state <= B;
					end if;
				when B =>
					if input = '1' then
						state <= A;
					else
						state <= C;
					end if;
				when C =>
					if input = '1' then
						state <= D;
					else
						state <= D;
					end if;
				when D =>
					if input = '1' then
						state <= A;
					else
						state <= C;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when I =>
				output <= '0';
			when A =>
				output <= '1';
			when B =>
				output <= '0';
			when C =>
				output <= '0';
			when D =>
				output <= '1';
		end case;
	end process;

end rtl;
