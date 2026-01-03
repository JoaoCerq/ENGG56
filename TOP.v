module TOP (Clock, Reset, Ready, Address, DataIN, ReadEnable, WriteEnable, DataOut);
	input wire Clock;
   input wire Reset;
   output wire Ready;
   output wire [4:0] Address;
   output wire [15:0] DataIN;
   output wire ReadEnable;
   output wire WriteEnable;
   input wire [15:0] DataOut;

   wire Load;    
   wire Clear;     
   wire Transfer;  

   Acumulador InstACC (.Reset(Reset), .Load(Load), .Clear(Clear), .Transfer(Transfer), .M(DataOut), .Saidas(DataIN));

   FSM InstFSM (.Clock(Clock), .Reset(Reset), .Address(Address), .ReadEnable(ReadEnable), .WriteEnable(WriteEnable), 
	.Load(Load), .Clear(Clear), .Transfer(Transfer), .Ready(Ready));

endmodule
