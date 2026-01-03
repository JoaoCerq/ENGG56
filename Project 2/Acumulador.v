module Acumulador #(parameter TAMANHO = 16)(Load, Clear, Transfer, M, Saidas);
	input Load, Clear, Transfer;
	input [TAMANHO-1:0] M;
	output wire [TAMANHO-1:0] Saidas;
	
	reg [TAMANHO-1:0] ff_B;
	wire [TAMANHO-1:0] fa_S;
	reg [TAMANHO-1:0] ff_A;

	always @(posedge Load) begin // circuito sequencial para armazenar o dado proveniente da memoria
		ff_B <= M;
	end
	
	
	assign fa_S = ff_B + ff_A; //Circuito combinacional para fazer a soma
	
	
	always @(posedge Transfer or negedge Clear) begin // Circuito sequencial para gravar o resultado
		if (!Clear) begin
			ff_A <= 0;
		end
		else begin
			ff_A <= fa_S;
		end
	end
	
	
	assign Saidas = ff_A;

endmodule