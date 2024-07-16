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
-- Generated on "07/01/2024 09:48:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          StateMachine
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY StateMachine_vhd_vec_tst IS
END StateMachine_vhd_vec_tst;
ARCHITECTURE StateMachine_arch OF StateMachine_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT StateMachine
	PORT (
	clk : IN STD_LOGIC;
	Q : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : StateMachine
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Q => Q,
	rst => rst
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- rst
t_prcs_rst: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		rst <= '0';
		WAIT FOR 75000 ps;
		rst <= '1';
		WAIT FOR 75000 ps;
	END LOOP;
	rst <= '0';
	WAIT FOR 75000 ps;
	rst <= '1';
WAIT;
END PROCESS t_prcs_rst;
-- Q[1]
t_prcs_Q_1: PROCESS
BEGIN
	Q(1) <= 'Z';
WAIT;
END PROCESS t_prcs_Q_1;
-- Q[0]
t_prcs_Q_0: PROCESS
BEGIN
	Q(0) <= 'Z';
WAIT;
END PROCESS t_prcs_Q_0;
END StateMachine_arch;
