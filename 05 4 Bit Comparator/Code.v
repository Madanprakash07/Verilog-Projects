`timescale 1ns / 1ps

module two_bit_comparator(input [1:0] A, B, output A_equal_B, A_less_B, A_greater_B);

    wire wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8;

    xnor u1(wr1, A[1], B[1]);
    xnor u2(wr2, A[0], B[0]);
    and u3(A_equal_B, wr1, wr2);

    assign wr3 = (~A[0]) & (~A[1]) & B[0];
    assign wr4 = (~A[1]) & B[1];
    assign wr5 = (~A[0]) & B[1] & B[0];
    assign A_less_B = wr3 | wr4 | wr5;

    assign wr6 = (~B[0]) & (~B[1]) & A[0];
    assign wr7 = (~B[1]) & A[1];
    assign wr8 = (~B[0]) & A[1] & A[0];
    assign A_greater_B = wr6 | wr7 | wr8;

endmodule
  




module four_bit_comparator(input [3:0] a, b, output equal, less, greater);

    wire [1:0] a_msb = a[3:2];
    wire [1:0] a_lsb = a[1:0];
    wire [1:0] b_msb = b[3:2];
    wire [1:0] b_lsb = b[1:0];

    wire equal_A0, less_A0, greater_A0;
    wire equal_A1, less_A1, greater_A1;

    two_bit_comparator A0(a_msb, b_msb, equal_A0, less_A0, greater_A0);
    two_bit_comparator A1(a_lsb, b_lsb, equal_A1, less_A1, greater_A1);

    assign equal   = equal_A0 & equal_A1;
    assign less    = less_A0 | (equal_A0 & less_A1);
    assign greater = greater_A0 | (equal_A0 & greater_A1);

endmodule
 












