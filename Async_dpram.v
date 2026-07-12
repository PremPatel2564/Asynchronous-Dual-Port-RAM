module async_dpram(   // Dual clock synchronous dual port RAM.
  input clk_a,reset_a,
  input [WIDTH-1:0] addr_a,
  input [WIDTH-1:0] data_in_a,
  output [WIDTH-1:0] data_out_a,

  input clk_b,reset_b,
  output reg [WIDTH-1:0] data_out_b,
  input [WIDTH-1:0] addr_b,
  
  input rd_en,
  input wr_en
);

parameter WIDTH = 8,
          DEPTH = 256;

reg [WIDTH-1:0] mem[0:DEPTH-1];
          always @(posedge clk_a or posedge reset_a) begin
             if(wr_en)
             mem[addr_a] <= data_in_a;
          end

          assign data_out_a = mem[addr_a];
          assign data_out_b = mem[addr_b];
          endmodule