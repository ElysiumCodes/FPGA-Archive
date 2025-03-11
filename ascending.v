module ascending (
    input wire clk,
    input wire start,
    output reg done
	 reg [7:0] ram1_data_out;
	 reg [7:0] ram2_data_out;
);
    reg [2:0] addr;
    reg [7:0] rom_data;
    reg [7:0] data_array [7:0]; 
    integer i, j;
    reg [7:0] temp;

    wire [7:0] rom_out;
    reg [2:0] ram1_addr;
	 reg [2:0] ram2_addr;
    reg ram_we;
    reg [7:0] ram1_data_in;
	 reg [7:0] ram2_data_in;	 

    rom rom_inst (
        .addr(addr),
        .data(rom_out)
    );

    ram ram_inst1 (
        .clk(clk),
        .we(ram_we),
        .addr(ram1_addr),
        .din(ram1_data_in),
        .dout(ram1_data_out)
    );
/*	 
	 ram ram_inst2 (
        .clk(clk),
        .we(ram_we),
        .addr(ram2_addr),
        .din(ram2_data_in),
        .dout(ram2_data_out)
    );
*/
	 
    always @(posedge clk) begin
        if (start) begin
            addr = 0;
            for (i = 0; i < 8; i = i + 1) begin
                data_array[i] = rom_out;
                addr = addr + 1;
                #5; 
            end

				
				
				
            // Bubble Sort (Ascending Order)
            for (i = 0; i < 7; i = i + 1) begin
                for (j = 0; j < 7 - i; j = j + 1) begin
                    if (data_array[j] > data_array[j + 1]) begin
                        temp = data_array[j];
                        data_array[j] = data_array[j + 1];
                        data_array[j + 1] = temp;
                    end
                end
            end

				
            // Store sorted data in RAM
            ram_we = 1;
            for (i = 0; i < 8; i = i + 1) begin
                ram1_addr = i;
                ram1_data_in = data_array[i];
                #5;
            end

				
				
/*				
				// Bubble Sort (Descending Order)
            for (i = 0; i < 7; i = i + 1) begin
                for (j = 0; j < 7 - i; j = j + 1) begin
                    if (data_array[j] < data_array[j + 1]) begin
                        temp = data_array[j];
                        data_array[j] = data_array[j + 1];
                        data_array[j + 1] = temp;
                    end
                end
            end
				
				
				// Store sorted data in RAM
            for (i = 0; i < 8; i = i + 1) begin
                ram2_addr = i;
                ram2_data_in = data_array[i];
                #5;
            end
				
				
				
*/				
            done = 1;
        end
    end
endmodule
