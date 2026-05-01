`timescale 1ns/1ps

module Controller (
    input      [6:0] OP,
    input      [6:0] funct77,
    input      [2:0] funct3,
    input            funct7,
    output reg       MemWriteD,
    output reg       ALUSrcD,
    output reg       RegWriteD,
    output reg       BranchD,
    output reg       JumpD,
    output reg [1:0] ResultSrcD,
    output reg [4:0] ALUControlD,
    output reg [2:0] ImmSrcD
);

    reg [1:0] ALUOp;

    always @(*) begin
        case (OP)
            7'b0000011: begin // lw
                BranchD=0; ResultSrcD=2'b01; MemWriteD=0;
                ALUSrcD=1; RegWriteD=1; ALUOp=2'b00; ImmSrcD=3'b000; JumpD=0;
            end
            7'b0100011: begin // sw
                BranchD=0; MemWriteD=1; ALUSrcD=1;
                RegWriteD=0; ALUOp=2'b00; ImmSrcD=3'b001; JumpD=0;
            end
            7'b0110011: begin // R
                BranchD=0; ResultSrcD=2'b00; MemWriteD=0;
                ALUSrcD=0; RegWriteD=1; ALUOp=2'b10; JumpD=0;
            end
            7'b1100011: begin // branch
                BranchD=1; MemWriteD=0; ALUSrcD=0;
                RegWriteD=0; ALUOp=2'b01; ImmSrcD=3'b010; JumpD=0;
            end
            7'b0010011: begin // I
                BranchD=0; ResultSrcD=2'b00; MemWriteD=0;
                ALUSrcD=1; RegWriteD=1; ALUOp=2'b10; ImmSrcD=3'b000; JumpD=0;
            end
            7'b1101111: begin // J
                BranchD=0; ResultSrcD=2'b10; MemWriteD=0;
                RegWriteD=1; ImmSrcD=3'b011; JumpD=1;
            end
            default: begin
                BranchD=0; MemWriteD=0; ALUSrcD=0;
                RegWriteD=0; ALUOp=2'b00; ImmSrcD=3'b000; JumpD=0;
            end
        endcase
    end

    always @(*) begin
        case ({OP, funct3, funct77})
            17'b01100110000000000: ALUControlD = 5'b00000;
            17'b01100110000100000: ALUControlD = 5'b00001;
            default: ALUControlD = 5'b00000;
        endcase
    end

endmodule
