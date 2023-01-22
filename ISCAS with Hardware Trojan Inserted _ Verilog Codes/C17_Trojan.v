`timescale 1ns / 1ps
module bench(N1, N2, N3, N6, N7, N22, N23);
  input N1, N2, N3, N6, N7;
  output N22, N23;
  wire N1, N2, N3, N6, N7;
  wire N22, N23;
  wire N10, N11, N16, N19, op;
  nand NAND2_1 (N10, N1, N3);
  nand NAND2_2 (N11, N3, N6);
  nand NAND2_3 (N16, N2, N11);
  nand NAND2_4 (N19, N11, N7);
  nand NAND2_5 (op, N10, N16);
  nand NAND2_6 (N23, N16, N19);
wire AO, QA, QB, QC, QD, and1, reset;
reg CO;
and AND1(AO, N10, N16);
xor EXOR1 (N22, op, CO);
always @ (N10 or N16 or N11)
  $display ("QD = %b, QC = %b, QB = %b, QA = %b, AND Output = %b, Counter output = %b, Exor output = %b", QD, QC, QB, QA, AO, CO, N22);
  and a1 (and1, QA, QB);
  and a2 (reset, and1, QD);
  DFF ff1 (AO, reset, 1'b1, QA);
  DFF ff2 (AO, reset, QA, QB);
  DFF ff3 (AO, reset, QB, QC);
  DFF ff4 (AO, reset, QC, QD);
  always @ (QA or QB or QC or QD)
    begin
      if ((QC) && (QB) && (QA))
        CO=1;
      else
        CO=0;
    end
endmodule

module DFF (clk, rst, D, Q);
  input clk, rst, D;
  output reg Q;
  always @ (posedge clk or posedge rst)
    begin
      if (rst)
        Q<=1'b0;
      else
        Q<=D;
    end
endmodule