`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 11:51:30 PM
// Design Name: 
// Module Name: testSinglePulser
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


module testSinglePulser(

    );
    
reg in, clk;
wire out;
singlePulser s(out, in, clk);

always#5 clk = ~clk;

initial begin
    #0
    in = 0;
    clk = 0;
    #45;
    in = 1;
    #10;
    in = 0;
    #25
    in = 1;
    #25
    in = 0;
    #1
    in = 1;
    #50
    $finish;
end

endmodule
