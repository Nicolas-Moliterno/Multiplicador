module Control (Idle, Done, Load, Sh, Ad, St, Clk, M, K);

	input M, K, Clk, St;
	output reg Idle, Done, Load, Sh, Ad;
	reg [1:0] State = 1'b0;


	// Estados da máquina
	parameter S0=0, S1=1, S2=2, S3=3;

	// Implementar a lógica para cada estado:

	always @(posedge Clk) begin

		case (State)

			S0: begin
				State <= St ? S1 : S0;
				Load <= St ? 1'b1 : 1'b0;
				Ad <= 1'b0;
			end

			S1: begin
				State <= S2;
				Ad <= M ? 1 : 0;
				if(M) begin
					Load <= 0;
				end
			end

			S2: begin
				Load <= 0;
				Ad <= 0;
				State <= K ? S3 : S1;
			end
				 
			S3: begin
				Ad <= 0;
				State <= S0;
			end
				 
			default: State <= S0;

		endcase

	end

	always @(*) begin

		case (State)
		
			S0: begin
				Sh <= 1'b0;
				Done <= 1'b0;
				Idle <= 1'b1;
			end

			S1: begin
				Sh <= 1'b0;
				Done <=1'b0;
				Idle <= 1'b0;
			end

			S2: begin
				Sh <= 1'b1;
				Idle <= 1'b0;
				Done <= 1'b0;
			end

			S3: begin
				Done <= 1'b1;
				Sh <= 1'b0;
				Idle <= 1'b0;
			end

			default: State <= S0;

		endcase

	end

endmodule
