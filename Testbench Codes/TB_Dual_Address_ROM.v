`timescale 1ns / 1ps
////////////////////////////////////////
// Engineer: Sudharani Inti
// Create Date: 04/09/2023 03:29:44 PM 
// Module Name: TB_Dual_Address_ROM
// Project Name: Design of Memories
///////////////////////////////////////
module TB_Dual_Address_ROM();
    reg clk,en1,en2;
    reg [2:0] addr1,addr2;
    wire [15:0] dout1,dout2;
    //Port Mapping by name
    Dual_Address_ROM DUT(
    .clk(clk),
    .en1(en1),
    .en2(en2),
    .addr1(addr1),
    .addr2(addr2),
    .dout1(dout1),
    .dout2(dout2)
    );
    integer i,j;
    //Clock Generation
    initial begin
    clk=0;
    #3 en1=1;en2=1;
    end
    always #5 clk=~clk;
    //Reading EVEN locations
    initial begin
    #10;
        for(i=0;i<=6;i=i+2)begin
            addr1=i;
            #10;
        end
    end
    //Reading ODD locations
    initial begin
    #10;
        for(j=1;j<=7;j=j+2)begin 
            addr2=j;
            #10;
        end
    end
    initial #55 $stop;
endmodule