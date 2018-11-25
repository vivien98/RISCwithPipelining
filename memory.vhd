library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity memory1 is
    
    port (
	   clk         : in   std_logic;
	   mema      : in  std_logic_vector(15 downto 0);
		--memb      : inout  std_logic_vector(7 downto 0);
      membr1      : out  std_logic_vector(7 downto 0);
		membr2      : out  std_logic_vector(7 downto 0);
		membw1      : in  std_logic_vector(7 downto 0);
		membw2      : in  std_logic_vector(7 downto 0);
	   wr         : in   std_logic
     );
		
  end entity ;


architecture behave of memory1 is
signal m12,m13,m14,m15,m18,m19,m20,m21:  std_logic_vector(7 downto 0):= (others => '0');
--signal m0 :std_logic_vector(7 downto 0) :=  "01010010"; --sw
--signal m1 :std_logic_vector(7 downto 0) :=  "10000011";--sw
--signal m2 :std_logic_vector(7 downto 0) :=  "00000000";--adc
--signal m3 :std_logic_vector(7 downto 0) :=  "01010010";--adc
signal m0 :std_logic_vector (7 downto 0) := "01100110";
signal m1:std_logic_vector (7 downto 0) :=  "01010101";

signal m2 :std_logic_vector (7 downto 0) := "11000000";
signal m3:std_logic_vector (7 downto 0) :=  "01001000";

signal m4 :std_logic_vector (7 downto 0) := "10000000";
signal m5:std_logic_vector (7 downto 0) :=  "00001000";

signal m6 :std_logic_vector(7 downto 0) :=  "00000000";
signal m7 :std_logic_vector(7 downto 0) :=  "00000000";

signal m8 :std_logic_vector (7 downto 0) := "00000000";
signal m9:std_logic_vector (7 downto 0) :=  "00000000";

signal m10 :std_logic_vector(7 downto 0) :=  "00000000";
signal m11 :std_logic_vector(7 downto 0) :=  "00000000";

signal m16 :std_logic_vector(7 downto 0) :=  "00010110";
signal m17 :std_logic_vector(7 downto 0) :=  "01000011";

begin

membr1 <= m0 when mema = x"0000" and wr='0' else
		  m2 when mema = x"0001" and wr='0' else
		  m4 when mema = x"0002" and wr='0' else
		  m6 when mema = x"0003" and wr='0' else
		  m8 when mema = x"0004" and wr='0' else
		  m10 when mema = x"0005" and wr='0' else
		  m12 when mema = x"0006" and wr='0' else
		  m14 when mema = x"0007" and wr='0' else  	
		  m16 when mema = x"0008" and wr='0' else
		  m18 when mema = x"0009" and wr='0';

membr2 <= m1 when mema = x"0000" and wr='0' else
		  m3 when mema = x"0001" and wr='0' else
		  m5 when mema = x"0002" and wr='0' else
		  m7 when mema = x"0003" and wr='0' else
		  m9 when mema = x"0004" and wr='0' else
		  m11 when mema = x"0005" and wr='0' else
		  m13 when mema = x"0006" and wr='0' else
		  m15 when mema = x"0007" and wr='0' else  	
		  m17 when mema = x"0008" and wr='0' else
		  m19 when mema = x"0009" and wr='0';			  

 mem_access:process(wr,mema,clk)
 begin
 	--if(wr='0') then
		--case mema is
		--	when X"0000" =>  membr1 <= m0 ; membr2 <= m1;
		--	when X"0001" =>  membr1 <= m2 ; membr2 <= m3;
		--	when X"0002" =>  membr1 <= m4 ; membr2 <= m5;
		--	when X"0003" =>  membr1 <= m6 ; membr2 <= m7;
		--	when X"0004" =>  membr1 <= m8 ; membr2 <= m9;
		--	when X"0005" =>  membr1 <= m10 ; membr2 <= m11;
		--	when X"0006" =>  membr1 <= m12 ; membr2 <= m13;
		--   when X"0007" =>  membr1 <= m14 ; membr2 <= m15; 
		--   when X"0008" =>  membr1 <= m16 ; membr2 <= m17;
		--	when X"0009" =>  membr1 <= m18 ; membr2 <= m19;
		--	when others =>   membr1 <= x"00"; membr2 <= x"00";
		--end case;
	if rising_edge(clk) and wr='1'then 
		case mema is
			when x"0000" =>  m0 <= membw1; m1 <= membw2;
			when x"0001" =>  m2 <= membw1; m3 <= membw2; 
			when x"0002" =>  m4 <= membw1; m5 <= membw2;
			when x"0003" =>  m6 <= membw1; m7 <= membw2;
			when x"0004" =>  m8 <= membw1; m9 <= membw2;
			when x"0005" =>  m10 <= membw1; m11 <= membw2;
			when x"0006" =>  m12 <= membw1; m13 <= membw2;
			when x"0007" =>  m14 <= membw1; m15 <= membw2;
			when x"0008" =>  m16 <= membw1; m17 <= membw2;
			when x"0009" =>  m18 <= membw1; m19 <= membw2;
			when others =>   m20<= membw1; m21 <= membw2;
			
		end case;
	end if;
 end process mem_access;


end architecture behave;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory2 is
    
    port (
	   clk         : in   std_logic;
	   mema      : in  std_logic_vector(15 downto 0);
		--memb      : inout  std_logic_vector(7 downto 0);
      membr1      : out  std_logic_vector(7 downto 0);
		membr2      : out  std_logic_vector(7 downto 0);
		membw1      : in  std_logic_vector(7 downto 0);
		membw2      : in  std_logic_vector(7 downto 0);
	   wr         : in   std_logic
     );
		
  end entity ;


architecture behave of memory2 is
--signal m12,m13,m14,m15,m18,m19,m20,m21:  std_logic_vector(7 downto 0):= (others => '0');
--signal m0 :std_logic_vector(7 downto 0) :=  "01010010"; --sw
--signal m1 :std_logic_vector(7 downto 0) :=  "10000011";--sw
--signal m2 :std_logic_vector(7 downto 0) :=  "00000000";--adc
--signal m3 :std_logic_vector(7 downto 0) :=  "01010010";--adc
signal m0 :std_logic_vector (7 downto 0) := "00000001";
signal m1:std_logic_vector (7 downto 0) :=  "00000010";

signal m2 :std_logic_vector(7 downto 0) :=  "00000011";
signal m3 :std_logic_vector(7 downto 0) :=  "00000100";

signal m4 :std_logic_vector (7 downto 0) := "00000101";
signal m5:std_logic_vector (7 downto 0) :=  "00000110";

signal m6 :std_logic_vector(7 downto 0) :=  "00000111";
signal m7 :std_logic_vector(7 downto 0) :=  "00001000";

signal m8 :std_logic_vector (7 downto 0) := "00001001";
signal m9:std_logic_vector (7 downto 0) :=  "00001010";

signal m10 :std_logic_vector(7 downto 0) :=  "00001011";
signal m11 :std_logic_vector(7 downto 0) :=  "00001100";

signal m12 :std_logic_vector(7 downto 0) :=  "00001011";
signal m13 :std_logic_vector(7 downto 0) :=  "00001100";

signal m14 :std_logic_vector(7 downto 0) :=  "00001101";
signal m15 :std_logic_vector(7 downto 0) :=  "00001110";

signal m16 :std_logic_vector(7 downto 0) :=  "00001111";
signal m17 :std_logic_vector(7 downto 0) :=  "00010000";

signal m18 :std_logic_vector(7 downto 0) :=  "00010001";
signal m19 :std_logic_vector(7 downto 0) :=  "00010010";

signal m20 :std_logic_vector(7 downto 0) :=  "00010011";
signal m21 :std_logic_vector(7 downto 0) :=  "00010100";



begin

membr1 <= m0 when mema = x"0000" and wr='0' else
		  m2 when mema = x"0001" and wr='0' else
		  m4 when mema = x"0002" and wr='0' else
		  m6 when mema = x"0003" and wr='0' else
		  m8 when mema = x"0004" and wr='0' else
		  m10 when mema = x"0005" and wr='0' else
		  m12 when mema = x"0006" and wr='0' else
		  m14 when mema = x"0007" and wr='0' else  	
		  m16 when mema = x"0008" and wr='0' else
		  m18 when mema = x"0009" and wr='0';

membr2 <= m1 when mema = x"0000" and wr='0' else
		  m3 when mema = x"0001" and wr='0' else
		  m5 when mema = x"0002" and wr='0' else
		  m7 when mema = x"0003" and wr='0' else
		  m9 when mema = x"0004" and wr='0' else
		  m11 when mema = x"0005" and wr='0' else
		  m13 when mema = x"0006" and wr='0' else
		  m15 when mema = x"0007" and wr='0' else  	
		  m17 when mema = x"0008" and wr='0' else
		  m19 when mema = x"0009" and wr='0';			  

 mem_access:process(wr,mema,clk)
 begin
 	--if(wr='0') then
		--case mema is
		--	when X"0000" =>  membr1 <= m0 ; membr2 <= m1;
		--	when X"0001" =>  membr1 <= m2 ; membr2 <= m3;
		--	when X"0002" =>  membr1 <= m4 ; membr2 <= m5;
		--	when X"0003" =>  membr1 <= m6 ; membr2 <= m7;
		--	when X"0004" =>  membr1 <= m8 ; membr2 <= m9;
		--	when X"0005" =>  membr1 <= m10 ; membr2 <= m11;
		--	when X"0006" =>  membr1 <= m12 ; membr2 <= m13;
		--   when X"0007" =>  membr1 <= m14 ; membr2 <= m15; 
		--   when X"0008" =>  membr1 <= m16 ; membr2 <= m17;
		--	when X"0009" =>  membr1 <= m18 ; membr2 <= m19;
		--	when others =>   membr1 <= x"00"; membr2 <= x"00";
		--end case;
	if rising_edge(clk) and wr='1'then 
		case mema is
			when x"0000" =>  m0 <= membw1; m1 <= membw2;
			when x"0001" =>  m2 <= membw1; m3 <= membw2; 
			when x"0002" =>  m4 <= membw1; m5 <= membw2;
			when x"0003" =>  m6 <= membw1; m7 <= membw2;
			when x"0004" =>  m8 <= membw1; m9 <= membw2;
			when x"0005" =>  m10 <= membw1; m11 <= membw2;
			when x"0006" =>  m12 <= membw1; m13 <= membw2;
			when x"0007" =>  m14 <= membw1; m15 <= membw2;
			when x"0008" =>  m16 <= membw1; m17 <= membw2;
			when x"0009" =>  m18 <= membw1; m19 <= membw2;
			when others =>   m20<= membw1; m21 <= membw2;
			
		end case;
	end if;
 end process mem_access;


end architecture behave;

