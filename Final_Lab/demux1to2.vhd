LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity demux1to2 is
	 generic (n : INTEGER := 32);
    port ( i : in  std_logic_vector(n-1 downto 0);
           sel   : in  std_logic;
           o1 : out  std_logic_vector(n-1 downto 0);
           o2 : out  std_logic_vector(n-1 downto 0));
end demux1to2;

architecture demux1to2_arch of demux1to2 is
begin
    process (i, sel)
    begin
        case sel is
            when '0' =>
                o1 <= i;
                o2 <= (others => '0');
            when '1' =>
                o1 <= (others => '0');
                o2 <= i;
            when others =>
                o1 <= (others => '0');
                o2 <= (others => '0');
        end case;
    end process;
end demux1to2_arch;
