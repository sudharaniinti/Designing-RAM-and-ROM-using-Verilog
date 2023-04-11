`timescale 1ns / 1ps
////////////////////////////////////////
// Engineer:  Sudharani Inti
// Create Date: 04/09/2023 03:29:44 PM
// Module Name: TB_Single_Address_ROM
// Project Name: Design of Memories
///////////////////////////////////////
module TB_Single_Address_ROM();
    reg clk,en;
    reg [3:0]addr;
    wire [15:0]data_out;
    Single_Address_ROM DUT(
    .clk(clk),
    .en(en),
    .addr(addr),
    .data_out(data_out));
    integer i;
    //Clock Generation
    initial begin
    clk=0;
    #3 en=1;
    end
    always #5 clk=~clk;
    //Reading ALL locations
    initial begin
        for(i=0;i<8;i=i+1)begin
            #10;
            addr=i;
        end
        #15 $finish;
    end
endmodule