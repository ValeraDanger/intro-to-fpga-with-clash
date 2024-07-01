module adder_logic_1_bit (
    input  a,
    input  b,
    input  c_in,//<1>
    output c_out,//<2>
    output sum
);

  assign sum   = a ^ b ^ c_in;

  assign c_out = (a & b) | (c_in & (a ^ b));
endmodule
