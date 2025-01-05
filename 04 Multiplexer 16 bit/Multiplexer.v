module multiplexer_16bit (I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, s, out);

    input [15:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
    input [3:0] s;
    output [15:0] out;
    
    wire [15:0] out1, out2, out3, out4; 
    multiplexer_4bit Inst1 (I0, I1, I2, I3,     s[1:0], out1);
    multiplexer_4bit Inst2 (I4, I5, I6, I7,     s[1:0], out2);
    multiplexer_4bit Inst3 (I8, I9, I10, I11,   s[1:0], out3);
    multiplexer_4bit Inst4 (I12, I13, I14, I15, s[1:0], out4);

    multiplexer_4bit Inst5 (out1, out2, out3, out4, s[3:2], out);

endmodule


module multiplexer_4bit (a, b, c, d, s, out);

    input [15:0] a,b,c,d;
    input [1:0] s;
    output reg [15:0] out;
    always @(*) 
        begin
            case (s)
                2'b00:  out = a;
                2'b01:  out = b;
                2'b10:  out = c;
                2'b11:  out = d;
                default: out = 16'bxxxxxxxxxxxxxxxx;
            endcase

        end

endmodule