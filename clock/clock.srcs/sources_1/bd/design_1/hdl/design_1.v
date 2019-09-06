//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sat Jun 23 15:44:16 2018
//Host        : LAPTOP-DLISDLAV running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=15,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (BI_RBO_n,
    GND,
    POWER,
    Y0_n,
    Y1_n,
    Y2_n,
    Y3_n,
    Y4_n,
    a,
    b,
    c,
    clk_in,
    d,
    e,
    f,
    g);
  inout BI_RBO_n;
  input GND;
  input POWER;
  output Y0_n;
  output Y1_n;
  output Y2_n;
  output Y3_n;
  output Y4_n;
  output a;
  output b;
  output c;
  input clk_in;
  output d;
  output e;
  output f;
  output g;

  wire BCD2SEG7_0_a;
  wire BCD2SEG7_0_b;
  wire BCD2SEG7_0_c;
  wire BCD2SEG7_0_d;
  wire BCD2SEG7_0_e;
  wire BCD2SEG7_0_f;
  wire BCD2SEG7_0_g;
  wire GND_1;
  wire LT_n_1;
  wire Net;
  wire R0_1_1;
  wire clk_div_0_clk_out;
  wire clk_div_1_clk_out;
  wire clk_in_1;
  wire decimal_counter_0_Qa;
  wire decimal_counter_0_Qb;
  wire decimal_counter_0_Qc;
  wire decimal_counter_0_Qd;
  wire decimal_counter_1_Qa;
  wire decimal_counter_1_Qb;
  wire decimal_counter_1_Qc;
  wire decimal_counter_1_Qd;
  wire decimal_counter_2_Qa;
  wire decimal_counter_2_Qb;
  wire decimal_counter_2_Qc;
  wire decimal_counter_2_Qd;
  wire decimal_counter_3_Qa;
  wire decimal_counter_3_Qb;
  wire decimal_counter_3_Qc;
  wire decimal_counter_3_Qd;
  wire decimal_counter_4_Qa;
  wire decimal_counter_4_Qb;
  wire decimal_counter_4_Qd;
  wire decode138_0_Y0_n;
  wire decode138_0_Y1_n;
  wire decode138_0_Y2_n;
  wire decode138_0_Y3_n;
  wire four_2_input_nand_gate_0_Y1;
  wire four_2_input_nand_gate_0_Y2;
  wire four_2_input_nand_gate_0_Y3;
  wire four_2_input_nand_gate_0_Y4;
  wire mux_8_to_1_0_Q;
  wire mux_8_to_1_1_Q;
  wire mux_8_to_1_2_Q;
  wire mux_8_to_1_3_Q;
  wire six_not_gate_0_Y1;
  wire six_not_gate_0_Y2;
  wire six_not_gate_0_Y3;
  wire six_not_gate_0_Y4;

  assign LT_n_1 = POWER;
  assign R0_1_1 = GND;
  assign Y0_n = decode138_0_Y0_n;
  assign Y1_n = decode138_0_Y1_n;
  assign Y2_n = decode138_0_Y2_n;
  assign Y3_n = decode138_0_Y3_n;
  assign Y4_n = decode138_0_Y2_n;
  assign a = BCD2SEG7_0_a;
  assign b = BCD2SEG7_0_b;
  assign c = BCD2SEG7_0_c;
  assign clk_in_1 = clk_in;
  assign d = BCD2SEG7_0_d;
  assign e = BCD2SEG7_0_e;
  assign f = BCD2SEG7_0_f;
  assign g = BCD2SEG7_0_g;
  design_1_BCD2SEG7_0_0 BCD2SEG7_0
       (.BCD_A(mux_8_to_1_2_Q),
        .BCD_B(mux_8_to_1_0_Q),
        .BCD_C(mux_8_to_1_1_Q),
        .BCD_D(mux_8_to_1_3_Q),
        .BI_RBO_n(BI_RBO_n),
        .LT_n(LT_n_1),
        .RBI_n(LT_n_1),
        .a(BCD2SEG7_0_a),
        .b(BCD2SEG7_0_b),
        .c(BCD2SEG7_0_c),
        .d(BCD2SEG7_0_d),
        .e(BCD2SEG7_0_e),
        .f(BCD2SEG7_0_f),
        .g(BCD2SEG7_0_g));
  GND GND_RnM
       (.G(GND_1));
  design_1_clk_div_0_0 clk_div_0
       (.clk_in(clk_in_1),
        .clk_out(clk_div_0_clk_out));
  design_1_clk_div_1_0 clk_div_1
       (.clk_in(clk_in_1),
        .clk_out(clk_div_1_clk_out));
  design_1_decimal_counter_0_0 decimal_counter_0
       (.CP1_n(clk_div_1_clk_out),
        .CP2_n(decimal_counter_0_Qa),
        .Qa(decimal_counter_0_Qa),
        .Qb(decimal_counter_0_Qb),
        .Qc(decimal_counter_0_Qc),
        .Qd(decimal_counter_0_Qd),
        .R0_1(R0_1_1),
        .R0_2(GND_1),
        .R9_1(GND_1),
        .R9_2(R0_1_1));
  design_1_decimal_counter_1_0 decimal_counter_1
       (.CP1_n(six_not_gate_0_Y3),
        .CP2_n(decimal_counter_1_Qa),
        .Qa(decimal_counter_1_Qa),
        .Qb(decimal_counter_1_Qb),
        .Qc(decimal_counter_1_Qc),
        .Qd(decimal_counter_1_Qd),
        .R0_1(six_not_gate_0_Y4),
        .R0_2(six_not_gate_0_Y4),
        .R9_1(R0_1_1),
        .R9_2(R0_1_1));
  design_1_decimal_counter_2_0 decimal_counter_2
       (.CP1_n(six_not_gate_0_Y1),
        .CP2_n(decimal_counter_2_Qa),
        .Qa(decimal_counter_2_Qa),
        .Qb(decimal_counter_2_Qb),
        .Qc(decimal_counter_2_Qc),
        .Qd(decimal_counter_2_Qd),
        .R0_1(six_not_gate_0_Y2),
        .R0_2(six_not_gate_0_Y2),
        .R9_1(R0_1_1),
        .R9_2(R0_1_1));
  design_1_decimal_counter_3_0 decimal_counter_3
       (.CP1_n(six_not_gate_0_Y2),
        .CP2_n(decimal_counter_3_Qa),
        .Qa(decimal_counter_3_Qa),
        .Qb(decimal_counter_3_Qb),
        .Qc(decimal_counter_3_Qc),
        .Qd(decimal_counter_3_Qd),
        .R0_1(R0_1_1),
        .R0_2(GND_1),
        .R9_1(GND_1),
        .R9_2(R0_1_1));
  design_1_decimal_counter_4_0 decimal_counter_4
       (.CP1_n(clk_div_0_clk_out),
        .CP2_n(decimal_counter_4_Qa),
        .Qa(decimal_counter_4_Qa),
        .Qb(decimal_counter_4_Qb),
        .Qd(decimal_counter_4_Qd),
        .R0_1(decimal_counter_4_Qd),
        .R0_2(decimal_counter_4_Qd),
        .R9_1(R0_1_1),
        .R9_2(R0_1_1));
  design_1_decode138_0_0 decode138_0
       (.A0(decimal_counter_4_Qa),
        .A1(decimal_counter_4_Qb),
        .A2(R0_1_1),
        .E1(LT_n_1),
        .E2_n(R0_1_1),
        .E3_n(R0_1_1),
        .Y0_n(decode138_0_Y0_n),
        .Y1_n(decode138_0_Y1_n),
        .Y2_n(decode138_0_Y2_n),
        .Y3_n(decode138_0_Y3_n));
  design_1_four_2_input_nand_gate_0_0 four_2_input_nand_gate_0
       (.A1(decimal_counter_0_Qa),
        .A2(decimal_counter_2_Qb),
        .A3(decimal_counter_3_Qa),
        .A4(decimal_counter_1_Qb),
        .B1(decimal_counter_0_Qd),
        .B2(decimal_counter_2_Qc),
        .B3(decimal_counter_3_Qd),
        .B4(decimal_counter_1_Qc),
        .Y1(four_2_input_nand_gate_0_Y1),
        .Y2(four_2_input_nand_gate_0_Y2),
        .Y3(four_2_input_nand_gate_0_Y3),
        .Y4(four_2_input_nand_gate_0_Y4));
  design_1_mux_8_to_1_0_0 mux_8_to_1_0
       (.A0(decimal_counter_4_Qa),
        .A1(decimal_counter_4_Qb),
        .A2(R0_1_1),
        .D0(decimal_counter_0_Qb),
        .D1(decimal_counter_2_Qb),
        .D2(decimal_counter_3_Qb),
        .D3(decimal_counter_1_Qb),
        .D4(GND_1),
        .D5(GND_1),
        .D6(GND_1),
        .D7(GND_1),
        .Q(mux_8_to_1_0_Q),
        .S_n(R0_1_1));
  design_1_mux_8_to_1_1_0 mux_8_to_1_1
       (.A0(decimal_counter_4_Qa),
        .A1(decimal_counter_4_Qb),
        .A2(R0_1_1),
        .D0(decimal_counter_0_Qc),
        .D1(decimal_counter_2_Qc),
        .D2(decimal_counter_3_Qc),
        .D3(decimal_counter_1_Qc),
        .D4(GND_1),
        .D5(GND_1),
        .D6(GND_1),
        .D7(GND_1),
        .Q(mux_8_to_1_1_Q),
        .S_n(R0_1_1));
  design_1_mux_8_to_1_2_0 mux_8_to_1_2
       (.A0(decimal_counter_4_Qa),
        .A1(decimal_counter_4_Qb),
        .A2(R0_1_1),
        .D0(decimal_counter_0_Qa),
        .D1(decimal_counter_2_Qa),
        .D2(decimal_counter_3_Qa),
        .D3(decimal_counter_1_Qa),
        .D4(GND_1),
        .D5(GND_1),
        .D6(GND_1),
        .D7(GND_1),
        .Q(mux_8_to_1_2_Q),
        .S_n(R0_1_1));
  design_1_mux_8_to_1_3_0 mux_8_to_1_3
       (.A0(decimal_counter_4_Qa),
        .A1(decimal_counter_4_Qb),
        .A2(R0_1_1),
        .D0(decimal_counter_0_Qd),
        .D1(decimal_counter_2_Qd),
        .D2(decimal_counter_3_Qd),
        .D3(decimal_counter_1_Qd),
        .D4(GND_1),
        .D5(GND_1),
        .D6(GND_1),
        .D7(GND_1),
        .Q(mux_8_to_1_3_Q),
        .S_n(R0_1_1));
  design_1_six_not_gate_0_0 six_not_gate_0
       (.A1(four_2_input_nand_gate_0_Y1),
        .A2(four_2_input_nand_gate_0_Y2),
        .A3(four_2_input_nand_gate_0_Y3),
        .A4(four_2_input_nand_gate_0_Y4),
        .A5(GND_1),
        .A6(GND_1),
        .Y1(six_not_gate_0_Y1),
        .Y2(six_not_gate_0_Y2),
        .Y3(six_not_gate_0_Y3),
        .Y4(six_not_gate_0_Y4));
endmodule
