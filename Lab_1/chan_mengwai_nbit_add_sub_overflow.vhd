library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.chan_mengwai_package.all;


entity chan_mengwai_nbit_add_sub_overflow is
    generic (
        N : integer := 8
    );
    port (
        a : in std_logic_vector(N-1 downto 0);
        b : in std_logic_vector(N-1 downto 0);
        cin : in std_logic;
        op: in std_logic;
        sum : buffer std_logic_vector(N-1 downto 0);
        cout : out std_logic;
        overflow,zero,negative: out std_logic
    );
end chan_mengwai_nbit_add_sub_overflow;

architecture dataflow of chan_mengwai_nbit_add_sub_overflow is
    signal carry : std_logic_vector(N-1 downto 0);
    signal temp: std_logic_vector(N-1 downto 0);

begin
    temp <= not b when op = '1' else b;
    Chan_FA0: chan_mengwai_fulladder
    PORT MAP
	(
		cin => cin,
		a =>a(0),
		b => temp(0),
		sum => sum(0),
		cout => carry(0)
	);
    Chan_generate: for i in 1 to N-1 generate
        Chan_FA: chan_mengwai_fulladder
        PORT MAP
        (
            cin => carry(i-1),
            a =>a(i),
            b => temp(i),
            sum => sum(i),
            cout => carry(i)
        );
        
    end generate Chan_generate;
    cout <= carry(N-1);
    overflow <= (carry(N-1) xor carry(N-2));
    zero <= '1' when unsigned(sum) = 0 else '0';
    negative <= '1' when sum(N-1) = '1' else '0';
end dataflow;