LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY chan_mengwai_4bit_add_sub IS 
	PORT
	( 
        a,b :  IN  STD_LOGIC_VECTOR(3 downto 0);
        opCode: IN STD_LOGIC;
		  sum :  OUT STD_LOGIC_VECTOR(3 downto 0);
        carry, overflow: OUT STD_LOGIC
	);
END chan_mengwai_4bit_add_sub;

ARCHITECTURE structure OF chan_mengwai_4bit_add_sub IS 

COMPONENT chan_mengwai_fulladder
	PORT(
      cin :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		sum :  OUT  STD_LOGIC;
		cout :  OUT  STD_LOGIC
	);
END COMPONENT;

SIGNAL carry0, carry1, carry2, carry3 :  STD_LOGIC;
SIGNAL temp :  STD_LOGIC_VECTOR(3 downto 0);

BEGIN 

    temp <= a XOR b;

    Chan_FA1: chan_mengwai_fulladder PORT MAP(
        cin => opCode,
        a => a(0),
        b =>temp(0),
        sum => sum(0),
        cout => carry0
    );

    Chan_FA2: chan_mengwai_fulladder PORT MAP(
        cin => carry0,
        a => a(1),
        b =>temp(1),
        sum => sum(1),
        cout => carry1
    );

    Chan_FA3: chan_mengwai_fulladder PORT MAP(
        cin => carry1,
        a => a(2),
        b =>temp(2),
        sum => sum(2),
        cout => carry2
    );

    Chan_FA4: chan_mengwai_fulladder PORT MAP(
        cin => carry2,
        a => a(3),
        b =>temp(3),
        sum => sum(3),
        cout => carry3
    );

    overflow <= carry2 xor carry3;
    carry <= carry3;

END structure;