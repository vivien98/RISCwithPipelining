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

	   valid_out : out std_logic ;

	   mem_addr_in 				: in std_logic_vector(15 downto 0);
	   write_mem_data			: in std_logic_vector(15 downto 0);
	   read_mem_data			: out std_logic_vector(15 downto 0);
	   write_to_mem				: in std_logic;
	   lm_active 				: in std_logic;
	   sm_active 				: in std_logic;

	   stage5_out_hzrd			: out std_logic_vector(15 downto 0)
		
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

signal mem_out,memadr,stage5_out1:std_logic_vector (15 downto 0);
signal membr1,membr2,membw1,membw2:std_logic_vector (7 downto 0);
signal mem_read: std_logic;
signal valid_out1 : std_logic := '0';

 begin
valid_out <= valid_out1;

mem_out <= membr1 & membr2;
read_mem_data <= mem_out;

memadr <= mem_addr_in when (lm_active='1'or sm_active='1') else
		alu_out_5;

mem_read <= write_to_mem when (lm_active='1'or sm_active='1')else
		read_ctrl and valid_in;

membw1 <= write_mem_data(15 downto 8) when sm_active='1' else
			t2_in(15 downto 8) ;

membw2 <= write_mem_data(7 downto 0) when sm_active='1' else
			t2_in(7 downto 0) ;			
 data_mem: memory2
    
    port map (
	   clk       => clk ,
	   mema      => memadr,
      membr1     => membr1,
		membr2     => membr2,
	   membw1     => membw1,
		membw2     => membw2,
	   wr        => mem_read
     );

stage5_out1 <= mem_out when output_ctrl = '1' else
				alu_out_5 ;

stage5_out_hzrd <= stage5_out1;

 stg5:process(clk)
 begin
 if rising_edge(clk) then
 	p_carry_o <= p_carry_i;
 	p_zero_o <= p_zero_i;

 	 stage_5_out <= stage5_out1;

	 valid_out1 <= valid_in;

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