`timescale 1ns/1ps

module Instruction_Memory (
    input      [31:0] PCF,
    output reg [31:0] instruction
);

    // 64 instructions
    reg [31:0] instructions_Value [63:0];

    initial begin
        $readmemh("instruction.mem", instructions_Value);
    end

    always @(*) begin
        instruction = instructions_Value[PCF[7:2]];
    end

endmodule
