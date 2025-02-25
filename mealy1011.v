module seq_detector_1010(
    input clk, rst_n, x, 
    output reg z
);
  // State Encoding
  parameter A = 3'b000; // Initial state
  parameter B = 3'b001; // Detected '1'
  parameter C = 3'b010; // Detected '10'
  parameter D = 3'b011; // Detected '101'
  parameter E = 3'b100; // Detected '1010' (Final state)

  reg [2:0] state, next_state;

  // State Register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
      state <= A;
    else 
      state <= next_state;
  end

  // Next State Logic
  always @(*) begin
    case (state)
      A:  next_state = (x) ? B : A;  
      B:  next_state = (x) ? B : C;  
      C:  next_state = (x) ? D : A;  
      D:  next_state = (x) ? B : E;
      E:  next_state = A;            
      default: next_state = A;
    endcase
  end

  // Output Logic (Moore: Depends only on the state)
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
      z <= 0;
    else 
      z <= (state == E) ? 1 : 0; // Output high only when state is 'E'
  end

endmodule
