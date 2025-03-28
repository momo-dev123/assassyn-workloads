
module top (
  input logic clk,
  input logic rst_n,
  input logic [7:0] delta,
  output logic delta_ready,
  input logic pop_ready,
  output logic pop_valid
);

trigger_counter #(
  .WIDTH(8)
) tci (
  .clk(clk),
  .rst_n(rst_n),
  .delta(delta),
  .delta_ready(delta_ready),
  .pop_ready(pop_ready),
  .pop_valid(pop_valid)
);

endmodule
