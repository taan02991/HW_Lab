`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 12:09:22 AM
// Design Name: 
// Module Name: quadSevenSeg
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


module quadSevenSeg(
    output[6:0] seg,
    output dp,
    output an0,
    output an1,
    output an2,
    output an3,
    input[3:0] num0,
    input[3:0] num1,
    input[3:0] num2,
    input[3:0] num3,
    input clk
    );
    
reg[1:0] ns, ps;
reg[3:0] dispEn;

reg[3:0] hexIn;
wire[6:0] segments;
assign seg = segments;

segmentDecoder segDecode(segments, hexIn);
assign dp = 1;
assign {an3,an2,an1,an0} = ~dispEn;

initial
ps = 0;

always @(posedge clk) begin
    ps = ns;
end

always @(ps) begin
    case(ps)
        2'b00: hexIn = num0;
        2'b01: hexIn = num1;
        2'b10: hexIn = num2;
        2'b11: hexIn = num3;
    endcase
end

always @(ps) begin
    case(ps)
        2'b00: dispEn = 4'b0001;
        2'b01: dispEn = 4'b0010;
        2'b10: dispEn = 4'b0100;
        2'b11: dispEn = 4'b1000;
    endcase
end

always @(ps) begin
    ns = ps + 1;
end

endmodule
