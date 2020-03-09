`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 11:43:50 PM
// Design Name: 
// Module Name: singlePulser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module singlePulser(
    output out,
    input in,
    input clk
    );

//dFlipFlop dff1(q1, clk, in);
//dFlipFlop dff2(q2, clk, q1);
//assign out = (q1 & ~q2);


reg out;
reg[1:0] ps, ns;

initial begin
    ps = 0;
    ns = 0;
end

always@(*) begin
    case(ps)
        0: ns = in;
        1: ns = 2;
        2: ns = in==1?2:0; 
        default: ns = 0;
    endcase
end

always@(posedge clk) begin
    ps = ns;
end

always@(ps) begin
    case(ps)
        0: out = 0;
        1: out = 1;
        2: out = 0;
        default: out = 0;
    endcase
end

endmodule
