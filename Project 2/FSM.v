module FSM (Clock, Reset, Address, ReadEnable, WriteEnable, Load, Clear, Transfer, Ready);
	input Clock, Reset;
    
	output reg [5:0] Address;
	output reg ReadEnable, WriteEnable, Load, Clear, Transfer, Ready;

	localparam INICIO = 4'd0;
	localparam SOLICITA_MEM = 4'd1;
	localparam IDLE_1 = 4'd2;
	localparam LOAD = 4'd3;
	localparam ADD = 4'd4;
	localparam ADDING = 4'd5;
	localparam SAVING = 4'd6;
	localparam IDLE_2 = 4'd7;
	localparam READY  = 4'd8;

	reg [3:0] current_state, next_state;

	reg [5:0] i;

	always @(posedge Clock or negedge Reset) begin
		if (!Reset) begin
			current_state <= INICIO;
            i <= 6'd0;
			end
		else begin
			current_state <= next_state;
            if (next_state == INICIO) begin
					i <= 6'd0;
            end
            else if (next_state == ADD) begin
					i <= i + 1'b1; 
            end
            else if (next_state == IDLE_2) begin
					i <= i + 1'b1;
            end
		end
	end

	always @(*) begin
		next_state = current_state;
		
		case (current_state)
		
			INICIO: begin
				next_state = SOLICITA_MEM;
			end
			
			SOLICITA_MEM: begin
				next_state = IDLE_1;
			end

			IDLE_1: begin		
				next_state = LOAD;
			end

			LOAD: begin
				next_state = ADD;
			end

			ADD: begin
				if (i[2:0] == 3'b111) 
					next_state = SAVING;
				else 
					next_state = ADDING;
			end

			ADDING: begin
				next_state = SOLICITA_MEM;
			end

			SAVING: begin
				next_state = IDLE_2;
			end

			IDLE_2: begin
				if (i == 6'd32) 
					next_state = READY;
				else 
					next_state = SOLICITA_MEM;
			end

			READY: begin
				next_state = INICIO;
			end
            
			default: next_state = INICIO;
		endcase
    end

	always @(*) begin
		Clear       = 1'b1;
		Address = 1'b0;
		ReadEnable  = 1'b0;
		WriteEnable = 1'b0;
		Load        = 1'b0;
		Transfer    = 1'b0;
		Ready       = 1'b0;
	
		case (current_state)
			INICIO:       Clear = 1'b0;
			SOLICITA_MEM: begin ReadEnable = 1'b1; Address = i; end
			IDLE_1:       begin ReadEnable = 1'b1; Address = i; end 
			LOAD: begin
				ReadEnable = 1'b1;
				Load       = 1'b1;
				Address = i;
			end
			ADD:          Transfer = 1'b1;
			// ADDING: Nenhuma saída ativa
			SAVING:       begin WriteEnable = 1'b1; Address = i; end
			IDLE_2:       begin Clear = 1'b0; Address = i; end
			READY:  Ready = 1'b1;
		endcase
	end

endmodule