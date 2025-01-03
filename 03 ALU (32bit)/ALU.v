module alu_32bit (en, opcode, a, b, out);

    input en;
    input wire [2:0] opcode;
    input wire [31:0] a,b;
    output reg [32:0] out;

    always @(*) 
        begin            
            if (en==1) 
                begin
                    
                    case (opcode)
                    4'h0    : out = a + b;
                    4'h1    : out = a - b;
                    4'h2    : out = a & b;
                    4'h3    : out = a | b;
                    4'h4    : out = a ^ b;
                    4'h5    : out = ~a;
                    4'h6    : out = ~b;
                    4'h7    : out = {32'b0,a==b};
                    
                    default : out = 33'h0;
                    endcase
                end
            
            else
                out = 33'h0;
        end

    
endmodule