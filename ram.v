module ram (
    input wire clk,            // Clock signal
    input wire we,             // Write Enable (Active High)
    input wire [2:0] addr,     // 3-bit address (8 locations)
    input wire [7:0] din,      // 8-bit input data (write data)
    output reg [7:0] dout      // 8-bit output data (read data)
);
    reg [7:0] mem [7:0];  // 8x8 RAM (8 locations, 8-bit each)

    // Asynchronous read
    always @(*) begin
        dout = mem[addr];
    end

    // Synchronous write
    always @(posedge clk) begin
        if (we) 
            mem[addr] <= din;
    end
endmodule