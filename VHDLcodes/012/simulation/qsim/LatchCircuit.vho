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

-- DATE "07/01/2024 08:52:02"

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


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LatchCircuit IS
    PORT (
	en : IN std_logic;
	rst : IN std_logic;
	set : IN std_logic;
	data : IN std_logic_vector(2 DOWNTO 0);
	Q : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END LatchCircuit;

-- Design Ports Information
-- Q[0]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[2]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF LatchCircuit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_set : std_logic;
SIGNAL ww_data : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Q : std_logic_vector(2 DOWNTO 0);
SIGNAL \en~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \en~inputclkctrl_outclk\ : std_logic;
SIGNAL \Q[0]$latch~0_combout\ : std_logic;
SIGNAL \Q[0]$latch~combout\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \Q[1]$latch~0_combout\ : std_logic;
SIGNAL \Q[1]$latch~combout\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \Q[2]$latch~0_combout\ : std_logic;
SIGNAL \Q[2]$latch~combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_en <= en;
ww_rst <= rst;
ww_set <= set;
ww_data <= data;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\en~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \en~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X3_Y0_N2
\Q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[0]$latch~combout\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\Q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[1]$latch~combout\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\Q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[2]$latch~combout\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

-- Location: IOIBUF_X18_Y0_N8
\set~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: IOIBUF_X0_Y16_N22
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: IOIBUF_X0_Y16_N8
\en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: CLKCTRL_G2
\en~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \en~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \en~inputclkctrl_outclk\);

-- Location: LCCOMB_X6_Y4_N10
\Q[0]$latch~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[0]$latch~0_combout\ = (GLOBAL(\en~inputclkctrl_outclk\) & (\data[0]~input_o\)) # (!GLOBAL(\en~inputclkctrl_outclk\) & ((\Q[0]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data[0]~input_o\,
	datac => \en~inputclkctrl_outclk\,
	datad => \Q[0]$latch~combout\,
	combout => \Q[0]$latch~0_combout\);

-- Location: LCCOMB_X6_Y4_N0
\Q[0]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[0]$latch~combout\ = (!\rst~input_o\ & ((\set~input_o\) # (\Q[0]$latch~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \set~input_o\,
	datac => \rst~input_o\,
	datad => \Q[0]$latch~0_combout\,
	combout => \Q[0]$latch~combout\);

-- Location: IOIBUF_X0_Y6_N15
\data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: LCCOMB_X6_Y4_N6
\Q[1]$latch~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[1]$latch~0_combout\ = (GLOBAL(\en~inputclkctrl_outclk\) & (\data[1]~input_o\)) # (!GLOBAL(\en~inputclkctrl_outclk\) & ((\Q[1]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data[1]~input_o\,
	datac => \en~inputclkctrl_outclk\,
	datad => \Q[1]$latch~combout\,
	combout => \Q[1]$latch~0_combout\);

-- Location: LCCOMB_X6_Y4_N20
\Q[1]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[1]$latch~combout\ = (!\rst~input_o\ & ((\set~input_o\) # (\Q[1]$latch~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \set~input_o\,
	datac => \rst~input_o\,
	datad => \Q[1]$latch~0_combout\,
	combout => \Q[1]$latch~combout\);

-- Location: IOIBUF_X5_Y0_N22
\data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: LCCOMB_X6_Y4_N18
\Q[2]$latch~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[2]$latch~0_combout\ = (GLOBAL(\en~inputclkctrl_outclk\) & (\data[2]~input_o\)) # (!GLOBAL(\en~inputclkctrl_outclk\) & ((\Q[2]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data[2]~input_o\,
	datac => \en~inputclkctrl_outclk\,
	datad => \Q[2]$latch~combout\,
	combout => \Q[2]$latch~0_combout\);

-- Location: LCCOMB_X6_Y4_N16
\Q[2]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q[2]$latch~combout\ = (!\rst~input_o\ & ((\set~input_o\) # (\Q[2]$latch~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \set~input_o\,
	datac => \rst~input_o\,
	datad => \Q[2]$latch~0_combout\,
	combout => \Q[2]$latch~combout\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;
END structure;


