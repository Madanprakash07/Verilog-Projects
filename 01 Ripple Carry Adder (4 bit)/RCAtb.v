module rca_test_bench;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire carry;

    ripple_carry_adder DUT(a,b,cin,carry,sum);

        initial
            begin
                $dumpfile("RCAtb.vcd");
                $dumpvars(0, rca_test_bench);            
            end

        initial
            begin
                $display("Time\t a\t b\t cin\t sum\t carry");
                $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, a, b, cin, sum, carry);
        
                a = 4'b0000; b = 4'b0000; cin = 1'b0; #10; // No carry
                a = 4'b0001; b = 4'b0001; cin = 1'b0; #10; // Simple addition
                a = 4'b1111; b = 4'b1111; cin = 1'b0; #10; // Overflow scenario
                a = 4'b1010; b = 4'b0101; cin = 1'b1; #10; // Carry in
                a = 4'b1100; b = 4'b1010; cin = 1'b0; #10; // Random case
                a = 4'b0111; b = 4'b0001; cin = 1'b1; #10; // Testing edge case
        
                $finish;
            
            end
endmodule
