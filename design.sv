// Code your design here
module alu (
    input  logic [3:0] a, b,
    input  logic [1:0] op,
    output logic [3:0] result
);
    always_comb begin
        case(op)
            2'b00: result = a + b;
            2'b01: result = a - b;
            2'b10: result = a & b;
            default: result = 4'b0000;
        endcase
    end
endmodule
