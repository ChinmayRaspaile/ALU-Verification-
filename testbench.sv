// Code your testbench here
// or browse Examples
module tb;
    logic [3:0] a, b;
    logic [1:0] op;
    logic [3:0] result;

    alu dut (.a(a), .b(b), .op(op), .result(result));

    // Task for add
    task automatic add_op;
        a = 4; b = 3; op = 2'b00;
        #5;
        $display("ADD Result: %0d", result);
    endtask

    // Task for sub
    task automatic sub_op;
        a = 7; b = 2; op = 2'b01;
        #5;
        $display("SUB Result: %0d", result);
    endtask

    // Task for and
    task automatic and_op;
        a = 4'b1010; b = 4'b1100; op = 2'b10;
        #5;
        $display("AND Result: %0b", result);
    endtask

    initial begin
        $display("\n--- fork...join ---");
        fork
            add_op();
            sub_op();
            and_op();
        join
        $display("All operations done with fork...join\n");

        #10;

        $display("--- fork...join_any ---");
        fork
            begin #5; add_op(); end
            begin #10; sub_op(); end
            begin #15; and_op(); end
        join_any
        $display("First completed operation finished with fork...join_any\n");

        #20;

        $display("--- fork...join_none ---");
        fork
            begin #5; add_op(); end
            begin #10; sub_op(); end
            begin #15; and_op(); end
        join_none
        $display("Parent thread continued without waiting (fork...join_none)\n");
    end
endmodule
