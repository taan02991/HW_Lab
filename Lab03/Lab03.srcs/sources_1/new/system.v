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
    );
    
wire targetClk, an0, an1, an2, an3;
wire[18:0] tclk;
wire[15:0] num;
wire[3:0] cout, bout;
wire[7:0] swD, w1, w2;
reg set0, set9;
assign an = {an3,an2,an1,an0};
assign tclk[0] = clk;

//Clock Divide
genvar c;
generate for(c=0; c<18; c=c+1) begin
    clkDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate

clkDiv fdivTarget(targetClk, tclk[18]);

//Synchronize and Single Pulse
generate for(c=0; c<8; c=c+1) begin
    dFlipFlop dff1(w1[c], clk, sw[c]);
    dFlipFlop dff2(w2[c], clk, w1[c]);
    singlePulser sp(swD[c], w2[c], tclk[9]);
end endgenerate

// 4-digit BCD Counter
BCDCounter xxxo(num[3:0], cout[0], bout[0], set9, set0, swD[1], swD[0], clk);
BCDCounter xxox(num[7:4], cout[1], bout[1], set9, set0, swD[3]|cout[0], swD[2]|bout[0], clk);
BCDCounter xoxx(num[11:8], cout[2], bout[2], set9, set0, swD[5]|cout[1], swD[4]|bout[1], clk);
BCDCounter oxxx(num[15:12], cout[3], bout[3], set9, set0, swD[7]|cout[2], swD[6]|bout[2], clk);


// 7-segments display

quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num[3:0],num[7:4],num[11:8],num[15:12],targetClk);

//Max 9999 MIN 0000
always @(cout[3] or bout[3] or clk) begin
    case({cout[3], bout[3]})
        2'b01: set0 = 1;
        2'b10: set9 = 1;
        default: begin
            set0 = btnC;
            set9 = btnU;
        end
    endcase
end

endmodule
