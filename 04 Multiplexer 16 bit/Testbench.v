module multiplexer_testbench;

    reg [15:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
    reg [3:0] s;
    wire [15:0] out;

    multiplexer_16bit DUT(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, s, out);

        initial
            begin
                $dumpfile("Testbench.vcd");
                $dumpvars(0, multiplexer_testbench);            
            end

        initial
            begin

                I0 = 16'hAAAA; 
                I1 = 16'hBBBB; 
                I2 = 16'hCCCC; 
                I3 = 16'hDDDD; 
                I4 = 16'hEEEE; 
                I5 = 16'hFFFF; 
                I6 = 16'h1234; 
                I7 = 16'h5678; 
                I8 = 16'h9ABC; 
                I9 = 16'hDEF0; 
                I10 = 16'h1111;
                I11 = 16'h2222;
                I12 = 16'h3333;
                I13 = 16'h4444;
                I14 = 16'h5555;
                I15 = 16'h6666;

        
                $display("Time\t Selector\t Output\t I0\t I1\t I2\t I3\t I4\t I5\t I6\t I7\t I8\t I9\t I10\t I11\t I12\t I13\t I14\t I15");
                $monitor("%0t\t %b\t\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t %h\t", $time, s, out, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15);                
                         
                
                s = 4'b0000; #10; //00
                s = 4'b0001; #10; //01
                s = 4'b0010; #10; //02
                s = 4'b0011; #10; //03
                s = 4'b0100; #10; //04
                s = 4'b0101; #10; //05
                s = 4'b0110; #10; //06
                s = 4'b0111; #10; //07
                s = 4'b1000; #10; //08
                s = 4'b1001; #10; //09
                s = 4'b1010; #10; //10
                s = 4'b1011; #10; //11
                s = 4'b1100; #10; //12
                s = 4'b1101; #10; //13
                s = 4'b1110; #10; //14
                s = 4'b1111; #10; //15

                $finish;
            
            end
endmodule
