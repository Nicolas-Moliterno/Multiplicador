module Counter (Load, Clk, K);

	input Load, Clk;
	output reg K;
	reg [3:0] cont;

	always @(posedge Clk) begin

		if (Load) begin
			cont = 1'b0;
			K = 1'b0;
		end

		else begin

			if (cont == 6) begin
				K = 1'b1;
			end
			else begin 
				K = 1'b0;
				cont = cont + 1;
			end

		end

	end

endmodule
