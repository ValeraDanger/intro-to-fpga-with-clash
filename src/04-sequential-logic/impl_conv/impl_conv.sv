module impl_conv #(
    parameter int COUNT_OF_BITS = 4
) (
    input logic clk,
    input logic rst,
    input logic [COUNT_OF_BITS-1:0] num,
    output logic [COUNT_OF_BITS-1:0] out,
    output logic [COUNT_OF_BITS-1:0] acc
);

    

    always_comb begin
        out = ~acc | num;
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            acc <= 4'b1111;               //Заметим, что 1->a = a, следовательно, нейтральным элементом будет 1
        end else begin
            acc <= out;
        end
    end
endmodule