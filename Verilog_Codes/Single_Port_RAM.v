`timescale 1ns / 1ps
///////////////////////////////////////
// Engineer: Sudharani Inti
// Create Date: 04/08/2023 06:17:19 PM
// Module Name: Single_Port_RAM
// Project Name: Design of Memories
///////////////////////////////////////
`define WIDTH 8
`define DEPTH 16 //16x8 RAM(16 Bytes)
`define ADDR $clog2(`DEPTH)
module Single_Port_RAM(
    input clk,
    input enable,
    input read_en, //read_en=1 means read, 0 means write
    input [(`ADDR-1):0] address,
    input [(`WIDTH-1):0] data_in,
    output reg [(`WIDTH-1):0] data_out
    );
    
    reg [(`WIDTH-1):0] Memory_RAM [(`DEPTH-1):0];//8x16(16 Bytes)
    wire write_en;
    assign write_en=~read_en;
    
    //Read-Operation
    always@(posedge clk) begin
        if(read_en && enable)
            data_out<=Memory_RAM[address];
        else ;
    end
    //Write-operation
    always@(posedge clk) begin
        if(write_en && enable)
            Memory_RAM[address]<=data_in;
        else    ; //Do Nothing
    end        
endmodule
