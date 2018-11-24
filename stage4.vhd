library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


 entity stage4 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : std_logic;
	   input_alu2_ctl : in std_logic_vector(1 downto 0);
	   output_ctrl: in std_logic;
	   reg_a_adr_in: in std_logic_vector(2 downto 0);
	   t1  : in std_logic_vector(15 downto 0);
	   t2_in  : in std_logic_vector(15 downto 0);
	   imm6  : in std_logic_vector(5 downto 0);
	   imm9  : in std_logic_vector(8 downto 0);
	   alu_op		: in std_logic_vector(1 downto 0);
	   pc_old_i		: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   reg_a_adr_out: out std_logic_vector(2 downto 0);
	   t2_out: out std_logic_vector(15 downto 0);
	   pc_old_o		: out std_logic_vector(15 downto 0);
	   alu_out : out std_logic_vector(15 downto 0);
	   p_carry: out std_logic;
	   carry_yes_o :  out std_logic;
	   zero_yes_o: out std_logic;
	   p_zero : out std_logic;
	   valid_out : out std_logic 
		
     );
		
 end entity ;

 architecture behave of stage4 is

  component alu is
  	port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
  end component;
		
signal imm6_16,imm9_se_16,imm9_app_16,yin,alu_out1 :std_logic_vector (15 downto 0);
signal carry1,zero1: std_logic;

 begin

imm6_16(5 downto 0) <= imm6;
imm6_16(15 downto 6) <= (others => '0');

imm9_se_16(8 downto 0) <= imm9;
imm9_se_16(15 downto 9) <= (others => '0');

imm9_app_16(6 downto 0) <= (others => '0');
imm9_app_16(15 downto 7) <= imm9;

--carry_yes <= ((not ir1(15)) and (not ir1(14)) and (not ir1(13)) and (not ir1(12)) and (ir1(1)) and (not ir1(0)))
--             or ((not ir1(15)) and (not ir1(14)) and (ir1(13)) and (not ir1(12)) and (ir1(1)) and (not ir1(0)));

--zero_yes <= ((not ir1(15)) and (not ir1(14)) and (not ir1(13)) and (not ir1(12)) and (not ir1(1)) and (ir1(0)))
--             or ((not ir1(15)) and (not ir1(14)) and (ir1(13)) and (not ir1(12)) and (not ir1(1)) and (ir1(0)));

 stage_4_alu: alu 
	port map
	(xin      =>   t1,           
	 yin      =>   yin,         
	 m0       =>   alu_op(0),            
	 m1       =>   alu_op(1),     
	 zout     =>   alu_out1,
	 c        => carry1,
	 z        =>  zero1  );

 yin <= t2_in when input_alu2_ctl = "00" else 
     imm6_16 when input_alu2_ctl = "01" else 
     imm9_se_16 when input_alu2_ctl = "10" else 
     imm9_app_16 when input_alu2_ctl = "11";

 stg4:process(clk)
 begin
 if rising_edge(clk) then
 	p_carry <= carry1;
 	p_zero <= zero1;
 	 case output_ctrl is
		when '0' =>  alu_out <= alu_out1;
		when others =>  alu_out <= imm9_app_16;
	 end case;
	 if(valid_in='0') then
	 	valid_out <= '0';
	 else valid_out <= '1';
	 end if;

 	pc_old_o <= pc_old_i;		
 	carry_yes_o <= carry_yes_i;
 	zero_yes_o <= zero_yes_i;
 	t2_out <= t2_in;
 	reg_a_adr_out <= reg_a_adr_in;

 end if;
 end process stg4;
  
 end architecture behave;