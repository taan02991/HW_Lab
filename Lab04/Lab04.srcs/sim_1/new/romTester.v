`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 09:15:21 PM
// Design Name: 
// Module Name: romTester
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


module romTester(

    );
    
wire[7:0] data;
reg[4:0] addr;
reg clk;

rom r(data, addr, clk);

always#10 clk = ~clk;

initial begin
    #0
    {addr, clk} = 0;
    #50
    addr = 4;
    #50
    addr = 31;
    #50
    addr = 0;
    #500
    $finish;
end
endmodule
