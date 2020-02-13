`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2020 06:21:46 PM
// Design Name: 
// Module Name: BCDCounter
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


module BCDCounter(
    output[3:0] num,
    output cout,
    output bout,
    input set9,
    input set0,
    input up,
    input down,
    input clk
    );

reg[3:0] num;
reg cout, bout;

initial begin
    num = 0;
    cout = 0;
    bout = 0;
end

always @(posedge clk) begin
    cout = 0;
    bout = 0;
    casex({up, down, set9, set0})
    4'b1000: begin
       cout = (num==9);
       num = (num + 1) % 10;
    end
    4'b0100: begin
        bout = (num==0);
        num = (num - 1 + 10) % 10;
    end
    4'bxx10: num = 9;
    4'bxx01: num = 0;
    endcase
end  
endmodule
