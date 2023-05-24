LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY chan_mengwai_fulladder IS 
	PORT
	(
		cin :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		sum :  OUT  STD_LOGIC;
		cout :  OUT  STD_LOGIC
	);
END chan_mengwai_fulladder;

ARCHITECTURE structure OF chan_mengwai_fulladder IS 

COMPONENT chan_mengwai_halfadder
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 sum : OUT STD_LOGIC;
		 carry : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	s0 :  STD_LOGIC;
SIGNAL	s1 :  STD_LOGIC;
SIGNAL	c0 :  STD_LOGIC;

BEGIN 

HA0 : chan_mengwai_halfadder
PORT MAP(a => cin,
		 b => s0,
		 sum => sum,
		 carry => c0);

HA1 : chan_mengwai_halfadder
PORT MAP(a => a,
		 b => b,
		 sum => s0,
		 carry => s1);

cout <= s1 OR c0;

END structure;