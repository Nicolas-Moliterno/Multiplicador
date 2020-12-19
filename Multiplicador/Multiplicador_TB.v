`timescale 1ns/10ps

module Multiplicador_TB;
	
	reg St, Clk ;
	reg [3:0] Multiplicando, Multiplicador;
	
	wire Idle, Done;
	wire [7:0] Produto;
	
	integer i;
	
	Multiplicador DUT (
		.Produto(Produto), 
		.Done(Done), 
		.Idle(Idle), 
		.Multiplicando(Multiplicando),
		.Multiplicador(Multiplicador),
		.St(St),
		.Clk(Clk)
	);

	initial begin

		// PRIMEIRO CICLO:

		// inicialiazação
		Clk = 0;
		St = 0;

		#10 Clk = 1;
		#10 Clk = 0;

		Multiplicando = 4'b1001; // decimal 11
		Multiplicador = 4'b0000; // decimal 0
		
		#10 St = 1;

		// O número de ciclos mínimo deve ser 2n+2 = 2*4+2 = 10 (pode variar de acordo com a rampa de subida do clock)
		// Um número de ciclos maior não deve influenciar no resultado
		for(i=0; i<=9; i=i+1) begin

			#10 Clk = 1;
			#10 Clk = 0;

			if(i == 2) begin
				St = 0;
			end

			if(i == 9) begin
				$display(Multiplicando, " X ", Multiplicador,  " = " , Produto); // imprimir a expressão
			end

		end

		$display("------------------------------------------------------------------------------------- ");

		// SEGUNDO CICLO:

		// inicialização
		Clk = 0;
		St = 0;

		#10 Clk = 1;
		#10 Clk = 0;

		Multiplicando = 4'b0010; // decimal 2
		Multiplicador = 4'b0011; // decimal 3

		#10 St = 1;

		// O número de ciclos mínimo deve ser 2n+2 = 2*4+2 = 10 (pode variar de acordo com a rampa de subida do clock)
		// Um número de ciclos maior não deve influenciar no resultado
		for(i=0; i<=12; i=i+1) begin

			#10 Clk = 1;
			#10 Clk = 0;

			if(i == 2) begin
				St = 0;
			end

			if(i == 12) begin
				$display(Multiplicando, " X ", Multiplicador,  " = " , Produto); // imprimir a expressão
			end

		end

		$display("------------------------------------------------------------------------------------- ");

		// TERCEIRO CICLO:

		// inicialização
		Clk = 0;
		St = 0;

		#10 Clk = 1;
		#10 Clk = 0;

		Multiplicando = 4'b1011;   // decimal 11
		Multiplicador = 4'b0110;   // decimal 6

		#10 St = 1;

		// O número de ciclos mínimo deve ser 2n+2 = 2*4+2 = 10 (pode variar de acordo com a rampa de subida do clock)
		// Um número de ciclos maior não deve influenciar no resultado
		for(i=0; i<=15; i =i+1) begin

			#10 Clk = 1;
			#10 Clk = 0;

			if(i == 2) begin
				St = 0;
			end

			if(i == 15) begin
				$display(Multiplicando, " X ", Multiplicador,  " = " , Produto); // imprimir a expressão
			end

		end
		
		$display("------------------------------------------------------------------------------------- ");
		
		// QUARTO CICLO:

		// inicialização
		Clk = 0;
		St = 0;

		#10 Clk = 1;
		#10 Clk = 0;

		Multiplicando = 4'b1111;   // decimal 15
		Multiplicador = 4'b1111;   // decimal 15

		#10 St = 1;

		// O número de ciclos mínimo deve ser 2n+2 = 2*4+2 = 10 (pode variar de acordo com a rampa de subida do clock)
		// Um número de ciclos maior não deve influenciar no resultado
		for(i=0; i<=13; i =i+1) begin

			#10 Clk = 1;
			#10 Clk = 0;

			if(i == 2) begin
				St = 0;
			end

			if(i == 13) begin
				$display(Multiplicando, " X ", Multiplicador,  " = " , Produto); // imprimir a expressão
			end

		end

	end

endmodule
