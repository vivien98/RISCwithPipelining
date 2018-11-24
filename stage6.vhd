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
	   stage_5_out_6 : in std_logic_vector(15 downto 0);
	   reg_a_adr_in: in std_logic_vector(2 downto 0);
	   pc_old_i		: in std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;
	   zero_yes_i: in std_logic;
	   valid_out : out std_logic
		
     );
		
 end entity ;

 architecture behave of stage6 is

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

signal rrf_d3,r7,rf_d1,rf_d2:std_logic_vector (15 downto 0);
signal rf_a1,rf_a2: std_logic_vector(2 downto 0);

 begin

 reg_writing: reg_file
    
    port map (
	   clk        => clk,
	   rst        => rst,
	   wr         => '1',
	   rf_a1      => rf_a1,
	   rf_a2      => rf_a2,
	   rf_a3      => reg_a_adr_in,
	   rf_d1      => rf_d1,
	   rf_d2      => rf_d2,
	   rf_d3      => rrf_d3,
	   Reg7 => R7
     );

 stg6:process(clk)
 begin
 if rising_edge(clk) then

 	 case reg_inp_data_ctl is
		when '0' =>  rrf_d3 <= stage_5_out_6;
		when others =>  rrf_d3 <= pc_old_i;
	 end case;

	 if(valid_in='0') then
	 	valid_out <= '0';
	 else valid_out <= '1';
	 end if;
 end if;
 end process stg6;
  
 end architecture behave;