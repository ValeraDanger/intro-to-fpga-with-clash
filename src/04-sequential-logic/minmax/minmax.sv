module minmax (
    input logic clk,
    input logic rst,
    input int num,
    output int min,
    output int max

);

    // always_comb begin
    //     out = ~acc | num;
    // end

    always_ff @(posedge clk) begin
        if (rst) begin
            min <= num;              
            max <= num;
        end 

        else begin
            if (num > max) begin
                max <= num;
            end

            else if(num < min) begin
                min <= num;
            end
   
        end
    end
endmodule