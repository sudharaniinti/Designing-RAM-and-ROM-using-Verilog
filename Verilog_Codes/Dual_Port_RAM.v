`timescale 1ns / 1ps
///////////////////////////////////////
// Engineer: Sudharani Inti
// Create Date: 04/08/2023 06:17:19 PM
// Module Name: Dual_Port_RAM
// Project Name: Design of Memories
///////////////////////////////////////
`define WIDTH 8
`define DEPTH 16 //16x8 RAM(16 Bytes)
`define ADDR $clog2(`DEPTH)

module Dual_Port_RAM(
    input clk,
    input en1, //Enable Port-1
    input en2, //Enable Port-2
    input rd_en1,
    input rd_en2,
    input [(`ADDR-1):0]addr1,
    input [(`ADDR-1):0]addr2,
    input [(`WIDTH-1):0]data_in1,
    input [(`WIDTH-1):0]data_in2,
    output reg [(`WIDTH-1):0]data_out1,
    output reg [(`WIDTH-1):0]data_out2
    );
    
    reg [(`WIDTH-1):0] Memory_RAM [(`DEPTH-1):0]; 
    //------PORT-1-----//
    //Read-Operation
    always@(posedge clk) begin
        if(rd_en1 && en1)
            data_out1<=Memory_RAM[addr1];
        else ;
    end
    //Write-operation
    always@(posedge clk) begin
        if(!rd_en1 && en1)
            Memory_RAM[addr1]<=data_in1;
        else    ; 
    end
    //------PORT-2-----//
    //Read-Operation
    always@(posedge clk) begin
        if(rd_en2 && en2)
            data_out2<=Memory_RAM[addr2];
        else ;
    end
    //Write-operation
    always@(posedge clk) begin
        if(!rd_en2 && en2)
            Memory_RAM[addr2]<=data_in2;
        else    ; 
    end
endmodule