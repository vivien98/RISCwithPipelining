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
	   --carry_yes :  out std_logic;
	   --zero_yes: out std_logic;
	   valid_out : out std_logic 
		
     );
		
 end component ;

  component stage2 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   ir : in std_logic_vector(15 downto 0);
	   pc_old_i: in std_logic_vector(2 downto 0);
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
	   valid_out : out std_logic

		
     );
end component;

  component stage3 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;

	   reg_addr2_ctl : in std_logic;
	   input_alu2_ctl_4 : in std_logic_vector(1 downto 0);
	   output_ctrl_4: in std_logic;
	   output_ctrl_5: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;
	   mem_rd_5 : in std_logic;
	   reg_wr_6 : in std_logic;

	   pc_old_i: in std_logic_vector(2 downto 0);
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


 
 begin
 	
 end architecture behave;