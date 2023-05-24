library ieee;
use ieee.std_logic_1164.all;

package chan_mengwai_package IS
    component chan_mengwai_halfadder is
        port (
            a, b: in std_logic;
            sum, carry: out std_logic
        );
    end component;

    component chan_mengwai_fulladder IS 
        port
        (
            cin :  IN  STD_LOGIC;
            a :  IN  STD_LOGIC;
            b :  IN  STD_LOGIC;
            sum :  OUT  STD_LOGIC;
            cout :  OUT  STD_LOGIC
        );
    end component;

    component chan_mengwai_4bit_adder IS 
        port
        ( 
            a,b :  IN  STD_LOGIC_VECTOR(3 downto 0);
            cin :  IN  STD_LOGIC;
            sum :  OUT STD_LOGIC_VECTOR(3 downto 0);
            carry: OUT STD_LOGIC
        );
    end component;

    component chan_mengwai_4bit_add_sub IS 
        port
        ( 
            a,b :  IN  STD_LOGIC_VECTOR(3 downto 0);
            opCode: IN STD_LOGIC;
            sum :  OUT STD_LOGIC_VECTOR(3 downto 0);
            carry, overflow: OUT STD_LOGIC
        );
    end component;

end chan_mengwai_package;