-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "07/01/2024 09:32:13"

-- 
-- Device: Altera EP4CE22E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RegisterAsynchronousEdge IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	set : IN std_logic;
	data : IN std_logic_vector(2 DOWNTO 0);
	Q : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END RegisterAsynchronousEdge;

-- Design Ports Information
-- Q[0]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[2]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RegisterAsynchronousEdge IS
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
SIGNAL ww_set : std_logic;
SIGNAL ww_data : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Q : std_logic_vector(2 DOWNTO 0);
SIGNAL \Q[0]~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \Q[2]~9_combout\ : std_logic;
SIGNAL \Q[0]~1_combout\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \Q[0]~3_combout\ : std_logic;
SIGNAL \Q[0]~0_combout\ : std_logic;
SIGNAL \Q[0]~0clkctrl_outclk\ : std_logic;
SIGNAL \Q[0]~reg0_emulated_q\ : std_logic;
SIGNAL \Q[0]~2_combout\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \Q[1]~5_combout\ : std_logic;
SIGNAL \Q[1]~reg0_emulated_q\ : std_logic;
SIGNAL \Q[1]~4_combout\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \Q[2]~7_combout\ : std_logic;
SIGNAL \Q[2]~reg0_emulated_q\ : std_logic;
SIGNAL \Q[2]~6_combout\ : std_logic;
SIGNAL \ALT_INV_Q[0]~0clkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_set <= set;
ww_data <= data;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Q[0]~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Q[0]~0_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_Q[0]~0clkctrl_outclk\ <= NOT \Q[0]~0clkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X53_Y22_N2
\Q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[0]~2_combout\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X29_Y34_N16
\Q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[1]~4_combout\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOOBUF_X18_Y34_N2
\Q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[2]~6_combout\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

-- Location: IOIBUF_X0_Y16_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X0_Y16_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X20_Y34_N8
\set~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: LCCOMB_X23_Y22_N22
\Q[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[2]~9_combout\ = (!\rst~input_o\ & \set~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datad => \set~input_o\,
	combout => \Q[2]~9_combout\);

-- Location: LCCOMB_X23_Y22_N16
\Q[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[0]~1_combout\ = (!\rst~input_o\ & ((\Q[2]~9_combout\) # (\Q[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datac => \Q[2]~9_combout\,
	datad => \Q[0]~1_combout\,
	combout => \Q[0]~1_combout\);

-- Location: IOIBUF_X0_Y16_N22
\data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: LCCOMB_X23_Y22_N8
\Q[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[0]~3_combout\ = \Q[0]~1_combout\ $ (\data[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Q[0]~1_combout\,
	datad => \data[0]~input_o\,
	combout => \Q[0]~3_combout\);

-- Location: LCCOMB_X23_Y22_N4
\Q[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[0]~0_combout\ = (\rst~input_o\) # (\Q[2]~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datac => \Q[2]~9_combout\,
	combout => \Q[0]~0_combout\);

-- Location: CLKCTRL_G14
\Q[0]~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Q[0]~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Q[0]~0clkctrl_outclk\);

-- Location: FF_X23_Y22_N9
\Q[0]~reg0_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Q[0]~3_combout\,
	clrn => \ALT_INV_Q[0]~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q[0]~reg0_emulated_q\);

-- Location: LCCOMB_X23_Y22_N26
\Q[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[0]~2_combout\ = (!\rst~input_o\ & ((\Q[2]~9_combout\) # (\Q[0]~reg0_emulated_q\ $ (\Q[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \Q[0]~reg0_emulated_q\,
	datac => \Q[2]~9_combout\,
	datad => \Q[0]~1_combout\,
	combout => \Q[0]~2_combout\);

-- Location: IOIBUF_X20_Y34_N15
\data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: LCCOMB_X23_Y22_N12
\Q[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[1]~5_combout\ = \data[1]~input_o\ $ (\Q[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \data[1]~input_o\,
	datad => \Q[0]~1_combout\,
	combout => \Q[1]~5_combout\);

-- Location: FF_X23_Y22_N13
\Q[1]~reg0_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Q[1]~5_combout\,
	clrn => \ALT_INV_Q[0]~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q[1]~reg0_emulated_q\);

-- Location: LCCOMB_X23_Y22_N14
\Q[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[1]~4_combout\ = (!\rst~input_o\ & ((\Q[2]~9_combout\) # (\Q[0]~1_combout\ $ (\Q[1]~reg0_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \Q[0]~1_combout\,
	datac => \Q[2]~9_combout\,
	datad => \Q[1]~reg0_emulated_q\,
	combout => \Q[1]~4_combout\);

-- Location: IOIBUF_X18_Y34_N22
\data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: LCCOMB_X23_Y22_N24
\Q[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[2]~7_combout\ = \Q[0]~1_combout\ $ (\data[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Q[0]~1_combout\,
	datac => \data[2]~input_o\,
	combout => \Q[2]~7_combout\);

-- Location: FF_X23_Y22_N25
\Q[2]~reg0_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Q[2]~7_combout\,
	clrn => \ALT_INV_Q[0]~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q[2]~reg0_emulated_q\);

-- Location: LCCOMB_X23_Y22_N10
\Q[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[2]~6_combout\ = (!\rst~input_o\ & ((\Q[2]~9_combout\) # (\Q[0]~1_combout\ $ (\Q[2]~reg0_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \Q[0]~1_combout\,
	datac => \Q[2]~9_combout\,
	datad => \Q[2]~reg0_emulated_q\,
	combout => \Q[2]~6_combout\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;
END structure;


