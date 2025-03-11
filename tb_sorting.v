module tb_sorting;
    reg clk;
    reg start;
    wire done;
    wire [7:0] ram1_data_out;
    wire [7:0] ram2_data_out;
	 
	 
	 integer i;

    ascending uut (
        .clk(clk),
        .start(start),
        .done(done),
        .ram1_data_out(ram1_data_out), 
//        .ram2_data_out(ram2_data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;          
        start = 0;        
        #10 start = 1;    

        wait(done);       

        $display("Sorting complete!");

        $display("RAM 1 (Ascending Order):");
        for (i = 0; i < 8; i = i + 1) begin
            $display("Address %0d: %h", i, ram1_data_out);
        end

/*		  $display("RAM 2 (Descending Order):");
        for (i = 0; i < 8; i = i + 1) begin
            $display("Address %0d: %h", i, ram2_data_out);
        end
*/
		  end
endmodule
