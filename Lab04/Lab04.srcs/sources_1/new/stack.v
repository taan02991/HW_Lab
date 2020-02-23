`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 05:29:17 PM
// Design Name: 
// Module Name: stack
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


module stack(
    inout[7:0] data,
    output[7:0] top,
    input push,
    input pop,
    input reset,
    input clk
    );

reg[7:0] mem[255:0];
reg[7:0] top;

initial begin
    top = 0;
end

assign data = push?8'bz:mem[top-1];

always @(posedge clk) begin
    casex({push, pop, reset})
        3'b001: top = 0;
        3'b100: begin
            if(top < 255) begin
                top = top + 1;
                mem[top - 1] = data;
            end
        end
        3'b010: begin
            if(top > 0) begin
                top = top - 1;
            end
        end
    endcase
end

endmodule

