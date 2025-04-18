module pq (
	clk,
	rst_n,
	enq_valid,
	enq_value,
	enq_ready,
	deq_req,
	deq_value,
	deq_valid
);
	parameter L = 3;
	parameter W = 32;
	input wire clk;
	input wire rst_n;
	input wire enq_valid;
	input wire [W - 1:0] enq_value;
	output wire enq_ready;
	input wire deq_req;
	output wire [W - 1:0] deq_value;
	output wire deq_valid;
	genvar _gv_l_1;
	generate
		for (_gv_l_1 = 0; _gv_l_1 < L; _gv_l_1 = _gv_l_1 + 1) begin : pq_tokens
			localparam l = _gv_l_1;
			reg [1:0] operation;
			reg [(l == 0 ? 0 : l - 1):0] position;
			reg [W - 1:0] value;
		end
	endgenerate
	genvar _gv_l_2;
	generate
		for (_gv_l_2 = 0; _gv_l_2 < L; _gv_l_2 = _gv_l_2 + 1) begin : pq_tree
			localparam l = _gv_l_2;
			localparam OW = L - l;
			reg [((1 << l) * ((1 + OW) + W)) - 1:0] nodes;
		end
	endgenerate
	genvar _gv_l_3;
	generate
		for (_gv_l_3 = 0; _gv_l_3 < L; _gv_l_3 = _gv_l_3 + 1) begin : pq_level
			localparam l = _gv_l_3;
			localparam OW = L - l;
			wire [((1 + OW) + W) - 1:0] target_node;
			if (l == 0) begin : genblk1
				assign target_node = pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W];
			end
			else begin : genblk1
				assign target_node = (pq_tokens[l - 1].operation == 2'b00 ? pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] : pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - {pq_tokens[l - 1].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W]);
			end
			wire target_node_active;
			assign target_node_active = target_node[((1 + OW) + W) - 1];
			wire [OW - 1:0] target_node_occupied;
			assign target_node_occupied = target_node[(OW + W) - 1:W];
			wire [W - 1:0] target_node_value;
			assign target_node_value = target_node[W - 1:0];
			always @(posedge clk or negedge rst_n)
				if (!rst_n) begin
					begin : sv2v_autoblock_1
						reg [((1 + (L - _gv_l_2)) + W) - 1:0] sv2v_tmp_cast;
						sv2v_tmp_cast = 1'sb0;
						pq_tree[l].nodes <= {1 << _gv_l_2 {sv2v_tmp_cast}};
					end
					pq_tokens[l].operation <= 2'b00;
				end
				else
					(* full_case, parallel_case *)
					case (pq_tokens[l].operation)
						2'b01: begin
							if (!target_node_active || (pq_tokens[l].value > target_node_value))
								pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b1, target_node_occupied + 1'b1, pq_tokens[l].value};
							else
								pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b1, target_node_occupied + 1'b1, target_node_value};
							pq_tokens[l].operation <= 2'b00;
						end
						2'b10: begin
							if (l == (L - 1))
								pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= 1'sb0;
							else
								(* full_case, parallel_case *)
								case ({pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)) + ((((1 + OW) - 1) + W) - 1)], pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b1}) * ((1 + (L - _gv_l_2)) + W)) + ((((1 + OW) - 1) + W) - 1)]})
									2'b00: pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b0, target_node_occupied - 1'b1, {W {1'b0}}};
									2'b01: pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b1, target_node_occupied - 1'b1, pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b1}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W]};
									2'b10: pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b1, target_node_occupied - 1'b1, pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W]};
									2'b11:
										if (pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W] > pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b1}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W])
											pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b1, target_node_occupied - 1'b1, pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W]};
										else
											pq_tree[l].nodes[(((1 << _gv_l_2) - 1) - pq_tokens[l].position) * ((1 + (L - _gv_l_2)) + W)+:(1 + (L - _gv_l_2)) + W] <= {1'b1, target_node_occupied - 1'b1, pq_tree[(l == (L - 1) ? l : l + 1)].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[l].position, 1'b1}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W]};
								endcase
							pq_tokens[l].operation <= 2'b00;
						end
						2'b00:
							if (l == 0) begin
								pq_tokens[l].operation <= {deq_req, enq_valid};
								pq_tokens[l].position <= 1'sb0;
								pq_tokens[l].value <= enq_value;
							end
							else
								(* full_case, parallel_case *)
								case (pq_tokens[(l == 0 ? 0 : l - 1)].operation)
									2'b01:
										if (pq_tree[(l == 0 ? 0 : l - 1)].nodes[((((1 << _gv_l_2) - 1) - pq_tokens[(l == 0 ? 0 : l - 1)].position) * ((1 + (L - _gv_l_2)) + W)) + ((((1 + OW) + 1) + W) - 1)]) begin
											pq_tokens[l].operation <= 2'b01;
											pq_tokens[l].value <= (pq_tokens[(l == 0 ? 0 : l - 1)].value > pq_tree[(l == 0 ? 0 : l - 1)].nodes[((((1 << _gv_l_2) - 1) - pq_tokens[(l == 0 ? 0 : l - 1)].position) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W] ? pq_tree[(l == 0 ? 0 : l - 1)].nodes[((((1 << _gv_l_2) - 1) - pq_tokens[(l == 0 ? 0 : l - 1)].position) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W] : pq_tokens[(l == 0 ? 0 : l - 1)].value);
											pq_tokens[l].position <= (!(&target_node_occupied) ? (l > 1 ? {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b0} : 1'b0) : (l > 1 ? {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b1} : 1'b1));
										end
									2'b10: begin
										(* full_case, parallel_case *)
										case ({pq_tree[l].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)) + (((1 + OW) + W) - 1)], pq_tree[l].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b1}) * ((1 + (L - _gv_l_2)) + W)) + (((1 + OW) + W) - 1)]})
											2'b00: begin
												pq_tokens[l].operation <= 2'b00;
												pq_tokens[l].position <= 1'sb0;
											end
											2'b01: begin
												pq_tokens[l].operation <= 2'b10;
												pq_tokens[l].position <= (l > 1 ? {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b1} : 1'b1);
											end
											2'b10: begin
												pq_tokens[l].operation <= 2'b10;
												pq_tokens[l].position <= (l > 1 ? {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b0} : 1'b0);
											end
											2'b11: begin
												pq_tokens[l].operation <= 2'b10;
												if (pq_tree[l].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b0}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W] > pq_tree[l].nodes[((((1 << _gv_l_2) - 1) - {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b1}) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W])
													pq_tokens[l].position <= (l > 1 ? {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b0} : 1'b0);
												else
													pq_tokens[l].position <= (l > 1 ? {pq_tokens[(l == 0 ? 0 : l - 1)].position, 1'b1} : 1'b1);
											end
										endcase
										pq_tokens[l].value <= 1'sb0;
									end
									2'b00:
										;
								endcase
					endcase
		end
	endgenerate
	assign deq_valid = (pq_tokens[0].operation == 2'b10) && pq_tree[0].nodes[(((1 << _gv_l_2) - 1) * ((1 + (L - _gv_l_2)) + W)) + (((1 + L) + W) - 1)];
	assign deq_value = pq_tree[0].nodes[(((1 << _gv_l_2) - 1) * ((1 + (L - _gv_l_2)) + W)) + (W - 1)-:W];
	assign enq_ready = !(&pq_tree[0].nodes[(((1 << _gv_l_2) - 1) * ((1 + (L - _gv_l_2)) + W)) + (((L + W) - 1) >= W ? (L + W) - 1 : (((L + W) - 1) + (((L + W) - 1) >= W ? (((L + W) - 1) - W) + 1 : (W - ((L + W) - 1)) + 1)) - 1)-:(((L + W) - 1) >= W ? (((L + W) - 1) - W) + 1 : (W - ((L + W) - 1)) + 1)]) && (pq_tokens[0].operation == 2'b00);
endmodule
