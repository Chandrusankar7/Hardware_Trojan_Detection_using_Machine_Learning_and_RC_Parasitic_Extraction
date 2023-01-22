module s27(CK,G0,G1,G17,G2,G3);
input CK,G0,G1,G2,G3;
output G17;

  wire G5,G10,G6,G11,G7,G13,G14,G8,G15,G12,G16,op,G9;

  dff DFF_0(CK,G5,G10);
  dff DFF_1(CK,G6,G11);
  dff DFF_2(CK,G7,G13);
  not NOT_0(G14,G0);
  not NOT_1(op,G11);
  and AND2_0(G8,G14,G6);
  or OR2_0(G15,G12,G8);
  or OR2_1(G16,G3,G8);
  nand NAND2_0(G9,G16,G15);
  nor NOR2_0(G10,G14,G11);
  nor NOR2_1(G11,G5,G9);
  nor NOR2_2(G12,G1,G7);
  nor NOR2_3(G13,G2,G12);

wire AO, QA, QB, QC, QD, and1, reset;
reg CO;
and AND1(AO, G5, G7);
xor EXOR1 (G17, op, CO);
always @ (G5 or G7 or op)
  $display ("QD = %b, QC = %b, QB = %b, QA = %b, AND Output = %b, Counter output = %b, Exor output = %b", QD, QC, QB, QA, AO, CO, G17);
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


module dff (CK,Q,D);
input CK,D;
output Q;
reg Q;
always @ (posedge CK)
  Q <= D;
endmodule