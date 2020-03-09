`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2020 09:18:48 PM
// Design Name: 
// Module Name: binaryCounter
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


module binaryCounter(
    output reg[15:0] num,
    input up,
    input down,
    input reset,
    input clk
    );

always @(posedge clk) begin
    if(reset) num = 0;
    else if(up && num != 16'h1111) {num[12], num[8], num[4], num[0]} = {num[12], num[8], num[4], num[0]} + 1;
    else if(down && num != 16'h0000) {num[12], num[8], num[4], num[0]} = {num[12], num[8], num[4], num[0]} - 1;
end

endmodule
