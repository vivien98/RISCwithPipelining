library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

 entity stage3 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   jlr_yes : in std_logic;
	   beq_yes: in std_logic;
	   jal_yes: in std_logic;

	   reg_addr2_ctl : in std_logic;
	   input_alu2_ctl_4 : in std_logic_vector(1 downto 0);
	   output_ctrl_4: in std_logic;
	   output_ctrl_5: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;
	   mem_rd_5 : in std_logic;
	   reg_wr_6 : in std_logic;

	   rf_d1 : in std_logic_vector(15 downto 0);
	   rf_d2: in std_logic_vector(15 downto 0);

	   pc_plus_imm : in std_logic_vector(15 downto 0);
	   pc_old_i: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   imm6_i : in std_logic_vector(5 downto 0);
	   imm9_i : in std_logic_vector(8 downto 0);
	   reg_a_addr_i: in std_logic_vector(2 downto 0);
	   reg_b_addr: in std_logic_vector(2 downto 0);
	   reg_c_addr: in std_logic_vector(2 downto 0);

	   r_b_hzrd: in std_logic_vector(2 downto 0);
	   r_c_hzrd: in std_logic_vector(2 downto 0); 
	   stage4_op: in std_logic_vector(15 downto 0);
	   stage5_op: in std_logic_vector(15 downto 0);
	   stage6_op: in std_logic_vector(15 downto 0);
	   valid_vec_hzrd : in std_logic_vector(2 downto 0);

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
	   pc_plus_imm_o : out std_logic_vector(15 downto 0);

	   jlr_yes_o : out std_logic;
	   beq_yes_o: out std_logic;
	   jal_yes_o: out std_logic;

	   valid_out : out std_logic
		
     );
	  
	  end entity;


architecture behave of stage3 is

	--component reg_file is
    
 --   port (
	--   clk        : in   std_logic;
	--   rst        : in   std_logic;
	--   wr         : in   std_logic;
	--   rf_a1      : in  std_logic_vector(2 downto 0);
	--   rf_a2      : in  std_logic_vector(2 downto 0);
	--   rf_a3      : in  std_logic_vector(2 downto 0);
	--   rf_d1      : out  std_logic_vector(15 downto 0);
	--   rf_d2      : out  std_logic_vector(15 downto 0);
	--   rf_d3      : in  std_logic_vector(15 downto 0);
	--	Reg7 : in std_logic_vector(15 downto 0)
 --    );
		
 -- end component ;

signal valid_out1 : std_logic := '0';
signal rf_d11,rf_d22 : std_logic_vector(15 downto 0);

begin
valid_out <= valid_out1;
 --reg_read: reg_file
    
 --   port map (
	--   clk        => clk,
	--   rst        => rst,
	--   wr         => '0',
	--   rf_a1      => reg_b_addr,
	--   rf_a2      => rf_a2,
	--   rf_a3      => rf_a3,
	--   rf_d1      => rf_d1,
	--   rf_d2      => rf_d2,
	--   rf_d3      => rf_d3,
	--   Reg7 => R7
 --    );

 rf_a2 <= reg_c_addr when reg_addr2_ctl='0' else
          reg_a_addr_i when reg_addr2_ctl='1';

xor_comp <= ((rf_d11(15) xor rf_d22(15)) or (rf_d11(14) xor rf_d22(14)) or (rf_d11(13) xor rf_d22(13)) or (rf_d11(12) xor rf_d22(12)) or
	             (rf_d11(11) xor rf_d22(11)) or (rf_d11(10) xor rf_d22(10)) or (rf_d11(9) xor rf_d22(9)) or (rf_d11(8) xor rf_d22(8)) or
	             (rf_d11(7) xor rf_d22(7)) or (rf_d11(6) xor rf_d22(6)) or (rf_d11(5) xor rf_d22(5)) or (rf_d11(4) xor rf_d22(4)) or
	             (rf_d11(3) xor rf_d22(3)) or (rf_d11(2) xor rf_d22(2)) or (rf_d11(1) xor rf_d22(1)) or (rf_d11(0) xor rf_d22(0))) and (not rst) ;


rf_d11 <=  stage4_op when (r_b_hzrd(0) and valid_vec_hzrd(0)) = '1' else
    	   stage5_op when ((not r_b_hzrd(0)) and (r_b_hzrd(1) and valid_vec_hzrd(1))) = '1' else
    	   stage6_op when ((not r_b_hzrd(0)) and (not r_b_hzrd(1)) and (r_b_hzrd(2) and valid_vec_hzrd(2))) = '1' else
     	   rf_d1 ;

rf_d22 <=  stage4_op when (r_c_hzrd(0) and valid_vec_hzrd(0)) = '1' else
    	   stage5_op when ((not r_c_hzrd(0)) and (r_c_hzrd(1) and valid_vec_hzrd(1))) = '1' else
    	   stage6_op when ((not r_c_hzrd(0)) and (not r_c_hzrd(1)) and (r_c_hzrd(2) and valid_vec_hzrd(2))) = '1' else
     	   rf_d2 ;

 stg3:process(clk,rst)
 begin
 if(rst='1') then

 elsif rising_edge(clk) then

 	-- case reg_addr2_ctl is
		--when '0' =>  rf_a2 <= reg_c_addr;
		--when others =>  rf_a2 <= reg_a_addr_i;
	 --end case;

	 valid_out1 <= valid_in;
	 
	
	 
	 carry_yes_o <= carry_yes_i;
	 zero_yes_o <= zero_yes_i;
	 pc_old_o <= pc_old_i;
	 alu_op_o <= alu_op_i;
	 imm9_o <= imm9_i;
	 imm6_o <= imm6_i;
	 reg_a_addr_o <= reg_a_addr_i;

	 input_alu2_ctl_4_o <= input_alu2_ctl_4;
	 output_ctrl_5_o <= output_ctrl_5;
	 output_ctrl_4_o <= output_ctrl_4;
	 mem_rd_5_o <= mem_rd_5;
	 reg_wr_6_o <= reg_wr_6;	
     reg_inp_data_ctl_6_o <= reg_inp_data_ctl_6;
     pc_plus_imm_o <= pc_plus_imm;
     jal_yes_o <= jal_yes;
     jlr_yes_o <= jlr_yes;
     beq_yes_o <= beq_yes;

     reg_b_val <= rf_d11;

     t1 <= rf_d11;
	 t2 <= rf_d22;


 end if;
 end process stg3;



end architecture behave;