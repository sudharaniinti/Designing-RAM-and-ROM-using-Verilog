`timescale 1ns / 1ps
///////////////////////////////////////
// Engineer: Sudharani Inti
// Create Date: 04/08/2023 06:17:19 PM
// Module Name: TB_Dual_Port_RAM
// Project Name: Design of Memories
///////////////////////////////////////
`define WIDTH 8
`define DEPTH 16 
`define ADDR $clog2(`DEPTH)
module TB_dual_port_RAM();
    reg clk,en1,en2;
    reg read_en1,read_en2;
    reg [(`ADDR-1):0]addr1,addr2;
    reg [(`WIDTH-1):0]data_in1,data_in2;
    wire [(`WIDTH-1):0]data_out1,data_out2;
    //Port Mapping by name
    Dual_Port_RAM DUT(
    .clk(clk),
    .en1(en1),.en2(en2),
    .rd_en1(read_en1),.rd_en2(read_en2),
    .addr1(addr1),.addr2(addr2),
    .data_in1(data_in1),.data_in2(data_in2),
    .data_out1(data_out1),.data_out2(data_out2)
    );
    //Clock Generation
    initial begin
    clk=0;
    #2 en1=1;
    #1 en2=1;
    end
    always #5 clk=~clk;
    
    initial begin
    //Writing locations (0 to 7)
    #10 read_en1=0;read_en2=0;
        data_in1=8'hab;data_in2=8'h91;
        addr1=0;addr2=1;
    #10 data_in1=8'hc2;data_in2=8'h3a;
        addr1=2;addr2=3;
    #10 data_in1=8'h74;data_in2=8'he5;
        addr1=4;addr2=5;
    #10 data_in1=8'h8f;data_in2=8'h73;
        addr1=6;addr2=7;
    //Reading locations(0-7)
    #10 read_en1=1;read_en2=1;
        data_in1=8'bz;data_in2=8'bz;
        read_en1=1;read_en2=1;
        addr1=0;addr2=1;
    #10 addr1=2;addr2=3;
    #10 addr1=4;addr2=5;
    #10 addr1=6;addr2=7;
    #20 $finish;
    end
endmodule
