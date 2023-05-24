-- Copyright (C) 2022  Intel Corporation. All rights reserved.
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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"
-- CREATED		"Mon Mar 27 14:42:30 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE work.lab12_pacakge.all;

LIBRARY work;

ENTITY D_latch IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		Clk :  IN  STD_LOGIC;
		En :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC;
		Qn :  OUT  STD_LOGIC
	);
END D_latch;

ARCHITECTURE bdf_type OF D_latch IS 



SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



b2v_inst : sr_latch
PORT MAP(R => SYNTHESIZED_WIRE_0,
		 En => Clk,
		 Clk => En,
		 S => D,
		 Q => Q,
		 Qn => Qn);


SYNTHESIZED_WIRE_0 <= NOT(D);



END bdf_type;