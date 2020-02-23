`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 05:30:45 PM
// Design Name: 
// Module Name: stackTester
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


module stackTester(

    );
    
wire[7:0] top, dataIn;
reg[7:0] data;
reg push, pop, reset, clk;

stack st(dataIn,top,push,pop,reset,clk);
assign dataIn = data;

always #5 clk = ~clk;

initial begin
    #0
    {push, pop, reset, clk} = 0;
    #100
    data = 12;
    push = 1;
    #10
    push = 0;
    data = 8'bz;
    
    #100
    data = 3;
    push = 1;
    #10
    push = 0;
    data = 8'bz;
    
    #100
    pop = 1;
    #10;
    pop = 0;
    
    #100
    pop = 1;
    #10;
    pop = 0;
    
    #100
    pop = 1;
    #10;
    pop = 0;
    
    #100
    reset = 1;
    #500
    $finish;
    
end
endmodule

