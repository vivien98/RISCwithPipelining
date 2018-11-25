library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is 
	port(
			clk: in std_logic;
			rst: in std_logic;
			valid_2: in std_logic;
			lm_out_2: in std_logic;
			sm_out_2: in std_logic;
			mem_addr_in: in std_logic_vector(15 downto 0);
			reg_data_in:in std_logic_vector(15 downto 0);
			shifter_bit_0: in std_logic;
			next_mem_addr:out std_logic_vector(15 downto 0);
			clk1,clk2,clk3,clk4:out std_logic;
			write_to_reg:out std_logic;
			write_to_mem:out std_logic;
			write_mem_data:out std_logic;
			reg_addr_out:out std_logic_vector(2 downto 0);
			shift_now:out std_logic;
			active_now:out std_logic

		);
	end entity;
architecture atrangi of controller is

type state_type is ( S0,S1,S2,S3,S4,S5,S6);
signal state : state_type := S0;
signal alu_out,alu_in,reg_val: std_logic_vector(15 downto 0) ;
signal counter:std_logic_vector(15 downto 0) := x"0000";
signal car_dump,zer_dump:std_logic;

component alu is
	port (xin,yin: in std_logic_vector(15 downto 0);m0,m1: in std_logic;zout: out std_logic_vector(15 downto 0);c,z : out std_logic);
end component;

begin

fsm_alu: alu 
	port map
	(xin      =>   alu_in,           
	 yin      =>   x"0001",         
	 m0       =>   '0' ,            
	 m1       =>   '0',     
	 zout     =>   alu_out,
	 c        => car_dump,
	 z        =>  zer_dump  );

alu_in <= counter when (state = S3 or state = S5) else
	     mem_addr_in when (state = S2 or state = S6) else
	    counter ;

shift_now <= '1' when state = S3 else
		   '0' ;

active_now <= '1' when (state = S2 or state = S3) else
		    '0' ;

write_to_reg <= '1' when (state = S3 and shifter_bit_0 = '1') else
			  '0' ;

write_to_mem <= '1' when (state = S6 and shifter_bit_0 = '1') else
				'0';

write_mem_data <= reg_val;

reg_addr_out <= counter(2 downto 0);

clk1 <= '1' when state = S0 else
	  '0' ;

clk2 <= '1' when state = S0 else
	  '0' ;

clk3 <= '1' when state = S0 else
	  '0' ;

clk4 <= '1' when (state = S0 or state = S1 or state = S4) else
	  '0' ;

process(clk,rst)
begin
if(rst ='0')then
	state <= S0;
elsif(rising_edge(clk))then
	case state is
		when S0 =>
			if(valid_2 = '1' and lm_out_2 = '1')then
				state <= S1;
			elsif(valid_2 = '1' and sm_out_2 = '1')then
				state <= S4;
			else
				state <= S0;
			end if;

		when S1 =>
			state <= S2;

		when S2 =>
			if (shifter_bit_0 = '1')then
				next_mem_addr <= alu_out;
			else
				next_mem_addr <= mem_addr_in;
			end if;
			state <= S3;

		when S3 =>
			counter <= alu_out;
			if (counter(2 downto 0)= "111") then
				state <= S0;
			else
				state <= S2;
			end if ;


		when S4 =>
			state <= S5;

		when S5 =>
			counter <= alu_out;
			reg_val <= reg_data_in;
			state <= S6;

		when S6 =>
			if (shifter_bit_0 = '1')then
				next_mem_addr <= alu_out;
			else
				next_mem_addr <= mem_addr_in;
			end if;
			if (counter(2 downto 0)= "000") then
				state <= S0;
			else
				state <= S5;
			end if ;
	end case;

end if;
end process;

end atrangi;