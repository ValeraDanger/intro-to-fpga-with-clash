module impl_conv_tb;
    initial begin
            $dumpfile("impl_conv_tb.vcd");
            $dumpvars(0, impl_conv_tb);
        end

        localparam int CountOfBits = 4;
        localparam int ClkPeriod = 10;

        logic clk, rst;

        initial begin
            rst <= '1;
            #(ClkPeriod);
            rst <= '0;
        end

        initial begin
            clk <= '0;
            forever begin
                #(ClkPeriod / 2) clk <= ~clk;
            end
        end

        logic [CountOfBits-1:0] num, conv, acc;

        impl_conv #(
            .COUNT_OF_BITS(CountOfBits)
        ) DUT (
            .clk(clk),
            .rst(rst),
            .num(num),
            .out(conv),
            .acc(acc)
        );

        initial begin
            $monitor("clk=%d, rst=%d, num=%d, conv=%d, acc = %d", clk, rst, num, conv, acc);

            wait (!rst) num = 4'b0001;
            @(posedge clk) num = 4'b0011;
            @(posedge clk) num = 4'b0100;
            @(posedge clk) begin
                num = 0;
                $finish();
            end
    end
endmodule