LIBRARY ieee;
USE ieee.std_logic_1164.all; 

entity d_latch_tb is
end d_latch_tb;

architecture testbench of d_latch_tb is
  signal d_tb, clk_tb: std_logic;
  signal q_tb, qbar_tb: std_logic;
begin
  sr_latch_inst : entity work.D_Latch
    port map (
      D => d_tb,
      clk => clk_tb,
		En => '1',
      q => q_tb,
      qn => qbar_tb
    );
    
  -- Clock process
  process
  begin
    clk_tb <= '0';
    wait for 2 ns;
    clk_tb <= '1';
    wait for 2 ns;
  end process;
  
  process
  begin
    d_tb <= '0';
    
    d_tb <= '1';
    wait for 10 ns;
    assert (q_tb = '1' and qbar_tb = '0')
      report "ERROR: D Latch Testbench - D=1 failed"
      severity error;
    
	 d_tb <= '0';
    wait for 10 ns;
    assert (q_tb = '1' and qbar_tb = '0')
      report "ERROR: D Latch Testbench - D=0 failed"
      severity error;
    
    wait;
  end process;
end testbench;
