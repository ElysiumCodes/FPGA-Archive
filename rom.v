 module rom (
    input wire [2:0] addr,   // 3-bit address (8 locations)
    output reg [7:0] data    // 8-bit data output
);
    always @(*) begin
        case (addr)
            3'b000: data = 8'hA1;
            3'b001: data = 8'h32;
            3'b010: data = 8'hC3;
            3'b011: data = 8'h14;
            3'b100: data = 8'hE5;
            3'b101: data = 8'h56;
            3'b110: data = 8'h07;
            3'b111: data = 8'h18;
            default: data = 8'h00;
        endcase
    end
endmodule
