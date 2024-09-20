module seq_to_comb_basic (A, qB, qC, clk, K, B, C);
   input A, clk;
   output K;
   
   wire D, G, I,
        H,   J, S;
   output B; //PPO (B)
	  
   output C; //PPO (C)
   input  qB, qC; //PPI (B, C)
   
   or   g1(D, qB, qC);
   
   assign G = D;
   assign I = D;
   
   and  g2(H, A, G);
   not  g3(J, I);
   
   assign C = J;
   assign S = J;
   assign B = H;
   
   nor  g4(K, H, S);
  
   //always@(posedge clk) begin
   //  qB <= B;
   //  qC <= C;
   //end       // Flipflops are removed!

endmodule