library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addersubtractor2_tb is
end addersubtractor2_tb;

architecture addersubtractor2_tb_arch of addersubtractor2_tb is

COMPONENT sram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT addersubtractor2 IS
	GENERIC (n : INTEGER := 32);
	PORT (
		A, B : IN STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
		Clock, Reset, Sel, AddSub, Aload, Bload, Zload : IN STD_LOGIC;
		Z, Aout, Bout : BUFFER STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
		Overflow : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT demux1to2 is
	 GENERIC (n : INTEGER := 32);
    PORT ( i : in  std_logic_vector(n-1 downto 0);
           sel   : in  std_logic;
           o1 : out  std_logic_vector(n-1 downto 0);
           o2 : out  std_logic_vector(n-1 downto 0));
END COMPONENT;
	

	signal address: std_logic_vector(3 downto 0) := "0000";
	signal clock, reg_sel, Reset, Sel, Aload, Bload, Zload, AddSub, Overflow: std_logic :='0';
	signal data_in, data_out, A, B, Z, Aout, Bout: std_logic_vector(31 downto 0);
	
	

begin

	sram_inst: sram
	port map (
	address => address,
	clock => clock,
	data => data_in,
	wren => '0',
	q => data_out
	);
	
	demux_inst: demux1to2
	port map(
	i => data_out,
	sel => reg_sel,
	o1 => A,
	o2 => B
	);
	
	addersubtractor2_inst: addersubtractor2
	port map(
	A => A,
	B => B,
	Clock => clock,
	Reset => Reset,
	Sel => Sel,
	AddSub => AddSub,
	Aload => Aload,Bload => Bload,Zload => Zload,
	Z => Z,
	Aout => Aout,
	Bout => Bout,
	Overflow => Overflow
	);
	
	process
	  begin
		 clock <= '0';
		 wait for 5 ns;
		 clock <= '1';
		 wait for 5 ns;
	end process;
	
	process
	begin
		-- Test Case 1 x1 + x2 
		-- 100 ns Total
		Aload <= '1';
		address <= "1010"; -- address 10
		wait for 20 ns;
		
		wait for 10 ns;
		Aload <='0';
		wait for 10 ns;
		reg_sel <= '1';
		address <= "0010"; -- address 2
		wait for 20 ns;
		Bload <= '1';
		wait for 20 ns;
		Bload <= '0';
		
		Zload <='1';
		wait for 10 ns;
		Zload <= '0';
		reg_sel <= '0';
		wait for 10 ns;
		
		-- Test Case 1 Ended
		-- Reset for next Test case
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 10 ns;
		
		-- Test Case 2 x1 - x2
		-- 110 ns
		AddSub <= '1';
		wait for 10 ns;
		Aload <= '1';
		address <= "1100"; -- address 12
		wait for 20 ns;
		
		wait for 10 ns;
		Aload <='0';
		wait for 10 ns;
		reg_sel <= '1';
		address <= "0110"; -- address 6
		wait for 20 ns;
		Bload <= '1';
		wait for 20 ns;
		Bload <= '0';
		
		Zload <='1';
		wait for 10 ns;
		Zload <= '0';
		reg_sel <= '0';
		AddSub <= '0';
		wait for 10 ns;
		
		-- Test Case 2 Ended
		-- Reset for next Test Case
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 10 ns;
		
		-- Test Case 3 x1 + x2 + x3 + x4
		-- 200 ns
		Aload <= '1';
      address <= "0001"; -- Load data from address 1
      wait for 20 ns;
		
      wait for 10 ns;
      Aload <= '0';
      wait for 10 ns;
      reg_sel <= '1';
      address <= "0010"; -- Load data from address 2
      wait for 20 ns;
      Bload <= '1';
      wait for 20 ns;
      Bload <= '0';
      zload <= '1';
      Sel <= '1';
      wait for 10 ns;
		
      zload <= '0';
      address <= "0011"; -- Load data from address 3
      wait for 20 ns;
      Bload <= '1';
      wait for 20 ns;
      Bload <= '0';
      Zload <= '1'; 
      wait for 10 ns;
      zload <='0';
      address <= "0100"; -- Load data from address 4
      wait for 20 ns;
      Bload <= '1';
      wait for 20 ns;
      Bload <= '0';
      zload <='1';
      wait for 10 ns;
      zload <= '0';
		reg_sel <= '0';
		Sel <= '0';
		wait for 10 ns;
		
		-- Test Case 3 Ended
		-- Reset for next Test Case
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 10 ns;
		
		-- Test Case 4 x1 - x2 - x3 - x4
		-- 210 ns
		AddSub <= '1';
		wait for 10 ns;
		Aload <= '1';
      address <= "1101"; -- Load data from address 13
      wait for 20 ns;
		
      wait for 10 ns;
      Aload <= '0';
      wait for 10 ns;
      reg_sel <= '1';
      address <= "0011"; -- Load data from address 3
      wait for 20 ns;
      Bload <= '1';
      wait for 20 ns;
      Bload <= '0';
      zload <= '1';
      Sel <= '1';
      wait for 10 ns;
      zload <= '0';
      address <= "0010"; -- Load data from address 2
      wait for 20 ns;
      Bload <= '1';
      wait for 20 ns;
      Bload <= '0';
      Zload <= '1'; 
      wait for 10 ns;
      zload <='0';
      address <= "0001"; -- Load data from address 1
      wait for 20 ns;
      Bload <= '1';
      wait for 20 ns;
      Bload <= '0';
      zload <='1';
      wait for 10 ns;
      zload <= '0';
		reg_sel <= '0';
		AddSub <= '0';
		Sel <= '0';
		wait for 10 ns;
		
		-- Reset for next Test Case
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 10 ns;
		
		-- Test Case 5 Overflow
		Aload <= '1';
		address <= "1111"; -- address 16
		wait for 20 ns;
		
		wait for 10 ns;
		Aload <='0';
		wait for 10 ns;
		reg_sel <= '1';
		address <= "0001"; -- address 1
		wait for 20 ns;
		Bload <= '1';
		wait for 20 ns;
		Bload <= '0';
		
		Zload <='1';
		wait for 10 ns;
		Zload <= '0';
		reg_sel <= '0';
		wait for 10 ns;
		
	end process;
	
	

end addersubtractor2_tb_arch;