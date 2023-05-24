LIBRARY ieee;
USE ieee.std_logic_1164.all; 

entity sr_flip_flop_tb is
end sr_flip_flop_tb;

architecture testbench of sr_flip_flop_tb is
  signal s_tb, r_tb, clk_tb: std_logic;
  signal q_tb, qbar_tb: std_logic;
begin
  sr_ff_inst : entity work.SR_Flip_Flop
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
	 
	 s_tb <= '0';
    wait for 10 ns;
    
    r_tb <= '1';
    wait for 10 ns;
    
    r_tb <= '0';
    wait for 10 ns;
      
    s_tb <= '1';
    r_tb <= '1';
    wait for 10 ns;
    
    wait;
  end process;
end testbench;
