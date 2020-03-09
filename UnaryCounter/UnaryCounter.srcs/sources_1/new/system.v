`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2020 10:21:57 PM
// Design Name: 
// Module Name: system
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


module system(
    output wire[6:0] seg,
    output wire dp,
    output wire[3:0] an,
    input wire btnU,
    input wire btnD,
    input wire clk
    );

//Clock Divide
wire[21:0] tclk;
assign tclk[0] = clk;
genvar i;
for(i=0; i<21; i=i+1) begin
    clkDiv cd(tclk[i+1], tclk[i]);
end

//UnaryCounter
wire[15:0] num;
wire[2:0] btn[3:0];
assign btn[0] = {btnU, btnD};
for(i=0; i<2; i=i+1) begin
    dFlipFlop dff1(btn[1][i], btn[0][i], tclk[21]);
    dFlipFlop dff2(btn[2][i], btn[1][i], tclk[21]);
    singlePulser sp(btn[3][i], btn[2][i], tclk[21]);
end
unaryCounter uc(num, btn[3][1], btn[3][0], tclk[21]);

//Segment
quadSevenSeg q7seg(seg, dp ,an[0], an[1], an[2], an[3], num[3:0], num[7:4], num[11:8], num[15:12], tclk[19]);

//test

endmodule
