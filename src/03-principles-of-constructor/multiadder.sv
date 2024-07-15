module multiadder #(
    parameter int k = 4,
    parameter int n = 8
) (
    input logic [n-1:0] num [k-1:0], 
    output logic [n+k-1:0] sum        //возьмем число бит с запасом
);

    localparam int BIT_COUNT = n + k;

    logic [BIT_COUNT-1:0] partial_sum [0:k];
    logic c_out [0:k-1];

    assign partial_sum[0] = 0; // Инициализация первого partial_sum

    genvar m; 
    generate 
        for (m = 0; m < k; m++) begin : adder_inst
            adder_multibits_reuse #(.COUNT_OF_BITS(BIT_COUNT)) add_inst ( 
                .a(partial_sum[m]),
                .b({ {(BIT_COUNT - n){1'b0}}, num[m] }), // Дополняем каждое число до битности n+k
                .c_in(1'b0), // Первый входной перенос - 0
                .c_out(c_out[m]),
                .sum(partial_sum[m+1])
            );
        end
    endgenerate

    assign sum = partial_sum[k]; // Присваиваем sum значение последнего partial_sum

endmodule