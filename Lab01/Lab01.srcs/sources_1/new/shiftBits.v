`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2020 07:47:38 PM
// Design Name: 
// Module Name: shiftBits
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


module shiftBits(q, clock, d);
parameter width = 4;
output reg[width-1:0] q;
input clock, d;
always @(posedge clock) begin
    q = {q[width-2:0], d};
end
endmodule
