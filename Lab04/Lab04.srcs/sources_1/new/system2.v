`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 09:34:22 PM
// Design Name: 
// Module Name: system2
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


module system2(
    output[6:0] seg,
    output dp,
    output[3:0] an,
    input clk,
    input[4:0] sw
    );
    
wire an0, an1, an2, an3;
wire[23:0] tclk;
wire[15:0] num;
wire[4:0] swD, w1;
wire[7:0] data;

assign an = {an3,an2,an1,an0};
assign tclk[0] = clk;

//Clock Divide
genvar c;
generate for(c=0; c<23; c=c+1) begin
    clkDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate

//Synchronize and Single Pulse
generate for(c=0; c<5; c=c+1) begin
    dFlipFlop dff1(w1[c], clk, sw[c]);
    dFlipFlop dff2(swD[c], clk, w1[c]);
end endgenerate

//ROM
rom r(data, swD, clk);

// 7-segments display
quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,data[3:0],data[7:4],0,0,tclk[19]);

endmodule
