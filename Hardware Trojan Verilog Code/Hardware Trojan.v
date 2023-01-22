wire AO, QA, QB, QC, QD, and1, reset; //Hardware Trojan code to be inserted inside the main module
reg CO;
and AND1(AO, I1, I2);
xor EXOR1 (I3, op, O1);
always @ (I1 or I2 or I3)
  $display ("QD = %b, QC = %b, QB = %b, QA = %b, AND Output = %b, Counter output = %b, Exor output = %b", QD, QC, QB, QA, AO, CO, I3);
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

module DFF (clk, rst, D, Q); //D flip Flop
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
