`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2020 11:42:42 PM
// Design Name: 
// Module Name: unaryCounter
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


module unaryCounter(
    output reg[15:0] num,
    input btnU,
    input btnD,
    input clk
    );
    always @(posedge clk) begin
        if(btnU) begin
            case(num)
            16'h0000: num = 16'h0001;
            16'h0001: num = 16'h0011;
            16'h0011: num = 16'h0111;
            16'h0111: num = 16'h1111;
            default: num = num;
            endcase 
        end
        if(btnD) begin
        case(num)
            16'h0001: num = 16'h0000;
            16'h0011: num = 16'h0001;
            16'h0111: num = 16'h0011;
            16'h1111: num = 16'h0111;
            default num = num;
        endcase 
        end
    end
    
endmodule
