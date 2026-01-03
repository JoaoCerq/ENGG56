`timescale 1ns / 1ps

module RemoteController_tb;

    // Sinais de teste
    reg clk;
    reg reset;
    reg serial;
    wire [7:0] tecla;
    wire ready;

    // Instanciacao do modulo (Device Under Verification)
    RemoteController duv (
        .Clock(clk),
        .Reset(reset),
        .Serial(serial),
        .Tecla(tecla),
        .Ready(ready)
    );

    // Geracao do clock de 100MHz (Periodo de 10ns)
    always #5 clk = ~clk;

    // Task para enviar um frame completo
    // Lead(0) -> Custom(16 bits) -> Key(8 bits) -> InvKey(8 bits) -> End(1)
    task send_frame(input [15:0] custom, input [7:0] key, input wrong_inv_key);
        integer i;
        begin
            @(negedge clk);
            $display("--- Iniciando envio da Tecla: 0x%h ---", key);
            
            // 1. Lead Code (Serial = 0)
            serial = 1'b0;
            @(negedge clk);

            // 2. Custom Code (16 bits)
            for (i = 15; i >= 0; i = i - 1) begin
                serial = custom[i];
                @(negedge clk);
            end

            // 3. Key Code (8 bits)
            for (i = 7; i >= 0; i = i - 1) begin
                serial = key[i];
                @(negedge clk);
            end

            // 4. Inv Key Code (8 bits)
            if (wrong_inv_key) begin
                for (i = 7; i >= 0; i = i - 1) begin
                    serial = key[i]; // Envia o mesmo valor da Key (erro intencional)
                    @(negedge clk);
                end
            end else begin
                for (i = 7; i >= 0; i = i - 1) begin
                    serial = ~key[i];
                    @(negedge clk);
                end
            end

            // 5. End Code (Serial = 1)
            serial = 1'b1;
            @(negedge clk);

            // Volta para IDLE (Serial = 1)
            serial = 1'b1;
            $display("Frame enviado. Aguardando validacao...");
        end
    endtask

    // Execucao dos testes
    initial begin
        // Inicializacao dos sinais
        clk = 0;
        reset = 1;
        serial = 1; // Idle é nível alto

        repeat (2) @(negedge clk);
        reset = 0;

        @(negedge clk);

        // TESTE 1: Enviar Tecla '1' (Key Code: 0x01)
        // Custom Code generico: 0xABCD
        send_frame(16'hABCD, 8'h01, 0);
        repeat (2) @(negedge clk); // Aguarda dois ciclos para validar o estado READY_PULSE
        
        if (ready == 1'b1 && tecla == 8'h01) 
            $display("SUCESSO: Recebeu Tecla 1 (0x01) corretamente!");
        else 
            $display("ERRO: Valor esperado 0x01, recebido 0x%h", tecla);
        
        wait(ready == 0); // Espera o pulso acabar
    
        // TESTE 2: Enviar Tecla 'PLAY/PAUSE' (Key Code: 0x16)
        send_frame(16'h1234, 8'h16, 0);
        repeat (2) @(negedge clk);
        
        if (ready == 1'b1 && tecla == 8'h16) 
            $display("SUCESSO: Recebeu Tecla Play (0x16) corretamente!");
        else 
            $display("ERRO: Valor esperado 0x16, recebido 0x%h", tecla);

        wait(ready == 0);

        // TESTE 3: Enviar Tecla '1' com InvKey errado (Key Code: 0x01, InvKey errado)
        send_frame(16'hABCD, 8'h01, 1);
        repeat (2) @(negedge clk);
        
         if (ready == 1'b0 && tecla == 8'h00) 
            $display("SUCESSO: InvKey incorreto rejeitado corretamente!");
        else 
            $display("ERRO: InvKey incorreto nao foi rejeitado, Ready: %b, Tecla: 0x%h", ready, tecla);

        wait(ready == 0);

        #50;
        $display("Fim dos testes.");
        $stop;
    end

    // Monitoramento de sinais no terminal
    initial begin
        $monitor("Tempo: %0t | Estado: %0d | Tecla Saida: 0x%h | Ready: %b", $time, duv.state, tecla, ready);
    end

endmodule