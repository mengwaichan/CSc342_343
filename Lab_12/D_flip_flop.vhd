LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY D_flip_flop IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		Clk :  IN  STD_LOGIC;
		En :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC;
		Qn :  OUT  STD_LOGIC
	);
END D_flip_flop;

ARCHITECTURE structure OF D_flip_flop IS 

COMPONENT d_latch
	PORT(D : IN STD_LOGIC;
		 Clk : IN STD_LOGIC;
		 En : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 Qn : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	s0 :  STD_LOGIC;
SIGNAL	s1 :  STD_LOGIC;


BEGIN 



DL1 : d_latch
PORT MAP(D => D,
		 Clk => Clk,
		 En => En,
		 Q => s0);


DL2 : d_latch
PORT MAP(D => s0,
		 Clk => s1,
		 En => En,
		 Q => Q,
		 Qn => Qn);


s1 <= NOT(Clk);



END structure;