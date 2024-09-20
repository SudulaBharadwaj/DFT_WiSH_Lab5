`timescale 1ns/1ns


module seq_to_comb_basic_tb ();
   reg A, clk, qB, qC;
   wire K;
   
   seq_to_comb_basic dut(.A(A), .qB(qB), .qC(qC), .clk(clk), .K(K));


  always #1 clk = ~clk;
  
  initial begin
    clk = 0;
	
	#1;
	A=0;qB=1; qC=0;
	#1;
	$display (" A=%b,  K=%b, D=%b, J=%b, qB=%b, qC=%b  -> ppoB=%b | ppoC=%b", A, K, dut.D, dut.J, dut.qB, dut.qC, dut.B, dut.C);
	#5;
	A=1;qB=0; qC=1;
	#1;
	$display (" A=%b,  K=%b, D=%b, J=%b, qB=%b, qC=%b  -> ppoB=%b | ppoC=%b", A, K, dut.D, dut.J, dut.qB, dut.qC, dut.B, dut.C);
    #2 $finish;
  end

endmodule