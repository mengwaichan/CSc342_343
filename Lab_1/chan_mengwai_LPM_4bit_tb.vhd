library ieee;
use ieee.std_logic_1164.all;

entity chan_mengwai_LPM_4bit_tb is 
end chan_mengwai_LPM_4bit_tb;

architecture testbench_lpm_4bit of chan_mengwai_LPM_4bit_tb is 

component chan_mengwai_LPM
	generic (n: integer := 4);
	port (
		add_sub		: IN STD_LOGIC ;
		cin		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		overflow		: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
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
	
	begin
		tb_4bit : chan_mengwai_LPM port map(
		add_sub => Op, cin => Cin, dataa=> A, datab=>B,
		cout => Cout, overflow => Overflow, result => Sum);
		
process
    begin
        --Most Positive N bit integer + 1
        A <= "0111";
        B <= "0001";
        Cin <= '0';
        Op <= '1';
        wait for 100 ns;

        -- Most Positive N bit integer - 1
        A <= "0111";
        B <= "0001";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;

        -- Most Negative N bit integer + 1
        A <= "1000";
        B <= "0001";
        Cin <= '0';
        Op <= '1';
        wait for 100 ns;

        -- Most Negative N bit integer – 1
        A <= "1000";
        B <= "0001";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;

        -- Most Positive N bit integer- Most Negative N bit integer
        A <= "0111";
        B <= "1000";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;

        -- Most Positive N bit integer+ Most Negative N bit integer
        A <= "0111";
        B <= "1000";
        Cin <= '0';
        Op <= '1';
        wait for 100 ns;

        -- Most Positive N bit integer- Most Positive N bit integer
        A <= "0111";
        B <= "0111";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;


    end process;

end testbench_lpm_4bit;
