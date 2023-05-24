library ieee;
use ieee.std_logic_1164.all;

entity chan_mengwai_16bit_testbench is 
end chan_mengwai_16bit_testbench;

architecture testbench_16bit of chan_mengwai_16bit_testbench is 

component chan_mengwai_nbit_add_sub_overflow
generic (n: integer := 16);
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
    signal A : std_logic_vector(15 downto 0);
    signal B : std_logic_vector(15 downto 0);
    signal Cin : std_logic;
    signal Op : std_logic;
    
    -- Entity outputs
    signal Sum : std_logic_vector(15 downto 0) := (others => '0');
    signal Cout : std_logic;
    signal Overflow : std_logic;
    signal Zero : std_logic;
    signal Negative : std_logic;
	
	begin
		t4bit : chan_mengwai_nbit_add_sub_overflow port map(
		a => A, b => B, cin => Cin, op => Op, sum => Sum,
		cout => Cout, overflow => Overflow, zero => Zero, negative => Negative);
		
process
    begin
        --Most Positive N bit integer + 1
        A <= "0111111111111111";
        B <= "0000000000000001";
        Cin <= '0';
        Op <= '0';
        wait for 20 ns;
		  if (Overflow ='0' or zero ='1' or negative ='0') then 
				report "Error for case (a)";
				report "Time: " & time'image(now);
				report "Overflow(expected 1):" &std_logic'image(overflow);
				report "Negative(expected 1):" &std_logic'image(negative);
	
		  end if;
		  wait for 100 ns;
		  

        -- Most Positive N bit integer - 1
        A <= "0111111111111111";
        B <= "0000000000000001";
        Cin <= '1';
        Op <= '1';
        wait for 20 ns;
		  if (Overflow ='1' or zero ='1' or negative ='1') then 
				report "Error for case (b)";
				report "Time: " & time'image(now);
				report "Overflow(expected 0):" &std_logic'image(overflow);
				report "Negative(expected 0):" &std_logic'image(negative);
	
		  end if;
		  wait for 100 ns;
		  

        -- Most Negative N bit integer + 1
        A <= "1000000000000000";
        B <= "0000000000000001";
        Cin <= '0';
        Op <= '0';
        wait for 20 ns;
		  if (Overflow ='1' or zero ='1' or negative ='0') then 
				report "Error for case (c)";
				report "Time: " & time'image(now);
				report "Overflow(expected 0):" &std_logic'image(overflow);
				report "Negative(expected 1):" &std_logic'image(negative);
	
		  end if;
		  wait for 100 ns;
        -- Most Negative N bit integer – 1
        A <= "1000000000000000";
        B <= "0000000000000001";
        Cin <= '1';
        Op <= '1';
        wait for 20 ns;
		  if (Overflow ='0' or zero ='1' or negative ='1') then 
				report "Error for case (d)";
				report "Time: " & time'image(now);
				report "Overflow(expected 1):" &std_logic'image(overflow);
				report "Negative(expected 0):" &std_logic'image(negative);
	
		  end if;
		  wait for 100 ns;

        -- Most Positive N bit integer- Most Negative N bit integer
        A <= "0111111111111111";
        B <= "1000000000000000";
        Cin <= '1';
        Op <= '1';
        wait for 20 ns;
		  if (Overflow ='0' or zero ='1' or negative ='0') then 
				report "Error for case (e)";
				report "Time: " & time'image(now);
				report "Overflow(expected 1):" &std_logic'image(overflow);
				report "Negative(expected 1):" &std_logic'image(negative);
	
		  end if;
		  wait for 100 ns;

        -- Most Positive N bit integer+ Most Negative N bit integer
        A <= "0111111111111111";
        B <= "1000000000000000";
        Cin <= '0';
        Op <= '0';
        wait for 20 ns;
		  if (Overflow ='1' or zero ='1' or negative ='0') then 
				report "Error for case (f)";
				report "Time: " & time'image(now);
				report "Overflow(expected 0):" &std_logic'image(overflow);
				report "Negative(expected 1):" &std_logic'image(negative);
	
		  end if;
		  wait for 100 ns;

        -- Most Positive N bit integer- Most Positive N bit integer
        A <= "0111111111111111";
        B <= "0111111111111111";
        Cin <= '1';
        Op <= '1';
        wait for 20 ns;
		  if (Overflow ='1' or zero ='0' or negative ='1') then 
				report "Error for case (g)";
				report "Time: " & time'image(now);
				report "Overflow(expected 0):" &std_logic'image(overflow);
				report "Negative(expected 0):" &std_logic'image(negative);
				report "Zero(expected 1):" &std_logic'image(zero);
		  end if;
		  wait for 100 ns;


    end process;

end testbench_16bit;