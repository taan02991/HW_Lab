`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2020 07:42:57 PM
// Design Name: 
// Module Name: testSystem
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


module testSystem(

    );

wire[6:0] seg;
wire dp;
wire[3:0] an;
reg clk, btnU, btnC;
reg[7:0] sw;
//debug

system s(seg, dp, an, clk, sw, btnU, btnC);
always#5 clk = ~clk;
always#20 sw = sw ^ 8'b100000000;
initial begin
    #0
    sw = 0;
    clk = 0;
    btnU = 1;
    btnC = 0;
    #100
    btnU = 0;
    #1000000000
    $finish;
end
endmodule
