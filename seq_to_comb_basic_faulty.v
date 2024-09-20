module seq_to_comb_basic_faulty (A, qB, qC, K, B, C,  H_0);
   input A;
   output K;
   
   wire D, G, I,
        H,   J, S;
   output B; //PPO (B)
	  
   output C; //PPO (C)
   input  qB, qC; //PPI (B, C)
   
   input H_0;
   
   or   g1(D, qB, qC);
   
   assign G = D;
   assign I = D;
   
   and  g2(H, A, G);
   and  f1(HH_0, H, H_0); //fault-injection
   not  g3(J, I);
   
   assign C = J;
   assign S = J;
   assign B = HH_0;
   
   nor  g4(K, HH_0, S);
  
   //always@(posedge clk) begin
   //  qB <= B;
   //  qC <= C;
   //end       // Flipflops are removed!

endmodule