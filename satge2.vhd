library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

 entity stage2 is
    
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
		
 end entity ;

 architecture behave of stage2 is

   component alu is
  	port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
  end component;

  signal yin,imm6_16,imm9_se_16 : std_logic_vector(15 downto 0);
  signal carry1,zero1,pc_plus_imm_ctl: std_logic;

 begin

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

imm9_se_16(8 downto 0) <= ir(8 downto 0);
imm9_se_16(15 downto 9) <= (others => '0');

yin <= imm6_16 when pc_plus_imm_ctl='0' else
	   imm9_se_16 when pc_plus_imm_ctl='1';

pc_plus_imm_ctl <= (not ((ir(15)) and (ir(14)) and (not ir(13)) and (not ir(12)))) and 
                   ((ir(15)) and (not ir(14)) and (not ir(13)) and (not ir(12)));



 stg2:process(clk)
 begin
 if rising_edge(clk) then



	 if(valid_in='0') then
	 	valid_out <= '0';
	 else valid_out <= '1';
	 end if;
	 reg_a_addr <= ir(11 downto 9);
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
     mem_rd_5 <= (not ir(15)) and (ir(14)) and (not ir(13)) and (not ir(12));
     reg_wr_6 <= (not ir(14)) or ((not ir(15)) and(not ir(12)));
     reg_inp_data_ctl_6 <= ir(15);


 end if;
 end process stg2;
 	
 end architecture behave;