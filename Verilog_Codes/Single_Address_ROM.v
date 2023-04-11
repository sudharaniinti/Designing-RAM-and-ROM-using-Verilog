`timescale 1ns / 1ps
////////////////////////////////////////
// Engineer:  Sudharani Inti
// Create Date: 04/09/2023 03:29:44 PM
// Module Name: Single_Address_ROM
// Project Name: Design of Memories
////////////////////////////////////////
module Single_Address_ROM(
    input clk,
    input en,
    input [2:0] addr,
    output reg [15:0]data_out
    );
    
    wire [15:0]loc0,loc1,loc3,loc4,loc5,loc6,loc7;
    //8x16 ROM Data
    assign loc0=16'habcd;
    assign loc1=16'h23cd;
    assign loc2=16'h98cd;
    assign loc3=16'hcd21;
    assign loc4=16'h9bc7;
    assign loc5=16'h7a3d;
    assign loc6=16'h7430;
    assign loc7=16'ha525;
    //Read Operation
    always @(posedge clk) begin
        if (en)
            case(addr)
                 4'b000: data_out <= loc0;
                 4'b001: data_out <= loc1;
                 4'b010: data_out <= loc2;
                 4'b011: data_out <= loc3;
                 4'b100: data_out <= loc4;
                 4'b101: data_out <= loc5;
                 4'b110: data_out <= loc6;
                 4'b111: data_out <= loc7;
                 default: data_out <= 16'bx;
            endcase
        else 
            data_out<=16'bz;
    end
endmodule
        