`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 10:11:47 PM
// Design Name: 
// Module Name: system3
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


module system3(
    output[6:0] seg,
    output dp,
    output[3:0] an,
    input clk,
    input[7:0] sw,
    input btnU, btnL, btnD, btnR
    );
    
wire an0, an1, an2, an3;
wire[23:0] tclk;
wire[7:0] swD, w1;
wire[11:0] data;

assign an = {an3,an2,an1,an0};
assign tclk[0] = clk;

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

//ROM
rom3 r(data, {op ,swD}, clk);

// 7-segments display
quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,data[3:0],data[7:4],data[11:8],0,tclk[19]);

reg[1:0] op;
always @(posedge clk) begin
    case({btnU, btnL, btnD, btnR})
    4'b1000: op = 0;
    4'b0100: op = 1;
    4'b0010: op = 2;
    4'b0001: op = 3;
    endcase
end

endmodule


module rom3#(
    parameter addr_width = 1024, // store x elements
    addr_bits = 10, // required bits to store x elements
    data_width = 12 // each element has x-bits
)
(
    output wire [data_width-1:0] data,
    input wire [addr_bits-1:0] addr,
    input wire clk
);

reg [data_width-1:0] rom[0:addr_width-1]; 
initial $readmemb("C:/Users/User/XilinxProjects/Lab04/Lab04.srcs/sources_1/new/out.data", rom);
assign data = rom[addr];
    
endmodule
