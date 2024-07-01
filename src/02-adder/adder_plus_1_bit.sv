module adder_plus_1_bit (
    input  a,//<1>
    input  b,//<2>
    input  carry,//<3>
    output carry_next,//<4>
    output sum//<5>
);
  assign {carry_next, sum} = a + b + carry;//<6>
endmodule
