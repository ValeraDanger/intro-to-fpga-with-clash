module NOR (
    input  logic a,
    input  logic b,
    output logic out
);

    assign out = ~(a | b);
    
endmodule


module NAND (
    input  logic a,
    input  logic b,
    output logic out
);

    assign out = ~(a & b);
    
endmodule


module NOR_AND (
    input  logic a,
    input  logic b,
    output logic out
);
    logic ex_a;
    logic ex_b;
    logic nor1_out;

    assign ex_a = ~a;
    assign ex_b = ~b;

    NOR nor1 (
        .a(ex_a),
        .b(ex_b),
        .out(nor1_out)
    );

    assign out = nor1_out;

endmodule


module NOR_OR (
    input  logic a,
    input  logic b,
    output logic out
);
    logic nor1_out;

    NOR nor1 (
        .a(a),
        .b(b),
        .out(nor1_out)
    );

    assign out = ~nor1_out;

endmodule


module NOR_IMPL (
    input  logic a,
    input  logic b,
    output logic out
);
    logic ex_a;
    logic nor1_out;

    assign ex_a = ~a;

    NOR nor1 (
        .a(ex_a),
        .b(b),
        .out(nor1_out)
    );

    assign out = ~nor1_out;

endmodule


module NAND_AND (
    input  logic a,
    input  logic b,
    output logic out
);
    logic nand1_out;

    NAND nand1 (
        .a(a),
        .b(b),
        .out(nand1_out)
    );

    assign out = ~nand1_out;

endmodule


module NAND_OR (
    input  logic a,
    input  logic b,
    output logic out
);
    logic nand1_out;
    logic ex_a;
    logic ex_b;

    assign ex_a = ~a;
    assign ex_b = ~b;

    NAND nand1 (
        .a(ex_a),
        .b(ex_b),
        .out(nand1_out)
    );

    assign out = nand1_out;

endmodule


module NAND_IMPL (
    input  logic a,
    input  logic b,
    output logic out
);
    logic nand1_out;
    logic ex_b;

    assign ex_b = ~b;

    NAND nand1 (
        .a(a),
        .b(ex_b),
        .out(nand1_out)
    );

    assign out = nand1_out;

endmodule
