module ScanCell (DO, SO,  DI, SI, clk, TM);
  input DI, SI, clk, TM;
  output DO, SO;
  
  reg Q;
  wire D;
  
  assign D = TM == 1 ? SI : DI; //Mux for DataInput and ScanInput
  
  always@(posedge clk) begin
    
	Q <= D;  //Data flipflop
  
  end
  
 assign SO = Q;
 assign DO = Q;
 
endmodule