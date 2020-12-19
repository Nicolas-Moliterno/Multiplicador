module ACC (Saidas, Entradas, Load, Sh, Ad, Clk);
	
	input Load, Sh, Ad, Clk;
	input [8:0] Entradas;
	output reg [8:0] Saidas;

	always @(posedge Clk) begin		
	
		if (Ad) Saidas = {Entradas[8:4], Saidas[3:0]};
		if (Sh) Saidas = {1'b0, Saidas[8:1]};
		if (Load) Saidas = {{5{1'b0}}, Entradas[3:0]};             
	
	end
		   
endmodule
