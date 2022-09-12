// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
   // wire clk;
    // wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;



    wire in,d0,d1;
    wire clk;
    wire q0,q1;
    wire [6:0]in1;
    wire [25:0]in2;

    //assign clk = wb_clk_i;
    assign io_oeb=0;
    assign {in2,d1,d0,in,clk,in1} = io_in[`MPRJ_IO_PADS-2:0];  
    assign io_out[14] = q0;
    assign io_out[15] = q1;
   
    
    iiitb_icg u1(.in(in), .clk(clk), .d0(d0), .q0(q0), .d1(d1), .q1(q1)); 
    
    
endmodule

module iiitb_icg (in,clk,d0,d1,q0,q1);
input in,d0,d1;
input clk;
output q0,q1;

reg q0=0;
reg q1=0;
//reg q_l=0;

wire cgclk;
wire n1,n2,n3,n4,n5,clk_n,q_l;
wire en;

dff dff1 (clk,in,n1);

assign n2 = ~n1;

assign n3 = ~n2;

assign n4 = ~(n1 & n3);

assign n5 = (n3 & n2);

assign en = n4 | n5;

assign clk_n = ~ clk;

dff dff2 (clk_n,en,q_l);

assign cgclk = clk & q_l;

always@(posedge cgclk)
begin
q0 <= d0;
q1 <=d1;
end

endmodule



module dff(clock,d,q);
input clock, d;
output q;
reg q=0;
always @(posedge clock)
begin
q<=d;
end
endmodule
`default_nettype wire
