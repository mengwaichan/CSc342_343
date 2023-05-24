LIBRARY ieee;
USE ieee.std_logic_1164.all; 

package lab12_pacakge is

COMPONENT sr_latch
	PORT(R : IN STD_LOGIC;
		 En : IN STD_LOGIC;
		 Clk : IN STD_LOGIC;
		 S : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 Qn : OUT STD_LOGIC
	);
END COMPONENT;

end package;