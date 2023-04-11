`timescale 1ns / 1ps
///////////////////////////////////////
// Engineer: Sudharani Inti
// Create Date: 04/08/2023 06:17:19 PM
// Module Name: TB_Single_Port_RAM
// Project Name: Design of Memories
///////////////////////////////////////
`define WIDTH 8
`define DEPTH 16 
`define ADDR $clog2(`DEPTH)
module TB_single_port_RAM();
    reg clk,enable,read_en;
    reg [(`WIDTH-1):0] data_in;
    reg [(`ADDR-1):0] address;
    wire [(`WIDTH-1):0] data_out;
    //Port Mapping by name
    Single_Port_RAM DUT(
    .clk(clk),
    .enable(enable),
    .read_en(read_en),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
    );
    //Clock Generation
    initial begin
    clk=0;
    #2 enable=1;
    end
    always #5 clk=~clk;
    
    initial begin
    //Write data into 3 locations(0,1,2)
    #10 read_en=0;data_in=8'hab;address=0;
    #10 data_in=8'h56;address=1;
    #10 data_in=8'h9b;address=2;
    //Read data from locations(0,1,2)
    #10 read_en=1;address=0;data_in=8'bz;
    #10 address=1;
    #10 address=2;
    #20 $finish;
    end 
endmodule
