`timescale 1ns / 1ps
////////////////////////////////////////
// Engineer: Sudharani Inti
// Create Date: 04/09/2023 03:29:44 PM 
// Module Name: Dual_Address_ROM
// Project Name: Design of Memories
///////////////////////////////////////
module Dual_Address_ROM ( 
    input clk, 
    input en1,en2,
    input [2:0] addr1, 
    input [2:0] addr2, 
    output reg [15:0] dout1,
    output reg [15:0] dout2
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
    //Port-1 Read Operation
    always@(posedge clk) begin 
        if(en1) 
            case(addr1)
                4'b000: dout1 <= loc0;
                4'b001: dout1 <= loc1;
                4'b010: dout1 <= loc2;
                4'b011: dout1 <= loc3;
                4'b100: dout1 <= loc4;
                4'b101: dout1 <= loc5;
                4'b110: dout1 <= loc6;
                4'b111: dout1 <= loc7;
                default: dout1 <= 16'bx;
            endcase
        else
            dout1<=16'bz;
    end
    //Port-2 Read Operation
    always @ (posedge clk) begin
        if(en2) 
           case(addr2)
                4'b000: dout2 <= loc0;
                4'b001: dout2 <= loc1;
                4'b010: dout2 <= loc2;
                4'b011: dout2 <= loc3;
                4'b100: dout2 <= loc4;
                4'b101: dout2 <= loc5;
                4'b110: dout2 <= loc6;
                4'b111: dout2 <= loc7;
                default: dout2 <= 16'bx;
           endcase
        else
           dout2<=16'bz;
    end 
endmodule 