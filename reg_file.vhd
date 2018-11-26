library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_file is
    
    port (
	   clk        : in   std_logic;
	   rst        : in   std_logic;
	   wr         : in   std_logic;
	   rf_a1      : in  std_logic_vector(2 downto 0);
	   rf_a2      : in  std_logic_vector(2 downto 0);
	   rf_a3      : in  std_logic_vector(2 downto 0);
	   rf_d1      : out  std_logic_vector(15 downto 0);
	   rf_d2      : out  std_logic_vector(15 downto 0);
	   rf_d3      : in  std_logic_vector(15 downto 0);
	   Reg7		  : in std_logic_vector(15 downto 0)

     );
		
  end entity ;
  
  
 architecture behave of reg_file is
 
 signal r0:std_logic_vector(15 downto 0) := x"0A0A"; 
 signal r1:std_logic_vector(15 downto 0):= x"0005";
 signal r2:std_logic_vector(15 downto 0):= x"0002";
 signal r3:std_logic_vector(15 downto 0):= x"0C0C";
 signal r4:std_logic_vector(15 downto 0):= x"0040";
 signal r5:std_logic_vector(15 downto 0) := x"0D0D"; 
 signal r6:std_logic_vector(15 downto 0) := x"0EE0"; 
 signal r7:std_logic_vector(15 downto 0) := x"0F0F"; 
 
 begin
 
 
 --rfa1:process(rf_a1,r0,r1,r2,r3,r4,r5,r6,r7)
 --begin
	-- case rf_a1 is
	--	when "000" =>  rf_d1 <= r0;
	--	when "001" =>  rf_d1 <= r1;
	--	when "010" =>  rf_d1 <= r2;
	--	when "011" =>  rf_d1 <= r3;
	--	when "100" =>  rf_d1 <= r4;
	--	when "101" =>  rf_d1 <= r5;
	--	when "110" =>  rf_d1 <= r6;
	--	when others =>  rf_d1 <= r7;
		
	-- end case;
 
 --end process rfa1;

  rf_d1 <= 
     r0 when rf_a1 = "000" else 
     r1 when rf_a1 = "001" else 
     r2  when rf_a1 = "010" else 
     r3 when rf_a1 = "011" else
     r4 when rf_a1 = "100" else
     r5 when rf_a1 = "101" else
     r6 when rf_a1 = "110" else
	 r7 when rf_a1 ="111";
 
 
 -- rfa2:process(rf_a2,r0,r1,r2,r3,r4,r5,r6,r7)
 --begin
	-- case rf_a2 is
	--	when "000" =>  rf_d2 <= r0;
	--	when "001" =>  rf_d2 <= r1;
	--	when "010" =>  rf_d2 <= r2;
	--	when "011" =>  rf_d2 <= r3;
	--	when "100" =>  rf_d2 <= r4;
	--	when "101" =>  rf_d2 <= r5;
	--	when "110" =>  rf_d2 <= r6;
	--	when others =>  rf_d2 <= r7;
	-- end case;
 --end process rfa2;

  rf_d2 <= 
     r0 when rf_a2 = "000" else 
     r1 when rf_a2 = "001" else 
     r2  when rf_a2 = "010" else 
     r3 when rf_a2 = "011" else
     r4 when rf_a2 = "100" else
     r5 when rf_a2 = "101" else
     r6 when rf_a2 = "110" else
	 r7 when rf_a2 ="111";
 
 
 writing: process(clk,wr,rf_a3)
 begin
	if rising_edge(clk) then
		if (wr ='1') then 
			case rf_a3 is
				when "000" =>  r0 <= rf_d3;
				r7 <= Reg7;
				when "001" =>  r1 <= rf_d3;
				r7 <= Reg7;
				when "010" =>  r2 <= rf_d3;
				r7 <= Reg7;
				when "011" =>  r3 <= rf_d3;
				r7 <= Reg7;
				when "100" =>  r4 <= rf_d3;
				r7 <= Reg7;
				when "101" =>  r5 <= rf_d3;
				r7 <= Reg7;
				when "110" =>  r6 <= rf_d3;
				r7 <= Reg7;
				when others =>  r7 <= rf_d3;
			end case;
		elsif(wr = '0')then
			r7 <= Reg7;
		end if;
	end if;
end process writing;
 
 end architecture behave;
 
 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
 entity reg_file_wrap is
    
    port (
	   clk        : in   std_logic;
	   rst        : in   std_logic;
		ir         : in  std_logic_vector(15 downto 0);
	   t1         : in  std_logic_vector(15 downto 0);
	   t3         : in  std_logic_vector(15 downto 0);
		t4				: in std_logic_vector (15 downto 0);
	   pc         : in  std_logic_vector(15 downto 0);
	   app7       : in  std_logic_vector(15 downto 0);
	   state      : in  std_logic_vector(4 downto 0);
       rf_d1      : out  std_logic_vector(15 downto 0);
	   rf_d2      : out  std_logic_vector(15 downto 0);
		R7 : in std_logic_vector(15 downto 0)
     );
		
  end entity ;
  
   architecture behave of reg_file_wrap is
	
	component reg_file is
    
    port (
	   clk        : in   std_logic;
	   rst        : in   std_logic;
	   wr         : in   std_logic;
	   rf_a1      : in  std_logic_vector(2 downto 0);
	   rf_a2      : in  std_logic_vector(2 downto 0);
	   rf_a3      : in  std_logic_vector(2 downto 0);
	   rf_d1      : out  std_logic_vector(15 downto 0);
	   rf_d2      : out  std_logic_vector(15 downto 0);
	   rf_d3      : in  std_logic_vector(15 downto 0);
		Reg7 : in std_logic_vector(15 downto 0)
     );
		
  end component ;

   signal P,Q,S,wr,branch_opcode : std_logic;
   signal R: std_logic_vector(1 downto 0);
   signal rf_a1,rf_a2,rf_a3: std_logic_vector(2 downto 0);
	signal rf_d3: std_logic_vector(15 downto 0);

begin
branch_opcode <= ((ir(15) and (not ir(14)) and (not ir(13))) or (ir(15) and (not ir(13)) and (not ir(12)))) and state(4) and (not(state(3) or state(2) or state(1) or state(0)));
P <= (not state(4)) and (not state(3)) and (not state(2)) and state(1) and (not state(0));
Q <= (not state(4)) and state(3) and (not state(2)) and state(1) and (not state(0));
S <= (not state(4)) and state(3) and state(2) and (not state(1)) and state(0);

R(0) <= (((not state(4)) and (not state(3)) and state(2) and (not state(1)) and (not state(0))) or 
        ((not state(4)) and state(3) and (not state(2)) and state(1) and (not state(0)))) or branch_opcode;

R(1) <= (state(4) and (not state(3)) and (not state(2)) and state(1) and state(0)) or branch_opcode; 

wr <= ((not state(4)) and (not state(3)) and state(2) and (not state(1)) and (not state(0))) or 
       ((not state(4)) and state(3) and (not state(2)) and state(1) and (not state(0)))      or
       (state(4) and (not state(3)) and (not state(2)) and state(1) and state(0)) or
       (state(4) and (not state(3)) and (not state(2)) and (not state(1)) and (not state(0))) ;


--rrfa1:process(S,ir,t3)
--begin
--	 case S is
--		when '0' =>  rf_a1 <= ir(8 downto 6);
--		when others =>  rf_a1 <= t3(2 downto 0);
--	 end case;
--end process rrfa1;

  rf_a1 <= 
     ir(8 downto 6) when s = '0' else 
     t3(2 downto 0) when s = '1' ;

--rrfa2:process(P,ir)
--begin
--	 case P is
--		when '0' =>  rf_a2 <= ir(11 downto 9);
--		when others =>  rf_a2 <= ir(5 downto 3);
--	 end case;
--end process rrfa2;

  rf_a2 <= 
     ir(11 downto 9) when p = '0' else 
     ir(5 downto 3) when p = '1' ;
	

-- rrfa3:process(Q,ir,t3)
-- begin
--	 case Q is
--		when '0' =>  rf_a3 <= ir(11 downto 9);
--		when others =>  rf_a3 <= t3(2 downto 0);
--	 end case;
-- end process rrfa3;

  rf_a3 <= 
     ir(11 downto 9) when q = '0' else 
     t3(2 downto 0) when q = '1' ;

-- rrfd3:process(R,pc,t1,app7)
-- begin
--	 case R is
--		when "00" =>  rf_d3 <= pc;
--		when "01" =>  rf_d3 <= t1;
--		when others =>  rf_d3 <= app7;
--	 end case;
-- end process rrfd3;

  rf_d3 <=
     pc when r = "00" else 
     t1 when r = "01" else
     app7 when r = "10" else
	  t4 when r = "11";

 reg_wrap: reg_file
    
    port map (
	   clk        => clk,
	   rst        => rst,
	   wr         => wr,
	   rf_a1      => rf_a1,
	   rf_a2      => rf_a2,
	   rf_a3      => rf_a3,
	   rf_d1      => rf_d1,
	   rf_d2      => rf_d2,
	   rf_d3      => rf_d3,
	   Reg7 => R7
     );
		




	end architecture behave;
	
  
  
 
