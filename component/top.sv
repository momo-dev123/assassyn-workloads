
module top (
    input  logic               clk,
    input  logic               rst_n,

    input  logic               push_valid,
    input  logic [18:0] push_data,
    output logic               push_ready,

    output logic               pop_valid,
    output logic [18:0] pop_data,
    input  logic               pop_ready
);

fifo #(19, 0) fi (
    .clk(clk),
    .rst_n(rst_n),

    .push_valid(push_valid),
    .push_data(push_data),
    .push_ready(push_ready),

    .pop_valid(pop_valid),
    .pop_data(pop_data),
    .pop_ready(pop_ready)
);

endmodule
