library ieee;
use ieee.std_logic_1164.all;

entity chan_mengwai_halfadder is
    port (
        a, b: in std_logic;
        sum, carry: out std_logic
    );
end entity chan_mengwai_halfadder;

architecture behavioral of chan_mengwai_halfadder is
    signal s, c: std_logic;
begin
    process(a, b)
    begin
	 s<='0';
		if a='0' then
			if b='1'  then
				s<='1';
			end if;
		elsif a='1' then
			if b='0' then
				s<='1';
			end if;
		end if;
			
		
    end process;
    
    process(a, b)
    begin
	 c<='0';
		if a='1' then
			if b='1' then
				c <='1';
			end if;
		else
			c <='0';
		end if;
    end process;
	 sum <=s;
	 carry<=c;
    
end architecture behavioral;