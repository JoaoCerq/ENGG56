module RemoteController (
    input wire Clock,
    input wire Reset,
    input wire Serial,
    output reg [7:0] Tecla,
    output reg Ready
);

    // Definição dos estados
    localparam IDLE           = 3'd0,
               WAIT_CUSTOM    = 3'd1,
               WAIT_KEY       = 3'd2,
               WAIT_INV_KEY   = 3'd3,
               WAIT_END       = 3'd4,
               VALIDATE       = 3'd5,
               READY_PULSE    = 3'd6;

    reg [2:0] state, next_state;

    // Registradores internos e contadores
    reg [3:0] bit_count;   // Contador de bits
    reg [1:0] pulse_count; // Contador para o pulso de saída (3 ciclos)
    reg [15:0] custom_reg;
    reg [7:0]  key_reg;
    reg [7:0]  inv_key_reg;
    reg [7:0]  tecla_storage; // Registrador interno para manter o valor da tecla

    // Bloco sequencial (mudanca de estado, contadores e armazenamento serial de dados)
    always @(posedge Clock) begin
        if (Reset) begin
            state         <= IDLE;
            bit_count     <= 4'd0;
            pulse_count   <= 2'd0;
            custom_reg    <= 16'd0;
            key_reg       <= 8'd0;
            inv_key_reg   <= 8'd0;
            tecla_storage <= 8'd0;
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    bit_count   <= 4'd0;
                    pulse_count <= 2'd0;
                end

                WAIT_CUSTOM: begin
                    custom_reg <= {custom_reg[14:0], Serial};
                    bit_count  <= (bit_count == 15) ? 4'd0 : bit_count + 1'b1;
                end

                WAIT_KEY: begin
                    key_reg   <= {key_reg[6:0], Serial};
                    bit_count <= (bit_count == 7) ? 4'd0 : bit_count + 1'b1;
                end

                WAIT_INV_KEY: begin
                    inv_key_reg <= {inv_key_reg[6:0], Serial};
                    bit_count   <= (bit_count == 7) ? 4'd0 : bit_count + 1'b1;
                end

                VALIDATE: begin
                    if (key_reg == ~inv_key_reg)
                        tecla_storage <= key_reg;
                end

                READY_PULSE: begin
                    pulse_count <= pulse_count + 1'b1;
                end
            endcase
        end
    end

    // Bloco combinacional (transicao de estados)
    always @(*) begin
        next_state = state;

        case (state)
            IDLE: begin
                if (Serial == 1'b0) next_state = WAIT_CUSTOM;
            end

            WAIT_CUSTOM: begin
                if (bit_count == 15) next_state = WAIT_KEY;
            end

            WAIT_KEY: begin
                if (bit_count == 7) next_state = WAIT_INV_KEY;
            end

            WAIT_INV_KEY: begin
                if (bit_count == 7) next_state = WAIT_END;
            end

            WAIT_END: begin
                if (Serial == 1'b1) next_state = VALIDATE;
            end

            VALIDATE: begin
                if (key_reg == ~inv_key_reg) 
                    next_state = READY_PULSE;
                else 
                    next_state = IDLE;
            end

            READY_PULSE: begin
                if (pulse_count == 2) next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    // Bloco combinacional (saidas)
    always @(*) begin
        // A saida Ready é alta apenas durante o estado de pulso
        Ready = (state == READY_PULSE);
        
        // A saida Tecla reflete o ultimo valor valido armazenado, apenas durante o estado de pulso
        Tecla = (state == READY_PULSE) ? tecla_storage : 8'd0;
    end

endmodule