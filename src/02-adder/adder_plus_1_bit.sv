module adder_plus_1_bit (
    input logic  a, // <1>
    input logic  b, // <2>
    input logic  carry, // <3>
    output logic carry_next, // <4>
    output logic sum // <5>
); // <6>
  assign {carry_next, sum} = a + b + carry; // <7>
endmodule
