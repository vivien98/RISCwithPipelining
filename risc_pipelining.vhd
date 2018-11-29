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
	   hzrd_clk: in std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   ir : in std_logic_vector(15 downto 0);
	   pc_old_i: in std_logic_vector(15 downto 0);
	   carry_yes :  out std_logic;
	   zero_yes: out std_logic;
	   pc_old_o		: out std_logic_vector(15 downto 0);
	   imm6 : out std_logic_vector(5 downto 0);
	   imm9 : out std_logic_vector(8 downto 0);

	   read_from_a: out std_logic;
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
	   beq_yes: out std_logic;
	   jal_yes: out std_logic;
	   valid_out : out std_logic;
	   lm_out_2 : out std_logic;
	   sm_out_2 : out std_logic;
	   r_a_hzrd: out std_logic_vector(2 downto 0);
	   r_b_hzrd:out std_logic_vector(2 downto 0);
	   r_c_hzrd:out std_logic_vector(2 downto 0);
	   load_hzrd_out_2a:out std_logic;
	   load_hzrd_out_2b:out std_logic;
	   load_hzrd_out_2c:out std_logic;
	   load_hzrd_out_2 : out std_logic;
	   load_lukhi3: in std_logic;
	   ra_is_r7 : out std_logic;
	   rb_is_r7 : out std_logic;
	   rc_is_r7 : out std_logic
		
     );
		
 end component ;

 component stage3 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   jlr_yes : in std_logic;
	   beq_yes: in std_logic;
	   jal_yes: in std_logic;
	   	   load_lukhi: in std_logic;

	   reg_addr2_ctl : in std_logic;
	   input_alu2_ctl_4 : in std_logic_vector(1 downto 0);
	   output_ctrl_4: in std_logic;
	   output_ctrl_5: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;
	   mem_rd_5 : in std_logic;
	   reg_wr_6 : in std_logic;

	   rf_d1 : in std_logic_vector(15 downto 0);
	   rf_d2: in std_logic_vector(15 downto 0);

	   pc_plus_imm: in std_logic_vector(15 downto 0);
	   pc_old_i: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   imm6_i : in std_logic_vector(5 downto 0);
	   imm9_i : in std_logic_vector(8 downto 0);
	   reg_a_addr_i: in std_logic_vector(2 downto 0);
	   reg_b_addr: in std_logic_vector(2 downto 0);
	   reg_c_addr: in std_logic_vector(2 downto 0); 

	   read_from_a: in std_logic;
	   r_a_hzrd: in std_logic_vector(2 downto 0);
	   r_b_hzrd: in std_logic_vector(2 downto 0);
	   r_c_hzrd: in std_logic_vector(2 downto 0); 
	   stage4_op: in std_logic_vector(15 downto 0);
	   stage5_op: in std_logic_vector(15 downto 0);
	   stage6_op: in std_logic_vector(15 downto 0);
	   valid_vec_hzrd: in std_logic_vector(2 downto 0);

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

	   rf_a2: out std_logic_vector(2 downto 0);
	   pc_plus_imm_o: out std_logic_vector(15 downto 0);

	   jlr_yes_o : out std_logic;
	   beq_yes_o: out std_logic;
	   jal_yes_o: out std_logic;

	   valid_out : out std_logic;

	   load_hzrd_out_2a:in std_logic;
	   load_hzrd_out_2b:in std_logic;
	   load_hzrd_out_2c:in std_logic;

	   ra_is_r7 : in std_logic;
	   rb_is_r7 : in std_logic;
	   rc_is_r7 : in std_logic

		
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
	   	   jlr_yes : in std_logic;
	   beq_yes: in std_logic;
	   jal_yes: in std_logic;

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
	   	   jlr_yes_o : out std_logic;
	   beq_yes_o: out std_logic;
	   jal_yes_o: out std_logic;

	   valid_out : out std_logic;

	   stage4_out_hzrd : out std_logic_vector(15 downto 0);

	   p_carry_com: out std_logic;
	   p_zero_com:out std_logic
		
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
	   	   jlr_yes : in std_logic;
	   beq_yes: in std_logic;
	   jal_yes: in std_logic;

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
	   	   jlr_yes_o : out std_logic;
	   beq_yes_o: out std_logic;
	   jal_yes_o: out std_logic;

	   reg_inp_data_ctl_6_o: out std_logic;
	   reg_wr_6_o : out std_logic;

	   valid_out : out std_logic ;

	   mem_addr_in 				: in std_logic_vector(15 downto 0);
	   write_mem_data			: in std_logic_vector(15 downto 0);
	   read_mem_data			: out std_logic_vector(15 downto 0);
	   write_to_mem				: in std_logic;
	   lm_active 				: in std_logic;
	   sm_active 				: in std_logic;

	   stage5_out_hzrd : out std_logic_vector(15 downto 0)

		
     );
		
 end component ;

  component stage6 is
    
    port (
    	sm_active : in std_logic;
    	pc_to_r7i : in std_logic_vector (15 downto 0);
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   p_carry_i: in std_logic;
	   p_zero_i: in std_logic;
	   	   jlr_yes : in std_logic;
	   beq_yes: in std_logic;
	   jal_yes: in std_logic;

	   reg_inp_data_ctl: in std_logic;
	   reg_wr : in std_logic;

	   stage_5_out_6 : in std_logic_vector(15 downto 0);
	   reg_a_adr_in: in std_logic_vector(2 downto 0);
	   pc_old_i		: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   reg_wr1 : out std_logic;
	   rrf_d3 : out std_logic_vector(15 downto 0);
	   valid_out : out std_logic;
	   pc_to_r7 : out std_logic_vector(15 downto 0);
	   wr_7 : out std_logic;
	   stage6_out_hzrd : out std_logic_vector(15 downto 0)
		
     );

    end component;

  component reg_file is
    
    port (
	   clk        : in   std_logic;
	   rst        : in   std_logic;
	   wr         : in   std_logic;
	   wr_7         : in   std_logic;
	   rf_a1      : in  std_logic_vector(2 downto 0);
	   rf_a2      : in  std_logic_vector(2 downto 0);
	   rf_a3      : in  std_logic_vector(2 downto 0);
	   rf_d1      : out  std_logic_vector(15 downto 0);
	   rf_d2      : out  std_logic_vector(15 downto 0);
	   rf_d3      : in  std_logic_vector(15 downto 0);
		Reg7 : in std_logic_vector(15 downto 0)
     );
		
  end component ;

  component controller is 
	port(
			sm_active_7 : out std_logic;
			clk: in std_logic;
			rst: in std_logic;
			valid_2: in std_logic;
			lm_out_2: in std_logic;
			sm_out_2: in std_logic;
			mem_addr_in: in std_logic_vector(15 downto 0);
			mem_data_in: in std_logic_vector(15 downto 0);
			reg_data_in:in std_logic_vector(15 downto 0);
			shifter_bit_0: in std_logic;
			next_mem_addr:out std_logic_vector(15 downto 0);
			clk1,clk2,clk3,clk4:out std_logic;
			write_to_reg:out std_logic;
			write_to_mem:out std_logic;
			write_mem_data:out std_logic_vector(15 downto 0);
			write_reg_data:out std_logic_vector(15 downto 0);
			reg_addr_out:out std_logic_vector(2 downto 0);
			shift_now:out std_logic;
			lm_active_now:out std_logic;
			sm_active_now:out std_logic;
			load_init_mem_addr:out std_logic;
			load_hzrd_out_2:in std_logic;
			load_lukhi3:out std_logic;
			load_lukhi4:out std_logic
		);
	end component;

	component shifter is
	port(clk,shift,wr: in std_logic ;writeData : in std_logic_vector(7 downto 0);bit1: out std_logic);
	end component;

signal  reg_b_val_3,pc_plus_imm_1,pc_plus_imm_2,pc_plus_imm_3,ir_1,pc_old_1,pc_old_2,pc_old_3,pc_old_4,pc_old_5: std_logic_vector(15 downto 0);
signal  t1_3,t2_3,t2_4,t2_5,alu_out_4,stage_5_out_5,rf_d1_3,rf_d2_3,rrf_d3_6,R7,pc_to_r7,pc_to_r7i : std_logic_vector(15 downto 0);


signal  imm9_2,imm9_3: std_logic_vector(8 downto 0);
signal  imm6_2,imm6_3: std_logic_vector(5 downto 0);
signal  reg_a_addr_2,reg_a_addr_3,reg_a_addr_4,reg_a_addr_5,reg_b_addr_2,reg_c_addr_2,rf_a2_3: std_logic_vector(2 downto 0);

signal  pc_control,alu_op_2,alu_op_3,input_alu2_ctl_4_2,input_alu2_ctl_4_3: std_logic_vector(1 downto 0);

signal  valid_out_1,valid_out_2,valid_out_3,valid_out_4,valid_out_5,valid_out_6: std_logic;
signal  carry_yes_2,carry_yes_3,carry_yes_4,carry_yes_5,zero_yes_2,zero_yes_3,zero_yes_4,zero_yes_5,p_carry_4,p_carry_5,p_zero_4,p_zero_5 : std_logic;
signal  reg_addr2_ctl_3_2,output_ctrl_4_2,output_ctrl_4_3    : std_logic;
signal  output_ctrl_5_2,output_ctrl_5_3,output_ctrl_5_4,mem_rd_5_2,mem_rd_5_3,mem_rd_5_4           :std_logic;
signal  reg_wr_6_2,reg_wr_6_3,reg_wr_6_4,reg_wr_6_5,reg_inp_data_ctl_6_2,reg_inp_data_ctl_6_3,reg_inp_data_ctl_6_4,reg_inp_data_ctl_6_5:std_logic;
signal  beq_yes_2,beq_yes_3,jlr_yes_2,jlr_yes_3,jal_yes_2,jal_yes_3,xor_comp_3,reg_wr1_6 :std_logic;
signal  valid_in_1,valid_in_2,valid_decider_1,valid_decider_2 : std_logic;
signal  pc_control_decider: std_logic;
signal  ra_is_r7,rb_is_r7,rc_is_r7: std_logic;
signal lm_out_2,sm_out_2,shifter_bit_0,shift_now,clk1,clk2,clk3,clk4,write_to_mem,write_to_reg,load_init_mem_addr,lm_active,sm_active,rf_wr:std_logic;
signal mem_addr_in,reg_data_in,mem_to_ctrl_data,ctrl_to_reg_data,ctrl_to_mem_data,next_mem_addr,rf_d3,stage4_op,stage5_op,stage6_op:std_logic_vector(15 downto 0);
signal reg_addr_out,rf_a1,rf_a3,ctrl_to_reg_addr,r_b_hzrd,r_c_hzrd,r_a_hzrd:std_logic_vector(2 downto 0);
signal clkk_1,clkk_2,clkk_3,clkk_4,wait_for_lmsm,wr_7 : std_logic;
signal valid_out_33,valid_out_44,valid_out_55,valid_hzrd_0,valid_hzrd_1,valid_hzrd_2,load_hzrd_out_2a,load_hzrd_out_2,load_hzrd_out_2c,load_hzrd_out_2b,read_from_a :std_logic;
signal jal_yes_4,jlr_yes_4,beq_yes_4,jal_yes_5,beq_yes_5,jlr_yes_5,load_lukhi3,load_lukhi4,sm_active_7,p_carry_com,p_zero_com: std_logic;

 begin

 clkk_1 <= clk and clk1;
 clkk_2 <= clk and clk2;
 clkk_3 <= clk and clk3;
 clkk_4 <= clk and clk4;

valid_out_33 <= wait_for_lmsm and valid_out_3 and (not load_lukhi4) and (not(carry_yes_2 and (not p_carry_com) and valid_out_33)) and (not(zero_yes_2 and (not p_zero_com) and valid_out_33));
valid_out_44 <= wait_for_lmsm and valid_out_4;
valid_out_55 <= wait_for_lmsm and valid_out_5;
 
wait_for_lmsm <= not (lm_active or sm_active);

valid_in_1 <= (not ((valid_out_2 and ((beq_yes_2 and (not xor_comp_3)) or jlr_yes_2)) or (valid_out_1 and jal_yes_2))) and (not rst) ; 

valid_in_2 <= (not ((beq_yes_2 and (not xor_comp_3) and valid_out_2) or (jlr_yes_2 and valid_out_2))) and valid_out_1 and (not rst);  


pc_control <= "10" when (jlr_yes_2 and valid_out_2)='1' else
			  "01" when ((beq_yes_2 and (not xor_comp_3) and valid_out_2) or (valid_out_1 and jal_yes_2 and (not (jlr_yes_2 and valid_out_2)))) ='1' else 
			  "00" ;

pc_plus_imm_1 <= pc_plus_imm_3 when (beq_yes_2 and (not xor_comp_3) and valid_out_2)='1' else 
                 pc_plus_imm_2 when  ((not(beq_yes_2 and (not xor_comp_3) and valid_out_2)) and (valid_out_1 and jal_yes_2)) ='1'; 


valid_hzrd_0 <= valid_out_33 and (not beq_yes_3);
valid_hzrd_1 <= valid_out_44 and (not beq_yes_4);
valid_hzrd_2 <= valid_out_55 and (not beq_yes_5);

pc_to_r7i <= pc_old_4 when valid_out_44 = '1' else
			 pc_old_3 when valid_out_33 = '1' else
			 pc_old_2 when valid_out_2 = '1' else
			 pc_old_1;


process( clk )
begin
	if(rising_edge(clk) and (lm_active or sm_active) ='1')then
		mem_addr_in <= next_mem_addr;
	elsif(rising_edge(clk) and load_init_mem_addr='1') then
		mem_addr_in <= t2_3;
	end if;
end process ; 

controller1: controller port map (
		sm_active_7 => sm_active_7,
 		clk => clk,
 		rst => rst,
 		valid_2 => valid_out_2,
 		lm_out_2 => lm_out_2,
 		sm_out_2 => sm_out_2,
 		mem_addr_in => mem_addr_in,
 		reg_data_in => rf_d1_3,
 		mem_data_in => mem_to_ctrl_data,
 		shifter_bit_0 => shifter_bit_0,
 		next_mem_addr => next_mem_addr,
 		clk1 => clk1,
 		clk2 => clk2,
 		clk3 => clk3,
 		clk4 => clk4,
 		write_to_reg => write_to_reg,
 		write_to_mem => write_to_mem,
 		write_mem_data => ctrl_to_mem_data,
 		write_reg_data => ctrl_to_reg_data,
 		reg_addr_out => ctrl_to_reg_addr,
 		shift_now => shift_now,
 		lm_active_now => lm_active,
 		sm_active_now => sm_active,
 		load_init_mem_addr => load_init_mem_addr,
   		load_hzrd_out_2        => load_hzrd_out_2,
   		load_lukhi3 => load_lukhi3,
 		load_lukhi4 => load_lukhi4
 		);

shifter1:shifter port map(

		clk => clk ,
		shift => shift_now,
		wr => clk3,
		writeData => imm9_2(7 downto 0),
		bit1 => shifter_bit_0

	);

 stg1: stage1 
 port map (

 	   clk                => clkk_1,
	   rst			      => rst,
	   valid_in           => valid_in_1,
	   pc_control         => pc_control,
	   reg_b_val          =>  reg_b_val_3,
	   pc_plus_imm        => pc_plus_imm_1,
	   ir		          =>   ir_1,
	   pc_old		      => pc_old_1,
	   valid_out          => valid_out_1
 	
 );

 stg2 : stage2
 port map (

 	   clk                    => clkk_2,
 	   hzrd_clk				  => clk,
	   rst	                  =>  rst,
	   valid_in               => valid_in_2,
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
	   beq_yes                => beq_yes_2,
	   jal_yes                => jal_yes_2,
	   valid_out              => valid_out_2,
	   lm_out_2				  => lm_out_2,
	   sm_out_2				  => sm_out_2,
	   read_from_a			  => read_from_a,
	   r_a_hzrd				  => r_a_hzrd,
	   r_b_hzrd				  => r_b_hzrd,
	   r_c_hzrd				  => r_c_hzrd,
	   load_hzrd_out_2a		  => load_hzrd_out_2a,
	   load_hzrd_out_2b 	  => load_hzrd_out_2b,
	   load_hzrd_out_2c 	  => load_hzrd_out_2c,
	   load_hzrd_out_2        => load_hzrd_out_2,
	   load_lukhi3			  => load_lukhi3,
	   ra_is_r7				  => ra_is_r7,	
	   rb_is_r7				  => rb_is_r7,
	   rc_is_r7 			  => rc_is_r7
 	
 );


 stg3: stage3
 port map (
 	   clk                        => clkk_3,
	   rst		                  => rst,
	   valid_in                   => valid_out_2,
	   jlr_yes                    => jlr_yes_2,
	   beq_yes                    => beq_yes_2,
	   jal_yes                    =>  jal_yes_2,
	   reg_addr2_ctl              =>  reg_addr2_ctl_3_2,
	   input_alu2_ctl_4           => input_alu2_ctl_4_2,
	   output_ctrl_4              => output_ctrl_4_2,
	   output_ctrl_5              => output_ctrl_5_2,
	   reg_inp_data_ctl_6         => reg_inp_data_ctl_6_2,
	   mem_rd_5                   =>  mem_rd_5_2,
	   reg_wr_6                   =>  reg_wr_6_2,
	   load_lukhi                 => load_lukhi4,

	   rf_d1                      =>  rf_d1_3,
	   rf_d2                      =>  rf_d2_3,
	   pc_plus_imm                => pc_plus_imm_2,
	   pc_old_i                   => pc_old_2,
	   carry_yes_i                => carry_yes_2,
	   zero_yes_i                 => zero_yes_2,
	   imm6_i                     => imm6_2,
	   imm9_i                     => imm9_2,
	   reg_a_addr_i               =>reg_a_addr_2,
	   reg_b_addr                 =>  reg_b_addr_2,
	   reg_c_addr                 => reg_c_addr_2,

	   read_from_a				  => read_from_a,
	   r_a_hzrd					  => r_a_hzrd,
	   r_b_hzrd					  => r_b_hzrd,
	   r_c_hzrd					  => r_c_hzrd,
	   stage4_op				  => stage4_op,
	   stage5_op				  => stage5_op,
	   stage6_op				  => stage6_op,	
	   valid_vec_hzrd(0)		  => valid_hzrd_0,
	   valid_vec_hzrd(1)		  => valid_hzrd_1,
	   valid_vec_hzrd(2)		  => valid_hzrd_2,			

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

	   rf_a2                      =>  rf_a2_3,
	   pc_plus_imm_o              =>  pc_plus_imm_3,
	   jlr_yes_o                  =>  jlr_yes_3,
	   beq_yes_o                  =>  beq_yes_3,
	   jal_yes_o                  =>  jal_yes_3,

	   valid_out                  =>  valid_out_3,

	   load_hzrd_out_2a		  => load_hzrd_out_2a,
	   load_hzrd_out_2b 	  => load_hzrd_out_2b,
	   load_hzrd_out_2c 	  => load_hzrd_out_2c,
	   ra_is_r7				  => ra_is_r7,	
	   rb_is_r7				  => rb_is_r7,
	   rc_is_r7 			  => rc_is_r7
 );


 stg4: stage4

 port map (

 	   clk                          => clkk_4,
	    rst	                        => rst,
	   valid_in                     => valid_out_33,
	   input_alu2_ctl               => input_alu2_ctl_4_3,
	   output_ctrl                  =>    output_ctrl_4_3,
	   output_ctrl_5                =>   output_ctrl_5_3,
	   reg_inp_data_ctl_6           => reg_inp_data_ctl_6_3,
	   mem_rd_5                     =>  mem_rd_5_3,
	   reg_wr_6                     =>  reg_wr_6_3,
	   beq_yes                    => beq_yes_3,
	   jlr_yes                    => jlr_yes_3,
	   jal_yes                    =>  jal_yes_3,

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
	   jlr_yes_o                    => jlr_yes_4,
	   jal_yes_o                    =>  jal_yes_4,
	   beq_yes_o                    => beq_yes_4,

	   valid_out                    => valid_out_4,

	   stage4_out_hzrd				=> stage4_op,
	   p_carry_com                  => p_carry_com,
	   p_zero_com                   => p_zero_com
 	
 );


 stg5 : stage5
 port map (

	   clk                      =>  clk,
	   rst		                =>  rst,
	   valid_in                 =>  valid_out_44,
	   p_carry_i                =>  p_carry_4,
	   p_zero_i                 =>  p_zero_4,

	   output_ctrl              =>  output_ctrl_5_4,
	   read_ctrl                =>  mem_rd_5_4 ,
	   reg_inp_data_ctl_6       => reg_inp_data_ctl_6_4,
	   reg_wr_6                 =>  reg_wr_6_4,
	   beq_yes                    => beq_yes_4,
	   jlr_yes                    => jlr_yes_4,
	   jal_yes                    =>  jal_yes_4,

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

	   valid_out                =>  valid_out_5,
	   jlr_yes_o                    => jlr_yes_5,
	   jal_yes_o                    =>  jal_yes_5,
	   beq_yes_o                    => beq_yes_5,

	   mem_addr_in 				=> mem_addr_in,
	   write_mem_data			=> ctrl_to_mem_data,
	   read_mem_data			=> mem_to_ctrl_data,
	   write_to_mem				=> write_to_mem,
	   lm_active 				=> lm_active,
	   sm_active 				=> sm_active,

	   stage5_out_hzrd			=> stage5_op
 	
 );


 stg6: stage6
port map (
	   sm_active              => sm_active_7,
	   clk                    =>  clk,
	   rst		              =>  rst,
	   valid_in               =>  valid_out_55,
	   p_carry_i              =>  p_carry_5,
	   p_zero_i               =>  p_zero_5,
	   jlr_yes                    => jlr_yes_5,
	   jal_yes                    =>  jal_yes_5,
	   beq_yes                    => beq_yes_5,

	   reg_inp_data_ctl       =>  reg_inp_data_ctl_6_5,
	   reg_wr                 =>  reg_wr_6_5,
	   pc_to_r7i 			  =>  pc_to_r7i,
	   stage_5_out_6          =>   stage_5_out_5,
	   reg_a_adr_in           =>   reg_a_addr_5,
	   pc_old_i		          =>  pc_old_5,
	   carry_yes_i            =>   carry_yes_5,
	   zero_yes_i             =>   zero_yes_5,
	   reg_wr1                =>   reg_wr1_6,
	   rrf_d3                 =>   rrf_d3_6,
	   valid_out              =>   valid_out_6,
	   wr_7 			  =>  wr_7,
	   stage6_out_hzrd		  =>   stage6_op,
	   pc_to_r7 			  => pc_to_r7
	
);


 reg_read_write: reg_file
    
    port map (
	   clk        => clk,
	   rst        => rst,
	   wr         => rf_wr,
	   wr_7       => wr_7,
	   rf_a1      => rf_a1,
	   rf_a2      => rf_a2_3,
	   rf_a3      => rf_a3,
	   rf_d1      => rf_d1_3,
	   rf_d2      => rf_d2_3,
	   rf_d3      => rf_d3,
	   Reg7 => pc_to_r7
     );

 rf_a1	<= ctrl_to_reg_addr when sm_active = '1' else
 			reg_b_addr_2 ;
 rf_a3  <= ctrl_to_reg_addr when lm_active = '1' else
 			reg_a_addr_5;
 rf_d3 <= ctrl_to_reg_data when lm_active = '1' else
 			rrf_d3_6;
rf_wr <= write_to_reg when lm_active = '1' else
	reg_wr1_6;
 	
 end architecture behave;