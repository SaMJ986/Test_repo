----------------------------------------------------------------------------------
-- lol jk, im still working on an 8 point fft :(

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_32768_points is
    Port ( clk: std_logic;
           X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end entity fft_32768_points;

architecture Behavioral of fft_32768_points is
--signal length: variable integer;
signal even: std_logic_vector (3 downto 0):=(others=>'0');
signal odd: std_logic_vector (3 downto 0):=(others=>'0');
signal even1_even: std_logic_vector (1 downto 0):=(others=>'0');
signal odd1_even: std_logic_vector (1 downto 0):=(others=>'0');
signal even1_odd: std_logic_vector (1 downto 0):=(others=>'0');
signal odd1_odd: std_logic_vector (1 downto 0):=(others=>'0');

begin
even <= (others => '0');
odd <= (others => '0');
even1_even <= (others => '0');
odd1_even <= (others => '0');
even1_odd <= (others => '0');
odd1_odd <= (others => '0');
S:process(clk, even, odd, even1_even, odd1_even, even1_odd, odd1_even)
begin
if rising_edge(clk) then
    for i in 0 to 7 loop
        even(i) <= X(2*i);
        odd(i)  <= X(2*i+1);
    end loop;
    for j in 0 to 1 loop
        even1_even(j) <= even(2*j); --index 0 4
        odd1_even(j) <= even(2*j+1);--index 2 6
    end loop;
    for k in 0 to 1 loop
        even1_odd(k) <= odd(2*k);  --index 1 5
        odd1_odd(k)  <= odd(2*k+1);--index 3 7
    end loop;   
end if;
end process S;

end Behavioral;
