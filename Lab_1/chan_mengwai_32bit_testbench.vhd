library ieee;
use ieee.std_logic_1164.all;

entity chan_mengwai_32bit_testbench is 
end chan_mengwai_32bit_testbench;

architecture testbench_32bit of chan_mengwai_32bit_testbench is 

component chan_mengwai_nbit_add_sub_overflow
generic (n: integer := 32);
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
    signal A : std_logic_vector(31 downto 0);
    signal B : std_logic_vector(31 downto 0);
    signal Cin : std_logic;
    signal Opcode : std_logic;
    
    -- Entity outputs
    signal Sum : std_logic_vector(31 downto 0);
    signal Cout : std_logic;
    signal Overflow : std_logic;
    signal Zero : std_logic;
    signal Negative : std_logic;
	
	begin
		tb_32bit : chan_mengwai_nbit_add_sub_overflow port map(
		a => A, b => B, cin => Cin, op => Opcode, sum => Sum,
		cout => Cout, overflow => Overflow, zero => Zero, negative => Negative);
		
process
    begin
        --Most Positive N bit integer + 1
        A <= "01111111111111111111111111111111";
        B <= "00000000000000000000000000000001";
        Cin <= '0';
        Opcode <= '0';
        wait for 200 ns;

        -- Most Positive N bit integer - 1
        A <= "01111111111111111111111111111111";
        B <= "00000000000000000000000000000001";
        Cin <= '1';
        Opcode <= '1';
        wait for 200 ns;

        -- Most Negative N bit integer + 1
        A <= "10000000000000000000000000000000";
        B <= "00000000000000000000000000000001";
        Cin <= '0';
        Opcode <= '0';
        wait for 200 ns;

        -- Most Negative N bit integer – 1
        A <= "10000000000000000000000000000000";
        B <= "00000000000000000000000000000001";
        Cin <= '1';
        Opcode <= '1';
        wait for 200 ns;

        -- Most Positive N bit integer- Most Negative N bit integer
        A <= "01111111111111111111111111111111";
        B <= "10000000000000000000000000000000";
        Cin <= '1';
        Opcode <= '1';
        wait for 200 ns;

        -- Most Positive N bit integer+ Most Negative N bit integer
        A <= "01111111111111111111111111111111";
        B <= "10000000000000000000000000000000";
        Cin <= '0';
        Opcode <= '0';
        wait for 200 ns;

        -- Most Positive N bit integer- Most Positive N bit integer
        A <= "01111111111111111111111111111111";
        B <= "01111111111111111111111111111111";
        Cin <= '1';
        Opcode <= '1';
        wait for 200 ns;

    end process;

end testbench_32bit;
