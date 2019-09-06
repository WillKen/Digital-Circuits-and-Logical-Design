//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sat Jun 23 15:44:16 2018
//Host        : LAPTOP-DLISDLAV running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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

  wire BI_RBO_n;
  wire GND;
  wire POWER;
  wire Y0_n;
  wire Y1_n;
  wire Y2_n;
  wire Y3_n;
  wire Y4_n;
  wire a;
  wire b;
  wire c;
  wire clk_in;
  wire d;
  wire e;
  wire f;
  wire g;

  design_1 design_1_i
       (.BI_RBO_n(BI_RBO_n),
        .GND(GND),
        .POWER(POWER),
        .Y0_n(Y0_n),
        .Y1_n(Y1_n),
        .Y2_n(Y2_n),
        .Y3_n(Y3_n),
        .Y4_n(Y4_n),
        .a(a),
        .b(b),
        .c(c),
        .clk_in(clk_in),
        .d(d),
        .e(e),
        .f(f),
        .g(g));
endmodule
