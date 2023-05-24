LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY chan_mengwai_4bit_adder IS 
	PORT
	( 
      a, b :  IN  STD_LOGIC_VECTOR(3 downto 0);
		cin :  IN  STD_LOGIC;
		sum :  OUT STD_LOGIC_VECTOR(3 downto 0);
      carry: OUT STD_LOGIC
	);
END chan_mengwai_4bit_adder;

ARCHITECTURE structure OF chan_mengwai_4bit_adder IS 

COMPONENT chan_mengwai_fulladder
	PORT(

        cin :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		sum :  OUT  STD_LOGIC;
		cout :  OUT  STD_LOGIC
	);
END COMPONENT;

SIGNAL c1, c2, c3 :  STD_LOGIC;

BEGIN 
    Chan_FA1: chan_mengwai_fulladder PORT MAP(
        cin => cin,
        a => a(0),
        b =>b(0),
        sum => sum(0),
        cout => c1
    );

    Chan_FA2: chan_mengwai_fulladder PORT MAP(
        cin => c1,
        a => a(1),
        b =>b(1),
        sum => sum(1),
        cout => c2
    );

    Chan_FA3: chan_mengwai_fulladder PORT MAP(
        cin => c2,
        a => a(2),
        b =>b(2),
        sum => sum(2),
        cout => c3
    );

    Chan_FA4: chan_mengwai_fulladder PORT MAP(
        cin => c3,
        a => a(3),
        b =>b(3),
        sum => sum(3),
        cout => carry
    );

END structure;