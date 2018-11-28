library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


 entity stage6 is
    
    port (
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   p_carry_i: in std_logic;
	   p_zero_i: in std_logic;

	   reg_inp_data_ctl: in std_logic;
	   reg_wr : in std_logic;
	   	   jlr_yes : in std_logic;
	   beq_yes: in std_logic;
	   jal_yes: in std_logic;

	   stage_5_out_6 : in std_logic_vector(15 downto 0);
	   reg_a_adr_in: in std_logic_vector(2 downto 0);
	   pc_old_i		: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   reg_wr1 : out std_logic;
	   rrf_d3 : out std_logic_vector(15 downto 0);
	   valid_out : out std_logic;
	   pc_to_r7i: in std_logic_vector(15 downto 0);
	   stage6_out_hzrd : out std_logic_vector(15 downto 0);
		pc_to_r7 : out std_logic_vector(15 downto 0);
		wr_7 : out std_logic
     );
		
 end entity ;

 architecture behave of stage6 is

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
signal rrf_d31 : std_logic_vector(15 downto 0);

 begin
 wr_7 <= valid_in;
 valid_out <= valid_out1;
pc_to_r7 <= pc_to_r7i;
reg_wr1 <= reg_wr and (((not carry_yes_i) or p_carry_i) and ((not zero_yes_i) or p_zero_i)) and valid_in; 		

 --reg_writing: reg_file
    
 --   port map (
	--   clk        => clk,
	--   rst        => rst,
	--   wr         => reg_wr1,
	--   rf_a1      => rf_a1,
	--   rf_a2      => rf_a2,
	--   rf_a3      => reg_a_adr_in,
	--   rf_d1      => rf_d1,
	--   rf_d2      => rf_d2,
	--   rf_d3      => rrf_d3,
	--   Reg7 => R7
 --    );

  rrf_d31 <= stage_5_out_6 when reg_inp_data_ctl='0' else
          pc_old_i when reg_inp_data_ctl='1';
  stage6_out_hzrd <= rrf_d31;
  rrf_d3 <= rrf_d31;
 stg6:process(clk)
 begin
 if rising_edge(clk) then

 	-- case reg_inp_data_ctl is
		--when '0' =>  rrf_d3 <= stage_5_out_6;
		--when others =>  rrf_d3 <= pc_old_i;
	 --end case;

	 valid_out1 <= valid_in;
 end if;
 end process stg6;
  
 end architecture behave;