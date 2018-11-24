library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

package project is
component one_bit_reg is
port (D, CLK: in std_logic; Q: out std_logic);
end component;
component eight_bit_reg is
port (x: in std_logic_vector(7 downto 0); CLK: in std_logic; Q: out std_logic_vector(7 downto 0));
end component;
component sxteenbitreg is
port (x: in std_logic_vector(15 downto 0); clk: in std_logic; y: out std_logic_vector(15 downto 0));
end component;	
component onebitadder is
port(x,y,cin: in std_logic ; s,cout: out std_logic);
end component;
component sxteenbitadder is	
port(x,y: in std_logic_vector(15 downto 0); z: out std_logic_vector(15 downto 0); cflag,zflag: out std_logic);
end component;
component sxteenbitsubber is	
port(x,y: in std_logic_vector(15 downto 0); z: out std_logic_vector(15 downto 0); cflag,zflag: out std_logic);
end component;
component sxteenbitander is	
port(x,y: in std_logic_vector(15 downto 0); z: out std_logic_vector(15 downto 0));
end component;
component alu is
port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
end component;
end project;

library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity one_bit_reg is
  port (D, CLK: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare of one_bit_reg is
begin 
   process (CLK) 
   	begin
		if CLK'event and (CLK = '1') then
	    		Q <= D;
		end if;
   end process;
end WhatDoYouCare;

library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity eight_bit_reg is
  port (x: in std_logic_vector(7 downto 0); CLK: in std_logic; Q: out std_logic_vector(7 downto 0));
end entity;
architecture dattebayo of eight_bit_reg is
begin 
   process (CLK) 
   	begin
		if CLK'event and (CLK = '1') then
	    		Q <= x;
		end if;
   end process;
end dattebayo;

library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity sxteenbitreg is
port (x: in std_logic_vector(15 downto 0); clk: in std_logic; y: out std_logic_vector(15 downto 0));
end entity;
architecture regis of sxteenbitreg is
begin
	process(clk)
	begin
		if clk'event and (clk = '1') then
			y<=x;
		end if;
	end process;		
end regis;

library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity onebitadder is
port(x,y,cin: in std_logic ; s,cout: out std_logic);
end entity;
architecture onebit of onebitadder is
signal f:std_logic;
begin
s <= x xor y xor cin;
cout <= (x and y) or (x and cin) or (y and cin);	
end onebit;

library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity sxteenbitadder is	
port(x,y: in std_logic_vector(15 downto 0); z: out std_logic_vector(15 downto 0); cflag,zflag: out std_logic);
end entity;
architecture sexteen of sxteenbitadder is
signal int_c,zz: std_logic_vector(15 downto 0);
begin
adder0: onebitadder port map(x=>x(0),y=>y(0),cin=>'0',s=>zz(0),cout=>int_c(0));
adder1: onebitadder port map(x=>x(1),y=>y(1),cin=>int_c(0),s=>zz(1),cout=>int_c(1));
adder2: onebitadder port map(x=>x(2),y=>y(2),cin=>int_c(1),s=>zz(2),cout=>int_c(2));
adder3: onebitadder port map(x=>x(3),y=>y(3),cin=>int_c(2),s=>zz(3),cout=>int_c(3));
adder4: onebitadder port map(x=>x(4),y=>y(4),cin=>int_c(3),s=>zz(4),cout=>int_c(4));
adder5: onebitadder port map(x=>x(5),y=>y(5),cin=>int_c(4),s=>zz(5),cout=>int_c(5));
adder6: onebitadder port map(x=>x(6),y=>y(6),cin=>int_c(5),s=>zz(6),cout=>int_c(6));
adder7: onebitadder port map(x=>x(7),y=>y(7),cin=>int_c(6),s=>zz(7),cout=>int_c(7));
adder8: onebitadder port map(x=>x(8),y=>y(8),cin=>int_c(7),s=>zz(8),cout=>int_c(8));
adder9: onebitadder port map(x=>x(9),y=>y(9),cin=>int_c(8),s=>zz(9),cout=>int_c(9));
adder10: onebitadder port map(x=>x(10),y=>y(10),cin=>int_c(9),s=>zz(10),cout=>int_c(10));
adder11: onebitadder port map(x=>x(11),y=>y(11),cin=>int_c(10),s=>zz(11),cout=>int_c(11));
adder12: onebitadder port map(x=>x(12),y=>y(12),cin=>int_c(11),s=>zz(12),cout=>int_c(12));
adder13: onebitadder port map(x=>x(13),y=>y(13),cin=>int_c(12),s=>zz(13),cout=>int_c(13));
adder14: onebitadder port map(x=>x(14),y=>y(14),cin=>int_c(13),s=>zz(14),cout=>int_c(14));
adder15: onebitadder port map(x=>x(15),y=>y(15),cin=>int_c(14),s=>zz(15),cout=>int_c(15));
cflag <= int_c(15);
zflag <= not(zz(0) or zz(1) or zz(2) or zz(3) or zz(4) or zz(5) or zz(6) or zz(7) or zz(8) or zz(9) or zz(10) or zz(11) or zz(12) or zz(13) or zz(14) or zz(15));
z <= zz;
end sexteen;

library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity sxteenbitsubber is	
port(x,y: in std_logic_vector(15 downto 0); z: out std_logic_vector(15 downto 0); cflag , zflag: out std_logic);
end entity;
architecture sexteensub of sxteenbitsubber is
signal yones,ytwos: std_logic_vector(15 downto 0);
signal cd,cd1,zd:  std_logic;
begin
yones <= not y;
adder17: sxteenbitadder port map (x=>"0000000000000001", y=>yones, z=>ytwos ,cflag =>cd , zflag => zd);
adder16: sxteenbitadder port map ( x=>x , y=>ytwos,z=>z, cflag=>cd1, zflag => zflag);
cflag <= not cd1;
end sexteensub;

library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity sxteenbitander is	
port(x,y: in std_logic_vector(15 downto 0); z: out std_logic_vector(15 downto 0));
end entity;
architecture sexteenand of sxteenbitander is
begin
z <= x nand y;
end sexteenand;

library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity alu is
port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
end entity;
architecture finalalu of alu is
signal add,sub,nando,ma0,ma1: std_logic_vector(15 downto 0);
signal cadd,csub,zadd,zsub,cnand,znand: std_logic;
begin
ma0(0) <= m0;ma0(1) <= m0;ma0(2) <= m0;ma0(3) <= m0;ma0(4) <= m0;ma0(5) <= m0;ma0(6) <= m0;ma0(7) <= m0;ma0(8) <= m0;ma0(9) <= m0;ma0(10) <= m0;ma0(11) <= m0;ma0(12) <= m0;ma0(13) <= m0;ma0(14) <= m0;ma0(15) <= m0;
ma1(0) <= m1;ma1(1) <= m1;ma1(2) <= m1;ma1(3) <= m1;ma1(4) <= m1;ma1(5) <= m1;ma1(6) <= m1;ma1(7) <= m1;ma1(8) <= m1;ma1(9) <= m1;ma1(10) <= m1;ma1(11) <= m1;ma1(12) <= m1;ma1(13) <= m1;ma1(14) <= m1;ma1(15) <= m1;
stbadd:  sxteenbitadder port map (x=>xin , y=>yin, z=>add, cflag=>cadd, zflag=>zadd);
stbsub: sxteenbitsubber port map (x=>xin , y=>yin, z=>sub, cflag=>csub, zflag=>zsub);
stbnand: sxteenbitander port map (x=>xin , y=>yin , z=>nando);
cnand <= '0';
znand <= not(nando(0) or nando(1) or nando(2) or nando(3) or nando(4) or nando(5) or nando(6) or nando(7) or nando(8) or nando(9) or nando(10) or nando(11) or nando(12) or nando(13) or nando(14) or nando(15));
c <= ((not m0) and (not m1) and cadd) or (m0 and (not m1) and csub) or ((not m0) and m1 and cnand);
z <= ((not m0) and (not m1) and zadd) or (m0 and (not m1) and zsub) or ((not m0) and m1 and znand);
zout <= ((not ma0) and (not ma1) and add) or (ma0 and (not ma1) and sub) or ((not ma0) and ma1 and nando);
end finalalu;
-- 0000000000000001