module encoder_testbench;

    reg [7:0] a;
    wire [2:0] q;
    reg en;

    encoder DUT(a,en,q);

        initial
            begin
                $dumpfile("Testbench.vcd");
                $dumpvars(0, encoder_testbench);            
            end

        initial
            begin
                $display("Time\t en\t a\t q");
                $monitor("%0t\t%b\t%b\t%b", $time, en, a, q);

                en = 1; a = 8'b00000000; #10;                   
                en = 1; a = 8'b00000001; #10;
                en = 1; a = 8'b00000010; #10;
                en = 1; a = 8'b00000100; #10;
                en = 1; a = 8'b00001000; #10;
                en = 1; a = 8'b00010000; #10;
                en = 1; a = 8'b00100000; #10; 
                en = 1; a = 8'b01000000; #10;
                en = 0; a = 8'b10000000; #10;
                en = 1; a = 8'b01110000; #10;
                en = 0; a = 8'b01000011; #10;
               
                 
                $finish;
            
            end
endmodule
