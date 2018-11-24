library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

 entity stage3 is
    
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
	  
	  end entity;


architecture behave of stage3 is

	component reg_file is
    
    port (
	   clk        : in   std_logic;
	   rst        : in   std_logic;
	   wr         : in   std_logic;
	   rf_a1      : in  std_logic_vector(2 downto 0);
	   rf_a2      : in  std_logic_vector(2 downto 0);
	   rf_a3      : in  std_logic_vector(2 downto 0);
	   rf_d1      : out  std_logic_vector(15 downto 0);
	   rf_d2      : out  std_logic_vector(15 downto 0);
	   rf_d3      : in  std_logic_vector(15 downto 0);
		Reg7 : in std_logic_vector(15 downto 0)
     );
		
  end component ;

signal rrf_d3,r7,rf_d1,rf_d2,rf_d3:std_logic_vector (15 downto 0);
signal rf_a1,rf_a2,rf_a3: std_logic_vector(2 downto 0);

begin

 reg_read: reg_file
    
    port map (
	   clk        => clk,
	   rst        => rst,
	   wr         => '0',
	   rf_a1      => reg_b_addr,
	   rf_a2      => rf_a2,
	   rf_a3      => rf_a3,
	   rf_d1      => rf_d1,
	   rf_d2      => rf_d2,
	   rf_d3      => rf_d3,
	   Reg7 => R7
     );

 stg3:process(clk)
 begin
 if rising_edge(clk) then

 	 case reg_addr2_ctl is
		when '0' =>  rf_a2 <= reg_c_addr;
		when others =>  rf_a2 <= reg_a_addr_i;
	 end case;

	 if(valid_in='0') then
	 	valid_out <= '0';
	 else valid_out <= '1';
	 end if;
	 t1 <= rf_d1;
	 reg_b_val <= rf_d1;
	 t2 <= rf_d2;
	 carry_yes_o <= carry_yes_i;
	 zero_yes_o <= zero_yes_i;
	 pc_old_o <= pc_old_i;
	 alu_op_o <= alu_op_i;
	 imm9_o <= imm9_i;
	 imm6_o <= imm6_i;
	 reg_a_addr_o <= reg_a_addr_i;	

	 xor_comp <= (rf_d1(15) xor rf_d2(15)) or (rf_d1(14) xor rf_d2(14)) or (rf_d1(13) xor rf_d2(13)) or (rf_d1(12) xor rf_d2(12)) or
	             (rf_d1(11) xor rf_d2(11)) or (rf_d1(10) xor rf_d2(10)) or (rf_d1(9) xor rf_d2(9)) or (rf_d1(8) xor rf_d2(8)) or
	             (rf_d1(7) xor rf_d2(7)) or (rf_d1(6) xor rf_d2(6)) or (rf_d1(5) xor rf_d2(5)) or (rf_d1(4) xor rf_d2(4)) or
	             (rf_d1(3) xor rf_d2(3)) or (rf_d1(2) xor rf_d2(2)) or (rf_d1(1) xor rf_d2(1)) or (rf_d1(0) xor rf_d2(0)) ;

 end if;
 end process stg3;



end architecture behave;