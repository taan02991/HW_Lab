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
    input btnC
//    output au,
//    output ad,
//    output num
    );
    
wire an0, an1, an2, an3;
wire[23:0] tclk;
wire[15:0] num;
wire[3:0] cout, bout;
wire[7:0] swD, w1, w2;
wire set0, set9;
reg[3:0] au, ad;

assign an = {an3,an2,an1,an0};
assign tclk[0] = clk;
assign set0 = btnC;
assign set9 = btnU;

//Clock Divide
genvar c;
generate for(c=0; c<23; c=c+1) begin
    clkDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate

//Synchronize and Single Pulse
generate for(c=0; c<8; c=c+1) begin
    dFlipFlop dff1(w1[c], clk, sw[c]);
    dFlipFlop dff2(w2[c], clk, w1[c]);
    singlePulser sp(swD[c], w2[c], tclk[23]);
end endgenerate

// 4-digit BCD Counter
BCDCounter xxxo(num[3:0], cout[0], bout[0], set9, set0, swD[1] & au[0], swD[0] & ad[0], tclk[23]);
BCDCounter xxox(num[7:4], cout[1], bout[1], set9, set0, (swD[3]|cout[0]) & au[1], (swD[2]|bout[0]) & ad[1], tclk[23]);
BCDCounter xoxx(num[11:8], cout[2], bout[2], set9, set0, (swD[5]|cout[1]) & au[2], (swD[4]|bout[1]) & ad[2], tclk[23]);
BCDCounter oxxx(num[15:12], cout[3], bout[3], set9, set0, (swD[7]|cout[2]) & au[3], (swD[6]|bout[2]) & ad[3], tclk[23]);


// 7-segments display

quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num[3:0],num[7:4],num[11:8],num[15:12],tclk[19]);

//Max 9999 MIN 0000

always @(posedge clk) begin    
    casex(num)
        16'h9999: au = 4'b0000;
        16'h999x: au = 4'b0001;
        16'h99xx: au = 4'b0011;
        16'h9xxx: au = 4'b0111;
        default: au = 4'b1111;
    endcase
    casex(num)
        16'h0000: ad = 4'b0000;
        16'h000x: ad = 4'b0001;
        16'h00xx: ad = 4'b0011;
        16'h0xxx: ad = 4'b0111;
        default: ad = 4'b1111;
    endcase
end

endmodule
