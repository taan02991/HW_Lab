`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 06:43:03 PM
// Design Name: 
// Module Name: tester
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


module tester(
    );
wire[6:0] seg;
wire[3:0] an;
wire dp;
reg clk;
//reg[3:0] tclk;
system seven_segments(seg, dp, an, clk); 
//genvar c;
//generate for(c=0; c<3; c=c+1) begin
    
//end endgenerate


always #10 clk = ~clk;

initial
begin
    #0
    clk = 0;
    #10000
    $finish;
end

endmodule
