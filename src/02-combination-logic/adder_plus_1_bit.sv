module adder_plus_1_bit (
    input logic a,  // <1>
    input logic b,  // <2>
    input logic c_in,  // <3>
    output logic c_out,  // <4>
    output logic sum  // <5>
);  // <6>
  assign {c_out, sum} = a + b + c_in;  // <7>
endmodule
