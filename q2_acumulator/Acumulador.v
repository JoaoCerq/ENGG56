module Acumulador #(parameter TAMANHO = 16)(Clock, Load, Clear, Transfer, M, Saidas);
	input Clock, Load, Clear, Transfer;
	input [TAMANHO-1:0] M;
	output wire [TAMANHO-1:0] Saidas;
	
	reg [TAMANHO-1:0] ff_B;
	wire [TAMANHO-1:0] fa_S;
	reg [TAMANHO-1:0] ff_A;

	always @(posedge Clock) begin // circuito sequencial para armazenar o dado proveniente da memoria
		if(Load) ff_B <= M;
	end
	
	
	assign fa_S = ff_B + ff_A; //Circuito combinacional para fazer a soma
	
	
	always @(posedge Clock or negedge Clear) begin // Circuito sequencial para gravar o resultado
		if (!Clear) begin
			ff_A <= 0;
		end
		else if(Transfer) begin
			ff_A <= fa_S;
		end
	end
	
	
	assign Saidas = ff_A;

endmodule