module basic_ScanCell (K, SO,  A, clk,  TM, SI);
   input A, clk;
   output K;
   
   wire D, G, I,
        H,   J, S;
   
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
   
   wire w;
   
   //scan cell insertion
   ScanCell sc1(qB, w,  B, SI, clk, TM );
   ScanCell sc2(qC, SO, C, w, clk, TM );

endmodule