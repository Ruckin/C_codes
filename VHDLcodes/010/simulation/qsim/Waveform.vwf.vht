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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/28/2024 07:47:34"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Adder_2bit_numbers
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Adder_2bit_numbers_vhd_vec_tst IS
END Adder_2bit_numbers_vhd_vec_tst;
ARCHITECTURE Adder_2bit_numbers_arch OF Adder_2bit_numbers_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL sumResult : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT Adder_2bit_numbers
	PORT (
	input_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	input_2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	sumResult : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Adder_2bit_numbers
	PORT MAP (
-- list connections between master ports and signals
	input_1 => input_1,
	input_2 => input_2,
	sumResult => sumResult
	);
-- input_1[1]
t_prcs_input_1_1: PROCESS
BEGIN
	input_1(1) <= '0';
	WAIT FOR 170000 ps;
	input_1(1) <= '1';
	WAIT FOR 170000 ps;
	input_1(1) <= '0';
	WAIT FOR 380000 ps;
	input_1(1) <= '1';
	WAIT FOR 90000 ps;
	input_1(1) <= '0';
WAIT;
END PROCESS t_prcs_input_1_1;
-- input_1[0]
t_prcs_input_1_0: PROCESS
BEGIN
	input_1(0) <= '0';
	WAIT FOR 90000 ps;
	input_1(0) <= '1';
	WAIT FOR 80000 ps;
	input_1(0) <= '0';
	WAIT FOR 70000 ps;
	input_1(0) <= '1';
	WAIT FOR 100000 ps;
	input_1(0) <= '0';
	WAIT FOR 380000 ps;
	input_1(0) <= '1';
	WAIT FOR 90000 ps;
	input_1(0) <= '0';
WAIT;
END PROCESS t_prcs_input_1_0;
-- input_2[1]
t_prcs_input_2_1: PROCESS
BEGIN
	input_2(1) <= '0';
	WAIT FOR 350000 ps;
	input_2(1) <= '1';
	WAIT FOR 90000 ps;
	input_2(1) <= '0';
	WAIT FOR 160000 ps;
	input_2(1) <= '1';
	WAIT FOR 100000 ps;
	input_2(1) <= '0';
	WAIT FOR 30000 ps;
	input_2(1) <= '1';
	WAIT FOR 100000 ps;
	input_2(1) <= '0';
WAIT;
END PROCESS t_prcs_input_2_1;
-- input_2[0]
t_prcs_input_2_0: PROCESS
BEGIN
	input_2(0) <= '0';
	WAIT FOR 450000 ps;
	input_2(0) <= '1';
	WAIT FOR 90000 ps;
	input_2(0) <= '0';
	WAIT FOR 60000 ps;
	input_2(0) <= '1';
	WAIT FOR 100000 ps;
	input_2(0) <= '0';
	WAIT FOR 30000 ps;
	input_2(0) <= '1';
	WAIT FOR 100000 ps;
	input_2(0) <= '0';
WAIT;
END PROCESS t_prcs_input_2_0;
END Adder_2bit_numbers_arch;
