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
-- CREATED		"Wed Mar 29 07:02:51 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SR_Flip_Flop IS 
	PORT
	(
		En :  IN  STD_LOGIC;
		Clk :  IN  STD_LOGIC;
		S :  IN  STD_LOGIC;
		R :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC;
		Qn :  OUT  STD_LOGIC
	);
END SR_Flip_Flop;

ARCHITECTURE bdf_type OF SR_Flip_Flop IS 

COMPONENT sr_latch
	PORT(R : IN STD_LOGIC;
		 En : IN STD_LOGIC;
		 Clk : IN STD_LOGIC;
		 S : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 Qn : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_1 <= NOT(Clk);



b2v_inst1 : sr_latch
PORT MAP(R => SYNTHESIZED_WIRE_0,
		 En => En,
		 Clk => SYNTHESIZED_WIRE_1,
		 S => SYNTHESIZED_WIRE_2,
		 Q => Q,
		 Qn => Qn);


b2v_inst2 : sr_latch
PORT MAP(R => S,
		 En => En,
		 Clk => Clk,
		 S => R,
		 Q => SYNTHESIZED_WIRE_0,
		 Qn => SYNTHESIZED_WIRE_2);


END bdf_type;