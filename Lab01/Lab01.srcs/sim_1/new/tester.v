`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2020 01:55:58 PM
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
    reg a,b,cin;
    wire cout,s, cout2, s2;
    fullAdder a1(cout,s,a,b,cin);
    fullAdder2 a2(cout2,s2,a,b,cin);
    initial
    begin
        //$dumpfile("time.dump");
        //$dumpvars(2,a1);
        $monitor("time %t: {%b %b} <- {%d %d %d}", $time,cout,s,a,b,cin);
        #0;
        a=0;
        b=0;
        cin=0;
        #5
        a=0;
        b=0;
        cin=1;
        #5
        a=0;
        b=1;
        cin=0;
        #5
        a=0;
        b=1;
        cin=1;
        #5
        a=1;
        b=0;
        cin=0;
        #5
        a=1;
        b=0;
        cin=1;
        #5
        a=1;
        b=1;
        cin=0;
        #5
        a=1;
        b=1;
        cin=1;
        #5
    $finish;
    end
endmodule
