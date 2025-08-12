`timescale 1ns / 1ps


module binary_to_grey_tb;

    reg  [3:0] binary_in;
    wire [3:0] gray_out;

    binary_to_grey_converter uut (binary_in, gray_out);

    initial begin
        $display("Binary  |  Gray");
        $display("------------------");

        
        binary_in = 0; 
        #5;

        for (integer i = 1; i <= 10; i = i + 1) 
        begin
            binary_in = i;
            #5;
            $display("  %04b   |  %04b", binary_in, gray_out);
        end

        $finish;
    end

endmodule
