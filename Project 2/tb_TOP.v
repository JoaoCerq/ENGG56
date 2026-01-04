`timescale 1ns / 1ps

module tb_TOP;
    reg Clock, Reset;
    wire Ready;
    wire [4:0] Address;
    wire [15:0] DataIN;  
    wire ReadEnable, WriteEnable;
    wire [15:0] DataOut;

    TOP uut (.Clock(Clock), .Reset(Reset), .Ready(Ready), .Address(Address), .DataIN(DataIN), .ReadEnable(ReadEnable), 
	 .WriteEnable(WriteEnable), .DataOut(DataOut));
		  
    reg [15:0] MEMORIA [0:31];
    integer k;

    reg [15:0] dout_reg;
    reg        drive;          // controla quando DataOut dirige o barramento
    reg [4:0]  addr_q;
    reg        re_q;

    assign DataOut = (drive) ? dout_reg : 16'bz;

    always @(posedge Clock) begin
        // captura pedido atual
        addr_q <= Address;
        re_q   <= ReadEnable;

        // completa leitura 1 ciclo depois
        dout_reg <= MEMORIA[addr_q];

        // DataOut apenas no ciclo seguinte ao ReadEnable
        drive <= re_q;
    end

    always @(posedge Clock) begin
        if (WriteEnable) begin
            MEMORIA[Address] <= DataIN;
            $display("MEMORIA: Escreveu %d no Endereco %d", DataIN, Address);
        end
    end

    initial begin
        Clock = 0;
        forever #10 Clock = ~Clock;
    end

    initial begin

        for (k = 0; k <= 6; k = k + 1) begin
            MEMORIA[k] = 16'd1; // primeiro bloco
        end
        
        for (k = 8; k <= 14; k = k + 1) MEMORIA[k] = 16'd2; // segundo bloco
        
        for (k = 16; k <= 22; k = k + 1) MEMORIA[k] = 16'd10; // terceiro bloco
		  
        for (k = 24; k <= 31; k = k + 1) MEMORIA[k] = 16'd5; // quarto bloco

        $display("====== inicio da simulacao ======");

        // FIX 2 (mínimo): inicializa Reset definido desde t=0 (evita X)
        Reset = 0;
        #50;
        Reset = 1;
        // Se seu reset for ativo-alto e você queria "tirar do reset", inverta:
        // Reset = 1; #50; Reset = 0;

        wait(Ready == 1);
        @(posedge Clock);
        
        $display("====== verificacao dos primeiros resultados ======");
        
        if (MEMORIA[7] === 16'd7) $display("[PASS] Grupo 1 (End 7): %d (Esperado 7)", MEMORIA[7]);
        else $display("[FAIL] Grupo 1 (End 7): %d (Esperado 7)", MEMORIA[7]);

        if (MEMORIA[15] === 16'd14) $display("[PASS] Grupo 2 (End 15): %d (Esperado 14)", MEMORIA[15]);
        else $display("[FAIL] Grupo 2 (End 15): %d (Esperado 14)", MEMORIA[15]);

        if (MEMORIA[23] === 16'd70) $display("[PASS] Grupo 3 (End 23): %d (Esperado 70)", MEMORIA[23]);
        else $display("[FAIL] Grupo 3 (End 23): %d (Esperado 70)", MEMORIA[23]);
		  
        if (MEMORIA[31] === 16'd35) $display("[PASS] Grupo 4 (End 31): %d (Esperado 35)", MEMORIA[31]);
        else $display("[FAIL] Grupo 4 (End 31): %d (Esperado 35)", MEMORIA[31]);

        $display("====== fim dos primeiros resultados ======");
		  
        for (k = 0; k <= 6; k = k + 1) begin
            MEMORIA[k] = k; // primeiro bloco
        end
        
        for (k = 8; k <= 14; k = k + 1) MEMORIA[k] = k; // segundo bloco
     
        for (k = 16; k <= 22; k = k + 1) MEMORIA[k] = k; // terceiro bloco
		  
        for (k = 24; k <= 31; k = k + 1) MEMORIA[k] = k; // quarto bloco
		  
        // FIX 3 (mínimo): evita pegar o mesmo Ready se ele ainda estiver alto
        wait(Ready == 0);
        wait(Ready == 1);
        
        @(posedge Clock);
		  
        $display("====== verificacao dos segundos resultados(continuidade do ciclo, como demandado) ======");
		  
        if (MEMORIA[7] === 16'd21) $display("[PASS] Grupo 1 (End 7): %d (Esperado 21)", MEMORIA[7]);
        else $display("[FAIL] Grupo 1 (End 7): %d (Esperado 21)", MEMORIA[7]);

        if (MEMORIA[15] === 16'd77) $display("[PASS] Grupo 2 (End 15): %d (Esperado 77)", MEMORIA[15]);
        else $display("[FAIL] Grupo 2 (End 15): %d (Esperado 77)", MEMORIA[15]);

        if (MEMORIA[23] === 16'd133) $display("[PASS] Grupo 3 (End 23): %d (Esperado 133)", MEMORIA[23]);
        else $display("[FAIL] Grupo 3 (End 23): %d (Esperado 133)", MEMORIA[23]);

        if (MEMORIA[31] === 16'd189) $display("[PASS] Grupo 4 (End 31): %d (Esperado 189)", MEMORIA[31]);
        else $display("[FAIL] Grupo 4 (End 31): %d (Esperado 189)", MEMORIA[31]);
		  
        $display("====== fim dos segundos resultados ======");
		  
        $stop;
    end

endmodule
