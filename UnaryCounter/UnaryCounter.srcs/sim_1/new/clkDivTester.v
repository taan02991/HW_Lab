`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2020 09:39:52 PM
// Design Name: 
// Module Name: clkDivTester
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


module clkDivTester(

    );
wire targetClk;
reg clk;
clkDiv #(4) c (targetClk, clk);

always #10 clk = ~clk;
initial begin
    #0
    clk = 0;
end
endmodule
