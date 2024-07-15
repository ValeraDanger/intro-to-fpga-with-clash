module multiadder_tb;

    logic k, n;
    logic [11:0] sum;
    logic [7:0] num [3:0];

    initial begin
        num[0] = 8'b0000_1111;
        num[1] = 8'b0011_0011;
        num[2] = 8'b0101_0101;
        num[3] = 8'b0001_0111;
    end

    assign k = 4;
    assign n = 8;

    multiadder #(.k(4), .n(8)) add (
        .num(num),
        .sum(sum)
    );

    initial
    begin
        #10;
        $display("%b",
                sum);
    end
endmodule