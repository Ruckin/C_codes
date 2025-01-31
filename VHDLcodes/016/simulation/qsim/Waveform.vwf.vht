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
-- Generated on "07/01/2024 10:56:00"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          FiniteStateMachine
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY FiniteStateMachine_vhd_vec_tst IS
END FiniteStateMachine_vhd_vec_tst;
ARCHITECTURE FiniteStateMachine_arch OF FiniteStateMachine_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL control : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT FiniteStateMachine
	PORT (
	clk : IN STD_LOGIC;
	control : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : FiniteStateMachine
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	control => control,
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

-- control
t_prcs_control: PROCESS
BEGIN
	control <= '1';
	WAIT FOR 490000 ps;
	control <= '0';
WAIT;
END PROCESS t_prcs_control;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 100000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;
END FiniteStateMachine_arch;
