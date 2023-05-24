library ieee;
use ieee.std_logic_1164.all;

entity chan_mengwai_LPM_32bit_tb is 
end chan_mengwai_LPM_32bit_tb;

architecture testbench_lpm_32bit of chan_mengwai_LPM_32bit_tb is 

component chan_mengwai_LPM
	generic (n: integer := 32);
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
    signal A : std_logic_vector(31 downto 0);
    signal B : std_logic_vector(31 downto 0);
    signal Cin : std_logic;
    signal Op : std_logic;
    
    -- Entity outputs
    signal Sum : std_logic_vector(31 downto 0) := (others => '0');
    signal Cout : std_logic;
    signal Overflow : std_logic;
	
	begin
		tb_32bit : chan_mengwai_LPM port map(
		add_sub => Op, cin => Cin, dataa=> A, datab=>B,
		cout => Cout, overflow => Overflow, result => Sum);
		
process
    begin
        --Most Positive N bit integer + 1
        A <= "01111111111111111111111111111111";
        B <= "00000000000000000000000000000001";
        Cin <= '0';
        Op <= '1';
        wait for 100 ns;

        -- Most Positive N bit integer - 1
        A <= "01111111111111111111111111111111";
        B <= "00000000000000000000000000000001";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;

        -- Most Negative N bit integer + 1
        A <= "10000000000000000000000000000000";
        B <= "00000000000000000000000000000001";
        Cin <= '0';
        Op <= '1';
        wait for 100 ns;

        -- Most Negative N bit integer - 1
        A <= "10000000000000000000000000000000";
        B <= "00000000000000000000000000000001";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;

        -- Most Positive N bit integer- Most Negative N bit integer
        A <= "01111111111111111111111111111111";
        B <= "10000000000000000000000000000000";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;

        -- Most Positive N bit integer+ Most Negative N bit integer
        A <= "01111111111111111111111111111111";
        B <= "10000000000000000000000000000000";
        Cin <= '0';
        Op <= '1';
        wait for 100 ns;

        -- Most Positive N bit integer- Most Positive N bit integer
        A <= "01111111111111111111111111111111";
        B <= "01111111111111111111111111111111";
        Cin <= '1';
        Op <= '0';
        wait for 100 ns;


    end process;

end testbench_lpm_32bit;
