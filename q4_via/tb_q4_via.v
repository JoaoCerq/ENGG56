`timescale 1ns/1ps

module tb_q4_via;

  reg  A, B, C, D;
  wire N_S, L_O;

  q4_via uut (.A(A), .B(B), .C(C), .D(D),.N_S(N_S), .L_O(L_O));

  integer i;

  initial begin
    $display("====================================");
    $display("   TABELA OBTIDA POR SIMULACAO");
    $display("   (Projeto 4 - Controlador Semaforo)");
    $display("====================================");
    $display("  ABCD  |  N_S  |  L_O");
    $display("--------+-------+------");

    for (i = 0; i < 16; i = i + 1) begin //isso daqui vai simular todas as possibilidades
      A = i[3];
      B = i[2];
      C = i[1];
      D = i[0];

      #1; 

      $display("  %0b%0b%0b%0b  |   %0b   |   %0b",
               A, B, C, D, N_S, L_O);
    end

    $display("====================================");

    $stop;
  end

endmodule
