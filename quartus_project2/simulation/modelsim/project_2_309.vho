-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "11/24/2018 19:03:18"

-- 
-- Device: Altera 5M1270ZT144C5 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	stage1 IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	valid_in : IN std_logic;
	pc_control : IN std_logic_vector(1 DOWNTO 0);
	reg_b_val : IN std_logic_vector(15 DOWNTO 0);
	pc_plus_imm : IN std_logic_vector(15 DOWNTO 0);
	ir : BUFFER std_logic_vector(15 DOWNTO 0);
	pc_old : BUFFER std_logic_vector(15 DOWNTO 0);
	valid_out : BUFFER std_logic
	);
END stage1;

-- Design Ports Information


ARCHITECTURE structure OF stage1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_valid_in : std_logic;
SIGNAL ww_pc_control : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_reg_b_val : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_plus_imm : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ir : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_old : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_valid_out : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder1|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder2|s~combout\ : std_logic;
SIGNAL \code_mem|membr2[7]~2_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder3|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder3|cout~0_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder4|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder5|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder6|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder6|cout~0_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder7|s~combout\ : std_logic;
SIGNAL \code_mem|Equal1~0_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder8|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder9|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder9|cout~0_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder10|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder11|s~combout\ : std_logic;
SIGNAL \code_mem|Equal1~1_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder12|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder12|cout~0_combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder13|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder14|s~combout\ : std_logic;
SIGNAL \pc_alu|stbadd|adder15|s~combout\ : std_logic;
SIGNAL \code_mem|Equal1~2_combout\ : std_logic;
SIGNAL \code_mem|Equal1~3_combout\ : std_logic;
SIGNAL \code_mem|Equal8~0_combout\ : std_logic;
SIGNAL \code_mem|membr2[7]~3_combout\ : std_logic;
SIGNAL \ir[0]~reg0_regout\ : std_logic;
SIGNAL \ir[1]~reg0_regout\ : std_logic;
SIGNAL \code_mem|Equal9~0_combout\ : std_logic;
SIGNAL \ir[6]~reg0_regout\ : std_logic;
SIGNAL \code_mem|Equal1~4_combout\ : std_logic;
SIGNAL \ir[7]~reg0_regout\ : std_logic;
SIGNAL \ir[8]~reg0_regout\ : std_logic;
SIGNAL \ir[10]~reg0_regout\ : std_logic;
SIGNAL \ir[12]~reg0_regout\ : std_logic;
SIGNAL \code_mem|membr1[7]~2_combout\ : std_logic;
SIGNAL \ir[15]~reg0_regout\ : std_logic;
SIGNAL \pc_old[0]~reg0_regout\ : std_logic;
SIGNAL \pc_old[1]~reg0_regout\ : std_logic;
SIGNAL \pc_old[2]~reg0_regout\ : std_logic;
SIGNAL \pc_old[3]~reg0_regout\ : std_logic;
SIGNAL \pc_old[4]~reg0_regout\ : std_logic;
SIGNAL \pc_old[5]~reg0_regout\ : std_logic;
SIGNAL \pc_old[6]~reg0_regout\ : std_logic;
SIGNAL \pc_old[7]~reg0_regout\ : std_logic;
SIGNAL \pc_old[8]~reg0_regout\ : std_logic;
SIGNAL \pc_old[9]~reg0_regout\ : std_logic;
SIGNAL \pc_old[10]~reg0_regout\ : std_logic;
SIGNAL \pc_old[11]~reg0_regout\ : std_logic;
SIGNAL \pc_old[12]~reg0_regout\ : std_logic;
SIGNAL \pc_old[13]~reg0_regout\ : std_logic;
SIGNAL \pc_old[14]~reg0_regout\ : std_logic;
SIGNAL \pc_old[15]~reg0_regout\ : std_logic;
SIGNAL \valid_in~combout\ : std_logic;
SIGNAL \valid_out~reg0_regout\ : std_logic;
SIGNAL \code_mem|membr1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pc_control~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \reg_b_val~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \code_mem|membr2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pc_plus_imm~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL pc : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_rst~combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_valid_in <= valid_in;
ww_pc_control <= pc_control;
ww_reg_b_val <= reg_b_val;
ww_pc_plus_imm <= pc_plus_imm;
ir <= ww_ir;
pc_old <= ww_pc_old;
valid_out <= ww_valid_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_rst~combout\ <= NOT \rst~combout\;

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: PIN_114,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_control[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_control(1),
	combout => \pc_control~combout\(1));

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(1),
	combout => \pc_plus_imm~combout\(1));

-- Location: PIN_105,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(1),
	combout => \reg_b_val~combout\(1));

-- Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(0),
	combout => \pc_plus_imm~combout\(0));

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(0),
	combout => \reg_b_val~combout\(0));

-- Location: PIN_20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: PIN_131,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_control[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_control(0),
	combout => \pc_control~combout\(0));

-- Location: LC_X10_Y8_N9
\pc[0]\ : maxv_lcell
-- Equation(s):
-- pc(0) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(0))) # (!\pc_control~combout\(1) & (((!pc(0))))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(0), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "88dd",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(0),
	datac => \reg_b_val~combout\(0),
	datad => pc(0),
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(0));

-- Location: LC_X7_Y8_N1
\pc_alu|stbadd|adder1|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder1|s~combout\ = (pc(1) $ (((pc(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => pc(1),
	datad => pc(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder1|s~combout\);

-- Location: LC_X10_Y8_N7
\pc[1]\ : maxv_lcell
-- Equation(s):
-- pc(1) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(1))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder1|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(1), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(1),
	datac => \reg_b_val~combout\(1),
	datad => \pc_alu|stbadd|adder1|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(1));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(2),
	combout => \pc_plus_imm~combout\(2));

-- Location: PIN_107,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(2),
	combout => \reg_b_val~combout\(2));

-- Location: LC_X7_Y8_N3
\pc_alu|stbadd|adder2|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder2|s~combout\ = (pc(2) $ (((pc(1) & pc(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3fc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => pc(1),
	datac => pc(0),
	datad => pc(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder2|s~combout\);

-- Location: LC_X10_Y8_N1
\pc[2]\ : maxv_lcell
-- Equation(s):
-- pc(2) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(2))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder2|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(2), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(2),
	datac => \reg_b_val~combout\(2),
	datad => \pc_alu|stbadd|adder2|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(2));

-- Location: LC_X10_Y8_N3
\code_mem|membr2[7]~2\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr2[7]~2_combout\ = (((!pc(1) & !pc(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => pc(1),
	datad => pc(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr2[7]~2_combout\);

-- Location: PIN_112,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(3),
	combout => \pc_plus_imm~combout\(3));

-- Location: PIN_108,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(3),
	combout => \reg_b_val~combout\(3));

-- Location: LC_X7_Y8_N9
\pc_alu|stbadd|adder3|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder3|s~combout\ = pc(3) $ (((pc(1) & (pc(0) & pc(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6aaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(3),
	datab => pc(1),
	datac => pc(0),
	datad => pc(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder3|s~combout\);

-- Location: LC_X10_Y8_N4
\pc[3]\ : maxv_lcell
-- Equation(s):
-- pc(3) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(3))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder3|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(3), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(3),
	datac => \reg_b_val~combout\(3),
	datad => \pc_alu|stbadd|adder3|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(3));

-- Location: PIN_130,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(5),
	combout => \pc_plus_imm~combout\(5));

-- Location: PIN_134,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(5),
	combout => \reg_b_val~combout\(5));

-- Location: LC_X10_Y8_N0
\pc_alu|stbadd|adder3|cout~0\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder3|cout~0_combout\ = (pc(3) & (pc(0) & (pc(1) & pc(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(3),
	datab => pc(0),
	datac => pc(1),
	datad => pc(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder3|cout~0_combout\);

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(4),
	combout => \pc_plus_imm~combout\(4));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(4),
	combout => \reg_b_val~combout\(4));

-- Location: LC_X7_Y8_N2
\pc_alu|stbadd|adder4|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder4|s~combout\ = pc(4) $ ((((\pc_alu|stbadd|adder3|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(4),
	datad => \pc_alu|stbadd|adder3|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder4|s~combout\);

-- Location: LC_X8_Y8_N7
\pc[4]\ : maxv_lcell
-- Equation(s):
-- pc(4) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(4))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder4|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(4), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(4),
	datac => \reg_b_val~combout\(4),
	datad => \pc_alu|stbadd|adder4|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(4));

-- Location: LC_X7_Y8_N7
\pc_alu|stbadd|adder5|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder5|s~combout\ = pc(5) $ (((\pc_alu|stbadd|adder3|cout~0_combout\ & ((pc(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "66cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pc_alu|stbadd|adder3|cout~0_combout\,
	datab => pc(5),
	datad => pc(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder5|s~combout\);

-- Location: LC_X8_Y8_N8
\pc[5]\ : maxv_lcell
-- Equation(s):
-- pc(5) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(5))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder5|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(5), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(5),
	datac => \reg_b_val~combout\(5),
	datad => \pc_alu|stbadd|adder5|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(5));

-- Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(6),
	combout => \pc_plus_imm~combout\(6));

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(6),
	combout => \reg_b_val~combout\(6));

-- Location: LC_X8_Y8_N5
\pc_alu|stbadd|adder6|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder6|s~combout\ = pc(6) $ (((pc(5) & (pc(4) & \pc_alu|stbadd|adder3|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6aaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(6),
	datab => pc(5),
	datac => pc(4),
	datad => \pc_alu|stbadd|adder3|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder6|s~combout\);

-- Location: LC_X8_Y8_N6
\pc[6]\ : maxv_lcell
-- Equation(s):
-- pc(6) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(6))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder6|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(6), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(6),
	datac => \reg_b_val~combout\(6),
	datad => \pc_alu|stbadd|adder6|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(6));

-- Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(7),
	combout => \pc_plus_imm~combout\(7));

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(7),
	combout => \reg_b_val~combout\(7));

-- Location: LC_X11_Y8_N1
\pc_alu|stbadd|adder6|cout~0\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder6|cout~0_combout\ = (pc(5) & (pc(6) & (pc(4) & \pc_alu|stbadd|adder3|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(5),
	datab => pc(6),
	datac => pc(4),
	datad => \pc_alu|stbadd|adder3|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder6|cout~0_combout\);

-- Location: LC_X11_Y8_N6
\pc_alu|stbadd|adder7|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder7|s~combout\ = (pc(7) $ (((\pc_alu|stbadd|adder6|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => pc(7),
	datad => \pc_alu|stbadd|adder6|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder7|s~combout\);

-- Location: LC_X8_Y8_N3
\pc[7]\ : maxv_lcell
-- Equation(s):
-- pc(7) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(7))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder7|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(7), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(7),
	datac => \reg_b_val~combout\(7),
	datad => \pc_alu|stbadd|adder7|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(7));

-- Location: LC_X8_Y8_N4
\code_mem|Equal1~0\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal1~0_combout\ = (!pc(5) & (!pc(4) & (!pc(6) & !pc(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(5),
	datab => pc(4),
	datac => pc(6),
	datad => pc(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal1~0_combout\);

-- Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(8),
	combout => \pc_plus_imm~combout\(8));

-- Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(8),
	combout => \reg_b_val~combout\(8));

-- Location: LC_X11_Y8_N9
\pc_alu|stbadd|adder8|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder8|s~combout\ = (pc(8) $ (((pc(7) & \pc_alu|stbadd|adder6|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3cf0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => pc(7),
	datac => pc(8),
	datad => \pc_alu|stbadd|adder6|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder8|s~combout\);

-- Location: LC_X9_Y8_N5
\pc[8]\ : maxv_lcell
-- Equation(s):
-- pc(8) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(8))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder8|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(8), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(8),
	datac => \reg_b_val~combout\(8),
	datad => \pc_alu|stbadd|adder8|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(8));

-- Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(11),
	combout => \pc_plus_imm~combout\(11));

-- Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(11),
	combout => \reg_b_val~combout\(11));

-- Location: PIN_123,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(9),
	combout => \pc_plus_imm~combout\(9));

-- Location: PIN_127,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(9),
	combout => \reg_b_val~combout\(9));

-- Location: LC_X11_Y8_N3
\pc_alu|stbadd|adder9|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder9|s~combout\ = pc(9) $ (((pc(7) & (pc(8) & \pc_alu|stbadd|adder6|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6aaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(9),
	datab => pc(7),
	datac => pc(8),
	datad => \pc_alu|stbadd|adder6|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder9|s~combout\);

-- Location: LC_X9_Y8_N8
\pc[9]\ : maxv_lcell
-- Equation(s):
-- pc(9) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(9))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder9|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(9), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(9),
	datac => \reg_b_val~combout\(9),
	datad => \pc_alu|stbadd|adder9|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(9));

-- Location: LC_X11_Y8_N2
\pc_alu|stbadd|adder9|cout~0\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder9|cout~0_combout\ = (pc(9) & (pc(7) & (pc(8) & \pc_alu|stbadd|adder6|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(9),
	datab => pc(7),
	datac => pc(8),
	datad => \pc_alu|stbadd|adder6|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder9|cout~0_combout\);

-- Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(10),
	combout => \pc_plus_imm~combout\(10));

-- Location: PIN_111,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(10),
	combout => \reg_b_val~combout\(10));

-- Location: LC_X11_Y8_N0
\pc_alu|stbadd|adder10|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder10|s~combout\ = (\pc_alu|stbadd|adder9|cout~0_combout\ $ ((pc(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \pc_alu|stbadd|adder9|cout~0_combout\,
	datac => pc(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder10|s~combout\);

-- Location: LC_X12_Y8_N0
\pc[10]\ : maxv_lcell
-- Equation(s):
-- pc(10) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(10))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder10|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(10), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(10),
	datac => \reg_b_val~combout\(10),
	datad => \pc_alu|stbadd|adder10|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(10));

-- Location: LC_X11_Y8_N5
\pc_alu|stbadd|adder11|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder11|s~combout\ = (pc(11) $ (((\pc_alu|stbadd|adder9|cout~0_combout\ & pc(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3fc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \pc_alu|stbadd|adder9|cout~0_combout\,
	datac => pc(10),
	datad => pc(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder11|s~combout\);

-- Location: LC_X10_Y8_N8
\pc[11]\ : maxv_lcell
-- Equation(s):
-- pc(11) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(11))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder11|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(11), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(11),
	datac => \reg_b_val~combout\(11),
	datad => \pc_alu|stbadd|adder11|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(11));

-- Location: LC_X9_Y8_N6
\code_mem|Equal1~1\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal1~1_combout\ = (!pc(8) & (!pc(11) & (!pc(10) & !pc(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(8),
	datab => pc(11),
	datac => pc(10),
	datad => pc(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal1~1_combout\);

-- Location: PIN_104,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(12),
	combout => \pc_plus_imm~combout\(12));

-- Location: PIN_106,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(12),
	combout => \reg_b_val~combout\(12));

-- Location: LC_X11_Y8_N7
\pc_alu|stbadd|adder12|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder12|s~combout\ = pc(12) $ (((\pc_alu|stbadd|adder9|cout~0_combout\ & (pc(10) & pc(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6aaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(12),
	datab => \pc_alu|stbadd|adder9|cout~0_combout\,
	datac => pc(10),
	datad => pc(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder12|s~combout\);

-- Location: LC_X12_Y8_N8
\pc[12]\ : maxv_lcell
-- Equation(s):
-- pc(12) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(12))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder12|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(12), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_control~combout\(1),
	datab => \pc_plus_imm~combout\(12),
	datac => \reg_b_val~combout\(12),
	datad => \pc_alu|stbadd|adder12|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(12));

-- Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(13),
	combout => \pc_plus_imm~combout\(13));

-- Location: PIN_98,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(13),
	combout => \reg_b_val~combout\(13));

-- Location: LC_X12_Y8_N3
\pc_alu|stbadd|adder12|cout~0\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder12|cout~0_combout\ = (pc(12) & (pc(10) & (pc(11) & \pc_alu|stbadd|adder9|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(12),
	datab => pc(10),
	datac => pc(11),
	datad => \pc_alu|stbadd|adder9|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder12|cout~0_combout\);

-- Location: LC_X12_Y8_N6
\pc_alu|stbadd|adder13|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder13|s~combout\ = ((pc(13) $ (\pc_alu|stbadd|adder12|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => pc(13),
	datad => \pc_alu|stbadd|adder12|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder13|s~combout\);

-- Location: LC_X12_Y8_N7
\pc[13]\ : maxv_lcell
-- Equation(s):
-- pc(13) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(13))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder13|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(13), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bb88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_plus_imm~combout\(13),
	datab => \pc_control~combout\(1),
	datac => \reg_b_val~combout\(13),
	datad => \pc_alu|stbadd|adder13|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(13));

-- Location: PIN_101,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(14),
	combout => \pc_plus_imm~combout\(14));

-- Location: PIN_95,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(14),
	combout => \reg_b_val~combout\(14));

-- Location: LC_X12_Y8_N4
\pc_alu|stbadd|adder14|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder14|s~combout\ = (pc(14) $ (((pc(13) & \pc_alu|stbadd|adder12|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5af0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(13),
	datac => pc(14),
	datad => \pc_alu|stbadd|adder12|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder14|s~combout\);

-- Location: LC_X12_Y8_N5
\pc[14]\ : maxv_lcell
-- Equation(s):
-- pc(14) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(14))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder14|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(14), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bb88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_plus_imm~combout\(14),
	datab => \pc_control~combout\(1),
	datac => \reg_b_val~combout\(14),
	datad => \pc_alu|stbadd|adder14|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(14));

-- Location: PIN_113,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pc_plus_imm[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pc_plus_imm(15),
	combout => \pc_plus_imm~combout\(15));

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_b_val[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reg_b_val(15),
	combout => \reg_b_val~combout\(15));

-- Location: LC_X12_Y8_N1
\pc_alu|stbadd|adder15|s\ : maxv_lcell
-- Equation(s):
-- \pc_alu|stbadd|adder15|s~combout\ = pc(15) $ (((pc(13) & (pc(14) & \pc_alu|stbadd|adder12|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6aaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(15),
	datab => pc(13),
	datac => pc(14),
	datad => \pc_alu|stbadd|adder12|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_alu|stbadd|adder15|s~combout\);

-- Location: LC_X12_Y8_N2
\pc[15]\ : maxv_lcell
-- Equation(s):
-- pc(15) = DFFEAS((\pc_control~combout\(1) & (\pc_plus_imm~combout\(15))) # (!\pc_control~combout\(1) & (((\pc_alu|stbadd|adder15|s~combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , \reg_b_val~combout\(15), , , \pc_control~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bb88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \pc_plus_imm~combout\(15),
	datab => \pc_control~combout\(1),
	datac => \reg_b_val~combout\(15),
	datad => \pc_alu|stbadd|adder15|s~combout\,
	aclr => \rst~combout\,
	sload => \pc_control~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pc(15));

-- Location: LC_X12_Y8_N9
\code_mem|Equal1~2\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal1~2_combout\ = (!pc(12) & (!pc(13) & (!pc(14) & !pc(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(12),
	datab => pc(13),
	datac => pc(14),
	datad => pc(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal1~2_combout\);

-- Location: LC_X9_Y8_N7
\code_mem|Equal1~3\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal1~3_combout\ = ((\code_mem|Equal1~0_combout\ & (\code_mem|Equal1~1_combout\ & \code_mem|Equal1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \code_mem|Equal1~0_combout\,
	datac => \code_mem|Equal1~1_combout\,
	datad => \code_mem|Equal1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal1~3_combout\);

-- Location: LC_X9_Y8_N0
\code_mem|Equal8~0\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal8~0_combout\ = (\code_mem|membr2[7]~2_combout\ & (!pc(3) & (\code_mem|Equal1~3_combout\ & pc(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \code_mem|membr2[7]~2_combout\,
	datab => pc(3),
	datac => \code_mem|Equal1~3_combout\,
	datad => pc(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal8~0_combout\);

-- Location: LC_X10_Y8_N2
\code_mem|membr2[7]~3\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr2[7]~3_combout\ = (\code_mem|Equal1~3_combout\ & (((!pc(1) & !pc(2))) # (!pc(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "444c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(3),
	datab => \code_mem|Equal1~3_combout\,
	datac => pc(1),
	datad => pc(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr2[7]~3_combout\);

-- Location: LC_X9_Y8_N3
\ir[0]~reg0\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr2\(0) = ((GLOBAL(\code_mem|membr2[7]~3_combout\) & (\code_mem|Equal8~0_combout\)) # (!GLOBAL(\code_mem|membr2[7]~3_combout\) & ((\code_mem|membr2\(0)))))
-- \ir[0]~reg0_regout\ = DFFEAS(\code_mem|membr2\(0), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfc0",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \code_mem|Equal8~0_combout\,
	datac => \code_mem|membr2[7]~3_combout\,
	datad => \code_mem|membr2\(0),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr2\(0),
	regout => \ir[0]~reg0_regout\);

-- Location: LC_X9_Y8_N4
\ir[1]~reg0\ : maxv_lcell
-- Equation(s):
-- \ir[1]~reg0_regout\ = DFFEAS((((\code_mem|membr2\(0)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \code_mem|membr2\(0),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir[1]~reg0_regout\);

-- Location: LC_X9_Y8_N9
\code_mem|Equal9~0\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal9~0_combout\ = (\code_mem|membr2[7]~2_combout\ & (!pc(3) & (\code_mem|Equal1~3_combout\ & !pc(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0020",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \code_mem|membr2[7]~2_combout\,
	datab => pc(3),
	datac => \code_mem|Equal1~3_combout\,
	datad => pc(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal9~0_combout\);

-- Location: LC_X9_Y8_N1
\ir[6]~reg0\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr2\(6) = ((GLOBAL(\code_mem|membr2[7]~3_combout\) & (\code_mem|Equal9~0_combout\)) # (!GLOBAL(\code_mem|membr2[7]~3_combout\) & ((\code_mem|membr2\(6)))))
-- \ir[6]~reg0_regout\ = DFFEAS(\code_mem|membr2\(6), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfc0",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \code_mem|Equal9~0_combout\,
	datac => \code_mem|membr2[7]~3_combout\,
	datad => \code_mem|membr2\(6),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr2\(6),
	regout => \ir[6]~reg0_regout\);

-- Location: LC_X8_Y8_N1
\code_mem|Equal1~4\ : maxv_lcell
-- Equation(s):
-- \code_mem|Equal1~4_combout\ = (!pc(0) & (\code_mem|membr2[7]~2_combout\ & (pc(3) & \code_mem|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(0),
	datab => \code_mem|membr2[7]~2_combout\,
	datac => pc(3),
	datad => \code_mem|Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|Equal1~4_combout\);

-- Location: LC_X8_Y8_N2
\ir[7]~reg0\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr2\(7) = ((GLOBAL(\code_mem|membr2[7]~3_combout\) & ((\code_mem|Equal1~4_combout\))) # (!GLOBAL(\code_mem|membr2[7]~3_combout\) & (\code_mem|membr2\(7))))
-- \ir[7]~reg0_regout\ = DFFEAS(\code_mem|membr2\(7), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc0c",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \code_mem|membr2\(7),
	datac => \code_mem|membr2[7]~3_combout\,
	datad => \code_mem|Equal1~4_combout\,
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr2\(7),
	regout => \ir[7]~reg0_regout\);

-- Location: LC_X8_Y8_N9
\ir[8]~reg0\ : maxv_lcell
-- Equation(s):
-- \ir[8]~reg0_regout\ = DFFEAS((((\code_mem|membr2\(7)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \code_mem|membr2\(7),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir[8]~reg0_regout\);

-- Location: LC_X8_Y8_N0
\ir[10]~reg0\ : maxv_lcell
-- Equation(s):
-- \ir[10]~reg0_regout\ = DFFEAS((((\code_mem|membr2\(7)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \code_mem|membr2\(7),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir[10]~reg0_regout\);

-- Location: LC_X9_Y8_N2
\ir[12]~reg0\ : maxv_lcell
-- Equation(s):
-- \ir[12]~reg0_regout\ = DFFEAS((((\code_mem|membr2\(6)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \code_mem|membr2\(6),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir[12]~reg0_regout\);

-- Location: LC_X10_Y8_N5
\code_mem|membr1[7]~2\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr1[7]~2_combout\ = (pc(2)) # ((pc(3)) # ((pc(1)) # (!\code_mem|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "feff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => pc(2),
	datab => pc(3),
	datac => pc(1),
	datad => \code_mem|Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr1[7]~2_combout\);

-- Location: LC_X10_Y8_N6
\ir[15]~reg0\ : maxv_lcell
-- Equation(s):
-- \code_mem|membr1\(7) = (GLOBAL(\code_mem|membr2[7]~3_combout\) & (((!\code_mem|membr1[7]~2_combout\)))) # (!GLOBAL(\code_mem|membr2[7]~3_combout\) & (((\code_mem|membr1\(7)))))
-- \ir[15]~reg0_regout\ = DFFEAS(\code_mem|membr1\(7), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "50fa",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \code_mem|membr2[7]~3_combout\,
	datac => \code_mem|membr1\(7),
	datad => \code_mem|membr1[7]~2_combout\,
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \code_mem|membr1\(7),
	regout => \ir[15]~reg0_regout\);

-- Location: LC_X7_Y8_N0
\pc_old[0]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[0]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(0), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(0),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[0]~reg0_regout\);

-- Location: LC_X6_Y8_N6
\pc_old[1]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[1]~reg0_regout\ = DFFEAS((((pc(1)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => pc(1),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[1]~reg0_regout\);

-- Location: LC_X6_Y8_N2
\pc_old[2]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[2]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(2), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(2),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[2]~reg0_regout\);

-- Location: LC_X7_Y8_N5
\pc_old[3]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[3]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(3), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(3),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[3]~reg0_regout\);

-- Location: LC_X7_Y8_N8
\pc_old[4]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[4]~reg0_regout\ = DFFEAS((((pc(4)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => pc(4),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[4]~reg0_regout\);

-- Location: LC_X7_Y8_N4
\pc_old[5]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[5]~reg0_regout\ = DFFEAS((((pc(5)))), GLOBAL(\clk~combout\), VCC, , !\rst~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => pc(5),
	aclr => GND,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[5]~reg0_regout\);

-- Location: LC_X7_Y8_N6
\pc_old[6]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[6]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(6), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(6),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[6]~reg0_regout\);

-- Location: LC_X6_Y8_N4
\pc_old[7]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[7]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(7), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(7),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[7]~reg0_regout\);

-- Location: LC_X6_Y8_N5
\pc_old[8]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[8]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(8), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(8),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[8]~reg0_regout\);

-- Location: LC_X11_Y8_N8
\pc_old[9]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[9]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(9), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(9),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[9]~reg0_regout\);

-- Location: LC_X11_Y8_N4
\pc_old[10]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[10]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(10), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(10),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[10]~reg0_regout\);

-- Location: LC_X9_Y7_N2
\pc_old[11]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[11]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(11), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(11),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[11]~reg0_regout\);

-- Location: LC_X9_Y7_N5
\pc_old[12]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[12]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(12), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(12),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[12]~reg0_regout\);

-- Location: LC_X11_Y7_N2
\pc_old[13]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[13]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(13), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(13),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[13]~reg0_regout\);

-- Location: LC_X11_Y7_N4
\pc_old[14]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[14]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(14), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(14),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[14]~reg0_regout\);

-- Location: LC_X5_Y8_N2
\pc_old[15]~reg0\ : maxv_lcell
-- Equation(s):
-- \pc_old[15]~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, pc(15), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => pc(15),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_old[15]~reg0_regout\);

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\valid_in~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_valid_in,
	combout => \valid_in~combout\);

-- Location: LC_X1_Y7_N8
\valid_out~reg0\ : maxv_lcell
-- Equation(s):
-- \valid_out~reg0_regout\ = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , !\rst~combout\, \valid_in~combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \valid_in~combout\,
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \valid_out~reg0_regout\);

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[0]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(0));

-- Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[1]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(1));

-- Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(2));

-- Location: PIN_76,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(3));

-- Location: PIN_71,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(4));

-- Location: PIN_74,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(5));

-- Location: PIN_124,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[6]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(6));

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[7]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(7));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[8]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(8));

-- Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(9));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[10]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(10));

-- Location: PIN_77,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(11));

-- Location: PIN_50,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[12]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(12));

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(13));

-- Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ir(14));

-- Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ir[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ir[15]~reg0_regout\,
	oe => VCC,
	padio => ww_ir(15));

-- Location: PIN_142,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[0]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(0));

-- Location: PIN_138,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[1]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(1));

-- Location: PIN_141,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[2]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(2));

-- Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[3]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(3));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[4]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(4));

-- Location: PIN_133,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[5]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(5));

-- Location: PIN_137,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[6]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(6));

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[7]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(7));

-- Location: PIN_139,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[8]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(8));

-- Location: PIN_117,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[9]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(9));

-- Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[10]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(10));

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[11]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(11));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[12]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(12));

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[13]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(13));

-- Location: PIN_102,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[14]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(14));

-- Location: PIN_140,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\pc_old[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \pc_old[15]~reg0_regout\,
	oe => VCC,
	padio => ww_pc_old(15));

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\valid_out~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \valid_out~reg0_regout\,
	oe => VCC,
	padio => ww_valid_out);
END structure;


