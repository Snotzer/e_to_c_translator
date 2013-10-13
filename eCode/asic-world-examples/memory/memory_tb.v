`include "memory.v"
module memory_tb();

reg [7:0] address, data_in;
wire [7:0] data_out;
reg  read_write, chip_en;
reg clk;

initial begin
  $dumpfile("memory.vcd");
  $dumpvars();
  clk = 0;
  read_write = 0;
  chip_en = 0;
end	

always #5 clk = ~clk;

memory U_memory(
.address             (address),
.data_in             (data_in),
.data_out            (data_out),
.read_write          (read_write),
.chip_en             (chip_en)
);
endmodule
