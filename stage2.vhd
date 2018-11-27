library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

 entity stage2 is
    
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
	   lm_out_2:out std_logic;
	   sm_out_2:out std_logic;
	   r_a_hzrd: out std_logic_vector(2 downto 0);
	   r_b_hzrd:out std_logic_vector(2 downto 0);
	   r_c_hzrd:out std_logic_vector(2 downto 0);
	   read_from_a:out std_logic;
	   load_hzrd_out_2a:out std_logic;
	   load_hzrd_out_2b:out std_logic;
	   load_hzrd_out_2c:out std_logic;
	   load_hzrd_out_2 : out std_logic;
	   load_lukhi3:in std_logic
		
     );
		
 end entity ;

 architecture behave of stage2 is

   component alu is
  	port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
  end component;

  signal yin,imm6_16,imm9_se_16 : std_logic_vector(15 downto 0);
  signal r_a1,r_a2,r_a3,r_b,r_c,r_a,r_a_hzrdn,r_b_hzrdn,r_c_hzrdn,r_a_hzrdx,r_b_hzrdx,r_c_hzrdx : std_logic_vector(2 downto 0);
  signal carry1,zero1,pc_plus_imm_ctl: std_logic;
  signal sw_yes1,lm_yes1,sm_yes1,adi_yes1,lw_yes1,beq_yes1,lhi_yes1,lw_prev1,jal_yes1,r_a_hzrd1,r_b_hzrd1,r_c_hzrd1:std_logic;
  signal valid_out1 : std_logic := '0';

 begin

 jal_yes <= jal_yes1;

r_b <= ir(8 downto 6);
r_c <= ir(5 downto 3);
r_a <= ir(11 downto 9);
valid_out <= valid_out1;
   stage_4_alu: alu 
	port map
	(xin      =>   pc_old_i,           
	 yin      =>   yin,         
	 m0       =>   '0',            
	 m1       =>   '0',     
	 zout     =>   pc_plus_imm,
	 c        => carry1,
	 z        =>  zero1  );

imm6_16(5 downto 0) <= ir(5 downto 0);
imm6_16(15 downto 6) <= (others => '0');

jal_yes1 <= ((ir(15)) and (not ir(14)) and (not ir(13)) and (not ir(12))) and (not rst);

imm9_se_16(8 downto 0) <= ir(8 downto 0);
imm9_se_16(15 downto 9) <= (others => '0');

yin <= imm6_16 when pc_plus_imm_ctl='0' else
	   imm9_se_16 when pc_plus_imm_ctl='1';

pc_plus_imm_ctl <= (not ((ir(15)) and (ir(14)) and (not ir(13)) and (not ir(12)))) and 
                   ((ir(15)) and (not ir(14)) and (not ir(13)) and (not ir(12)));

adi_yes1 <= ((not ir(15)) and (not ir(14)) and (not ir(13)) and (ir(12)))and (not rst);
lw_yes1 <= ((not ir(15)) and (ir(14)) and (not ir(13)) and (not ir(12)))and (not rst);
lm_yes1 <= ((not ir(15)) and (ir(14)) and (ir(13)) and (not ir(12))) and (not rst);
sm_yes1 <= ((not ir(15)) and (ir(14)) and (ir(13)) and (ir(12))) and (not rst);
beq_yes1 <= ((ir(15)) and ir(14) and (not ir(13)) and (not ir(12))) and (not rst);
lhi_yes1 <= ((not ir(15)) and (not ir(14)) and (ir(13)) and (ir(12))) and (not rst);
sw_yes1 <= ((not ir(15)) and (ir(14)) and (not ir(13)) and (ir(12))) and (not rst);

reg_a_addr <= r_a1;

r_a_hzrd1 <= not ((r_a1(0) xor r_a(0)) or (r_a1(1) xor r_a(1)) or (r_a1(2) xor r_a(2)));
r_b_hzrd1 <= not ((r_a1(0) xor r_b(0)) or (r_a1(1) xor r_b(1)) or (r_a1(2) xor r_b(2))); --and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
r_c_hzrd1 <= not ((r_a1(0) xor r_c(0)) or (r_a1(1) xor r_c(1)) or (r_a1(2) xor r_c(2))); --and (not(lw_yes1 or adi_yes1 or lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1 or jal_yes1 or lhi_yes1))) or ((not ((r_a1(0) xor r_a(0)) or (r_a1(2) xor r_a(2)) or (r_a1(2) xor r_a(2))))and (( lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1)));

load_hzrd_out_2 <=  (lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_b_hzrd1)) or (lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_c_hzrd1));

r_a_hzrd <= r_a_hzrdn;

r_b_hzrd <= r_b_hzrdn;

r_c_hzrd <= r_c_hzrdn;


 stg2:process(hzrd_clk,clk,rst)
 begin
 if(rst='1') then
	beq_yes <= '0';
	jlr_yes <= '0';
 elsif rising_edge(clk) then



	 valid_out1 <= valid_in;
	 r_a1 <= ir(11 downto 9);
	 reg_b_addr <= ir(8 downto 6);
	 reg_c_addr <= ir(5 downto 3);
	 imm6 <= ir(5 downto 0);
	 imm9 <= ir(8 downto 0);
	 pc_old_o <= pc_old_i;

	 carry_yes <= ((not ir(15)) and (not ir(14)) and (not ir(13)) and (not ir(12)) and (ir(1)) and (not ir(0)))
             or ((not ir(15)) and (not ir(14)) and (ir(13)) and (not ir(12)) and (ir(1)) and (not ir(0)));

     zero_yes <= ((not ir(15)) and (not ir(14)) and (not ir(13)) and (not ir(12)) and (not ir(1)) and (ir(0)))
             or ((not ir(15)) and (not ir(14)) and (ir(13)) and (not ir(12)) and (not ir(1)) and (ir(0)));

     reg_addr2_ctl_3 <= ir(14) or ir(12);
     input_alu2_ctl_4(1) <= '0';
     input_alu2_ctl_4(0) <= ((not ir(15)) and ir(14)) or ir(12);
     output_ctrl_4 <= ir(13) and ir(12);
     output_ctrl_5 <= ir(14);
     mem_rd_5 <= (not ir(15)) and (ir(14)) and (not ir(13)) and (ir(12));
     reg_wr_6 <= (not ir(14)) or ((not ir(15)) and(not ir(12)));
     reg_inp_data_ctl_6 <= ir(15);
     beq_yes <= beq_yes1;
     jlr_yes <= ((ir(15)) and (not ir(14)) and (not ir(13)) and (ir(12))) and (not rst);
     alu_op(1)<= ir(13);
     alu_op(0) <= ir(15);

     lm_out_2 <= lm_yes1;
     sm_out_2 <= sm_yes1;

     r_a_hzrdn(0) <= (not ((r_a1(0) xor r_a(0)) or (r_a1(1) xor r_a(1)) or (r_a1(2) xor r_a(2))));-- and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
	 r_a_hzrdn(1) <= (not ((r_a2(0) xor r_a(0)) or (r_a2(1) xor r_a(1)) or (r_a2(2) xor r_a(2)))) ;--and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
	 r_a_hzrdn(2) <= (not ((r_a3(0) xor r_a(0)) or (r_a3(1) xor r_a(1)) or (r_a3(2) xor r_a(2))));

     r_b_hzrdn(0) <= (not ((r_a1(0) xor r_b(0)) or (r_a1(1) xor r_b(1)) or (r_a1(2) xor r_b(2))));-- and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
	 r_b_hzrdn(1) <= (not ((r_a2(0) xor r_b(0)) or (r_a2(1) xor r_b(1)) or (r_a2(2) xor r_b(2)))) ;--and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
	 r_b_hzrdn(2) <= (not ((r_a3(0) xor r_b(0)) or (r_a3(1) xor r_b(1)) or (r_a3(2) xor r_b(2))));-- and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;

	 r_c_hzrdn(0) <= (not ((r_a1(0) xor r_c(0)) or (r_a1(1) xor r_c(1)) or (r_a1(2) xor r_c(2)))) ;--and (not(lw_yes1 or adi_yes1 or lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1 or jal_yes1 or lhi_yes1))) or ((not ((r_a1(0) xor r_a(0)) or (r_a1(1) xor r_a(1)) or (r_a1(2) xor r_a(2))))and (( lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1)));
	 r_c_hzrdn(1) <= (not ((r_a2(0) xor r_c(0)) or (r_a2(1) xor r_c(1)) or (r_a2(2) xor r_c(2)))) ;--and (not(lw_yes1 or adi_yes1 or lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1 or jal_yes1 or lhi_yes1))) or ((not ((r_a2(0) xor r_a(0)) or (r_a2(1) xor r_a(1)) or (r_a2(2) xor r_a(2))))and (( lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1)));
	 r_c_hzrdn(2) <= (not ((r_a3(0) xor r_c(0)) or (r_a3(1) xor r_c(1)) or (r_a3(2) xor r_c(2))));-- and (not(lw_yes1 or adi_yes1 or lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1 or jal_yes1 or lhi_yes1))) or ((not ((r_a3(0) xor r_a(0)) or (r_a3(1) xor r_a(1)) or (r_a3(2) xor r_a(2))))and (( lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1)));
	 
	 read_from_a <= lm_yes1 or sm_yes1 or sw_yes1 or beq_yes1;

	 lw_prev1 <= lw_yes1;

	 load_hzrd_out_2a <= lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_a_hzrd1);
	 load_hzrd_out_2b <= lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_b_hzrd1);
	 load_hzrd_out_2c <= lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_c_hzrd1);

	 --if( load_lukhi3 = '0' and rst='0')then
	
	 --r_a2 <= r_a1;
	 --r_a3 <= r_a2;
	 
	 --end if;


--end if;
--if(rising_edge(hzrd_clk)) and (rst='0')then
--	 r_a_hzrdx(0) <= (not ((r_a1(0) xor r_a(0)) or (r_a1(1) xor r_a(1)) or (r_a1(2) xor r_a(2))));-- and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
--	 r_a_hzrdx(1) <= (not ((r_a2(0) xor r_a(0)) or (r_a2(1) xor r_a(1)) or (r_a2(2) xor r_a(2)))) ;--and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
--	 r_a_hzrdx(2) <= (not ((r_a3(0) xor r_a(0)) or (r_a3(1) xor r_a(1)) or (r_a3(2) xor r_a(2))));

--     r_b_hzrdx(0) <= (not ((r_a1(0) xor r_b(0)) or (r_a1(1) xor r_b(1)) or (r_a1(2) xor r_b(2))));-- and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
--	 r_b_hzrdx(1) <= (not ((r_a2(0) xor r_b(0)) or (r_a2(1) xor r_b(1)) or (r_a2(2) xor r_b(2)))) ;--and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;
--	 r_b_hzrdx(2) <= (not ((r_a3(0) xor r_b(0)) or (r_a3(1) xor r_b(1)) or (r_a3(2) xor r_b(2))));-- and (not(lm_yes1 or sm_yes1 or lhi_yes1 or jal_yes1)) ;

--	 r_c_hzrdx(0) <= (not ((r_a1(0) xor r_c(0)) or (r_a1(1) xor r_c(1)) or (r_a1(2) xor r_c(2)))) ;--and (not(lw_yes1 or adi_yes1 or lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1 or jal_yes1 or lhi_yes1))) or ((not ((r_a1(0) xor r_a(0)) or (r_a1(1) xor r_a(1)) or (r_a1(2) xor r_a(2))))and (( lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1)));
--	 r_c_hzrdx(1) <= (not ((r_a2(0) xor r_c(0)) or (r_a2(1) xor r_c(1)) or (r_a2(2) xor r_c(2)))) ;--and (not(lw_yes1 or adi_yes1 or lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1 or jal_yes1 or lhi_yes1))) or ((not ((r_a2(0) xor r_a(0)) or (r_a2(1) xor r_a(1)) or (r_a2(2) xor r_a(2))))and (( lm_yes1 or sm_yes1 or beq_yes1 or sw_yes1)));
--	 r_c_hzrdx(2) <= (not ((r_a3(0) xor r_c(0)) or (r_a3(1) xor r_c(1)) or (r_a3(2) xor r_c(2))));
	 r_a2 <= r_a1;
	 r_a3 <= r_a2;
end if;
 end process stg2;
 	
 end architecture behave;