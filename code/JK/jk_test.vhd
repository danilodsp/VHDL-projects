library IEEE;
use IEEE.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity jk_test is
   port( J,K: in  std_logic;
         Reset: in std_logic;
         Clock_enable: in std_logic;
         Clock: in std_logic;
         Output: out std_logic);
end jk_test;

architecture Behavioral of jk_test is
   signal temp: std_logic;
begin
   process (Clock) 
   begin
      if (Clock'event and Clock='1') then                 
         if Reset='1' then   
            temp <= '0';
         elsif Clock_enable ='1' then
            if (J='0' and K='0') then
               temp <= temp;
            elsif (J='0' and K='1') then
               temp <= '0';
 	    elsif (J='1' and K='0') then
 	       temp <= '1';
 	    elsif (J='1' and K='1') then
 	       temp <= not (temp);
            end if;
         end if;
      end if;
   end process;
   Output <= temp;
end Behavioral;