library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


 entity stage5 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   p_carry_i: in std_logic;
	   p_zero_i: in std_logic;

	   output_ctrl: in std_logic;
	   read_ctrl: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;
	   reg_wr_6 : in std_logic;

	   alu_out_5 : in std_logic_vector(15 downto 0);
	   reg_a_adr_in: in std_logic_vector(2 downto 0);
	   t2_in  : in std_logic_vector(15 downto 0);
	   pc_old_i		: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   reg_a_adr_out: out std_logic_vector(2 downto 0);
	   t2_out: out std_logic_vector(15 downto 0);
	   pc_old_o		: out std_logic_vector(15 downto 0);
	   stage_5_out : out std_logic_vector(15 downto 0);
	   p_carry_o: out std_logic;
	   carry_yes_o :  out std_logic;
	   zero_yes_o: out std_logic;
	   p_zero_o : out std_logic;

	   reg_inp_data_ctl_6_o: out std_logic;
	   reg_wr_6_o : out std_logic;

	   valid_out : out std_logic 
		
     );
		
 end entity ;

 architecture behave of stage5 is

   component memory2 is
    
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

signal mem_out:std_logic_vector (15 downto 0);
signal membr1,membr2:std_logic_vector (7 downto 0);

 begin

mem_out <= membr1 & membr2;

 data_mem: memory2
    
    port map (
	   clk       => clk ,
	   mema      => alu_out_5,
      membr1     => membr1,
		membr2     => membr2,
	   membw1     => t2_in(15 downto 8),
		membw2     => t2_in(7 downto 0),
	   wr        => read_ctrl 
     );


 stg5:process(clk)
 begin
 if rising_edge(clk) then
 	p_carry_o <= p_carry_i;
 	p_zero_o <= p_zero_i;

 	 case output_ctrl is
		when '1' =>  stage_5_out <= mem_out;
		when others =>  stage_5_out <= alu_out_5;
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

 	reg_inp_data_ctl_6_o <= reg_inp_data_ctl_6;
 	reg_wr_6_o <= reg_wr_6;

 end if;
 end process stg5;
  
 end architecture behave;