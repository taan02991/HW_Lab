`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2020 09:15:00 PM
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
    output[6:0] seg,
    output[3:0] an,
    output dp,
    input btnU,
    input btnD,
    input btnC,
    input clk
    );

//Clock Divide
wire tclk[22:0];
assign tclk[0] = clk;
genvar i;
for(i = 0; i < 22; i = i + 1) begin
    clkDiv(tclk[i+1], tclk[i]);
end

// Button
wire[2:0] btn[3:0];
assign btn[0] = {btnU, btnD, btnC};
for(i = 0; i < 3; i = i + 1) begin
    dFlipFlop df1(btn[1][i], btn[0][i], clk);
    dFlipFlop df2(btn[2][i], btn[1][i], clk);
    singlePulser sp(btn[3][i], btn[2][i], tclk[21]);
end

// Binary Counter
wire[15:0] num;
binaryCounter bc(num, btn[3][2], btn[3][1], btn[3][0], tclk[21]);

// Seven segments
quadSevenSeg q7seg(seg, dp, an[0], an[1], an[2], an[3], num[3:0], num[7:4], num[11:8], num[15:12], tclk[19]);
    

endmodule
