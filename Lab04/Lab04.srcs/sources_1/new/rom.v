`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 09:02:30 PM
// Design Name: 
// Module Name: rom
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


module rom#(
    parameter addr_width = 32, // store x elements
    addr_bits = 5, // required bits to store x elements
    data_width = 8 // each element has x-bits
)
(
    output wire [data_width-1:0] data,
    input wire [addr_bits-1:0] addr,
    input wire clk
);

reg [data_width-1:0] rom[0:addr_width-1]; 
initial $readmemb("C:/Users/User/XilinxProjects/Lab04/Lab04.srcs/sources_1/new/rom.data", rom);
assign data = rom[addr];
    
endmodule

