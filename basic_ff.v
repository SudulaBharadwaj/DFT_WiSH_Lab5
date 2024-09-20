module basic_ff (A, clk, K);
   input A, clk;
   output K;
   
   wire D, G, I,
        H, B, 
		J, S, C;
   reg  qB, qC;
   
   or   g1(D, qB, qC);
   
   assign G = D;
   assign I = D;
   
   and  g2(H, A, G);
   not  g3(J, I);
   
   assign C = J;
   assign S = J;
   assign B = H;
   
   nor  g4(K, H, S);
  
   always@(posedge clk) begin
     qB <= B;
     qC <= C;
   end

endmodule