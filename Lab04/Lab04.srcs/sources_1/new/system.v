`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 06:27:06 PM
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
    output dp,
    output[3:0] an,
    input clk,
    input[7:0] sw,
    input btnU,
    input btnC,
    input btnD
    );
    
wire an0, an1, an2, an3;
wire[23:0] tclk;
wire[15:0] num;
wire[7:0] swD, w1;
wire[2:0] btn, btnDebounce, w2, w3;
wire[7:0] data, top;

assign an = {an3,an2,an1,an0};
assign tclk[0] = clk;
assign btn = {btnU, btnC, btnD};
assign data = btnDebounce[0]==1?sw:8'bz;

//Clock Divide
genvar c;
generate for(c=0; c<23; c=c+1) begin
    clkDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate

//Synchronize and Single Pulse
generate for(c=0; c<8; c=c+1) begin
    dFlipFlop dff1(w1[c], clk, sw[c]);
    dFlipFlop dff2(swD[c], clk, w1[c]);
end endgenerate

generate for(c=0; c<3; c=c+1) begin
    dFlipFlop dff1(w2[c], clk, btn[c]);
    dFlipFlop dff2(w3[c], clk, w2[c]);
    singlePulser sp(btnDebounce[c], w3[c], tclk[23]);
end endgenerate

//stack component
stack st(data, top, btnDebounce[0], btnDebounce[1], btnDebounce[2], tclk[23]);


// 7-segments display

quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,top[3:0],top[7:4],data[3:0],data[7:4],tclk[19]);

endmodule
