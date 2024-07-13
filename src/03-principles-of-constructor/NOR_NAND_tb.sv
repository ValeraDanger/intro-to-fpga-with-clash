module NOR_NAND_tb;

    logic a, b, nor_out, nand_out, nor_and_out, nor_or_out, nor_impl_out, nand_and_out, nand_or_out, nand_impl_out;

    const logic [0:3] AParams = 4'b0011;
    const logic [0:3] BParams = 4'b0101;

    const logic [0:3] CNORExpected = 4'b1000;
    const logic [0:3] CNANDExpected = 4'b1110;

    const logic [0:3] CANDExpected = 4'b0001; 
    const logic [0:3] CORExpected = 4'b0111;  
    const logic [0:3] CIMPLExpected = 4'b1101;  

    NOR nor1 (
        .a(a),
        .b(b),
        .out(nor_out)
    );

    NAND nand1 (
        .a(a),
        .b(b),
        .out(nand_out)
    );

    NOR_AND nor_and(
        .a(a),
        .b(b),
        .out(nor_and_out)
    );    

    NOR_OR nor_or(
        .a(a),
        .b(b),
        .out(nor_or_out)
    ); 

    NOR_IMPL nor_impl(
        .a(a),
        .b(b),
        .out(nor_impl_out)
    ); 

    NAND_AND nand_and (
        .a(a),
        .b(b),
        .out(nand_and_out)
    );

    NAND_OR nand_or (
        .a(a),
        .b(b),
        .out(nand_or_out)
    );

    NAND_IMPL nand_impl (
        .a(a),
        .b(b),
        .out(nand_impl_out)
    );

    initial
    begin
        for (int i = 0; i < 4; i++)
        begin
            a = AParams[i];
            b = BParams[i];
            #10;


            assert(CNORExpected[i] == nor_out)
                $display("%b nor %b = %b\n",
                    a, b, nor_out);
            else 
            begin
                $display({"Ошибка: %b nor %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nor_out, CNORExpected[i]);

                $fatal;
            end


            assert(CNANDExpected[i] == nand_out)
                $display("%b nand %b = %b\n",
                    a, b, nand_out);
            else 
            begin
                $display({"Ошибка: %b nand %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nand_out, CNANDExpected[i]);

                $fatal;
            end


            assert(CANDExpected[i] == nor_and_out)
                $display("%b nor and %b = %b\n",
                    a, b, nor_and_out);
            else 
            begin
                $display({"Ошибка: %b nor and %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nor_and_out, CANDExpected[i]);

                $fatal;
            end


            assert(CANDExpected[i] == nand_and_out)
                $display("%b nand and %b = %b\n",
                    a, b, nand_and_out);
            else 
            begin
                $display({"Ошибка: %b nand and %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nand_and_out, CANDExpected[i]);

                $fatal;
            end


            assert(CORExpected[i] == nor_or_out)
                $display("%b nor or %b = %b\n",
                    a, b, nor_or_out);
            else 
            begin
                $display({"Ошибка: %b nor or %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nor_or_out, CORExpected[i]);

                $fatal;
            end


            assert(CORExpected[i] == nand_or_out)
                $display("%b nand or %b = %b\n",
                    a, b, nand_or_out);
            else 
            begin
                $display({"Ошибка: %b nand or %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nand_or_out, CORExpected[i]);

                $fatal;
            end


            assert(CIMPLExpected[i] == nor_impl_out)
                $display("%b nor impl %b = %b\n",
                    a, b, nor_impl_out);
            else 
            begin
                $display({"Ошибка: %b nor impl %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nor_impl_out, CIMPLExpected[i]);

                $fatal;
            end


            assert(CIMPLExpected[i] == nand_impl_out)
                $display("%b nand impl %b = %b\n",
                    a, b, nand_impl_out);
            else 
            begin
                $display({"Ошибка: %b nand impl %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, nand_impl_out, CIMPLExpected[i]);

                $fatal;
            end
        end
    end
endmodule

// module displ;

//   logic a, b, nor_and_out, nor_or_out; 

//   NOR_AND nor_and(
//     .a(a),
//     .b(b),
//     .out(nor_and_out)
//   );

//   NAND_IMPL nand_and (
//     .a(a),
//     .b(b),
//     .out(nor_or_out)
//   );

//   initial 
//     begin
//         a = 0;
//         b = 0;
//         #10; 
//         $display("%b -> %b = %b, %b",
//                 a, b, nor_and_out, nor_or_out);


//         a = 0;
//         b = 1;
//         #10;
//         $display("%b -> %b = %b, %b",
//                     a, b, nor_and_out, nor_or_out);


//         a = 1;
//         b = 0;
//         #10;
//         $display("%b -> %b = %b, %b",
//                     a, b, nor_and_out, nor_or_out);

        
//         a = 1;
//         b = 1;
//         #10;
//         $display("%b -> %b = %b, %b",
//                     a, b, nor_and_out, nor_or_out);
//     end
// endmodule