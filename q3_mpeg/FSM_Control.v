module FSM_Control (
    input wire Clock,
    input wire Reset,
    input wire Start,
    output reg [2:0] var_u,
    output reg [2:0] var_v,
    output reg [2:0] var_x,
    output reg [2:0] var_y,
    output reg [5:0] Address,
    output reg Read_Enable,
    output reg Active_MAC,
    output reg Ready
);

    localparam S_IDLE       = 3'b000,
               S_SEND_ADDR  = 3'b001, // Envia o endereco
               S_ACT_RE     = 3'b010, // Ativa o Read Enable
               S_WAIT_DATA  = 3'b011, // Espera o dado estabilizar
               S_ACCUM      = 3'b100, // Pulsa o MAC para acumular e incrementa os contadores (muda o endereco)
               S_DONE       = 3'b101;

    reg [2:0] current_state, next_state;

    wire v_done = (var_v == 3'd7);
    wire u_done = (var_u == 3'd7) && v_done;
    wire y_done = (var_y == 3'd7) && u_done;
    wire x_done = (var_x == 3'd7) && y_done;

    // Bloco Sequencial (Estado e Contadores)
    always @(posedge Clock) begin
        if (Reset) begin
            current_state <= S_IDLE;
            var_u <= 3'd0;
            var_v <= 3'd0;
            var_x <= 3'd0;
            var_y <= 3'd0;
        end else begin
            current_state <= next_state;

            if (current_state == S_ACCUM) begin // Incrementa os contadores apos acumular (ja e seguro mudar o endereco)
                var_v <= v_done ? 3'd0 : var_v + 1'b1;
                var_u <= v_done ? (u_done ? 3'd0 : var_u + 1'b1) : var_u;
                var_y <= u_done ? (y_done ? 3'd0 : var_y + 1'b1) : var_y;
                var_x <= y_done ? (x_done ? 3'd0 : var_x + 1'b1) : var_x;
            end
        end
    end

    // Bloco Combinacional de Próximo Estado
    always @(*) begin
        next_state = current_state;

        case (current_state)
            S_IDLE: 
                if (Start) next_state = S_SEND_ADDR;
            S_SEND_ADDR: 
                next_state = S_ACT_RE;
            S_ACT_RE:    
                next_state = S_WAIT_DATA;
            S_WAIT_DATA: 
                next_state = S_ACCUM;
            S_ACCUM: begin
                // Verifica se processou todos os coeficientes (var_u, var_v) e todos os pixels (var_x, var_y)
                if (var_u == 7 && var_v == 7 && var_x == 7 && var_y == 7)
                    next_state = S_DONE;
                else
                    next_state = S_SEND_ADDR;
            end
            S_DONE: 
                next_state = S_IDLE;
            default: 
                next_state = S_IDLE;
        endcase
    end

    // Bloco Combinacional de Saída
    always @(*) begin
        Read_Enable = 1'b0;
        Active_MAC  = 1'b0;
        Ready       = 1'b0;
        Address     = {var_u, var_v}; // Endereço é a concatenacao dos índices 8x8

        case (current_state)
            S_ACT_RE: begin
                Read_Enable = 1'b1;
            end
            S_ACCUM: begin
                Active_MAC = 1'b1;
            end
            S_DONE: begin
                Ready = 1'b1;
            end
            default: ; // Mantem defaults
        endcase
    end

endmodule