module flip_flop(q, data, clock, reset);
	input data;
	input clock;
	input reset;
	output q;
	reg q;
	always @(posedge clock ,negedge reset) begin
		if(!reset)
			q <= 1'b0;
		else
			q <= data;
	end
endmodule

module t_race(clock, data, reset, d_out);
	input clock;
	input data;
	input reset;
	output d_out;
	wire clk_2;
	wire q_d;

	flip_flop u_clk_div(clk_2, ~clk_2, clock, reset);
	flip_flop u_ff1(q_d, data, clock, reset);
	flip_flop u_ff2(d_out, q_d, clk_2, reset);

	initial begin
		$dumpfile("test_top.vcd");
		$dumpvars();
	end
endmodule
