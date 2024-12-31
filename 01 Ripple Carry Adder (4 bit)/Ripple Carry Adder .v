module ripple_carry_adder( a,b,cin,carry,sum);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output carry; 
    
    wire cout1, cout2, cout3;
    fulladder I1(a[0], b[0], cin, cout1, sum[0]);
    fulladder I2(a[1], b[1], cout1, cout2, sum[1]);
    fulladder I3(a[2], b[2], cout2, cout3, sum[2]);
    fulladder I4(a[3], b[3], cout3, carry, sum[3]);
    
endmodule

module fulladder(a,b,cin,carry,sum);
    input a, b, cin;
    output sum, carry;
    
    assign sum = a^b^cin;
    assign carry = (a^b && cin) || (a&&b);

endmodule
