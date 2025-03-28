module PE (
	clock,
	io_inR,
	io_inD,
	io_outL,
	io_outU,
	io_dir,
	io_en
);
	input clock;
	input [7:0] io_inR;
	input [7:0] io_inD;
	output wire [7:0] io_outL;
	output wire [7:0] io_outU;
	input io_dir;
	input io_en;
	reg [7:0] reg_0;
	always @(posedge clock)
		if (io_en)
			reg_0 <= (io_dir ? io_inD : io_inR);
	assign io_outL = reg_0;
	assign io_outU = reg_0;
endmodule