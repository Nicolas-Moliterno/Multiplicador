module Multiplicador(Produto,Done, Idle, Multiplicando, Multiplicador, St, Clk);

	// Inputs
	input [3:0] Multiplicando;
	input [3:0] Multiplicador;
	input St, Clk;

	// Outputs
	output [7:0] Produto;
	output Idle, Done;

	// Conexões
	wire K, Load, Sh, Ad, M;	
	wire [4:0] OperandoB;
	wire [4:0] Soma;
	wire [8:0] OutputACC;
	wire [8:0] InputACC;

	assign InputACC = {Soma, Multiplicador};
	assign Produto = OutputACC[7:0];
	assign M = OutputACC[0];
	assign OperandoB = OutputACC[7:4];
	 
	Counter counter (Load,Clk,K);
	Control control (Idle,Done,Load,Sh,Ad,St,Clk,M,K);
	Adder adder (Soma,Multiplicando,OperandoB);
	ACC acc (OutputACC,InputACC,Load,Sh,Ad,Clk);

endmodule
