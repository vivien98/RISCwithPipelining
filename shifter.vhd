library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity shifter is
	port(clk,shift,wr: in std_logic ;writeData : in std_logic_vector(7 downto 0);bit1: out std_logic);
end entity;
architecture kahipan of shifter is
signal data1,data2 : std_logic_vector(7 downto 0);

begin
store: process (clk,shift,wr) is
	begin
	if(rising_edge(clk)) then
		if(wr = '1') then
		data1 <= writeData ;
		end if;
		if(shift = '1')then
			data1(6 downto 0) <= data1(7 downto 1);
			data1(7) <= '0';
		end if;
	end if;	
end process store;

bit1 <= data1(0);

end kahipan;



