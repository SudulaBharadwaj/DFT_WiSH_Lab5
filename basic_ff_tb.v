`timescale 1ns/1ns


module basic_ff_tb ();
   reg A, clk;
   wire K;
   
   basic_ff dut(.A(A), .clk(clk), .K(K));


  always #1 clk = ~clk;
  
  initial begin
    clk = 0;
	
	#1;
	A=1; 
	$display (" A=%b,  K=%b, D=%b, J=%b, qB=%b, qC=%b", A, K, dut.D, dut.J, dut.qB, dut.qC);
	#5;
	A=0;
	$display (" A=%b,  K=%b, D=%b, J=%b, qB=%b, qC=%b", A, K, dut.D, dut.J, dut.qB, dut.qC);
    #2 $finish;
  end

endmodule