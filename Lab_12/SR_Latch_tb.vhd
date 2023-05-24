LIBRARY ieee;
USE ieee.std_logic_1164.all; 

entity sr_latch_tb is
end sr_latch_tb;

architecture testbench of sr_latch_tb is
  signal s_tb, r_tb, clk_tb: std_logic;
  signal q_tb, qbar_tb: std_logic;
begin
  sr_latch_inst : entity work.SR_Latch
    port map (
      S => s_tb,
      r => r_tb,
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
    s_tb <= '0';
    r_tb <= '0';
    
    s_tb <= '1';
    wait for 10 ns;
    assert (q_tb = '1' and qbar_tb = '0')
      report "ERROR: SR Latch Testbench - Set failed"
      severity error;
    
	 s_tb <= '0';
    r_tb <= '0';
    wait for 10 ns;
    assert (q_tb = '1' and qbar_tb = '0')
      report "ERROR: SR Latch Testbench - Hold failed"
      severity error;
    
    r_tb <= '1';
    wait for 10 ns;
    assert (q_tb = '0' and qbar_tb = '1')
      report "ERROR: SR Latch Testbench - Reset failed"
      severity error;
	 
    r_tb <= '0';
    wait for 10 ns;
    assert (q_tb = '0' and qbar_tb = '1')
      report "ERROR: SR Latch Testbench - Hold failed"
      severity error;
      
    -- Test invalid state
    s_tb <= '1';
    r_tb <= '1';
    wait for 10 ns;
    assert (q_tb = '0' and qbar_tb = '0')
      report "ERROR: SR Latch Testbench - Invalid state failed"
      severity error;
    
    -- End simulation
    wait;
  end process;
end testbench;
