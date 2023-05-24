LIBRARY ieee;
USE ieee.std_logic_1164.all; 

entity d_flip_flop_tb is
end d_flip_flop_tb;

architecture testbench of d_flip_flop_tb is
  signal d_tb, clk_tb: std_logic;
  signal q_tb, qbar_tb: std_logic;
begin
  sr_latch_inst : entity work.D_flip_flop
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
    
	 d_tb <= '0';
    wait for 10 ns;
    
    wait;
  end process;
end testbench;
