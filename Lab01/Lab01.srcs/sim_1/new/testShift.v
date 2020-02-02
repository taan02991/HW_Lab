`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2020 11:07:07 PM
// Design Name: 
// Module Name: testShift
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


module testShift(
    );
    reg clock, d;
    wire[1:0] q1, q2;
    wire[4:0] q3;
    shiftA s1(q1, clock, d);
    shiftB s2(q2, clock, d);
    shiftBits #(5) s3(q3, clock, d);
    
    always
    #10 clock = ~clock;  
    initial
    begin
    $monitor("time %t:\ns1 -> %b %b\ns2 -> %b %b", $time,q1[1],q1[0],q2[1],q2[0]);
    #0
    clock = 0;
    d = 0;
    #50
    d = 1;
    #10
    d = 0;
    #10
    d = 1;
    #10
    d = 1;
    #10
    d = 0;
    #10
    $finish;
    end
endmodule
