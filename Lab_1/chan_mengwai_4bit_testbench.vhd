library ieee;
use ieee.std_logic_1164.all;

entity chan_mengwai_4bit_testbench is 
end chan_mengwai_4bit_testbench;

architecture testbench_4bit of chan_mengwai_4bit_testbench is 

component chan_mengwai_nbit_add_sub_overflow
generic (n: integer := 4);
	port (
        a : in std_logic_vector(N-1 downto 0);
        b : in std_logic_vector(N-1 downto 0);
        cin : in std_logic;
		op: in std_logic;
        sum : out std_logic_vector(N-1 downto 0);
        cout : out std_logic;
		overflow, zero, negative : out std_logic
    );
end component;

    -- Entity inputs
    signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);
    signal Cin : std_logic;
    signal Op : std_logic;
    
    -- Entity outputs
    signal Sum : std_logic_vector(3 downto 0) := (others => '0');
    signal Cout : std_logic;
    signal Overflow : std_logic;
    signal Zero : std_logic;
    signal Negative : std_logic;
	
	begin
		tb_4bit : chan_mengwai_nbit_add_sub_overflow port map(
		a => A, b => B, cin => Cin, op => Op, sum => Sum,
		cout => Cout, overflow => Overflow, zero => Zero, negative => Negative);
		
process
    begin
        --Most Positive N bit integer + 1
        A <= "0111";
        B <= "0001";
        Cin <= '0';
        Op <= '0';
        wait for 200 ns;

        -- Most Positive N bit integer - 1
        A <= "0111";
        B <= "0001";
        Cin <= '1';
        Op <= '1';
        wait for 200 ns;

        -- Most Negative N bit integer + 1
        A <= "1000";
        B <= "0001";
        Cin <= '0';
        Op <= '0';
        wait for 200 ns;

        -- Most Negative N bit integer – 1
        A <= "1000";
        B <= "0001";
        Cin <= '1';
        Op <= '1';
        wait for 200 ns;

        -- Most Positive N bit integer - Most Negative N bit integer
        A <= "0111";
        B <= "1000";
        Cin <= '1';
        Op <= '1';
        wait for 200 ns;

        -- Most Positive N bit integer + Most Negative N bit integer
        A <= "0111";
        B <= "1000";
        Cin <= '0';
        Op <= '0';
        wait for 200 ns;

        -- Most Positive N bit integer - Most Positive N bit integer
        A <= "0111";
        B <= "0111";
        Cin <= '1';
        Op <= '1';
        wait for 200 ns;


    end process;

end testbench_4bit;
