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
-- Generated on "07/01/2024 08:52:00"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          LatchCircuit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY LatchCircuit_vhd_vec_tst IS
END LatchCircuit_vhd_vec_tst;
ARCHITECTURE LatchCircuit_arch OF LatchCircuit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL data : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL en : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL set : STD_LOGIC;
COMPONENT LatchCircuit
	PORT (
	data : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	en : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	rst : IN STD_LOGIC;
	set : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : LatchCircuit
	PORT MAP (
-- list connections between master ports and signals
	data => data,
	en => en,
	Q => Q,
	rst => rst,
	set => set
	);
-- data[2]
t_prcs_data_2: PROCESS
BEGIN
LOOP
	data(2) <= '0';
	WAIT FOR 5000 ps;
	data(2) <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_data_2;
-- data[1]
t_prcs_data_1: PROCESS
BEGIN
LOOP
	data(1) <= '0';
	WAIT FOR 10000 ps;
	data(1) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_data_1;
-- data[0]
t_prcs_data_0: PROCESS
BEGIN
	FOR i IN 1 TO 33
	LOOP
		data(0) <= '0';
		WAIT FOR 15000 ps;
		data(0) <= '1';
		WAIT FOR 15000 ps;
	END LOOP;
	data(0) <= '0';
WAIT;
END PROCESS t_prcs_data_0;

-- en
t_prcs_en: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		en <= '0';
		WAIT FOR 60000 ps;
		en <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	en <= '0';
WAIT;
END PROCESS t_prcs_en;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 90000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;

-- set
t_prcs_set: PROCESS
BEGIN
	set <= '0';
	WAIT FOR 100000 ps;
	set <= '1';
	WAIT FOR 340000 ps;
	set <= '0';
WAIT;
END PROCESS t_prcs_set;
END LatchCircuit_arch;
