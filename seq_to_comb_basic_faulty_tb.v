`timescale 1ns/1ns


module seq_to_comb_basic_faulty_tb ();
   reg A, qB, qC,  H_0;
   wire K;
   
   seq_to_comb_basic_faulty dut(.A(A), .qB(qB), .qC(qC), .K(K),  .H_0(H_0)  );

  integer i=0;
  reg [2:0] test;
  reg [7:0] K_faulty;
  reg K_ff;
  
  initial begin
 
	for(i=0; i<8; i=i+1) begin
	  test = i;
	  {A, qB, qC} = test; 
	  H_0 = 1;  //fault-free
	  #1; K_ff = K;
	  
	 
	  H_0 = 0; //fault at H (SA0)
	  #1; K_faulty[i] = K; 
	  
	  if(K_faulty[i] != K_ff)
	    $display("test pattern = ->> %3b <<- can detect SA0 at node 'H'  faulty o/p = %b ", test, K_faulty[i]);	
	  else 
        $display("test pattern = %3b cannot   faulty o/p = %b", test,  K_faulty[i]);
	end
	$finish;
  end

endmodule