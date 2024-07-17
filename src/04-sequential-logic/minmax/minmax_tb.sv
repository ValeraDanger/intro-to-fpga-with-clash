module minmax_tb;
    initial begin
            $dumpfile("minmax_tb.vcd");
            $dumpvars(0, minmax_tb);
        end

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

        int num, min, max;

        minmax DUT (
            .clk(clk),
            .rst(rst),
            .num(num),
            .min(min),
            .max(max)
        );

        initial begin
            $monitor("clk=%d, rst=%d, num=%d, max=%d, min = %d", clk, rst, num, max, min);
            num = 2;
            wait (!rst);
            @(posedge clk) num = 1;
            @(posedge clk);             //Тот самый тик простоя. Без него данные некорректны
            @(posedge clk) num = 3;
            //@(posedge clk);           //Тик простоя в этом месте работает аналогично
            @(posedge clk); 
            @(posedge clk) begin
                num = 0;
                $finish();
            end
    end
endmodule