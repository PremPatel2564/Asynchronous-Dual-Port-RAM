`timescale 1ps/1ps
module async_dpram_tb;
parameter WIDTH = 8,
          DEPTH = 256;
reg clk_a,reset_a;
reg rd_en,wr_en;
reg [WIDTH-1:0] addr_a;
reg [WIDTH-1:0] data_in_a;
wire [WIDTH-1:0] data_out_a;

reg clk_b,reset_b;
reg [WIDTH-1:0] addr_b;
wire [WIDTH-1:0] data_out_b;

async_dpram uut(
    .clk_a(clk_a),
    .reset_a(reset_a),
    .data_out_a(data_out_a),
    .data_in_a(data_in_a),
    .addr_a(addr_a),
    .rd_en(rd_en),
    .wr_en(wr_en),
    
    .clk_b(clk_b),
    .reset_b(reset_b),
    .data_out_b(data_out_b),
    .addr_b(addr_b)
);

always #5 clk_a = ~clk_a;
always #7 clk_b = ~clk_b;
// always @(posedge clk_a) begin
//     $display("time=%0t wr_en=%b rd_en=%b addr_a=%d mem=%h",
//               $time, wr_en, rd_en, addr_a, uut.mem[addr_a]); //temporarly checking
//end
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,async_dpram_tb);
    $monitor("time=%0t |wr_en=%b | rd_en=%b | addr_a=%d | data_in_a=%02h | data_out_a=%02h | addr_b=%d | data_out_b=%02h"
                 ,$time,wr_en,rd_en,addr_a,data_in_a,data_out_a,addr_b,data_out_b);
    clk_a = 0;
    clk_b = 0;
    reset_a =1;
    reset_b =1;
    addr_a = 0;
    addr_b = 0;
    wr_en = 0;
    rd_en = 0;


    #15 reset_a = 0; reset_b = 0;
     
     wr_en = 1;
     rd_en =0;
     addr_a = 8'd50;
     data_in_a = 8'hAF; 
     //@(posedge clk_a) #1;
     #10;
     wr_en = 0;
     rd_en = 1;
     addr_a = 8'd50;
     addr_b = 8'd50; //clock edge pr nai aave atle t=25 a dout_b=00 j aavse
     //@(posedge clk_a) #1;
     #10;
     wr_en = 1;
     rd_en = 1;
     addr_a = 8'd100;
     data_in_a = 8'hBD; 
     //@(posedge clk_a) #1;
     #10;
     rd_en = 1;
     wr_en = 0;
     addr_b = 8'd100;// address change but wait for posedge clk_b. no update at t=45
     //@(posedge clk_b) #1;
      #10;
     wr_en = 1;
     rd_en = 0;
     addr_a = 8'd150;
     data_in_a = 8'hCE; 
     //@(posedge clk_a) #1;
     #10;
      rd_en = 1;
      wr_en = 0;
     addr_b = 8'd150;
     //@(posedge clk_b) #1;

     #20 $finish;
end
endmodule