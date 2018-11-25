library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


 entity stage1 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : std_logic;
	   pc_control : in std_logic_vector(1 downto 0);
	   reg_b_val: in std_logic_vector(15 downto 0);
	   pc_plus_imm  : in std_logic_vector(15 downto 0);
	   ir		: out std_logic_vector(15 downto 0);
	   pc_old		: out std_logic_vector(15 downto 0);
	   --carry_yes :  out std_logic;
	   --zero_yes: out std_logic;
	   valid_out : out std_logic 
		
     );
		
 end entity ;

 architecture behave of stage1 is

  component alu is
  	port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
  end component;

  component memory1 is
    
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
		
  end component ;
signal pc :std_logic_vector (15 downto 0);
signal ir1 :std_logic_vector (15 downto 0) ;
signal pc_out : std_logic_vector(15 downto 0):= (others => '0');
signal membr1,membr2,membw1,membw2:std_logic_vector (7 downto 0);
signal carry1,zero1: std_logic;
signal valid_out1 : std_logic := '0';

 begin

ir1 <= membr1 & membr2;
valid_out <= valid_out1;
--carry_yes <= ((not ir1(15)) and (not ir1(14)) and (not ir1(13)) and (not ir1(12)) and (ir1(1)) and (not ir1(0)))
--             or ((not ir1(15)) and (not ir1(14)) and (ir1(13)) and (not ir1(12)) and (ir1(1)) and (not ir1(0)));

--zero_yes <= ((not ir1(15)) and (not ir1(14)) and (not ir1(13)) and (not ir1(12)) and (not ir1(1)) and (ir1(0)))
--             or ((not ir1(15)) and (not ir1(14)) and (ir1(13)) and (not ir1(12)) and (not ir1(1)) and (ir1(0)));

 pc_alu: alu 
	port map
	(xin      =>   pc,           
	 yin      =>   x"0001",         
	 m0       =>   '0' ,            
	 m1       =>   '0',     
	 zout     =>   pc_out,
	 c        => carry1,
	 z        =>  zero1  );

 code_mem: memory1
    
    port map (
	   clk       => clk ,
	   mema      => pc,
      membr1     => membr1,
		membr2     => membr2,
	   membw1     => membw1,
		membw2     => membw2,
	   wr        => '0' 
     );


 stg1:process(clk,rst)
 begin
 if rst = '1' then
 	pc <= x"0000";
 elsif rising_edge(clk) then
 	 case pc_control is
		when "00" =>  pc <= pc_out;
		when "01" =>  pc <= pc_plus_imm;
		when others =>  pc <= reg_b_val;
	 end case;
	 valid_out1 <= valid_in;

 	pc_old <= pc;		
 	ir <= ir1;

 end if;
 end process stg1;
  
 end architecture behave;