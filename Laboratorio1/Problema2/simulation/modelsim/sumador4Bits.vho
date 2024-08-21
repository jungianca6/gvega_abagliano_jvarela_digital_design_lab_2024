-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "08/08/2024 22:24:26"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sumador4Bits IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	S : BUFFER std_logic_vector(3 DOWNTO 0);
	Cout : BUFFER std_logic;
	sum_seg : BUFFER std_logic_vector(6 DOWNTO 0);
	carry_seg : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END sumador4Bits;

-- Design Ports Information
-- S[0]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[1]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[2]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[3]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cout	=>  Location: PIN_AJ20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[0]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[3]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[4]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum_seg[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[0]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[1]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[2]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[3]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[4]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[5]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry_seg[6]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sumador4Bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_S : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cout : std_logic;
SIGNAL ww_sum_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_carry_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \FA0|S~combout\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \FA1|S~combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \FA1|Cout~0_combout\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \FA2|S~combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \FA3|S~combout\ : std_logic;
SIGNAL \FA3|Cout~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux6~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux5~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux4~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux3~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux2~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux1~0_combout\ : std_logic;
SIGNAL \sum_disp|Mux0~0_combout\ : std_logic;
SIGNAL \FA1|ALT_INV_S~combout\ : std_logic;
SIGNAL \FA1|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \FA2|ALT_INV_S~combout\ : std_logic;
SIGNAL \FA3|ALT_INV_S~combout\ : std_logic;
SIGNAL \sum_disp|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \FA0|ALT_INV_S~combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Cin <= Cin;
S <= ww_S;
Cout <= ww_Cout;
sum_seg <= ww_sum_seg;
carry_seg <= ww_carry_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\FA1|ALT_INV_S~combout\ <= NOT \FA1|S~combout\;
\FA1|ALT_INV_Cout~0_combout\ <= NOT \FA1|Cout~0_combout\;
\FA2|ALT_INV_S~combout\ <= NOT \FA2|S~combout\;
\FA3|ALT_INV_S~combout\ <= NOT \FA3|S~combout\;
\sum_disp|ALT_INV_Mux0~0_combout\ <= NOT \sum_disp|Mux0~0_combout\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\FA0|ALT_INV_S~combout\ <= NOT \FA0|S~combout\;

-- Location: IOOBUF_X89_Y4_N45
\S[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA0|S~combout\,
	devoe => ww_devoe,
	o => ww_S(0));

-- Location: IOOBUF_X89_Y6_N22
\S[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA1|S~combout\,
	devoe => ww_devoe,
	o => ww_S(1));

-- Location: IOOBUF_X89_Y4_N79
\S[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA2|S~combout\,
	devoe => ww_devoe,
	o => ww_S(2));

-- Location: IOOBUF_X89_Y16_N22
\S[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA3|S~combout\,
	devoe => ww_devoe,
	o => ww_S(3));

-- Location: IOOBUF_X62_Y0_N36
\Cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA3|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_Cout);

-- Location: IOOBUF_X60_Y0_N19
\sum_seg[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(0));

-- Location: IOOBUF_X80_Y0_N2
\sum_seg[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(1));

-- Location: IOOBUF_X50_Y0_N93
\sum_seg[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(2));

-- Location: IOOBUF_X50_Y0_N76
\sum_seg[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(3));

-- Location: IOOBUF_X56_Y0_N36
\sum_seg[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(4));

-- Location: IOOBUF_X58_Y0_N76
\sum_seg[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(5));

-- Location: IOOBUF_X56_Y0_N53
\sum_seg[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum_disp|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_sum_seg(6));

-- Location: IOOBUF_X52_Y0_N53
\carry_seg[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA3|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_carry_seg(0));

-- Location: IOOBUF_X52_Y0_N2
\carry_seg[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_carry_seg(1));

-- Location: IOOBUF_X52_Y0_N36
\carry_seg[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_carry_seg(2));

-- Location: IOOBUF_X64_Y0_N19
\carry_seg[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA3|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_carry_seg(3));

-- Location: IOOBUF_X66_Y0_N42
\carry_seg[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA3|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_carry_seg(4));

-- Location: IOOBUF_X50_Y0_N42
\carry_seg[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA3|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_carry_seg(5));

-- Location: IOOBUF_X60_Y0_N2
\carry_seg[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_carry_seg(6));

-- Location: IOIBUF_X89_Y20_N61
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X89_Y20_N44
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: IOIBUF_X89_Y21_N4
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: LABCELL_X88_Y20_N0
\FA0|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA0|S~combout\ = ( \A[0]~input_o\ & ( !\B[0]~input_o\ $ (\Cin~input_o\) ) ) # ( !\A[0]~input_o\ & ( !\B[0]~input_o\ $ (!\Cin~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010101001011010010101011010010110101010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	combout => \FA0|S~combout\);

-- Location: IOIBUF_X89_Y20_N78
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LABCELL_X88_Y20_N39
\FA1|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA1|S~combout\ = ( \A[0]~input_o\ & ( \A[1]~input_o\ & ( !\B[1]~input_o\ $ (((\B[0]~input_o\) # (\Cin~input_o\))) ) ) ) # ( !\A[0]~input_o\ & ( \A[1]~input_o\ & ( !\B[1]~input_o\ $ (((\Cin~input_o\ & \B[0]~input_o\))) ) ) ) # ( \A[0]~input_o\ & ( 
-- !\A[1]~input_o\ & ( !\B[1]~input_o\ $ (((!\Cin~input_o\ & !\B[0]~input_o\))) ) ) ) # ( !\A[0]~input_o\ & ( !\A[1]~input_o\ & ( !\B[1]~input_o\ $ (((!\Cin~input_o\) # (!\B[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010010110101111000011110000101001011010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Cin~input_o\,
	datac => \ALT_INV_B[1]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \FA1|S~combout\);

-- Location: IOIBUF_X89_Y21_N38
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: LABCELL_X88_Y20_N42
\FA1|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA1|Cout~0_combout\ = ( \A[0]~input_o\ & ( \A[1]~input_o\ & ( ((\Cin~input_o\) # (\B[1]~input_o\)) # (\B[0]~input_o\) ) ) ) # ( !\A[0]~input_o\ & ( \A[1]~input_o\ & ( ((\B[0]~input_o\ & \Cin~input_o\)) # (\B[1]~input_o\) ) ) ) # ( \A[0]~input_o\ & ( 
-- !\A[1]~input_o\ & ( (\B[1]~input_o\ & ((\Cin~input_o\) # (\B[0]~input_o\))) ) ) ) # ( !\A[0]~input_o\ & ( !\A[1]~input_o\ & ( (\B[0]~input_o\ & (\B[1]~input_o\ & \Cin~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000100110001001100110111001101110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datab => \ALT_INV_B[1]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \FA1|Cout~0_combout\);

-- Location: IOIBUF_X89_Y25_N38
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: LABCELL_X88_Y20_N21
\FA2|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA2|S~combout\ = ( \B[2]~input_o\ & ( !\A[2]~input_o\ $ (\FA1|Cout~0_combout\) ) ) # ( !\B[2]~input_o\ & ( !\A[2]~input_o\ $ (!\FA1|Cout~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[2]~input_o\,
	datac => \FA1|ALT_INV_Cout~0_combout\,
	dataf => \ALT_INV_B[2]~input_o\,
	combout => \FA2|S~combout\);

-- Location: IOIBUF_X89_Y20_N95
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: LABCELL_X88_Y20_N24
\FA3|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3|S~combout\ = ( \B[3]~input_o\ & ( \A[3]~input_o\ & ( (!\FA1|Cout~0_combout\ & (\A[2]~input_o\ & \B[2]~input_o\)) # (\FA1|Cout~0_combout\ & ((\B[2]~input_o\) # (\A[2]~input_o\))) ) ) ) # ( !\B[3]~input_o\ & ( \A[3]~input_o\ & ( (!\FA1|Cout~0_combout\ 
-- & ((!\A[2]~input_o\) # (!\B[2]~input_o\))) # (\FA1|Cout~0_combout\ & (!\A[2]~input_o\ & !\B[2]~input_o\)) ) ) ) # ( \B[3]~input_o\ & ( !\A[3]~input_o\ & ( (!\FA1|Cout~0_combout\ & ((!\A[2]~input_o\) # (!\B[2]~input_o\))) # (\FA1|Cout~0_combout\ & 
-- (!\A[2]~input_o\ & !\B[2]~input_o\)) ) ) ) # ( !\B[3]~input_o\ & ( !\A[3]~input_o\ & ( (!\FA1|Cout~0_combout\ & (\A[2]~input_o\ & \B[2]~input_o\)) # (\FA1|Cout~0_combout\ & ((\B[2]~input_o\) # (\A[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100111111111111001100000011111100110000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA1|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_A[2]~input_o\,
	datad => \ALT_INV_B[2]~input_o\,
	datae => \ALT_INV_B[3]~input_o\,
	dataf => \ALT_INV_A[3]~input_o\,
	combout => \FA3|S~combout\);

-- Location: LABCELL_X88_Y20_N33
\FA3|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3|Cout~0_combout\ = ( \B[3]~input_o\ & ( \A[3]~input_o\ ) ) # ( !\B[3]~input_o\ & ( \A[3]~input_o\ & ( (!\A[2]~input_o\ & (\B[2]~input_o\ & \FA1|Cout~0_combout\)) # (\A[2]~input_o\ & ((\FA1|Cout~0_combout\) # (\B[2]~input_o\))) ) ) ) # ( \B[3]~input_o\ 
-- & ( !\A[3]~input_o\ & ( (!\A[2]~input_o\ & (\B[2]~input_o\ & \FA1|Cout~0_combout\)) # (\A[2]~input_o\ & ((\FA1|Cout~0_combout\) # (\B[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000101110001011100010111000101111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[2]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datac => \FA1|ALT_INV_Cout~0_combout\,
	datae => \ALT_INV_B[3]~input_o\,
	dataf => \ALT_INV_A[3]~input_o\,
	combout => \FA3|Cout~0_combout\);

-- Location: MLABCELL_X65_Y4_N33
\sum_disp|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux6~0_combout\ = ( \FA2|S~combout\ & ( (!\FA1|S~combout\ & (!\FA0|S~combout\ $ (\FA3|S~combout\))) ) ) # ( !\FA2|S~combout\ & ( (\FA0|S~combout\ & (!\FA1|S~combout\ $ (\FA3|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000101000001100001001000010001000001010000011000010010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA0|ALT_INV_S~combout\,
	datab => \FA1|ALT_INV_S~combout\,
	datac => \FA3|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux6~0_combout\);

-- Location: MLABCELL_X65_Y4_N6
\sum_disp|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux5~0_combout\ = ( \FA2|S~combout\ & ( (!\FA3|S~combout\ & (!\FA0|S~combout\ $ (!\FA1|S~combout\))) # (\FA3|S~combout\ & ((!\FA0|S~combout\) # (\FA1|S~combout\))) ) ) # ( !\FA2|S~combout\ & ( (\FA3|S~combout\ & (\FA0|S~combout\ & 
-- \FA1|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011001111001111001100000000000000110011110011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA3|ALT_INV_S~combout\,
	datac => \FA0|ALT_INV_S~combout\,
	datad => \FA1|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux5~0_combout\);

-- Location: MLABCELL_X65_Y4_N12
\sum_disp|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux4~0_combout\ = ( \FA2|S~combout\ & ( (\FA3|S~combout\ & ((!\FA0|S~combout\) # (\FA1|S~combout\))) ) ) # ( !\FA2|S~combout\ & ( (!\FA3|S~combout\ & (!\FA0|S~combout\ & \FA1|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000001100000011001100000000110000000011000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA3|ALT_INV_S~combout\,
	datac => \FA0|ALT_INV_S~combout\,
	datad => \FA1|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux4~0_combout\);

-- Location: MLABCELL_X65_Y4_N51
\sum_disp|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux3~0_combout\ = ( \FA2|S~combout\ & ( (!\FA0|S~combout\ & (!\FA1|S~combout\ & !\FA3|S~combout\)) # (\FA0|S~combout\ & (\FA1|S~combout\)) ) ) # ( !\FA2|S~combout\ & ( (!\FA0|S~combout\ & (\FA1|S~combout\ & \FA3|S~combout\)) # (\FA0|S~combout\ & 
-- (!\FA1|S~combout\ & !\FA3|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001001000010100100011001000101000010010000101001000110010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA0|ALT_INV_S~combout\,
	datab => \FA1|ALT_INV_S~combout\,
	datac => \FA3|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux3~0_combout\);

-- Location: MLABCELL_X65_Y4_N24
\sum_disp|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux2~0_combout\ = ( \FA2|S~combout\ & ( (!\FA3|S~combout\ & ((!\FA1|S~combout\) # (\FA0|S~combout\))) ) ) # ( !\FA2|S~combout\ & ( (\FA0|S~combout\ & ((!\FA3|S~combout\) # (!\FA1|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001100110011000000110000001111000011001100110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA3|ALT_INV_S~combout\,
	datac => \FA0|ALT_INV_S~combout\,
	datad => \FA1|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux2~0_combout\);

-- Location: MLABCELL_X65_Y4_N3
\sum_disp|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux1~0_combout\ = ( \FA2|S~combout\ & ( (\FA0|S~combout\ & (!\FA1|S~combout\ $ (!\FA3|S~combout\))) ) ) # ( !\FA2|S~combout\ & ( (!\FA3|S~combout\ & ((\FA1|S~combout\) # (\FA0|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000001110000000101000001010001110000011100000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA0|ALT_INV_S~combout\,
	datab => \FA1|ALT_INV_S~combout\,
	datac => \FA3|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux1~0_combout\);

-- Location: MLABCELL_X65_Y4_N36
\sum_disp|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum_disp|Mux0~0_combout\ = ( \FA2|S~combout\ & ( (!\FA3|S~combout\ & ((!\FA0|S~combout\) # (!\FA1|S~combout\))) # (\FA3|S~combout\ & ((\FA1|S~combout\) # (\FA0|S~combout\))) ) ) # ( !\FA2|S~combout\ & ( (\FA1|S~combout\) # (\FA3|S~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111110011111111001100110011111111111100111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA3|ALT_INV_S~combout\,
	datac => \FA0|ALT_INV_S~combout\,
	datad => \FA1|ALT_INV_S~combout\,
	datae => \FA2|ALT_INV_S~combout\,
	combout => \sum_disp|Mux0~0_combout\);

-- Location: LABCELL_X45_Y25_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


