LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY chan_mengwai_register IS 
	PORT
	(
		D :   IN STD_LOGIC_VECTOR(3 downto 0);
		CP :  IN  STD_LOGIC;
		EN : IN  STD_LOGIC;
		Q :   OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END chan_mengwai_register;

ARCHITECTURE structure OF chan_mengwai_register IS 

COMPONENT d_latch
	PORT(D :   IN STD_LOGIC;
		  Clk : IN STD_LOGIC;
		  En :  IN STD_LOGIC;
		  Q :   OUT STD_LOGIC;
		  Qn :  OUT STD_LOGIC
	);
END COMPONENT;

BEGIN 

DL0 : d_latch
PORT MAP(D => D(0),
		 Clk => CP,
		 En => 1,
		 Q => Q(0));

DL1 : d_latch
PORT MAP(D => D(1),
		 Clk => CP,
		 En => 1,
		 Q => Q(1));

DL2 : d_latch
PORT MAP(D => D(2),
		 Clk => CP,
		 En => 1,
		 Q => Q(2));

DL3 : d_latch
PORT MAP(D => D(3),
		 Clk => CP,
		 En => 1,
		 Q => Q(3));

END structure;