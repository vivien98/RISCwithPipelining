library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


 entity risc_pipelining is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic
		
     );
		
 end entity ;


 architecture behave of risc_pipelining is

  component stage1 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : std_logic;
	   pc_control : in std_logic_vector(1 downto 0);
	   reg_b_val: in std_logic_vector(15 downto 0);
	   pc_plus_imm  : in std_logic_vector(15 downto 0);
	   ir		: out std_logic_vector(15 downto 0);
	   pc_old		: out std_logic_vector(15 downto 0);
	   valid_out : out std_logic 
		
     );
		
 end component ;

 component stage2 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   ir : in std_logic_vector(15 downto 0);
	   pc_old_i: in std_logic_vector(15 downto 0);
	   carry_yes :  out std_logic;
	   zero_yes: out std_logic;
	   pc_old_o		: out std_logic_vector(15 downto 0);
	   imm6 : out std_logic_vector(5 downto 0);
	   imm9 : out std_logic_vector(8 downto 0);
	   reg_a_addr: out std_logic_vector(2 downto 0);
	   reg_b_addr: out std_logic_vector(2 downto 0);
	   reg_c_addr: out std_logic_vector(2 downto 0); 
	   alu_op : out std_logic_vector(1 downto 0);
	   pc_plus_imm: out std_logic_vector(15 downto 0);
	   reg_addr2_ctl_3 : out std_logic;
	   input_alu2_ctl_4 : out std_logic_vector(1 downto 0);
	   output_ctrl_4: out std_logic;
	   output_ctrl_5: out std_logic;
	   reg_inp_data_ctl_6: out std_logic;
	   mem_rd_5 : out std_logic;
	   reg_wr_6 : out std_logic;
	   jlr_yes : out std_logic;
	   beq_jal_yes: out std_logic;
	   valid_out : out std_logic

		
     );
		
 end component ;

 component stage3 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   jlr_yes : in std_logic;
	   beq_jal_yes: in std_logic;

	   reg_addr2_ctl : in std_logic;
	   input_alu2_ctl_4 : in std_logic_vector(1 downto 0);
	   output_ctrl_4: in std_logic;
	   output_ctrl_5: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;
	   mem_rd_5 : in std_logic;
	   reg_wr_6 : in std_logic;

	   pc_old_i: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   imm6_i : in std_logic_vector(5 downto 0);
	   imm9_i : in std_logic_vector(8 downto 0);
	   reg_a_addr_i: in std_logic_vector(2 downto 0);
	   reg_b_addr: in std_logic_vector(2 downto 0);
	   reg_c_addr: in std_logic_vector(2 downto 0); 
	   alu_op_i : in std_logic_vector(1 downto 0);
	   t1 : out std_logic_vector(15 downto 0);
	   t2 : out std_logic_vector ( 15 downto 0);
	   alu_op_o: out std_logic_vector(1 downto 0);
	   pc_old_o		: out std_logic_vector(15 downto 0);
       imm6_o : out std_logic_vector(5 downto 0);
	   imm9_o : out std_logic_vector(8 downto 0);
	   reg_b_val : out std_logic_vector(15 downto 0);
	   reg_a_addr_o : out std_logic_vector(2 downto 0);
	   carry_yes_o :  out std_logic;
	   zero_yes_o: out std_logic;
       xor_comp: out std_logic;

       input_alu2_ctl_4_o : out std_logic_vector(1 downto 0);
	   output_ctrl_4_o: out std_logic;
	   output_ctrl_5_o: out std_logic;
	   reg_inp_data_ctl_6_o: out std_logic;
	   mem_rd_5_o : out std_logic;
	   reg_wr_6_o : out std_logic;

	   jlr_yes_o : out std_logic;
	   beq_jal_yes_o: out std_logic;

	   valid_out : out std_logic
		
     );
	  
	  end component;

 component stage4 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : std_logic;
	   input_alu2_ctl : in std_logic_vector(1 downto 0);
	   output_ctrl: in std_logic;
	   output_ctrl_5: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;
	   mem_rd_5 : in std_logic;
	   reg_wr_6 : in std_logic;

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

	   output_ctrl_5_o: out std_logic;
	   reg_inp_data_ctl_6_o: out std_logic;
	   mem_rd_5_o : out std_logic;
	   reg_wr_6_o : out std_logic;

	   valid_out : out std_logic 
		
     );
		
 end component ;


  component stage5 is
    
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
		
 end component ;

  component stage6 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   p_carry_i: in std_logic;
	   p_zero_i: in std_logic;

	   reg_inp_data_ctl: in std_logic;
	   reg_wr : in std_logic;

	   stage_5_out_6 : in std_logic_vector(15 downto 0);
	   reg_a_adr_in: in std_logic_vector(2 downto 0);
	   pc_old_i		: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   valid_out : out std_logic
		
     );

    end component;


signal  reg_b_val_3,pc_plus_imm_2,ir_1,pc_old_1,pc_old_2,pc_old_3,pc_old_4,pc_old_5: std_logic_vector(15 downto 0);
signal  t1_3,t2_3,t2_4,t2_5,alu_out_4,stage_5_out_5 : std_logic_vector(15 downto 0);


signal  imm9_2,imm9_3: std_logic_vector(8 downto 0);
signal  imm6_2,imm6_3: std_logic_vector(5 downto 0);
signal  reg_a_addr_2,reg_a_addr_3,reg_a_addr_4,reg_a_addr_5,reg_b_addr_2,reg_c_addr_2: std_logic_vector(2 downto 0);

signal  pc_control,alu_op_2,alu_op_3,input_alu2_ctl_4_2,input_alu2_ctl_4_3: std_logic_vector(1 downto 0);

signal  valid_out_1,valid_out_2,valid_out_3,valid_out_4,valid_out_5,valid_out_6: std_logic;
signal  carry_yes_2,carry_yes_3,carry_yes_4,carry_yes_5,zero_yes_2,zero_yes_3,zero_yes_4,zero_yes_5,p_carry_4,p_carry_5,p_zero_4,p_zero_5 : std_logic;
signal  reg_addr2_ctl_3_2,output_ctrl_4_2,output_ctrl_4_3    : std_logic;
signal  output_ctrl_5_2,output_ctrl_5_3,output_ctrl_5_4,mem_rd_5_2,mem_rd_5_3,mem_rd_5_4           :std_logic;
signal  reg_wr_6_2,reg_wr_6_3,reg_wr_6_4,reg_wr_6_5,reg_inp_data_ctl_6_2,reg_inp_data_ctl_6_3,reg_inp_data_ctl_6_4,reg_inp_data_ctl_6_5:std_logic;
signal  beq_jal_yes_2,beq_jal_yes_3,jlr_yes_2,jlr_yes_3,xor_comp_3 :std_logic;

 
 begin
 

 stg1: stage1 
 port map (

 	   clk                => clk,
	   rst			      => rst,
	   valid_in           => '1',
	   pc_control         => "00",
	   reg_b_val          =>  reg_b_val_3,
	   pc_plus_imm        => pc_plus_imm_2,
	   ir		          =>   ir_1,
	   pc_old		      => pc_old_1,
	   valid_out          => valid_out_1
 	
 );

 stg2 : stage2
 port map (

 	   clk                    => clk,
	   rst	                  =>  rst,
	   valid_in               => valid_out_1,
	   ir                     => ir_1,
	   pc_old_i               => pc_old_1,
	   carry_yes              => carry_yes_2,
	   zero_yes               =>  zero_yes_2,
	   pc_old_o		          => pc_old_2,
	   imm6                   => imm6_2,
	   imm9                   => imm9_2,
	   reg_a_addr             => reg_a_addr_2,
	   reg_b_addr             => reg_b_addr_2,
	   reg_c_addr             => reg_c_addr_2,
	   alu_op                 =>  alu_op_2,
	   pc_plus_imm            =>  pc_plus_imm_2,
	   reg_addr2_ctl_3        => reg_addr2_ctl_3_2,
	   input_alu2_ctl_4       => input_alu2_ctl_4_2,
	   output_ctrl_4          => output_ctrl_4_2,
	   output_ctrl_5          => output_ctrl_5_2,
	   reg_inp_data_ctl_6     => reg_inp_data_ctl_6_2,
	   mem_rd_5               => mem_rd_5_2,
	   reg_wr_6               => reg_wr_6_2,
	   jlr_yes                =>  jlr_yes_2,
	   beq_jal_yes            => beq_jal_yes_2,
	   valid_out              => valid_out_2
 	
 );

 stg3: stage3
 port map (
 	   clk                        => clk,
	   rst		                  => rst,
	   valid_in                   => valid_out_2,
	   jlr_yes                    => jlr_yes_2,
	   beq_jal_yes                => beq_jal_yes_2,

	   reg_addr2_ctl              =>  reg_addr2_ctl_3_2,
	   input_alu2_ctl_4           => input_alu2_ctl_4_2,
	   output_ctrl_4              => output_ctrl_4_2,
	   output_ctrl_5              => output_ctrl_5_2,
	   reg_inp_data_ctl_6         => reg_inp_data_ctl_6_2,
	   mem_rd_5                   =>  mem_rd_5_2,
	   reg_wr_6                   =>  reg_wr_6_2,

	   pc_old_i                   => pc_old_2,
	   carry_yes_i                => carry_yes_2,
	   zero_yes_i                 => zero_yes_2,
	   imm6_i                     => imm6_2,
	   imm9_i                     => imm9_2,
	   reg_a_addr_i               =>reg_a_addr_2,
	   reg_b_addr                 =>  reg_b_addr_2,
	   reg_c_addr                 => reg_c_addr_2,
	   alu_op_i                   =>   alu_op_2,
	   t1                         =>  t1_3,
	   t2                         =>  t2_3,
	   alu_op_o                   =>  alu_op_3,
	   pc_old_o		              => pc_old_3,
       imm6_o                     =>  imm6_3,
	   imm9_o                     =>  imm9_3,
	   reg_b_val                  => reg_b_val_3,
	   reg_a_addr_o               => reg_a_addr_3,
	   carry_yes_o                => carry_yes_3,
	   zero_yes_o                 =>  zero_yes_3,
       xor_comp                   =>  xor_comp_3,
                
       input_alu2_ctl_4_o         => input_alu2_ctl_4_3,
	   output_ctrl_4_o            =>  output_ctrl_4_3,
	   output_ctrl_5_o            =>  output_ctrl_5_3,
	   reg_inp_data_ctl_6_o       => reg_inp_data_ctl_6_3,
	   mem_rd_5_o                 =>  mem_rd_5_3,
	   reg_wr_6_o                 =>  reg_wr_6_3,

	   jlr_yes_o                  =>  jlr_yes_3,
	   beq_jal_yes_o              => beq_jal_yes_3,

	   valid_out                  =>  valid_out_3
 );


 stg4: stage4

 port map (

 	   clk                          => clk,
	    rst	                        => rst,
	   valid_in                     => valid_out_3,
	   input_alu2_ctl               => input_alu2_ctl_4_3,
	   output_ctrl                  =>    output_ctrl_4_3,
	   output_ctrl_5                =>   output_ctrl_5_3,
	   reg_inp_data_ctl_6           => reg_inp_data_ctl_6_3,
	   mem_rd_5                     =>  mem_rd_5_3,
	   reg_wr_6                     =>  reg_wr_6_3,

	   reg_a_adr_in                 =>  reg_a_addr_3,
	   t1                           =>  t1_3,
	   t2_in                        =>  t2_3,
	   imm6                         =>   imm6_3,
	   imm9                         =>   imm9_3,
	   alu_op		                =>   alu_op_3,
	   pc_old_i		                =>   pc_old_3,
	   carry_yes_i                  =>    carry_yes_3,
	   zero_yes_i                   =>   zero_yes_3,
	   reg_a_adr_out                =>   reg_a_addr_4,
	   t2_out                       =>  t2_4,
	   pc_old_o		                =>   pc_old_4,
	   alu_out                      =>   alu_out_4,
	   p_carry                      => p_carry_4,
	   carry_yes_o                  =>   carry_yes_4,
	   zero_yes_o                   =>  zero_yes_4,
	   p_zero                       =>   p_zero_4,

	   output_ctrl_5_o              =>   output_ctrl_5_4,
	   reg_inp_data_ctl_6_o         =>   reg_inp_data_ctl_6_4,
	   mem_rd_5_o                   =>    mem_rd_5_4,
	   reg_wr_6_o                   =>    reg_wr_6_4,

	   valid_out                    => valid_out_4
 	
 );


 stg5 : stage5
 port map (

	   clk                      =>  clk,
	   rst		                =>  rst,
	   valid_in                 =>  valid_out_4,
	   p_carry_i                =>  p_carry_4,
	   p_zero_i                 =>  p_zero_4,

	   output_ctrl              =>  output_ctrl_5_4,
	   read_ctrl                =>  mem_rd_5_4,
	   reg_inp_data_ctl_6       => reg_inp_data_ctl_6_4,
	   reg_wr_6                 =>  reg_wr_6_4,

	   alu_out_5                =>  alu_out_4,
	   reg_a_adr_in             =>  reg_a_addr_4,
	   t2_in                    =>  t2_4,
	   pc_old_i		            => pc_old_4,
	   carry_yes_i              =>  carry_yes_4,
	   zero_yes_i               =>  zero_yes_4,
	   reg_a_adr_out            => reg_a_addr_5,
	   t2_out                   =>  t2_5,
	   pc_old_o		            => pc_old_5,
	   stage_5_out              =>  stage_5_out_5,
	   p_carry_o                =>  p_carry_5,
	   carry_yes_o              =>  carry_yes_5,
	   zero_yes_o               =>  zero_yes_5,
	   p_zero_o                 =>  p_zero_5,

	   reg_inp_data_ctl_6_o     =>  reg_inp_data_ctl_6_5,
	   reg_wr_6_o               =>  reg_wr_6_5,

	   valid_out                =>  valid_out_5
 	
 );


 stg6: stage6
port map (

	   clk                    =>  clk,
	   rst		              =>  rst,
	   valid_in               =>  valid_out_5,
	   p_carry_i              =>  p_carry_5,
	   p_zero_i               =>  p_zero_5,

	   reg_inp_data_ctl       =>  reg_inp_data_ctl_6_5,
	   reg_wr                 =>  reg_wr_6_5,

	   stage_5_out_6          =>   stage_5_out_5,
	   reg_a_adr_in           =>   reg_a_addr_5,
	   pc_old_i		          =>  pc_old_5,
	   carry_yes_i            =>   carry_yes_5,
	   zero_yes_i             =>   zero_yes_5,
	   valid_out              =>   valid_out_6
	
);
 
 	
 end architecture behave;