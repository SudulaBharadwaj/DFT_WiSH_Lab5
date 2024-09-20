`timescale 1ns/1ns


module basic_ScanCell_tb ();
   reg A, clk, TM, SI;
   wire K, SO, DO;
   
   basic_ff dut( .K(K), .SO(SO), .A(A), .clk(clk), .TM(TM), .SI(SI));

  initial clk = 0;

  always #2 clk = ~clk;
  
  initial begin
    A = 1;  //test pattern : {A, qB, qC} = {1 0 1}
	
	//cycle-1
	SI = 1; //qC=1
	TM = 1;
	#3;
	$display();
	
	//cycle-2
	SI = 0; //qB=0
	TM = 1;
	#5;
	$display();
	
	
	SI = 1; TM = 1;
	#3;
	$display();
	
  end

endmodule