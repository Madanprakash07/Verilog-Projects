module alu_testbench;

    reg [31:0] a,b;
    wire [32:0] out;
    reg en;
    reg [2:0] opcode;

    alu_32bit DUT(en, opcode, a, b, out);

        initial
            begin
                $dumpfile("Testbench.vcd");
                $dumpvars(0, alu_testbench);            
            end

        initial
            begin
                $display("Time\t en\t opcode\t\t      a\t\t     b\t\t out");
                $monitor("%0t\t %b\t %b\t\t %h\t %h\t %h", $time, en, opcode, a, b, out);

                en = 1; opcode = 3'h0; a = 32'habcd; b = 32'hdef2; #10;
                en = 1; opcode = 3'h1; a = 32'ha; b = 32'hd; #10;                 
                en = 1; opcode = 3'h2; a = 32'hdefca1; b = 32'h23be00a; #10;     
                en = 1; opcode = 3'h3; a = 32'hdeca032; b = 32'hab77ca; #10;                 
                en = 1; opcode = 3'h4; a = 32'haaa702b; b = 32'hbb00afe; #10;                 
                en = 1; opcode = 3'h5; a = 32'haaaaaaa; b = 32'haedfbcc; #10;                 
                en = 1; opcode = 3'h6; a = 32'haedfbac; b = 32'haaaaaaa; #10;                 
                en = 1; opcode = 3'h7; a = 32'haaaa; b = 32'haaaa; #10; 
                
                en = 0; opcode = 3'h6; a = 32'haedfbcac; b = 32'haedfbcac; #10;                 
                en = 0; opcode = 3'h2; a = 32'haedfbcac; b = 32'haedfbcac; #10;                 
                            
                $finish;
            
            end
endmodule
