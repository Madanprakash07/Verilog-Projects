`timescale 1ns / 1ps

module four_bit_comparator_tb();

    reg [3:0] A, B;
    wire A_equal_B, A_less_B, A_greater_B;
    integer i;

    four_bit_comparator dut(A, B, A_equal_B, A_less_B, A_greater_B);

    initial begin  
        $display("Time\tA\tB\tEqual\tLess\tGreater");
        $monitor("%0dns\t%0d\t%0d\t%b\t%b\t%b", $time, A, B, A_equal_B, A_less_B, A_greater_B);


        for (i = 0; i < 4; i = i + 1) begin
            A = i;
            B = i + 1;
            #20;
        end


        for (i = 0; i < 4; i = i + 1) begin
            A = i;
            B = i;
            #20;
        end


        for (i = 0; i < 4; i = i + 1) begin
            A = i + 1;
            B = i;
            #20;
        end

        $finish;
    end

endmodule
