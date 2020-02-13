`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2020 06:29:45 PM
// Design Name: 
// Module Name: testBCDCounter
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


module testBCDCounter(

    );

//wire[3:0] num;
//wire cout;
//wire bout;
//reg down;
//reg up;
//reg set9, set0, clk;

//BCDCounter a(num[3:0], cout, bout, set9, set0, up, down, clk);


//always#5 clk = ~clk;
//initial begin
//    #0
//    up = 0;
//    down = 0;
//    set9 = 0;
//    set0 = 0;
//    clk = 0;
//    #50
//    up = 1;
//    #250;
//    up = 0;
//    down = 1;
//    #250
//    down = 0;
//    set9 = 1;
//    #100;
//    set9 = 0;
//    set0 = 1;
//    #100;
//    $finish;
//end


wire[15:0] num;
wire[3:0] cout, bout;
reg[3:0] down, up;
reg set9, set0, clk;

BCDCounter a(num[3:0], cout[0], bout[0], set9, set0, up[0], down[0], clk);
BCDCounter b(num[7:4], cout[1], bout[1], set9, set0, up[1]|cout[0], down[1]|bout[0], clk);
BCDCounter c(num[11:8], cout[2], bout[2], set9, set0, up[2]|cout[1], down[2]|bout[1], clk);
BCDCounter d(num[15:12], cout[3], bout[3], set9, set0, up[3]|cout[2], down[3]|bout[2], clk);


always#5 clk = ~clk;
initial begin
    #0
    up = 0;
    down = 0;
    set9 = 0;
    set0 = 0;
    clk = 0;
    #50
    up = 1;
    #250;
    up = 0;
    down = 1;
    #250
    down = 0;
    set9 = 1;
    #100;
    set9 = 0;
    set0 = 1;
    #100;
    $finish;
end
endmodule
